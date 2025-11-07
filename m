Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A8FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 21:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uU/oOtAuSrcPqPZLUQjNRNeQBRpu9+PrYwxR7B7ThKs=; b=d5SqG/BHA+KORx9CMB5Z11jG+7
	6idXLkXYbaOmXDA0654U7RM9wLWeRCoJq/oGwwnBbGKj1BB5hHIEJIUT0Tlvdd2p7+NQaoMOr5l1E
	6JD43oStFZ793ktshHLXNwUxEd0toza9aWGGi1fQCaevcG6eNPA18VsM2CL4A+ORs4SHJhgB9QUzG
	tmXuB7rzUUuo7b9M0t2kSvXNXEmyuh+M1hRBbE9SWDMNIufSCsagjY3fUFCkjklkx7vj0P0lfM924
	u5IWqdxibx0pkx9fYZcov2AVLXNASk6AOg22KqpuYlvZU11cP17og0mKqout+RfsY4jn+yIRVbU6N
	b3EZouwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTwI-000000018xv-0oge;
	Fri, 07 Nov 2025 21:24:10 +0000
Received: from mail-northeuropeazon11011032.outbound.protection.outlook.com ([52.101.65.32] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTwE-000000018vs-3t1g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 21:24:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJ32H/xJMaPoMmxxswfa1rRdZhsDzArAeTS5MqH8f0uw6OgVzaub4v+ff+ZhUN0DkXGat60/Ro4froxG6FzNdf376IQcy6J+JEYW9qQh6Yv6EHh/SV8kLgAc1JqHJSErT61vSfTs15a6kh2gpk/hKNxS6Tlrr/thSJFz4a9LkwLOaOrUu0zBaUptO+zmqWkkma3mlpLSP5z+SZkVELyMhNwr1TEOm5d0Qv25bOWRyq6+5R04bhYe+JmCN9atBKTxyP9Sa6Ao60MFn56f2ZGrJjCHrShx1Ltcd6saWIiDAE6VKNjUTxWqG6+seA4oqbfCnMEFsqHBuGKZO7ECCJAeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uU/oOtAuSrcPqPZLUQjNRNeQBRpu9+PrYwxR7B7ThKs=;
 b=TPKLKQlnTfA3MO/b17Gr5C1c6HQrct5QDXA3ytfMQ3ZIbb/ys9FDPX4qaTBOjaoE3Y/7bZvnGHw4jpxWAEIdXBcnBrWH/2NPowVjbfMf/iqaO+lDow+iqW7bmkM/rEyQU+Vl7mQW2R451yrSjnYhBg9FC9qMns3w4vyXsrR7JhhKdnmIM8WcVOTc6PFY3OAtF3Sm5U7SHyydza0z+/VdVKEfCqdijc7mwDSgfv5iWYcRNqZgyEKyxUHSW1amxeknypboM7n03+gTDmal6nlpYJDQ0WkkyVo4esRakVBf4BIaVaJ1iRuJyEVG5xmdWBALObj/yFrxVld31KcuUPVZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uU/oOtAuSrcPqPZLUQjNRNeQBRpu9+PrYwxR7B7ThKs=;
 b=n4fISdzbWGa38gPm74fgNRxp6L8JgKyXywS7iFK0swp1w/wYDrtMxiBh2tcZWpEEThbbK6NCf20/Aw8v80SyFuiynJzGVGB3yUCBhrg139OfdnBtnHUJV+D0J/IrHlKjWyv5hZUmhIqKod08NMumpUNZlI4wEh2fblCsiexZLQZFKDAak1QeKG5rPMeUTIrhWVqOFm8+mFoYDd+1kO1S0q/UlyUJVhtMeCKfCZDGP+D0EwYpU/ce7gnol+Q+FxpjiOAHc+kfRWdBayYYUYnN8Wyi3qtXZovmqmwVsfL2lTTehuy64/6txV30k5o7zQJj6ntf4PHgJHTmESKshCRDpw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU2PR04MB8727.eurprd04.prod.outlook.com (2603:10a6:10:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 21:24:00 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 21:24:00 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet
	<corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Topic: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Index: AQHcUCzVjIrQ/GjmqEGe0Q2kpTl0+Q==
Date: Fri, 7 Nov 2025 21:24:00 +0000
Message-ID: <PAXPR04MB9185E2C3E50D365F64F10E3A89C3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
 <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <cadcbbc7-2024-413a-8e9b-bde5fa233df5@lunn.ch>
In-Reply-To: <cadcbbc7-2024-413a-8e9b-bde5fa233df5@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU2PR04MB8727:EE_
x-ms-office365-filtering-correlation-id: 987a0fa2-6733-4bf1-b5bc-08de1e43f80d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?GCUqt/TolqFuoiEjOEk8QDh9NExXkZW2TvWEsxcAKLtcqEq9KV8ZC95gRZVc?=
 =?us-ascii?Q?/ZIxKrU+rV0xZBV2QDx8v5mXksWjNNC3/+tj7c+du2LYAvGxso91uBetfdGu?=
 =?us-ascii?Q?5dBMpZ/XzcnWD5TGOXJAumJS+qc+nzwoOA3ctrL9Gl936VScRmt9ngOnfffe?=
 =?us-ascii?Q?cOapYLDIusrxUAnM3f7XKBAyM6bMKldC7nInXEfw2nQFgbOU3VGa14qLlOcZ?=
 =?us-ascii?Q?v+ALof/L8qowfjo6b+gFz+0Vu3n8sqD8gZ7miTOQT1RqYeD7jS2aqjfESg1v?=
 =?us-ascii?Q?C1FqoP4xG/pkCU0CmQnHHoBQqiQRJjzscXD7uiKd/bVx3MlHbczl7Wor+G5k?=
 =?us-ascii?Q?GOOzyK5nDumkTmZbYHkvZ8W4GEaNCWYU898II8VDmxZYN93kOxlw7uIrsJx7?=
 =?us-ascii?Q?ISztBsVWbqHjkIrh/SUjWPASvluwgCZOIqEh/oVvQHsOZDyFztsc+9eIvD2J?=
 =?us-ascii?Q?R0U6VIZCk3vmj+Vhjyp6PSxrm3UPM2NNZsDADauo3taLxD+VokT7PR9cLFMm?=
 =?us-ascii?Q?jK8+cyzBoRU+vS3A/L8HnF05rpk1fdTzWulMdlAFhCflxyt3vBoPUDWg+4wj?=
 =?us-ascii?Q?5PVnPDtrICXg7Wg1rIuFOEWzdYll9XB31PJqpDOmAxvcCd4hcapOy+az0lsd?=
 =?us-ascii?Q?eySlYoJsZFi984qTbwc758/fbTNwCRPR/36wBNmdQURBJ2Wgs0knSABW9WdP?=
 =?us-ascii?Q?T/EglyBcZx3u4fbFdI+If1/Oj1uruuPsACyl3uxLNeOhl5oZYUfombN8+yih?=
 =?us-ascii?Q?ecL0CSHcDauFNmEgO5Rs01epeCXXf8YbXBtquqqq1gKwtYojJelPWjZintIa?=
 =?us-ascii?Q?ylFxsPJybFV7toTQRuSHdk59vlWkfdebttzmbl6nDtcMgWOXMGadw0HlFPJz?=
 =?us-ascii?Q?ibTzsjK1nHwbtdKs4h4hQf/QOb2yu5sB5Pnjp0tp+rzRYJ6ZIMdW6MaWkz3D?=
 =?us-ascii?Q?b0K1dKBaEeLFnuH7MlWTza3iPyaHcz7B9OCHQaiC6DsATHutqFtOFoxdKiVK?=
 =?us-ascii?Q?Vqj5v3K91rW+SNWvkAHSUe64HCLadEvNvSDyVzmOJSoP3YWK0XDZ1Dq0KePm?=
 =?us-ascii?Q?EpkP5JBIa6009mvm79bRMs5Wm4GLgElRwf/nejzX3t02t39Y0KprI3oe/X9p?=
 =?us-ascii?Q?KrRu5bzSOSTgH1N6jjQa5xWSATrPODS9/nKuNJmqD3Fi+Wd1DxpSo2pyNNOv?=
 =?us-ascii?Q?0mIJU4cZA2QYPvQRMq/+2oaJHC+De+iQtUOo24Dl/aUNwWKhQrWCsgmJY5do?=
 =?us-ascii?Q?w4sr3f2Tf1LBvAK9UwqFi5Hb0TKyxvmyA0xJ6MS8Utih5IcvNowhkH735iS6?=
 =?us-ascii?Q?PFL/B8pHTOybCfw9UavS+HnLZLkJNsXRa7Gmwp8+fgr/xkDQGbIHp4a/ax6Y?=
 =?us-ascii?Q?vR6uRHNoy7rhfPZ2NOa1dSEF8/AS7mlCwsQyZQRsQYKKtmoECY2epfvzz4m8?=
 =?us-ascii?Q?wKV+LDOz2zjzsiZIyMR9ZskXx447RiiEEu6D0FRaZr9yvzn3k5QrdBP2WuOo?=
 =?us-ascii?Q?kBr2BUu1A1Eqg+47QlZj4S4bLUu22ycYj+RI?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cjJ0fgCZdiAa8FlpQ1g9QKYgsMVVeUc+tx0yY/vkH5quNA/jtBgRrAfVYfGg?=
 =?us-ascii?Q?E+5A5FJQT0BIj6l48AkIXDEnkJXUX7JvdBUFehRGk42HivdGwz1cr2iIlxxz?=
 =?us-ascii?Q?XFVH6BhKqC2mjB14aaCQoKWGXh55bltSUC6x1kevbJS+PVBD+M3Dx1h1mmGT?=
 =?us-ascii?Q?RAggEMsnA+x6HcPwIKlariozx3r+PuWKEcCbXfsGZsSGDkQ3fJbKZN9AKBHA?=
 =?us-ascii?Q?HdGog0nDs9thLm02+RZ+IEkHis5jlCWDndZu275iXXtpwPfM8QTArVtxfW4Q?=
 =?us-ascii?Q?eXuNPOs1LteGjfpOtbBhxgLC4czVUHnFyqycQPnKhdpWUUbQaXzrxRYqt8zJ?=
 =?us-ascii?Q?ovUHnS+EZ9C3nrpKgKDT++iN0ZI4GD4uezt4AM0eQlSW6WPUCQbUwGJSmTW/?=
 =?us-ascii?Q?Zh7uB9pzG29xJx1883FbtvqASCAegC34E5b5WS/TT5jh0S/u+bUT7n0eU+NO?=
 =?us-ascii?Q?5MmujSFBlGZSElTSJlss73kNihQkZt8+3f4ptL9UmPpE9hclKPuPLbLyK+X4?=
 =?us-ascii?Q?8esA3BVTEWOAsTkK7k3E02O8P/IbFFbRhpcYI8BwEF3i/p1QkioTgTCjZxQC?=
 =?us-ascii?Q?8o5q6geuFZHFXHow7t+NwLesgU42o/cKN381A/ljsOsLbOSsijWvnG/GEK1X?=
 =?us-ascii?Q?bHCmFes18wepYdPUOfXEL3JrJjyyQbvN760/jvz58od0nkAj+ocwoJvzKQaB?=
 =?us-ascii?Q?s+MllYDSVc6Iw1jfqBCXNNSS36bks1tvTHr6QCpibtQ6Mhm4qpYTsPCqAbYz?=
 =?us-ascii?Q?xGHbeyKpjHZKxvMeSejXUZDWpoDbXwRP9z27mPIrGNHx0psuYu9LjsaCCncd?=
 =?us-ascii?Q?oyHKMjSHpIV5IYR/V+6qi7+D4F/qX5yEGEwVZxWUnBTfKoajyivGcC+gv04T?=
 =?us-ascii?Q?aovxwG4b0yd42B/lP38Q68W/llxXh62AyP0F5PIIMpCBVKaEktgqlcA0+9lW?=
 =?us-ascii?Q?TcgNEHCehT1agghNYxdEiRKZ9AgAkb78X+susWIHRzltWXDilkOGphrG/iZ0?=
 =?us-ascii?Q?176mZPO3DA8FLfqN48TsdTiuz++aPexyNwcw+r+DCnNKcw1d0YV0xPDwW4Pm?=
 =?us-ascii?Q?wC5BW/TtNFvt73kb9ooV5jVPbbMi6FrvCkqYu+rwCg3vJHdQYe6TMzuwW+QS?=
 =?us-ascii?Q?2TfUGxFe09wFsOzYEnoHMRuWyhso04YwtwAief5NM5d6f3QCQNz5X0e6hEJR?=
 =?us-ascii?Q?apKPK0eTBNaQx8ayG2AmZOIVRyTLFNwMIDcWbaoYnKDVhgZeYUVKt8D1MwIB?=
 =?us-ascii?Q?uE9YJW9RkVbIY52a8yWcq5k6RnkGQgpNAjJAKZ0rFOdnNp2ANiJf3PBF+pNV?=
 =?us-ascii?Q?KwQ3g3qwGXbwH1x5IEAmPxCY+GWk5WYLrCww9e8N/nRGK/urcosmea8z95E9?=
 =?us-ascii?Q?oY4ova+l3Id1CyRtsQqANZQy4J2ptm7Ez8jyKPsPAxOf4+d+Egm3SLkded4Q?=
 =?us-ascii?Q?u1H8W+JLSN0bqFWfEAkkosndEb1QvUELTL1ELOJJtONuYTeFOHXLEDrfNTXK?=
 =?us-ascii?Q?+M4GFkUB37gjQch96ePSvzaXPnbon2GBdV0L+8cxe8tFIs/e2H7zctWrjZU7?=
 =?us-ascii?Q?sqqA8/RygCzX/tIAEqQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987a0fa2-6733-4bf1-b5bc-08de1e43f80d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 21:24:00.6429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1Lx9qMpC6tLWvYXOHKMv4BhI/XJONkzC30RZ5r9R6hPLT7K/rDuUH8lBHKeN5rvSHjDWw1lvjj54oK0gtRn7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_132407_127252_FEE02DF8 
X-CRM114-Status: GOOD (  33.24  )
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
> Sent: Thursday, November 6, 2025 6:32 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Jonathan Corbet <corbet@lwn.net>; Linus Walleij <linus.walleij@linaro.org=
>;
> Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rp=
msg bus
> >
> > The power state of the remote GPIO controller is entirely managed by th=
e
> remote firmware.
> > The remote firmware operates as an independent system from Linux, with
> > its own power states and policies for transitioning between modes. The
> > wakeup field is solely intended to inform the remote firmware whether t=
he
> GPIO line should be used as a wakeup source for the Linux system.
>=20
> O.K. How does the firmware use this information? How should it change its
> behaviour?
>=20

The remote system should always aim to stay in a power-efficient state by s=
hutting down=20
or clock-gating any blocks that aren't in use. In this wakeup scenario, if =
no GPIO lines are=20
requested or marked as wakeup sources for Linux, the remote firmware should=
 put the=20
GPIO controller into a low-power state.

> > > > > > +Notification Message
> > > > > > +--------------------
> > > > > > +
> > > > > > +Notifications are sent with **Type=3D2 (GPIO_RPMSG_NOTIFY)**:
> > > > > > +
> > > > > > +.. code-block:: none
> > > > > > +
> > > > > > +   +-----+-----+-----+-----+-----+-----------+-----+-----+----=
-+----+
> > > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C
> |0x0D|
> > > > > > +   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0  =
 | 0  |
> > > > > > +
> > > > > > + +-----+-----+-----+-----+-----+-----------+-----+-----+-----+=
---
> > > > > > + -+
> > > > > > +
> > > > > > +- **line**: The GPIO line index.
> > > > > > +- **port**: The GPIO controller index.
> > > > >
> > > > > There is no need to acknowledge the notification? How do level
> > > > > interrupts
> > > work?
> > > > >
> > > >
> > > > Currently, there is no need to acknowledge the message, as the
> > > > interrupt is managed entirely by the remote firmware. On the Linux
> > > > side, a single notification message is received when an interrupt i=
s triggered.
> > >
> > > That sounds broken.
> > >
> > > A level interrupt is not cleared until the level changes. The typical=
 flow is:
> > >
> > > Interrupt fires.
> > >
> > > Interrupt is masked
> > >
> > > Interrupt handler is called, which reads/write registers in the
> > > device who pin is connected to the GPIO
> > >
> > > Interrupt is unmasked
> > >
> >
> > The sequences you mentioned above are managed entirely by the remote
> > firmware. On the Linux side, it only receives a notification message
> > when a GPIO line is triggered, which then invokes the corresponding int=
errupt
> handler.
> >
> > Since the interrupt handling sequences are implemented in the remote
> > firmware, the Linux driver can treat level-triggered and edge-triggered=
 types in
> the same manner.
>=20
> That is wrong. Edge and level are different and need different handling. =
That is
> why the GPIO framework and the interrupt core handles them differently.
>=20
> The devices i mostly deal with are Ethernet PHYs. These are level devices=
, the
> interrupt is active low. Within the PHY there are multiple interrupt sour=
ces, which
> all get logically NORed together to form the interrupt output line. Talki=
ng to the
> PHY over MDIO is slow. Sometimes you need to read multiple registers to f=
ind out
> what caused the interrupt and clear it. So your initial read suggests int=
errupt
> source Y triggered the interrupt. While you are clearing Y, source X beco=
mes
> active. After you have cleared Y, the NORed interrupt line is still activ=
e, because
> of X. The interrupt handler exits, the IRQ core reenabled the interrupt, =
and you
> expect it to fire again so that you go handle source X. If it does not fi=
re again, you
> have lost an interrupt, and potentially the hardware stops working.
>=20
> There are also other use cases of level interrupts. You sometimes see two=
 PHY
> devices sharing one level interrupt. You get the same sort of race condit=
ion. PHY
> #1 pulls the interrupt low, triggering an interrupt. While handling it, P=
HY #2 also
> pulls it low. When the handler exits, it has only handled the interrupt f=
rom PHY
> #1. PHY #2 is still pulling the interrupt low, and needs its handler call=
ing. So it is
> required the interrupt fires again when it is re-enabled.
>=20
> Given the protocol you have defined, how do you tell the firmware that Li=
nux has
> finished handling the interrupt, and it should notify Linux again if the =
interrupt is
> still active?
>=20

Okay. To fully simulate a level-triggered interrupt, a notification reply m=
essage is required.

Remote firmware sequence:
Receive the level-triggered GPIO interrupt.
Mask the interrupt for the corresponding line.
Send a notification message to Linux.
Wait for the notification reply, then unmask the interrupt for the line.

Linux sequence:
Receive the notification message.
Invoke the interrupt handler for the line.
Send a notification reply to the remote firmware to indicate End of Interru=
pt (EOI).

Thanks,
Shenwei

>         Andrew

