Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A75DC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AozRedXttuAw6Ii7WS3iXiM0AACkjH7pThEXHPhrxaM=; b=eyGfSrJBdRLlxqwdycgDe/hH5n
	xDIyIWaD0vbv0p85fKtIrBkp6P9VY80+a9YpNu2HqUwPsvJmjiDsCEZ2MxnuFFHYl3N0oO8743Z7P
	YD0goJ/6niqPq/ouzq57f/ZDZFGA+Am1Asw4GvblnzM6zqgLXRLfglNvPDRPRHrmeADjEYpqT680k
	4pybWD3ZbrvD3a9boho/0vxhBx6SXhNNZuztmGOthKxTmppLElzdbALYd5XbGh/JH4zjgE9xfRL0U
	qmHifYLdKx/D/FBo5IG2OL521+jBNNkPGhpy4MGnDBW/wTIaeLbla/k1RtNAEDqofD4JcDQpQbVU/
	KRVzLRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpu8-00000007HLW-3dol;
	Wed, 02 Jul 2025 05:21:08 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpeq-00000007Efd-22un
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:05:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWdCzG91fg+XJ7a1hP2EdWYCkBLEatCFDrBn7D8hOoVqQ/iYiW2B5Yj9hOBe2dE+mc+nX7tHch/TPo69VM9H1OdXx25j3QclNhMYY/uHCwImQKEiThhq7U4d7c6pwFeB8bsfavzLkDS341QM3VAVXtd6k1J1i1xhILyuWDS2vTm7LWGjJGZo6CAeJzwRooGGrd4uWuV3eYs1MDnGJ2J8ENXmwsorNjBxUFTT3jSqVsFSnoFEX2qioKDXgsOg75xO5skZGNug01b2Oeo3ZsxwmVWzNBQ1ycOMGCtAnEhtdlj/27M8iipQenHgqzzJYFBZ0V06dGEZKa2BVc/tROMq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AozRedXttuAw6Ii7WS3iXiM0AACkjH7pThEXHPhrxaM=;
 b=dXcfYxiYpxVg6OYVjwtBCUhCemBZ0M63m+Wzl7DVY8D1MN0mTtiWy68TgQRVyZzrZRgRADoRK48HI4n20f65ikrr5dNqAapi+rqXknOWkpti2RTC7sPs7KGpLTyAVP1Xa5LSjmp+nuwp2xymfjUKPEItqaMFGmnM52tsvpqQcoRxluqT5VyCyFto3qvfAE2AU73blcCEO8hriZQasVJgSlRCI2A+L69vFnYgMYX8Wtv6vjl8PH63kcp31zajMCdkpk+N6GaE9rTv+G1siQ+BuNhqwNGrQ/IPLRqKGZBEbQRoekMElCaZoSRVzyKF3Sz7Q/zRs0idqlVFluRtUmnisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AozRedXttuAw6Ii7WS3iXiM0AACkjH7pThEXHPhrxaM=;
 b=J3Aam3wDbkwlWmRjbplN5qf+PHDOi5CN2/prz7n8WRtjoCtimHi/sNaePBLiyqSAsU/Q+XErI7mdQyKbNcCWtoJGM3hc6GahhvVUq8NrQTVDJDERCSETGqdxI1xgD1epgUexHWmZjXGn2tgRDhhXEiajmqFzLkSJaz65rFPP6WTilCkY00MBebdugpPl39HzMAeYj5uqfMoVTAlyVo/08FkBAhYHYZdnCkrh6Pb2HadojnwNKK/hjApb3Gsb9NxPZ587XDXHzE5axCcrGFUJzOwwmv9EoiPUL6qtXjeqHXo6vt1v2tr0MlpHp+mMnbR08Dl//fPLxGdqIQ1laXgJrA==
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19)
 by VI1PR04MB6925.eurprd04.prod.outlook.com (2603:10a6:803:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 05:05:08 +0000
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37]) by DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37%3]) with mapi id 15.20.8880.024; Wed, 2 Jul 2025
 05:05:08 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Jacky
 Bai <ping.bai@nxp.com>, Bough Chen <haibo.chen@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH] arm64: dts: imx94: add missing clock related properties
 to flexcan1
