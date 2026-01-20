Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AB6D2ECFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 02:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNolApleaq2FfbE1ERH0+KI7zeXAZMqGT1ZWawsVIxk=; b=XrnovlQYjiU33VcRClP+DoQagG
	/oR4EMIE/wlWcaGcSFuL4pdausNZQyxBM7V+ghzmhvb41mJf8XkRaC4D7xR+ICKuWZTkkvKOkH/9f
	D7IgfS3SW+qSYycDYGkjC5kOeH+6nvj8YrpRtxGbZ26bp3Z1dV6xvGTRTinazbC3ex05yVn1tpda4
	Afp3hZKl9Aq+FjwpOjMGknnn3ZHu2aoDK+XCMXD3L9O2ozFLa+CYDjRVy1i0xVxb6vNqzwRSfnRyN
	qI1X//JU0J+XoCAsGeQa5cg8hIajA6JTP41I6VrD69WKSDYeRQk3XpDDQTmxNlEEm4V+ep6XgFM6R
	O6+pnqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi1jX-00000003684-2JYL;
	Tue, 20 Jan 2026 02:44:43 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi1jV-0000000367g-3QhB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 02:44:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBeVI0ne9Hkf2bNIeW8Ersq+VnwP2HN2W4WLNDro6dSbEdpYoR49gD+DadgVjEC3PGQK58A5aWy5i5uL7YFpxcLkTtku0fxjQ32DEocloNPbsCYnoUg0Ym+2kVIxrwm7+vkL9Et7xZG1uiwgIzC6gWfvi2lzd4lgM4OXkP14wXVTfPtOU1LiHwoyioEU+94k5E4P1pYQjn/n4Y1VMtxmTOjZXPDgM/gLbFqSU2qa2+kCaMwrSGNuNS3IKqoRX4e437cmWTud8nX1MoS+HIjRaVVeW0e29DyZygpF1gCKQwJLOYBmrYnMIV/mGP2fEE8p/0Y+7KVazY/SRaNMxHBbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNolApleaq2FfbE1ERH0+KI7zeXAZMqGT1ZWawsVIxk=;
 b=BD84HLxpsjVHa5mVjxGrpV1bomVXVfqJTBGUDdvN4/SwWhSvq4xwC629DoFMbj5bpbhDUnehS/oJW4VDIim8+blKump1zLdtOuhCZ6swT+0OC6+rMnXtkNtPx4i+LwS7uAmXwD+2fM2lIKgS0IgJFenyx4o4kaZyDRwfmh+6PgpbZYk+hg73pwrtgp+1+Lu4PIlcgkbo6OrbAIIlOmL/75PBV6ie276F9oG5qG18Ef4V3igBebOqtM2/Q2ejRtIuDFrEEzSjljFCX87T/vg8ZIcXjH2ZZMyIfyL219XUkSDKkEFp8y5WHmm286dmsPV0QNpyoyS8kgDKlRwHpswPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNolApleaq2FfbE1ERH0+KI7zeXAZMqGT1ZWawsVIxk=;
 b=Qj0NNpwdKbgnYIngpb5INTepQCHvLSO9d5aPtq7AuLwGwSS91luN2mh8cb22/Nzc3eCGZN+Jm8hYvUtAntYr8qy7ag57CKu1oasx6BF2y8idC/bNnksHhdXgxejzsfmJx5pgNUiTn6OVdEu7CwFi2KXNhnn9uNvWrVBMEM/lYK7gu0SXOAvk9ZzhEg/6JoWBB7RPSs9NRRoYfmbuSzBL4O27WGxg4Ay6cZfgNV2eJqBJneluZ9JL8tTjzFDyplMrHy5Ub8uA7TI1nMdNiLCVagDihisFiA7KLOvArNJGIMf1Rwfa8tt8iFf2xfFiz5kuMcK0S6UH0eYwKW63Kh5EUQ==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV1PR04MB9088.eurprd04.prod.outlook.com
 (2603:10a6:150:23::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 02:44:34 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 02:44:34 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Hongxing Zhu <hongxing.zhu@nxp.com>, "l.stach@pengutronix.de"
	<l.stach@pengutronix.de>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 03/10] arm: dts: imx6qdl: Add Root Port node and move
 PERST property to Root Port node
Thread-Topic: [PATCH 03/10] arm: dts: imx6qdl: Add Root Port node and move
 PERST property to Root Port node
