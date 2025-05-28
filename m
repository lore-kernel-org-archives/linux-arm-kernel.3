Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9437C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5ZlZjBFrApavmKsxv0r6ijKoyb2QbsXN+4IsQHpUIU=; b=EqNpMGWLJkB5Bufb3s9cQSBxSk
	KCUXBKRIYIx8iGMxlSzdL4uBNl/I3XfP9B9WuH4oCgbnQ2XxOUPCWbqo9ncQbe6D8cnRH7RLd5dqG
	IfvtdJTGvHW7cV3hMzcYq7ZIVr+WgOGAPYBx+wNAyyVw2Pa8gGKifVv0vY3e0KUHBfMk5DOfbCQET
	MlZdfYdSboal/ZVoBKTlLCa1ZJTMUGmiyUwzBaDydiT5rw7JH+tngqF759tcUPEQ/fQqTMBtlUxdX
	6HOFutgf1Hl7MeRY/4yjk1XDtr465+Jah13Gr3oWaRtdhxdaoNf2UCsep1pwKnnB4Ad/uEHYKiL2E
	dt5lkilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJeH-0000000DgJb-13nv;
	Wed, 28 May 2025 16:29:01 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJMi-0000000Dcke-3oRh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:10:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiKgCwTEQblzx8PbkRCsXxwN0R9Hfj9Af9NI4WmESD8HOVX7jijtNLPeiKIIkzvxP3lHL6d5zZ03fQ7xIPKc+WUrgefbKJ29iX8Z+B5ALKVM+fPOi4SYfVz1PBBJxtg3r8vk5AKddSTKb0Oq1kUaLkT4VUqGtM/UQtlCk57O1zwLpGUI5CvEIFsgDm37sB2hiqwek/6NSTHTG0WIolWiZh1VJA1xfS5IaJnjc4hNluWOzByXD5+bcDELSN7U38CCM5FSwTcqGZR2ZNYH7qAYijFnKJUrspAUwpMGAb79IcpMuEfHS3JKAyBQFRbd/ewJfPKnpH7HahOaMU7EpBLFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5ZlZjBFrApavmKsxv0r6ijKoyb2QbsXN+4IsQHpUIU=;
 b=XL5/JpFpE0Qg0zbYx2Fw3twlNxHvvrH6WYF1LE3xeymC3PlZdbOmdrYuAQv7aqZfliW6kAlcOaaFilQAKYkf3BfE3W2H2lmnXbQ8NcUfz8AD9Fw7krL1zNhKQs0iNvmjRsVgSZNNbdMipw/1bM+eTtWLhcHhao4fZoavQcaxyO+dJs+fmHJgKuioX41z5zmxTRifBUD67J3T1rxs1WXTluMNIoiFs7JYE1+FhxoBDqhiATve9+E+c99KBNhzQkO/niuY/APDsMEjcFxcUQtzyTTP/VtgsKWx2ccYti4Bp5Mp/OKGPVqWogR3B3Ji8WdO1XaqAqAGT3A3TTwLCBY9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5ZlZjBFrApavmKsxv0r6ijKoyb2QbsXN+4IsQHpUIU=;
 b=lVcZ4yaW91ZrIesnNsLcqQAELSeNeMo2M3HpvyZEDi0y0EkWRZePkhC4Hboii3XvfuO/4dhy06ZsPEvD+Kl/zfsO6OUIb4Ozzz//3GdTK0PzQly6uLCodo2sOXO32xWKp2NrP7xcyszKv7kitcRhlKkAsi3hUDcqX8PvayqBAncrrajbv69wpxilXpePSBgXOqYZT+P3/KmNm4hCK8HSPvvV+8yJRcf9CDXKVodnnGR2uoLv7ZLAbe8soV/af9cc8mkbNIohg0uJoZRQsFWDGLqmMjJD4NEGNvsOyaVJ6mkTlZI2lwAyo1FDA98n0sh6FYwzFM7chO/NrmGp4ktT5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 16:10:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 16:10:49 +0000
