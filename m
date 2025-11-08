Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5610CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 00:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yN3nHjEs7JnMi1jXwgEXtKPFwqpYqkSTY3HIKkGExHo=; b=qbN8Ntr7ZNaeUrVBAub07DtZfu
	Z45J4lXLRAy0di/2VZigo3+MzcWfMp0v3ZQALI5jcCj2CulTMB3h2vQn2bBS8a0HPu+yaSeZgZsPr
	kLXyV+EMojKjTh6SpnZmDFIg3TuoqXMC0OJC936N81WZ34ATKFmEJTyFa0p3gblPzzWPOXgANJBc2
	7kShbcqwUxp3hJBufsZWgpIXLvtLAm1aWdWeN7tGUYgDSHZpxbYhCrF7c3RTHTDmV6+7hWMFpX7WA
	UvHKzRw83pym6cVZi+BPcfDiqIJyiY0X/cWjaVpR7Qr7CSPKEbAWSGaoG6Y1ziTikFH19YnnoP5PS
	X5eaTYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXAi-00000001nv4-04ZL;
	Sat, 08 Nov 2025 00:51:16 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHXAZ-00000001nsg-3qlf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 00:51:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFF9LySgQHZPPpz1oCbovzkTGz1HlIKVgrQSJbAAhkotV2mr2oZjG67OIFArxKtI3RpWggfPTDcIi2x0UoQs1IxXgM2oUqjJ8uyfUhTgrh5nZPE4HhrLIEomyYsBDZoEHcvnuKDV3FpC96hNwWHhnw5H1oOHPIHe/Q+bzKmYchY1JWMkRSdkFl8blk4k68RPEToq0me0OZRuPvM+etz+gE8tAVKKk9PF6snS408wN5iX8r4kd9xty190eq3wKHzOI0bMcJJFY+QKd8sIjPmWUU7j2VLT8xTWQKO3m1PSc4gJ+Kg5cwBVHL26IqCvyf8fvLg5GcNvP1t40+Jn8Tn7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN3nHjEs7JnMi1jXwgEXtKPFwqpYqkSTY3HIKkGExHo=;
 b=aJjNim78fafPwxeXqya9HV57Au+XK+A5rmMybDAVsa1+5Rn/MwPaaKAzTbSCZiefQy0jbFJ9UAY8vVsD5sciM8cz0MKncj+2889/NamVx3JEfv/LOMH+9lcw80lL4UEBgNA/R/obcMBPu+3zo09thMIDz5VO6qhsdR+4VPrhyCvGL8jGvm6dnJrNyjDjXNI4918gyngVBKPHgQxf9m70szmB3ROomWRSSfLWIwAIeNzQ/Ych4wuyS6KI7kJQcPCNHxpO/Eo9lY9WStYEeLXLafy9CCp9us0NGgN3byivp2WQtsp/FlgZH5l/EY40LlZ0A+kGhe8lSRg464Aa7xIkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN3nHjEs7JnMi1jXwgEXtKPFwqpYqkSTY3HIKkGExHo=;
 b=k/CA1cAEeWaqucDGZPuHLTkPaBZ67nJu9g7UnAAqGJvw1mGoapEGvJv7hLT3PJaR5YUTlrEbbpSoqMywFQTCP5N4BORCuSC/2Ume73o1bbgRBoUyExCj5RfwiFnd9PRXxfSL13ilmIjesGdP6j5hNwqJKdb5Nxv6RJB8EUlWDSnvUCDdTGIkRz9PY1PAKIU4coKSRI7DcOrUIoiv4BbmZFroAEWt7q1J4LAJGgLX55GLz+optIXO6iYoK56SDABiJ45klzss+JFi5oGh/pfDe762hm59WaYnt5Na9taZJaX/2uzsm5+6q6R9R68vwhEgs3rWvCt1fgVz6Yd17vC70A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN1SPR01MB0019.namprd12.prod.outlook.com (2603:10b6:802:23::32)
 by SJ0PR12MB6733.namprd12.prod.outlook.com (2603:10b6:a03:477::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Sat, 8 Nov
 2025 00:50:59 +0000
Received: from SN1SPR01MB0019.namprd12.prod.outlook.com
 ([fe80::8d14:5845:8725:4978]) by SN1SPR01MB0019.namprd12.prod.outlook.com
 ([fe80::8d14:5845:8725:4978%7]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 00:50:59 +0000
Date: Fri, 7 Nov 2025 20:50:57 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <20251108005057.GE1932966@nvidia.com>
References: <cover.1761590851.git.nicolinc@nvidia.com>
 <5f229859b5d252b703be8f1229d73903a566e8d8.1761590851.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f229859b5d252b703be8f1229d73903a566e8d8.1761590851.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0413.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::28) To SN1SPR01MB0019.namprd12.prod.outlook.com
 (2603:10b6:802:23::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1SPR01MB0019:EE_|SJ0PR12MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e65748-0e93-4808-acaa-08de1e60e1cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|3613699012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cg4+Awkyt/oS3yuFKmNzykuDuq/JU9Cd6nTMsdlRGsiF9Q27al/BHVMGfxG6?=
 =?us-ascii?Q?xhuSYcnOCyK3hU32pAsbbL2rAgLHOsS2XkSa2Z9io8I38jGKiJ8wh5THVIFb?=
 =?us-ascii?Q?XZigOCOEwZJg6lRr1nmAsZgiUVwZMREr8Nnkt0WjjeHEI1qYUpxGw+WP8hsq?=
 =?us-ascii?Q?1CJjH0WgOXPFzLpdjodjl3GFL1FueWmBNGwuoiNfMwx2AvKU3zrupjHCCDTE?=
 =?us-ascii?Q?VSYlLedpfLgz7B62fqvVRdBNGzL5nYAAUV4OSSmryGsH9S9uyjFZA6Vq5bUY?=
 =?us-ascii?Q?9XkyhW/ak+T9rbaznx1lN1cMDB6t/u6esopIQDBZzt1v3FVxuCOEOjBbSMAl?=
 =?us-ascii?Q?d3zsqw7vRxsjNpX+x6erRznregUn3V6PIOMjrUsAZloZkr3vZDKJhkmFZE+v?=
 =?us-ascii?Q?pB5jvxDhedRRMdFzTYQJEp4/Ipqc/kmGQokCUIfxH4OBRMjT8IQXDm6jjdHh?=
 =?us-ascii?Q?r9TWLTJXeM5JCN5Ik8iW+J9QuKgevcDQQNJha1lUXknpAMjQ2sLrJ6fTK1Im?=
 =?us-ascii?Q?Em9YRnzO+VpKumpWxjEqb3/2VGU9LDgCPXS0Yrmg85yLHS71V+d7fZUHht96?=
 =?us-ascii?Q?M14eAmiO+syPOXDF4IZAWVvwVtnQdBeabiMR55bbtKbR18RDJnCfT+TvpzE3?=
 =?us-ascii?Q?YVufG0esJBLuv7hdlfDvWxIGXOzHhnbHQXvSA6q/UHF6xLLmOYHW2OLcY1GD?=
 =?us-ascii?Q?haByqffypLJhW9LFl6m47gnYXJd9j0HtomzJ6zcwkdNg6C89Timq8AafqQto?=
 =?us-ascii?Q?k4z0jhR11r5AFIrkfhgJc2pjMC0K4c/CqAGuj+1HcizPYVsF3ayQIn+3fVs1?=
 =?us-ascii?Q?1aoG4iL+eZmMRYfoBn2UPnE12p39vyYBywWdg3TGn2SnSRJwvjW4+Mfojy12?=
 =?us-ascii?Q?v2pDkA1jWEF8+3Ow2Lj3GQ+HrA2wr353D8MtBuHle5rta3zTyVvRkdBiJaeJ?=
 =?us-ascii?Q?n5MNoFT9zizqWq/MuA4ulreUkjfwxyZSN9Z/7ISkMUCj2hPUNLQlLyyJWEB4?=
 =?us-ascii?Q?qri9aIffkB3bgmidPCVT7yjayLFI0HAqcgQhBVugXeqIZt/rm+qy4tM3kK5M?=
 =?us-ascii?Q?zOYKzFg73TjrPqbr0a2s0tywCb4yEO18NqVlZhJh8ghpYKNin6JF8CqFpVIT?=
 =?us-ascii?Q?uQyoqAoaG4k/djCcYOBHKinuVZJQ/UzdjmMAZsH9gED+5Qy3S74L0IYob/wh?=
 =?us-ascii?Q?tG7E/1G1Zl4Et0Y122aafLXpvtLwL+9ZP/l2prF/VThINJ628O4dYtEZWvnR?=
 =?us-ascii?Q?gojMaQnK7eR1oTav1z6zKfstaKu0hr5pDyCXQmBxFucpBMy4THGPv0StbO0A?=
 =?us-ascii?Q?rMaTSs76XhKziowfCdM4khcpWo7HSOVn1ZLOm0yy3XdDtvwd03YISiBwQTx1?=
 =?us-ascii?Q?wwgmN+QIe+yxknJskjs6EIN2p5nVXGkQO3pHBLTOsMMAZZfXXv1hXFUK/T0p?=
 =?us-ascii?Q?M2yMmaI7dRPOPB2+lU1ZVLFHm/6JGDeTUshGL5YppvHTL0/QorXaf3fFPeVK?=
 =?us-ascii?Q?mxlLTw23NaugNRO2kY8hFVz5x4Um+xz65RbF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1SPR01MB0019.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uKnxeY9zDrJIPzu11qyMoo6ZesEVlqH6Z9QDRjlbG9Z7TethRAjyGFaB5hSQ?=
 =?us-ascii?Q?5iQCjmsmULAREdYKO1bGLRK2pKcuh8Equ+VXmL51WJM/jmS3vkfQnTWm/aQ+?=
 =?us-ascii?Q?+HOMbBu1mufoLJ4UL5Bv+VB/r3EFwrVZ60AOgEByuPWVReWMU7n29Cm3/oq/?=
 =?us-ascii?Q?X7n+a7I1xVqfrxhhrUs53XsRn2mgaSPzVxsKaYzW9mluDCSwsYjt9tUPEL5g?=
 =?us-ascii?Q?V0lNH0juYXxNoPL+TL63uIrw5gF38JUJyaogk+JlX3oTV4C/+w9DpOAbru3K?=
 =?us-ascii?Q?9L3xgjnocPq39J7qAVzIVSsRCQLA6UetJp8gcBbgdwNkvvYxFb4xiyy9E7h5?=
 =?us-ascii?Q?BnxGkjRKD42Y6k0YZEiOW9yrveGX2KTsR4dVUmBrDk+0c4dobmg+EP0Ut0W8?=
 =?us-ascii?Q?0BQNDwAZ9nNTUVntQQNJykvmXo69hWRWoLlxrVcplj7H4jCBwxP2joKBe/Av?=
 =?us-ascii?Q?fwp64C1+slRdneLg1v8BnrPaL9WFrtDn1v3o4cwiEZzDAgEIjL+ojpCWyy9R?=
 =?us-ascii?Q?mM2CmQbcHTD0Jl/qpxxIz0JBEb+8U5LyxDjsb0NGSEmqswnKPl3t1eSkmFpQ?=
 =?us-ascii?Q?JX70zog4Chd4ixmQfASxPn8Das+AuQvmAjo9aHYCPoOnv+g39VD/iHI02+RC?=
 =?us-ascii?Q?wfMgE/a7KsL98tpw5ta0/6PeGk0J6iSv88P+VumJvqQ/0vT44ozW1l6ng1Bx?=
 =?us-ascii?Q?+O0qX1p5Fz6LREq4z18jPuSy0jdUgPopiPSR21oQ0pltPSxko/CU2bctgIFG?=
 =?us-ascii?Q?RS4ZpQ1usEfzZZCxgSUzbd+Y9zfb06dwkZr6y/RRKz6hEQroGB62NeSzyxIw?=
 =?us-ascii?Q?m9TNV9tMuFjd5xj/BMgdKjboPibugTEgblUtnJ28veUnSG/jO/8JXPY0QMTq?=
 =?us-ascii?Q?rnH6MbAtJabnUEJFGCyLHT06Kt43NHecJ4lZjJpkoMULLljkpMPK8R1e+6lD?=
 =?us-ascii?Q?ht96q1j/N+UyqoRmULEb5oFsSJbl+WUe3XGXSeYIcEuhXxFmq9vpc4XI0cY2?=
 =?us-ascii?Q?Sk7bs1WGi0UkJvbtqKijb065WZKTjskVvxM7ceDB7d1idB7OkORQ1u3+l7/v?=
 =?us-ascii?Q?3YRibogVKlydKSOzqinckN1zlliZgE3aXmsb2ossZKh1PR8c29PFJMaWKiKc?=
 =?us-ascii?Q?lYBqh8ieCVKt1dcJWiOn5GLkK3TkypI6Vly2ACAOp6OhFGtorfr+5EpdFk+v?=
 =?us-ascii?Q?xF8s9lLRaDb1fIeZEv3plBh7M34xm3Sfvih2NsdpWmU7wD5a/gnDT5L+Ckzc?=
 =?us-ascii?Q?Ez8fHRFkgEE3JREAlortEHX94897hHI0EdF1DIXAS7WmFZyBtJmYCIpCqmtr?=
 =?us-ascii?Q?MdrD3hksyKItayszcRHc7gOAr9wo+kN07ACQjHotowlQzPGqlbZRmlz/1V5B?=
 =?us-ascii?Q?avpyZMjJQ31BUF1mqk1scdgnTb1n4y5GReao2inx+j3mhRVKlOeXErYoZlhs?=
 =?us-ascii?Q?8SgnHZ4Yj8Mxv8Fon91tiYpv62mja4/qlQA695DmTWDGMucBw+8KWMaU7XL1?=
 =?us-ascii?Q?BMgFxSRv493s0WaKSBIVpaAyYu2uOFg1jYwVH32k61cW5u31wcY3wnDjLtJ/?=
 =?us-ascii?Q?bwgnqU3cmo226Dw1Zlg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e65748-0e93-4808-acaa-08de1e60e1cd
X-MS-Exchange-CrossTenant-AuthSource: SN1SPR01MB0019.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 00:50:59.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCJfVrK+WTX/YXBsjsWN31doqZfVpUZTl0xOYnT3yLcg90c0YQeJn/pnLOK5INZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_165107_960951_3FA23D42 
X-CRM114-Status: GOOD (  16.52  )
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

On Mon, Oct 27, 2025 at 11:54:20AM -0700, Nicolin Chen wrote:
> Each smmu_domain now has an arm_smmu_invs that specifies the invalidation
> steps to perform after any change the IOPTEs. This includes supports for
> basic ASID/VMID, the special case for nesting, and ATC invalidations.
> 
> Introduce a new arm_smmu_domain_inv helper iterating smmu_domain->invs to
> convert the invalidation array to commands. Any invalidation request with
> no size specified means an entire flush over a range based one.
> 
> Take advantage of the sorted array to compatible batch operations together
> to the same SMMU. For instance, ATC invaliations for multiple SIDs can be
> pushed as a batch.
> 
> ATC invalidations must be completed before the driver disables ATS. Or the
> device is permitted to ignore any racing invalidation that would cause an
> SMMU timeout. The sequencing is done with a rwlock where holding the write
> side of the rwlock means that there are no outstanding ATC invalidations.
> If ATS is not used the rwlock is ignored, similar to the existing code.
> 
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   9 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 225 ++++++++++++++++++--
>  2 files changed, 221 insertions(+), 13 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

