Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A14FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbTEaHXcSG0bMUynS4Y3uIy4Ioib+TByI31MmhYhWSE=; b=arCtaPfs2eKQQN+ddcL/xAAo+s
	FSwk4afDxPcY+/+vKKJ2XSqtM0YyJcQrtKFO5y8Oz9DwkJQYLYCQGdNdWlq5VGuNgrQ7STY2zUMzC
	NWaNcvqxUevo4IM85z+IsxTgE5IGO7dNFBdwAqBb8iWnSX0KqUmY5kbdTZGLGLTL2Wk3vhHeUP67j
	xGo1cS0vib/eKEpwdkSBGYB4z5t6NSqRm/tmtQSGqJxLehfHIok0PbJ5LN95DJjFM9g8WL8YRQUOP
	8v/ahwex8KC+y8JISQlBA/2JeVBaH61N0/sZfgqnOziqvkrh7aBKpY2e09YxuYV+yObkV43NCM3YC
	GSZONOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcy8-00000003JaO-3sPT;
	Fri, 19 Sep 2025 15:24:16 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcy6-00000003JYT-2FRs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:24:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IF7zE9D1xa6Qfvw5gjvnjpsPopq7jjxVudmfASaCyXdibNnW6mYZRcS6SMZquMur3EeD9B99Ab9ew/yNux0kGOI4Pn9ta9KifR82BaUvqPMDKCwS8/lq/h3brL57Hw3B/Y2oqwJyJmflxYERWOCkJR40Ks9A9NKqZt2GsUVE58NLrp6bO8WSO00TZKCZDSGlNP28e6iRXli1noQDU1EiZrsQZCcaPMdJynbd7lj7v9lP2whCqXP2/E8arBokg21zz75v0xWwOACN0OiDcFXeVRBWQXCUYHf+dZspW+O6DmP0zkYvMJHrQpveR4h+mDWxX1mxynQpxnIDm848kFH9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbTEaHXcSG0bMUynS4Y3uIy4Ioib+TByI31MmhYhWSE=;
 b=Cu8Nba90Ds8D3ULlkns6KI7Oe2LMIuKfiVLHJLhGO3b9/H1mbUG0lx1C8LEsoHSdMLcGCMuyMMi9EmAX7dB5jyPQpg4Vlh/wZ/sEW2jmoyIvKBHvBTmQOVxJLkwEEQ0cscBEJOYNhjETsEi7OuACC4BKg9U+xb5n3f2tnthynYmFRmkwuGqt9QNQotcWq+y+IISPKdN35jWS7EEJ2OZaj0IabxnN6NZaaQDinEQJ587t2gRm7nZotXtJU8mpVrUd8okHpMSC7BaM2pxGQNBhwq86MZFvmSGHXeg6a263ahZSD6LaXIqj0zLw39SdsbYkH5JP2U5Zma4hpqqJOX6Kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbTEaHXcSG0bMUynS4Y3uIy4Ioib+TByI31MmhYhWSE=;
 b=D6b4ty0Rv54Pz0evo5wtbfKX7vJj2lnxfcb4bDnBm8TbpObDj0yalXnS+2UTYl3G+lim2Aek7niA+KjyGWIRvXrYXULwK5+JAa1hOL+ZzrleF67jTVCyQSm55P6mjd1SBSuuZR0e2LPVlwknbpIHcRmpdg4ZUDxqHjRFeX+AhRebfF3RG5AKQbwuOBBma0sIl3U4p00vf56sZPDyJMh+P6P+MJZvFJm9O+naOLmvAsHwq2mH8yYO1fJ6Ip+lCF6AfbdCQCS3DlwPnJc+ZqZmKH2xrXv/S9YBhcoCl2UbB4LbGpNwHFyfde+CrjqAfRZI4lKpOLhQLiCGuVyolo9N5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10098.eurprd04.prod.outlook.com (2603:10a6:102:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 15:24:10 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:24:10 +0000
Date: Fri, 19 Sep 2025 11:24:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/14] drm/imx: dc: Use TCON operation mode
Message-ID: <aM11kCDCGaAFO7cv@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-8-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-8-784c03fd645f@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10098:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6d43df-13f1-4356-4759-08ddf79094bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rkn0OO+NhE4OfypkOYv+hfeLuP6WfzElywRHY4K3YS2qRPj68z5CJgkjfgoK?=
 =?us-ascii?Q?ni5iwED48k4afloQtSju+xldYG/ua0YM1MZy/zf5MYGVknoJTPh6xvi+zpxw?=
 =?us-ascii?Q?SKRgHgy6DIWQnR1Aem8kntzAS0pgHy0sVbgLquw8ZUBiC7hNNQ5QrJz7tGLo?=
 =?us-ascii?Q?bxNR9hsvkhcFQo5OY0i3w2gXa3w2bz9RnlaGLcXbyL+xGiSmuy+4TGlrPwWZ?=
 =?us-ascii?Q?oi0pDeFFibJgjlpvfxFO6BrIMcStRGjQ/mQwSjaIBUJ09xpUeTRnlsYaT1lA?=
 =?us-ascii?Q?dbH8RfQQJmebyVEkUbz5tW4Rbf0V6FgTh+EAkn9oyUzSsmmckv8RPtVCyWFp?=
 =?us-ascii?Q?IAlCSOTXVvsSbknxr0v2JZsGaIhZBuhyeUDh4ln5/XWP42HpA8Gda0vVIet6?=
 =?us-ascii?Q?llmKA1jLDLbZW6aXS1mkrGoXmVZEVVN+2R88cvfAPVztMUQLFJSeGt/c6Ve/?=
 =?us-ascii?Q?A/MU6/Lg5Z39ydOnC+veR+CrblxdxHpUjNk9A6OrddiMQRgInWPL9QFDitF2?=
 =?us-ascii?Q?NAtJpDgwfNxPGN4zmph/z+p3klFAi2Z2i7FUYYzepqzZ7YiWPmX3n6q33wN/?=
 =?us-ascii?Q?5GMQxZP3eJRxVgmUVvTWFLkq5h2rJQD1Adrmgdgl0Dl4/747jeH9NIA/e4Cf?=
 =?us-ascii?Q?gzZcfmRzu1RhG+G0hYG31sL37e+OjXGseXlTCSQoyRAgG7jVEl1ek+xty/d+?=
 =?us-ascii?Q?zH1jrcjzUe4egUq3QtZDmpPgyHOpQ3a/az1B8vUKpM/ebBXzqwRoO3U5xBga?=
 =?us-ascii?Q?3y9y87pqsms+6k4Z0KbE8QO5PD0JzIfK5ZI9mDiKdft7TpcDwKqh9wfC9X12?=
 =?us-ascii?Q?+NMOVgmrtLsqiXuIbxmQOuqzaQZsmZtRoiJPWIL6l3rAFWaJeF/85g5dWcj/?=
 =?us-ascii?Q?ne1LcMjByN9w9d4lUbFhvyUf0R/SNpQbjEgqnkatnRjR9N37hP2YILKYQshW?=
 =?us-ascii?Q?1n0EhGjkVaHsSCNkj9ytlBSCnv+FEht8W6We/lowgXvEoZNBoKwGdpRX5WpW?=
 =?us-ascii?Q?F5Ja7/ZrxicJwSfOQ5OQ/uO4be0lGmTbKAGsCX65+hAK6ltVdybaDEy/KLFy?=
 =?us-ascii?Q?qWES4qkCCdhheC+QSFuTUDmaaEJldXoN9uAsvlvBxph4GqQxyQPGLmUKUljb?=
 =?us-ascii?Q?OnxYUlxPBhId+jvYilKi8V2QtkIKSPdW1W5B+R8SaCf2LMHZYWui/UzMbTSY?=
 =?us-ascii?Q?bSjnZcUBypqYEYydBlJGlKwPS6Bma3kP9YYmPE9ciZ5kX8bYM1wx51YXSlYi?=
 =?us-ascii?Q?pfB7Vmr2pd79lLUinDcIKqWEyq7RSjIqA+DuSs22NqD6cS5KB63bUx6PlfBR?=
 =?us-ascii?Q?e0WfEhrRKsemRwFHJrrEw5yZZIiu2sn62QXzpA1M/l/sZQAd1xe2+SBsE6Ri?=
 =?us-ascii?Q?tXO3X4udAQireifZDwnzQfeSAlA+t5pfnYi5tHVlZls5Rja9CNIo6mN2YRCq?=
 =?us-ascii?Q?cX+709lNDxy3ZWDdouMbINgcZgVzkudzHMljUicnyTFUJBYnp8bq/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4WhHSshqTcrB4mmYRQQtAjhO+33ehTxU7hfoUO03gET2h+dEf6Tm0tIrTIaR?=
 =?us-ascii?Q?dKVJgsj4HbP51sgJynQVCBe/MoId5dn7j+yFaw54uTCkyBVdK4NvHprmCL34?=
 =?us-ascii?Q?QTr0NN/GJjxMvwsQXRQtDtObRZP0wRtxNu2WHfPa33A8Sqo/9HRG2NKUslDZ?=
 =?us-ascii?Q?bDL/Ai3Gc5nkFQ+VvfJZupRX/K2A/kx2XmoGzJlGaV8WE8OdNVoxdPvaP1dv?=
 =?us-ascii?Q?yn/EeiwoGVCRdZdYkdn8Fy3N/2sU8kFlj4D8VDCc8jnjsn8Yz3w1W7vCkrcD?=
 =?us-ascii?Q?epzk+avn0H9tHw4Pr2JO4ZZb2tzZswKGp54HHIhJfpBkZa2d7a9QP+khGKyi?=
 =?us-ascii?Q?z5xW3vHAznwDRU1LUHXz52TCtPIOUxGAU8VUZLjn4Y6Zus+AEbaWBOWFWazN?=
 =?us-ascii?Q?RyK5ofn6feEi3LqTOo6sLC7uEPYfik9HI0qWG7AnG7fEa3cALRwp6+51Tnmw?=
 =?us-ascii?Q?ySVKhLr1/IP6r0dwjYSlVz4xEkLb21hlbURtKC387I2q/vSjaYgOyCiTuIJC?=
 =?us-ascii?Q?cdbM4KgV+x5NXbJe3PbwSW+42AUDufR4MSH2XK0mT8klGYxRF8/ujIlXNoWW?=
 =?us-ascii?Q?j8nye0rRZNkhpbDwsnahBFN4DB+Uw3vkcw29UsMo37Cxp6dxRl4b+M6UUqFl?=
 =?us-ascii?Q?Jl2t0hmJ/zadFTfvcWWkNivRSgPjOyAwE7Xqj+xWUFIfugU6ecq/SRa2YAJZ?=
 =?us-ascii?Q?hIHZOjBYTt5VeTVQLOqlKrtIfqNi+ps5JHHJ0NPwm2Gmqi3oLcDYpwF7Sx07?=
 =?us-ascii?Q?AO5dh8gKBeAVO/D2qin2m4UH54p17iKufStjxXqrXIuBt8kk56ejXwTbcuee?=
 =?us-ascii?Q?ECtyoj5OeUL39M7TuWpqVZjbahSm4pavew25F16QZYVajdgYEh0K5dFSc9HL?=
 =?us-ascii?Q?B29nbrzwStO+00aHN7IZGMbjblea9SHOPxFZpvK9lizyFGihjjUHGRWw0n1k?=
 =?us-ascii?Q?KqgqwfoOLPEw1VOCcNQU1bQEwf4qixyZWl1gcj669KTLn2z2mZyqV+FAwNH/?=
 =?us-ascii?Q?yaBRMxojZ2P4GYtn+stxbAneURx32WeAMPT7iJHPa/2uMLuLgZV/ePm68W8E?=
 =?us-ascii?Q?XUJCJggMfkO0kv7WtLP5wdkUD/lb+pvksg5eqv2RvFmzA4IX5bkgYOJfI+r9?=
 =?us-ascii?Q?khysKw8vmi2C5ze+QMgSDmkBGksWa661Mk1P9kuFLCByXzu1dvPum9nWiNt1?=
 =?us-ascii?Q?ga4p+lo2pf2D82qAOVLxehO/u8aXphG/YouShqebj3MIu3BySdjAGf9cufrq?=
 =?us-ascii?Q?qFyi1fZKM7qVUDtOxsCYGz2PsW7POojA61bZ8XuMDJ12+Q+/Hq9GbaQ2zUVw?=
 =?us-ascii?Q?nTRQ6HCJ1fZb/ZJEmaK6RTherD2FJxW8Nu9wvu1xhwtOdZJPcR5xyJcZRV4D?=
 =?us-ascii?Q?eIK/pwNZsAIgzuQMpWGn0243FM01RiUC8Tj/a9bt49p9hcS2X+nXPZvPJqjl?=
 =?us-ascii?Q?4lzNXBil+bVJ1QKhos1IIJXvz2M6kStXcQGJDmW4Avra19ojizjVBECIOU21?=
 =?us-ascii?Q?WRpz/k1BqlMx8tcE54XrFwaosDROkjQRoxBijCFN+xShzaikYxwKv5WFT32g?=
 =?us-ascii?Q?EKZvFAzo6SPKIuvgV6LP71vO8NNx310KkU/qi3Zb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6d43df-13f1-4356-4759-08ddf79094bd
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:24:10.0578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOinoX/tBugHac+mxb/cd1rQGde1mfST3sZu1xYtagZnVbhanQK+Ge55MrBZJjnXfMWim6sWtSYEB7soluIAoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_082414_575053_FEF97BE7 
X-CRM114-Status: GOOD (  22.45  )
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

