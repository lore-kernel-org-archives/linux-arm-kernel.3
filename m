Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8169CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 01:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIS2x+bq9pcj+olZkiChg0mQEFPttPsMnDQ25KIuYgE=; b=dEAH6WAn1M90FXQvWHcsGQteB1
	TX3svSQofXjT87HUNBhT6tihITTjgdK9v6n3PGLNEte/O5x2jFR0hwr3ikgk/2pPPaYsfvkvmgZun
	oqKQM15yHcWH43shU0+Ess1r+vNl5bP2nn4ySWrkmQogiLCEZR4W9QfKbh4FumsbSYj6iuXadJbtO
	Q45iF5OIbr4WCHVEmHwgtWwsG+ZLp0UTAHeQqx31PpATPXMKOkL4bQTYRCjs0t9juduewCaV7u3Rx
	Gt4rOOq18877wq53aU0ftQVUFuNYUMl/hWY2UIoEh8BD7s1scJwYnws0crTis3kYS+qmN4GUVsaGY
	GuFrdLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXMO-00000001qRj-2V4n;
	Sat, 08 Nov 2025 01:03:20 +0000
Received: from mail-southcentralusazon11013020.outbound.protection.outlook.com ([40.93.196.20] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXML-00000001qQh-3yUm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 01:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUipVi+Q8cF/2pAd8ODDCfiq8eeC4rUNZDgpIvLcQpitlO0W6krO236aRwLue9Rc+a3d9CUhPXhB/w+igFBULRClhlg2Gb/HlpUBrxl3xxpeixG477hZf2PvjXve1f262vhLH+NDuvaxmxBvvRzZktm4hIJautYM3tKrQ3738j3lA8LFxQgs0OK+EJQl8X9hYog+xHMLrBefrHsQs8t4nZQnp6WKsykppi33y6jSnMPDBT9Y0N7qhSavkD7GmslCNEoP6N0nS7g2Ko1RgHBxjIuAA/DpMM34stzeAW8v9kXw/DNbrLIqq++QnBdoFdwnSTpUtn8CzEOSEAkGunWF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIS2x+bq9pcj+olZkiChg0mQEFPttPsMnDQ25KIuYgE=;
 b=xZC/1S9l7ZCASO4jqObWGJ80k8VCzXI7UlqR5keGlyLnMjxk6T9XIqWvd7Iu9ODehQzXFKLei7k7YT2zLSfJUD3LQfVovYRUn2fShsOGut/4mrF/Wk2P3hgcIN0WwGjtg5KOFvxsVmz1csk7R+oENS0o6Eu82PUHDJesJOoGPaNBEW86TIgqVli8cCOr6VwSGpkaoeNLVklrWUJ1u/4+cAKK2tBUWfTYipNcZti7Wjz3lec0gLE1OwklRjNFGpG1BMphhuo0Ry4ip/H8nqMm4hpPy4PClMOKq5U5YbBGO8PspRBu7gj2dL4sLfSXRuwFkBq1CzwmFnEfYjTqTf4mhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIS2x+bq9pcj+olZkiChg0mQEFPttPsMnDQ25KIuYgE=;
 b=GOxAR2aUqG9Xmfa3i+01xDp+iH9qsbcfhGIbsa53knGAxbamTuZv6gqGYzfufu7rCCPLAPNujvHKMpXFamS4r2LJAtUFZB9W4jNdqTymMg3OGEGbKi1y6KUu+ie1/J4pqFATUPHew9XFBgWb+11KBxZIKLcNt1HnXtvqwDas5GDRUn88CRmX63YpMt4yTHCbn7rObsw4snQso/9oExIKjEf2h8F2DhM9PHcxMJd993EaHm403V7e04bxJM8c/aRSdn/+QxqR7XLkEGanOxY8KYwh2TmIt7LRVmRx+YLE2UeWJ9Uw1caMRoCiJKPHYqeDir0evrcsHMxT4wT2m6PQ8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB8167.namprd12.prod.outlook.com (2603:10b6:a03:4e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 01:03:12 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.010; Sat, 8 Nov 2025
 01:03:12 +0000
Date: Fri, 7 Nov 2025 21:03:11 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] iommu/arm-smmu-v3: Perform per-domain
 invalidations using arm_smmu_invs
Message-ID: <20251108010311.GG1932966@nvidia.com>
References: <cover.1761590851.git.nicolinc@nvidia.com>
 <c81eb55d201db245e17e28854efe49feb61e69d7.1761590851.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c81eb55d201db245e17e28854efe49feb61e69d7.1761590851.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN0P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::16) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: ad72d49c-4c66-4bd9-8ff9-08de1e629741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZOs0BdTmoeG4+ICl+PIZ1XH2EVdYkKtOCx+yWV/onMdsrJUtsuKWDSaPK1EE?=
 =?us-ascii?Q?lPUZLmP+zGKIvgN23OocBACUfhvNUqIXfqyVGQo4dNUWmTVizqSlCvZ1TtI9?=
 =?us-ascii?Q?9nL3S1WcHW2jgbKdERHNyZp6Ahvc+xjOIGhMerQZ07K7tck4X+ZbnWM6MCQo?=
 =?us-ascii?Q?oCU0jgYoKg1Yp0vH6FmZQZrCm12/n0l7r8QhUaExBhIw/Db9IPI1whAe3Hal?=
 =?us-ascii?Q?GZByUG42PcGzPrf5Zsz2d2N47XFNkt6N7otvx1bvl7YdiPGtEgFbQU6Ub+74?=
 =?us-ascii?Q?Y6D3olv9qOBrw1Y4Bo2MgeWBk+kYVp0g4R45K30+X7jNqUg/lX01ryOD3NNj?=
 =?us-ascii?Q?7YZywLZBrBlqQeb3/EfHioJXj/CimKWrUNXKoF5puwonBectxu+P7xIlgItR?=
 =?us-ascii?Q?3XIqhAIrQJasfjVCfzviQ4qeHEnWfhpEwnsUxu4v2g2jxZ696eZ+FNyPnLoV?=
 =?us-ascii?Q?PsiBaZRQ2jFGZSPvjpLZb6zSAaDpWYxVQY7bEsPQgqS4G3KTPr0xMcwaQMhM?=
 =?us-ascii?Q?L5y0tvPbbxVu3ju2Y7sBGiP4S0VlGNXbuzBfUBadsY2fOKr7neOT05tWid0i?=
 =?us-ascii?Q?hQU00j8BP0JQanw01XRGaPLGdb95GgmI0MP9h6NObTZbeGcYFIaVCLEjCN8p?=
 =?us-ascii?Q?QqEhr4MMk3DX5MBcaa6cQlEoHSBFbQ1K5ePnMe6s+lQ3sJZWLfu49/6iHTAQ?=
 =?us-ascii?Q?oveS9ziZrwrX1lCbffr/7DfxcdFZU4ZwdfpiMWQd/50qVYpTvZNSfnZYP68u?=
 =?us-ascii?Q?B1/FtHAdiYfpwofBSMhfluBsrBRs7jBtsEShRrFXMigCLcFpDh9Nev+sGRHw?=
 =?us-ascii?Q?nK2oybl9hEvX1RaiaJ24fV0hVzOTZZzwytOTYb3ousP6h0fKHEzBaXxICkLc?=
 =?us-ascii?Q?x2HEnQhTQ2jd4U7P4ITdLCor8iC1eB5L2r8u+IaQlkcYKwkAQOUiEgiStUVU?=
 =?us-ascii?Q?kes1Y7swZsAoFwXyHB86+2aR+R9YTn6F0ReaTemqzp/VHghJey/dzinB0vVH?=
 =?us-ascii?Q?0RglNoloOWTexbTgSsMBprCfCZrtsn28h8n5TTtBTd+2NMfdkSH1eCO7RPsA?=
 =?us-ascii?Q?Jt6/Rr9n4Ggm0yczfXbArPnYPwrTWPe1gYRQwL9CwNhQS7H/B/OXJuR3GM0N?=
 =?us-ascii?Q?Lohge1UNfvgxDzm9PxP8d+7j0NdFU7GF9drwNJWKV31xPqyrBBVyyF+U65Tn?=
 =?us-ascii?Q?nYSG0D9e3qP4WbRZufH4ivDcgBliLV9d4WyEH3lI6SIjkuJq81Og3YWmZc3w?=
 =?us-ascii?Q?bkr3XtBMEPExIRYQUQ8xLZqRbJnKvMop/19fU1FYoI7XQSVNGFO1Pi1nUhKM?=
 =?us-ascii?Q?nrDKmzKGnvFobFk79PzqumeLathFuzVOxgXaMRjmMPIhio6vtSRuI8uWQVTh?=
 =?us-ascii?Q?SIK9ccqYhqjaGB/e2BpRZXnC/zubJ2k2IH2tW2VwqSnpbnf702VXAlQfzKSW?=
 =?us-ascii?Q?uHt91svu6jNAZifVv09vp2Go+pGgWBgl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DdgDjYC3qqZy4igLUadrP3ZvScD5VRa6bP0piBZzM5tHcCMnlSi09D1dfIxx?=
 =?us-ascii?Q?Bisz2imUoBwRCIVHLSCVfTbrmGyY64SBtP/lSpClH5U4uzwQfR6/7sGwxn68?=
 =?us-ascii?Q?BIm4ByMoozRpKJmcJ/8vfjwSEw/KEbqr/X7CfUDdKYxVJUsshYQGPQNHDnzG?=
 =?us-ascii?Q?5+onLFlAAYQ8ABRNM1g4RqSdherVo0WY9T1d0yKkDxtallSJejA/+KeXG6mf?=
 =?us-ascii?Q?VPWijx3qdIExCfAOggOSjlFJFmUjRUDwIl9w4xseP0B2m2eeY0poZdpJt5ik?=
 =?us-ascii?Q?FOHGkhscUjAyfaEmC/In/yC2zQNt8GXmUh1t9CBjwbTry9bJg4wWy6iNcTgF?=
 =?us-ascii?Q?V5lsCxvo4U54mO4Ujxq9k+bJZybYcVrzZ89BUaINoCqt27d2qujI+NwX8Kyd?=
 =?us-ascii?Q?Ksgze284Ub7ymO2tm2tOj5IEDjYEGW9yeQclSVJRrdBcLEHHGLFAZzBCZeks?=
 =?us-ascii?Q?KMBHDiUgHGZbe0Z/1Ex4sjPtzi4Mtjs/vUbPm8rRTEhteRUZXeKGnANJtHsC?=
 =?us-ascii?Q?7Cw6HRVIr1rN5fbgLFfikAaa+pGRnU0XUcCG7u2UvGAiV2OZI2qzdkGilfXV?=
 =?us-ascii?Q?+T1hllhqqKj9NGLL8l98kJopVr+7NnmsM1C2HfdkbRRiKRB7HTF2PVDkyxue?=
 =?us-ascii?Q?bDIF4DhKcIDnrJ1TLZDitu9LzucJg/kMz7TgHMrHJ4vNCUWprjF0uHhuxXFM?=
 =?us-ascii?Q?DrW/aftaSnJ9ntJpzXLsORaNEKBkOhlb5K/xMIe9oVIIV228xHOqrlucxW7p?=
 =?us-ascii?Q?E1L+xtCr2T8DvB9JqSCNMaymjIvooWc5KjQpfNztebwruEq0bHXe2ED0JCoy?=
 =?us-ascii?Q?Q9kbGxOiqwibAlNUDxWbwg0zSxwRpXeGoGcU4P99Grz+gz+BPwB0vWAcpOkN?=
 =?us-ascii?Q?nuuHf8LUMYUhsSRCNJeaUhoN5YEae34z7AxMP2bS0lgoVELaDSRZ5pRYDLg4?=
 =?us-ascii?Q?pUll1aWD22t3OXZtbjce0vMFqn960NdF4tUEUfkGE851mk3LE4Ub/C0AWIjg?=
 =?us-ascii?Q?bT2Xy3WyrkTWdUBxTvXH+2JCXRIrh0Qjz9sh+ACPyszsBTOPTHmJyAsK1Ml3?=
 =?us-ascii?Q?sj2AlShKsUAaAULAuxn36N+uzqz4jhdiDLU2coPey8YrHbV1OQqs2p2/nDXb?=
 =?us-ascii?Q?tUMM0oPDoOiP/Q6JeDTkceG6u4u3XYfVOU7uqLqTHYHKIG4132+JxHCYhnXr?=
 =?us-ascii?Q?TKrExqNBqnzrsifcvjWtZ0ln7I+zPDfXYFpWQYSPx7Y4p0qdbZglMX6jhFhC?=
 =?us-ascii?Q?v0WGexX8vz6AOuSSsDH5skrsvMmzOHbtUg9MFVN7c5vLukbiesu3a2+mBLq6?=
 =?us-ascii?Q?gt/ElR81lul8gWBmF88u82jywkpvJKUhSwMeAx0ojUttowriZtbUJ+46qMZL?=
 =?us-ascii?Q?3W0zTGhaHiHgOJLyu7lkYnnsxXIF6DTDSSwybZHd8577J+RrmIjQTLAEZBp9?=
 =?us-ascii?Q?FF9JIGKkyz++KHUpy1xkxaI8qnQi4rdA/GVsg3KaJ2HV1H3dKmu/OF7BE7W+?=
 =?us-ascii?Q?V+YOE/APS+WoDxJ+93694DrvPm3Emq4qDeNb6g0JTdwYjMbB1jxNBIPJ63GS?=
 =?us-ascii?Q?d/nLcO2O57VcQNoLTkM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad72d49c-4c66-4bd9-8ff9-08de1e629741
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 01:03:12.7650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUFqe9d2+tMkVtI7SZh730623layjyQ8etA6AL4d1Ya1kt2+GGK1sNpzbdjIhxV2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_170317_988656_76135E1C 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, Oct 27, 2025 at 11:54:21AM -0700, Nicolin Chen wrote:
> Replace the old invalidation functions with arm_smmu_domain_inv_range() in
> all the existing invalidation routines. And deprecate the old functions.
> 
> The new arm_smmu_domain_inv_range() handles the CMDQ_MAX_TLBI_OPS as well,
> so drop it in the SVA function.
> 
> Since arm_smmu_cmdq_batch_add_range() has only one caller now, and it must
> be given a valid size, add a WARN_ON_ONCE to catch any missed case.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   7 -
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  29 +--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 165 +-----------------
>  3 files changed, 11 insertions(+), 190 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

