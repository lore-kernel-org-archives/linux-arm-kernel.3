Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D85BD1118F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9Hi+OFs2XpI8oR4bnP02NGAib0a8lgsVmQfy3kplO0=; b=MVpa9sD6bAhe4prfZOx9Vj1PLT
	Vpmp7iEKwu7/zy52mdBnS6sQ8AmBLEAGzyFg128SQ3M5XqmDkvJ39GNloZSlT74rxv9rdnC1YHBQ3
	BgQiCUw/c8vB7zlIjeraZaunxjNBrhdlVzGqPSABJMaGhR4EREH4bR7DtR1Hd24GrU8vGgJU28BY3
	W3gVka/QsdXgaUxUOpISLiXt/NSk60HgA0kKW6tgJ0c+xPqlul7TGSIcGBu8BsBLB751wWyI0nCOM
	FXh+7SdsIIX5YWVd7r/6K6zCixV1kpTi4mRz3EN5QHQVR6NukMOckdyIVmC8RDeMgLy3HY7bvgN4m
	W9yMYW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKNu-0000000FVNQ-42Zc;
	Wed, 26 Nov 2025 18:36:58 +0000
Received: from mail-westus2azon11010071.outbound.protection.outlook.com ([52.101.46.71] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKNq-0000000FVMc-2wHL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:36:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+B6NcpMdiw1J0FyOt6/ht1lbsTE852I0ecpeTutrinbd6Biy7LE7tMjlY801LwmAa/I9xZoArCxHP8v3iwQOmA6PxmdxEMl1OD3RBXz3aUyPq/zCPAQxbc9HTEtvJSgw11zKwefHRVaERKzrUA9ZaKcunVx7OfakgLAIXAEetlUh+vOD35UdR6PsiF2wwN8T0/x0oSoxytN/aKwgzgerNBft0XNt12eVk35MJ1uXjs0L8twpry2+O3ucYouj8ZzBfQXmypTP5is8ioxqbAMqclq9uIONrWXKufKTvmYQQObXubmd0UVWXUO6QI6oLe1rtSF+CUGG3VW4UEZvqdF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9Hi+OFs2XpI8oR4bnP02NGAib0a8lgsVmQfy3kplO0=;
 b=jqBfY3JofSmv2YXbJX95UkPXJZWiR5mDxotx2/WBk+mWDHvqSP0T4zdASsxTBbF6SRR2nLwQxjbn7Gdj4qAciVNtca8npOAPer1zwjQ6WcNGaU99W9dd8DO1X4amdQUZZEPm5x49ElHPPUBq1tmC7nBhvdjAPtMmdGd/6zhrNaX9n/Eb7IMks1yXFsW0KSNTy0/8q/dONbgsro3vh/5qTQuuoG2JzTapO247QzorgfS03/qdECyOUbhDZ4tUbU4aSGDi8UKIXzISrVYj6vLDi7rBgpP+fjlIRuAe0lAQPhjXHPJYnEWckmDOwqWDpu2hqmbgMKQn/g5t/USDVdvXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Hi+OFs2XpI8oR4bnP02NGAib0a8lgsVmQfy3kplO0=;
 b=jRWmEDGF5j6xCFDvprJkP0xAbYKV+TpiVX5Z8965LTypKnUJHgFBo3yUme43YE3fqaNVjusP3T1/kROo+XjjY2XPw29DazSnA3PKS5bvrkexpflfPwv41rG/x+pX7GxIA1E2vwq5wQNhbfELcHm28DS1dJUsc03vGFlcUR5ofxDtLKzWDEP5pRAb9h5pReOSCgkswucQC+IEWTeJUwOjoXEXDSaca1DyHh6e02lWvHK1aZGhoiyufioqgxIrKITItOtawlMPknGHEKGfjb3ssQaVcm//9Ogd9HHhoqW5AYkoRU0oThWhjufjMLIuiOOsOc1+VvVwP1rCbzuswJrsEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 18:36:50 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9343.009; Wed, 26 Nov 2025
 18:36:50 +0000
Date: Wed, 26 Nov 2025 14:36:49 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/7] iommu/arm-smmu-v3: Pre-allocate a per-master
 invalidation array
