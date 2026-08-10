Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2499DC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ2L78A2GNCCRyd4ldlaJspP0cXCLRR0sgA6ivpfO+o=; b=CoAwkaa9nVI9A5/OzRuCWuO3Ua
	KfQ89V1ol/y2TQZYHmM8dpTHrUyzdnO0SSkVxAnbvbUZ/vyLkjxboeqMzEtUGo+hk4CtIFVIp/aKo
	K3Ag2ZNVLya895WJj6n4wvw+qSOetgrUSfcF6bDf0xdUSolDcdlmWTK56rOImqvnpsEGcDyV2f0Rj
	rhucX6GYIGG7wH77fm3LEia7bF9fXwfPhicSzYHLEw8QivqP902mOmngfwZ6CwKL9fOPJ+H/Tp/YB
	kYGuOydVDTN7ivg9LQrVXskPvVv8bVHSRJVWMr9ZS+fGCOZ4mDbO2mZJwwYqY0Z1+Xp0uEd6xueLl
	N07PHThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVce-0000000Cjxc-0HMB;
	Mon, 10 Aug 2026 19:25:20 +0000
Received: from mail-northeuropeazon11011005.outbound.protection.outlook.com ([52.101.65.5] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVcb-0000000Cjx2-2CgD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:25:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1tJHYI68c0BYxaxjmf7JGXJmoNJ3LXn23yjjAzijSk45o6XL7GGCO/OH8U4InqsbRAweCIUvXRQBL53elLU8jNt5bQ0z54vzpNOaJL2ciR45oZUu+JZV96AwlFYang5qfN3Fv6Wno3xr6r/iOFx8srMEx1UxnhJmP79vDMW+lrKJRsE8qvweQGEI4EpA1HXelqzOPaSns8KTkICMC9ZLG82WfmfKJdbaGez1G4aY+1uDUjMQn2YkJqoh+ctiMUL7wOzKukYO/ZeBQS43hlgkkgxGf7guiBxcPku6FBZ8+KhkjeHH6FtSK13Np9705sf2WMRbxwzgqs50eBP6rOF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ2L78A2GNCCRyd4ldlaJspP0cXCLRR0sgA6ivpfO+o=;
 b=W2JjTLLWxhZJuCOfKzbot0nWiePIbZXudH4htQMVa7sMQo+TmevyXyVJh6EQ/JjMNu4Dl8+IJMoptAL24yI7yfZYCyh2tYWD6vXpTcqC10HakwkiT1w2txtT/4pQ33wgppZn57NtGZ7548vA7onOW6KayLmJuABSNKo+mgefyyCmQPEdNDtHvId7sc2xIGWdEtNiaUq3m/RceWuaOQbbxGix4Urv3wtqex6BD31hiZ6nMfRIp0tOEilB4kpK3b9o/n2/7adsMp0VwAXEngwEV+q9KelcNwqiDD8AyoFrznjbXA2/obOCb9PtUUvKeZ4zG/DAPfUSgGN3sMSICJ3+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ2L78A2GNCCRyd4ldlaJspP0cXCLRR0sgA6ivpfO+o=;
 b=qSCr/IdMv6erxYwpCfrLe5lPulnh3V1/pxcypF1U7aBSHWjnzuOXFsUNL2lDZ0L3RZPbuG+d8b1FCEVexAknTsI2vymKV6XTC3JsMd6vmxcU4P21YxD72CN73aN5dxH5fveYvh2rFNWDx5GRIMd7aO27FOPH3bwcJwcIQxPeiUEL72gCyjTJjfQeWaGyRwV0OYfOgPe9vIfoKMDPrliofDvW0DbtPuGCjbNqP5sueQHRJ2lvJiR6KnbdVrBaTTQWV5oWUh6RoAdmUYmOnizia6X+UxxRBzG9/H5lUAtp60sNqs2LUYGb/WUCsOuI4RzIb/GgfEK3M/Dh/TbRcvVN1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9397.eurprd04.prod.outlook.com (2603:10a6:102:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 19:25:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 19:25:11 +0000
Date: Mon, 10 Aug 2026 14:25:01 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: imx8mq-phanbell: Mux the 32 kHz
 reference clock pad
Message-ID: <anoljVLmPNDYaHxn@SMW015318>
References: <cover.1786177290.git.rudi@heitbaum.com>
 <53e03c00c4c03c2f73d8012a602fca6031a52dfe.1786177290.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53e03c00c4c03c2f73d8012a602fca6031a52dfe.1786177290.git.rudi@heitbaum.com>
X-ClientProxiedBy: PH7PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:510:339::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfcd4da-99d8-4995-107e-08def71518cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|1800799024|366016|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HkCjJp3yzSLjomosr/F++jPHeSxl7++da8mhyPlZZP0WSsfgLpz7ft0DCzHhLFuJxTyOSfefvp6CsnaXy/Vdp0mK+haGqoYN5CZBaSPC2tjnbBskLCn5KQ/0am/l9ru5mZkYiy63lthGVThvCVgvoJRtPKDFAhILykFyy42a86AaXF9k2jMiRHkICug/Gxtvxa4qQk8V9v9BFaX214QFjpUojo8moAOtaMO59Xps6HfLhao9Ph5bVWYQC3rhs1A8c/twZprY9B8CkUNtTH5r5ODeyU9YWdZ8S9iYoyGrf/TmovuUOThnFD8rVBqBE1hRytl0vUzFJ7cBpTkQomjlGbAbo777SBVDAQ0Nz0/zYp0sTOoqNxYs41fjEjeWot3XRgKMl9XwhqUP35tYvcTJ/rG5ZPykIlipDYKF+49jJsYoLUug94F+eaXaDYPYDU+1aiYZXvctFEhhen2fTzohr5TL2MUnqFZXxbSR1/exyJwkGlgPTJIHpvbSP3X/kuCW+KpByXSgmQDtV0babDKG06m5ryjkwvn7FeNaR2C0AdIGOkwW2e4/5N2MU7XQfk1GjAvLNgjPABkwct9aZH6kswm3XZAj/iAz7QbjR3pMnXuTzmUDPyPmSt2hrJAOrI1uSOPnkeHWeAqSJzf7QWSEdxgYv2mPpggtKm3fVTKdIV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ra8UiqlMboJtwW7iHGUvz5xTBOWJ8WjYfo62tG114gIi255cpqNxTLSJiHcK?=
 =?us-ascii?Q?v+/gOj/O4uwLvRYiGMOehDigT8iSrXCrcCAKpqR5a0phlL8022q8gXqjhGH1?=
 =?us-ascii?Q?AsPuZruIDTEU9fKoVg3PRhkB+HSBLRMj9/D+sq48tk1q3gOgTW5wMb3VFIbZ?=
 =?us-ascii?Q?nJXe2BEFMhgHyjlxH7ZUS/pZn8oW+TbdApQelH3q+RhNCZHEjYVVcb446mSw?=
 =?us-ascii?Q?vCzwc5m8v/dX9TGNFBNxsu54lSXmumMCz3m3iKi3+jnbUVsheD6pCbB+QpoZ?=
 =?us-ascii?Q?2xOcYtrLygpYD2HNpYHpFnnbnj2Ddb4MKZQlkCr5R08PeXCWnr9TVcKreaQ/?=
 =?us-ascii?Q?OL67DYG9/pELletPRAKsmpfIjH/N9bWqio8jYpKjAGD+dW5YhJAuZwot8NO+?=
 =?us-ascii?Q?tX6WwAmo5BI+amGNnWRS+8k2Il9AwGOOy8/2wyOEwAf9KP0wp5UuT6oiZXHs?=
 =?us-ascii?Q?jpvxjezG8lGgJOT42tBygz8gp2W92Cmo1VZHLQgyb16ZQI8FDNHck0n/AyXK?=
 =?us-ascii?Q?mlUmCClrwBJr1yHfGglpf9oDi/m/s4Ikzqwu5QJEd03+f5jcnQFRIlfB3mvE?=
 =?us-ascii?Q?b8l/T0/vWg7aBhi0u8rbf4VLRHV+YuEWkbPlQE7DzwOorkNVle76kGn+atiq?=
 =?us-ascii?Q?yI9MWYN104hTanQZaULzMA07u2QltUUkdgZIL8GY5oUS77ChGaeoFfURAY4K?=
 =?us-ascii?Q?k9nFKLrnZPoqornelSMHCwwqL6R4dLdQC76cLH146Z+NZFX5z8lFee3oAVLR?=
 =?us-ascii?Q?axDlJkL86wcr1xub2jfhJmnmB22c0ilJVcgRPXPnmTcgt9nJ+M1NhvAAPlAE?=
 =?us-ascii?Q?N1zBV4piqxLJkjdT9Ch0AAQnaWSHf/SrNjBRfe8wavW/s6Po/ltYDmUFjFft?=
 =?us-ascii?Q?mCVIQRoqf8ub1E9hz7rKUV+SqfCXgXcytMKyV52fXXC8yI2ZIRnyEfPsXIpj?=
 =?us-ascii?Q?d06WXyHc4Bs4aWC6snC4MOrrH96L7QyL46Ry8hW6HkdNfmWHGwg5FQbZNaiT?=
 =?us-ascii?Q?5XkA9venw5ZRkg2rGf0XKC8OQ7uor435aFXB78qLAMn28KO4BTW6dVyNMMhM?=
 =?us-ascii?Q?YL376afvZljDCXUVodVPNrjXfphwdGK4lIMA3LTQFX7SlkAYnEb3OYl16Vos?=
 =?us-ascii?Q?30mL63hSTITVrU3zubXre2949jxpRsuS/QzzKtCpYmkRUL7VblZh9OPvE3Zk?=
 =?us-ascii?Q?9+Xs3XH83EHtT7yc6LDeAK+hvOAC+a+eQMz4Hv6Zv1pvjUMpCw1Yq7iCxJRa?=
 =?us-ascii?Q?DA5rynkACBeoEF1w6YEd+wIggFimTDmyJTqnADKYhFdTA0WlS/TbfW5adY4O?=
 =?us-ascii?Q?Z0foFAR0K7r7d/FXV6QA4wlMs3m3Vd9KSLCC83PNaYrGHVG8ABfXyBPGLaiX?=
 =?us-ascii?Q?0e1qt4UeBBXoIP/VQboSrdJPqyH7ywuiFOFAKLW7ZQUKNcOv8KtULnPlWW51?=
 =?us-ascii?Q?82hhSZ+TOMM1vGkhap9IY1mOQxoFDSMGEscEf5ns2R7vjvE/EFYgCJowEjbF?=
 =?us-ascii?Q?/0xU2qwm4mysWagOuuWOlRL2CYCqzi7waS8cFFe+TtNFqylEb9lI2pJ8F9Db?=
 =?us-ascii?Q?6J2wVn2pyRk8XtDBwx2oqKEiv9axi1XqELA2+nC4MTS47ufm7INv0Hu/CqNd?=
 =?us-ascii?Q?zjbua2tW/KNRKaFwSR/4w3nY24+OJCgA25UTwLGDrGfRkiU4btBPNLbANcYC?=
 =?us-ascii?Q?9zt/O4PPwnvH3LBgFAq5vpzdiWvTK+S2yDQ+MZehnd5VdJswqwk7XDOIn3MW?=
 =?us-ascii?Q?U4/dqVoG3OMQoabnbXKitxeO1AFgaaYTmF7H77WvLeYSYwkt4/z8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfcd4da-99d8-4995-107e-08def71518cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 19:25:11.8417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lghVInoogU2WtfvPmTUYD5WyQ6Vm3qqJANcJte6klY2ngIqTFGDsKhhw4rB1hVRoahaHpvg5PzbhgCv3ll0XUNVSICFmZtAwt56zb5BhiLe1h5lqm+8+yUYBnmHInf8Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_122517_568611_C4FD1F17 
X-CRM114-Status: GOOD (  17.34  )
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

On Sat, Aug 08, 2026 at 10:13:51AM +0000, Rudi Heitbaum wrote:
> Mux GPIO1_IO00 as the ANAMIX 32.768 kHz reference input rather than leave
> it in its GPIO reset function. Nothing claims the pad as a consumer, so it
> goes in a hog group.
>
> The vendor devicetree hogs ten further pins alongside it, none of which has
> a consumer anywhere in the tree. Those only set pad configuration on pins
> the kernel does not otherwise touch, so they are left out.

Needn't this paragraph. The first paragraph should be enough

Frank

>
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> index 58f7276eb557..2d134eefb765 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> @@ -348,6 +348,9 @@ &wdog1 {
>  };
>
>  &iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
>  	pinctrl_fec1: fec1grp {
>  		fsl,pins = <
>  			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
> @@ -374,6 +377,12 @@ MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5			0x16
>  		>;
>  	};
>
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x05
> +		>;
> +	};
> +
>  	pinctrl_i2c1: i2c1grp {
>  		fsl,pins = <
>  			MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL			0x4000007f
> --
> 2.53.0
>
>

