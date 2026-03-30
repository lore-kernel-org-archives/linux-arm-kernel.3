Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59871061B12
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtapOcrAuKvlFMZ6A13qH/lcH4rhfOijEWkO6D7mQDA=; b=fQjEaywBcUhne1+ylToW+W/8nJ
	4eKegXtgys1+y04uqnYQCiaGwtANiZwNkjSU+0K6YY9RIVahQ+2eB5M6s3eAeUUpTAIoR8UYb0Vby
	KEiTEdvtGsJg81SaTVN4A0+DqHdmn9AWbV7BtmxEcmTUthZugKjWLhts3++14sWOq7hwjTMebMRrq
	3xYVMRKukcoK7lJU3u8gtx/H5md5wEvRpn4aBYXbBKbTsnblUZTAgzc2JZTt99qWNl8vrlAqY4dUp
	GeDdA/mH1xuBLgu8fMyfC2Pc24ug6sLmfE9nTcObAe7Db+EmruZyqPafGK7f1SPq3+mIZAoIJcWoR
	HnkcIPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ExF-0000000BbBg-0Qcd;
	Mon, 30 Mar 2026 15:55:05 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ExC-0000000BbAp-49Os
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHBYdw4P8mjZ9+Wuh9eOtYhykyxI6C9iHWn8z+8hQJO8PjHxLlEvpctvZWwaJWYYsvwapaT9dVYBfd1eR+XuldaIDfyaAihqwp05N6IhO0/rQexwDZvqVJwKvsi7ooZhB3gfW30JTN/7kgXoGX54R1DA80X1kfzFA8RB2SHRekae1ev9i03kb+sAsCDGpkfXVcoSafsjV5r6S5eckaaVz5iHy60R+LGIX4I4VgYrFh7hBEx3q2uaVJcGilKwVezuDla9IU7peR2ZD95S8Ovds+mzty2utSubX/p9w7oJlRzmffjssMCy3AALKWxzLFgo/xQ3+yD4MQxPW7p6pNpq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtapOcrAuKvlFMZ6A13qH/lcH4rhfOijEWkO6D7mQDA=;
 b=fu9I3AddZijiZ0mKrA4V19F4Y9rziyyAOsCpOC/7aj8PwO6Gc7DpbzqyuULKDcUYG2iDlIBDpzhNormWp3ahqjGrijLuRzcWVbPWYG1GPxAuoGuwlvrF6ajKhDU5lsUVLchhw4kgFhAKPQKNUOh57+TEHBeVnoC+1uNHx9YCrshBCb58gGH4k2T6Ql1Ep8YT2LdE8+U4MS6GxgMWke1aC8TQgFOJgjJHWaldmPBC5pRbGQlNFvyJeC4psXG9GRmdDvQKYDBOM1C9b5jD3itICkDzbcCRhREh18wIFBLh37CijwTv3ePtSrOB0zAavV9MIv2VW1S6HoDSKlmlsWDSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtapOcrAuKvlFMZ6A13qH/lcH4rhfOijEWkO6D7mQDA=;
 b=VMgw0/rPXmgAI33J69JUHIgPblT00cfDORcNB3YSWAfy2aA0zQPXEWmNqlLpgnFdZNQw//sDbzMxGyoSIBKK3felnJWeT8vVuUd7UmgFlfQLqMjOeD4x4WyxRPMMs0o7kyEdDIAz13Kp2Yd6VfExS87+ywxuerwvtStLgDnMUwDjsK2HIFxINLZ5IjgAv4iq7utTFuFAkzuBsTqaV+KNRAADYKvvPLOc8bzmEE3Lg2WSfscSE3QPE6IVnUlviABrnytdzE/96alNQNJC8b23rx8dxZJDW1BuhJmlZu3oIjUtiptHSCNrnHlkNo/QQWX5rIssTNUYtDtrL9CYSjTbBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9819.eurprd04.prod.outlook.com (2603:10a6:10:4c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 15:54:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 15:54:58 +0000
Date: Mon, 30 Mar 2026 11:54:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, git@amd.com,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kees Cook <kees@kernel.org>, Abin Joseph <abin.joseph@amd.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/5] dmaengine: xilinx_dma: Move descriptors to done
 list based on completion bit
Message-ID: <acqcy_3Bkjkq31hs@lizhi-Precision-Tower-5810>
References: <20260313062533.421249-1-srinivas.neeli@amd.com>
 <20260313062533.421249-3-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313062533.421249-3-srinivas.neeli@amd.com>
