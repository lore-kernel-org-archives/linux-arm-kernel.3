Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D5CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1MfQyShZbEA3FMBA1sG/7K75DhEx4HHjCczkGZiEsQ=; b=PopwUdiHt3rEqLuFhOENeR5JKe
	U+S0o85mIenFcC4Tu5FaENyX1ixlWujJtBYX2vkrePyDjRlKRyKUqFnALtSJIDaw1WESImAwz6BUp
	Ez7VjFln0AsgUF9160DUEbrtIMLPXGKJ75/AY89VQ4wf+VNX4R8dL1As2yPhPOqwffKTukHy/XKgO
	K98FBQDXnsKR+k0tUYc2ryKTJKzWPjqQkc+F5+iG1r1U4qgs6BdHYB1Dc4gNqr8dhvq1aFgqF40Nr
	y/A0kMudQ793BzEAJ1zroShBm4XlFqmLFEH7R0x/Ag3OyyQVP60VScSRE+K8o2ybUcvIgh8LH4G98
	8MliIs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4l7V-00000006jbP-3sq5;
	Tue, 15 Apr 2025 18:34:53 +0000
Received: from mail-am6eur05on20609.outbound.protection.outlook.com ([2a01:111:f403:2612::609] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4l4X-00000006jCB-1tJE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:31:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AazMiFBXaE2ygqJkluYXxK2zbz54aFcva8I5M5NxJ5BVHRGqaA9YOhrApm2h1vTXnq8Hhql17aRBCPpEovymT3nH7TAsnEQLd8TxtKpCshoal72FCB+29xwmlGjuvTnGU1KckF9/BlQRNW9bAzYrK9V+eA5LuabczFHbPq+jroOFBbD7qGLwHGHSHoEjbb/Y12WgE4n4HP7dkDe3yJYdP11KnYWPcDIcUmiDvK6oOdNENGq5s9Uq83qSI8iEbzc7QXxuhENPQpqlgyqcGAfAJufSxYj6TqHPmgQ3uHN7ifdw2odLyTqhBZwv9jPDFEaqLED7an3J9EDk+39TxOaefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1MfQyShZbEA3FMBA1sG/7K75DhEx4HHjCczkGZiEsQ=;
 b=fb4/LeAZeNDEsoFGEklK25GxpaEqz37CIbGErjkqSD4fyhNkp1nL6JtCsqpT+46BqlzsD0T//UjyGbKYRl+O6EyjNeduPb14LWxtPjNwTiivV9ReTT2605WC2Ch223kEABc7OxU2K4P9T/Ddql8mOXYnPYW4/1OxzAP/Sea4JcvzsZ60oRUpKcQTwVew29Jk5saO/lF+uos91+oAKkmrUODO88A9wC8DEb77OMlVM5itcq8zKOe2ElPURK9X4GJFVDIfI3KzlqkEANaH44u4PPnkxRi/591zhMOxIgBHYZrV9PJIl1AJ24OnljSyB62vWmM7bKN914C6ArQ/TE3pmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1MfQyShZbEA3FMBA1sG/7K75DhEx4HHjCczkGZiEsQ=;
 b=KBr2IJBFbeFUP3LP1Ejk4BQLixsiAVFqaH0GGSKDT9FDPnSXrBt0uTFmFySetdwcEVRmHts56cA1KGV/DAH3x3qt4BeJeTap5v+5nRxXDn8puoaryqi1fQ4gS7LZck9UnX0gfyu8Uwp0r6VBgyU2mqQNg9ZqbN0wPgR4/GA8VVV67Ug/0yIRqGI9xTgDegtPHWZ3JrMSlOTinGOjQLc8M6tzelitq1XkgyMFCr6xJg/cytAE5mqN6X9quN0C7vgb/y/az0CxyBHPs515hPikPHU3JGFNn5EOyQlUeSIN1dwZnpl6YKtiNB/eo1gp8INMU7alkdfkTQb8ZXLNx+gqSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB11059.eurprd04.prod.outlook.com (2603:10a6:102:485::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 18:31:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 18:31:46 +0000
Date: Tue, 15 Apr 2025 14:31:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 07/15] arm64: dts: freescale: imx93-phyboard-segin:
 Disable SD-card write-protect
Message-ID: <Z/6mCgtpElbvwjOG@lizhi-Precision-Tower-5810>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
 <20250415043311.3385835-8-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415043311.3385835-8-primoz.fiser@norik.com>
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB11059:EE_
X-MS-Office365-Filtering-Correlation-Id: 33607316-42d3-4262-37f2-08dd7c4bc728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?48psg6E4wrdvdQlUM1DaZGBTqCh2JlmTVz5Db1m1VBu2FFsXRcC0uXvwM1LU?=
 =?us-ascii?Q?bdCEuNm+KLY2aSxFvZyTMbiByntu2ZgSYXpQW2lWUn3kBGEiwFMy3tqQQbbp?=
 =?us-ascii?Q?Fi2PwWZcTlRl46YhFec6NH2CiRHDyVf627vfPTLfmGNTyk/lfVxIHihPvaqc?=
 =?us-ascii?Q?QXWmEbOhuqpiIrCz2AC66AsFH97GV2uRWfr8qZE9JLnkV4k0PTY3gcBlFxGR?=
 =?us-ascii?Q?sbWxUO/yM6HspyeFZYyvd1JoI9mvg4cPWQOEf0so6hIreDqWNWnC5kbaZbrQ?=
 =?us-ascii?Q?eMnDJVUj4RyWEscLh8+g1MmbnpLe9uLBqpnWAS/zc9G7Q17FGQaMZMiq7y9x?=
 =?us-ascii?Q?9CwtQ4SOpQqAwceZnOBVRP0HyikbT53zljMPCVmnr77j4+G099eKZhdlWY5u?=
 =?us-ascii?Q?VdQCvyHZ/aRoeIBR48CvGy8c2owLcpraQAHGrKK2wBxuHKyrcJCP11hIn5Vp?=
 =?us-ascii?Q?O1e1scZ6FT1CKPHcwp6qbzIomJ3995oDvwItDgfsE5pfVAtkDYlqnuW7JUSk?=
 =?us-ascii?Q?QLzLRQn+8/Vt8MFEYVtsPLvbJA00BPd2ZQx+kD36sURHVHk/eWcr59VOBZI7?=
 =?us-ascii?Q?Cfs7GAMfYCMD4bhBrFNQEJajxdF7wXikBkkPN9cEpbKDr0QMwo1pFalIxFVh?=
 =?us-ascii?Q?MujzDNLtMoJ/TLp4Z7bn87rY8REmk/AXAxBkMx8gs0DR9QVY3LETP0u5qm/N?=
 =?us-ascii?Q?s3Lex+3+fh7sNRm9rNTeWjsglUeL5ae/BEoT1AghXTistEQxHbpl+wpaG/3/?=
 =?us-ascii?Q?dxcfcNZoed/Vcyu4su+7GSh5k2f2xMpGQ9l1AnhjzRl1AHrBdKED7SRkjEKW?=
 =?us-ascii?Q?b+nzuwUzPAZ2hCucSW/TRXlSxBvemb8+BZx+0u+jtlrcWSl3AkkouPzh/H2n?=
 =?us-ascii?Q?etJI9YUNNuLhwN5xlNqsfOuO/9yMNgW9PJYXDPsROuFwJESwX3s8K+HBOrJn?=
 =?us-ascii?Q?F8BOcBEQV+RcCYNwIaTbSAGD8MCBesuiBOrVczrpMJutHM2Of2acVbT1ZSu7?=
 =?us-ascii?Q?T3Y2SOmUX0NeKty6r2J7vgr6G4XXzziDmOXM+JxFDjhtdDcrAYJ4Isk5un75?=
 =?us-ascii?Q?9VXgzvS5DrW6cck4sM9trpUWr/jsVF7burrC5uAEMsFTjtZZrIxmuLOsdx75?=
 =?us-ascii?Q?TEQCy0t60EoGQbmPZ/f5hSM5i3j5M1lSx+rL3CT8dl3Ow05Y8FqafnBpKp5Q?=
 =?us-ascii?Q?2NyJ4fpmiJ/cH0/G3+Nphv1RmlctutN/NOEhmB5EputwVyTY9HXjXANFY46m?=
 =?us-ascii?Q?YN+AWpSpcipLNgWwmiTF8fF3aD0vsnlCi8/aWPVYZ15mhSwON3uSon+ufVfW?=
 =?us-ascii?Q?s16FE8Jz+gcLDhNe3I4hPTKV5tukuGsKc95YxfG4Q+2TKLNde1Xvb88PY+he?=
 =?us-ascii?Q?5FfJGPkZwTNvn12N3nFFnbKDfX/WkBNJMQHIkLhDEpoyhSQv4D5RQNNNBH8F?=
 =?us-ascii?Q?RrlY/UQ9d/9Djmnl54HryZhwcTfZ05zrd234U4edwi9xKNsY1zkHoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5dlDo5877FNPLz7ZuiyeL3CKgcO9YFDCraegjzDfIZ0YPOgzd88mLFbHl19A?=
 =?us-ascii?Q?cadDWnwK6CdmOjDt0z2Rkxyo4hSQR5LlRPfzq6z97N8+ZoUqA5M0jZeY9f7A?=
 =?us-ascii?Q?xuTEOYsqaoUv1pt2YiDy46owzwnE3OvXHC6iyRG8g+6u65G7Bs1O4P2D7fCJ?=
 =?us-ascii?Q?mWGc+eoMqK6p+5bEUyHU1EqQxETPxTnu0naNkMR1Un8WxuyPaBWSV3bStXJQ?=
 =?us-ascii?Q?3EgDSF4kWpkl5t1cWyN4Ap+toXZ4/jETcajHbeLj48bSJ0NoZ5T3zTwpS/SV?=
 =?us-ascii?Q?fX7lhyz9HnZoq8m0le7wjx1iumxIdwD1orpTTDBuZRnVvExtKlK8NtsHtTrO?=
 =?us-ascii?Q?Hrn8Lf0aAoXA/dQ7c4LE/mAObviUxMX8fnWLhC1jzlRUKvSAkZBIy+MX25v9?=
 =?us-ascii?Q?BK4dGoX0kHaFHrzVSFJCR+jPcpuFU+v8V48YhmAh1KSDIpacFViHBXvky27t?=
 =?us-ascii?Q?pZSakYct+ltuPbnmQIafrw0qp4S/bQ5tsUcSsIRy2Vj7B2FT/kacHCfRxACO?=
 =?us-ascii?Q?UNXVQZK0P4uNwE7/kNZF9T/dPy/K0cOoDKTlLH85CdaeejZUonhaVE/lbneO?=
 =?us-ascii?Q?BwOea+xVAteRJMMBjM65KyV7Owku0UQo+AAnplEXsoGKsV26N76Rc/anEVC0?=
 =?us-ascii?Q?OZEwSE1XwkYkgZ4kceBBG/iNMEuZ6DaZDCGEDYfiTNUXR2CEwcyPuyVrMENz?=
 =?us-ascii?Q?gvJGq7WbEHgV2gJxUcKB029wMRhJywEpRDzOZwwzqkAhxW49ZcVe1YnjYbjX?=
 =?us-ascii?Q?+ArKuUKxMY+ZRl5WinEw+0I+fl/qKLZfDfweb5yAb3AhQkTtBlXI/TB56r7H?=
 =?us-ascii?Q?Xo6030NvC3nrLRquRrbY4NcjiF0n901t6RSHWVhKih/S2buFXgMECq6+6/tn?=
 =?us-ascii?Q?nQLwZp96XWMB+JcIo6Rx0d6hUUjWpOq4Xx+tIgppxXZew5LVqSYVvIcudCXa?=
 =?us-ascii?Q?ThIh4nxBwEuqmd+TxF/xlA1CmR+Iv5l4va2a4kwVOW6g4W2nBONbontvdqjF?=
 =?us-ascii?Q?TTCRIUFd857aeSz5HoBhrGYH+O6nfQ8JfFD/Fk+xeQCLmN1SJhIQjdRL9Fiq?=
 =?us-ascii?Q?vQsPz9RNdNXyGZQB8jRWuh7nscHX3zNHyX8todkVs1NUdoCJtVbP7h4rlU+Y?=
 =?us-ascii?Q?ikPWBXgwX4ASz/NWuqfh+jV9d2PZK3qFyF0jvpvweG8qk9cpE/Bd77llYf/u?=
 =?us-ascii?Q?E6Oeu0HCuYDvRhKWxLFdSOOXeprj2/E4JGgc/G+eDEDFrLpjLtA6buVs2I7e?=
 =?us-ascii?Q?ASoifllWBEqScMHgaVClQ3Z31Ix3UFwiLBBt+B37mj4GyEZDpDrZ09I5cj2r?=
 =?us-ascii?Q?kPRbmpDhHkaKIyd9nb41D5YWdRunwky4LEms5EEkq/F/D7W55Clh7nvKgLoI?=
 =?us-ascii?Q?9Mygen3wQflwrTz9NAvqbDtLnTVhLDK6S3dwCrmDoYn2ZLSiUzi4IJ/o4Keg?=
 =?us-ascii?Q?yqwwHElZAmIihzk93mmi8KeCCpreDsdbHhZmDLX7AoaHR5XUqk3N2spXewiz?=
 =?us-ascii?Q?d0UlAAWSEW/eY4TH3BRnrfkKqa4rJnyNM+NzjaVssiA/iXxDPbdpBIyxp6QR?=
 =?us-ascii?Q?xFl5FVUSmsvNwo5D1Ox/GM9nky/nHvuuou7dxwXk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33607316-42d3-4262-37f2-08dd7c4bc728
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:31:46.4826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ie8SvoaekyzIeJlbPpNyoEfz7v0sxKi4Dw1xk3B/4O8Gybca7lB8xZrfSMtaVkiyc13qsj+Fi1WSB09Ns0iVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_113149_493472_3985183E 
X-CRM114-Status: GOOD (  15.91  )
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

On Tue, Apr 15, 2025 at 06:33:03AM +0200, Primoz Fiser wrote:
> Add disable-wp flag (write-protect) to usdhc2 node (SD-card) to get rid
> of the following kernel boot warning:
>
>   host does not support reading read-only switch, assuming write-enable
>
> Micro SD cards can't be physically write-protected like full-sized
> cards anyways.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes in v2:
> - reword commit message
>
>  arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 902b523fc92c..3d5cd0561362 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -48,6 +48,7 @@ &usdhc2 {
>  	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
>  	bus-width = <4>;
>  	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	disable-wp;
>  	no-mmc;
>  	no-sdio;
>  	vmmc-supply = <&reg_usdhc2_vmmc>;
> --
> 2.34.1
>