Thread-Index: AQHciSrsk7KYSAvHPkabL81JZV52QrVZrbSAgACrGHA=
Date: Tue, 20 Jan 2026 02:44:34 +0000
Message-ID: <VI0PR04MB1211450544DD02D44B4B901959289A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260119100235.1173839-1-sherry.sun@nxp.com>
 <20260119100235.1173839-4-sherry.sun@nxp.com>
 <aW5aodaPdjYwAE1V@lizhi-Precision-Tower-5810>
In-Reply-To: <aW5aodaPdjYwAE1V@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|GV1PR04MB9088:EE_
x-ms-office365-filtering-correlation-id: f37f0f4e-08b3-4eed-c7ab-08de57cdd872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Vcj3hMh5/eBWAO/SZ7i40vivcI0InelCbwHAOSXEioo1gNY+JSWQcTESSbiK?=
 =?us-ascii?Q?LgSzQDWcJ3Q/bWKk96gU6zPwTbcuwhFm8tFDVBhIPGGKV2gQ8xMJoiCLT/DD?=
 =?us-ascii?Q?d+Q5IRoZCP7yVBKwFVIZEFR1vrGqNYvAcabZHEayd81mEZUbebbjXub45+5/?=
 =?us-ascii?Q?3D8ccQFPIgUyEaF2Ye+aqcrYES3nBCrCXdNrFiZ4pl05p7KeomyCV2jdEc3Z?=
 =?us-ascii?Q?tOAc6Tjd06AokcgeZ//ZMceBdRr+RbhcDfFEOSL1kU5l34l/WMMWvr9q6mVN?=
 =?us-ascii?Q?H5p8eqVf8lF8O7E9w5/E0gcPmQ/1KhznYWWReLWeZc1jVoOphoEgUQ9btmlR?=
 =?us-ascii?Q?ENPTwgeKzUki2LNvx06gTilxEGs9coR2IXW/c131xZGI9dWeqcOmLBx/blh7?=
 =?us-ascii?Q?QtJuq66JvfTvrCB3sRVfrrigX7jpZ8t3Am6f1wWwdA5tQQJW2onb2E7H8n0+?=
 =?us-ascii?Q?46F30dog9KmHwcNolsl708YYExeKLvgLkCdgQ2anEFx2Wa7FOdAGq/+g5nCK?=
 =?us-ascii?Q?eWPZwpqb7z85FoNCJcOkwmd3V3WJ676RKUY69UrwpSS4sLCkllGD0rn+mGGD?=
 =?us-ascii?Q?np68jBf2TiKMlQQ6vRmtzemxKpIFTyvNYSUifq7pFQXX6JofQA4s9ZOR1Nro?=
 =?us-ascii?Q?7vDQbs8g/87w6vVWFEd2bR2NJrU66vegO3fFjIexpjwuD84iAGZcfLrNJ4Xh?=
 =?us-ascii?Q?5eJ6mTjyGoME8mKlpbb36CfACQPsY/lbcmXExdUDZbwldDBrZs/2PNAQeBL2?=
 =?us-ascii?Q?pwKvaTbZiwUA/aOM6mPhJPMqmkWimWDw2I2YCZEALLRyuX41GeTTSsP7ylbr?=
 =?us-ascii?Q?UwlEFDoIJPwSfG/jgPQ99s+XoHCCuLyhUGWlXc0HXuK860UVGKWm/dJo2kXU?=
 =?us-ascii?Q?bvtEjIHe/OHZq81xO0wk3MhlYM4NLVnIUGpHejR8EAs51Sk7ETJupk1Lu8aJ?=
 =?us-ascii?Q?84gLyk7R1FcZRSlf2Iryc2DpvnzctUMx45Dq1RKafx6GWQefBoro6PnYy6i+?=
 =?us-ascii?Q?99rhABnsOXDHFLhvil08W8i6eQ6SGmqF82IRDmdLDdUE8x3ilZBiQ33yyu2T?=
 =?us-ascii?Q?PcntKwcFyCNi1trMzIdvoHmCHCGjJPGWJY2YlWS1Bf8H5CE4/xIapl+tUf9k?=
 =?us-ascii?Q?7GLrxnxCS4n2K3l9T+NvnjPiICJWPQ5nd4MtY390eLPP28RRCGuPJZ0chr1l?=
 =?us-ascii?Q?Bz3k0219hXg/IUYQ1yTra87186VSXwuOm7IZZWzN7stwQGHGllf66PtdUzNL?=
 =?us-ascii?Q?WhMFKSckw1ACoz/6hXKexRtWvsCezCnc8qkkeftfML8WboVldAxj6nprCSIq?=
 =?us-ascii?Q?4Tkm/uK9DH9d0gEm3xLCHOLefOfGmhNNZzOjkQ8G4Wa701YE3VIot7/lgKZN?=
 =?us-ascii?Q?GywwUIqgl+gvixUykGXE+f9t4lwO0xRWGTB3ScaP/CmfnoPplgPAGtCsPpcv?=
 =?us-ascii?Q?ppbK4z4d/5pnMDgTwMlfqtzehE8YcoSS7bnn+jweY5yIbyvhimy3KNSh25Gz?=
 =?us-ascii?Q?0vnIHZ5abF7aiUIFDs31PKJbXjGgTcnatF4k5Q68N1ZvuhgI+D8UkSShtfds?=
 =?us-ascii?Q?4o+WDCuICoRJrRDvx8L7Ah+EfaCgHcHeN/Ann6cFtrV6xZTLXZaq4z1JbJmH?=
 =?us-ascii?Q?8hMqxTCVNbpnNHC86sjimfA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VVIm/N+yjbBuIP63ZYPpi1Qr44dwoGqqEcQru/TZtJXPZ7tH7v4LoGP5zyC0?=
 =?us-ascii?Q?C+Hiots7P/SI6alBukuHiPxyn8LdFmBJ6SHfR0IUJltFmfDW9WZo3hrgwa+9?=
 =?us-ascii?Q?RmYmNUhhfu+kQRXKMWTMVMRO93rsEZ2fVP5AbUAGCM7QmizluApKoWzyx2X1?=
 =?us-ascii?Q?7Lb+NOx1EeDnMK4B2rbcx5lPjQJb3ZYZgDp4L0XUlggl4q0PXH+lDozzttzn?=
 =?us-ascii?Q?DzMqNAqHwNBOzFnv7pLIbDY1mdZGqW7GTGz4tuVcW1igD6hDXamJ9ijKB9Hd?=
 =?us-ascii?Q?hR5Ik1bGE+1+dbFcZyvNTyoDnZF5q/l5jrUtlrg719SoPHnF/jMX4fgDHUNE?=
 =?us-ascii?Q?6FZ6aCFaHdwD1LcZIqO8SlsglFriwzH7pUWYScB/B5RESFPpqSh37WZd7a0M?=
 =?us-ascii?Q?0xJZ2nJfQkZFwqMzh/1TbH43Rq45UQOxNFhq3HnKdyzPsIEUezbfZUJeNMWp?=
 =?us-ascii?Q?EW506qcOqBA6gHI2isr87LRcoYDNYNiVITqzmSa7jDH7nJsMwvfXW1xnH4TR?=
 =?us-ascii?Q?7/8KoRPGdq38OOM8oIPMgaPNES+ojyQgXe4G3OszATodQoDsIyq9ut4g1MuH?=
 =?us-ascii?Q?JnT+dS/dQwnGn9mFzt3y2cRjuJN7iZvtq/RQr5nPXad2urQWq/mqPkwIQhJS?=
 =?us-ascii?Q?64DoFqj0oRTOBz6j2qvRTKsizq480YzCPFjSj2955vcXZVpUv0q38n8Hegh/?=
 =?us-ascii?Q?fFeXSCjjSAPKaFI3bP4kQgf4aJQ0YLC7EJ67zmUmaqusaOJqsCLj4m7QvK8t?=
 =?us-ascii?Q?IG6Ae8MOcP/Hifr5rMMTAozuYSWroDH1R+r4La/g70m9d/IKoJPQcwurnSfA?=
 =?us-ascii?Q?UnHLXOXL19DHsCjXGkh2nioPjOqC/E7tnqU2YfU8E17Cf84QOqA1FQ2EPyiF?=
 =?us-ascii?Q?+yp4zjp4QiBgC96lrIZW6Mi0f9v/9XpjA8UPkEjnhkH+HnHuDrv0P9oB3xus?=
 =?us-ascii?Q?aIyn5TjPJanvuzemWSvm2FLjTsYNIZsej3j2r1CWaeHWUfETc36BA7rdWUdO?=
 =?us-ascii?Q?XaNZ6Htd0j0VJcpIGTqgtvxLN25maIj2V17yRjeudY/YYmY4NKs8BG90F90a?=
 =?us-ascii?Q?y4SNMrUBfwwXoJyWOE1vzKQz8z3LMTSymDTbvu0euDke6oMUq7Q13J5kp8kP?=
 =?us-ascii?Q?PNNPdgzZUEeKgLcqlBC6aVf0XbSSYOYgjH+sCsOuR6U+DvGK1gxdu52EG/Km?=
 =?us-ascii?Q?e1QSa+uyWMtwH0PCRv/1csNA5G8g+KdC2iRHVqUwIZuo+mePTqn/Wr3LsFWq?=
 =?us-ascii?Q?MwdJkMTpm7rnE6mbWkF7bZDb3CHnnf8ge/uPdhwlH0GXGqVMATiyeoLwd4UC?=
 =?us-ascii?Q?1/yuLaSUmD0Yk02swwWME9QgeUZIRaIStxzW4rAOP82aTAw+LJvQuZP3hYks?=
 =?us-ascii?Q?Q9ShlHWuQXTCRveXLWRFqTrkPd19QKSMFuRmv2rro/W2kk/K8jwuSKvufnv7?=
 =?us-ascii?Q?6JH22KSpCU/eG8CNS5gZw3GNdxg0sHtWXrN+G/JIh/yBiFQkOn9sbiulz45q?=
 =?us-ascii?Q?OfGBgISXcbjTdnDmah6rMWoHlf089mJJjWQdbJWr0GDlh+PD0q0vW1diookf?=
 =?us-ascii?Q?Ev9kFZDq5zYQcSK/P2GnrW7T/Fv/e7xlXtS5JFvnTqANtQctpk+uUMK3B1gK?=
 =?us-ascii?Q?Ia+xbe4q6zp0GAy2VTcZS1XB7D8q+ddxTz9RSZduu8BRToTDcCgI2geBgVjP?=
 =?us-ascii?Q?M2wpGRvrf9q+tzmFN0ecz/oVO9y3L1FXIEoctug5zinnFKTU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37f0f4e-08b3-4eed-c7ab-08de57cdd872
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 02:44:34.4260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJnOh4luJkrXi+t36FUF7DDEYoimpGPkToKZZzSDILug5b39nTJX4nGdqYlpI9dwk7yddFeyfKQEV6RgJPHc+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_184441_878928_2BCBCDAA 
X-CRM114-Status: GOOD (  18.84  )
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


