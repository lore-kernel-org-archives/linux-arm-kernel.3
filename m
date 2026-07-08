Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA23DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehSAuOS2jXh/ZZMKmGiBH/r9ZaZKnAZLSQFZsCMC2xc=; b=G+1Mc9aBHkC/6X9wTJg2tZmByJ
	RG3ij2Yvf1PqlPAtxBkuRm7DrQMbXAwb3BvsNrz8sfFdKzvYdSbAZPswndAxaT9DcK5I90mYdV8Rw
	wZDz84m3po7aYVI4wiKr2bW/twBAjXMVy/g6CTZjbXxeipa12lAQwULRyO9uN12ERpjSKoButyZrl
	yzHWu7pZlm2vXi4PY7aLTx3k9+NDtmQE2SR1mLwBCURiZW1MPyCOAC0hhsfySKopZhMM7adspt9mg
	IXZD/fZ4bTd8ewHUFbzv6ow3AC2qrCZ3ZLJCKOR6uB/T4qmmiS7D6lVS1KZ8S7eTen/zU6Lmh+J4B
	j7HRZHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZ4Q-00000000NLG-3j1v;
	Wed, 08 Jul 2026 20:40:38 +0000
Received: from mail-northeuropeazon11012014.outbound.protection.outlook.com ([52.101.66.14] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZ4P-00000000NKu-15gB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UA4e6RjOuUXGx9L9V45hfGWeWxYVuFjB8UOeCQ1JR940cdEBCED8GsrDubMnW2tWbxPmnXu1bl0v66+HUrmoQMtZAZH5q1LlKnaD5W8p/b2McnuIVFG+1FDyf6mnaWC67nigDXHF4c1oNFyMhWjPFKr4VZI962K+Tah/hlOO+zAZ8NkAOKiNiXcqnjl8HQAwCHy+nVXB5mVXPy3t/EzzI54UjBoExxqfcCJQIcm6ioOuNlAjI2ZnfbvSWJn+E5adK9fd0FjOKKRwVmBI1QtbyMrQrP+HurSz6PmUIbrZdS4qG5DPgBhpxuFkIBl9DpbCTI6OFvibrhvMEiG9bo10Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehSAuOS2jXh/ZZMKmGiBH/r9ZaZKnAZLSQFZsCMC2xc=;
 b=d5TLl+IMgJcl593uWsewN60pnJqVqSlOr34DlK9d6S0S1Wm1YB6nLlX6pDvXF+tQpnmlocIfcc4xssiH4ztbwRXVBhdj9vM3YcbUsDxzFiMcuon+WHRrUZAx2BXx/m7HWidl5G/7PbYBU36MhFNI38or39vhbVE4dgYkgon6vANRV0cqex33rVB+Od16krYWa2zlVhgsKafJO1OUUdMF6Itx8wB60hngyiwu97pppOze8TZZYHZjAV29j/Pvs5WwgIFoqT2f+flErt2CCb0m/wIkSyeYU18hEvJcmNy2hZYfGIz4oVFfD3HZ4WhzybsTMTpmbpJypp7lRhWLY28dQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehSAuOS2jXh/ZZMKmGiBH/r9ZaZKnAZLSQFZsCMC2xc=;
 b=juX+xq6Dar1zAv8DyrxpxBVKWeIAmHryJnBoZjNvx5VmrgNoNDoB1Tlru6iqmr46X8QvLM/jadg4xtk5VXR+WeSfBQenBcxdkuaMYgHL4GK2b8HiADGlyyneVH7i4fvrmHgFwXXuh2WtOx9hgS+SPnWY5BmqLbdtME8gozd/86EvmGLfpkcsB5axe/K6Dj5326Mul72CAUereQC/FeCBXBiG3QydU5eTUpQQagxjB9Pgc72krMpaJ0qFGTtYM639OQtZTp1pwboqYbib5UYkkVXL6sywYRZFuSSGPFgSgzelxApaMTKN0mycGtJ64H9vDjqeC6XLf1ub8vcImRj3qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR01MB10416.eurprd04.prod.outlook.com (2603:10a6:102:23f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 20:40:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:40:33 +0000
Date: Wed, 8 Jul 2026 15:40:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: chancel.liu@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] arm64: dts: imx91-9x9-qsb: Add audio-related board
 muxes
Message-ID: <ak61tj-QzbPMWGDQ@SMW015318>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
 <20260707065725.312450-5-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707065725.312450-5-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0171.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR01MB10416:EE_
X-MS-Office365-Filtering-Correlation-Id: 35dbfb63-ad38-46c5-9b15-08dedd3127ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|19092799006|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: FU6oHHsIfdddLA7NTemKC6E9DOkBfdbqRPhl4mTxT2YVAffyGqlqcRg2dzOtsf6FjZz1WOq3mB/QNRThHzzHdznFsju6sB30yx8OCpyKyVHQcWUyJ2QrpnM3jctqHBA5cY+DdjEUIQegMA7LHZLfCiLO+Wvyja/o6buuJ0Ii/vZtMF+1IqwL+8/gK1x4uuF9N2fU9p85eName9lc8Wa00gRXmLuOZBsdJllL+5y3V82KDAz112yI5JEYM+7KtxQD1JBfylL0wDAAwrgMwQjI/tWmsvg5UjacocWPMjaAbWhCYMq4OJSmgFA+g2lk7B2iD8HdoTQmBmX4dlByP9pUmxhW/0NzVQBtVk2Mxz6oJAVl+xX7cZC9lV44HnciPzBLhKm+buIU1bwBOoFG06Wm0jwKnU6suVc9yioQCXiIF1DXnDPwUOxHE/n9MU/f+IOhhBmea3CjCm6JDtP8cf/foRZITR9h4InZzhnERoLlpLE/UI27vUCrHf+nv+uNwat+YLbIoXN0VDTEnkObjgZ8Q9a0sQIrkTP3Ft/heFHdMA5GR/jc9BExfuGm/RzO/SBKr1uYz7cVca1Fnli16AW8lOVuX23xUdU4wR+Plt09ptCRvpOT76nSbdIvBO7tPTF6QnFr4F3v7rxDVknaNvBp450VDNiizIpChi8U8Et3u8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(19092799006)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U8oXzvVJGA3891FLO1WQ+aHhu54fLUHyj9P1HvbxxrpHi2FysZLOQOqZbEC6?=
 =?us-ascii?Q?Pa0yB7g7upc4ObK4kcXMz8A/ADwKAJVc5gtvXHmILBfv6SgFozFro1MOfUGp?=
 =?us-ascii?Q?/MS/y+CUh+ZQYidIxlWLrwcU+Wk+L+E6YTbuLu1sWCDyhYNU5JsfnJ0Xc/Ze?=
 =?us-ascii?Q?w8ZFY8ZTJGpPI+y+9gN15EqhK1kJHrbOBiVVRMFFsFpaLkSMYRwxxXbWLr2z?=
 =?us-ascii?Q?6N81dmFp/D1DAWt3aPXvpK210SBDNv65ZTrZl7oUsAuijl9s6MlP38W6iRef?=
 =?us-ascii?Q?3Zib4rRFXUDqkT+DfjoAvE3TQ08hotfSqL9Kjem4aohCTjGAqB8PmLKcEhBd?=
 =?us-ascii?Q?lfvDoX2zHLvSpiICWSj2c1S7LTCC+Pa82RjPUg0yxE4kYmxQb2mI7G+WACVA?=
 =?us-ascii?Q?XeR+OaHXg4Zna1+qWDHoIToXn9u3AUvNdxOkE7K67MESkjItjn+v22x0f1mh?=
 =?us-ascii?Q?B8m3M7iYUujNfjB+TJsWO7F3W1a1uSud1YPuMsO3YnNfaoTghKw7PDK6F0Pc?=
 =?us-ascii?Q?9S8S56Mm/9zZe9MRPUpPSyIOy1iF2+Rj5Rpv0OvmvHPCMo2aHw0eDgXj/G5F?=
 =?us-ascii?Q?RL9ylnzlWrVZL/ArJep5+jmfjfnuQgG0vOK5/zkhkm5hYoUJKHhQjNHRdYqC?=
 =?us-ascii?Q?TRPK+7kQ8terOVK2tCD0/u0E2n7DjuXfSfJ6+DB6suoLHogUKWoKSHMlkvOF?=
 =?us-ascii?Q?oTrVubOHnuOsjR5OSa/id/mhbI02nzZzmDXWooRZJEBZICVKAM4eChGjs5xb?=
 =?us-ascii?Q?ENRM6Bbz/GEI+L7EnnfY3p4Xa7RhLuqcKmXwmBEyDsVDIhXOf7Syq76JC9ps?=
 =?us-ascii?Q?PjJQLNg6pPKMQCxVe0kvjet2TGoglrEEb9kICOWKI25U0AoRIYAdslJ+e6l/?=
 =?us-ascii?Q?7/I4TpmAwvo6afD8DyL4pb9+rRko8XSeFSlb1z26svLJ0zdLrsYODTOwqK8N?=
 =?us-ascii?Q?FnoFDIroRw6llUE1efyC7xJN40SMaz2zYfxbE1KtjKlC1sz1d4BsrA0sCGKf?=
 =?us-ascii?Q?RJZu1lY57v2FvpW4Ftx8nA85AKIcriq6b4xFA8mmbQJ9kFfo5e2b67Bjz7Nz?=
 =?us-ascii?Q?1g+12eQeTkdz2WQ81PlGmrgDTOZIXHbSc7vaIDSxa6jl/yf2M13MJedXXh7X?=
 =?us-ascii?Q?wSH3z4rFv2Qq0mjZeFFolgipvBZR9O5rWpdQntwM4vfyEGEho0FbRxCdosYp?=
 =?us-ascii?Q?IMelNIYUcZ7iFUaBX6ljYWuE/jJFnJ+8Et+BnCKwV5iwSEvzOLk267RGyBZm?=
 =?us-ascii?Q?ePX2sULlrKPTp8ITvdxFIBZ4X3d7zwfr28/Ay9/NEhR39F0yScpsfkDOcdF1?=
 =?us-ascii?Q?Zr9oi54jpzldMz4XxZHknnxAjAOdJcCsuCud0yPOQLbGLpzYOiCbVO8pw/VU?=
 =?us-ascii?Q?gvIax3tJAlUs9ZodxHPKhy3Vf9lkdHl1HQiBrNh3bVW1JiSQI3NkxuT53vmn?=
 =?us-ascii?Q?/9zZEIknt+aYftgj6SyB+K74/xLJdktQqt3lYCU9/5kRtHSUemTY2suVl4JL?=
 =?us-ascii?Q?/7Ad9+nFHkvk1psW8bCqq2pPNTt7iEdSKD1TiDNwIQlB9z6Yk4v88I1jQeEg?=
 =?us-ascii?Q?dXvzveQJcYL/Q6iwX0GC4AmYwU3UXtHLgk4DN+wm5E/pqkyVPs5rMkUQPBx9?=
 =?us-ascii?Q?Gpq2FmA/mIEYsuUFXT7h94t8jWg18nIL0XB1x1mivLeJ9FM3lOeDB4OKxnv8?=
 =?us-ascii?Q?72KYTAZBbPTjiP1dBaY1h+FMmLyJTVm8ly662hXTPT+TufFU0bu4ryc+70Oz?=
 =?us-ascii?Q?SqopI56n7t+LgnKpVrELOejxKeVAhchmyBLhcY9LQPg74BivodEs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35dbfb63-ad38-46c5-9b15-08dedd3127ef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:40:33.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXTmaPbXVrchTwxAqWFRvANizkocEygYHR2akXvX/gMb1wuR0nQO3TCFFcBDrpta9sHPKpcERsgvVZfSbZoPhvV6gT2M9Gm0W7K83PU2kn8MMX599ULIMJ8tcGmaFgXW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_134037_305828_E89A0E19 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Jul 07, 2026 at 03:57:23PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> The board uses GPIO-controlled muxes to route shared signals between
> different functions.
>
> Add the audio-related mux states for:
> - selecting PDM or CAN1
> - selecting SAI1 or M.2
> - enabling the SAI1 audio path or not
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../boot/dts/freescale/imx91-9x9-qsb.dts      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> index ea8cf14e0bc6..1f2d8082d255 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> @@ -30,6 +30,55 @@ chosen {
>  		stdout-path = &lpuart1;
>  	};
>
> +	can_mux: mux-controller-0 {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&pcal6524 17 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sai1_mux: mux-controller-1 {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&pcal6524 18 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sai1_en_mux: mux-controller-2 {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&pcal6524 9 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	pinctrl-gpiomux {
> +		compatible = "pinctrl-multiplexer";
> +
> +		can_fun: can-grp {
> +			mux-states = <&can_mux 1>;
> +		};
> +
> +		pdm_fun: pdm-grp {
> +			mux-states = <&can_mux 0>;
> +		};
> +
> +		m2_fun: m2-grp {
> +			mux-states = <&sai1_mux 1>;
> +		};

thank you use onboard gpio mux.

please keep order by node name

Move m2-grp before  pdm-grp

Frank
> +
> +		sai1_fun: sai1-grp {
> +			mux-states = <&sai1_mux 0>;
> +		};
> +
> +		sai1_disable: sai1-disable-grp {
> +			mux-states = <&sai1_en_mux 1>;
> +		};
> +
> +		sai1_enable: sai1-enable-grp {
> +			mux-states = <&sai1_en_mux 0>;
> +		};
> +	};
> +
>  	reg_vref_1v8: regulator-adc-vref {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vref_1v8";
> --
> 2.50.1
>
>

