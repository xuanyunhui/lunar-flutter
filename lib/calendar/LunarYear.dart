import 'Lunar.dart';
import 'LunarMonth.dart';
import 'NineStar.dart';
import 'Solar.dart';
import 'util/LunarUtil.dart';
import 'util/ShouXingUtil.dart';

/// 农历年
/// @author 6tail
class LunarYear {
  /// 元
  static const List<String> YUAN = ['下', '上', '中'];

  /// 运
  static const List<String> YUN = ['七', '八', '九', '一', '二', '三', '四', '五', '六'];

  /// 闰冬月年份
  static const List<int> LEAP_11 = [
    75,
    94,
    170,
    238,
    265,
    322,
    389,
    469,
    553,
    583,
    610,
    678,
    735,
    754,
    773,
    849,
    887,
    936,
    1050,
    1069,
    1126,
    1145,
    1164,
    1183,
    1259,
    1278,
    1308,
    1373,
    1403,
    1441,
    1460,
    1498,
    1555,
    1593,
    1612,
    1631,
    1642,
    2033,
    2128,
    2147,
    2242,
    2614,
    2728,
    2910,
    3062,
    3244,
    3339,
    3616,
    3711,
    3730,
    3825,
    4007,
    4159,
    4197,
    4322,
    4341,
    4379,
    4417,
    4531,
    4599,
    4694,
    4713,
    4789,
    4808,
    4971,
    5085,
    5104,
    5161,
    5180,
    5199,
    5294,
    5305,
    5476,
    5677,
    5696,
    5772,
    5791,
    5848,
    5886,
    6049,
    6068,
    6144,
    6163,
    6258,
    6402,
    6440,
    6497,
    6516,
    6630,
    6641,
    6660,
    6679,
    6736,
    6774,
    6850,
    6869,
    6899,
    6918,
    6994,
    7013,
    7032,
    7051,
    7070,
    7089,
    7108,
    7127,
    7146,
    7222,
    7271,
    7290,
    7309,
    7366,
    7385,
    7404,
    7442,
    7461,
    7480,
    7491,
    7499,
    7594,
    7624,
    7643,
    7662,
    7681,
    7719,
    7738,
    7814,
    7863,
    7882,
    7901,
    7939,
    7958,
    7977,
    7996,
    8034,
    8053,
    8072,
    8091,
    8121,
    8159,
    8186,
    8216,
    8235,
    8254,
    8273,
    8311,
    8330,
    8341,
    8349,
    8368,
    8444,
    8463,
    8474,
    8493,
    8531,
    8569,
    8588,
    8626,
    8664,
    8683,
    8694,
    8702,
    8713,
    8721,
    8751,
    8789,
    8808,
    8816,
    8827,
    8846,
    8884,
    8903,
    8922,
    8941,
    8971,
    9036,
    9066,
    9085,
    9104,
    9123,
    9142,
    9161,
    9180,
    9199,
    9218,
    9256,
    9294,
    9313,
    9324,
    9343,
    9362,
    9381,
    9419,
    9438,
    9476,
    9514,
    9533,
    9544,
    9552,
    9563,
    9571,
    9582,
    9601,
    9639,
    9658,
    9666,
    9677,
    9696,
    9734,
    9753,
    9772,
    9791,
    9802,
    9821,
    9886,
    9897,
    9916,
    9935,
    9954,
    9973,
    9992
  ];

  /// 闰腊月年份
  static const List<int> LEAP_12 = [
    37,
    56,
    113,
    132,
    151,
    189,
    208,
    227,
    246,
    284,
    303,
    341,
    360,
    379,
    417,
    436,
    458,
    477,
    496,
    515,
    534,
    572,
    591,
    629,
    648,
    667,
    697,
    716,
    792,
    811,
    830,
    868,
    906,
    925,
    944,
    963,
    982,
    1001,
    1020,
    1039,
    1058,
    1088,
    1153,
    1202,
    1221,
    1240,
    1297,
    1335,
    1392,
    1411,
    1422,
    1430,
    1517,
    1525,
    1536,
    1574,
    3358,
    3472,
    3806,
    3988,
    4751,
    4941,
    5066,
    5123,
    5275,
    5343,
    5438,
    5457,
    5495,
    5533,
    5552,
    5715,
    5810,
    5829,
    5905,
    5924,
    6421,
    6535,
    6793,
    6812,
    6888,
    6907,
    7002,
    7184,
    7260,
    7279,
    7374,
    7556,
    7746,
    7757,
    7776,
    7833,
    7852,
    7871,
    7966,
    8015,
    8110,
    8129,
    8148,
    8224,
    8243,
    8338,
    8406,
    8425,
    8482,
    8501,
    8520,
    8558,
    8596,
    8607,
    8615,
    8645,
    8740,
    8778,
    8835,
    8865,
    8930,
    8960,
    8979,
    8998,
    9017,
    9055,
    9074,
    9093,
    9112,
    9150,
    9188,
    9237,
    9275,
    9332,
    9351,
    9370,
    9408,
    9427,
    9446,
    9457,
    9465,
    9495,
    9560,
    9590,
    9628,
    9647,
    9685,
    9715,
    9742,
    9780,
    9810,
    9818,
    9829,
    9848,
    9867,
    9905,
    9924,
    9943,
    9962,
    10000
  ];

