Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64647C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U8HfKTxdrDQ2abZKZ53FJ4c12UrtfF1dJUG/0FbAho=; b=3mmkVCM1kzs5cXFQKh1CvShpYk
	udOfDvxmqHi0Pq0Fqu/1P4BvtIS1GOv2f9KQt88Ai9RMNQEWDJ5MiwYq30D5n1ZDWEjXOPnhSzCt2
	/F1XoHgJrkeFZVhbG0ULcKvw/njutNW+cHVmvKdOVNZTW+Sso3N/ygpwu8mTvhQJip6cIr0aXEXJR
	IywpkYD3LJV1cvrB6IaObaEgb4WOI2TjiVWmL08w1G+AKuC6r8W8w2/Vjj0nh9Hx4Y+Os6wI7m1ed
	EE0a0YN7OlzqUbFUnFQ7TH/ePOwqpEnGwwYxWVCpVY7jqJc7Y3hdeMgE41P5zhjvpibWGchO00jye
	PbVCTM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChQB-0000000G7dN-3oGj;
	Wed, 07 May 2025 16:14:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgs6-0000000G0J2-3OX3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:39:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07344339;
	Wed,  7 May 2025 08:39:36 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76EA33F58B;
	Wed,  7 May 2025 08:39:44 -0700 (PDT)
Message-ID: <0c5ce93a-c5ff-4b09-bde4-196da505cda2@arm.com>
Date: Wed, 7 May 2025 16:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507142953.269300-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250507142953.269300-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_083946_993156_4F1FC864 
X-CRM114-Status: GOOD (  30.96  )
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

On 07/05/2025 3:29 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping sequence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.
> 
> Now that there is a quirk, we can also drop the selftest_running
> flag, and use the quirk instead for selftests.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Sending v2 stand-alone, since I'm not quite ready to send a new
> iteration of the full VM_BIND series.  And with selftest_running
> removed, I think this patch stands on it's own.  (And maybe there
> is still time to sneak this in for v6.16, removing an iommu dep
> for the VM_BIND series in v6.17?)
> 
> v2: Drop selftest_running and use IO_PGTABLE_QUIRK_NO_WARN_ON for
>      the selftests
> 
>   drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
>   include/linux/io-pgtable.h     |  8 ++++++++
>   2 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index f27965caf6a1..a535d88f8943 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -253,8 +253,6 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
>   	       (data->start_level == 1) && (oas == 40);
>   }
>   
> -static bool selftest_running = false;
> -
>   static dma_addr_t __arm_lpae_dma_addr(void *pages)
>   {
>   	return (dma_addr_t)virt_to_phys(pages);
> @@ -373,7 +371,7 @@ static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
>   	for (i = 0; i < num_entries; i++)
>   		if (iopte_leaf(ptep[i], lvl, data->iop.fmt)) {
>   			/* We require an unmap first */
> -			WARN_ON(!selftest_running);
> +			WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
>   			return -EEXIST;
>   		} else if (iopte_type(ptep[i]) == ARM_LPAE_PTE_TYPE_TABLE) {
>   			/*
> @@ -475,7 +473,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>   		cptep = iopte_deref(pte, data);
>   	} else if (pte) {
>   		/* We require an unmap first */
> -		WARN_ON(!selftest_running);
> +		WARN_ON(!(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
>   		return -EEXIST;
>   	}
>   
> @@ -649,8 +647,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
>   	ptep += unmap_idx_start;
>   	pte = READ_ONCE(*ptep);
> -	if (WARN_ON(!pte))
> -		return 0;
> +	if (!pte) {
> +		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
> +		return -ENOENT;
> +	}
>   
>   	/* If the size matches this level, we're in the right place */
>   	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
> @@ -660,8 +660,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   		/* Find and handle non-leaf entries */
>   		for (i = 0; i < num_entries; i++) {
>   			pte = READ_ONCE(ptep[i]);
> -			if (WARN_ON(!pte))
> +			if (!pte) {
> +				WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
>   				break;
> +			}
>   
>   			if (!iopte_leaf(pte, lvl, iop->fmt)) {
>   				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
> @@ -976,7 +978,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>   	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>   			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
>   			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
> -			    IO_PGTABLE_QUIRK_ARM_HD))
> +			    IO_PGTABLE_QUIRK_ARM_HD |
> +			    IO_PGTABLE_QUIRK_NO_WARN_ON))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> @@ -1079,7 +1082,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
>   	struct arm_lpae_io_pgtable *data;
>   	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
>   
> -	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
> +	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
> +			    IO_PGTABLE_QUIRK_NO_WARN_ON))
>   		return NULL;
>   
>   	data = arm_lpae_alloc_pgtable(cfg);
> @@ -1320,7 +1324,6 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
>   #define __FAIL(ops, i)	({						\
>   		WARN(1, "selftest: test failed for fmt idx %d\n", (i));	\
>   		arm_lpae_dump_ops(ops);					\
> -		selftest_running = false;				\
>   		-EFAULT;						\
>   })
>   
> @@ -1336,8 +1339,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   	size_t size, mapped;
>   	struct io_pgtable_ops *ops;
>   
> -	selftest_running = true;
> -
>   	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
>   		cfg_cookie = cfg;
>   		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> @@ -1426,7 +1427,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   		free_io_pgtable_ops(ops);
>   	}
>   
> -	selftest_running = false;
>   	return 0;
>   }
>   
> @@ -1448,6 +1448,7 @@ static int __init arm_lpae_do_selftests(void)
>   		.tlb = &dummy_tlb_ops,
>   		.coherent_walk = true,
>   		.iommu_dev = &dev,
> +		.quirks = IO_PGTABLE_QUIRK_NO_WARN_ON,
>   	};
>   
>   	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index bba2a51c87d2..639b8f4fb87d 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
>   	 *
>   	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
>   	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
> +	 *
> +	 * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> +	 *	mappings, but silently return -EEXISTS.  Normally an attempt
> +	 *	to map over an existing mapping would indicate some sort of
> +	 *	kernel bug, which would justify the WARN_ON().  But for GPU
> +	 *	drivers, this could be under control of userspace.  Which
> +	 *	deserves an error return, but not to spam dmesg.
>   	 */
>   	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
>   	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
> @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
>   	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
>   	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
>   	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
> +	#define IO_PGTABLE_QUIRK_NO_WARN_ON		BIT(9)
>   	unsigned long			quirks;
>   	unsigned long			pgsize_bitmap;
>   	unsigned int			ias;