Date: Wed, 28 May 2025 12:10:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Meng Li <Meng.Li@windriver.com>
Cc: shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Message-ID: <aDc1gobqagsYohO0@lizhi-Precision-Tower-5810>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528111751.3505224-1-Meng.Li@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a889ee-f005-4996-9e7c-08dd9e02362b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TF4w5QhRWFGZ/CrLukG7V4aQeisZy9Q/ZbMcj4rs3aWD60fanLIBc+w/AHy6?=
 =?us-ascii?Q?7BYT0sxlA+dXDBSvnyVYxAFwE6rBtlBAItep53Vvtgh0DP3f0xv66lA10zNP?=
 =?us-ascii?Q?TouxyTjAjwtShmix0Zf+2SO+0Il+a4gyT4SJNR/zhT7TWQtDk4LHPfq3HreM?=
 =?us-ascii?Q?vVm7s0DcIM08BcWVeOCMZObuMYjZ5i91PhmXFjrRIz7pc/p7nQV3DCu+3XW6?=
 =?us-ascii?Q?NeLUESUKU2NOgBzEBWy0Q1S5eV+/jm3fVqJPuzWjsS1ayxkI4l+3zhvpQb3r?=
 =?us-ascii?Q?Qtdz/3SYXBT9wE72Ef/pc+uL2RUCYxp/jG5R1hUh66RQEyJOaR87vhSY3Lwq?=
 =?us-ascii?Q?C6fmS8AAQWyBcEGA4m+POuSYg/GrYszAcrynLvw/A+UO3rmDoB4VU/3Zdh+9?=
 =?us-ascii?Q?dxVJE3f+tZCdJsgj6bPcWi7yozN7TxFA21os0/gRq8SgRwU0Xip9JNXABxd7?=
 =?us-ascii?Q?SERAQuDIGGCig6BrEHzdZcNn85zJTcU+RRdj7WKjulbVTLnDCStgMDIVotJe?=
 =?us-ascii?Q?TVx31UQBok6dlNXfPAO+HCseP+l+FLe6uv29Q8sCbfWBdFTjhZdzSfp/B+dT?=
 =?us-ascii?Q?2Sc7Jecn3utmZKWeufgOYYNEdQM6JjUphB1MOftw06dvKdQu3Sl4hb5Udxrj?=
 =?us-ascii?Q?9YaYspiIGijHWr9JV1ciWwmsrvK9fAiOMeFwAybP0k9OlFjfCL7eP4rkzUqd?=
 =?us-ascii?Q?j6ILjChjRj6VY31UPQ09m1DVzN1UO0MaYPBRqNrcF4Wh1vB+MEBq01Ni4JpL?=
 =?us-ascii?Q?JcPep7KkSFIeM0Lp2is4GVyi6N8JRn8WuPEwP4565wFx8Ic/v50SWh3g1/WL?=
 =?us-ascii?Q?sz5wKKu3G36hPOC6VOy49RvhBGlN3171fp6ZclwKPFN877/2Hjm0E/ITN1U1?=
 =?us-ascii?Q?EJF0tG9FzxOX62cffmoFgl91alFPoijYaVLYVJ0WhePOhU+8sVpXSdhtW5eZ?=
 =?us-ascii?Q?L4KTUIokeNUQLSN8/w+InMoVRFsyKL54HSGHGuR24RcBXDOaH9PliBANdDgr?=
 =?us-ascii?Q?9fzA7p8B+lKIX3xPOTIRVTbN4i+dCXOAR5mclwhC+hv0+m6LYun+44hc+Pp3?=
 =?us-ascii?Q?s+NI+RY63f4RMdyhHD7spmyvUd2FjR/fiyY85ytVzdmYvAvT5Cj+jATNhXxY?=
 =?us-ascii?Q?2PYDzspKHkKbSTOyIsDQ9oIrhfMiBYUTPcEE/mkmmGVHsCIZ/6matN8sVK6i?=
 =?us-ascii?Q?9gcj9TseKg0kdiPJqpR549u0UrHezJvZyA+8dDfkOC5sV7SIyLdLbIvQaRjw?=
 =?us-ascii?Q?8++0qhp+3u3AYFiNj0yYPt8wayBszrUwJ5zqwFmLGE1jQjh0NjkMJ9yYSyOs?=
 =?us-ascii?Q?47veIATRWPSmCMzRY/37eCfwVO1bf2kfkD3M1HDC+rRLBm0QssH2BBGJYabt?=
 =?us-ascii?Q?zMAtRPscS1m6gP9F56dWjLv5kt50oQAlmwKhPDG6SpDhFrWYvWC0L+6mSIUQ?=
 =?us-ascii?Q?GW3X5CSVcnIFS6C5qxh/E6D1GDnS5lObapIIFBhNI4CefRmHarPkYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J51qToUTrpRzKNA1LE3PMctfjkmLPvn9oi29FSab31+Pk78vqU6MCTl73eiD?=
 =?us-ascii?Q?9U6mHwH2agRu4rjt1eHi1A3kXs0ICGnvKddTGscrKGN79ehC9jvfr+O6eL/R?=
 =?us-ascii?Q?gHLq0r+HPWXZfxGAuxQq6UVcB0tZDo7fzFmuR2ReXCpH+b+vNy3OFRXqhC6M?=
 =?us-ascii?Q?wA1nYhpK70A5UU3uNufF4/OIk4jXkQZdc4yvHJ+yzWgLeqjFnkN/ngFzgO7W?=
 =?us-ascii?Q?4GitUpM91CjuB5Wi1X21kkwumssQNbO28UkCt6CN/AQQxjnXALOJ/zW92DG2?=
 =?us-ascii?Q?gi7pYu7ArsDt4WOP5+s+gRG6esnYE81z5kzS5m2fDrX5LeWkUwD+xMZ64gQH?=
 =?us-ascii?Q?eORxWVEyRxB1awW1lIjEXc3r4NR1jeAxrIibBG/5TpXsmtujwHHXMtjqgvra?=
 =?us-ascii?Q?OUSap1uV7Y2aUH8ySJHl3n91CVrV4B/JLmkOp69upYVZyV5+u2Sc8Xcqf/q8?=
 =?us-ascii?Q?2XcG6hPcmAIJTNdJNS2z3qJ3vXjtpqg5TVaTV+ZO/cQDnRLDYDwFhSuB+top?=
 =?us-ascii?Q?Mr0FRxM7/z8CX9wl3cufa+5KRX2Y8VbdfrGQcsApawvmGXT/4KwmpX2n0W5+?=
 =?us-ascii?Q?jdhWkw4kpRxq3c8mkW0VgjEWq5ViSLih4SaTU+k0iCiRFVWTT7USzO+cct2D?=
 =?us-ascii?Q?HPsWrDIBLUZ/kX/SWX7/B9HOgME0Koj7e6Lvekk1n813vLF36apiuV6tM04E?=
 =?us-ascii?Q?kIaxNhhwwRr80SzNXCB4qdrlP/feGJ9rMtiUhvD0KmToCJk8Vzi41e/i7fYp?=
 =?us-ascii?Q?V+PqoOtDDyZ6j3BWRi1O0Vr2pV4vEAJ2f3m9IEcBQitS9HRRWVW9/ctYlYZq?=
 =?us-ascii?Q?+f4UMO+nDICXUhly925JDWvXrG674Of/wF44w0okaitg+Y2J2FD3F2P9G0bN?=
 =?us-ascii?Q?MW1Scg5GpRONL456pG74oYrCwAQXCox7cULAPkWmYzaHFoUlKfzCdGSk1Th9?=
 =?us-ascii?Q?2LTfhAG7dcyc2dELbBhHyT1o7z8HFPrng8VVmrJQbaJbj5QQWYz7cHKqGqON?=
 =?us-ascii?Q?VoLqPB3bSoZ8LUSEQ1ngsJYPOCo7IGdnzDx00w/Hg4iFqZrfOUijQVM7Yngf?=
 =?us-ascii?Q?HNvLQQoyMx0CJi/lMnrOvgE/upwfT/MxhB6iVy1k383w/4aEXr0IE3vL0k9l?=
 =?us-ascii?Q?yMnrtQ0uqbhFrBbo7WFe5C8j60q0LidBg2Kvk2sAOQpnxa/qZW9mLUhF47Kl?=
 =?us-ascii?Q?cpGewgUOus/6Wpuqy7zAIO4ilVzCUtTdAEYcEk7SGbrJbgnpZFzU5rjeWquC?=
 =?us-ascii?Q?hVRO8cgo5u/tpll00NvEPNNSZ8wbGf8qS1WVQjQHh1ifewVP5z+35pooW9co?=
 =?us-ascii?Q?nZisRJqHykDPg0NUbTCT6smdwnTz5dbhmkGRaRjnoEfLCUBlUKzkoSpIaOvO?=
 =?us-ascii?Q?cT3rNS9Nr9x9bfQh+EzmxKR8P1PTXYQS591fxG7RAdfZhvmiLIQ/0NiQfgBi?=
 =?us-ascii?Q?H1gGbLyrntqmfxB7UQLl/1zjOadgatHL30vbp5XrrKukGdF5v/+ATqRUtu5m?=
 =?us-ascii?Q?NvYKBBQKDdkKE+4halo23MGtjEKV98eym2JXclEaYrZExLJjIMI4XePvj9x8?=
 =?us-ascii?Q?OR9kjtHV7PPaC73wkN5+ToSWI4Pj4FvsnaGQye9J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a889ee-f005-4996-9e7c-08dd9e02362b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:10:49.3757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 979voik9SjaASRd5osn7pqe602072bkaQTnwoWNv2LoXLXmcPuKvwEQSNrZA4aNnEQFe+l81ppF6eTn79tnBaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_091052_965875_DFEFE3C0 
X-CRM114-Status: GOOD (  16.47  )
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

On Wed, May 28, 2025 at 07:17:51PM +0800, Meng Li wrote:
> When verifying watchdog feature on NXP ls1046ardb board,
> it doesn't work. Because the big-endian is deleted by accident,
> add it back.
>
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")

fix tags should be wrong.

I remember I tested without big-endian. If it is wrong, please revert original
patch and provide enough reason.

Frank

> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 4d75bff0d548..e15ec2e1cb04 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -753,6 +753,7 @@ wdog0: watchdog@2ad0000 {
>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(2)>;
> +			big-endian;
>  		};
>
>  		edma0: dma-controller@2c00000 {
> --
> 2.34.1
>