X-ClientProxiedBy: SA9PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:806:27::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1ffc63-53ec-49b5-a7ba-08de8e74b1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: UGxG5RDbIKIRpOLEJQm2wHhux2skVcrcX5hsXbsHtT+3CqGloDyC9I0FBBfghSBFGSTA8cRGwEXVRqtkTZe9u59L7nafjQ8oEDkuF/ooBamUmJ08l2BGrRWITAHAeSmErYp4dd7o7YuIznRtI34aQLxwFLsMezmjB2L5cMgoniQscm+RkWANB7Kfqx8tfKIZ3JKXy7vWTJGgBIBH70qIu532yVvKyyepQHwPVTsdwdDOYBu/PrhlbYmG8CUyOuVmZN4scuetFKscWqaOBwU0CeTM00bWJb/1mzCe3LRg0VvGSo+aNVmEXe0+lZOGmqgcDDGfIaiKrEKyhjJVnDfqPkgj3jQvjRF7kG+hWdCuGJhQMmm8ZI+Ww1YfrQG3nb/f1y5xeGyQ7kjZdtGksd20DBu+WPZyZBPGQhGi/CZDzjxsIhEbCPV8N9jPRGqC81NW7psq8kXLMEjF0VYewsoe07rQKfYPNtAHLp8GVq/M+TyfrlhwMZ3Exmhx5cKquOF/IfJvtxg7LdUVvQlMgN5ng1Fzrw5SnoeLycj593kOZIz/snyZ5HykXGQ7TvVF9BajlNFptk5TSq4BRUAShhtJUVq05TbXlJlTL3FbghqoSAl357dt4x3atI//6kOH3A2KX794Qopw7elvmt/zTLcmsUZR5HzPFEZrZcKTkUUOUWC10DEPgf+samocpK4vf1a9CB1YuD+wJUHbO1oueTr7b11FGcVPHLAw/H8yUoseSvMgsFCgTe3NUA6poltgZcyHtNjkEwq7ycTiBCWvVdvbdRryQPaJuMZ9bGyrEaiYNqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZZq4Z6QnQg4nZ98k7tkGl7wB+aL1MgH9hUv0Hkv9VRaocHdi3uYPeJv86onJ?=
 =?us-ascii?Q?SPqvWtSIiKhcbWkConw2hRjno/XKOb06HIG1QwogmWOLDfxaeWSlIoMy6xGP?=
 =?us-ascii?Q?N/E6C14hWOSpJPLGtu6KLl9h5/xk1f7++awHOSmoClNtHTNkzbxv8DqXsUq9?=
 =?us-ascii?Q?awP5kQtXt7K3l31xZecgsm915m93V7ghq1kt9UPHPYmUM8YWElemLf9d7j9o?=
 =?us-ascii?Q?1yOZR1qwDzWbdy1P1tn2ZIUblC+xOk7U//fwBWgUztLIhjTIlviciwnP8x+Z?=
 =?us-ascii?Q?ZFGvnM6b031BvwXpegF2Nn28XJZbP+2dXX9XAP+CIDpvUFdh7bgBO8h5L6sJ?=
 =?us-ascii?Q?b8DEJThAlcOHSvEa5F+siulCHOHrt8AylLy9RFIpqK24L9b47Z56YN0Vfyj6?=
 =?us-ascii?Q?XcO5UuobaSUE4LR7UDdB1AkJS6M9jU6A2deAhdHkGoE/J15HJNNVD4aLMxMH?=
 =?us-ascii?Q?B2JNaNL2z8kRx7eXcYVXS+OhSjsthZwvZemWQdzj8QcVmkfeqTaIGCi8RtOO?=
 =?us-ascii?Q?OchuTLh4CdlhxsgiCGDvMlAdU3tqcwGUu7/G3AH2bsGAawNNTHuvE7rPSc6O?=
 =?us-ascii?Q?dhB+K+oXhUt5AIDblEsZNTh8j2m4aXNjf24SWQumzv2ZzfxbkAWBHnZ1sgYt?=
 =?us-ascii?Q?8ZnqJaoWPf2asqbZWYPgAa1V90wj93/sE3gybx2a751FCYlTsCocOBB3w+M/?=
 =?us-ascii?Q?TPSPd8ZpR50Yl/5TACjL+lVB7gW06BM31N0+oVjNcH8y5+iaasj890i1sQTc?=
 =?us-ascii?Q?//trZahG4GsZda9cjWihVfPxcHGjNgFHRe5oVyTcDp8wulCko6G2JUBbLzRn?=
 =?us-ascii?Q?oqwzzi52785ZBurvWAvteyBTNiopjCsDv3LYxeAhvKOCQFpb5nAd7NAAZB6y?=
 =?us-ascii?Q?QHES4dvbsO8c9B2RUxiG0/A52n/OGYTAhbY6xyUvexkV8JW2xV4OXJf5zF9w?=
 =?us-ascii?Q?Y9Hg6NZa++G1J0sXJjaXX4Hf2u6wIcvYSl6YGOdxkwoTdZdwSKx8utDPi/8H?=
 =?us-ascii?Q?Lr7QcqozdKofO7Sf+QZkXb1Iz035HWy4flR4mUsbEIECQJ7JdfNQaQHeT9xi?=
 =?us-ascii?Q?H2u7ylayqhyO3jomeUxNoVHgEz21ILByrB0atdV6KocZwKLvLjtk0DLeS2Q7?=
 =?us-ascii?Q?aaY7+RpPkRPrp6p+3YRdWFvMcbxQ88y59bPdMGGf8zoZjsUV7txT8WXq0dds?=
 =?us-ascii?Q?Ks9ddUTvlGH91A2JW4nTJDKXIpeHVrqz8uP/gntU1zMDCszY9OfHIwUDNye3?=
 =?us-ascii?Q?fJEg0z8+Xnmfe/y0YfbBO6srRe1Wru+cL/H/nmmAKPW0sVq5ajyl5UqFQTy6?=
 =?us-ascii?Q?ywJ54M/rKBs08ejgk8HORGl3n5LmohW2CQeM9WTpCBdN0XcfGt7VcW1Uo3PJ?=
 =?us-ascii?Q?OoZM8odXHCah30nGeHiF4B7Tptxqn9Lxv/RJOn262Cit2nCwrUjqMCCe6g7f?=
 =?us-ascii?Q?S3P2rhfY1dUjyasUKo0DegiaMeQ1BcObf5pY3gypq3FPCadEkDzNmYj7g1FZ?=
 =?us-ascii?Q?aDTCJB+0hnsiZIzbjUDIu4m5m3gVKn5ahF513diOD9n9RR/MePjmiwXgngS0?=
 =?us-ascii?Q?yYZWWAQwriWok5wBMnRHaDfHkE84xd/Ub1WjT7rmLdBWKAxKykgLmJ5sGw68?=
 =?us-ascii?Q?nZA9PDEa82p33k6YfQr5N02TRSPf2hbkLU76huSzUHqFHxjVV6Upy0qh961Y?=
 =?us-ascii?Q?IUuuhy34pzZWEU4YibzMB1GI+LzzVyQ+aUGfVLHHcI6wBl0lcL0KolGlJ6Zv?=
 =?us-ascii?Q?L56jJLU4LA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1ffc63-53ec-49b5-a7ba-08de8e74b1cf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:54:58.5481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cI1fRzCuk/SC9Drcs1wuidZS0hgaY2zgPozCfruFL6PCqvs28742FVWZMjr6c0xjBGQPBK6LBWTjgEnFJUk7WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9819
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_085503_030817_BABC5A44 
X-CRM114-Status: GOOD (  20.72  )
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

