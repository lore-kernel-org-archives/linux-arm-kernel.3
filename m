Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C8AF589A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CA4EQ1X0FLWdMpKDORkAHNEpe93eWzQh9ciySfekuo=; b=ZhYkxswugVF1sjZvAW5TqAN8ZD
	F00Mw37r5bZKXN0CPmYDSlUDKqIlS7kboYUpXHXuPI8PSTuhWr6bqpkh+nLMyFdOQLeT93LmA30vl
	c9ctcj1wNAxoI6iKLVpzz/jIJ7z8bX8fLCopwcJeFBxBUlJtTWKjRlvwDGDkQdsegNGBmMYvDfMyI
	CoBcaWxntnVYuqW4eKqYNor3iHcBgo3pRA/e87d146o2y3NaNnQySJ+tni3c0X8sK6VtLCPIMZk1o
	SxdD1gaOh74Y3OfHYA8L6KPQCjcEggoylD422lx8WIAGyPijtv4KoO8RSphP+40GLF4pssf4RnqPX
	/Zlibgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsqb-0000000BaWw-0h7t;
	Thu, 23 Apr 2026 12:07:57 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsqU-0000000BaWX-3ijk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:07:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjWw6HsFiMbmOZp+Kd/lmZTW/4Aam6wsgomDtGQPHkA6ywTj3I7YYN3cJp5ul6AWtIxRGbBAzEbM9V1CMMV9hkzfCIkaHqWWmhxTw1a4Bnu/2CImKGSoiKkAbnStPvi6E0G0AAvOrTQ3jB86fEQ2V+wT2IYf/UszpOC4FRHCzI8NxKPPVnMsc+9muNh0g34TvRrkh/JU8cl9QSBxyyFyJCz+ib7dR3PQf00RqL8NFasDV+wWysNoai9WVG3GIZvnawZURjVhXYing6g5E/xNn2qhZJ43gUN+U9cqCIxssWrYUwVQNiLdHotj1lSM/2ReSxCen+aw3pCHnXkUTgZ/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CA4EQ1X0FLWdMpKDORkAHNEpe93eWzQh9ciySfekuo=;
 b=gRBO1LL7L4QMg+aTOViNtOgXr/m8r9GwBVSgGr+P93Xt6GberqQUPhS+TousD9CpDAvWMtnIsgIhD8rO406UkLme1eNmlRrVAIgK/yTREZdnRt4YoLgDIeXAmm3yY5H4Lo4Sw+Yn3zHomkZ4GxpSdPHYr5DRVqqmsIXb6rE1L6Zsuq/zpn7MNHCFAlre8F5KEts5ZKrPFOkjDHuKLPRD5dFwEgwnlDEdyUAgsxbAeguAKZ16SGlyBQke5HlyTjoiSg15yld0viqpYwbmkdDSO8NCEGFqWYpMmFIsB7nZlN3gBkSYM+I6CXJ6sFh3HjTYafCv5aJFTfWE7uXKkUs5KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CA4EQ1X0FLWdMpKDORkAHNEpe93eWzQh9ciySfekuo=;
 b=iEu1Bpdb9/za7yWg9Xe17po+yrP1TDrvlF0SrcULuwH1JASUSt9U3FaLo3v3M5HOamoh2iTonHityEw+mpSnUAlMKE4a//QYjNnB0qsqqbUpfOO2XxY/nZbCQvbX2dvosGmPQ4z+1koiu+y9GouXi8FTSi53coVecZCNPTkJBRXqPGyawjBMiSFDEtT+VnBbYSpTHkWJ9k3qoKdBzdiZLek8pa+F6zhB2LHJL/p8dImGdYco9vGsiFyuKdGkH7tc9IMdsKc72zzTV/3HEpHpEtu0P2Kmq9FpP2NQsLLfwNahWD3FzfFLQfncXTxjZfku5/09+7oh6G/y1wVX96E/HQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11157.eurprd04.prod.outlook.com (2603:10a6:10:5c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 12:07:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 12:07:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>, Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 2/4] arm64: dts: imx95: switch usb3 controller to
 flattened model
Thread-Topic: [PATCH 2/4] arm64: dts: imx95: switch usb3 controller to
 flattened model
Thread-Index: AQHc0X03wBeL1YynIU+/n2MIuSBlObXqdBoAgAIAOYCAABv1oA==
Date: Thu, 23 Apr 2026 12:07:42 +0000
Message-ID: <PAXPR04MB845957613BCD5E86D96FA4E3882A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
 <20260421105503.1416566-2-xu.yang_2@nxp.com>
 <aehGKE8qLXiBKvvB@lizhi-Precision-Tower-5810>
 <cfyvip6atz6hh57iga5gvkzrdxeorv4tuxontvzixflqn36h7h@2awtzkxkn45c>