  static Map<int, int> _leap = {};

  static Map<int, LunarYear> _cache = {};

  /// 农历年
  int _year = 0;

  /// 天干下标
  int _ganIndex = 0;

  /// 地支下标
  int _zhiIndex = 0;

  /// 农历月们
  List<LunarMonth> _months = <LunarMonth>[];

  /// 节气儒略日们
  List<double> _jieQiJulianDays = <double>[];

  LunarYear(int lunarYear) {
    if (_leap.isEmpty) {
      for (int y in LEAP_11) {
        _leap[y] = 13;
      }
      for (int y in LEAP_12) {
        _leap[y] = 14;
      }
    }
    _year = lunarYear;
    int offset = lunarYear - 4;
    int yearGanIndex = offset % 10;
    int yearZhiIndex = offset % 12;
    if (yearGanIndex < 0) {
      yearGanIndex += 10;
    }
    if (yearZhiIndex < 0) {
      yearZhiIndex += 12;
    }
    _ganIndex = yearGanIndex;
    _zhiIndex = yearZhiIndex;
    _compute();
  }

  static LunarYear fromYear(int lunarYear) {
    LunarYear? obj = _cache[lunarYear];
    if (null == obj) {
      obj = new LunarYear(lunarYear);
      _cache[lunarYear] = obj;
    }
    return obj;
  }

  void _compute() {
    // 节气(中午12点)，长度27
    List<double> jq = <double>[];
    // 合朔，即每月初一(中午12点)，长度16
    List<double> hs = <double>[];
    // 每月天数，长度15
    List<int> dayCounts = <int>[];

    int currentYear = _year;
    int year = currentYear - 2000;

    // 从上年的大雪到下年的立春
    for (int i = 0, j = LunarUtil.JIE_QI_IN_USE.length; i < j; i++) {
      // 精确的节气
      double t = 36525 *
          ShouXingUtil.saLonT(
              (year + (17 + i) * 15.0 / 360) * ShouXingUtil.PI_2);
      t += ShouXingUtil.ONE_THIRD - ShouXingUtil.dtT(t);
      _jieQiJulianDays.add(t + Solar.J2000);
      // 按中午12点算的节气
      if (i > 0 && i < 28) {
        jq.add(t.roundToDouble());
      }
    }

    // 冬至前的初一
    double w = ShouXingUtil.calcShuo(jq[0]);
    if (w > jq[0]) {
      if (currentYear != 41 && currentYear != 193 && currentYear != 288 && currentYear != 345 && currentYear != 918 && currentYear != 1013) {
        w -= 29.5306;
      }
    }
    // 递推每月初一
    for (int i = 0; i < 16; i++) {
      hs.add(ShouXingUtil.calcShuo(w + 29.5306 * i));
    }
    // 每月天数
    for (int i = 0; i < 15; i++) {
      dayCounts.add((hs[i + 1] - hs[i]).floor());
    }

    int prevYear = currentYear - 1;
    int leapYear = -1;
    int leapIndex = -1;

    int? leap = _leap[currentYear];
    if (null == leap) {
      leap = _leap[prevYear];
      if (null == leap) {
        if (hs[13] <= jq[24]) {
          int i = 1;
          while (hs[i + 1] > jq[2 * i] && i < 13) {
            i++;
          }
          leapYear = currentYear;
          leapIndex = i;
        }
      } else {
        leapYear = prevYear;
        leapIndex = leap - 12;
      }
    } else {
      leapYear = currentYear;
      leapIndex = leap;
    }

    int y = prevYear;
    int m = 11;
    int index = m;

    for (int i = 0, j = dayCounts.length; i < j; i++) {
      int cm = m;
      if (y == leapYear && i == leapIndex) {
        cm = -cm;
      }
      _months.add(new LunarMonth(y, cm, dayCounts[i], hs[i] + Solar.J2000, index));
      if (y != leapYear || i + 1 != leapIndex) {
        m++;
      }
      index++;
      if (m == 13) {
        m = 1;
        index = 1;
        y++;
      }
    }
  }

  int getYear() => _year;

  int getGanIndex() => _ganIndex;

  int getZhiIndex() => _zhiIndex;

  String getGan() => LunarUtil.GAN[_ganIndex + 1];

  String getZhi() => LunarUtil.ZHI[_zhiIndex + 1];

  String getGanZhi() => getGan() + getZhi();

  List<LunarMonth> getMonths() => _months;

  List<double> getJieQiJulianDays() => _jieQiJulianDays;