On Fri, Jul 04, 2025 at 05:03:55PM +0800, Liu Ying wrote:
> In TCON operation mode, sync signals from FrameGen are ignored, but
> a much more customized output timing can be generated by the TCON
> module.  By using TCON operaton mode, generate KACHUNK signal along
> with HSYNC/VSYNC/data enable signals.  The KACHUNK signal is used as
> a synchronization signal inside the prefetch engine(DPRC + PRG(s),
> attached to FetchUnit(s)).  Carefully switch TCON bypass mode to TCON
> operation mode when CRTC is being enabled so that the prefetch engine
> may evade the first dumb frame generated by the display controller.
>
> Since TCON BYPASS bit is controlled by KMS driver when doing atomic
> commits, drop the bit setting when initializing TCON.  This also
> avoids accidentally initializing TCON BYPASS bit to 1 when driver
> module removing and re-installing where an upcoming patch would
> disable a CRTC at boot in TCON operation mode if needed.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/imx/dc/dc-crtc.c |  28 ++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h   |   2 +
>  drivers/gpu/drm/imx/dc/dc-kms.h  |   2 +
>  drivers/gpu/drm/imx/dc/dc-tc.c   | 114 +++++++++++++++++++++++++++++++++++++--
>  4 files changed, 142 insertions(+), 4 deletions(-)
>
...
> @@ -249,6 +260,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	enable_irq(dc_crtc->irq_ed_safe_shdload);
>
>  	dc_fg_cfg_videomode(dc_crtc->fg, adj);
> +	dc_tc_cfg_videomode(dc_crtc->tc, adj);
>
>  	dc_cf_framedimensions(dc_crtc->cf_cont,
>  			      adj->crtc_hdisplay, adj->crtc_vdisplay);
> @@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
>  	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
>  	dc_fg_shdtokgen(dc_crtc->fg);
> +
> +	/* Don't relinquish CPU until TCON is set to operation mode. */
> +	local_irq_save(flags);
> +	preempt_disable();
> +
>  	dc_fg_enable(dc_crtc->fg);
> +	/*
> +	 * Turn TCON into operation mode as soon as the first dumb
> +	 * frame is generated by DC(we don't relinquish CPU to ensure
> +	 * this).  This makes DPR/PRG be able to evade the frame.
> +	 */
> +	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
> +	dc_tc_set_operation_mode(dc_crtc->tc);
> +
> +	local_irq_restore(flags);
> +	preempt_enable();

Does it need reverised order?

>
>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdload_done);
>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
> @@ -561,6 +588,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
>  	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
>  	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
>  	dc_crtc->fg = de->fg;
> +	dc_crtc->tc = de->tc;
>
>  	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
>  	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
> diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
> index 211f3fcc1a9ad642617d3b22e35ea923f75e645b..c39f2ef5eea98c3eb6ae9b5392f9bf9f7e33e7c5 100644
> --- a/drivers/gpu/drm/imx/dc/dc-de.h
> +++ b/drivers/gpu/drm/imx/dc/dc-de.h
> @@ -54,6 +54,8 @@ enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
>  void dc_fg_init(struct dc_fg *fg);
>
...

>
> --
> 2.34.1
>

