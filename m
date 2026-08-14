Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA0AC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTw/9COvgDj2dHwnwofZoKZqihnfcMeJ7WU9dso8uEE=; b=RQdlDc9wUCI3qCy6CdYLmJ1VHn
	l3F6zMJ1AuDjHaz2AlpJ22Nw+v5evjVNKB3O8644xBZjA57jm5ahkwZeW9YoYtFuNi4UR0QybSa9k
	SLWne8mQ58Sq3UQjjvS5vGGDmnfrPdwoQ+EUELh/HDFLGLj88iHZ3ygnhPkZkGoG7ixZhR3iKcQKl
	yjv58Mac9VDzdoms9nBHH/bJXSqvn4eWvdkXYmorxPCQwD10AECIh2xuZZoFbB3qRt2kQD7zIfllU
	kAPYBa3JRLivCArEDnGaSz1+2jGoIfgVPBRxdcdwB4oXVU77NIJ88rhHKNxwqcELb0ltBw2GalfdG
	E+17Z2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvQY-00000002xgb-0Yjw;
	Fri, 14 Aug 2026 17:10:42 +0000
Received: from mail-northeuropeazon11012058.outbound.protection.outlook.com ([52.101.66.58] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvQV-00000002xfw-1mxn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 17:10:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqlKSYkVY3BHOE7jsNK7c1GQy+MHhJpa7Z4nDuuEwsbQ4+vPtpDHk17S8VGtE2Ta2e8+TlY2MYrRj3ZL7g7sbIubhOXMl8+UD/1nKLzGfIQBws9Wg+0YSfGFhsC5XFVIWoaeAxFeXXvPD4Tjd7RKnkWc6p6rSCOFTKE4YvwwlV8qNZb584rP4b0aaCTaGMxmYi50v/rUZHl0IMhhvscLVUShfxuGIWRq32RwxcDni0QxezqebZeQDjmNeZlA9bSR3ojVXXYEjIrImny59MzUnLqFCZgEYnzqqJFqcI9KBy8uCRlXKRJLCPlZMpBxsIpnFeBRS80Xk53wa3bbwM8Ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTw/9COvgDj2dHwnwofZoKZqihnfcMeJ7WU9dso8uEE=;
 b=F+3YLDyoZRCmh/rLHUTtbTbjqrLU2nAshq3IlzJkdhZgiUdl8VofVnyORoMA6Im3xYNpJ9PHW8BpSoEFhW/aWUxCdEFK4ou3HfH6H0SXnHvoJqXmRyTviu5+77O+VWO+Da3PeVinPpkfxMA1xYvnMDE1WcA4tceykaWj5M4ZxxpPkOYI4PwdIEU25zfUNmQMfFNwYv0IZaESH+zYCLEN9ZtZgqQan1m5sdWRqa2NDVUjoQwgfCsJurVzIWb3oBShLulfh/2AtPGzvSJFArfpXurDlYAcAlv/FqXTDWPOgBicr3ZhOGUXtDuQV9iNrSaOBSiCRBdQbwSfPb4T803ulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTw/9COvgDj2dHwnwofZoKZqihnfcMeJ7WU9dso8uEE=;
 b=pyrfF/kFD43SBgZIINbrjdegB+zNeckx93d+7bxrBjalvISIXJCtQ3eEcPeCGAzinWh1mzIsVjy4JvL9ElGsmjymufMPv7urIC4WmXGMPWSDQI1qQeIl5NCsdS0ZnfWlABvCXXlnHVeZJCIceVg26K7YdGleRcF+X3TjcnCUq+ckv+2V+7NYGqt9QOmHv4zxrJIQyOWEbRg8v8V6tNJ1ippaAwNH5mZu/2Q5jnJ68GNrkGZEM49aEJdIJR422lAQY6JEoAxsE9r0m1esIVB8fgBzWQpDIxexJZeM9cbctu0QSgp/RUZlWfLPZsLSWWADDAWvSVk0EhrsNOXVrNcBuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV2PR04MB11399.eurprd04.prod.outlook.com (2603:10a6:150:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 17:10:35 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:10:35 +0000
Date: Fri, 14 Aug 2026 12:10:28 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH V2 5/8] dmaengine: zynqmp_dma: Fix minor whitespace
Message-ID: <an9MBJDGYhTroFaG@SMW015318>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
 <20260814045616.1661199-6-nagendra.golla@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814045616.1661199-6-nagendra.golla@amd.com>
X-ClientProxiedBy: SA9PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:806:28::27) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV2PR04MB11399:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f16157-545e-47e2-4b8a-08defa26f474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|6133799003|11063799006|56012099006|10067099003|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: qDcr5sv5eJ96RGwXdWWg6emFZHcRXtGSXLccD+H0IIJXehn6eoGJq33iGKmclR2BcNTDk2wNs5FX+D4TIsn5A4ijOzLywOqbRlw8va+7MiWul10xGxGt9+eq2Hyb+7gi+XukXPvHNShPVqpMNd1T76L/4SqyLD6LHWN/bIe6oldarek0zSmrX2CglM83dUtadwRFfC9jTjAKC43gizyBiXtXgOxpz03ZcHHEMCirZk3ntPIWM8reM1F+vkDgJfWubSh3zbC9uVPt1Pr3Cm88MJdFiZKUdLmrMfz6ElpK2jrPcba2cSJ08RBjV7JKTznT87wz8aFMr7TZ4xYQ+sm/Tz4MZytBriLgRjYO4vaT8IIAKkKiMHGMsYbWyC0yXwSlub4u7uHi7BrjgV6yaIA/f108SSwTg3WCqYabv5yi9ViSWxKeDE0C8elALLGPhs0CkfI9eyjtfOcZMP5SnkTRhyr5q/NwOpfBrjrrq3B1ntdd+YqjraSi8f7d3WqYjorvDaZWpQEoMWEIUIlP2shWQPdSZSOVGhKJW/8+H3EOwPWGMJ5Mk0PrJ+O13oSbLPWhONZ6tBkk+9ojXRTGzW3FnSBMVflc9UWaUKGEEuPEjyk+iDYyP13GbEVEyAS81FLlGjIR/fxmWzQXi5qa16JEI7fzMAsBYs+HdZ6a/g3aTH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zUXx7Bdz/ZXQMkZcqVbJztsxOAbpw7deJkVrpl+p5Qq+lnrbnWp8ytFM3wJM?=
 =?us-ascii?Q?QH1U3A7KHjXTeHC3mATf5eW6nkXlDOXUCTY8NcCyP+KjM9LhoQFBHbyjbcxS?=
 =?us-ascii?Q?9iDI75S5HGJ6QzeN1Kkd5a6C1YOpoRpp1np8DopT0TtqRDJ9FYWe9abxaERg?=
 =?us-ascii?Q?drTCOZ2XBHiQG3f/3pF9h9eoOqoWomXotP5Q4AsK8/b3KKoweQJWpajxuWLB?=
 =?us-ascii?Q?4oFpkl9Umbw1AokZOtgYKlO8CXDvDC4sZ9nBJq7kO5gD/newqssTr9C8DtwB?=
 =?us-ascii?Q?nTObahFC2DDxAVjej0Gaa6hZFAB7W2RKdg/zZ5x7dA2k2qT/71cwey7rkMuD?=
 =?us-ascii?Q?LvTEEdf/xs7UpjLstNo3wa94nKnoScuC4kUCzBYuQeHTrDxSOzuwlhoxeOdX?=
 =?us-ascii?Q?A9jxd7ooJcJjkFqzorW9NCBYOTl0iAay8f7Wpx2mx2XvPo9iLzurgv/n65wR?=
 =?us-ascii?Q?11O6b7kHNtZI9iQfZzkGZMo573D+Q1IUhGdcisEVuZM9InyjzpXvnZ8d0Ime?=
 =?us-ascii?Q?KHaexBn7/s78SVxRcVBw8DTh7h3EJ8kSd2hSQ0yZKABBdgwJ+jMBl1q9reWb?=
 =?us-ascii?Q?1b3wsA5BA8S2IiYCJpOHuuvwAQ9R7ihcSHaFqDhlEDR5KB/tu06X54XJkNKU?=
 =?us-ascii?Q?RqwY2thzgVYrtdP6gmCYhKl7bbzzM7bxYE22vvdlbubRSXlhU+lZmxOConxC?=
 =?us-ascii?Q?D5Srn1QMCpxmL02nykAIs8dxG60HCkwCfRKalGsZd66dI5ePcCzH+eyYLkwU?=
 =?us-ascii?Q?ydVePBEVvZfnvbe0Id/zDo/u/OjxyqPld853NY50hmfeFVSRgy7ckM5Ynp/7?=
 =?us-ascii?Q?KkC3ab7ag6b15TUDojiIdfKQ3hN8uXIJQayy6+OR7aS+rb81VTaw+NLV5Ixt?=
 =?us-ascii?Q?C253upx5u/l1egluMfVD//HrFKICzUFP/gk93FA/vJNXqsIst2Lu8glUphEk?=
 =?us-ascii?Q?kx1fHGyxZSNc+ffE3Q23hYLoZQUh4UoMeVAE3IhqRmMvsTc2EHUVQeGNUtKN?=
 =?us-ascii?Q?r4umtQ2lPt5GqlmXAur0uYrAwWRNtnXACy4dU/Q+O140BMGE6RXSW1gQFZdF?=
 =?us-ascii?Q?w6GFOMx/kxscYK2zMgzMGQZ3fmkBhzkAAj2fgNaNFPSRh9XU59ZMhmHF4nnY?=
 =?us-ascii?Q?wNYSC7m9ZW23Qbci/PrUn2ZCzcE8HabkD4IcTC/1qsPSqipL73qs3UMkVXPW?=
 =?us-ascii?Q?Bm7TteBuyoDYJiG2NE29AVF45uDux20YbZPtT0TmUWZaHYLKQVQbRul0jNei?=
 =?us-ascii?Q?ihbRIb79lGqbQaXh2GicSq22vg5LsdSgPrZaY/B2MttnhiCgyhb+c1gUn1NK?=
 =?us-ascii?Q?xqaT4l9DiOsmDHcBHJCVuHMI2VL/KCyirTg3xWTLpYZpjsnBOk9k4Cu/xtM7?=
 =?us-ascii?Q?2XRpXhrGt2ctIwTTrebaUUftvxDyQLxxyIZrAhip6OvH96as4vuM48u/b5I5?=
 =?us-ascii?Q?EHqzQvoJLg6qAMY1d+myatQMLPLUnZ4F3E5rKdv4WwLh9PuHVftEjQFnj8YP?=
 =?us-ascii?Q?4VwHN32qo7dprEo0ebvgH0EyI3fI/uUnzUgcKHOPLi82gWUyioBorxAqybIy?=
 =?us-ascii?Q?dwisxSif2e4usIGXoHtgojWDQTcjVwUW/PmScXswI2Z/FqiIa+L90LyArXs8?=
 =?us-ascii?Q?7BxsOXZvrpm28TsUlMX5W2GJRyn0bQojXK4zulITIvppubFzqZIoDoUeFdzG?=
 =?us-ascii?Q?/XJduswu9QXPieMCvgJ7bd+7/XfPkhO6gjJscqTbpTe9pIEJUNrgq6rYZmcc?=
 =?us-ascii?Q?aItRBVNdN3Joa2oC+Y9zUM46Kn2SuPPDMcnWj5CSKaxY2blJzOkv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f16157-545e-47e2-4b8a-08defa26f474
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:10:35.2722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtopIEibVfJiMF9xq+kkAqrB0yjfsLeZ/THcXx1dqArn95dSK0HAJ5B4zBy0PG2gvFEE4sUKe0FzHQYO5JzCAf3Dn65VDC2Y5tBEty+tEWYuYrD4aWqoDtBn03/vmBED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_101039_770984_93A3C33A 
X-CRM114-Status: GOOD (  13.36  )
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

On Fri, Aug 14, 2026 at 10:26:13AM +0530, Golla Nagendra wrote:
> Add a blank line in zynqmp_dma_chan_probe() to separate channel
> initialization from hardware setup.
>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> changes in v2:
> - Split whitespace-only cleanup from the kerneldoc patch into this dedicated patch
> ---
>  drivers/dma/xilinx/zynqmp_dma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index a2fbefbb43b6..5e81e0d950e8 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -959,6 +959,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
>
>  	dma_cookie_init(&chan->common);
>  	chan->common.device = &zdev->common;
> +
>  	zynqmp_dma_init(chan);
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
> --
> 2.44.4
>

