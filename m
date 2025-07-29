Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C344AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkLgMAPtmXVRihPkBVFL3JAavZVAJs7pv35BCuhjrPQ=; b=3+RUlDViYSiizMsMfVArKOLwIh
	OUdRqp/coIrQ3nchkrxUnpWjQGfQpo/Y6GQo+xGAGeXZAm+/1LnaMDoeUno9tq4jJBmOL5IdjlBpA
	jrv9u7VjxMr+pLKNla8drRtB7msrZQh45VwmDzYUAcjztpC7jTHcH5AEdb7N3YchJNKpwvVJAyvJt
	T+Gc+FhmGfT71VJfHMHgh7Gqi6jCy+ZzurRxe7k+vKp0q4X11ln0KPJndo3VIC+62D8V8mGpssADW
	3026sbZRlFs6XjcUefPxeGL559T/CVGQ8hTkLUD+8hH6EuUAr0oJ3OsaKXjOye0/6ZYtN1EXUtuqx
	CHf8Qa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfEq-0000000GC0o-0VyW;
	Tue, 29 Jul 2025 07:59:08 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfCH-0000000GBhu-0qcF;
	Tue, 29 Jul 2025 07:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfA+f3Ylyk4YimZGSnQuuKYPBd02HuDMgTR/lQBue326+Us0tOjBnmBBuRoK9yHcQklEWD6R+Db6Gf58sDOFKvPHZTnPlJcaKqUZef11lU56MvpYWevGEHeez3m3GxYjZZOP/gqb/OJnXMS5zCLw/TTMPHEnCYMJJ9+2oEHz3/j/Yaepf42eqZmV64sO2/dsDhNA5CbjtsGXBlU61w0v0cCYS8+YnZ8Oiszr1nDM4nxsE3EJzkAIZSqs0IAO2D93YI96DX0ymBN6jlyC83GwHqQyus5UgpJ7ZRYV22aStQNepHqV7pI7QJQfuDx0Ub/4FCcsYmxcrs9PKG+r/v3R5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkLgMAPtmXVRihPkBVFL3JAavZVAJs7pv35BCuhjrPQ=;
 b=oqbLkpG9zq/obuVab+zilEALdsSvSDmxa1FWr25NyE+xixueO0KpvNPpWoSkg1GyeJ+uBHkNyZ2VCt0U5mbLdiYhc0FHQB6knv8tkBDMPQeBLVBXVNg+eyD4zg3sl4ZkiY0fWiu6AitXgoEoall7iLcovLFLuZxEmCkw0xVQmx8wsRPVCcKQrMMOovPriOihM0aOwjxmkAU0tVwG6XLsIpboK95EMNvI81/gOWWmEdKVqLIPIFEm0teOtMY+jLWnbL1AtMhB3LtBTDyOH/lxSuR6caJdZIo0HzPp9fPF9F8oIAXjdErCov6509LJi9CgSIH2GOOu8slJkNBVkgHTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkLgMAPtmXVRihPkBVFL3JAavZVAJs7pv35BCuhjrPQ=;
 b=fu1CRp2oDnFknUL22hGgAIxVrT8YyjgTGojRQRKiHMB/vS3CDTNexoi1CfUvsC7MPiMws0GZU7L4E9xA4MM3yUcEl9oL+XB3zBiE18KZ37cMrmpYcdyUkvEhSzVOFge077Irp4xfaJo7/ivNfaZ5snd8+X5yzEAO8b0H4DbF4gnlAizwgwZapgSuaaDGyDbEJTfVX0rmGny4EgFT59e5ixS4WJ4jlF9R2PfMNv+Z+8eLHj8/KZnzTKSvlksDD1ef2zeyUY6Z6A62StPjYozR8Dqm9RQW4fQafVcibMTUj4q/QxfKMp79Fgw2m6zF0a2aMheGH3cMfyQAUcVvHPWHbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAVPR08MB9481.eurprd08.prod.outlook.com (2603:10a6:102:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 07:56:19 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 07:56:18 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v4] arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM value for mid speed
