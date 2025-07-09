Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F1AC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJNdtIxtQxF3ru9ax5aaP163MqMDXxQDF52icOFujSc=; b=KO/kE2F/24VPsriM8G4BKqsAZo
	FtvZKnrX741XCGZVcIqbhvBZ7EeFRexN5Vge87tsVhbQgl5XWf5al8DF713MFFQyTPMAnMT6FQ7aw
	fK/RczRrsUKHvZ7pZbFBoSherRfoTG2Adycg91fMbBs4PbRjWpayJhHBIeT4vAkW9wfSk11hs4Ijl
	ZMIhgZY4RK63+aOydeBkBsXI7ecvSt8ghp1doZO2wBcMuOoI2/jr3Wpm41GRP1htvtkK1b4w+P2XD
	A/Iwh5j1mrvlD5Omjeio0ueL/yYKHkhqmzvJhjkrtK/AxGOs35mQsRkHc7RI26slZQiOMYwifIhOr
	1sCRF0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQMr-000000080CM-0j6P;
	Wed, 09 Jul 2025 08:41:29 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP4e-00000007nHV-3C1z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:18:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=row50zdRpfB9p1klDsRJni578kws7pr27rtY32xDN5+bKlrQwxS+A4Vst33SnOEufJ+bNFK03rpr8IpbVeAh7HQ5txt8Bj/DQfG0jlL4BM+qNR6pGbdKMhNej+B/+ARpFPHlSyz83ZWV3FstND3R+8abD9L/8ch/7SVMSrpAsaLUqsuP/RGuE63efhIt0Wd1ZP//37Av4wXtr11G83Cggbd7tplFmGqyiuirCfbNPGg3B04M/eYA0WQWM5p6BiHMt8G3ddUVoJpQvxrlrcw0y+jDNO1r/HAHTvZ9RuDkFWkigVHdKFNXsQaMs2FLlJpmZNwVnRWiF1RbxbZMgRn6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJNdtIxtQxF3ru9ax5aaP163MqMDXxQDF52icOFujSc=;
 b=Ie5y5ffclgHz6SMdLZhoaX7RF/wnNPSzH9ziAxeSKNFlcF4QHPjuRMoNwF/s3spbQlCBzC7Erln7lCNG+x4w7z7BV5WXNTRZCUGIMRlsj2WOPXbSElwTsAq24yWBSsyKcyCnJGIdKbwc9LaZ9z4FR9ikVs4bYIaCoD7Of5Q1NjPWfXzlWIJHanOg1eREU9w88PHDRl+pktThwUEdbnlddkbmOgNnXe8POjuvXMSpzc5mxzF27EFgqeb4++NP7MBq447Awa48Dpfs+0RAB6ty2f0xZoGB8Kc4KrIl0BSvk6ygvf2j6E3estPc9DYqQUIQWcduSPs3cl/lIdYylBhpIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJNdtIxtQxF3ru9ax5aaP163MqMDXxQDF52icOFujSc=;
 b=BHDIMUHHfDDSFXMMnE2mtMi9VKmoL8IEWBJ1zy1b5fwhu4OjeROsqbz26x2wCQOLzmWxiifMmFfHFaI5pvKPl3Fm/xINkTAbkRxb6gggciTXWqKzv1/v/bk/oQmlVocGasumLWhrpkxNzNXGWSHsAEY5ahl3t0L12Pkk80eMRPBlDnPaQLSil2NnUI5xjsN8dB/vPhN7e8eCiyY1hqRUqZgpxAlxQJB0OPEgu2Y+z/2RLLVGwbT6dM7aDa4Mbyc4QeymISQQyh0fIvW7HaJ+saM0bxNVwdMoJQHF0E2iKO8el+zgk/LSX+MBBWAeD7EizA0Kw6Ca+WVTwHRBQ9kl1A==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DU6PR04MB11088.eurprd04.prod.outlook.com
 (2603:10a6:10:5c3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 07:18:31 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%5]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 07:18:30 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Jan-David Voelkel <jan-david-voelkel@web.de>, Oleksij Rempel
	<o.rempel@pengutronix.de>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] [PATCH] i2c-imx: fix broken GPIO bus recovery due to
 missing recover_bus assignment
