import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int leftInt = 0;

  void _calc() {
    String inputWords = '2+1+3+20';
    //leftInt = 0;
    String right = '';
    int rightInt = 0;
    String nextOperator = '+';

    inputWords = inputWords + '+0';

    // 式の始まりがマイナスから始まる場合
    if (inputWords[0] == '-') {
      inputWords = '0' + inputWords;
    }

    for (int i = 0; i < inputWords.length; i++) {
      String word = inputWords[i];

      if (word == '+' || word == '-') {
        if (nextOperator == '+') {
          rightInt = int.parse(right);
          leftInt = leftInt + rightInt;
        } else {
          rightInt = int.parse(right);
          leftInt = leftInt - rightInt;
        }

        nextOperator = word;
        right = '';
      } else {
        right = right + word;
      }
    }

    print(leftInt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$leftInt',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calc,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