Date: Tue, 29 Jul 2025 10:56:08 +0300
Message-ID: <20250729075608.1651898-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <B06376CB-BE3F-4645-8A4D-A9C67CDCA3EC@public-files.de>
References: <B06376CB-BE3F-4645-8A4D-A9C67CDCA3EC@public-files.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAVPR08MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: ddeb6f08-1a24-49fe-0f80-08ddce75669c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CLzgsWYu3GdC4ZKYX8Y1bi2o65y/WOeZa7FUNQI0nGuYzSO1NAFTZRiZGP9I?=
 =?us-ascii?Q?CVgg+1CXeKhXBPILiIxa03iHYv9Y9iEbwKSEhA6poasFWEzUvFz8RYAAejjc?=
 =?us-ascii?Q?Woxk6yWmd0zGh74lRvD9wZXyC9KFbTRJs2wZYay2CkmlkXVC8y9l/dOowWHA?=
 =?us-ascii?Q?UwtLbRawh3QtAhjS2MmgxLnmHU05z2iK+ymT+7r78UZMJZoogk5l9ugcbQ0U?=
 =?us-ascii?Q?r32IsNokTDdJ2o8HfoE5eDJKx8eNZJcI3gOiEvQ8tv1PcBwQY9tA0ni/Ezru?=
 =?us-ascii?Q?JLZlMeDcqcGU5c34wotBVy25HrPl9SnZW8/iqKpsGRf80t7Gx/LRIUgC/wif?=
 =?us-ascii?Q?KQufo9b1cKY3kdBFxu2bMarnvnboW1J2J/gqrcj7tV0Pm/9+twL7BdZuYgz+?=
 =?us-ascii?Q?j5ZzPOWqnEOVuaddeNDh/LJPQb3cdFZN71anZsOhvj0ujMlBs/B4SgIQUsjB?=
 =?us-ascii?Q?2flXDaWHjh+m9ajYOJ2YkcrSlNpk6kBt2d/gX/FTUpTwKtgNxp2CQ2bEmpuF?=
 =?us-ascii?Q?iGsxc1OM8lLfxtqjzEzajKyONWA3WTMyexUikICjvYeC2tl1knf4cV94gjB9?=
 =?us-ascii?Q?eDWIwLac8X+R6PnDSZTxjevVVJX/YeOK4W8WRLvQqhMiAUjXeqN08j6vUKw6?=
 =?us-ascii?Q?pt9JCyHoiySq6M8eTluSBueOkiraiEIvD5rao+n1zAPDZNmTOWhG6v5FC6TN?=
 =?us-ascii?Q?/2sJYNBWLfZKR5Ivr8oLxuTMWjtdPNQGV3QJCO4swHqg50fCyE58TAyx2OrT?=
 =?us-ascii?Q?Qd/bB5I3v0z7s+IhNBa9HN6RZR4EKEXui3S1bPZxmiLDP4IvYRfEZIzJxxX6?=
 =?us-ascii?Q?j8Q8DF/pp83SW9X4fiD5+t4e3xNLwVtdGGAkwkIGdzJWWiBJ6h3zNFdENRS+?=
 =?us-ascii?Q?0mq7gVmuwnHLIA98UTsqa2SGFpbi4Au1rDVOItSRMCZFNdRERjFYd5S2aM4s?=
 =?us-ascii?Q?X3q+/fLOFE2DfBZzLlgidCAS/b5G2M1Z6VujyILnpoemX4l0vDJVcS0obDjC?=
 =?us-ascii?Q?HxDfTXxPQKjrJq4s6lnIr0uBuUqGJtN5KnhhDsZ5mlNl55hY2wkhznHFzfgd?=
 =?us-ascii?Q?56K4+13soeipV/5/ZsQGz6/zpAsd/ZyxmzvOHd4rGw+d9nFxRXrwhQhvybWw?=
 =?us-ascii?Q?8r6LEwl2JZPSaVvDsBsd2ES7mFA80o/nSyK1b4H84wS6UE55YRtzkD31fGVf?=
 =?us-ascii?Q?PKi5j6yS5YL/95FMdULUzvuvLuA97937K3gGv+vFvgOEp4PjanEvtHlUoXMf?=
 =?us-ascii?Q?nurjiMW0UzaMhpD2FVG6VLGMVpElWVNreepgZj6hUfUgnY9gCW6MQyY0AUVt?=
 =?us-ascii?Q?5Lxmeg6R5U/J4m2izb+G7dwmrWtouhjFilq8jb6gTeZsS9ZlmsCObynWFO0h?=
 =?us-ascii?Q?ZJqk+YdP1bXHROAuYX3729eLGYmiFQPpVFmPpblHW03l3agYEuc5y95HQYah?=
 =?us-ascii?Q?PPJTK/ftwhXOFqeeSYrcl3Riz0s2goL1eupEf2Cm/a0FCCX8xjXz1pU5CZ7w?=
 =?us-ascii?Q?SHn7IBrMH8/f+tc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bAL9BCZbViD3QS3wOKKMnO0JBtThg+oJK54kyn5gF3ZjA+Lkvxjp1BefjcsM?=
 =?us-ascii?Q?+7GjUwnXZPj+MF1Lg+8bF6ZWV5S5e/s2ITcyHoAN5xPN5vdmR0WyLuvGm5h2?=
 =?us-ascii?Q?6JB2+9Wl2nVwTTsjtBQGa7hh9RzLKJDWfecJhLTcxADExxgioMXpTU7jHMPi?=
 =?us-ascii?Q?wNJUozORdGRKq6AmxznQBF4NeQnxwgKsNrAaw7+7miakiioXH2fd1Vm1zCKc?=
 =?us-ascii?Q?jj4wE8wCQim11GAroU2DKthBBMoiDzYdePVDexW7dLiw3fmEEbHpj8xeB5ZQ?=
 =?us-ascii?Q?YUh7s7mnDEAYTAyocW4AZ5rFTmoOx39b3EMbxHTzjrVIYTzAS58FCaS8Xa1O?=
 =?us-ascii?Q?56npacLHSwPAPFJGvMIF5oqzkgs1fXi58L2e8E6S3j+FixhGMxZ2GNqcyZtk?=
 =?us-ascii?Q?sIFzt03rO9ug1vRsv7Ya1sPZMmNYepMgFMbaKYqvDTKQK1NNuwN5S2Bsuj5e?=
 =?us-ascii?Q?7Wp2EI7IQY+ccVHFAYfWKnopVxZY04sbUg1gemMX18ndyv6uVTvT0dh5fmIZ?=
 =?us-ascii?Q?9DyzSE3sGZt3jqvPQuGJxv1IZU5nIl6HFY2EkSVBoQoJ1gLfpJcQkHg8tYUK?=
 =?us-ascii?Q?oj5FCwPThGUwOajEQQDeElkbinA2ri5wfJ2pfdjUjfjboEZ2UviR9YMzwq1+?=
 =?us-ascii?Q?yfZFw2I/K2+qm1xTCitwMyLGY6gEU8fe2z190CWg02DzThb48Vn1GQHjbgJM?=
 =?us-ascii?Q?IF02+FH83VSYITGEOZAViMPUahZhntjU6Wgd+HLlcOS73hDjP6wu80E7ZFji?=
 =?us-ascii?Q?6PhBpQ3EeA0zWeaj84Mxl7K/mgDnTY1d00S6EunQIYi+too1njEHLJM62oMm?=
 =?us-ascii?Q?9uSplpGxWHWi8S141pXF7sZtOejGgSKCIi6Yzo4SRoHyk1+oUvD7M5aaSbKu?=
 =?us-ascii?Q?JWL/eFff8/Eb7ncvf8Yl3dtY1+0CUEMJcXFsDrLgu/vseJ92dAS5Ve94x7m3?=
 =?us-ascii?Q?2hcmfz+6hYqMo+BCR2y9rlrc4eH78we4NFgQag9yZaEeuanQ06BNjGu0GVxJ?=
 =?us-ascii?Q?JMllOqa3SW5vYeJ2H6Fvd1nBlytoqW6Ac+yUOYKK8tHkVjmpWPRBIJsCL37W?=
 =?us-ascii?Q?OrnGk2iBmLncFLhMv3Bf06xrzHowlAOXsWe+WqOPj8bXHm6QoFHrlWumGVWd?=
 =?us-ascii?Q?Me1w38x8zWXt/dOwaot22N7r8lcH/DvJRxdQU/i/02Q4JHxcb/4dnU2sATqz?=
 =?us-ascii?Q?7SprR4/4frWuSfEJ4L+5u7RvIYeCy9aHJB5X4s/D7Y+8vDMOv0t9V9p6Jjkg?=
 =?us-ascii?Q?szRRmHDhWHExsxJA419QmPtTHlIhtXh8hrVRCD2TlIEKsRMJGulndIzglMsX?=
 =?us-ascii?Q?ZjsRQXaZfGSUYL2ge0PPbxAfopvzd8FXXLvPiStnhL6DJntA3grAXgky7TXp?=
 =?us-ascii?Q?2ek+C4QsuJx55zVhbod1pDF/DdarUH7/b/KJ7h8jo3fmgmcPr36hwoBVJxDw?=
 =?us-ascii?Q?WkpbdPUNITU11zRT8GnXevtYZjWGcXUwjJUzYmZzMo8xjNTrqTZ3An85ZXg1?=
 =?us-ascii?Q?+0Cwe0glvykHwowTxSbryY4NNDk+wPV9bl/AWMYpUzWNx+8PwfUfIl6+JM/4?=
 =?us-ascii?Q?rIIw/i0SdWi1jXWLHHccNYph2PnzBdpG6RhrdWMKbBbA8MCkZN5RGhF3LDq9?=
 =?us-ascii?Q?xDtDGRDPiXJEjh+VZQ3JSTI=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ddeb6f08-1a24-49fe-0f80-08ddce75669c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 07:56:18.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VE8xqpcA3kUh6+T1aojPIYsR55Pxdc46UgAkuFrulhVMkgOuJR2ItS6LtXBad+a/M3Qs446MXySKu8ee/s+ms5hLp5b8mgOlORfZNmUDO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_005629_517302_71E6BC41 