Thread-Topic: [EXT] [PATCH] i2c-imx: fix broken GPIO bus recovery due to
 missing recover_bus assignment
Thread-Index: AQHb8J256VOMF+Od4E2rLRQzKlmyw7QpX0qA
Date: Wed, 9 Jul 2025 07:18:30 +0000
Message-ID: <VI2PR04MB111474E85E1D88DC617AA1ECBE849A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250709063904.22055-1-jan-david-voelkel@web.de>
In-Reply-To: <20250709063904.22055-1-jan-david-voelkel@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|DU6PR04MB11088:EE_
x-ms-office365-filtering-correlation-id: 39d5945c-cda2-49c3-e9d4-08ddbeb8cebd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?h9FRLAi4hgcxJflCnmrsHoFKsNsEaMXkTAkMOuzrbxahGDmFX6JwItFcDlRE?=
 =?us-ascii?Q?+/bjLokbWkvNudEIom5GEbuNrGj5E1gDrq8vrYRfwuvTP9R2cVlSW2+yGF7L?=
 =?us-ascii?Q?SXftYwF6/H7uyBU4XPv1UVt4NOYAZlZTdJJ61dXu9EeWOcF1AApAhPSCQ1Jl?=
 =?us-ascii?Q?EmZtZr1Vb6lxwIF9hY/5D5z6oAv5veum9seSwg/JyauYMJWewGwIeoNsrAlQ?=
 =?us-ascii?Q?/sLz1HeR2dWfjit34FqcB8tSYK6Wggdbd2/kQYwyjA2rNqPC32dtQXoKPsmy?=
 =?us-ascii?Q?G7tn7YwEv9Xg+hqKvUbvvs69twNsja5/A1kMHVli8/DDJE4FS/1fF6RreIBO?=
 =?us-ascii?Q?JpAWVfUqXVmearsiSB0FIYYIHh6tBwP7DPh3CK4QvfbTg2ED3EJ7ojR5woKP?=
 =?us-ascii?Q?4+EjYIBa/Bb3Nzwyckdpw8r2UepSbSC4cVSTCIzmZ/Rxai3A6NMsiEma0ktO?=
 =?us-ascii?Q?q0sIvWlHUOKykj0Es0KKsXReleY4ukqtRP3TRn1io9cFCxb1tuOT+9del7Rb?=
 =?us-ascii?Q?cE+ItmFTYAWnaD/yFCdziC1gU132ukuH7Nq8jBe7y6osuWiNuNgk1RuxzRbO?=
 =?us-ascii?Q?XXr1/V+TVm3kFLCGMv9kAn7SX2xuUHengWfHM5T5tFvb/URKO/Qtx2vRDXnL?=
 =?us-ascii?Q?PPc7XtKVNPccM7N9H641YYPWi/2vl+5Ua+jlViWz77OHaOWpsApGYP4ZGFiR?=
 =?us-ascii?Q?TyNtPJ9XyRsLOxKcFO9tRg5VtddJMvWORf1thRe4Y5jl1OEwjFig3Gwi0FnX?=
 =?us-ascii?Q?SiUh7av/3ocd0N6oCUFCrzR5ApqbgbELn0SLdajIV0HLNpIVbu0nO3mf9PeE?=
 =?us-ascii?Q?zknzo1Ll58WfeKLhx8lVwRLuKYdFQOP81PVUPJTTpqEWW8ue/zF5Aco90yT5?=
 =?us-ascii?Q?gLbKaw2DSweu4RDnMakvwdFz0M95k5to6mY7MSC1ImD6Nhkxj5/1e3Mv2Wbd?=
 =?us-ascii?Q?koID2l1Gka9FEjNqxj9INSwTKG7vTVs2mxomErglecRDKACZ+amjU25eG1g+?=
 =?us-ascii?Q?6ERC4lKSEXr6XyceXflqJndELlbfXcKjXNpQvTf4kljkx8bPoAP7SGr3XezC?=
 =?us-ascii?Q?NgZTpxzZ5nqj+ypKByOKyWal8aS7plrm3N+h6kw5HgDHaUrkVlh0yRBcEHGj?=
 =?us-ascii?Q?IFxWPSXyo3menmm9u1u/mQLvBavZVTazTux9afxjwK44AWfFQvbCQ/k9HApI?=
 =?us-ascii?Q?7Fa8C7yPZiAu0oAcrs7h/oCnEiOcrP9+/91tJJe3c5UwmCBBlJcySDAXwW7/?=
 =?us-ascii?Q?JCQYodigsI8cCsTeN/KjyOc429OC+SaQiI1Xn+Wi0Bxg4Is2FTy3Ba0F33Dr?=
 =?us-ascii?Q?/nAnEu21swQM/V9ZSPjOMVjV3jE/dquHEv6uKZpllKExAsEy0W4AvYwimXYG?=
 =?us-ascii?Q?eDE7oobMCelF/ZXsbt4ktXMDhf4DMSS4y9/6crP9UQiaxp8FXS3y8hc86F3g?=
 =?us-ascii?Q?7CzmJZVDZAUzzkP/CP6yGK35w7koJncyXmDw1wC47LgU49NDTJJaUQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZKVXRctOEOabf3F5H+0nCBn8p3yfPsmER1f/5vbukuDsseAJ9kVQERamKl/x?=
 =?us-ascii?Q?vfvm+EkHpn6bVTeHW7HJbOV6doj5kYcSmfiZydXD7R+Jsbg8pdSKRs5m4SQf?=
 =?us-ascii?Q?RhshyDz8vbbLff2qwjLMfeXFOQpj9q8NrJgnY9uSLd6u8/XqzgOh/QFdsMDB?=
 =?us-ascii?Q?jZvBuGBEGAfq98qUlXlEe3kBHrkIT5jcrIHXJF5iqN6dmyc3P9/JjipRY/yk?=
 =?us-ascii?Q?lfUhFOC5Ol+LfzZEh1BKWQlQ1LeSb2Pk2rk4uUgtkxCV1EHIlhtgRiDcP5iV?=
 =?us-ascii?Q?daCpns5G4sf7pvcnUpUmDS+UbOFHuxj2h1uoPlcm2q7PfgU3VZUUl3TtoZj/?=
 =?us-ascii?Q?XkDfY/gsp6W4DSton5E6JaafeZs8UkXq7+CgvwGEHFcHe/i7PeLTV3Il9NQr?=
 =?us-ascii?Q?oD+NR1pn8n1AnNZBXEB0GNeULKbeuZN0AxwZXo+iIE5uOe1ZTfk2/BXpuZlK?=
 =?us-ascii?Q?ncSlmUD6K+OVFw2YeUkit1ybBF5ibgZUd7U/aFrwy0ki+ZHKL7q8MIfJyjWz?=
 =?us-ascii?Q?Ewh68f6C60e5r/pF1tldHSp8HUtbVrtb+hyv02pM2TR0yCC4z8Ud8JeI9RwA?=
 =?us-ascii?Q?rJYdZy9RcceCricGAzLDf0Nu10OGGD5kFmFmkfM2/2r/wBkvc1tP8b8FtSH+?=
 =?us-ascii?Q?ncv55ZikAj13z2nz8Vbd8n9ZQ7ZlgCAnrvRSNnqiqU7rPa11p617QoRvZFbK?=
 =?us-ascii?Q?28mspS7vLjptIGc5cdlqWa2PLYRLTa1Dm2yQYnZLM97hZA+CFBsvMxU828r7?=
 =?us-ascii?Q?hLsAc57OB3qQ09POtCG6W8hu0oHrgO5NP6J7JUn6KxCaH0EfLLb2y1csaLHm?=
 =?us-ascii?Q?MuF0WcjqfqK0AXJYYIXuXODIaFliuU8YKgjAzsXBzNnMAZGHMZrs5qS+obDl?=
 =?us-ascii?Q?pPPw2pqXa7Nx2TgnKZjdwX0bvuMYhZd2fW2JsXkBy5p2qRqjCSmC6mkxJNqu?=
 =?us-ascii?Q?LWOTlhrIjYGplbdPXVvj/LV34jpE7FlEfzoXSPwHXSyTN/yg/2RaOaOXwhb9?=
 =?us-ascii?Q?fiqlIgpPcmwdvAZPf4fVeRE6ndPBviD644sYU3D7lu+RmUj+S1Epho92eJVp?=
 =?us-ascii?Q?K4OQIaUlMdlNa2wCL4daWsN2Eaj1jwOt5vqyMCmfvLtBRNTLcg7OO5Wgngpw?=
 =?us-ascii?Q?p/sAbA6X0p8gz1psG28g26HuUlBTDxlqz/KzKEJED2Vm0koidzaLlW13SW6M?=
 =?us-ascii?Q?XscU97KUWHfy4Ox2+/arZehcQD3y5qKfZWHvnh9a1ToZvCI69qaiVKgal/qS?=
 =?us-ascii?Q?Th7Ja21eiM8XxnxQTxbxbi/V2Mvr4fnvLXz804ANbD6ZLig0eNEgXSJrc8h1?=
 =?us-ascii?Q?0QjTAm6ORzPPoxqaEos5HQG1FM6U3cnIkRSoIFrefNwvLx86TGn75KrrJ5Lr?=
 =?us-ascii?Q?MznnSo+boyscHns+VlMdFsaNqCz07q8ewNsH+7MxZlfHmA/GwuAlyFBetNet?=
 =?us-ascii?Q?sE9G8jPtndLLt8VnACBade5Px7TGjChn6nfJrN5Fz4OpaYQgBa5qj4eyi/9x?=
 =?us-ascii?Q?fvyts3mfb5zGxExXL78J3fg5U+MPUWhsXU13tb6fdctXRdPNIgR8JL85Tfp2?=
 =?us-ascii?Q?/aRONcpKtjddM+ekkGq06I/jqS9hPhLdVo+U5rzb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d5945c-cda2-49c3-e9d4-08ddbeb8cebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 07:18:30.8081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDmqKZCxlOBZWmDoUjtkI5fiQPP8c428QjVkoMWGANcuj1whPjm6ymlCBi3SkCeVr/DTy2m4p74IEOZWCaYL0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_001836_799843_CF02493D 
