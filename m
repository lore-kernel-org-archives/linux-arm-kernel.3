Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802C3FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGD6RxoxX6lDKGlM5omIho+1cUcv4EKjDXw5+y7M/iM=; b=KOCY16oxInAgBSkAgDNWTIjGdW
	y2fEwaUTNVF7Ihkog6T7LQJHGw50plviffRC+rRPyTGtxJX76nLcg0H2rQQ12X+jE7VJLOJKFMtcS
	UlAfvuW0SPtzotPW3hQE+eh3j1sE3XvcXu8cCcekOoVNHmh9mUT1CXPqA/EpDivwP4F/TrsB0yJiO
	FoEGP6EPka+2UKVZ854rolRbR9dtfPb6v+T1PqKjJZ0OFmxbSBCAluJuO4NPjGFzYfIRBCCilt2TX
	YFYMmX6Ak1mjNubT7A7yLJbq1F2XD6yC188P0CZ4F5i2mqri2+tIeKkMP6Cdtn663KBC/3534mDkv
	lXcMYsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkJF-00000001jQQ-2fqq;
	Tue, 28 Apr 2026 15:25:13 +0000
Received: from mail-northeuropeazon11010049.outbound.protection.outlook.com ([52.101.84.49] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkJD-00000001jPu-0vco
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 15:25:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZteZxObMFBP7uuEJ3/251fqN7oY6fHHmH/2C2JVeC9EZIxmLfHzebEC9RESJym3dMzHJANvTVwtBnQRHwa+rOx3lAMYrVrLfkn7zE/ze0f59cmN2yzOHkJjjNyMwmeNl9NGMZpKzSTFbj8XqAJZpxCo9b7HLQj7TvsqaT1nVH8w60RUnsf71iJQdOC1hG/8QqQF2IjDsgjOuzPWWY75N6xOOHqpyaY57qZs5ZKDycljICxevvTbo0hmmx7F/rHExpRxh+Qq5b86gQ0F9O8fAqXRxL6whyXCk1Yu2VdSR8WwnzjBn18XRT5tJOJ3B5l2bLgQNEtgPrZH0eHsoT/DDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGD6RxoxX6lDKGlM5omIho+1cUcv4EKjDXw5+y7M/iM=;
 b=hp0PkCUNHgBZ+rjEW30gjkLVsMW0R/8jgIV9aehVnHdF7FzEqeJw5HeNql/A40mB1GwnGYxftV7FOUWcyGE3gseUDcOBp8uav9VJck8lsFe+UcwtK6F7Jc/cj8N4EBgOAI4cWkDrnk/gvpUYizGEp/krex2Olz65DaYCqFp71yKfjUwcZVjBk7xjLArlL94z3sjhZQJyzdPQ2EvWn2kysNc7vOwqHds3S+MrTwFKYy3pepEYe2W91seei/gAjQbe9QzrF2Y77/rIBtg9858AfsWiseukB/Dj0M81+nF5tM+fmlhDcq4yeDVigxYPkotamkuj8xs4J3jjNgiuiHQ4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGD6RxoxX6lDKGlM5omIho+1cUcv4EKjDXw5+y7M/iM=;
 b=ZuLUDVVbdPGgKczXlSe3BU0625MDxIcvcUbONfxjzxFomJZ/3qQ25qEDiO4QEBb+Pq1f+fwUS7BvMJ7FKLwFfncJHfMfmUeGfuPH0wO4gnQW06PvCRm2WJD9ZcLG/kE3k7Evv00Tj/GN9P5KATmheFU7rUuEikYKvjVyBJXhFoQO39C9Wpdzz8ttTRuG9fazJjLeqqTneucVA/k6yVdNH//CKwxHXKZoKqrFUHjdxkYy1cuShwInbysCSPWjznP8C3BDt0HcDEiAWXVNedCeNndCmDc/l0l7dgQqm9HjRL2Xmcclfq2eqg4Ai9k6tyhImudgeHb8XtCSFZdMsZFhmA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB9197.eurprd04.prod.outlook.com (2603:10a6:150:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 15:24:59 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 15:24:59 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHc1yMsF6UDQFRi6kOYiNzJyAtVRg==
Date: Tue, 28 Apr 2026 15:24:59 +0000
Message-ID: <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
In-Reply-To: <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GV1PR04MB9197:EE_
x-ms-office365-filtering-correlation-id: abbc6569-66e5-4d38-63db-08dea53a4f69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 0TYPigsvZxBj4EEEQRV+sGI4d9vzzbWF9Hw1R8Lb9S49wNXg5TuBufwBIUnDrXt+g/KuixUy849l7W2BeH5b0aKd2asgBfdxMBA1dVeoH3X0k2jo8Fhum2vKLKUExdcruLi9np6f3T85mr0Tgn7q5vI9UdkNQDUXqeXeGqPqtH75DmrbcVDupYt2iHSL0xFP3kUT+lzP7I0sKs0Dmqpfi+njt6escSY2scDuHchn/3vpbSDwsmCTPgkJUqo4U82QE13w8NY+v8yAqUZZY06VGPTvW7ID9h1HgWqAFoIcyIUBzWH97ZesTuF8OgmqEN5/R9LOj85L0+D7HbLPPbv9mDRjiRQ3TuaQIh1TDNOGuKcATfriy0ptFMWbkwWi6C9a1eZA/T2fkd7+Or8/RooOFHU69hVYicNz1Z5W6qvl4OROHuFqxWZW9qNVrSTh+pvHaznAludUOVB9m2b38+fYSw99saLvdtHyvlcw/GVDdCTVtQ+xcIesObHAXNSR6gW0NvZ4Df+/+FSqgQy7qnyeKkGGHtkH5CNPaqj9T109sxQ3YuZrI488tjrDRT7agKmVYgJ+NVtQ/1s7gFmUBeNLLHfvAB6TNep8BuUHN2TmijdnAHY1cfEH4K8YaZPfZuPdw6EITmPIaesOGy3onKh0FUlakIDh6Z250paB51sKPrv1UhaLeGJUl0zpniAygY1sSr9ryq3i9KQVJ5H5zV0PZDOsCD5PgpyKxw5siAr9HhOeMjCQeSwVcg5jhSKEA2ofH/Izuziiib6vprE5oU4yR/U/K7ykhV/jKiOynN51yuo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?avPgPfLv3nbZm0Zwo8osJbZMaw6n5GEEVqwB/zBVYATie9TR8iaRBL+ziO/K?=
 =?us-ascii?Q?CahVp4RP0uyIuEJzTRwCHBgAPZsiL6xMXnwwOH4JblZQHnmt7LctWQiee/X5?=
 =?us-ascii?Q?KgBYDo8Jj0ntlbe5gJptk2DLiAytDDeInIh/wobSvngcf3TEgpXa6P8gJ+Qu?=
 =?us-ascii?Q?wu9Gk3l7eAE4FfzUo04G2xo7zp9H/3/2pQyXYpveYKgGLlsVSfGqqiLj4/tI?=
 =?us-ascii?Q?AusMeXngUc/pefc7Hy6ZNwAZXSjgGE53i02sfmTDEeZV2RGm+kSK2N7BeJrt?=
 =?us-ascii?Q?+WCwdAWC4XumG0LaFJjAF6SB3OFhG2o9aSF2737YsrT+mLx9SkiJeYIhdDOB?=
 =?us-ascii?Q?u3UBiH5mqkNtXJIJMFb0uhtBvqffmyh/ikBCmzLt0iKlidkpXQ7Db7Yu4V69?=
 =?us-ascii?Q?eRhCY+h3zR7vuK1sj3Itvy1jW0HHQvMLrvfZBUmVy0bGsIA08pQ+8tw4UDHO?=
 =?us-ascii?Q?ypWVasv38dqx12S8jtygG9RknCqP4vMfVDrE8Fcr36HOQ49N95DoA+lR78Xo?=
 =?us-ascii?Q?UDLu/Osq6ENdLK9BILRacPTwCK3xCAl1+Tp5SOXGyMPCUjH6ugTEnAF7QhpO?=
 =?us-ascii?Q?wXcBUKXpI4EoeFfrpYqI0iQZDGU5b1CUQji44XG9b94txhpF2ij3RQPZH4nM?=
 =?us-ascii?Q?/FzlbEn7OKPJrtemvUIzzL7GsLVwzCcVTS+mkgFFuJGzK2byE/TWBsXomJXp?=
 =?us-ascii?Q?cE40c5dbaccTABd1E0nPSYbIUeVfnkTMKCJLv1WJWXDysUECAh5U8EbrEXfz?=
 =?us-ascii?Q?Hbsc0vm7XCld04jNDnF7bQ2SkGamysDu9wWLu98Ox9qWIOwT0RqJS5TgdRgH?=
 =?us-ascii?Q?lvJeUV3du3izI2oi/XRBYCXlOttNjDPSVbUV5E91xiknyBWFLmrXeNVLqWZ5?=
 =?us-ascii?Q?rzx5VWUWhy63/vTfnhtSPmRAncNKOKOkHjd6FhDnvrWu6l/N+4ZG+P5kxTMa?=
 =?us-ascii?Q?AqhOuYhUkH5kpiHvIrzCd6bslIWWIddEU5LN9WfNYLibDR/eQ9yn4knXmsh0?=
 =?us-ascii?Q?pxsbJhEq6wKgXdfjWE+H9xJ878O+Pa4bx+IwapDUQO8ju9+mgpI7+Ov0B2BG?=
 =?us-ascii?Q?lvPS0oAv6RZCQeT47yLSL4It0GniCykJE6V/6dBvxd8VNSNLY9e0DofaUQEN?=
 =?us-ascii?Q?Xz8N7p6bY2w54MWvZb05Ri2lh+GGwVGEnQWDpUETSRhswXpuC2/iWV14+Vqm?=
 =?us-ascii?Q?YAHHdN7VLvKVxlbqOlYgWQzRij07AnAM0biQqgmzJpKwMvErlutRJ3DPJ8xE?=
 =?us-ascii?Q?FeVwqSCdxmr6dyfsdOJrmSu+rk1XsHWjTrzujiGFQI4QGa9Gifhfwoe9dKwx?=
 =?us-ascii?Q?mV7JulsDunBkOVE0gsdgciDdjDs8hT8uVgie6G9LF4a6MrvhtlgEFDxIqobp?=
 =?us-ascii?Q?xmouL3v2IYNTD9YcnAh5iyu3DXS/3REPNxExPQhFyFQpadj+Qx27gK/p60ng?=
 =?us-ascii?Q?aKC+nS562WOymZuoJbv/Tkg1gGDR7/r9YCN9YzAdHKBLBM24oIYxBoJKpp2c?=
 =?us-ascii?Q?bMrEOJ21SAq7L6Pmrzk2odTSBoZGZMN8SG9g0nkPLIquoIHZs51PhOC3B+Ej?=
 =?us-ascii?Q?EWkQZ3jO7h/STds349swNcdMPtSNZwlFuK+lRm9jYdUbVlIbO7XD7EHoGViF?=
 =?us-ascii?Q?NDnLqsYaf+ajt+YesN7dn/la8UI7ZbVtAi6Swb4aD9hFbXHpfRqYXP9krhsn?=
 =?us-ascii?Q?DAwLPoXiAH1HpHgcmKOSxv+VnJ2geWAWM9aTP75cfjglah7x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbc6569-66e5-4d38-63db-08dea53a4f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 15:24:59.1673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q68oycKNYc/1VV/w//tcE2N6xMOoX5Z0M9k7ZZSFmx21pO5ehKRbCBPgj77YmIlUhC84ljVVTVm/MT/ZWSsUgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_082511_273407_66DC4297 
X-CRM114-Status: GOOD (  15.04  )
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
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Monday, April 27, 2026 3:49 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij <linusw@kernel.org>;
> Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
> > > struct virtio_gpio_response {
> > >         __u8 status;
> > >         __u8 value;
> > > };
>=20
> > It is the same message format. Please see the message definition
> (GET_DIRECTION) below:
>=20
> > +   +-----+-----+-----+-----+-----+----+
> > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> > +   | 1   | 2   |port |line | err | dir|
> > +   +-----+-----+-----+-----+-----+----+
>=20
> Sorry, but i don't see how two u8 vs six u8 are the same message format.
>=20

Some changes to the message format are necessary.

Virtio uses two communication channels (virtqueues): one for requests and r=
eplies, and a second one for events.=20
In contrast, rpmsg provides only a single communication channel, so a type =
field is required to distinguish between=20
different kinds of messages.

Since rpmsg replies and events share the same message format, an additional=
 line is introduced to handle both cases.

Finally, rpmsg supports multiple GPIO controllers, so a port field is added=
 to uniquely identify the target controller.

Shenwei

>        Andrew