Thread-Topic: [PATCH] arm64: dts: imx94: add missing clock related properties
 to flexcan1
Thread-Index: AQHb6v1tQXlZDafmKECCkIIFRF6J5rQeMTOAgAAWbeA=
Date: Wed, 2 Jul 2025 05:05:08 +0000
Message-ID: <DB9PR04MB84296DB3F0A5661FE9372E7A9240A@DB9PR04MB8429.eurprd04.prod.outlook.com>
References: <20250702025911.2457322-1-sherry.sun@nxp.com>
 <aGSq7TZlkoqIkQMT@lizhi-Precision-Tower-5810>
In-Reply-To: <aGSq7TZlkoqIkQMT@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8429:EE_|VI1PR04MB6925:EE_
x-ms-office365-filtering-correlation-id: d2d3ad1c-3650-4c5e-74aa-08ddb9260427
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?Xw/H+Rcqaw5R9PWPyBDOwlDfc9UnLQRwzxsg+RmP+R4Bd7RRepxiy1P7pEJO?=
 =?us-ascii?Q?DF9Go5WdZ7g1/aiDhiKWgjNYvKkV8C3NY9RV9kZcZMH1ytZ/b68dTArsOchQ?=
 =?us-ascii?Q?i+mnkYSNNEotito/qNAGdIB/8RAhmcU8hesDSZk3cMHyKSLZ0QhWRLZwYr7J?=
 =?us-ascii?Q?vyuo6XUyw58sfBwtj2Tp/bvMVzmpHgdkTm0Dux2q2V2ekOpXQHpU+i7dSjjo?=
 =?us-ascii?Q?/6mwSqbM9n+kqkR4UZWena2wSymXf7tSeK3Gma6rmFqVM2GufK+IZCso+SCj?=
 =?us-ascii?Q?VaqlH73RsEjS00RuWmZx2tzzQEHoT7robqiaAT2uPe8LymMdk8If53tIoI4j?=
 =?us-ascii?Q?k3Pu7WJztKPuoZvWUFm7eYxGiVx7SGoSFAGLCmHJGl4BS/wHYJlEMF2N8xPq?=
 =?us-ascii?Q?wK0BwdRfSj+nXumsToIDIwp1IYTM+oge+NAXFQjpHrL9McREZqcrZ5hhrYHy?=
 =?us-ascii?Q?WEaRKS3A5v31M+NzrHDJ1G3w9qTvRwWauYLLR7Q3NWLOHBkY6xkck2vCApRB?=
 =?us-ascii?Q?mQNoFrcvqXV7rRG4HqGPhnlZUwvLiH4X4Qa3IUTYSDagnLjO7w2h5m1BIcgN?=
 =?us-ascii?Q?o1RXDzkShsgPM9DfNHoeCzB98PqrN3c/suEs9XM0e32hVF43UuovJ+4Dj05Q?=
 =?us-ascii?Q?6kJtvM2w5xR1+3OPXXRFFlcmKWWcjbW3EhJN8muD3rKZO0oAgIoTFyBftQFa?=
 =?us-ascii?Q?jEFu/6LZr/BpzbuYccIyphWPGZkKLAXiM6e51yJpcqPt1C7o1qvfGASu7ARc?=
 =?us-ascii?Q?+F0jU4VX0B18KLoPjMvmuPMeIkWJZoOnBg/CHnNNvtncrMmRcgrv0BagM5YP?=
 =?us-ascii?Q?TuTdX1X7qLm1TqWdwidBlpgTY5e+KM913upKNQ0/AywugSrpHqzThOsf+gsw?=
 =?us-ascii?Q?Dcfvue1SihVN6bDjEWVdCkfQcOhJ7g2Php3SyJsLVf5bDeBywxrdzZLvm3Xm?=
 =?us-ascii?Q?h3A+SOk8FVrYfBWwNI45evv9mIZFoF2J5LlJStsY2DV7DoxAXsllaGamfWVO?=
 =?us-ascii?Q?NY9+D7Tz9U6q+YG0Zj5oTOkn90HUUIF2ne6l47N7Y4fVmDMe1cSqYVm0ZMYl?=
 =?us-ascii?Q?cIZDTM5cJr69gfyZEuBBLKBWL0/D9Vmr2PMamidSvl256CD2/dTfnvCYezwz?=
 =?us-ascii?Q?nP6f/EjYuWsdy8zRjOVIzsLYj7VblDCpdwptoRDXFaoi0mZmNBd9vx6wpy1a?=
 =?us-ascii?Q?5SN7M0A+wv6QgAPAj4ACNQPCDUJl9zZ44MEm0mw6RvxRezh2HNDCHgddjfyR?=
 =?us-ascii?Q?EOYJ/GE82zRX9V6JMhxGK+d3RIOlcB7Ji95PZ1wynOprmuB/+DjW/dBBW6Mw?=
 =?us-ascii?Q?1YkRh5u+xVq7rIQbm8wa1SZR7N4klBeIA4J831GhHeq6WrOU58J/hRab0g+A?=
 =?us-ascii?Q?2Qi1kaB2rBPybBKdQw+Mu7skLGrB0zPRjX23dOXATkew2xabuX94Cti+qT7/?=
 =?us-ascii?Q?BsMSy+M71869R9GNRBOMHOkn1hQYJs/cyhf78NNdWiR3FKm8fNL8uIGgVnRg?=
 =?us-ascii?Q?UzK8A6d2LeEWXvo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8429.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BTRt/LfT7F3Fi5v85SL6DabOWLK0XVGCa/HPrfbrELuAlt8O0TM9g83AvsbH?=
 =?us-ascii?Q?O0sJGt0dt9hmJ7aYGJpJkMBhf3+G3uU8hhoJR/2jpsj7CkiN9iB2reCDkr2l?=
 =?us-ascii?Q?mQ+tlGRNW1I4aTZqPb/LhrJt2w9bUOaD+TEh7nKVXXj7kOkghQRI8y6Zp4Ja?=
 =?us-ascii?Q?dQ0NynUQ9VWQ2rp6ovPcjueRIrmWAKTBhHGcVxQ+MFQ9tFf6+1jwQi6woozN?=
 =?us-ascii?Q?P84yrNWES+p/BEG14glL0TwEtRH5hudNk+wXaTOWJuOsyZUb6NC2duHfQW4f?=
 =?us-ascii?Q?zFDoIrvXhCnoLGyXDXDUQiexD8UXzumFYWLfdQTn2XJ39eCoIRS13UhvYIhw?=
 =?us-ascii?Q?eytrv6QRSpLljza3VTj9pxwzKTbQGMjO8QbyH+LmnkNNJN6GYUuSkThTHxHw?=
 =?us-ascii?Q?F4GDG+H4jS/L1Vb6G7apWzgFy+X6ytb5cmYELmPXd4ffwMyRXQrA1En2ZeY1?=
 =?us-ascii?Q?48FclW7Iy7R4SIvAFFfLZdinjtG9Azb6+r8/o9lUJ+CBnEfSJkgJvNOpkkkx?=
 =?us-ascii?Q?0VvZ9VSsGGY8WcZ+y6v5eIvIP5ZRCG8iGc6cxUkDMWSTHdTtg+D3UQRhGEJn?=
 =?us-ascii?Q?P3dpBWFkjt8yM37jL1EXZwjpZkQoB84sFvOsuqhkfgclN/VvWBNUzrJHJ8Ix?=
 =?us-ascii?Q?PzvK1Yt/KmmitbTVLBmqplziR6nhNJ7o5ro6Tz0vbznjnSc5tp2Y2iZFFsvP?=
 =?us-ascii?Q?qS0AdWfsBDK1HHTgDnUN6J78DhTJwLajUkyXW7VxBP2ETFSud5YNSuRQkeno?=
 =?us-ascii?Q?fDzmFISMtyGa3/vULVTLGUad30yAbVAi6CWmm1ny4wnnUmuA9INC/E+R/BhU?=
 =?us-ascii?Q?RQ6ph8+BCr15y4yQCt78xqdVIA8cm3iTx/XGxtjtxm8+UbZcGDTg+mRSGI0V?=
 =?us-ascii?Q?Z2BCjkp6tjXbn2FsUZHzZ+deflHjWoCMYiPqsAkoWgrdayeU7xH9pSx1ohLl?=
 =?us-ascii?Q?xoUW5UcDd50brCU2MTNBtSsPdishQ2wlNhnKCjOQpb9FHiZxFmUoie793Wzc?=
 =?us-ascii?Q?ptbyJfgzI7SyScV5aoz2KUCv4TqdGeRiviKoBr+ybTUwiAyBcWFqoYyLC4O6?=
 =?us-ascii?Q?hT76NaDB8b+KB5UkOGGFCLv45MFzbOslj0d2mw9qa20s6u7EEUNguYZjqSYh?=
 =?us-ascii?Q?onyYfxcBHxdJTZnIdQlUdxVQ7oKEm39Y9iWsNPqnw+wnG0UCS8in/BwH8m+E?=
 =?us-ascii?Q?4ou1dVUwy0J6VItpYffGsHsx9SLGdjPwaHR/3vjzfArv5oC9boG2S0O/sLTr?=
 =?us-ascii?Q?WMHr+njIOkB7MvXtJzJkNluLQLXNLpOgfrrkRfCUjyHxKCxl2BF+PXpvBBSi?=
 =?us-ascii?Q?PCXBHC/iZIEb0sJtpvMl1beOoQ6U+kM1anDohQn6yMgeQt8CXSuFqOxIB/SD?=
 =?us-ascii?Q?DNAvj/x75bvSkewDH1wlq4PWrGyqPRAwsKoarFq4X3Y/JfomjKyPagcELiaV?=
 =?us-ascii?Q?pRdqcAoUPgJYJA/zXXvvGY7ORO7zvZe8s9eZlkK6lpJi5I9Uf7XcN7XfFfly?=
 =?us-ascii?Q?44Fwe/OdgMXfEsp+eznTWmZjFNyF9QnQHDhHR0Fm1/oLs97+sKJR0UNW8kua?=
 =?us-ascii?Q?iRSYPvaPNY6pofUUW8M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d3ad1c-3650-4c5e-74aa-08ddb9260427
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 05:05:08.5651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7t3WW1UZRFTYrN5VyAqFbnWfV1IPtC25MVuqS8nZ/U1qcRWpube1krtWEhhc5pkOwnStRWOWyaCQ+CHOYAGO9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_220520_573979_4A1B9A93 
X-CRM114-Status: GOOD (  20.94  )
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
> From: Frank Li <frank.li@nxp.com>
> Sent: Wednesday, July 2, 2025 11:44 AM
> To: Sherry Sun <sherry.sun@nxp.com>
> Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> Jacky Bai <ping.bai@nxp.com>; Bough Chen <haibo.chen@nxp.com>;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> kernel@pengutronix.de
> Subject: Re: [PATCH] arm64: dts: imx94: add missing clock related propert=
ies
> to flexcan1
>=20
> On Wed, Jul 02, 2025 at 10:59:11AM +0800, Sherry Sun wrote:
> > Somehow the flexcan1 clock related properties were missing in
> > imx94.dtsi, add them here to keep align with other flexcan instances.
>=20
> suggested commit message:
>=20
> Add missing clocks and clock-names properties for flexcan1 in imx94.dtsi =
to
> align with other FlexCAN instances.

Thanks, will improve this in V2.

Best Regards
Sherry

>=20
> Frank
>=20
> >
> > Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for
> > imx943")
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx94.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi
> > b/arch/arm64/boot/dts/freescale/imx94.dtsi
> > index b8ffc428e95b..bd3437146746 100644
> > --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> > @@ -1035,6 +1035,13 @@ flexcan1: can@443a0000 {
> >  				compatible =3D "fsl,imx94-flexcan", "fsl,imx95-
> flexcan";
> >  				reg =3D <0x443a0000 0x10000>;
> >  				interrupts =3D <GIC_SPI 10
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>,
> > +					 <&scmi_clk IMX94_CLK_CAN1>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk
> IMX94_CLK_CAN1>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> >  				status =3D "disabled";
> >  			};
> >
> > --
> > 2.34.1
> >

