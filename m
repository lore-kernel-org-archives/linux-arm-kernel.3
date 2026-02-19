Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84672E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAJzsSbFYSV0mo3JnATjCdFlJKmKAfw6B/Pp/mHCZOs=; b=h0gL6jxExLY8Wrcu8wi/TyhsJs
	QtsYHRssXd4ZONWtdadBNDZC5HXp+QzpllCklufWqLXhKbKBmS4R4r0MdTYsM6+qtL5lWq4lYB+qN
	4fXvF1TZa0k/m2P38eRP4g2bgmSn1+svdJ3/5y5ERz7ZsmeuMM1/iAM7YMy6ZV3NRqIEHLgYeBn/p
	gZfg9Ukob2/99AGwCYDldQh1a9ogB9DA7Wh8TZTFFO5WnvTvgsEPWYarRCzkeEmu4i8mcp1CoyoSE
	IsdwAPTRrHJ4JAhCIEmsJUz7owpSNGq0ivYhq72Id57rNBmOC7MosCUNlJxFnfVUgYc4zXYaPyDA+
	eRA2R1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4qT-0000000BRLF-1Vqj;
	Thu, 19 Feb 2026 14:17:33 +0000
Received: from mail-westeuropeazon11013033.outbound.protection.outlook.com ([52.101.72.33] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt4qQ-0000000BRKF-4BYt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7tZvGfwxxYsdcPFUulovsr5PRyt4YkN1R2NYMjRFvAx6Qq3QcmHuKh/M31765tq/VGao4EnVK2SxvyJ0mpu5yGULlkU0dSLcxgQRaYjFEUFT0ltSLrRl2jiZNaTr3Pc3jWz/XynK32KBgadOQocQyyAscy0vHAF8r165+6N9djhxZOK2iWC+DGhoapvvC7DHQ7aGUaqSMELTcLXmytfI+sbKS8ATbNGYDszxbTsUA1B6cy2j8AXjEsbXaFemSB6gZcB6O5FXWdd2j2sIKvzOuIuLo/weRRwf8mHJLbpXKFwnMnekK8QvO5RVHFHyGHlZTr1TkxaXgUkUISr0OTB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAJzsSbFYSV0mo3JnATjCdFlJKmKAfw6B/Pp/mHCZOs=;
 b=NJbv5p1JOEHRJ6BHskFFOx4AjT7FMtgh8wOU/GTEY7/rHyeosHw5jVxtj3VNKiqIwzrIytg6wsBCpMDG1dra5iF1Gd5khBVrm8sASu6OLYf5WA1P9YBSQ8YezrX88HeINW6ZJdD4s+7wFkKeYdLhwDtkG2pH8q32OfsiKWnSm87cAiXtbG4TMv0MC+XQLIMrVaocyrpwVVfk6bKLC3GzXk4oMblXFPk8zlVLk5OsKyzVUv7flXGxiyGo+DWIDdLSqqNTjsgoyfbckjnKlkE/7HuOM//gUaGbFptV9dP6ov1Y3995DslKZNERIvzUs058QJ/WmOUjMMQx0KOdiCXBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAJzsSbFYSV0mo3JnATjCdFlJKmKAfw6B/Pp/mHCZOs=;
 b=McisqliUbROABRe6SkA1w+BE0rwkPr/OFWKcszJJHiXDjaZ0Hq4B8gApRLNl+G51y5jjloUGwMpin+Ux6cmXc556y8NNoMzHKRT0OcoDTxXO3/212v0U/oODJO5xEBJef/PTRGfcJLnOf1mwSmMNJohQNZ3Ah16AToltp6OurszOigjiH5/VEdHIHLiUh6zTcB9qUAd6UKdWWbIOAXzuKd4Mfc94KwVS9ftZt7mIVD2dotNcDqBC5lw20/ZvRq6IqasEPFGQ/4ZDE5IGtl00NBKMSdzHvQpZvWh9S2LtbGHxzTaAo5VnVOUolLog30LvG2AZyv7+PdqJ/Lzf7fotCg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA1PR04MB11384.eurprd04.prod.outlook.com (2603:10a6:102:4f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 14:17:26 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:17:26 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
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
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcoap5g1PdfUk0tUynC8pppyXvGg==
Date: Thu, 19 Feb 2026 14:17:26 +0000
Message-ID: <PAXPR04MB9185EFFB8C73462E215EF486896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <44804825-5e61-4c3c-96bf-e5a3f3eacec1@lunn.ch>
In-Reply-To: <44804825-5e61-4c3c-96bf-e5a3f3eacec1@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA1PR04MB11384:EE_
x-ms-office365-filtering-correlation-id: 167057d1-498f-43e4-5dbc-08de6fc19bb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?444sAA7tAto1rG6upm51u2pA4BUDyWJ5dgKK6+JYiW9ivWh1g4LRP8s7IGGo?=
 =?us-ascii?Q?jNUlHtc38GDM0uQhVtWMvbKJNodzqFVzKMJ0WeJzQoQqUqZOkNKEvpE1T25P?=
 =?us-ascii?Q?/mHYpfE41n2pbj+uDvAOOp9RcwsFA2I+Nib4+5rhGUWQ05HmYOxNv9mehqR8?=
 =?us-ascii?Q?FtU2a25yw/BVihfipbpSkcASwD0SSrIDvzxmNtbk3IY7fBGARwaVkxl1Qjbx?=
 =?us-ascii?Q?mp6J5GLu2k+Hvz8cu2cTElpbFLys65lV8loLVO6vd+iFVRwBuhAA1QK1z63P?=
 =?us-ascii?Q?YFMgPfvM49ogDGboAWRp63ORqKLgqwBbDO6FLGYo5dEv1hl32CItgj//9Imx?=
 =?us-ascii?Q?8Tp23lihgRMQl6+RBKcT2rT904KT0bdAKMoWMDDRaEvOYYS4HvkImg8nweRH?=
 =?us-ascii?Q?UtSjS0E93nU7HWGDiZlB1iA7WbvEO/HlHhv1xGSP05n/Hy4LbNciFfUMTFA5?=
 =?us-ascii?Q?idl3t1MRWFIfb1l/EHK+wngF8l9xV+Smlqh0ueJe1HzboCfQVrL4uLFgsLFj?=
 =?us-ascii?Q?m2QNH462VWofzGqwKvWA5qDbGDxRg2Fm9ihgH4bqR9gSO2bhvgN9Ba6gEJRJ?=
 =?us-ascii?Q?sPbsCK10H2c+2KIqDeGNsEylwtuCSr+e1QX07zsCVKioGSJI6WFVrsAZJjQQ?=
 =?us-ascii?Q?ycKNBovCEYTgh8WhZvV5VbQ2HrYoDnTueHZ/vdKnXRTzZjTzVhj/boeo1Hmc?=
 =?us-ascii?Q?bB02KeVrMDR/gsdpDjQXYxcCnlUUlA9P8QcUxiRydXN8snU97EMbVKXCH+oF?=
 =?us-ascii?Q?ep1ksIVvr71m6GO5aaOk/TvYtm3/utxP0jIZVTFfZQTQkHlJzwe0kAmWLjH2?=
 =?us-ascii?Q?xfYgAIe/060QnL2jr1MSVB9S9w88k4Rneff2vSV86EjP4GdMZfq/lsYqOzeC?=
 =?us-ascii?Q?M6J9oa09iDfDBdaqk4IWTPaaQrzH47Zff5KX44JGs6JeDaO/CkVltzWoNKMo?=
 =?us-ascii?Q?n4lXn1kG6T0UpEn5+ast+olaW+2qS60sL3Gw48yh/TuU5lr5oMM3amOXLVpV?=
 =?us-ascii?Q?eNy9rv7fFhKBmPK0bIDAeLTIoPO7s5yv5LKrl4aZd88itKX7tFWRc3GEublY?=
 =?us-ascii?Q?9ApWZdgag2en+io0jXwEgU6EmUwEIhfkDjxQXjyomYklDISRGCNZY962HY4+?=
 =?us-ascii?Q?ysdTtbRxlaMq0wInJCd+8CaseBHJapfV1nQDMWeFjq0NmAIZ5d8nGaT63V8Z?=
 =?us-ascii?Q?W6O7PDCCO3Iv6mcnUh3kGm2wwOokSsKYvS5kF5KCFFsf4MYb570yUT2/ngwc?=
 =?us-ascii?Q?j/ygaWwGvu2n5zsYlS2paIZBeDkZcdXnyWxj35EQ0uDrqpPC1BDPDE/WqCBp?=
 =?us-ascii?Q?V/hT+tIGSARzOSf6AP8yogYS8NpgQCLxQ57GE9UvScVs4IUuU+AwPhnem+VI?=
 =?us-ascii?Q?GkitGe4CoAm3slCyvXg7NqZUtZ6Ee+mItjDvWeh9+cu6coVnXr+0/3QvkyIh?=
 =?us-ascii?Q?k0gh3x2WPA8kQoQLBGPrGK24W6hEQqqlCIWxa0EMTpdvuvNFAe5Mtrl8PhsH?=
 =?us-ascii?Q?BlO+QRl1bDxqC9p7vMj1AG2RnVJaT1P0i5ZKFo81ThFLwCqpT10Xwszx68Qh?=
 =?us-ascii?Q?QPITL4hdKOixEc3/almo99mwysePhv0lsk/PT0SXqeA17BM9WNqen8pMQ98D?=
 =?us-ascii?Q?Dscpcy0My/GBVkD2FRuC5SE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V090pyO2lfpznOAIAHxkFRC5p/jQnRPnPqacDB1wI07dPbPjaK4GSrNZmEAZ?=
 =?us-ascii?Q?Q+5dEB41mKGBhdcLNVmoyy196BEmECngfu/rytUg7TewWqp286BYmP/ADtzK?=
 =?us-ascii?Q?fM0tKW+OAFiqCb7Tj/akmdRXN/z5JpfLQvMGA2EzPIPXJxOYF+FfbU11gFU/?=
 =?us-ascii?Q?hoLbnIx4eJ7uGPinQG5AGJkeit8j9WJSf6PSu101/QygqRJU7K0V6UFaf4NK?=
 =?us-ascii?Q?RqCJwi9AfVubzVhJDUiaJEiuPFFSKlDUuBPJ+MHvR0RgopBCpJrzzmzRfQMr?=
 =?us-ascii?Q?kq0uFzj2+iY7PAs9/YiGkmoCqxVyxJQKwTd0Aekf6rIndGD101Y7CCbSa+46?=
 =?us-ascii?Q?FvDvPpk0xZVIEuMzJhjiPGSHr9GnPsQM6qWfc3jPDoFR0zx+R7FcmItlcByQ?=
 =?us-ascii?Q?+EGrcyBdGo8IOLdy9WOqIEuF8Ibtm5fzkcr/QOYd6EeU5ZNHsmZZWh+Q40+w?=
 =?us-ascii?Q?AcFsFe30kARXh9uAghq7U/HzJOZ1qPF2RuVfWT8iTxDAdh1eY/qj+b2fNlJD?=
 =?us-ascii?Q?X6LNf8k6wrBSA4EDMBOqM2M9YmdXDOUy3rzMKrw98oMwbvcJsHJMFMA/+Kd0?=
 =?us-ascii?Q?OkLfb5YR4ubxpt+hdmkMfg1rJ/tHY4NMw6QZYNo24H7ZrCwOpXQIfqKOgfzg?=
 =?us-ascii?Q?c7GhqNJQmiG3NNIc+W15IeJohlwSZ+uUix1TMZghzYj8QBYr9mWCAUpGu2gt?=
 =?us-ascii?Q?wI5+ii3iTUD8qFaeCiVXnY1ImQKpTt5qWBxpePk/tVJP0MYgXbGgNQnZdpCE?=
 =?us-ascii?Q?LAFKi4ny8IPbE1MPpL6/7NrG9PHXS+/DbcYryD1LuFv0zl6vcFfb6lGxspSY?=
 =?us-ascii?Q?TEiS6pMrYJw/dluIA6abTcGABjeKiJ4kpL0Q61RhyHQpCLxu06Xj67o1LOit?=
 =?us-ascii?Q?p1C9C0LW9r0hD0rGFY0x0Q2vL+OBBqNe9lJSt1X2EajS2bRfNaNogqvPdc8O?=
 =?us-ascii?Q?1gUbT6vqqfvUhYkS8xseNAmFFRRURmlg1thn0il5IljLWOVK+Rr5cQx6xgco?=
 =?us-ascii?Q?VslpxQh2D5H43Q334ktSTs/rUuTROisbpVqDKdkd3yCMtfmLlNb6VlWb6oiT?=
 =?us-ascii?Q?UURwvkjGBgyMCGP6lIXFuHzzllr2vbPbvUaFn9qSE+0BNlri/sPSMakGqBmG?=
 =?us-ascii?Q?OL/QPTTKx2oUbkSkHiEl5HnOFHovYW086zqWEX3bWwC1UGRsYfWmDeyZmZY/?=
 =?us-ascii?Q?odHYhYgnjSxIsr3UUtAHP0SyEz/PwN9ix6KYAr2TIN31EnlfaVe/WLfLwA/8?=
 =?us-ascii?Q?eBBkOp8O//IdvCnm8DlmfuqxnoTbRJ6Hw/BKsUdLwS6Up91jq8C92On7VXJL?=
 =?us-ascii?Q?WT86OrU9pMFgyADRN9rKY8snzmxZ1ydlhviTVQbbpP8+g80AZ8wtNCJdqEOj?=
 =?us-ascii?Q?a+9VUSM4Uc0c/tjerpXZtM6SOZ6eOCtAHwJoElzWXnhiAO8cREGUx6JgKqmq?=
 =?us-ascii?Q?FUvJNgBV09aoQL4ZE+0DNEFxc5DDl2eXXjrmjWfxDp3Ddx16X6HqBxcLAdT/?=
 =?us-ascii?Q?ygTwYhzdENIeaLplHaz2oBsIXMKqOLDsufQMr1dURhgYZwGB5NIyrwaRWeUG?=
 =?us-ascii?Q?/kCyOUagIhc/tSlt50sJb0fJf/RB3hbbc1E609Qb9RQ5/hGjiI11Rm9A7XFi?=
 =?us-ascii?Q?7l2G82jPO8nQMvD8ulE1Hhdg47IMrcS1GM+Ywy38JaOzheLScjYQTjThmjSv?=
 =?us-ascii?Q?jjNjghHiMAP/TZk1YIBUT5v2w94S2oJguArYw12IR560CERZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167057d1-498f-43e4-5dbc-08de6fc19bb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 14:17:26.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o63tU1OnPVvSdOh7s6MpuD++T3mwqRWoX37r+pVFmJTW9y3ZwpGFIPKij0ntSAA2cIdNNgpKvtNyU/8g3HY4qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_061731_089543_A868A2DF 
X-CRM114-Status: GOOD (  16.94  )
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
> Sent: Thursday, February 19, 2026 7:27 AM
> To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
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
> Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO dri=
ver
>=20
> > > +   if (sync) {
> > > +           err =3D wait_for_completion_timeout(&info->cmd_complete,
> > > +                                             msecs_to_jiffies(RPMSG_=
TIMEOUT));
> > > +           if (err =3D=3D 0) {
> > > +                   dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n=
");
> > > +                   return -ETIMEDOUT;
> >
> > strange condition you return an error if err =3D=3D 0, for redability u=
se 'ret'
> > variable or simply:
> >
> >               if(!wait_for_completion_timeout(&info->cmd_complete,
> >                                 msecs_to_jiffies(RPMSG_TIMEOUT)) {
> >                       dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n=
");
> >                       return -ETIMEDOUT;
> >               }
>=20
> This will be from a comment i made. It appears that
> do_wait_for_common() can return -ERESTARTSYS. I assume that should be
> returned to user space?
>=20

It looks like there might be a bit of confusion around what wait_for_comple=
tion_timeout()=20
actually returns. That function never returns -ERESTARTSYS. Instead, its be=
havior is pretty=20
simple:

- 0 means the wait timed out
- A positive value means the completion happened (the value is just the rem=
aining jiffies)

So the driver returns the timeout error, and the upper application can deci=
de how it wants
to handle that situation, for example restart or ignore.

Thanks,
Shenwei

>         Andrew