  int getDayCount() {
    int n = 0;
    for (LunarMonth m in _months) {
      if (m.getYear() == _year) {
        n += m.getDayCount();
      }
    }
    return n;
  }

  LunarMonth? getMonth(int lunarMonth) {
    for (LunarMonth m in _months) {
      if (m.getYear() == _year && m.getMonth() == lunarMonth) {
        return m;
      }
    }
    return null;
  }

  List<LunarMonth> getMonthsInYear() {
    List<LunarMonth> l = [];
    for (LunarMonth m in _months) {
      if (m.getYear() == _year) {
        l.add(m);
      }
    }
    return l;
  }

  int getLeapMonth() {
    for (LunarMonth m in _months) {
      if (m.getYear() == _year && m.isLeap()) {
        return m.getMonth().abs();
      }
    }
    return 0;
  }

  @override
  String toString() {
    return '$_year';
  }

  String toFullString() {
    return '$_year年';
  }

  String _getZaoByGan(int index, String name) {
    int offset = index -
        Solar.fromJulianDay(getMonth(1)!.getFirstJulianDay())
            .getLunar()
            .getDayGanIndex();
    if (offset < 0) {
      offset += 10;
    }
    return name.replaceFirst('几', LunarUtil.NUMBER[offset + 1]);
  }

  String _getZaoByZhi(int index, String name) {
    int offset = index -
        Solar.fromJulianDay(getMonth(1)!.getFirstJulianDay())
            .getLunar()
            .getDayZhiIndex();
    if (offset < 0) {
      offset += 12;
    }
    return name.replaceFirst('几', LunarUtil.NUMBER[offset + 1]);
  }

  String getTouLiang() {
    return _getZaoByZhi(0, '几鼠偷粮');
  }

  String getCaoZi() {
    return _getZaoByZhi(0, '草子几分');
  }

  String getGengTian() {
    return _getZaoByZhi(1, '几牛耕田');
  }

  String getHuaShou() {
    return _getZaoByZhi(3, '花收几分');
  }

  String getZhiShui() {
    return _getZaoByZhi(4, '几龙治水');
  }

  String getTuoGu() {
    return _getZaoByZhi(6, '几马驮谷');
  }

  String getQiangMi() {
    return _getZaoByZhi(9, '几鸡抢米');
  }

  String getKanCan() {
    return _getZaoByZhi(9, '几姑看蚕');
  }

  String getGongZhu() {
    return _getZaoByZhi(11, '几屠共猪');
  }

  String getJiaTian() {
    return _getZaoByGan(0, '甲田几分');
  }

  String getFenBing() {
    return _getZaoByGan(2, '几人分饼');
  }

  String getDeJin() {
    return _getZaoByGan(7, '几日得金');
  }

  String getRenBing() {
    return _getZaoByGan(2, _getZaoByZhi(2, '几人几丙'));
  }

  String getRenChu() {
    return _getZaoByGan(3, _getZaoByZhi(2, '几人几锄'));
  }

  String getYuan() {
    return YUAN[((_year + 2696) / 60).floor() % 3] + '元';
  }

  String getYun() {
    return YUN[((_year + 2696) / 20).floor() % 9] + '运';
  }

  NineStar getNineStar() {
    int index = LunarUtil.getJiaZiIndex(getGanZhi()) + 1;
    int yuan = ((_year + 2696) / 60).floor() % 3;
    int offset = (62 + yuan * 3 - index) % 9;
    if (0 == offset) {
      offset = 9;
    }
    return NineStar.fromIndex(offset - 1);
  }

  String getPositionXi() => LunarUtil.POSITION_XI[_ganIndex + 1];

  String getPositionXiDesc() => LunarUtil.POSITION_DESC[getPositionXi()]!;

  String getPositionYangGui() => LunarUtil.POSITION_YANG_GUI[_ganIndex + 1];

  String getPositionYangGuiDesc() =>
      LunarUtil.POSITION_DESC[getPositionYangGui()]!;

  String getPositionYinGui() => LunarUtil.POSITION_YIN_GUI[_ganIndex + 1];

  String getPositionYinGuiDesc() =>
      LunarUtil.POSITION_DESC[getPositionYinGui()]!;

  String getPositionFu([int sect = 2]) => (1 == sect
      ? LunarUtil.POSITION_FU
      : LunarUtil.POSITION_FU_2)[_ganIndex + 1];

  String getPositionFuDesc([int sect = 2]) =>
      LunarUtil.POSITION_DESC[getPositionFu(sect)]!;

  String getPositionCai() => LunarUtil.POSITION_CAI[_ganIndex + 1];

  String getPositionCaiDesc() => LunarUtil.POSITION_DESC[getPositionCai()]!;

  String getPositionTaiSui() => LunarUtil.POSITION_TAI_SUI_YEAR[_zhiIndex];

  String getPositionTaiSuiDesc() =>
      LunarUtil.POSITION_DESC[getPositionTaiSui()]!;

  LunarYear next(int n) => LunarYear.fromYear(_year + n);
}