Message-ID: <20251126183649.GM520526@nvidia.com>
References: <cover.1764119291.git.nicolinc@nvidia.com>
 <da24bfca47fec6886915c1707ca58eccf3cd4116.1764119291.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da24bfca47fec6886915c1707ca58eccf3cd4116.1764119291.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0041.namprd15.prod.outlook.com
 (2603:10b6:208:237::10) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: afc95a34-847d-439e-7b8f-08de2d1ac371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eN3/d7Uk4NyojgfI8oLtHaNkHl3XvIoc6aHxVM2WvSKwXWcvx0GTalM+yCBL?=
 =?us-ascii?Q?PWJ2sp5C/NsEp8ICOpHjvn8gC8rzkyUP8uAi11tWazyAZqF31ORWwPXJkBix?=
 =?us-ascii?Q?+OBqIfgs03p0HSvCUkNT86WMDpcLqqab5uem4lQYize1eYqpoRrQ3tNTznYW?=
 =?us-ascii?Q?ngUwUXzCNHkCE4ICwsLzV5S+M2DdlspiXPgU2y3P4FK/P5Y4rYY+ETD/yP8q?=
 =?us-ascii?Q?Tvhzc3UFsH5MrK3qSrVmv1rgwMHxZj2bSARNm4ppKP0gTGRAOlWadI3M/L00?=
 =?us-ascii?Q?aPJ7eoB+GCqhgJYtXvvZO+q+cv04GDQObbVBOzH02UCAhDZi26qLbJsZt82I?=
 =?us-ascii?Q?Os4lECF/bJZgI0clEcKHXtLgJYvZ5ezU0LozsiBVHKX75GZZSOPWMh5+8VFn?=
 =?us-ascii?Q?iepspJKT/5Gpb4Iz0vZm93kS3tTODcb78x8fGhmTjAj72m1hQPEm0MjckyC6?=
 =?us-ascii?Q?qDL038cXawg7zQvRTeUj+8tiPFKcUIIMQsnIqWcDGauGD15vpYEI3cCdHXof?=
 =?us-ascii?Q?mWE10eanZhf//o8q4mLukPrQsMYG3cEEoUMYXDuv7hyUaXMrYJxjyumtYviI?=
 =?us-ascii?Q?D9wE2nKBJxQgmwWGrQMeu9DVXah88GqfaQNn4qyUAu00qxlPGa75L3YSKn50?=
 =?us-ascii?Q?u3DXS0UQV6PswwIOgwioI2nFXQVO4ZL84yfCn1LuVE5W9EM99CSY7C6oz2o/?=
 =?us-ascii?Q?YyG28wXiNcwFtinsUf7F54l5pRsOmegcSfcUcwBSRm1lgpso486QDz3C5yt4?=
 =?us-ascii?Q?cNuBaRi0HG2UmkrPfTEn0gZnQ3lTNhiEgogOWtcUbexsoZgql+GmO3pejfVr?=
 =?us-ascii?Q?WWq4CfXxd7R4Z1V1SvXGInG6MYz1mPF9R5XFK43Yzh29sNRr4nLIVN6/auZg?=
 =?us-ascii?Q?q+DATC7v9zIBo9tlnObR6ZqYdxmZhU1CmUGIlsxFg0Qdbxm+unGG0KBhEB7u?=
 =?us-ascii?Q?6hgDx4bDLnaLeXq+hcQf6r8tQ3L//bZuo45v1WL47+cX9guv/WRLtfJsS+3a?=
 =?us-ascii?Q?bTP3IdQPYdirUCQYGm5RaE8WpFaMuYiYjYrMsrmFz/Ec/R/vniRlWNToKTNx?=
 =?us-ascii?Q?0aPKrc6uS/N6aPrpquEJVQ9gKi2D9WWsaoMqTzhhJy7ZLhXt8B9PGw2ueH5P?=
 =?us-ascii?Q?gu+7JlyFLkalj+fUqL/UGI1mMhXW4YCUDqN6ngLPYAfZ8xpI/ueknKODlmFB?=
 =?us-ascii?Q?Vkxecyjrd912Eb6b8V8p5QNQABl/1Qwl4ItBIO92ggobwNBpmjc0fhv8UjB6?=
 =?us-ascii?Q?NglkOjdey0i47o1dzHCd5MOqxlSTG/EnF0J9/AkhFn8kIg3jWKCtIxnuaqpd?=
 =?us-ascii?Q?Bb3axipPhTQhRRWJylTPTat2kC5PrZmY+fCxQTWN3Lke6d2fzRIFDqdzUXho?=
 =?us-ascii?Q?Mea65/359qbDfi8hLlQupdIklt6rM+LVZCCkcNA8azDcEfsfC9gB4mOc/N3X?=
 =?us-ascii?Q?r3KJofG0XtlJEvRWF++VgZSrws8EDYb0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xrjqtJh97qf2HRbFPKEa3eiwZPbRgqsrGhSmkAGP+mqYlVsbAYaJJd0wfkSq?=
 =?us-ascii?Q?98OFB+58zFkjmQd9qHrziFc3U9/HKQj11Lwj8NrQbX9YaILPmh7iJQtCYUhX?=
 =?us-ascii?Q?TdXPbZytNwa158nsufGKAy/Nfhj86GCIe0aLuajE/YNZWNBTvg5lH/foyexP?=
 =?us-ascii?Q?fZ59GOhdyooEieWcY+9h8WEXY4mAa8kmLwZJUEXThg/NX0u1elIkSmjddnrM?=
 =?us-ascii?Q?RtZnJPgU3HjmbbQL+qWamjJbVcTa15AlyLrEBAEN1NuQFTXxN4fWLktKzpyb?=
 =?us-ascii?Q?5XPCFtG1CQWKCBbEy2ouRa3a5nrOs6IHNg3QdnZ8JcWL0qVSLfJiadd69tIZ?=
 =?us-ascii?Q?VkBiXLsfwqgA7WEE8FTde1lRqqtJ7wMvQC4k3JOYKIsWv7X079IgVuc0PMFS?=
 =?us-ascii?Q?ANsWMQx7geIGggdAYuaNIJlvRHHKhZts+TixntC5aKvVeNCQql9IqdreNesS?=
 =?us-ascii?Q?Ld9CtJaZBVIAseEn3k6Pa03kpXv3TWVfXrTnEnOpb79oKqCVTyRuLzywSigr?=
 =?us-ascii?Q?wUcZnEDeA1ykcG0rKLW2XKQi/wpc9CAmP74xQzyuPxWMjLvz53y9Pd806tjl?=
 =?us-ascii?Q?aKQsATs8b3KSAvOLhX7+4cPI6FCu3zwIea+wJgo96NnJ0TEEwcNogUibSQ4j?=
 =?us-ascii?Q?XqTXuaP6MDoVu9XUmF12E2JzDzk2JaN/9utjz7e91JcdfjGOXBAgqcnB0eiH?=
 =?us-ascii?Q?1GpQABa6d2LKyxknwLgyPcbf8G8+iLXcdpxOfqeb2AhFhGvcfUe7koq7A3Oz?=
 =?us-ascii?Q?iZctIlwuHTR+pmR3XMz7T3ZHcnF9Nf7Mx3hDilJqeUt/SnTqqgceOzxA/1UZ?=
 =?us-ascii?Q?CM5jmaZ98ZBpGC7t1JltRj+I0YdYUqhNNhjWkxqAL8z1PhR7kSOfJO/6l88b?=
 =?us-ascii?Q?9y3huh+rglHqhf0C5yRC8RMUVoFGF16L3cZrXPDM4ok8U4ZskkuDr6Xg2nws?=
 =?us-ascii?Q?DESPCKjT/bzglJECfU56eD29TXwJjy9Tj8navXOXkGavu+DHJmWSs2DKLfxU?=
 =?us-ascii?Q?aODpVH9lB2Id9FDLGsCGup11Zz65vNiRE5Y3nvd6pgn7rseRlBmcuLhfNJ1G?=
 =?us-ascii?Q?i7mc3xFtt0GNjEGEoeVY9H7ssGjSvH+Ia41+w4rW1VbJ9cyBYmJwwa5F6muB?=
 =?us-ascii?Q?2oN4hQQXs/Sp34UFHCWV4oW/m7R3j7BP8ZxKnO2S301sJAwt64yhlbB0Ah+A?=
 =?us-ascii?Q?TeKPV2FgysIGQEFXYesOfzAduuVbpU5NmXXdvWoUE7knJtSE7BnxA7L03YIF?=
 =?us-ascii?Q?SnJDXH4aNvuCMvio0h2g3zele6GMDKdI24LO86XWbvdaDk3Fb/iptRXv5gfx?=
 =?us-ascii?Q?CuANQLKC2FEF/3JuqgAIHrMxAnHSMnR6QnzBZiALMoixSKWxe3QRYNXuo26Y?=
 =?us-ascii?Q?qFEigsaiO38vEhQqHJ0nksOY/i0VhB4OwN6IDAgFRUzZbdDFy1F3CF52A5mv?=
 =?us-ascii?Q?FgVRu/vctt5zpdiAALDwVe9L0i9MmtvYZ+aMXP1ebWIZeFtvnBqr3nH5vVSo?=
 =?us-ascii?Q?kJk6WlbtrnQpXYwYcUPMWO3MzaNalc+Dg3Vp+2CViCSt9L6gC5joLtxBjF7U?=
 =?us-ascii?Q?11GNT1TX+kWqF2OoOxk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc95a34-847d-439e-7b8f-08de2d1ac371
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 18:36:50.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Atb3LOcWaXP6xUBna86q+19KRY8vskYCC3SxdkigW4PSrCEaC/IkKARsCTcdU9Hv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_103654_748120_E6ACFE48 
X-CRM114-Status: GOOD (  16.05  )
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

On Tue, Nov 25, 2025 at 05:10:09PM -0800, Nicolin Chen wrote:
> When a master is attached from an old domain to a new domain, it needs to
> build an invalidation array to delete and add the array entries from/onto
> the invalidation arrays of those two domains, passed via the to_merge and
> to_unref arguments into arm_smmu_invs_merge/unref() respectively.
> 
> Since the master->num_streams might differ across masters, a memory would
> have to be allocated when building an to_merge/to_unref array which might
> fail with -ENOMEM.
> 
> On the other hand, an attachment to arm_smmu_blocked_domain must not fail
> so it's the best to avoid any memory allocation in that path.
> 
> Pre-allocate a fixed size invalidation array for every master. This array
> will be used as a scratch to fill dynamically when building a to_merge or
> to_unref invs array. Sort fwspec->ids in an ascending order to fit to the
> arm_smmu_invs_merge() function.
> 
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  8 ++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 41 +++++++++++++++++++--
>  2 files changed, 45 insertions(+), 4 deletions(-)

Looks good and addresses Will's remark

Jason