X-CRM114-Status: GOOD (  15.84  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Popular cheap PWM fans for this machine, like the ones coming in
heatsink+fan combos will not work properly at the currently defined
medium speed. Trying different pwm setting using a command

  echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1

I found:

  pwm1 value     fan rotation speed   cpu temperature     notes
  -----------------------------------------------------------------
    0            maximal              31.5 Celsius        too noisy
   40            optimal              35.2 Celsius        no noise hearable
   95            minimal
   above 95      does not rotate      55.5 Celsius
  -----------------------------------------------------------------

Thus only cpu-active-high and cpu-active-low modes are usable.
I think this is wrong.

This patch fixes cpu-active-medium settings for bpi-r3 board.

I know, the patch is not ideal as it can break pwm fan for some users.
Likely this is the only official mt7986-bpi-r3 heatsink+fan solution
available on the market.

This patch may not be enough. Users may wants to tweak their thermal_zone0
trip points, thus tuning fan rotation speed depending on cpu temperature.
That can be done on the base of the following example:

  === example =========
  # cpu temperature below 25 Celsius degrees, no rotation
  echo 25000 > /sys/class/thermal/thermal_zone0/trip_point_4_temp
  # cpu temperature in [25..32] Celsius degrees, normal rotation speed
  echo 32000 > /sys/class/thermal/thermal_zone0/trip_point_3_temp
  # cpu temperature above 50 Celsius degrees, max rotation speed
  echo 50000 > /sys/class/thermal/thermal_zone0/trip_point_2_temp
  =====================

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Frank Wunderlich <frank-w@public-files.de>

---
Changes from v1 to v2:
 * improve patch description

Changes from v2 to v3:
 * added question to Frank Wunderlich

Changes from v3 to v4:
 * Acked by Frank Wunderlich
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index ed79ad1ae871..b0cc0cbdff0f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -42,7 +42,7 @@ fan: pwm-fan {
 		compatible = "pwm-fan";
 		#cooling-cells = <2>;
 		/* cooling level (0, 1, 2) - pwm inverted */
-		cooling-levels = <255 96 0>;
+		cooling-levels = <255 40 0>;
 		pwms = <&pwm 0 10000>;
 		status = "okay";
 	};
-- 
2.47.2


