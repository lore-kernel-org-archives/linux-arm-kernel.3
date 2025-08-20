Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0034BCA0FE5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQxm3aoXVI5hC13ttOuzuSF/i8iKrejITEc0uh65kk8=; b=K3S4ic2HqmfNt+ZoreWq3PWv23
	wUi04Trbv7lllOeBgl1kbMKw7A3ZBdo4MqwwDVVqmBJhA8Bxvb4a/DE5qj4pVvpMn4zMQ5VoMzMRa
	ia3fyO4h7a54PmLtk1KT57vC9BKPgkQVdGttKHOdr9LRME8DLSAe4YlhMf3IKhvxCbmk8Dqvich17
	h+sDkUsCUYkPbN2gvGNi4fqCgk5oBEz6AoTT2+VTJtyVNL8hRS9l1d3PLG/GLWRBxaU/7wLmIpXYf
	wKUSf428K5mtxl3kRGL/f5VkyTE2/4itzpN8bRB3/lYf7i9AGR4dGquO2c1yU0AdCkEi8nD3QiRVk
	sGZXyeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7T-0000000FdU6-0X6M;
	Thu, 21 Aug 2025 03:37:43 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorJT-0000000F6JJ-16Mh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 22:29:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojB/XaFST2qZ41P0YrnheO5oKPtTq6kTCsrSQyKMFm89yOd5UtZf/ztdf00ieDZabdGV/eSj6i3yqogUAmCLdqzkM1/3qBOamuz+j3oaA24PZcDf5y7B+H3r+ynwyIKM91hZqQTZ0pe5M/UJzsQgcaAT3v9UhmGujLxK/5d3ob8ek7l1IddIQpEpmmkiqVD7ltMjr98X1QicdKwPlkSXJ3/Zp1rZw9h73BOOzx7tjuEcIIaRdhOrE5/iMfbZx7aL7TbAKAL5C6Kjc4jQt2bRVlw9lwiTVVJDEK5MUBXxk/BcdTUjeo52evNwl1GwCQI5TGEWTo0AxNF1iMq9Y5PECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQxm3aoXVI5hC13ttOuzuSF/i8iKrejITEc0uh65kk8=;
 b=ZHQO42qvDmTgqX6YuRcCp8FF35Ole5Ak7hLfq6+tKarDO+K1m8t/qz2yeEcTmLVh0UPoK4BUuacHuSgbSxVozW9v2YYjY5Fgn7Bk3bbnbqSfaWzT2iaCX10jrs7Ys1sOypHBhx5w1iegpvudui1MZQo6bCeZprJpINtNQG+5ooIMrfi6f7LwMGkFfOqOjdJQLGkLvtsrcvyA78wCzWLbZuF8A3PsYGYa8s6ttkPqVzpMmAHTN0Q3NqVmVfLUf5ou1XNX9SOsMWF+WWuDb5DVdX9iwcRVe2/RnMixN8KFQv8fsT6zmTYBeyH4imFWp7E6ojb+l933yoonwJOGEUDOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQxm3aoXVI5hC13ttOuzuSF/i8iKrejITEc0uh65kk8=;
 b=S7NMlOKRw3IrRcPioq3vmcGqgi12s21COFDUDIFCFmqEAZXGU0IcdN6BP18eGq0Jq58MdTWOtqM4bRcQ85Fu3kzAgeg0phZavBkf31eLJFnaBZhDm/IMS5cn9iFYBA5cQdoCGUqKQmsgCo+8wG5rYocdpo2maPhhJePfHcLY2rVGViQeiNsNM2hHncW0HJNckaxCpo2QXqUbJQ/COTkVCxft4FfnngT6fBZ7Jce2jvblHYSW7RC02dL8yfIm9Ag3frEZQbyyVzBvAq16MSSd7Ep5jiOR1qFkOveWwoIottnmS0l5sXgJhIWnuXlyJTIDXlSSrkS/VLVMRo0hXZ+xxw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM7PR04MB6888.eurprd04.prod.outlook.com (2603:10a6:20b:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 22:29:36 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9052.011; Wed, 20 Aug 2025
 22:29:36 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Topic: [PATCH 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Thread-Index: AQHcEiHoChHia3E29EiEK4/sMRQ2YQ==
Date: Wed, 20 Aug 2025 22:29:36 +0000
Message-ID: <PAXPR04MB918595311BFD2BE1DC0CFD7D8933A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <aKY00cmV0NnOlAmx@p14s>
In-Reply-To: <aKY00cmV0NnOlAmx@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM7PR04MB6888:EE_
x-ms-office365-filtering-correlation-id: 6edef177-a16d-4c07-5148-08dde0390b7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?tz82Im3tx135qvk4u9aSNT9KUhPKuFBaaCvTEvqI8dr1b6dchbtyOIRMcOF1?=
 =?us-ascii?Q?COMav68L0hIi6TP7rxYhZzivoO2QO48NmrqFKDEO9VoB9giltBm1DF9TEmjS?=
 =?us-ascii?Q?89bcCvOJGVyxXi9uaNM6Rzc+QIIAcPOmH7dhPugTu3yRJ8kgBTGoq1hkKiBM?=
 =?us-ascii?Q?JDXpm1HJPV4nh3RmZqUhtttQmAvKZNK1VI74TYPSbj43mdjB+ZL2yz1oIBNV?=
 =?us-ascii?Q?0TAAG9UEfnNrOmf8sg3LGt/3RFgAFKWGNrAA+k8a7lNqa+oLYOQ7GZdVLupb?=
 =?us-ascii?Q?my6+PEb9wP7TTlelvBuMoFdNnh3XsqENrknP+M5J0UjnU1x5LQNa00p1hLp5?=
 =?us-ascii?Q?+nbsflfo3KoHYY/wTkUi1IBHAtxKaixWXrv4Kc0QPfT75+kuoPWHsDqktqak?=
 =?us-ascii?Q?SwbJCA/yN2wDC/bTWGiyiHK+mL02Kq7Lr0RYa5VPZR9Dov8yn4r+7OxEf+ib?=
 =?us-ascii?Q?UU0iao+TG0K1TBUy4CXJaDqrZy3Rmj9gN6BjcnRWGIXvdpy1UwJCLOVclqMv?=
 =?us-ascii?Q?CZSJY9Ypq9IzbgPagjnXPWYP33ZDn7zAYJlJusCbML3pLP/Ny/iW4uir+3uh?=
 =?us-ascii?Q?EV7j1Oz7IIrvwJaydun56T0OXswYrTwBLTjHnARc4QugxdyAhtxJOdHYxxXC?=
 =?us-ascii?Q?xfj2jgHosQkYTnJLeIidbBAYhtbFr42aRy43sjrrbH39Hj2oR6VF1srRvzhq?=
 =?us-ascii?Q?SU1eq/AusXZ9Dh98KZZBzvQlcv+S3NB8BfzeCTlJ6/ctXrlBG7j2WT5PesSo?=
 =?us-ascii?Q?uaDbKaOeu+oFF2sznbrkCxuDwANN5UYcqUxWkzjcC6L+XYh5O/nonwTYWNRW?=
 =?us-ascii?Q?1HsIK9syMYVgFxkRIvW2sIZpd5MiqedTzWcTazCXxYW+qwt4SwVacjUSOIz2?=
 =?us-ascii?Q?bRVEVD6MtR7KV1b1rxt8pjX1gzgNYfOlSj6h+Y9ZqdmIIR8EiDHQZJPeYFNE?=
 =?us-ascii?Q?01WJM7VzxGrIwoXRa9js8Iczka3+Uu6+NmurUa/Z9D+b38/KyNdpNdDxTJS7?=
 =?us-ascii?Q?ZAd8DNJqEJiD2gOA85XmAcwX3H8qUqUePwK6/7koyVL/lvEvBRxTCjpERV4Z?=
 =?us-ascii?Q?JPZjUXQ8rd/O1kgxAPldwYamVfOMLEt1ngOWjGCw3hhJMl93Q9l5P97CEYoc?=
 =?us-ascii?Q?Q0zmv50VLUTRTZ5iNYOQvOFvcJMBqHkscIOwC4sT50LA2cNKvbW4oLD87zlb?=
 =?us-ascii?Q?ylzKgFVKD5qHRJ30CUlgdts0VWsCYoi2ueR9GIQx4NTixwT7WQlY0vA4aDXw?=
 =?us-ascii?Q?nyKOSkSfI8exL5CbFHt+gPOV5/hmFpx1rwyqJhniJadBiTgxMoObUTl1fhQl?=
 =?us-ascii?Q?q8ghkDldaXQMjlRuEeKN9v7cg0pbXN8IS4qYq02ZVYBPpOS6kVtrA7fbfHDB?=
 =?us-ascii?Q?xNF/IqTLhd4YhgfP0r27HDtAUo0hItfAdPHBhadroRAbyfgs8ptb1iL5Qnso?=
 =?us-ascii?Q?F36qZGve+Fqt4wBFT2Vma/ZgF2rMI3cv1VKBOSoO2PUHNSHxl0qebA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wDI7+1gUSOAQSZI04VrWlX+q+FqIjXF/QMvwDb3gfHUCMP3gg8sE3H6sTc4S?=
 =?us-ascii?Q?4xDHxAu62lhrnBSE18XCXwk4ZNS0gGLqcoW5KA6845fJ9u8lkazTq4Dvu+S+?=
 =?us-ascii?Q?eBm8wPcOCVxGKvdIk8yDOpWLg81P0KSgP5DP7vgsCkeUwu6aTCeUeE6iorpX?=
 =?us-ascii?Q?OOpIJoxkCF5EBsBgmEtGJHVJJPdcXs8XGLc02l81jO18EhruIz0V4rBuK2Py?=
 =?us-ascii?Q?vt1ENW/xgvfGh2NPSb8S+jfdqmsTirWh/jtwv2gOWsa7eyRPNYDPe9IRapPr?=
 =?us-ascii?Q?ZbWw096L4YZjDF0yWwfRUwk4kfI/i6MmSD+wPq3hfJjnyCmZEpKHC7+EC0/y?=
 =?us-ascii?Q?zCKuWBaxjIU+SM/i8RdQ56jYaGoP7NyncnP762QXyM7foBSYs5cmeFNZn/7H?=
 =?us-ascii?Q?MI5zqjVEXz5JFoBW0fgxIMT/7+hJejOh7Xay7Qg70KoB41qfx59KtmsSBf9i?=
 =?us-ascii?Q?51OVo9ytOzbyjmKJJU1Sh66cOhoUgv6+Jy4NQQl554WfoR6d8eORoUl9mhu+?=
 =?us-ascii?Q?es4XdG6UcrWSUjP+91xMQ/khiKqq1mrtUoSS9J4hm+pYZ9Sg4fRhO8Kso2TM?=
 =?us-ascii?Q?8YcQ5XX23T5BEYyb01XYZEY/SWADk6f+h/wbdh2Moyo9FEXDsFm2Rx96LwRp?=
 =?us-ascii?Q?MOesHCrVUFiP3qlpxcaFcbWjsfkhmWkhY9wO+qaGJQ0Nqc+qAOuU6XpIJj1q?=
 =?us-ascii?Q?mZWGYmyHecVd+SJ1lOOxEWStdcRMadg9YQg3IwVyNNBA6/qWWjufVCLllY+5?=
 =?us-ascii?Q?oVVlp1H+zfslowmJS7GIUGt4hBv3SauaMBDkoa0xhYcKZuD9tt2TEI3CiFh8?=
 =?us-ascii?Q?rD6SocC8xFTLXCvAIJhXfP96tgwy3uZDHG7GIbsYqsYi5+JQozfKEV4ZW/A7?=
 =?us-ascii?Q?D7SSCUkzZYQl2N7TwzTSrckKfHrESHP8Ix5tT5NmOFON27BZcZufbO5Z7EYi?=
 =?us-ascii?Q?YqwAxmTy1S5PgQkEvi/6+wZNB9/JAkKCbvXHvu6qpyGAcCIF8a7113s+McEE?=
 =?us-ascii?Q?9u+8ggMxuqrJvn8/0JGeZhdgdHKP91GwsCcMTLqpEK2H7clQfx/onZcqH6Rl?=
 =?us-ascii?Q?xA3Bc9owjPNk1Z7dXE/BrhAEsYadG82jiPQinOvKlFjVc/qDjpLz6pqp/Vcu?=
 =?us-ascii?Q?CFOrkoc1BhHUCKTlefTaRJBtEq5vo/BGbnNnJuWn7bIo+K3mRRUvHb+c4c+C?=
 =?us-ascii?Q?xGcNMitiAVzPKhKn1RSnC6xtPBqn66mHWDkiqZCqqRp+M+am3+SZvY8TPCxj?=
 =?us-ascii?Q?Ov5Wk4lo2pnJFEnAqYuEaTkr7t/akHjj2gFmSgpzsByGvFRINwTTU+laWwUx?=
 =?us-ascii?Q?0brfpjTm3GkI8ob3tmo7YAgld3/UAd2gCI8kHzTQcbcMIJS94I4OoR9G2V+J?=
 =?us-ascii?Q?zFjGro3nWxAd0ju649AYFS7QfSQzQ/XI5IXvM4u8t+J3OMXbh0IVkgj9kpgY?=
 =?us-ascii?Q?YgxdIqspbx0aEfFVErofHH5aiFBgQAiQUE0kLhSUnVIjH/o8auQ3F0j8D+N9?=
 =?us-ascii?Q?WkjFDLnXaYWp2phxAfpclEo6VSbzAuVVR0Ln26W/7ylTt23klQfSW6S9M0+o?=
 =?us-ascii?Q?hEgXlttjPFB7mC7aIa8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edef177-a16d-4c07-5148-08dde0390b7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 22:29:36.6570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Glr1twopV5c89BVG9Kr3Hlphc3x7MYTCqZNyHv0yfmMGjJrQaKGkeAhr6wGFmSO5gxm4hbnmnFlSq+matk96Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_152947_301683_0866E3C9 
X-CRM114-Status: GOOD (  21.75  )
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



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Wednesday, August 20, 2025 3:49 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>=
;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>; Barto=
sz
> Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx <l=
inux-
> imx@nxp.com>
> Subject: [EXT] Re: [PATCH 0/4] Enable Remote GPIO over RPMSG on i.MX
> Platform
>=20
>=20
> Did you send me a patchset that doesn't clear checkpatch.pl?
>=20

There is one known warning:
WARNING: function definition argument 'struct rpmsg_device *' should also h=
ave an identifier name
#268: FILE: include/linux/imx_rpmsg.h:51:
+	int (*rx_callback)(struct rpmsg_device *, void *, int, void *, u32);

I just kept the format as the existing style. If it is required to be fixed=
, I will update it in next version.=20

Regards,
Shenwei

> On Mon, Aug 18, 2025 at 03:44:16PM -0500, Shenwei Wang wrote:
> > Support the remote devices on the remote processor via the RPMSG bus
> > on i.MX platform.
> >
> > The expected DTS layout structure is following:
> >
> >     cm33: remoteproc-cm33 {
> >              compatible =3D "fsl,imx8ulp-cm33";
> >
> >              rpmsg {
> >                      rpmsg-io-channel {
> >                              gpio@0 {
> >                                      compatible =3D "fsl,imx-rpmsg-gpio=
";
> >                                      reg =3D <0>;
> >                              };
> >
> >                              gpio@1 {
> >                                      compatible =3D "fsl,imx-rpmsg-gpio=
";
> >                                      reg =3D <1>;
> >                              };
> >
> >                              ...
> >                      };
> >
> >                      rpmsg-i2c-channel {
> >                              i2c@0 {
> >                                      compatible =3D "fsl,imx-rpmsg-i2c"=
;
> >                                      reg =3D <0>;
> >                              };
> >                      };
> >
> >                      ...
> >              };
> >      };
> >
> >
> > Shenwei Wang (4):
> >   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
> >   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
> >   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
> >   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> >
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++
> >  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
> >  drivers/gpio/Kconfig                          |  11 +
> >  drivers/gpio/Makefile                         |   1 +
> >  drivers/gpio/gpio-imx-rpmsg.c                 | 559 ++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c                | 125 ++++
> >  include/linux/imx_rpmsg.h                     |  55 ++
> >  7 files changed, 895 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c  create mode 100644
> > include/linux/imx_rpmsg.h
> >
> > --
> > 2.43.0
> >

