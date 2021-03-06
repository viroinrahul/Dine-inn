import 'package:dine_inn/MenuBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF2A22C),
      ),
      drawer: MenuBar(user: user,),
      body: Container(
        padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Home Page',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              child: Text((user != null)?user.displayName:'home display name'),
            )
          ],
        ),
      ),
    );
  }
}
