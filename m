Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF35CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKW/8sCcSARK+fRMUZ1yFO1a+rZ6QSFdUWClQFSGPGg=; b=J5OaRbz8hSbYu8GhlG+pPPxbYg
	ec5nhjbNf8A53yJx8sVA/cAAbAXqKOi50FUyM/MrIhHJblj1oE+dS5Bpf4VGcrntBSs4v2Pbi5K/q
	ROcGtEczIcRKtgVrZjlfp4yJvWhJ2mLMrSv4ydJrNP/lzHFvs5Fqv+Q2TbuoNOzJicH781thMlO7E
	EnK3qyv4SNdMglr2hTyGAqcEdvMJvVMuJA5IWtjXJEQA3dJc5j1uWh9cF3YO/Wl1Ci80T2SH/O7Pv
	ozAtQawlexBrMYcqBy982itRAuMFaubWrM/jHwAgpTp49M3gHs19ZrlllSnCn2169rxm/B4tQjEW1
	2iXkc4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3y4E-00000008ESz-1nNd;
	Wed, 01 Oct 2025 14:44:30 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3y4B-00000008ERf-2C9K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hatk3pc2FoPh+GxYBzs3QWAg7IZmDnWRSD3RNZo8L9OPI2MN9nUbx9VObSwWptlWyk+2rNmRD/+UC+xFtzIuFrvR63jnY2dVKLdGPN8ysBy1PfS0Nyaa+VIdzAN1wO1fEdWH0L93gDYchKB3qeSihMgc6WzlQiZjvC4v+UTavm47vBHDOhq+BMI23AUw8wx+MQs+e6oO1x8C/BTzVyj2R71wrbabkEejtF9pbTMxeMZYKNLPXawtxeLWTn57JawBVSLQRhFBFDwXQhxOqYSHYgx+JoXX7fNiXe8AyoLcfxrYJIKUqALcTsb5dVI3Qu8oZct/Bkevidn4Y+Smt7xvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKW/8sCcSARK+fRMUZ1yFO1a+rZ6QSFdUWClQFSGPGg=;
 b=FK7eLxRZr1swE0w3Y7qZQF4kHPs8RvaiTCeSn2iSaj2YLBS25d5x8sGhXyzH2YpRTOfmUpzdIvDedJg6gSzKnuBkvQL7Wah96bMD1HiekAxGAUOkLsk6GQNBVO1b40/mJXC6CFIORLntdYm3I3uwIkb8huKMCjsNe4Zza8jTT/QA0nxT37B4Mm3SenwtmytWzXUCli+T0Kf0rstwIeLX9cGUnwEqoy3EYMYReE9qEfgtWR3vO3gqvFi31cpTCWGISsCQUJBLzmbb5KiAXFanyUcWCl0Y4lykv8O3ePguEUI6tqmb9uMgcl4ZtSJ3Ku2gRao8VRbrvobhbyGld3IMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKW/8sCcSARK+fRMUZ1yFO1a+rZ6QSFdUWClQFSGPGg=;
 b=URwq77x96r3DmePouRBF1d70k07LI/lKQho7b2ZtOmRS1jghjBI8Pi/HwaV2odpyRC5zZrTHrKcc4xt42/5bHHjEIgnDiGxmYWsQxobmlhjAiinfCy7l6NEKviZc5l2ls/0lxbwqJGi0PDef3Mxawko664JJozbDs3HfvwM2sXNhn3fcE/k9EyZfY9pAtTLw1sQd2tgSrlvULNPEPh/i/mjNzzHCHZasHE7hUf3BoZI/U9KAAPHCFVVaP6+wJz9q5KxbS/2bIuD1iQ5bEz83Iua73A1fHq/DbKMMm16XiQjWeXQhV7pSHP8VMAuOFK7odYSfZh/Qj5N3EZ2Z0eDMkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8993.eurprd04.prod.outlook.com (2603:10a6:20b:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.14; Wed, 1 Oct
 2025 14:44:17 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 14:44:16 +0000
Date: Wed, 1 Oct 2025 10:44:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Yannic Moog <y.moog@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 1/4] arm64: dts: im8mp-phy{board,core}: update license
 and copyright
