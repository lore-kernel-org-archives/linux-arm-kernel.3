Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1300CD24440
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBuuZRlYhtgrGuWKm/7+EEec8eLgqxTqh+judcSoX54=; b=EZso2eoVYpM7XKw0s6Z5BEkuAO
	YOc7HCKt1relA8ckdsMKymLWqpwh+jbt5CDy8Ti8Nj/VQvYjwJRNoR/ff8zBMqiKCtRYALZmjDN/M
	w+hKqt0JQ7CwpBoyiHVC4oPMm4Nk9ih77fM9Mdh1mvUKj3ixsND5iIAa+WRPCu2CaSzfEefG1fXUp
	kqEIVal4yZhh6n21VWS9emjhsCJz6q3KcrNm7a6/HuEOqdsrX49nCsZLXda4uFwJ7EdFsfL4gWls/
	iELmw5L5brDVj/5Rund4Ot5o8DAJt9Kt3I9GSqvVBxMUjbtixC8zk9p+GB6alPFfdZVwPDrKOFyOF
	LLMjiuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRD4L-00000008N7M-2Py9;
	Thu, 04 Dec 2025 17:24:41 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRD4F-00000008N6I-0E6v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 17:24:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QX6INWU+uNPCjTMImtZZ3GheKuGMyWGUJwPab032uD7UaaVOWJ5ekE/LDw+Xp12D2gdcodG3guJcS/+HVTrXnekbfJr2XWukrf6aTIQlXRJGeWE2NDYWY3ZMdWYNp+vpglkEoo31drDdaNePTg9zep2Aajk1egGhUQPDULbeecD39LCHnTi5G+kVepcXEFrwKcc9C4Un0koHNegcpxH9oKizLFSPTY0vAzhydnZjYasP6HJ68mcjXAG2T/kq2gXkmVICUbqqdiVKs7OTRB1EmrFfShmDg5qVzV4xiRC9JkFHzWdiLz1svbMaIEeG/rVJFW6TFjTWYw01Obej3rw5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBuuZRlYhtgrGuWKm/7+EEec8eLgqxTqh+judcSoX54=;
 b=nmNANv6Pu8aW8VN7i9DxlIzVmZ9UIQQpPtuVSx3TUR7Zz1t37WJpPUH8qfe0zT3toLVBQreIl8xoPKcPDn0giZ3nZauqbec5bMHCjvCSssy1c0sLA1NfBwJYbQib9SZmaPYp0E7QBnQYm31+KpzywvHXT/zSb07EbYF9QJOtnJrzTuhsQx/BqTB0uKXFgd9Kf4Ktz8b8ZOoedtHa1h+sLthL1gXiocOsQ53M/6XX2H8b385DwSZhirbgCkwXlIk2tsNMpLpMzjeCt+ozbgxPOpwpAniMDsI5hj0ChAOityp58s3dnk4E1dBQJ2WB3gKYUW5VLHR/bWyEiwFVnr021A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBuuZRlYhtgrGuWKm/7+EEec8eLgqxTqh+judcSoX54=;
 b=d2L1BgDQh0NDrUGE/d1TaMmcp67VxznzmsS1aLXtv+G/8LQSYnembLGb8OcXzDvf/ayK+KjRGheydIxMGpEi7/ok0Pt7zjcFbwEd8uUNj++en3B5FHWdXcbkBA3f0qJphYItIcwIP6TubGjvWLB1PM5KZOfyYmAdsuEbqs0wdwLmmlA9XqMfKWY0RqbAb56IUxlDH3lqiSaAs+2LXrJ70Z5B7uTKPAsJpDmjSx1wgMzyUU+wF0xHe/1d39emT4YAI3NJSQIMXh/RHhJvF6zmZEaCGnz/rfZQvAbMhJpQn7RBZyeVbS4Jo/OYoU95uO6uqZGJw1Mf8lcwl13EbKvaHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PAXPR04MB9108.eurprd04.prod.outlook.com (2603:10a6:102:22b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 17:24:25 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 17:24:25 +0000
Date: Thu, 4 Dec 2025 12:24:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	l.stach@pengutronix.de, peng.fan@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] pmdomain: imx8m-blk-ctrl: Remove separate rst and
 clk mask for 8mq vpu
