Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1BFE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxQqyQyyYkXvzRlpLLhGotY/gqjlWzKbXCrDjJY0hp4=; b=rWIutok5HOm5IW6k4lImoT6w6x
	TB9Q+POp2AdqeMmc+iI6/FPEqXUc7lsXg4jrvuqIkrXDdF6TGmsEwuKajafDymS7+5xHnFOhuB+xP
	hgoK58Zk1597b1ofDBIqVnB8tWInQznS/riRtG5EYhu/r/Ikuw/tr9y8/vdIvmAzNQLlIpnNQR0+4
	jmcj4mxpLD/HJzB1bkz2S8WT4G3DdjmrV1jl52m07GsvCtqBqougCPFSm3NMSV5IagDoAbIn1sIN2
	dBQLPF3RHrvujIxoOPqONhsFVs16PIrVKuyqhrwHC82cobgXcYRWaJLoWeSAhAMjjrEIl3DNX2/x9
	esGu+ZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTjH-0000000CshF-1Ajr;
	Tue, 17 Dec 2024 09:18:59 +0000
Received: from mail-vi1eur05on2061d.outbound.protection.outlook.com ([2a01:111:f403:2613::61d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTSv-0000000Cp4o-0rsa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:02:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFrn3Iz9UjgN+XbHxKOzF0KqqrD5dtZsQEoTZFuNfEKo4ksW+EKktQ7wjqH6T0jLibCSzooHYNp1tqXM014fYeHPEF6Oomv6B4+FO63MqlxlRr68tLHcGdipQLGG9Ox/2OydwPRrwhScki5OWprpWDs6whfZ31MuRM/SkmYdzJF2DADnpNh67CRUoqouNG0aFySDAfm4mWILlpeLzbERYpjEkHXKStCKiHP2StoZ9JIgNpL2coNV/DIkZbZJxuHKIBx2+7Cw+QOfJDJWwLGCQKZazbDMJS8MhYWK5uksWnTFS6PqOHKrCSqZ7X/1PjaumMD0Ye7xytcODsSHxVxj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxQqyQyyYkXvzRlpLLhGotY/gqjlWzKbXCrDjJY0hp4=;
 b=cRjCBVuDi3/2Xc0FTJ8nBRb79v23qDrXkbP3CP1UfQiHNZHQY3r/NFxCoOGAFM8rPOEWPqvISGUB3CWeVdzbeRlmtPj8TKta3hKNbwPh84g5Z5LyhXhdOTX67UyXGlJuWp2Q94SUz8PQNMvQFg7vYziIO8YfTF0mpTz4btP5clegrvxBA5jMfZM5Z42cr/xnfQH6rQgFpLF530FwY9UqarsWptHOapqh+Olu0ucHzExZ2oIebzOBuiqRV9aG/LxA/eFnNOKbVIEzcc+hjMwpYmvcS4BNtf8gcvliQEW6pJ+EbD88mR/s5EZqsR99MQee2qvRRKkkRdak9541GbesnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxQqyQyyYkXvzRlpLLhGotY/gqjlWzKbXCrDjJY0hp4=;
 b=Y32GPkGhVx//nBj4/k9c4uHkfqrpApJtOWl2Qrp5WHLgIsUDs/uEWAbjTTcBbH4KhFiPkdLjdS52tN9OHNfkFHj+tHqZZ7MVHJXp0c2F5qUkqrKmpglAn0et+0nXQvFzwTb9MsPDYA7z4ExBEcYZwcnhpGauKd1F1fWwrhrag7i0N4Y45KoQLHctWrpfgQyucaC+nGJo/hTg07SPk8DXotWTm28w4bbWyj8zy7g+Y3ANC0BUtf0+583H71F+M/q8eutcqBKpo09T8rN3LSrXLrBiP9AX54I8GYhb1XjnruzMkyc03Q2Oxx0vt5oX+8l9rXl+iIQcd7w1jpvwU5Ceng==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 09:02:01 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:02:01 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbTHk81yKZ8OkADU+CIsg4vinMd7LorvQAgAF7EqA=
Date: Tue, 17 Dec 2024 09:02:01 +0000
Message-ID: <AS8PR04MB8642049B19BC7A5C8833FEB487042@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20241212093555.1376568-1-ping.bai@nxp.com>
 <20241212093555.1376568-2-ping.bai@nxp.com>
 <3c9fe85a-5f86-4df6-92fb-e4ceb033f161@kernel.org>
In-Reply-To: <3c9fe85a-5f86-4df6-92fb-e4ceb033f161@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|AM7PR04MB6966:EE_
x-ms-office365-filtering-correlation-id: ba2b33e9-9962-4d1a-37ad-08dd1e797811
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Va+9YTqKOtHOgYVdeEMHY8eVpd5AaqeQfgdNXpJrqgYYWKy54/7yWqauLg0k?=
 =?us-ascii?Q?2xfQFeevG9XJTxur06lD2dFvSCPeFky3/0xkldTkrcpR5GSq8v58RW+xojOu?=
 =?us-ascii?Q?wOsAV07Do52avNv+SBQNiqea+5yPnMksemrKI9zrZWLFHKysqmuW774+ojBk?=
 =?us-ascii?Q?pS/wp+reTkTsCpRcht3g+DRxS6pc9iqb/mJH8S6OqzT6DyskRnUb8SE0Srl7?=
 =?us-ascii?Q?tRc7xr6mMv9qVslp7aSlarTPBLIl+6pOkciEBjWxUuktFEEAPOWy0QE6a76z?=
 =?us-ascii?Q?tlPprgVAkWiyVdmfYVz+2B2RBzGOj6HWzg2Jqz50gAlaOzuiGrrNnPSdORV3?=
 =?us-ascii?Q?byKCRA5i2qSUCMtInJx7F50llnVKVIrZ5ts/idxIemmj7aBPkBPWS4L7YUu8?=
 =?us-ascii?Q?05wBk9ymfGnZ48gtwpaFPSse5NIYak46lczyE8WGH+bdYPQM4i71Hq2q62Yl?=
 =?us-ascii?Q?jPWKvuM4DCTPAmQTRyUxo7/IgPsX7XiliP++J36u1E7Ql7beEuCIai2DBNOb?=
 =?us-ascii?Q?7rQOALs6Za51NKs/ZifA94Wk+vWvmFREMR7AbM7INoC6lrASZU344Va8WlSV?=
 =?us-ascii?Q?FkG0Ec58hBqF0jFbO3qdpKXjZ57dNYIy2Lcu4wvvj/Z7adCYbhUJ9uviZYN7?=
 =?us-ascii?Q?OPKq1S8wUM8/RKuvvUgX+OAUzW5YW/ujxeTX7ppiMHkYHujTurg4YrDOeSfo?=
 =?us-ascii?Q?2jeaVVItqL1BtqrSL+c2iawiTw157/8ijXYXQHeJwHJjrwOfJwhWWPXnRr2d?=
 =?us-ascii?Q?lEd/zwZkfcfi76EKXnVC/W75MMSIXknwRNoYd8bGmIcdbYiyiaIEvay6q7kJ?=
 =?us-ascii?Q?oP34xu9+Wki/Ww2IK3TD2/nrmV1m0XNGy9bA/IL+uZqTUVoN9WlIAt3naaaO?=
 =?us-ascii?Q?u2wsugXGBWHsnjdeAEPum5/bt0qQBotDzBiOf8EzmxFMLprJ38WYK3uoGcVf?=
 =?us-ascii?Q?crWAy5hJkByd3HiP0PylLrVFYo9u4ZiA+XJJ60hlEEY5PTGysUlQpV1zBsAf?=
 =?us-ascii?Q?KE23m9+G3Hih+84n0LWUhxcjCRuxFRiwbu+/YVwGGkf3ABMuzhNU6s6ysLm1?=
 =?us-ascii?Q?i8v1UAqG5FdJmOLdOLVBMruwxbwV304TrRYeJUiH9y66lH9L5qcY2kZuYiNq?=
 =?us-ascii?Q?g4S70z7UTc88X9Oyy4UK6azNbdYVJ7vo6JDCSp/BtGsXvxiy/kaNkd4HOSDm?=
 =?us-ascii?Q?5xdsOaLILDWB/etemce/9GYmoE5HZpMZdKe0LGRIIW27qKnVoCji1TYjoTS8?=
 =?us-ascii?Q?BSd6r2paplZlnIBowKoExciwdrJq4pHD4MhCEnzUA9yLd0cQ9uWqgpAyGK8Q?=
 =?us-ascii?Q?ZL90WgXC8hkcTzBgOgUY2r65078vlCwpb/RRIwCXCAmQsTb7uKPr+B5lbTm7?=
 =?us-ascii?Q?03AqcglWMy2i/6Fgm+EpsvmFMIy+2ETEurpTZSJMhU9zC22lqfFEvWoRUgnj?=
 =?us-ascii?Q?2HVvEoNm/H7TV9LMCZFcDjKPtocmEQTI?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/b9rkNGgMxVweDUKIGEs7qABbBBxmuY49LvoPw44faK6AkFuImhJD8njbiY1?=
 =?us-ascii?Q?p5/yaCQkbUIa+U4F15ZjUFLA3F+ajW3r09RdBtXs9fJdM0YvB6Pdz5AoneSl?=
 =?us-ascii?Q?PSc46aIvOHsJhZWpoIsucc6PwakErpi+H/x9QI8a9n2o8U9k5hI45lgBwqoe?=
 =?us-ascii?Q?vTfWqzI9jyWjWgxO+QsLBsF0RaceC0VJ6F7IsTFDG5QfMP3bhh8RId92ZTvM?=
 =?us-ascii?Q?sUkLnEy/6eYpqzXk9srXj55vJAslf0RlJnobK6OgnAzXOb221azYuUA/g8Hd?=
 =?us-ascii?Q?lLLnl+sU7O713/9XSOv3zYJ4l3Rj5CJiO1s7bs843tx2b8Q4kgaLHo1i1KSm?=
 =?us-ascii?Q?JZc+pT+xxttI69pwMznF7lX5FFwVr5a3HfZbFMtMTl0NfOXItwJS5quvpU9x?=
 =?us-ascii?Q?j3R3Hoq3rBbKcEB4dcH1wqtDc3JP2necsnlYkcAR9KsppkY5H1Q9nSGQljCk?=
 =?us-ascii?Q?kVrQnkr+9C9hFEUhsscOlgAJ0Isy96ObXLCwqKGm9LTZXE0Cjqe7cRd1WMlv?=
 =?us-ascii?Q?lhTRf65PUAQ/OUtFMhyxAtf4sZVS7ZjXCdnx6PJ+tk1/9xm+vV/T9iI7yM+q?=
 =?us-ascii?Q?VcbCY7sq5+YKUv0SNBUCh1lIWE0P/Vds+TZelUR+LxEqKpS4MDhL7m01bI96?=
 =?us-ascii?Q?obsZjPOTdXr/1A+IqEU1OPqn8539hr6cGwWuP5SxuUh5Z4jutt4ffD9MPJNV?=
 =?us-ascii?Q?ouG5OT6hEpcclRvMR16NCynJcP1Jv7f+P8lNMcnqJlMbZf1Duv5r5QouVOrk?=
 =?us-ascii?Q?+aKjItDHTzSGkLrNf8Mmys1K+bNlqfdaVfudt1NvG/4FToly8Ssa6xY1313i?=
 =?us-ascii?Q?tefA697k3fYIEvM114BmiquixjXD+kNUjlxfJRQOKPX0s1jAA5NlU4u8HpLb?=
 =?us-ascii?Q?cKqyHo4vdBKh0v+BlDMVkiRYG0BIYvITYEVzVTeE2ln/fvZD+n18foQu6i02?=
 =?us-ascii?Q?EQ7QR0xl7BtTJCtddumck+/F7lYnJYTP8GSRMiTT1dgAvBaBFrE9LZECiyjf?=
 =?us-ascii?Q?aMATZd/E0b0+r3h6PJwQiaUIfYw2RfsZKVC8z9nqH4b4gaFKj9hpMBEZSJnD?=
 =?us-ascii?Q?Gm8Zwi3FGonidLv0FR7SOq3dRWz0Ev1CDMcPOmPNwgx5dO4x1KtlURhjnM4n?=
 =?us-ascii?Q?qFTmjSdvV8nzJIPBtftRpWnFQwQUBHw+ggX4PZ2WsbmL35h9pmrClBm9ZpvS?=
 =?us-ascii?Q?tWYpkvKB4cfZ5YmdKFCCQ79X0ZyoG3Da+Y5e3DdCtMslpd/ZqDAYzLaRUOk0?=
 =?us-ascii?Q?giJRT17JbbIe6P27wkCgWgw9xJrosocbgHBvBA12xFnGtBWV9pypkHoo7vZm?=
 =?us-ascii?Q?2F09ON3dcpvAYKuWbZMgBz/NunRxopigbo3X9dRYhILzXbXUIIf4JUJzU5A8?=
 =?us-ascii?Q?9xfFeIikvX7O8W2fTw96/ey7F0Cfy++3j/Ha23gYjOcXFUqZDek579WT7+lq?=
 =?us-ascii?Q?yaIrhJ8eX4cX9yalT+OECvfLn3MP2XYP9UH/MqIkUnPXyRuQIrIe/4xCxlZM?=
 =?us-ascii?Q?E6AMx+ebD4HdrDynSONmpo1IsCjPNS4B/iqWdWg1YcrlIt5Yl+ieyMGBo2Xj?=
 =?us-ascii?Q?awV2GA7n0VGEshqe8Oc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2b33e9-9962-4d1a-37ad-08dd1e797811
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 09:02:01.0705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S7v9j+D5t5O8h+m00rBwXxow1zYE333+S55luMFN5Lh6sGQE/wsoN6cM5mq/eU6SzX7KfPDhhzqtaNbz1mqwaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_010205_244336_52032BE4 
X-CRM114-Status: GOOD (  18.26  )
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

> Subject: Re: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
>=20
> On 12/12/2024 10:35, Jacky Bai wrote:
> > The i.MX 943 applications processors integrate up to four Arm Cortex
> > A55 cores and supports functional safety with built-in 2x Arm Cortex
> > M33 and M7 cores which can be configured asa safety island. Optimizing
> > performance and power efficiency for Industrial, IoT and automotive
> > devices, i.MX 943 processors are built with NXP's innovative Energy
> > Flex architecture.
>=20
> Few more comments:
>=20
> Drop all marketing junk talk.

Thx, will drop it in v2. ^_^
>=20
> >
> > This patch adds the minimal dtsi support for i.MX943 with
>=20
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:

Thx, will fix in v2.
>=20
> > peripherals like uart, edma, i2c, spi, mu, sai etc.
>=20
> Explain how can we test it, why this differs from imx95 but uses imx95, w=
hy
> this is needed in the first place without users.

Will add more details in the commit msg in v2.

BR

>=20
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx943-clock.h  |  196 +++
> > .../arm64/boot/dts/freescale/imx943-pinfunc.h | 1542
> +++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx943-power.h  |   41 +
> >  arch/arm64/boot/dts/freescale/imx943.dtsi     | 1284
> ++++++++++++++
> >  4 files changed, 3063 insertions(+)
>=20
>=20
> Best regards,
> Krzysztof