X-CRM114-Status: GOOD (  21.17  )
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
> From: Jan-David Voelkel <jan-david-voelkel@web.de>
> Sent: Wednesday, July 9, 2025 2:39 PM
> To: Oleksij Rempel <o.rempel@pengutronix.de>; Andi Shyti
> <andi.shyti@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>
> Cc: kernel@pengutronix.de; festevam@gmail.com; linux-i2c@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Janitawa <jan-david-voelkel@web.de>
> Subject: [EXT] [PATCH] i2c-imx: fix broken GPIO bus recovery due to missi=
ng
> recover_bus assignment
>=20
> [You don't often get email from jan-david-voelkel@web.de. Learn why this =
is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> From: Janitawa <jan-david-voelkel@web.de>
>=20
> The transition to generic GPIO recovery support removed the driver-specif=
ic bus
> recovery logic but failed to assign the required recover_bus callback. Th=
is
> prevented the core from enabling recovery, effectively disabling the feat=
ure.
>=20
> This commit restores the assignment to ensure proper recovery initializat=
ion.
>=20
> Signed-off-by: Janitawa <jan-david-voelkel@web.de>
> ---
>  drivers/i2c/busses/i2c-imx.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c =
index
> c5224d43eea4..421f6da61f00 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1375,6 +1375,8 @@ static int i2c_imx_init_recovery_info(struct
> imx_i2c_struct *i2c_imx,
>         if (IS_ERR(bri->pinctrl))
>                 return PTR_ERR(bri->pinctrl);
>=20
> +       bri->recover_bus =3D i2c_generic_scl_recovery;
> +
>         i2c_imx->adapter.bus_recovery_info =3D bri;
>=20


Hi,

Have you meet one issue on i2c-imx recovery function?

If bri->recover_bus is NULL and scl_gpios has been added at i2c node.
I notice i2c_generic_scl_recovery will be assigned to bri->recover_bus to h=
elp
I2c-imx can support gpio recovery.

Code path in i2c-core-base.c:

> bri->recover_bus =3D i2c_generic_scl_recovery;
> i2c_gpio_init_generic_recovery()
> i2c_gpio_init_recovery()
> i2c_init_recovery()
> i2c_register_adapter()


Carlos Song

>         return 0;
> --
> 2.43.0
>=20


