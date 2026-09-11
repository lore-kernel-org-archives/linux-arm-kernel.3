Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A1BC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYDk4kQI2fd79w2FWsht7gGbtYChEDHGbDZdkSKsjzs=; b=t0jt6DTaaycfOvufR+arl2UBS8
	ci9g5/ZTBdjCCmjtMMBZQkQahWLO0DZou0f6Sr4ApN8jPLK5dVl0j1gYmYVcNdOjukIkNB0U+bXOq
	XwJz0xiNMsUtgttBaQMqmxfx/RHCkDg0QrMDKE4HAvSYrMT1vkVbyHcVoOJHBxnjFEgjxniaJ+xKG
	kQNGoeiHCqliuR56HMTV8pWDsGOXNzP4ZHWsdOZ+oO16XEQaXJ6SdLSpWdH9sRIdkqi4oolySbx2H
	WL7nwbM0YowZ4RXdUGK3uvNlIAR+7dAlzOWpWBEd51zbJLNlQYyA5ehjBTyznB1GLPFU8vA90bCzd
	ezE+Lx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54bW-0000000HHfr-36zR;
	Fri, 11 Sep 2026 16:59:58 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54bT-0000000HHck-3fzI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:59:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDk4IcK6tHFjMacJ6Fvral4h1zgHAqqkhCr4iYXY+7Oulb0hzS4tL3dLHhgimcyOxCg83JWUeJBo3FS74wvNI+pZL7R9bf7BUohJBaS3zevFtd5J4PvRTt4njcicwpHKQOYjKUTlROjuTsKe4Px82FVd63F45dy8HxgvkHUVIf6XaBPOAaIXrQMM2MViCqd/w5fHhjGdYFPYwYSMqUTw4X+SEoMw4mq9B8USCg8sQPhGQ7jgt6CFxO1G8oSfp4fj0Iy2cOO6JsZ83dq+wEaeaR6TRjbHWQniQNKwhQGeeWKheLqebzLrHWMz0SBvrxSMGFKTKL4LD2xISLYkcbgfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYDk4kQI2fd79w2FWsht7gGbtYChEDHGbDZdkSKsjzs=;
 b=yJApdW0s+zmvygwbAVNtoCXaHpyb/bmVCmk5vQ3CKMDkRFMDtGsvikdU4bbaOuwNeaUlZf4A6P1vv//OnJHIwJV2WcmKGVUFoESqc28ZRA229hKW9aomXZiNcdrk2dpUqva5uYnV7lkaiGoj2lXbZ926Ate3awVYKO9VOGX/GtdvLW+78qotPe3D1EDwCpRe51nX4AS/A20bJ19Y08izZ4NSr/bMKjYoexdFv3Q/woDRjvvIh8YTP1DyVg/k3xnpIYKp/s19+LJrKzREGqdua6mSANhLXL/LLZv8uG9f+kDyJHN1xEZ6+jlxWWtPEvPuZI8rbEVg5J47Fa2c6lsrTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYDk4kQI2fd79w2FWsht7gGbtYChEDHGbDZdkSKsjzs=;
 b=W0Z25iZfA6uArVcNC/U0Jf4IlxvHIf90pjo42nb3SsTDbl9OswGD7QTw8jMOcaL8dCpVUR9xjvFUumGhyMkHie9WmzwO9FM9aNJpvN+wjl77JrP1f0/VyCFuGARBSX40ow4OiKmZRgV6VoWUIrANyfMr9AkmEzyChDsiMuJiYupnqjq2n8pEHdOIpa0QS4ujsIQ86Y9U+Z+5ZZZGzzOqSqujM7CCgsp3A5eF9upxy4zeRQiWGvCkqNhFFGJvYUuu6EzYawBo3OhaRCf5mTToRpE6pTeDNRWkIyzcosHmeXMK2+2VX8mCs7FNa55ah3oy2qE1Ou3bNxGmaMqtCw4xMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI3PR04MB12439.eurprd04.prod.outlook.com (2603:10a6:290:74::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:59:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:59:50 +0000
Date: Fri, 11 Sep 2026 11:59:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Eberhard Stoll <eberhard.stoll@kontron.de>
Subject: Re: [PATCH 1/9] ARM: dts: imx6ul-kontron-bl-common: Replace UART3
 with DIP switch GPIOs
Message-ID: <aqQzfBp1gzQccGWt@SMW015318>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
 <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-1-4d0e8a75db79@kontron.de>
 <aqGpZQlbFHD_-hVg@SMW015318>
 <e3b4c69f-6bfd-4765-b3b1-abf0958b5446@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b4c69f-6bfd-4765-b3b1-abf0958b5446@kontron.de>
X-ClientProxiedBy: PH7PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:510:339::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI3PR04MB12439:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b3a2e1-c42c-4c35-5b5f-08df102617ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 2tW7QWqZVIpVzJXBGlupaZlJek3S2KCFRw0vKOE5NpUtW4yGM1ZYa2jYefZsQocFqBJTM9iz7nAgQOZqcdMNHUEU40V81d0bcAFQrIUZlqMH2WR29pCjoPuns4KV1KlFdSxsRkEqN+H/qfgmWJOeJP7XAZxG+BvKtV6Y2ehD1PTxu6JSFF9z+BFEVoMqHLzBknC6Jl6XEHRaBe4AFihVe1AzTE/11i5gTx8t7AjhrzkdvBNiQwRUmbrih69nPPNyjHL+Syd8CkYJ55cExPZpmLsoixk4dSc0vuFBQBTW7jXqRsI9x6WjERfXSQ64T/oyHUhXLTGSaEr+KTeDSz11BOn/SQdYMwIHqPc+bJpadtdF3hJ6J82R1+sCRdOo0k+s2nvR7Do17+GWJKRDdyjIqBd4sQOLzcXwZnOLYM6uI9khtuzS50uzqICqCILF9wBBPZmkJE3xol0IBKkTcYPgB7JzAyxcg4nMEqWJg+iU9idHyEG666L9TQquaffKHzq++3xzEnz31J8IrMyhfySA0SNRAyP6HVDUfK/aKIyCfvURprO3Y4a4wmmeoUCu/Tubc90SN+bDi+Wf7MYVdpvX+wcRosV95wXabYZdU9o3hHDcZVV9z2But5eb/SbBaBidoPmC7PIruu0QGNQdQXDwPyBVgDTxasGufumIX0aHlmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdORz4UsMmBo1lLHqAgH/6XDPGrLGJ7FRj2IVGwLyuxDcvm2FbVQhnfCpOag?=
 =?us-ascii?Q?Y5lsUstUUOo9cUy1oB/0Xr7BVC3g+MNpsCChO8DxqJ3I7LkQXbT77NwUoVGf?=
 =?us-ascii?Q?sZddE7NCUXeU5ptu8ajlWAgcn3gpCiAKUI19H/KvRqjogJchHTMtCSaSJMhV?=
 =?us-ascii?Q?GXybgMHsdN/cpa68Xr43OYfxRJciD91R8VVn0t0qYNgsnGr37KlC8GdlFRvl?=
 =?us-ascii?Q?12c9hsb2oep4/i60G3pKpIVZdtLd/v+0s1Ih2knsD6RLfo8yVHF6omuPirgx?=
 =?us-ascii?Q?H9DEg3/u5vdn4NdDL25XkVOCOVIeV6cN4MYFv8HemKHwN+ZSLk2otpgmjOhi?=
 =?us-ascii?Q?V8VIy8DT8e6P21rWlA770ATg/nKf5EOmC7gRnkwivs599Pmk6sLbosfMFxJ+?=
 =?us-ascii?Q?jtoT21Vy60j4haga7KaBejUBrqnLf/6YGwaRgfnlHh5ZecMYfY7L3vF28PLD?=
 =?us-ascii?Q?sXlA2XpB0bF53fOLXdWz3KTHSNzzT6+HblN+pqLP9lrPV5trMsmqMOm0b3RR?=
 =?us-ascii?Q?6jE6zYbtIPmH2mBIOn81bq+8XAHhfqP5R/C4vB7DDd5Bt+N7RLxWATgA9xuG?=
 =?us-ascii?Q?MnKrknevAE0Nj8WLk14KlGYfN8r+W2ZAmabfZg+oCpTVpyFHrt99eupBZjqb?=
 =?us-ascii?Q?V4PTHq9YSsADSjoWY0eU9CAT2xtJ1VnG9aFKg8rlYSmecKJKP3wkX83wEcdU?=
 =?us-ascii?Q?WXTNG0V/NtPKKD4jiOT/ne1A64nG1z23sdVE+OtICh10SJCTUNqLuUe9IJVS?=
 =?us-ascii?Q?GaOuH/2hfABb5nTjvcd/AibOPwDetagiMuYM1zcrFbuN66GJoAFQ6JJRVIi/?=
 =?us-ascii?Q?toGujbZWYEEEm+3QLYMOW2Qptn8SkgXXF8mNxHWQFuUcSksxIJ/TZfOu5kbz?=
 =?us-ascii?Q?NJWg2qqIctKazm1DpkWV9xh1CNn/5ykmb/KK6SHFZ2cLEOC8YargPfKLJNdd?=
 =?us-ascii?Q?tVEMazsQ0aBskDEUvXBQwjt3fIUx2KftLwC2YTPVC+tJVMj3pTjYu3jxa029?=
 =?us-ascii?Q?3SEBrFWJdPAd1YeZymIHgYDfzzhDdGWQvz+Idn5yWOBmmWlupWWgQHdFzzqy?=
 =?us-ascii?Q?R5ALdFunH5s6R2BhczHmR20xCryhrTV8yHkpsXNfgDi9n+unSXVpfi8hloFj?=
 =?us-ascii?Q?wgJgahllMex/adfMn6UlnSQyz1jGoYVSv92sC2AyP4/NdNO6nIPoK5z/rfrk?=
 =?us-ascii?Q?zxMVl/2Lmamuw3Dmo9bAwCo9p/WQw3qBnYP40I1do2sbbQJf+sP7GpzYOuCs?=
 =?us-ascii?Q?gJSvOOeGANYBcFwGSBES6UOfM5XSdlBCe5Q9arRyGdBfXgZb8umeghm/67vs?=
 =?us-ascii?Q?rkPm06jlSSfaCsqqJp0TPx1axZJnWFeDOhqJNf/NydSokC6FW7b3p/DPQs4j?=
 =?us-ascii?Q?rTVuDFgun9hp2dFxde11EpjmRrKrSdI3H0a6JtfYYzHafvKa2KcGWksAHio6?=
 =?us-ascii?Q?a4HcKBA6N69YOOTAHhXQAbewAVIIAw1xfZXqfLJWXs5PAMmij3VMIFjv5bfw?=
 =?us-ascii?Q?z8iAAKQ9kaxBvdYRWtTzkVnvotRDicC9odC17fZsFGXvG05Xaua5U84sM0UH?=
 =?us-ascii?Q?4FDV18eNxkAZ24yYlDP606NEsPAt+ldi/hbwTU1tnCc+acAjtNi2jdnYvlTv?=
 =?us-ascii?Q?qhXPRZYx9qtaItamZR2vBrQDZWEWrNnA4w7+S+wv+b0eO3AjXrMzMLWb5AHP?=
 =?us-ascii?Q?oH05/LStoRf2nKye/bluw6OnIFMSO33Z15OkM80AEBU1onLL9QgH9bzbRy6u?=
 =?us-ascii?Q?GNP8JHuc+Y4X1bBlgmVk2aL4oPimjMHJHcI4Mh3r94e0VOX0C98X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b3a2e1-c42c-4c35-5b5f-08df102617ae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:59:50.5084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWgJ01J3w1/7XOU9pz0gHsVH++yUsxijlrgdX1878UF2RmuDeNLoW9xUmwRwLu9fwj7/YjxOLYh9eXPv+axXAyIWDrvSFX/TKjiTb4rVCKZylzTUWfB9tQpRUDk67xS6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12439
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_095955_954730_ECC5B870 
X-CRM114-Status: GOOD (  22.30  )
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

On Thu, Sep 10, 2026 at 09:05:14AM +0200, Frieder Schrempf wrote:
> On 09.09.26 20:45, Frank Li wrote:
> > On Tue, Sep 08, 2026 at 03:51:48PM +0200, Frieder Schrempf wrote:
> >> From: Eberhard Stoll <eberhard.stoll@kontron.de>
> >>
> >> The latest board revision has DIP switches and lacks UART3 instead.
> >> As the old revision has long been deprecated and not maintained
> >> anymore, drop the support and reflect the current state of the
> >> hardware. As the old revision hasn't been widely used, UART3 was
> >> only available through an obscure extension connector and we have
> >> carried this patch downstream for years, no users are expected to
> >> be affected by this change.
> >
> > Remove "we have carried this patch downstream for years".
>
> Ok.
>
> >
> >>
> >> Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >>  .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi  | 21 +++++----------------
> >>  1 file changed, 5 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
> >> index f4c45e964daf..a71669bef7d4 100644
> >> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
> >> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
> >> @@ -172,13 +172,6 @@ &uart2 {
> >>  	status = "okay";
> >>  };
> >>
> >> -&uart3 {
> >> -	pinctrl-names = "default";
> >> -	pinctrl-0 = <&pinctrl_uart3>;
> >> -	uart-has-rtscts;
> >> -	status = "okay";
> >> -};
> >> -
> >>  &uart4 {
> >>  	pinctrl-names = "default";
> >>  	pinctrl-0 = <&pinctrl_uart4>;
> >> @@ -283,6 +276,11 @@ MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0	/* DOUT1 */
> >>  			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* DIN1 */
> >>  			MX6UL_PAD_SNVS_TAMPER1__GPIO5_IO01	0x1b0b0	/* DOUT2 */
> >>  			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0	/* DIN2 */
> >> +
> >> +			MX6UL_PAD_UART3_TX_DATA__GPIO1_IO24	0x1b0b0	/* CAN_ADR0 (DIP sw 1) */
> >> +			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* CAN_ADR1 (DIP sw 2) */
> >> +			MX6UL_PAD_UART3_CTS_B__GPIO1_IO26	0x1b0b0	/* CAN_ADR2 (DIP sw 3) */
> >> +			MX6UL_PAD_UART3_RTS_B__GPIO1_IO27	0x1b0b0	/* CAN_ADR3 (DIP sw 4) */
> >
> > supposed header overlay or real user should set it. otherwise, the real
> > user set it will be failure because pin conflict.
>
> Sorry, I can't figure out what you are suggesting here.

Please forget it.  I mess up.

Frank
>
> >
> > Frank
> >>  		>;
> >>  	};
> >>
> >> @@ -334,15 +332,6 @@ MX6UL_PAD_NAND_DATA07__UART2_DCE_RTS	0x1b0b1
> >>  		>;
> >>  	};
> >>
> >> -	pinctrl_uart3: uart3grp {
> >> -		fsl,pins = <
> >> -			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
> >> -			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b1
> >> -			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b0b1
> >> -			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
> >> -		>;
> >> -	};
> >> -
> >>  	pinctrl_uart4: uart4grp {
> >>  		fsl,pins = <
> >>  			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
> >>
> >> --
> >> 2.55.0
> >>
> >>
>