> Subject: Re: [PATCH 03/10] arm: dts: imx6qdl: Add Root Port node and move
> PERST property to Root Port node
>=20
> On Mon, Jan 19, 2026 at 06:02:28PM +0800, Sherry Sun wrote:
> > Since describing the PCIe PERST# property under Host Bridge node is
> > now deprecated, it is recommended to add it to the Root Port node, so
> > creating the Root Port node and move the reset-gpios property.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 ++++-
> >  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi         | 11 +++++++++++
> >  arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 ++++-
> >  3 files changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > index ba29720e3f72..c64c8cbd0038 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> > @@ -754,11 +754,14 @@ lvds0_out: endpoint {  &pcie {
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&pinctrl_pcie>;
> > -	reset-gpio =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
>=20
> Generally, don't remove old property to keep back comaptiblity. You can a=
dd
> comments here if you want.

Hi Frank,
Actually not remove, just move the property from host bridge node to
the Root Port node, if keep both reset-gpios property in dts, not sure if i=
t may
confuse users because it's unclear which one is the valid configuration.

Best Regards
Sherry
>=20
> Frank
>=20
> >  	vpcie-supply =3D <&reg_pcie>;
> >  	status =3D "okay";
> >  };
> >
> > +&pcie_port0 {
> > +	reset-gpios =3D <&gpio7 12 GPIO_ACTIVE_LOW>; };
> > +
> >  &pwm1 {
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&pinctrl_pwm1>;
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > index 9793feee6394..c03deb2cdfab 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > @@ -287,6 +287,17 @@ pcie: pcie@1ffc000 {
> >  				 <&clks IMX6QDL_CLK_PCIE_REF_125M>;
> >  			clock-names =3D "pcie", "pcie_bus", "pcie_phy";
> >  			status =3D "disabled";
> > +
> > +			pcie_port0: pcie@0 {
> > +				compatible =3D "pciclass,0604";
> > +				device_type =3D "pci";
> > +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> > +				bus-range =3D <0x01 0xff>;
> > +
> > +				#address-cells =3D <3>;
> > +				#size-cells =3D <2>;
> > +				ranges;
> > +			};
> >  		};
> >
> >  		aips1: bus@2000000 { /* AIPS1 */
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> > b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> > index c5b220aeaefd..c35c24623d36 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> > @@ -45,10 +45,13 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ
> 	0x000b1
> >  };
> >
> >  &pcie {
> > -	reset-gpio =3D <&max7310_c 5 GPIO_ACTIVE_LOW>;
> >  	status =3D "okay";
> >  };
> >
> > +&pcie_port0 {
> > +	reset-gpios =3D <&max7310_c 5 GPIO_ACTIVE_LOW>; };
> > +
> >  &sata {
> >  	status =3D "okay";
> >  };
> > --
> > 2.37.1
> >