In-Reply-To: <cfyvip6atz6hh57iga5gvkzrdxeorv4tuxontvzixflqn36h7h@2awtzkxkn45c>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU6PR04MB11157:EE_
x-ms-office365-filtering-correlation-id: 670b6a8d-8a23-4eb6-c831-08dea130ec32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|19092799006|366016|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: suVGDF6j+y7aSL+Trv5f469eBiA8QTYt4LBabpS9zQwPKwIAS5qLr9/HWaR/mqn2Ng+RRvBrx+sIF1XEJX9H2EvP5w8ZV3MsCOwdLkcr8QbKF9xy/kon+F+ySYUNQ04m8hf8iLzGbHzJAYxrbzkoZqbtOvzwBcjK7SxtOAeJkl5UjbFoC0N1NWFr2xzjHUVDAbuVo6iyslcsebP6I2lZAp2JTq+4AAyQ60W6elc6cdePwYmS9ZMgA78AI3oXtafRRtWaoNBGywr6n58cv/lviBarNV+/vp5fOHBTukBT/EA5UqWDlARRyRivg5xjDaEOZLEW5lbHwmAzI7nneoID71YAj75ccdHgzMss40R0HkFveoTeQVzaEbIjMtDmh8dUDMBIHUmteQFywND8ytmaUL/EipHqzRKAfNBOsDB0i5hGjsQkYhzDsdnMJ8dy7ZM7LBg4MzTIRONpGRjKNAe+gWc4XbOPexTrlQH84uKYpApLN6CIxFKTYYScQ/L1hOvZO0w0Z5BpqwxJgPcDTdppdUp3qzjra8Z7IjZvYNhIoVhngvFOO3K0UdvdMvQihqe20wdq7TeGD80L+rPJPM74L0ochkfiYc1NZbPt5+t8nTe2XGRZ3Gz+o+7Czgb1qiQRGSvWEn+JLllsC2Cw5dILCWGdEo/O+/hGFef8RMyHwftuN+NXhDkmox3r8TJbTtseu27g1zopLlHWcohGRNsZAkLwy0a9ugdewvDvmYobnalj4L7ve5sLYfzDaZPSfFD0kH3xXtXWTfvdBucTpPTCBS/6NAcM9IzxUPDICJiuevY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(19092799006)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6wekbGBA1SoO+L5VjqFYIeVS2EPU2VxMRn/z7kn4P+M/ayt7ZDmAwxOUJ6VE?=
 =?us-ascii?Q?OYhL2/4/BnCqWifjurexXQqAdjXZ9lh1bB6hs6sAJV2JsByYzBKp6OBSJ1/k?=
 =?us-ascii?Q?VvanMFNdDRr1ZTV/QN76VJo/Fpi6rE5q0EGghip6zkpUV9cl7zLNZ20i0tY5?=
 =?us-ascii?Q?G0gfTBtQaJYpEXPgOrPv7cYPfU13s/PDpIDrR97VBvSM5EsVhePDWdsHj5KR?=
 =?us-ascii?Q?TvWKPkeAf7pPryMy1U7URDFnHB2Wpz6cGLNZJITr5kCYg/RmiA34nFqRCmhg?=
 =?us-ascii?Q?csQ95L9fqC6KhJt5JBmpX7Jpq8tM4QgmqcpcZ74OePn99pnwMbGSvM1Uj/lw?=
 =?us-ascii?Q?VDtjzu5k+ae0FTNACfrVzKliBz5hr2jp8E2Umz3nk2rX1lpQM+JyS8LSXQUd?=
 =?us-ascii?Q?NcPNP8u14Nue7MHxLxu9BwG83hm3RrRZxriqEwSggIAYZlI0fol2F4DCfDEn?=
 =?us-ascii?Q?cYP6NdN7OIDnMXKvlgQX3m8sHhdk/tA5akodMnBHhClJNi+MACso+KsKbzOZ?=
 =?us-ascii?Q?mSUpUI79Y5tK3F5pjiv0en9WJVTd8ibMml7kyLrn99QP0xAAxoYxsWfxCK6p?=
 =?us-ascii?Q?s0Bmh1nakhkQUN1MiuVs6j1LMP1wmAVIl43Z6I0WAaTtDwoQbMUGJz4gj55O?=
 =?us-ascii?Q?eeUGyf5zATV8WxcIhEG6hZdnlmUElxSU9WQVx/XSlxW3CWb7J19kZSLrnT3P?=
 =?us-ascii?Q?F3MQOzvQl18Y3CH9KrQBq1+vdoSC+fVKEZMcoYULf0RjFjJ6AECQUtvzn3Q7?=
 =?us-ascii?Q?dmC6cmD/PvxL/8dwqmO3b88RcImTL5Rufp9cYspL9ICCVywYxVxUILMt+2bV?=
 =?us-ascii?Q?DU3DIWtItmlwcAtoRQO9zA0b8jXD0qM25F8JTUuHuZndLUnbWcooKbdVEtWo?=
 =?us-ascii?Q?0u0HlAA9vn/FyAzm3T4sy/+w+U2ywPwS5vll/MGG8lsG7b15+a9H9anHDBU8?=
 =?us-ascii?Q?R7is5dVNueT5iCYe9TXNZZkMFMTZB5QqxzGLfcpVFDZSZQIm1ANc5ctYBXDP?=
 =?us-ascii?Q?2WOzf1TJCVPkM8X+TVZLdRS3crco7hozXoFC7aMnvMCrjkRxsapLc79VXxE2?=
 =?us-ascii?Q?ODdRQ6o36Yl020aoCS62avSfXDfowUtpIouhoe0JH9chE15FZQYB+HFR2+on?=
 =?us-ascii?Q?6QDZ7VBllMX3IrwsjO4ASsUYWalQ62gHzQZKv7hFxztHqLTOafo3bBjk6SJr?=
 =?us-ascii?Q?GjibfSj/eDclnNhpg5P9rJiOC4BIO8giPsrJ86sUD7vN7ZiVA1n0t75VvmF6?=
 =?us-ascii?Q?q0puO3AG5BMcgel+H0Fd9ffuiQPEpcISeF58FuSs682djyXsHAONIq+BJmOe?=
 =?us-ascii?Q?+L1jwlNrRdaq+R0uDan0KHecrunEjX7NNKHlJq/6gw6OC7qt7iKaWvJ0tNf3?=
 =?us-ascii?Q?BoTUPcMdDi31SEPCo86v9CV2jBKvFrntiigLMOL97rPc1rU5eIYMrFOKkQP2?=
 =?us-ascii?Q?wHC8nuN/6MSITuqBTEZDbZak+p8MI/9QVl+21aDTcmVSpq1+aRwW1hP2bsNf?=
 =?us-ascii?Q?xCAY1uixiXzf+D7oRxFp1VCnPbZ0Fl26KZHFf7t7MNNbKa+jS+jRE5VQNFlu?=
 =?us-ascii?Q?nJKSB+s3il6ICyp2n3TW7QoO1Msf787WQT66u57uuQFqO2Q+9yG8AtGV1/1p?=
 =?us-ascii?Q?TgN2Xb/Y7rZs8kwDDWZ4v8TcsGaMrKoP2mApRgXGGJ2nhhT6czERttF1FGBx?=
 =?us-ascii?Q?eszVbZvE2EnaUte+g8UVbBWKLdzJA9GepB/i220EXWCwBgMD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670b6a8d-8a23-4eb6-c831-08dea130ec32
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 12:07:42.6133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /l3toX/wOB/hduwgbYJOgFpxmAAKLuAfCT3y3d3C6h19MISeD2sdSadgHaXggp+lF3vqYux/Jm6H6NdV4zvROQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_050750_952707_C2D5AA10 
X-CRM114-Status: GOOD (  16.83  )
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

> Subject: Re: [PATCH 2/4] arm64: dts: imx95: switch usb3 controller to
> flattened model
>=20
> On Tue, Apr 21, 2026 at 11:53:12PM -0400, Frank Li wrote:
> > On Tue, Apr 21, 2026 at 06:55:01PM +0800, Xu Yang wrote:
> > > Switch to use flattened model for USB3 controller. To enable USB
> > > controller with restricted DMA access range to work correctly, add
> a
> > > pseudo simple-bus to constrain the dma address.
> >
> > i.mx95 should fix >4G dma space's problem. Does it impact other no-
> nxp
> > boards?
>=20
> Yes, i.MX95 has fixed >3G address DMA access problem.
>=20
> It's another issue. HSIO domain only support 36 bit bus access. If not
> use smmu, no any issue. If use smmu, it will allocate memory space of
> 36 bit < iova < 48bit.
> HSIO can't handle this case.

If using smmu, iova will be in range {36bit, 48bit}? How?

Thanks
Peng

>=20
> >
> > Need do break compatible judgement such as
> >
> > i.MX95 is new SoC and still is heave development. The break
> compatible
> > is accepable at development early phase.
> >
> > You can rephrase it.
>=20
> OK.
>=20
> Thanks,
> Xu Yang


