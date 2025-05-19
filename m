Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4643C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUdWQRoW2auTukb/rV3QimySLTPIL+Hthv480dqyGXs=; b=HgI3xExuWTf71ejeJRp8vE0naC
	ubWBSj6hmgeu6cnvPeJ9rhxeVQxE8vND9Z4jZ9dumJhSl4eRMhCynMVwACW9sLWh9BVlwg8vnO/9j
	OnqeomZOnmPNLAZy9Vsz70a312VhuChqAgjAFWHBVfeEu4fSnrDgjvA8L+N/9Da3z1GCsLSs5iwbo
	qufwXYAFzwWhG1uA64xpTvNh/L44zehBIaJbGzaLwjuT+Q4cA5WkiYmO+iDx5Wks9oT6ieo2l+/RQ
	/K/AoSBYUUVsWc/uo5oknoLXsSC0nArbmq523fKjpF5HloHeVEoEVYsyaWo9qPzaT7APjluqvz6wb
	zDBYR0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH09z-00000009Er7-3a5t;
	Mon, 19 May 2025 13:04:03 +0000
Received: from mail-vi1eur05on20605.outbound.protection.outlook.com ([2a01:111:f403:2613::605] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH050-00000009EDC-0EJU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:58:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXMAHuKkDzqx8Nvoh0iQc8Obwl60kYOVDcvClehJ3vlKbfEmjrflkF2h6Qend1rM7oIDaOLakOovBaddE/drx045UefzuaqbWJ8cfJsXSd5sKc/yrnjlUrlX+hbOcvOxzTxeFol7KpkAPWZTbb2z55KkGb5NCGVuaXI7hx4SrkhIn5o/qrsaN6GSPix/CFcjcJ/50XvkVbmfTgHQy/IWCZcBCnH9XmneV4EzkYhDjKgSGE74ThQBqLzRLpNwqBOLuwp8WcE3jcMrX+BKLaLwA/dEk5GXOGChBnDhO7cC4+o6noA7QwDYBtV3ZmrLmgbfSFxOf5/5tx6ZL4xrH/z8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUdWQRoW2auTukb/rV3QimySLTPIL+Hthv480dqyGXs=;
 b=yjJYXCngUgpOVbdeQhR7HplOiLAuRfFaeqMoi7gElkb2MCFflvhVDFWEiYDMysS9uFnyN9mCIXkxDgFcev19OfBNEYmqmu6grM4qr9WqGqVU5vHl6+heEkUUzkOPDFCyWVbWL9jAFmgcK6O+U01uMRvkWsEsZh79ZqOcbztXKtdmNb+aqGXFUVAw2nFoMtMoi8uKw01/Q/pqP0D7QqNcf+XkHTUKheg3aBdseaBCRgYpraHw6aQAAnnRGDciXFWm0YU7KXKRQ/kl54nDq8/AH2yeq+PQA1uLivdgsPsIPtrvLz6gLLXdYeprkXQKEWDxOCQrIb6sG5hoL+dE+tryGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUdWQRoW2auTukb/rV3QimySLTPIL+Hthv480dqyGXs=;
 b=bTHm+EAj7LW1kzB8xNMDNYK+GZPofvN/lIAwAF1fn+UDMhWts8G+xaUeebC7F+d61BylUGvdboCbsRpzwYHI6ENs5zh2ioq2iBobuKIbn07OGM3E4U+USckuSiI4F1+6pYMgO7Yoc7KS97PPPLa7LbT5koVTq2jbRre9JzvhxQjLR8RcR+MxZ6YNMOfHZJsKSBK47XxtPdJapyWdu55kd4ujRoxfWdXugr6Dakxpy7idf3aZsvLKke0NdppI2iOk7gBr31pWfbawRDNZPkH3k9vWvsL4u+0pFSrIg/DYeZ9XM5uoDKy6+bk7zNy4Ks5Znneg2pDDrPbSp3OBcCzNhw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:58:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 12:58:49 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
CC: "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
	Mark Brown <broonie@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM
 platforms
Thread-Topic: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM
 platforms
Thread-Index: AQHbxmlndbo5DRcb3EWQwqZj+VRMErPZvpfA
Date: Mon, 19 May 2025 12:58:48 +0000
Message-ID: <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB8PR04MB6986:EE_
x-ms-office365-filtering-correlation-id: 7b31fda3-594b-4d73-0ef2-08dd96d4e5fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?hKV4Oh9b1VxowzIgAOfjsOew4+/m8hwbpFhrB5Uh7LcQUrZzSwb3V0Z5PQZv?=
 =?us-ascii?Q?BMpfCR/qcSd94mn3Q8eSSMXBVsThiTcEwb3o/EQB9kVE3xrAyNoFp1wBPVii?=
 =?us-ascii?Q?1xvsQcAh9TlPVwqSeQbnH30801X2wumnSPVqKCk7bXe34kh2LNoEniF2O/7N?=
 =?us-ascii?Q?PqZ/2PkV4UFp3yABTv07VoHcno+qTRzmlzwOkss2ZK42W5QWO5OtHuGMl7l0?=
 =?us-ascii?Q?y8xOTc0GPHIs32YC6/gc13x4+OA8YXxKmlTuE0WJYvAycTUfKLvrh5LWjMd7?=
 =?us-ascii?Q?uWluHyTaokLjIOR1WlK/DVtK61V4zR09B+3aONpupNLjI/7OzmmisFWEj4np?=
 =?us-ascii?Q?TbaJvoT/vwyj6525fDfPuTI/PTPOKKXNJuDMbqo/fE2b8ix57Z41RQ15Vdbu?=
 =?us-ascii?Q?1uDxHNiae2OFli5khP4KeoZzhZ5SyehPhWSWNrt3yxAQZ02KJi2A9hl2pzXd?=
 =?us-ascii?Q?2uEmmBr3PvruqVi2OTTaswIg4yG3jEIZ4TXFrX1hcXi18oXjm/hwTLwGWX7U?=
 =?us-ascii?Q?5B7qG4zAnc7/EPIMjgJ37jDOfsDjtCilwPlLbG7wxB5zXi3osI1MVAqV1HgP?=
 =?us-ascii?Q?VP1q7PnAbTQlVQo8MKiOE5kgjy1cy+WWaDG0ZyBIK0r0aeWDp8bHStoPgWbe?=
 =?us-ascii?Q?9p7yISXCoSXr62jzzMfZcGI/H6yBKVzGU5iM6AdI1C6bfTzbvEGFj0/apqR1?=
 =?us-ascii?Q?VuAZrYWO1pzgYasnPkJDNIOYf3satOmVsqwHWgEwTc8vxG9CQSySz8ucvuis?=
 =?us-ascii?Q?cPHBZMmclRoiel9QcZV8jA0xSV0Yx7mDKsrnCitrcTsfznKEe1RPbqD/aSiA?=
 =?us-ascii?Q?GgQqoNNwjprpQqfuxVdvlotzT2t638JUU6H2bYVYvx6iMMjkk3sFtZbVcNdF?=
 =?us-ascii?Q?GWUecaD2B9NaT3WzM8iQxGYuodHCdyVWUDYifge0ydrXuGTfY7pHIc+IT4X3?=
 =?us-ascii?Q?wl/aoLZ/pKZmRxeE4emE8CpF82QnfK5e2Umzt5PwNrOQBBEehOy1OPJvubyG?=
 =?us-ascii?Q?OKqsIiywa54nFZ8K3+OPcfWhyrvDnuAqgC8QFQryyy2MPy2D+8s8CwsDDL+n?=
 =?us-ascii?Q?G1/WAjbW9jdfs+jwnBmK0gWHT18QZQfMnHzfg+JQBqk+ZDcfa0htY4F3k7eK?=
 =?us-ascii?Q?bOF9YIrGvxPIx+fCKYXIhlUDxzsdG5E/UdRnQ43620y40fMZT4Y98jzmpiUv?=
 =?us-ascii?Q?LzQxXFYUStA5CmQieUQHpSVQkhp3NjSJV2WE9PvVzKUH9UFXtHu4j33HmWOH?=
 =?us-ascii?Q?wJWJ5tUFOb7R3jGSn3XFeFNidlafBN33cQueAxyulZELNe6dsKOdy4k3dFxn?=
 =?us-ascii?Q?84mxB8ZZki54e4Uh1HDHMbCSPUNG+dVvgS2ONXR5vLAxEBNv4Gd+OytZwzs6?=
 =?us-ascii?Q?jzwCCcXoa1u0IZ5hhIwTEhgsyS6sEqX7r8AEuYGSKd8OtC/ID1C4pfflLtnr?=
 =?us-ascii?Q?Nllu7NMg10M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZG57gJ0lor/h3UJ+Gz34jp5azQz1rLLl18CvWJma2u3OwJDYrbNcGuSC5VLM?=
 =?us-ascii?Q?Soi2fj+PrHNdCAmKbnd0z/arf44936cy7w9G93z3loDayn5vSlTbk6aUh2hQ?=
 =?us-ascii?Q?4MLQnvi41UUKOHkt6qu4t7cVOTFSJV7Saxe0U8NyvGJy/cvkgLAm4rDWsuWv?=
 =?us-ascii?Q?dha8xjU8HPx8ApO++Dzb//gZUgih1+D7QUCXVPVIbVNceAEG/ELgsD0MTbW7?=
 =?us-ascii?Q?AnRYjQEPMC0cy5q4QkkOXb9BSH0RjE2D6mlITi8vOSRbQvdN0tTiR1f/Y7WQ?=
 =?us-ascii?Q?O4ReF7woI+9YQTnTRlrs9UlNHvzU3qgX6Xe0pVpb202NjhjgAfkeKiXFgWhr?=
 =?us-ascii?Q?60m51LijCoxDYCtsEqbIbLTUMt9EPXTItRGYtqOINiQtNJlZ2ZIIuxR5a0Ov?=
 =?us-ascii?Q?8PcpgNoxuFHnGpSV0eTF7wQJcdUJFIglz15ZA06tb9/tyiTAcMDUIeNYRvI5?=
 =?us-ascii?Q?jds9v57d21WoKeQ5A7aYzhMWl2r8f4w/1PHZmGZqEWkDd5cCa6gDOBQopYAm?=
 =?us-ascii?Q?ruXxz2Pl20SegqDoGQ+PuJcX3NQzxIolAa0Ea1O1xmBbaXvLHqoi8ys8Y7Gj?=
 =?us-ascii?Q?l49defOMGTNJYqj5shohvZ25Kgt5FEt5gEiwmVthArgwZmwDR6Q77JezbLZS?=
 =?us-ascii?Q?BXwWDxib8DL7GqcxfrLwkj0d0H0B6rFl3BzYcx2S9+BjtSx0lMemSEAi024N?=
 =?us-ascii?Q?m62Y78GvwGQdDRyNg5LgmCYpIa/QpxFcMtlaePg/wwExLIzLKCWdYtZ2IGuX?=
 =?us-ascii?Q?xVQ/NQUDZn8qFoKcBW7yaix1nmuAWfjjY950+kLTwtG5mzeDTmf6Krn0sf1C?=
 =?us-ascii?Q?X8Q0HR23rKgAe+RMZT4aeuUUYRq7ipCxurhsLEM/skVbp6fPbKNGTRM2i4gB?=
 =?us-ascii?Q?WW2y+VIHCuuPD0LIX8gEHrP/XNlQQ99IYlYnQiFQpmy5qOUPq4LOmrtP1XEF?=
 =?us-ascii?Q?aH24wuzsUF6d6pSnHqzjk+a4sXoaxZMhhcgDI/zsJ93dI5rytBbVRP2fX6Xi?=
 =?us-ascii?Q?uZS/K+R0mP+XkxyPYkXMm9UMPapI0x0TqvZ8OYtyiddOIh3OgBuvxJ9kbsA8?=
 =?us-ascii?Q?HyTWAtMl5jdpQN8NYX8l5KJtxSwe0W0ELQF13I2kG9InYWjOgikEMdjfC2lY?=
 =?us-ascii?Q?Ej9EHcPCCATaQBcjQBnKDVX+MoDZl9jkmdZ6KqKSdEiM2efnDNA9RWIlDMJR?=
 =?us-ascii?Q?UKXGZAuSH5ZlGx9jgkT91kKscexN6h9J54dtjiqK1Eb5Bzbkh4G6fMZDo1Tx?=
 =?us-ascii?Q?v02BuCo7AE+wcAPCHUtjcPM2/y8GQ+UWiMK02EqUF+qfb52gL3mLuJaAghgf?=
 =?us-ascii?Q?C/hHs6+Q0kPRmwwoiRS8ER8Bvu2RQVAPaUR3SpF3P9kOcTnc7hugeEoPiHEj?=
 =?us-ascii?Q?rxW7OtadlSUCcWN0k8JuYH7H7Jou/7J7HJdWESv3UEPq1e0OXKbD9Ybn7aRl?=
 =?us-ascii?Q?3D3HtChzHjGxxzqDGlQpzp3Gd0ZN74D8eo6dpNS+DpdF7qRaVQ6xPscBUQ3z?=
 =?us-ascii?Q?LN9MbEViFHCYOXjEwAWnXU39t9YjdfTG6iAGmC8iwQjvArcTUFaPm2YL4UIh?=
 =?us-ascii?Q?KlC9i1CUo53PerWeifQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b31fda3-594b-4d73-0ef2-08dd96d4e5fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 12:58:49.2098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GG+S+hbmmDVdcwpFiA8fVx19KbZwHEsO+JLZnbqskOeFetYiHlJHAbCQyk1lYb4pG8jypNuWTUh0UfhvyawiOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_055854_116332_30952D36 
X-CRM114-Status: GOOD (  25.03  )
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

> Subject: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on
> i.MX8MM platforms

DT Maintainer Krzysztof NACKed [1] because of ABI break.

Are we continuing breaking the ABI?=20

[1] https://lore.kernel.org/imx/6a28f9bb-05fa-45ff-8c0b-790c0caf3252@kernel=
.org/T/#u

Regards,
Peng.

>=20
> Commit 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop
> clock
> driver") breaks boot on i.MX8M{P,N} platforms.
>=20
> Here's the log for a board based on the i.MX8MP platform:
>=20
> [    1.439320] i.MX clk 1: register failed with -2
> [    1.441014] i.MX clk 2: register failed with -2
> [    1.445610] imx8mm-anatop 30360000.clock-controller: NXP
> i.MX8MM anatop clock driver probed
> [    1.455068] Unable to handle kernel paging request at virtual address
> fffffffffffffffe
>=20
> ...
>=20
> [    1.634650] Call trace:
> [    1.637102]  __clk_get_hw+0x4/0x18 (P)
> [    1.640862]  imx8mp_clocks_probe+0xdc/0x2f50
> [    1.645152]  platform_probe+0x68/0xc4
> [    1.648827]  really_probe+0xbc/0x298
> [    1.652413]  __driver_probe_device+0x78/0x12c
>=20
> In the imx8mp.dtsi device tree, the anatop compatible string is:
>=20
> compatible =3D "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
>=20
> So, in configurations like arm64 defconfig, where
> CONFIG_CLK_IMX8MP and CONFIG_CLK_IMX8MM as well as
> CONFIG_CLK_IMX8MN are enabled, the driver for the i.MX8MM
> anatop is incorrectly loaded.
>=20
> The patch fixes the regression by ensuring that the i.MX8MM anatop
> driver only probes on i.MX8MM platforms.
>=20
> Fixes: 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock
> driver")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>=20
> ---
>=20
>  drivers/clk/imx/clk-imx8mm-anatop.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mm-anatop.c b/drivers/clk/imx/clk-
> imx8mm-anatop.c
> index 4ac870df6370..90ff11a93fe5 100644
> --- a/drivers/clk/imx/clk-imx8mm-anatop.c
> +++ b/drivers/clk/imx/clk-imx8mm-anatop.c
> @@ -37,6 +37,19 @@ static const char * const clkout_sels[] =3D
> {"audio_pll1_out", "audio_pll2_out", "
>  static struct clk_hw_onecell_data *clk_hw_data;  static struct clk_hw
> **hws;
>=20
> +static int is_really_imx8mm(struct device_node *np) {
> +	const char *compat;
> +	struct property *p;
> +
> +	of_property_for_each_string(np, "compatible", p, compat) {
> +		if (strcmp(compat, "fsl,imx8mm-anatop"))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
> {
>  	struct device *dev =3D &pdev->dev;
> @@ -44,6 +57,10 @@ static int imx8mm_anatop_clocks_probe(struct
> platform_device *pdev)
>  	void __iomem *base;
>  	int ret;
>=20
> +	ret =3D is_really_imx8mm(np);
> +	if (ret)
> +		return ret;
> +
>  	base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
>  		dev_err(dev, "failed to get base address\n");
> --
> 2.43.0
>=20
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
> branch: fix-imx8mm-probing