Message-ID: <aN0+N64FmUP9J5M9@lizhi-Precision-Tower-5810>
References: <20251001-imx8mp-pollux-display-overlays-v3-0-87f843f6bed6@phytec.de>
 <20251001-imx8mp-pollux-display-overlays-v3-1-87f843f6bed6@phytec.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-imx8mp-pollux-display-overlays-v3-1-87f843f6bed6@phytec.de>
X-ClientProxiedBy: PH8PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::26) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: 976749a9-7ec7-47a4-097b-08de00f8ff00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PLiQsj3M9NVvRJFyeOjv1JXD3QE8Guz3osJ9pw08RF88qo5L34Hi+9KMpsJ9?=
 =?us-ascii?Q?Eqq87pt/tFzg+q+kKYbsy8plK0y9Kdh15wy4iNI4WfIVth7KqEA1Io+VZtSb?=
 =?us-ascii?Q?MSF7atZT30w9t/5T0ImrTpnW80yVqP/N2Fe0IgZlGC/k4U4yh0cfPs+V+Ri5?=
 =?us-ascii?Q?tvPt3u1/mf72XuOaCm87EtYX7wdVOZCU2oVKkjYa4lWex+XWR4CcYpHrgkQM?=
 =?us-ascii?Q?/KFLzYQEGP0ts5rx7d5t+RLglm43zdPkmH/g6CSokMlRwh535hvXAcuW46K8?=
 =?us-ascii?Q?dWv8KnZsZFttveItwWKN4RSjjKnzWAbRnmUNm1vQHOZc/nu+iTPYT6RDG16y?=
 =?us-ascii?Q?Zw96/PocDRapBWgtKRavHzB5Fvu+BY5mA3/qaOh+kebcRNNBTkW7f8XK0Zpg?=
 =?us-ascii?Q?27AJmD2ARdIZu9xImR4f5B/disqRoQs/w2wGorKtAt9b3U48yWvoweGFNdHq?=
 =?us-ascii?Q?0VE5tqq30IjT+DugWf93L1IHMhQa3o7EU/lXv4X2KgkU2UpKbcnUjlXFpqOV?=
 =?us-ascii?Q?yP/nBw9gaPLR3wo1gMctPZw21j7GPENdtTh4y3xvUBlgHgew4ZfRdc0gVsd1?=
 =?us-ascii?Q?I/t1uiwLVkuE+kpuo38jITPfxpdS6vhjqRC6M10xOad82tqtJ84n3OY1KQLN?=
 =?us-ascii?Q?n4QHANLH8Eztjd4/xl02LrvvAI3R1GvoWeB23uXs3SZ2fRJ6FRTEFZNt2Ib1?=
 =?us-ascii?Q?Bxp+DO8Vp5kFWi6Uf06JhEKiTsKx5sUBQ/gPJVdWT6o1NyKSdqxoSw6avrGk?=
 =?us-ascii?Q?lvF+6st4gyfcw/afpkTU2j8cVqZQhqOQjYoabbMtQczGsfRuWPdaVTel0/cY?=
 =?us-ascii?Q?0VcoNYeKf6LaeXmD97g1M2MG2Q4RpDckBI12/HJHiOwusBEljRgqDeKhWro0?=
 =?us-ascii?Q?Z8gmRWdbdk9Fe8iuwfPR5KJKcWDJ9FNdcEfkMWGZhgF2xzezDaCkxf/b/6Fb?=
 =?us-ascii?Q?b/XirDjGJV+G27lDs1wrb15ZicG2zlRoxpRFgJ64wwSpL+WJCne7YFB44QQi?=
 =?us-ascii?Q?TCbBP51hS7X4Em9mKY8iSwIFJ6vkoiGqyawauvdPFSUCTUSTyC6fMhC1FhBZ?=
 =?us-ascii?Q?PD0qjz2eFYwBUdodooKiw/NUCUkY7AKsRM4NThpXi+W6yyF6z1g+3zvaoQLi?=
 =?us-ascii?Q?gSOLaPJaBX81FsloalPq9gDCMdMc/s4Ed+u1T89ZBdUf28Nc5YU3aSMVj37F?=
 =?us-ascii?Q?nL8/kb0uPmzkEHwMQNn4nZqKpK1pQ98nrC0bf47q9F6skf0NQQx/kG7exJzj?=
 =?us-ascii?Q?cSYNdXB/mAbVgObm13M7U4BLNX8ScFL1iWjqUfK8/3pWy7Ul2DwibgwPVRJ7?=
 =?us-ascii?Q?c0ZoFKQmGUgdV54K2hthfm6/6siVJCHflHMry8RwcqRr/wHvNtIiBfNiD8SP?=
 =?us-ascii?Q?EQvtHUI++RC2irMU50COFzSeh4CBDKuxcdrJfIYxCsXBEu+sC7UV73ubuHTM?=
 =?us-ascii?Q?jaw5cEO7wTyll8Gwi3HmAv5JIUsRpYNT36mhgqkjBPMcGmBDbE3xtupgmrFv?=
 =?us-ascii?Q?btosvVGUBVVT6Rh6aDIeQqQ2AlD7xUmOToeK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0uoExOuztIqoqlHcBy60Sp2qy0LBKpZJHq5BNN7AlSu8cuO9Gqc2aOZnBhhJ?=
 =?us-ascii?Q?BsDjUtoiu6jve5Kk6R4y24FDfSPome05xnriuhaGuaebdogpX5rAEQACEA4l?=
 =?us-ascii?Q?QN9hED8MH6hDP5ehJ834dYbH0xWe4catxtodFBHq3V9zsxTeFkwdeymEmaH+?=
 =?us-ascii?Q?PEFkbfD52IGnOWqhYrG5LfFL0t2OTvgVjDMyB4vWwVeUu1fj08wEkJG4uRha?=
 =?us-ascii?Q?74tvXWLfpjIAvbYGHx8GCPayu4VpmV3HvY1F/cdEeHkkSo4VO7adaH/KO0k4?=
 =?us-ascii?Q?dk7SPnwfOgyGdku06PS+A5ziV0dRAcy0OnXUL2RLkTOofnp83M78ZRr6BwWM?=
 =?us-ascii?Q?JTmQ8+h8JB0mdaQO2bHD3g6jHtFMTH0RINyi0h7L7fc60kyX1g4HGxxBFR3X?=
 =?us-ascii?Q?OZOr/mqGzSl0Vuoe6hYpcGxQxngyP8lWpngKKsEkRdXT+gnwnIOlo+WLPplm?=
 =?us-ascii?Q?/Rmevz3RSkaDU3ti5wpxEDRFjCbO47yXVblZ9/X3UvhgxqLY+zGP1rGPuuVo?=
 =?us-ascii?Q?KjQn4bsNBqbnK7AZ1SlghRGcWGvk21UZzmUI2tkJOnxr8E4dknEa+72zuvmR?=
 =?us-ascii?Q?Bw4sEeqorRp5lcEpYzcSgerJ0SBlGLgblcAmBiqN/HI5o6v7hTUeJsKlDj09?=
 =?us-ascii?Q?yFCeMKZuzVGW6jxBRDluVg7nWdkHXae3Tqiv4oGBEzrwnCxy0ns6gpGL6zAj?=
 =?us-ascii?Q?Bwy1E+njUFUuQ/tInDA6BxSkEo+75cbjXAeHBJeTEjVgcb55YcxGMUl52Umj?=
 =?us-ascii?Q?aRBBn42zukQ3CT1tG1+asvhPEeR21orgP0cy0fVb2hRk2drzWL4n6pYbw6X0?=
 =?us-ascii?Q?ORSr37Fpf1LM1BJjt0x76pkN4QfCWleNz+J4riWonXMNEJLEtbIDy8tzlxnq?=
 =?us-ascii?Q?y0Aw8CY1vqm9mZP+pcUYIei4duoOFV7Cah+oCXfdObOZRdkRN801nLBkswFI?=
 =?us-ascii?Q?zlNIg9kODk/96kBwFGYs1f8e/ihSbIGju/QaRvDcy7PFRhuKR6ys6KbTtPBd?=
 =?us-ascii?Q?eZpLwbbDB2aBxXC9gQGlUnhV/5489YSZycgV6FI3v3zdtYHOawjkAhcMEmmw?=
 =?us-ascii?Q?JsfZIkTQH5GVL28pAU31e1kYvel3WuJxIv7lNRGlpnuFaMeO8+fO8Ag33rRV?=
 =?us-ascii?Q?gTCZ2w16CRWOR5KXj8fItPfBIqRabMIMJhaR1b/JMa0KfASlLciAyOcgMXOe?=
 =?us-ascii?Q?HweVCRqU1/4qMKUAdKx7RE78/Z/VOlMWdM0+4sRR0TubDDohZD+JyIBKkHRI?=
 =?us-ascii?Q?s2uXa5AyKS/uuPgj31tVfVqJ5BleBBMSXYcwd7ut+6jVtjRxPIIjxX1dKMo7?=
 =?us-ascii?Q?OV91jbHRqL2TeMp7w+CyrHrtAzXx+wOTq4VJV/dDq3IAt/F9H9hLjQNUhMS9?=
 =?us-ascii?Q?lWT8GQF1Nwjev+iUJeSLFj5xFi2wCtLE5mpZDm8ENZbExgCqEq3LQn11/LRg?=
 =?us-ascii?Q?Zucr9Sed1/wO+NmBrOXYr4D4MxJR4mgpwuQTJTza1x1BbYVlpd+UBUuLYFZe?=
 =?us-ascii?Q?XQoLCDS1f9E8UI0R8xX5t2Wife/7oQZqf+PVWawYvLN+wV7Cyqs4KkHF52Gd?=
 =?us-ascii?Q?3fL6rWs7cpr5vNgEysY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976749a9-7ec7-47a4-097b-08de00f8ff00
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 14:44:16.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rC+fDqSfmQXMCFHlEREJxTBpghoPCiZvevG72Irgfgp5K5LT/0/bQHm6X2fQCXqVLZKY/nptkhqT7a4yn6zFKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8993
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_074427_582465_8F304B70 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, Oct 01, 2025 at 02:33:51PM +0200, Yannic Moog wrote:
> Update Copyright year and change license from GPL-2.0 to
> GPL-2.0-or-later OR MIT. Use syntax as defined in the SPDX standard.
>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 4 ++--
>  arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi        | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> index 436152308642270c320e3ae3b21b9e46b923c043..6110c6a484d3f0b427ad372e1bd16063d1ce165f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright (C) 2020 PHYTEC Messtechnik GmbH
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH

copyright need keep original years

Copyright (C) 2020, 2025 PHYTEC Messtechnik GmbH

Frank
>   * Author: Teresa Remmet <t.remmet@phytec.de>
>   */
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
> index 04f724c6ec210bc2f382e6b9e2b13fe85d3926de..f6168984a31cca2b97344805c9474db900e3af3a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
> @@ -1,6 +1,6 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
> - * Copyright (C) 2020 PHYTEC Messtechnik GmbH
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
>   * Author: Teresa Remmet <t.remmet@phytec.de>
>   */
>
>
> --
> 2.43.0
>