On Fri, Mar 13, 2026 at 11:55:30AM +0530, Srinivas Neeli wrote:
> In AXIMCDMA scatter-gather mode, the hardware sets the completion bit when
> a transfer finishes. The driver now checks this bit to free descriptors
> from the active list and move them to the done list.

Add check complete bit because irq may be triggered before a configured
threshold is reached when interrupt delay timeout Dly_IrqEn is enabled.

Frank

> This is required when interrupt delay timeout Dly_IrqEn is enabled,
> as interrupts may be triggered before the configured threshold is reached,
> even if not all descriptors have completed.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---
>  drivers/dma/xilinx/xilinx_dma.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 4a83492f2435..00200b4c2372 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1762,6 +1762,18 @@ static void xilinx_dma_complete_descriptor(struct xilinx_dma_chan *chan)
>  					      struct xilinx_axidma_tx_segment, node);
>  			if (!(seg->hw.status & XILINX_DMA_BD_COMP_MASK) && chan->has_sg)
>  				break;
> +		} else if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIMCDMA) {
> +			struct xilinx_aximcdma_tx_segment *seg;
> +			bool completed;
> +
> +			seg = list_last_entry(&desc->segments,
> +					      struct xilinx_aximcdma_tx_segment,
> +					      node);
> +			completed = (chan->direction == DMA_DEV_TO_MEM) ?
> +				(seg->hw.s2mm_status & XILINX_DMA_BD_COMP_MASK) :
> +				(seg->hw.mm2s_status & XILINX_DMA_BD_COMP_MASK);
> +			if (!completed)
> +				break;
>  		}
>  		if (chan->has_sg && chan->xdev->dma_config->dmatype !=
>  		    XDMA_TYPE_VDMA)
> --
> 2.43.0
>