Message-ID: <aTHDwHKcNnesAjKP@lizhi-Precision-Tower-5810>
References: <20251204090813.595-1-ming.qian@oss.nxp.com>
 <20251204090813.595-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204090813.595-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH7PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:510:33d::24) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PAXPR04MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fac493-801d-44b3-0c31-08de3359f8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l76SVA+ysfGOs+zyRx/5zR727y9TIPHLtQM+TT+mG27hgBpiGBIGpMqoSupZ?=
 =?us-ascii?Q?4VVlqtX8WvNd5b2dfbBj9zdLEfqFjaurWw9xTU8ATIDWYvLYRcn/Mq+WGBwD?=
 =?us-ascii?Q?C/uVaVCjKq4eA3BuJHf7TBweN3Fte07vX0g806fB9CDtZ1f9pXRFSxGcc2Ip?=
 =?us-ascii?Q?1LayWBnyCpAxjDFj5EGKmEQVMwDc1+RczQOKWpRVc8XwgoKT5HxHj1D6fXYe?=
 =?us-ascii?Q?/YP+4ivm2MJjF63v4H3c6HxsLEZ4xWa5pOu2MW8aFkU8kQl0DVzB4ws+cs1I?=
 =?us-ascii?Q?DDVmIHG+QOn9sPhXNgzv4VHt3o4jxy5R52yAyzQzVlHYRApLH4dLpVKDmO+j?=
 =?us-ascii?Q?64UuOCSXqdLx8txrigSgElibcUeYdjqylNsAQxBrAsGSXquCuP+vGbgyl1w1?=
 =?us-ascii?Q?LAX3A9e+txCp7lWX9JV+mA5zt64hEjYPsv8Y/NEc+zO1p0KOlbqU0I3xgY9t?=
 =?us-ascii?Q?ROd1fx/wvWUoKhoVcpMGmyF/34zSY25+vrOYGWc7ho8qb8BKBtqLEd8wN3Yi?=
 =?us-ascii?Q?qu0kMRXpHK2G4JJs/7JZSomkhI1BBcjR9LyTf0PWcNEFWgOcafxCXe4JPkiH?=
 =?us-ascii?Q?cUwyzw8vmW/41wll0LQQgXCFpL7ZRn2Qip3IrrhcNpZlQC3bRZO+cXPWh2hn?=
 =?us-ascii?Q?O+SWhbzU2ttI2IL+NovhE5Ad6fy1oQw+yZuDBZJ6QQufPJiaH++vJ2RRFDQk?=
 =?us-ascii?Q?lNX0VvRXlAjyWWlGAq4+NpDSrvXfw7PK1P+5cB+DtdFEQScNChlQ6gYoxVES?=
 =?us-ascii?Q?jCSbMycVJy0+x5womfbDF2dYVtYaHbtO9Uk7vjbqIFrNMfcQpZVuhLCWStJ/?=
 =?us-ascii?Q?EJHJb5trOYulh0OsMafMWcmTLMTxoReR9PEadifs86n4QNpaAtxUIznTMFEq?=
 =?us-ascii?Q?fvSK/4f8UUpMwRuKYp2FjwgBb1u53TwV3092i6itYjhmF9BcqzE3Vc91Zmvk?=
 =?us-ascii?Q?omfHaGeO226xduKPO7rzcwneiJs7VgZ0ydGTMx6B2eE1c7q1Hs+u+yiaprnR?=
 =?us-ascii?Q?kiL7n/Fu+T1Y+m+TTfAQxIUrd0It4Ys79rP97hnr7BVSLXHSc9zdSOPco1Ht?=
 =?us-ascii?Q?xJgu/8yxxAO8bbznIidz16HKV4lfvbEMxhUzQ59GpTH0bg/KuhnPStmQMfjR?=
 =?us-ascii?Q?uTxeMSUsGn/7YZ+fz679FImebaWFGBiHovG/K1NYje69tkVaiuHsaYQvwSWb?=
 =?us-ascii?Q?fTth/uIIdzrK/rvdlnSWDNFSfPhsygswQEL3z+qN1ZmVbddSaKkKUBruNncX?=
 =?us-ascii?Q?pQs9lwFOzqO9mGnEtYFEKKMrR/qAxWQ10uP3Jmo/5dYfSTxVPgENLnx/xqJd?=
 =?us-ascii?Q?61aaaQ1t/n7N/lPu1qAKSpqM6OXQOA0mriXu5RWw03TIqI2p8ie1BEI2ZaM7?=
 =?us-ascii?Q?NBPCnWOWvYAOpD68599TbHk1gyzHYjzk4HaAhsDwYACr3EiDMgUAD5WPkhnB?=
 =?us-ascii?Q?q/X1pwvE/wvR1SX6cMVkLntg46aTD2aEH3i/60eOIFUISO26zgnpma9y5mla?=
 =?us-ascii?Q?GSjSPEdUTCBNQ6pyISH8ZcyTNc2crhNkVE5H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NTje0GI/DY+nnuojZH5MrBa1Rt+GLz4qNVV/dmD5XmRNWMVp4K3cK6IIIF4m?=
 =?us-ascii?Q?AVbxPtoWDKbU8lJ3MV4zIrCjK+iAeoGRr7qhC7PXsYly+c2fAVhYJmvuGpQC?=
 =?us-ascii?Q?nXTqL+4Ue678dB1XSIFA42u8rFfglN2jjRcVFOfKFMnnMKJtPswGvwbS3mVG?=
 =?us-ascii?Q?XgymjHqwYMhVSaSPj1Kd1tXj4IAifGlKy/K+Tuz9BlZaW89/yLlGqCBZbX3K?=
 =?us-ascii?Q?4+MupYPF4JwO1o1hZnl6mWqfL0uiI1ih9xJZQ7fzq13IKgPeZkHtGHbAsHJy?=
 =?us-ascii?Q?4KoYf2xWIukl2j5WbpdEwOt82KKY8kjNhRKHxzE3UyKu9u3z0I5ojXLxbPar?=
 =?us-ascii?Q?xxUSd+cDfwqdm4hfim9av83eA/Cf6UI51ULleM5bbKYQOcCcq1VPUOzRno+h?=
 =?us-ascii?Q?b1ifNeTaIm90/tS1aTFeWHY4r5gnXOkY1xIrehNt4e4TCikL2JregjYflgX+?=
 =?us-ascii?Q?mQJ/P7RdDnxjWIX6VlpX7GaAPvts55xpmNWNdXqs6BNgxZaEliGh8N6HUQmQ?=
 =?us-ascii?Q?iTYlv/W/4ElnILuxMnVDyQb4GwvHUqcKwzrvLec18jKe2+knB4nZ8CYjH1Xt?=
 =?us-ascii?Q?F0YIYgvFXIzqeUWeQqSh8EDXRad+zSPGXRoknEtQmWqmtx0a6OomLDFLrMte?=
 =?us-ascii?Q?5MYAIBfuVWvJ6x2CVvzXkJUrTfcSt2za6l5FHQDoYTeEpcweBNALI6ni3vFs?=
 =?us-ascii?Q?2eLYJtpXl64vJHKlKIQtz9375f57If20Jub70Ff1I2rQuQnDU4Wu6yo/+GuG?=
 =?us-ascii?Q?VUehxURZpfcM519tMLJz65cfCCGrn6v0DhAHZ7PwpJYAtl/MlFZcuqiGwEf+?=
 =?us-ascii?Q?VnLrtT1mBzID4oH1AhUHnIjeQ0J0gzLMtbnWejYtJQgUCjvgLgWZG+JYtYLX?=
 =?us-ascii?Q?zk4b2jyZBOyBusKEzg6NhWxzUf1XAoMyCxAuetf8Gmw+aGpxoFtyMl+rrptD?=
 =?us-ascii?Q?QRsdsIk5ydY1iiKULs/tmFQBExlmoeAlMhEXjGyqEiEUkk8knFTfmvRr8zWc?=
 =?us-ascii?Q?RdpeYUgOkaKnFIdmMolseA0LNJ4NTZku645VqqT1O2kTJR9EMWUZYun2xLL4?=
 =?us-ascii?Q?gdlBraWhr6h7WxqehEcMbdt8SnHWLyMmgNvfwJOtHnC1VrdxPifnwpX3l2QF?=
 =?us-ascii?Q?+Io2t8isooRiIaRIIOFIg7XDlgQoD0ztiIlfZFGbWl4K8iES41EsaX5ZXb7e?=
 =?us-ascii?Q?UqVloCb4vfkiEZZ+lkDgSd1W6mRUw3JLXrkG/9LW85CylnaiJGmah+hY50Ar?=
 =?us-ascii?Q?K6ShcnGFEE4Qe0CIJtBbw4TpAS1oUTTVy2SRjDga8mXnBO8FFYE7oxH9s5lf?=
 =?us-ascii?Q?IJRTfVqzYRqWrAcbozd3ToSyFDsMFxihVUjrJ/j1P/ZQCx+0ZDy9/TLhjgA3?=
 =?us-ascii?Q?eN6Uu9tFJ6zEz07w8hAJcYP3vBLUpydPzlY0a29bEtXuzL/mmWqGXoLFYnLN?=
 =?us-ascii?Q?2xpmtB5KOMQu4zoYN0VnRxBVZkHG1pm8TY4GfNEMaiaMTdolCq+dvGxV10Lj?=
 =?us-ascii?Q?5ppG56x6kW1GcXFPZDTq31XM5W6luwawknHr8KuvnmsNmnbLJg8EQLkO/+qa?=
 =?us-ascii?Q?DLwBUNNAXQou4PdTr8sJpxHO+V83LW1SXCqSESD9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fac493-801d-44b3-0c31-08de3359f8ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 17:24:25.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMotYPwS3nHORpkrBN7Yx5nxCLHv44hAvjXNp2AESd4kiKkML9OBF5V/0UV1SG/QnLXk5Jg7l70JlyIKaAcReA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_092435_091439_0F21312C 
