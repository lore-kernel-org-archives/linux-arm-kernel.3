Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB36C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrQKDDBOQ+lRIGCYZ3YG5hqHWDrckG8VFQj5CTlkLcA=; b=dDJxYAyavCMJ7f9o+fCSwIRMqC
	jPFKMPUl+c6usavzApTvlDm5o+Al+njV4Msfr0Jb+QWc6jPkxcfK+jMTSDTpmipT6ToGsw7/rLnT4
	o+P34gie4QHbzAkl0HFyZXJ23qewCODB+90y8h2nu08gJQAulO+mhGzRBYnUymtxgWQ1arMw1kAbK
	v3ucEEN4J7/Z4Cw4soFU+DqCS3EIviTfPkC/vAyNspFWKiB8hD26aGRp6m7R59UIZXB5o53BFRRCt
	6YpP6jarIocDmSDjyJKMcYH4sCVc9ubyl5PiGlU2AvoZuC6yXLOJ0H4kBqjhqlAk3mcZA6L8l8Tj9
	tTlVis7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtRr-00000003Ddv-1Thi;
	Thu, 09 Jul 2026 18:26:11 +0000
Received: from mail-southcentralusazon11012055.outbound.protection.outlook.com ([40.93.195.55] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtRo-00000003DdX-2mWb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTq9F7+kJMSIkxUsscD8T/tOqzm0XfvvfxvPSY/qPXt4gviU+JxkDv/0fFjur1zoyPAuGZf9cIGfx12nNBbdzC6PfgtQeu0uwCzORP5mQJzlYM5VFS3UAHxaIcC78UgRMFNyF7ocTce4MwqHKk3X96MDF7Z3corltxaXEOKclFRdhKXrBqYC6/GbX0bJzkwz8hrgAaL0u6rNTJSgJtoKNT9EIUgBrw2PH7k7wL1Bijep7heh+dxDszyKI28Rcg8sp1Rw0knLQYaARA8pZ3K+qnAMxc2+ud4TFl2sg+eTDUWm/beeJUnK3hau+4vB9Nf+KAGk5Y28ssgiEoA4We9ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrQKDDBOQ+lRIGCYZ3YG5hqHWDrckG8VFQj5CTlkLcA=;
 b=Q0mHAiRhwSm1AZWdfl02WbVbephxdlCCQ9M/peJWwivPLCaoYGdSOhvObtnyN8twHYCvHt+9uUiH060So1e+JFFr3fRX/ibGiTM3W+4cgEEA44kI0GKleTRe5h64l1r79N1DRkfxsSrL4Jbi+lgd5GboHjU4YTXGGDRhvmWa3b80x4HzrKuKGPxyWadxsVDlKUiChHv2QVhq2WF5NIH7hFCeYKwFtvm2oVMo5LNmScU5Mhz8hOudDckO8FJtadmKVnRscSzvpYkqi+qdqrEku9HCy4LKkDZS5u/4/wUdI7dPtKm8y0iIyzM0BMoP/JMK7ZQ0ROuLr3Py+uwRCpJa4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrQKDDBOQ+lRIGCYZ3YG5hqHWDrckG8VFQj5CTlkLcA=;
 b=kVorfW0iier0WC3Rld0lLcQcoo2m5kTNySHFVjowm54sXv4CLlh959tBtwI2oimoyS42iPV0A7++QLWxXwizX4AD3/pzv/dUvPbrkWJf4w6trG/k/VAd5ArzbldD+V81KHx2dT4dM39ez0Q3MDvg5v2c82M92E6L/kGaaxDQgbqkbE5OH1OCekaDfeidpcrvAG9HYIGvuXyuorGfyo6ya06ap7+A3JvCXsBU/GRqUXOiQSr1nPpAnM8RsOiCL5NgAWQ/qye0SWbsb8vOmofJiQE0g6RdeADqs+Y/oexxF/vZOhq3RNOZD+fbID8lVEl6FlMFQSd2Bm/kv4GKsh1i5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB8585.namprd12.prod.outlook.com (2603:10b6:208:451::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 18:26:00 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 18:26:00 +0000
Date: Thu, 9 Jul 2026 15:25:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 7/8] iommu/arm-smmu-v3: Change how the tlbi describes
 the invalidation
Message-ID: <20260709182559.GH422027@nvidia.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <7-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <ak3gPqsdg94TTDLJ@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak3gPqsdg94TTDLJ@Asurada-Nvidia>
X-ClientProxiedBy: BN9PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:408:f7::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f2c6db-5e4d-4fc5-6238-08dedde786f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8Q7fk9THwZhu8sADFc5JzUEsRs2PU59xp4mgg7b/oeUQbURvyP4je6cS3XExgxM6pI/ddrGLfkC0Rd1nZGD5DT9dl1Eph9rzecI93i4PGntPMkx6FDCLdrnklitos/8n07WmqvRxoITIUtiuVyO77qWTyYRNyjAj1E90JRgi+DnfwffLLQLC0+8yRh8TW3B2dPuByD1xzsotOsiwpQi8rciTBCIxMcsFep9Ki1aT9dy18/smp05KvMuXWdcrqrdQFlVAIFO+XlWrWkssSY2/09Sxm7vq4lLCuFZVjbMpy/PnHTfvaoUOYLyc82FqqVYnUAaKEcnNSZS2XQ5fDN2a2rhkNfhFpt7vM+4DTwhK8YQXfXG3uuVYM8+at3qKo7FaokYrcPUup1jk8yQf8YTNSOj4qqIqjERBlBcCdm7TQal9AdkcQYrXmusAxcUp4urBc3yUwN/EHfuQsqaDKIjlwNuqVHMlVJi8u0Xu8V7/aP8NNVg2iXsrIVE3WotMIYFa7PsmNthnRw49X9ZJH8iJKANz0OkfBmNtwKST9JCIpRhkO4Uphsu8V0TnHGJM4M/Fh0v53bLKHY1WrXy+aA8yNc/oMc2PpO/dAHuQ54aZBjuyfF6j75hM4ryQzo3AWd7F1AX2hU12s9w7AdrVRgUgIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fWyigdwwsiRvwm2V3Chbhud/QERNZUccmJqHev7ObjMMudsmk3r/nm96uDL9?=
 =?us-ascii?Q?avI0r8nDHngfTq4NelwGtjwhGXK8mJsgTi3fldRxscWOq/3fCZYAFjJ/oS5A?=
 =?us-ascii?Q?TCpTG86RNvfkNcVJ/1T9u6jjyVBTM1Vq8pDBr2K9ZHK56NkS6nU5WK0GmLTy?=
 =?us-ascii?Q?tUoDs3Zvj6ooI7Bj9tKcoEUiuYDo6V44mSCSpk1rm3fvOUei/Bc+VGDWKEUa?=
 =?us-ascii?Q?I8sasmy7x0MIxkyc3zOD39VnM2ickQeAmiSkiR4I2DwE6UYWufybWsZPsUwS?=
 =?us-ascii?Q?BJN/9gBboarEipsKBW+R9+N7dgN4jDrDfcsx4V5UO1djibyr5oVsKF1Iy2mv?=
 =?us-ascii?Q?aEJGfcu8MR1MYBbtH+R2FkwlniE9u3GtxOWsBlNIKLZXamWhp9yHRfaiaDxW?=
 =?us-ascii?Q?vqR/fqECsQrCzI0zLidZ3p+MaUlvaq7i5YJrgvjItWS0dSe8W4OXPZgqbJur?=
 =?us-ascii?Q?2Oqzgq0yaE8gVjqR6rZmMpTlz4YNcgYF0QhtgRVBoMDEvef9tF4E1N3CgAGk?=
 =?us-ascii?Q?iu/ryiLmdfR6kAll936+J18gy2QjBtnFeZqoYZ0UphOwKUdBAvMdTavs0Ypn?=
 =?us-ascii?Q?7H1k+ogUUsnIAY2oJW81ZOk3virhJUkPW4iNbFk7ylZsccrZljmw5mPPqANS?=
 =?us-ascii?Q?VSP605H79yKamO9t0lJTj6qf/opNy11d02BJGmuZR0bDmD9PLzhjc9D36CjU?=
 =?us-ascii?Q?8DZ4SNcLDTovU55HVU9hdDNCjHaMqxYOMKWLKhvegbZ27+htg+Ukt0sdAFB7?=
 =?us-ascii?Q?OeiV3aVsoyaBWqsKYRzVxrLUzVvLrq8zdbeAgIsQhq4zL0bjkTha+R2rAJQq?=
 =?us-ascii?Q?IQ+xnl8/nk465o75oE9oiumOkFsgW1aVwYTaUJN7Je/XRQkQjbEeXun7Sds5?=
 =?us-ascii?Q?mj3PIiVxDijxt6gzVxKCNCJ0hBHmynU3UHkm67fvgrAFKOT22ik00p0ryrEF?=
 =?us-ascii?Q?OcHV3M5o5Np55pnHOEneOFMmfLGytnntYQ0edL3HZL8nXAFO+Yu9CsoVXh3m?=
 =?us-ascii?Q?HFS8SDU0QPGzWjLdL77g8Y3ANS5raVE5F+ihDCov1GBwi5rJxxCWo36Un8Vo?=
 =?us-ascii?Q?HCRoXdhyftjtb4xEHkcpgjZpaQ6YXdPu9Az0Km6U/uLXf057E7FoC/Y3vXgs?=
 =?us-ascii?Q?ESjzl2yeVqGdGML75BUu7BI6TQjCw+yy13xyo3ORLdAf6Ty4XFefdlgHobbi?=
 =?us-ascii?Q?Fp8qhtKk92gTKzFcdewmeCNwdApodLzJa14bhync74/pWMRnGa58WEU9DUzx?=
 =?us-ascii?Q?g/JbtVia6uj4SYO2pN8wFjQZ8KnFRxAIwCm7eRThgVwWC9AyleehP96tzvjI?=
 =?us-ascii?Q?4I/zOJm9wlYUfK7kd3al0Vy1mWOtfHm5TzlA/gdy2BKfWfARB3UnGYvq9lK0?=
 =?us-ascii?Q?Qq9BREgs9O0neD415thAfaJeYnCnvjmeNZ4QkjHJAGwYxAf6w6dLh5dE0byU?=
 =?us-ascii?Q?SxLZij0HjoendhJBJNBR+PXTTpPdaIkopA9mluABM/LMVPPd30leXTrVHgpY?=
 =?us-ascii?Q?mpesnzo/6xUXl9E0vkzi0qKMljatLthXZxmgDUkzPeJXzGdUGNZsKoXzEcQl?=
 =?us-ascii?Q?QwtIDc9FiQoVNVDfwp07o6BgqbyOcnu4e8GZNyyFk2eOLrJkFc5CZcq+T2WC?=
 =?us-ascii?Q?LdDsnouzEmbKQhLsut4xFkyHjKyfyKAe95uehmT4u2vYCuc+A/EYiEzX+s+I?=
 =?us-ascii?Q?vigp0V9aP65BWn8ZpSq89mokZ5mLp/Rraje8Xq7hF4TjUXR3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f2c6db-5e4d-4fc5-6238-08dedde786f6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 18:26:00.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+NtkQjwD+c/ZzA+KF3jNpB7/jrY7BATv7bGO/IxFTEksL8BHAMeKI81X1z9Mw1t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8585
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_112608_718562_4C95029B 
X-CRM114-Status: GOOD (  20.69  )
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

On Tue, Jul 07, 2026 at 10:29:34PM -0700, Nicolin Chen wrote:

> > +/*
> > + * One TLBI command per stride-sized entry. Sets use_full_inv if too many
> 
> This is raised by Claude; not sure whether it is a false positive
> or not.

It is not right as written but there is something wrong here..

> This changes a previous per-pte invalidation to per-pmd one. Yet,
> the spec states in 4.4 TLB invalidation (last paragraph):
> 
>   To match a TLB entry, the least significant bits of the address
>   are ignored as needed, given the size of the entry.
> 
> So, the following scenario would likely miss leaf entries:
> 
> VFIO_IOMMU_UNMAP_DMA / IOMMU_IOAS_UNMAP
>   iommu_unmap(domain, iova=0x40000000, size=2M)
>     __iommu_unmap()
>       iommu_pgsize()  -> picks pgsize=2M (aligned, 2M in pgsize_bitmap;
>                          irrelevant that the region was mapped as 4K pages)
>       arm_lpae_unmap_pages(iova, 2M, pgcount=1, gather)
>         __arm_lpae_unmap(lvl=0) -> lvl=1 -> lvl=2:    size == BLOCK_SIZE(lvl 2)
>           pte = READ_ONCE(*ptep)         -> a TABLE descriptor, not a block
>           __arm_lpae_clear_pte()          # L2 descriptor := 0
>           io_pgtable_tlb_flush_walk(iova, 2M, granule=4K)
>             arm_smmu_tlb_inv_walk()
>               tlbi = { start=0x40000000, last=0x401fffff,
>                        table_levels_bitmap = BIT((ilog2(2M)-12)/9) = 0b010,
>                        leaf_levels_bitmap  = 0 }              <-- the false claim
>               arm_smmu_domain_tlbi()
>                 arm_smmu_tlbi_calc_single():
>                   calc_stride: __ffs(0b010) = 1 -> stride = 2M
>                   num_ops = 2M >> 21 = 1
>                 arm_smmu_domain_tlbi_inv()
>                   non-RIL entry: ONE TLBI_NH_VA @0x40000000, Leaf=0
>                     -> kills the walk entry + the 4K leaf at base
>                     -> 511 4K leaves SURVIVE
>           __arm_lpae_free_pgtable()       # subtree freed, no invalidation
>     iommu_iotlb_sync(domain, &gather)     # gather->pgsize == 0 -> returns immediately

This conclusion is wrong, gather->pgsize is never 0.

I wonder if this Claude was thinking about a kernel before
84b2baf427968c1 where this flow would have been as-described?

With the kernel today the arm_smmu_tlb_inv_walk() is supposed to clear
out the walk cache before freeing the table entry and the gather is
supposed to clear out the leaf entries themselves. 84b2baf427968c1
changed things so we always have a second leaf-only gather that covers
the entire unmap range, which also introduced the double invalidation.

What I missed is that because of that commit gather->pgsize is no
longer correct, it will be 2M even if __arm_lpae_free_pgtable()
unmapped 4k leaves. So we will still miss leaf invalidation :\

I'm going to add a patch to correct this in the io-pgtable-arm.c

> > +	 * If leaf_levels_bitmap is 0 then this is a walk cache only
> > +	 * invalidation.
> [...]
> > +	u8 leaf_levels_bitmap;
> 
> Or is that only to implement a walkcache-only invalidation, such
> that the leaf entries will have separate invalidation call(s)?

That was the plan

Thanks,
Jason

