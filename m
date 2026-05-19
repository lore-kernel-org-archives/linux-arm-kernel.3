Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131C6CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 17:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaPQvaCqsq9u64ih3VhKvG+i10w/T0yP9DU7IPUB6Rs=; b=4A2WuSJC4NhuZLOrF6tQMYXie4
	lpIcz9qf8fKNSNQd0cIKEDpvQG1FIgh9GuGE3IKhmlPhDW03tmZ3BvUPbeRFzNKYCM/knZFddQNJn
	jWKToV+x1B3Twqs+1R2p0wsG8aHhZ5zro0Aw9hn+/b5L+6PJ+u7qIhBCvYy/2vz98nqSbqRl8LhEk
	NrWJTZVVVjlaNjRO246NgQ+N63zr1habHK1d6NtUpA+nRH8xSRUzkgrpkkBHr782ARvHokj0qB8dI
	RbWloYRPmoMi3JJDAxz0Ke0Z2QaoXgXwSRATWye7xyPxbmnLqFIY+oURE4E7tLZYrLD2sIhSQc+l2
	y+/qH/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNxS-00000002LBE-1mNZ;
	Tue, 19 May 2026 17:10:18 +0000
Received: from mail-westus3azon11010062.outbound.protection.outlook.com ([52.101.201.62] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNxQ-00000002LAX-1DHa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 17:10:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItFg3oX9RBl68YdNQwXjKBGqa7fZk0cZacnE4vAV4JKHSJ8abc1ekyBBFAIjvsTxAdz/SDDbZTjDizODTYKgwHfHvJyafun8yeklCnVfacn1lVzbhsMvfysOGN/iRnldEaEoca6VJCdb5FDVi31tXgJIEnFTKhcAdTz9qiwlKbYNEH1w7Ftb9N3FfsGvFUHnOPU/IpEDmMTpIRadSME8SfaNyAwOHcKA/1xjTSl6JzcBeo/wKHUmL4wnp04Yb5kv6n0hb7tBboy8W61yMTLnbuvg2QrAHmN9eLgguGP2ZmSfnHH/zmIGnSOBT+PSrPbtz6O14+kCOSqQ+TRObdwRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaPQvaCqsq9u64ih3VhKvG+i10w/T0yP9DU7IPUB6Rs=;
 b=eHMm2nWwoOBCidOLutMWR0lActGI3TXq5mrFV6c479OP0VDpIgWrYs2325nWyKpWGgn2NiReATaxTWc+uY7eG8oxraL+f4T7XWPfIjJ9V5RZoWi/pEfVXaxIA8Z4N0LgOpE28t0VZhAvKXWeXVY3HkwtyUH3q+eYWl5GgZyJ83dW6NiRDvLiGoeGBankgMUMDxPBhLBCtuE5TRXwd0Bu9zYVvvEpB6CTBQgiTas5ew7y0XeFSPGDF65SKRR27pkCKclEmvhaiBkeizMEmzxTCJar5DA9V8HkhlEEHL0DPEFsvmE9pLmLZBJiZatZcS3MgIWavRlR48AJdqeiVC8zBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaPQvaCqsq9u64ih3VhKvG+i10w/T0yP9DU7IPUB6Rs=;
 b=MspDIVbgwNfInoRkuFilOKeXF9t7ib9Lb8tSEZPjfUHPcloI+cIRaKBDPcNjRcM22urX5s+1+k03c5i4yaJyMvlZwAM9YmdS+ao7bK75PCOhWas26etQ07NK4EK3dncYwwLW4TBoCj0aCGSNXOr2QBJlN9sWGN/wQShn8XRXBdDcTLi8J8qWnJYHYvPEaH1VAj9n0ibqVuT8Sz1sV+mH+5b1+TXUBob21/mmqSfJDK98syE9VpFU/7Ky26ViXQaD9IaUJ2xRw0JpIDlyx/nWfSxhA4lfTlLpDgJJ7P40GBSjEmdW/kg+EVTUvbahd6wFlJ7lCdB1MTu9wg444mAjVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DSWPR12MB999177.namprd12.prod.outlook.com (2603:10b6:8:36f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Tue, 19 May
 2026 17:10:05 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 17:10:04 +0000
Date: Tue, 19 May 2026 14:10:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, kevin.tian@intel.com,
	joro@8bytes.org, praan@google.com, kees@kernel.org,
	baolu.lu@linux.intel.com, miko.lenczewski@arm.com,
	smostafa@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH v5 1/6] iommu/arm-smmu-v3: Add
 arm_smmu_kdump_adopt_strtab() for kdump
Message-ID: <20260519171003.GD3602937@nvidia.com>
References: <cover.1778416609.git.nicolinc@nvidia.com>
 <0582326eeadd4ae2b16fd4914e9bd46da5a251d3.1778416609.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0582326eeadd4ae2b16fd4914e9bd46da5a251d3.1778416609.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT3PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DSWPR12MB999177:EE_
X-MS-Office365-Filtering-Correlation-Id: 396acd44-90c2-4f90-345d-08deb5c9782d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|4143699003|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 7qUdV+F3zqG1dmuIo5SH59LOm0KZiteaNYMIQq1rPFWsUrusXclXk3QkZKSzV2nd9KioqCAQY6esYki5+oHPnfwwNMq/XUnxR0K6q61kenw2dA0ZX2+txvuEKJ3tiQWYvzLysxezx5X7YGgZmfKSvfvwNFvRDfjc70b2kvxAWm9MbR3SDi3AvXZzHRNAjitgo9PtK7i2Pb4yUvTUDmZqp/B1/U+aggHGuqu/Cfg7f01V4HZPHjG5c/QLrb5OyuO0mHz9UIzoYVmrQmo++1rdT5xQDPZ9jYArLCANRtck/apqQbSJU75A1xWSNcjdRkogZpSWYD2ljPnSzGkoepLZzWoNPsejbqxN9klpjCwKrLjcPkAgpcwJtGT1vGsrB3SbOyBox2rNPNPtg7dutYyrQawXxZHxqmn7uWDh/533MXk/gJZb+kfSEDH+annJTE9ZtqJvIBjWR6/8UeCnKbcsHegqsDvypgSYDiGx9fsMjIs432XitFJoJ7tXNyNOe/3pO9kXPTLVuyw6lqNx5rZNA5OnjIN8pnsewNsIhobpfshKhnfXo/cOakL8JgRPBHpug9GO4Am41mTq8PpoT5d51zCmmlgwlE2h63eo5crtOcHlz4pE8e9zk4jpHNm4FsU2zXE02yGEdtmcpa+Qp+3re3gtDbWutC3ncYHECghEbbRocb0hXhbR+SipTVfaXz2Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(4143699003)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYPHyvFVO1GU4rvIedtCrj8JqrEAAeyTUAjvCbrMhhcFP6e2tkrK/1WSHH+b?=
 =?us-ascii?Q?hSyZeQIYlS03Eybvn1l72cCnWYV+HYCXphQ/xe6/xwYn5m9XBPzY4ocqR68C?=
 =?us-ascii?Q?UIgPBWspLjMiQqFAK3mpH//GaNoRbmF/nf0zk3+uU1rcnkTsbR0GJ/AxvAtT?=
 =?us-ascii?Q?aO27LfAFbc4JT+Gn6S9njkozX0vbm9fFjgVOhdx6pAyMvALE56eaf3Ps69Mf?=
 =?us-ascii?Q?OR9LIOSHfUwkE8x/7o/Qn1SEz6NVxaWml0ls5CIw9tcanIYVGp1LSinRSj4U?=
 =?us-ascii?Q?4Q2X4WMNeYCFXF13zDLvdHqVwwpWiNRXrbuERNpYCtgOk6rbcZsJyDJfN/3Y?=
 =?us-ascii?Q?pUh2RyN/rumnHdt/mkwcKrt3Wy4wy/UCtGdakgebFpTyzsrD6kjmpLhmbC7t?=
 =?us-ascii?Q?gZ6klzGrNDiB8HfeDbAhJIKaUsK1Vb2vv7OGBTA2NydXhTerIxiWmxNhrLOh?=
 =?us-ascii?Q?OrcBUhdowNCLpEI9nJRxjDh2K/6hWYdxq6ZpTEJLFp+6xXSxGHk+S7ha6v/w?=
 =?us-ascii?Q?XIuPI2zvBn62cOe8hsllSgW0ZINnQPByVzfIFwXZqlWRhtHU6svP7IKQoXEs?=
 =?us-ascii?Q?1HoTFTB3tT3eHHD2FjwZbawvNUv3DP1eGvdX1jl8fWfCRrEgpSLJYKq5BQUw?=
 =?us-ascii?Q?X4EkUmbNh+XmnvYMAa0vqHZU66j0EaV9+dY0HkbbWAybRrVDgQ385Geuvd5K?=
 =?us-ascii?Q?03aiyPiw01emADOVqGZm0dBfdDcziG+DnJ7IF2uM3bYycnJ3n2LA1ygnzwFT?=
 =?us-ascii?Q?C/RiAte9r0JiQo9tlBXQnPenSq1qVDGnj0d0dgGclHgZpkQdpTlsRQ9PfXuC?=
 =?us-ascii?Q?Go1x0lJxEl7uquS0XId/XW+22vLWVDTYi6h+rBtbLTR/oAgzg1u9EqfGDK1e?=
 =?us-ascii?Q?kevjOGVa0JlsAfMcqHcxT/c9JjlIRJ9Wc/8O74iXcmunhurnZgbLf+RF16iU?=
 =?us-ascii?Q?caUpS2wBIF9Og6Khgnh9SsAlhaR7b9m8e/GbDTHUO6EQUdb74wdyOLBKnReU?=
 =?us-ascii?Q?1sH8cEC9ls3W5w+aZVIt7vmFOcEQhsjWxuj/Mm0WeEtz/E9EfYqcFdGwc/s3?=
 =?us-ascii?Q?qV/d1l4oEoovTWtsgxoXVRDqfUbd6E33at5LyLnNk1IY9OAm/Biqdfp4BK2U?=
 =?us-ascii?Q?juLMPv0d1anKwuRnhMNCuy7pVgPsFHPtrdgPo+MFPAV7qvBCMw0S+tmfbVNr?=
 =?us-ascii?Q?U1tLIVIoetSz0QDrSQr6erVHJUHVaXp7gVpRGbQZbpBPDwkzm9InJcM/YyTM?=
 =?us-ascii?Q?ONBGyTBf2mqZsEP1ocFe4Yxj0pykF9zGB+4w5DgZimnJ42XmOaaQx28scPrN?=
 =?us-ascii?Q?rP2mPM3Zn0gc8QM7FjwvTQVWY8eW/amc5CVUL48N1YWeWnDfZgGGRszHdl11?=
 =?us-ascii?Q?RFd3Kg3pYhsZl5NM0w7XJe+lNXxCXR5f5Le4nz7Jivpwpp6KzSIKnnKr6V9Z?=
 =?us-ascii?Q?hJ+Fuju6jXHO79Nh5687Y7JY2A+0RBkMZFMpYkmMwG10mG/zLbp+oOAmOLDv?=
 =?us-ascii?Q?ESr3QG13tVpuK5VedJVMpXNxMPtlwkfvS59i5W8XR1hSgknB82qLI5lY0oN0?=
 =?us-ascii?Q?RNl541R9OimgS3/oTtIfTao/Hh4RbV8JYdPv+Aqg3EI1Dz645JgB75U218Wm?=
 =?us-ascii?Q?H1QkAgGPeeC/eBg+4A+4mXC6wjv1wnnr2A8aF8c72v8DCTaJQKyZszsZd+pW?=
 =?us-ascii?Q?EzXsu70CBUNl9YA75ZtmB0Yhq6a1FmHROdpWXFBIzP6Jrgta?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396acd44-90c2-4f90-345d-08deb5c9782d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 17:10:04.5988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmtPWMLgEqxv96WFIZX2PzpRB5+kNCNLjHIR2RGQYNSAl4/a7UYxS3D9N97jJg0Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_101016_347903_B45A93D7 
X-CRM114-Status: GOOD (  24.24  )
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

On Sun, May 10, 2026 at 02:23:00PM -0700, Nicolin Chen wrote:

> +#include <linux/dma-direct.h>

Nope, never do this, it is an internal header.

> +/*
> + * Adopting the crashed kernel's stream table has risks: the physical addresses
> + * read from ARM_SMMU_STRTAB_BASE / L1 descriptors may be corrupted. Reject any
> + * range that overlaps the kdump kernel's critical regions.
> + */
> +static bool arm_smmu_kdump_phys_is_corrupted(phys_addr_t base, size_t size)
> +{
> +	/*
> +	 * On arm64 kdump, iomem_resource entries are typically:
> +	 * ------------------------------------------------------------
> +	 * | Entry           | IORESOURCE_ Flags   | IORES_DESC_ Desc |
> +	 * ------------------------------------------------------------
> +	 * | System RAM      | MEM + BUSY + SYSRAM | NONE             |
> +	 * | MMIO regions    | MEM + BUSY          | NONE             |
> +	 * | Reserved memory | MEM                 | NONE             |
> +	 * ------------------------------------------------------------
> +	 *
> +	 * Test and reject any overlap with MEM + BUSY, covering/excluding:
> +	 *  + System RAM: silent corruption of kdump kernel's own memory
> +	 *  + MMIO regions: fatal SError on cacheable speculative access
> +	 *  - Reserved memory: crashed kernel's stream table might reside
> +	 */
> +	if (region_intersects(base, size, IORESOURCE_MEM | IORESOURCE_BUSY,
> +			      IORES_DESC_NONE) != REGION_DISJOINT)
> +		return true;
> +
> +	/*
> +	 * Note: physical holes are absent from iomem_resource, so a corrupted
> +	 * address pointing into one will not be caught here. Closing that gap
> +	 * requires a firmware memory map and is left as a future improvement.
> +	 */
> +	return false;
> +}

Something like this should not be in the smmu driver, this is some
core kdump code. I'd drop it, I don't see other drivers doing this?


> +static int arm_smmu_kdump_adopt_l2_strtab(struct arm_smmu_device *smmu, u32 sid,
> +					  u32 l1_idx, u64 l2_dma, u32 span,
> +					  struct arm_smmu_strtab_l2 **l2table)
> +{
> +	phys_addr_t base = dma_to_phys(smmu->dev, l2_dma);

The thing stored in the L2PTR is a *phys*, the HW doesn't support any
kind of translation. When using dma_alloc_coherent we never get a phys
so it uses the dma_addr_t and assumes it is == phys.

But on this flow this is *phys* and should remain phys. Never touch
dma_addr_t.


> +	struct arm_smmu_strtab_l2 *table;
> +	size_t size;
> +
> +	/*
> +	 * Only a coherent SMMU is supported at this moment. For a non-coherent
> +	 * SMMU that wants to support ARM_SMMU_OPT_KDUMP_ADOPT, try MEMREMAP_WC.
> +	 */
> +	if (WARN_ON(!(smmu->features & ARM_SMMU_FEAT_COHERENCY)))
> +		return -EOPNOTSUPP;
> +
> +	/*
> +	 * Retest the memremap inputs in case the L1 descriptor was overwritten
> +	 * since adopt. Reject this master's insert; panic or SMMU-disable would
> +	 * either lose the vmcore or cascade aborts. Do not try to fix it, as it
> +	 * would break all other SIDs in the same bus (PCI case). The corruption
> +	 * blast radius is already bounded to that bus range.
> +	 */
> +	if (span != STRTAB_SPLIT + 1) {
> +		dev_err(smmu->dev,
> +			"kdump: L1[%u] span %u changed since adopt (was %u)\n",
> +			l1_idx, span, STRTAB_SPLIT + 1);
> +		return -EINVAL;
> +	}

>  static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>  {
>  	dma_addr_t l2ptr_dma;
>  	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>  	struct arm_smmu_strtab_l2 **l2table;
> +	u32 l1_idx = arm_smmu_strtab_l1_idx(sid);
>  
> -	l2table = &cfg->l2.l2ptrs[arm_smmu_strtab_l1_idx(sid)];
> +	l2table = &cfg->l2.l2ptrs[l1_idx];
>  	if (*l2table)
>  		return 0;
>  
> +	/* Deferred adoption of the crashed kernel's L2 table */
> +	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT) {
> +		u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[l1_idx].l2ptr);
> +		dma_addr_t l2_dma = l2ptr & STRTAB_L1_DESC_L2PTR_MASK;

Like here, this should by phys_addr_t

> +static int arm_smmu_kdump_adopt_strtab_2lvl(struct arm_smmu_device *smmu,
> +					    u32 cfg_reg, dma_addr_t dma)

Same issues with dma_addr_t

> +static int arm_smmu_kdump_adopt_strtab_linear(struct arm_smmu_device *smmu,
> +					      u32 cfg_reg, dma_addr_t dma)
> +{

Same issues with dma_addr_t

> +static void arm_smmu_kdump_adopt_cleanup(struct arm_smmu_device *smmu, u32 fmt)
> +{
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +
> +	if (fmt == STRTAB_BASE_CFG_FMT_2LVL) {
> +		if (cfg->l2.l2ptrs)
> +			devm_kfree(smmu->dev, cfg->l2.l2ptrs);
> +		if (!IS_ERR_OR_NULL(cfg->l2.l1tab))
> +			devm_memunmap(smmu->dev, cfg->l2.l1tab);
> +	} else if (fmt == STRTAB_BASE_CFG_FMT_LINEAR) {
> +		if (!IS_ERR_OR_NULL(cfg->linear.table))
> +			devm_memunmap(smmu->dev, cfg->linear.table);
> +	}
> +}

If we have a cleanup function why is it using devm? Call the cleanup
function during remove too?

Jason