X-CRM114-Status: GOOD (  21.61  )
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

On Thu, Dec 04, 2025 at 05:08:10PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> For i.MX8MQ platform, the ADB in the VPUMIX domain has no separate reset
> and clock enable bits, but is ungated and reset together with the VPUs.
> So we can't reset G1 or G2 separately, it may led to the system hang.
> Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
> Let imx8mq_vpu_power_notifier() do really vpu reset.
>
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v3
> - Add some comments
> v2
> - Update commit message
>
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 5c83e5599f1e..74bf4936991d 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -846,22 +846,25 @@ static int imx8mq_vpu_power_notifier(struct notifier_block *nb,
>  	return NOTIFY_OK;
>  }
>
> +/*
> + * For i.MX8MQ, the ADB in the VPUMIX domain has no separate reset and clock
> + * enable bits, but is ungated and reset together with the VPUs.
> + * Resetting G1 or G2 separately may led to system hang.
> + * Remove the rst_mask and clk_mask from the domain data of G1 and G2,
> + * Let imx8mq_vpu_power_notifier() do really vpu reset.
> + */
>  static const struct imx8m_blk_ctrl_domain_data imx8mq_vpu_blk_ctl_domain_data[] = {
>  	[IMX8MQ_VPUBLK_PD_G1] = {
>  		.name = "vpublk-g1",
>  		.clk_names = (const char *[]){ "g1", },
>  		.num_clks = 1,
>  		.gpc_name = "g1",
> -		.rst_mask = BIT(1),
> -		.clk_mask = BIT(1),
>  	},
>  	[IMX8MQ_VPUBLK_PD_G2] = {
>  		.name = "vpublk-g2",
>  		.clk_names = (const char *[]){ "g2", },
>  		.num_clks = 1,
>  		.gpc_name = "g2",
> -		.rst_mask = BIT(0),
> -		.clk_mask = BIT(0),
>  	},
>  };
>
> --
> 2.52.0
>

