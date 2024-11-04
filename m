Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D838D1BDEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD3Ng4/3zCkECQlB7IvApP4kLphmF9qv5hvzXTqloDs=; b=cWgCUuMeKri79QMaynIIkMm8zC
	uj4KVXBmISIj6/0YJu5E827/zrH+In9MJq4Oyz2TXcs28/7zPLTB1Xtqfe4AalTHAb+fGDM2pxZwo
	d0YnLG9rDBgJdhh4DTqsown8couRZbdXG+dlhYbF52o7ttsTnu+0yTrdqvhgz7pf0VuweSXNduY0l
	di2MflDM+4r2pTynBiibqb5hCxqsillqf5zOsuT//sPMZSL+JSun3QkPjue2rmhipKWXjyraK/9JZ
	il+KQneOf0oy0HLT+t0kHU20q4ecIQtBhMe/y3nfTJimcxg3n4mjPpVjJsdSOKvY0siyEsfveotgY
	xqxIAZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t83Ap-0000000Exdx-3FK6;
	Mon, 04 Nov 2024 19:55:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8396-0000000ExKX-1uWG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:53:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90044FEC;
	Mon,  4 Nov 2024 11:54:20 -0800 (PST)
Received: from [10.57.88.110] (unknown [10.57.88.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 805503F66E;
	Mon,  4 Nov 2024 11:53:48 -0800 (PST)
Message-ID: <cf17dc41-f72a-4d90-a78d-2d90fa0ac243@arm.com>
Date: Mon, 4 Nov 2024 19:53:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap
 behavior
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
References: <2-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <2-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_115352_640034_E954634D 
X-CRM114-Status: GOOD (  33.79  )
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

On 2024-11-04 5:41 pm, Jason Gunthorpe wrote:
> A minority of page table implementations (arm_lpae, armv7) are unique in
> how they handle partial unmap of large IOPTEs.
> 
> Other implementations will unmap the large IOPTE and return it's
> length. For example if a 2M IOPTE is present and the first 4K is requested
> to be unmapped then unmap will remove the whole 2M and report 2M as the
> result.
> 
> armv7 instead will break up contiguous entries and replace an entry with a
> whole table so it can unmap the requested 4k.
> 
> This seems copied from the arm_lpae implementation, which was analyzed
> here:
> 
>   https://lore.kernel.org/all/20241024134411.GA6956@nvidia.com/
> 
> Bring consistency to the implementations and remove this unused
> functionality.
> 
> There are no uses outside iommu, this effects the ARM_V7S drivers
> msm_iommu, mtk_iommu, and arm-smmmu.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 125 +----------------------------
>   1 file changed, 4 insertions(+), 121 deletions(-)

Yikes, I'd forgotten quite how much horribleness was devoted to this, 
despite it being the "simpler" non-recursive one...

However, there are also "partial unmap" cases in both sets of selftests, 
so I think there's still a bit more to remove yet :)

Thanks,
Robin.

> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 06ffc683b28fee..7e37459cd28332 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -166,7 +166,6 @@ struct arm_v7s_io_pgtable {
>   
>   	arm_v7s_iopte		*pgd;
>   	struct kmem_cache	*l2_tables;
> -	spinlock_t		split_lock;
>   };
>   
>   static bool arm_v7s_pte_is_cont(arm_v7s_iopte pte, int lvl);
> @@ -363,25 +362,6 @@ static arm_v7s_iopte arm_v7s_prot_to_pte(int prot, int lvl,
>   	return pte;
>   }
>   
> -static int arm_v7s_pte_to_prot(arm_v7s_iopte pte, int lvl)
> -{
> -	int prot = IOMMU_READ;
> -	arm_v7s_iopte attr = pte >> ARM_V7S_ATTR_SHIFT(lvl);
> -
> -	if (!(attr & ARM_V7S_PTE_AP_RDONLY))
> -		prot |= IOMMU_WRITE;
> -	if (!(attr & ARM_V7S_PTE_AP_UNPRIV))
> -		prot |= IOMMU_PRIV;
> -	if ((attr & (ARM_V7S_TEX_MASK << ARM_V7S_TEX_SHIFT)) == 0)
> -		prot |= IOMMU_MMIO;
> -	else if (pte & ARM_V7S_ATTR_C)
> -		prot |= IOMMU_CACHE;
> -	if (pte & ARM_V7S_ATTR_XN(lvl))
> -		prot |= IOMMU_NOEXEC;
> -
> -	return prot;
> -}
> -
>   static arm_v7s_iopte arm_v7s_pte_to_cont(arm_v7s_iopte pte, int lvl)
>   {
>   	if (lvl == 1) {
> @@ -398,23 +378,6 @@ static arm_v7s_iopte arm_v7s_pte_to_cont(arm_v7s_iopte pte, int lvl)
>   	return pte;
>   }
>   
> -static arm_v7s_iopte arm_v7s_cont_to_pte(arm_v7s_iopte pte, int lvl)
> -{
> -	if (lvl == 1) {
> -		pte &= ~ARM_V7S_CONT_SECTION;
> -	} else if (lvl == 2) {
> -		arm_v7s_iopte xn = pte & BIT(ARM_V7S_CONT_PAGE_XN_SHIFT);
> -		arm_v7s_iopte tex = pte & (ARM_V7S_CONT_PAGE_TEX_MASK <<
> -					   ARM_V7S_CONT_PAGE_TEX_SHIFT);
> -
> -		pte ^= xn | tex | ARM_V7S_PTE_TYPE_CONT_PAGE;
> -		pte |= (xn >> ARM_V7S_CONT_PAGE_XN_SHIFT) |
> -		       (tex >> ARM_V7S_CONT_PAGE_TEX_SHIFT) |
> -		       ARM_V7S_PTE_TYPE_PAGE;
> -	}
> -	return pte;
> -}
> -
>   static bool arm_v7s_pte_is_cont(arm_v7s_iopte pte, int lvl)
>   {
>   	if (lvl == 1 && !ARM_V7S_PTE_IS_TABLE(pte, lvl))
> @@ -591,77 +554,6 @@ static void arm_v7s_free_pgtable(struct io_pgtable *iop)
>   	kfree(data);
>   }
>   
> -static arm_v7s_iopte arm_v7s_split_cont(struct arm_v7s_io_pgtable *data,
> -					unsigned long iova, int idx, int lvl,
> -					arm_v7s_iopte *ptep)
> -{
> -	struct io_pgtable *iop = &data->iop;
> -	arm_v7s_iopte pte;
> -	size_t size = ARM_V7S_BLOCK_SIZE(lvl);
> -	int i;
> -
> -	/* Check that we didn't lose a race to get the lock */
> -	pte = *ptep;
> -	if (!arm_v7s_pte_is_cont(pte, lvl))
> -		return pte;
> -
> -	ptep -= idx & (ARM_V7S_CONT_PAGES - 1);
> -	pte = arm_v7s_cont_to_pte(pte, lvl);
> -	for (i = 0; i < ARM_V7S_CONT_PAGES; i++)
> -		ptep[i] = pte + i * size;
> -
> -	__arm_v7s_pte_sync(ptep, ARM_V7S_CONT_PAGES, &iop->cfg);
> -
> -	size *= ARM_V7S_CONT_PAGES;
> -	io_pgtable_tlb_flush_walk(iop, iova, size, size);
> -	return pte;
> -}
> -
> -static size_t arm_v7s_split_blk_unmap(struct arm_v7s_io_pgtable *data,
> -				      struct iommu_iotlb_gather *gather,
> -				      unsigned long iova, size_t size,
> -				      arm_v7s_iopte blk_pte,
> -				      arm_v7s_iopte *ptep)
> -{
> -	struct io_pgtable_cfg *cfg = &data->iop.cfg;
> -	arm_v7s_iopte pte, *tablep;
> -	int i, unmap_idx, num_entries, num_ptes;
> -
> -	tablep = __arm_v7s_alloc_table(2, GFP_ATOMIC, data);
> -	if (!tablep)
> -		return 0; /* Bytes unmapped */
> -
> -	num_ptes = ARM_V7S_PTES_PER_LVL(2, cfg);
> -	num_entries = size >> ARM_V7S_LVL_SHIFT(2);
> -	unmap_idx = ARM_V7S_LVL_IDX(iova, 2, cfg);
> -
> -	pte = arm_v7s_prot_to_pte(arm_v7s_pte_to_prot(blk_pte, 1), 2, cfg);
> -	if (num_entries > 1)
> -		pte = arm_v7s_pte_to_cont(pte, 2);
> -
> -	for (i = 0; i < num_ptes; i += num_entries, pte += size) {
> -		/* Unmap! */
> -		if (i == unmap_idx)
> -			continue;
> -
> -		__arm_v7s_set_pte(&tablep[i], pte, num_entries, cfg);
> -	}
> -
> -	pte = arm_v7s_install_table(tablep, ptep, blk_pte, cfg);
> -	if (pte != blk_pte) {
> -		__arm_v7s_free_table(tablep, 2, data);
> -
> -		if (!ARM_V7S_PTE_IS_TABLE(pte, 1))
> -			return 0;
> -
> -		tablep = iopte_deref(pte, 1, data);
> -		return __arm_v7s_unmap(data, gather, iova, size, 2, tablep);
> -	}
> -
> -	io_pgtable_tlb_add_page(&data->iop, gather, iova, size);
> -	return size;
> -}
> -
>   static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
>   			      struct iommu_iotlb_gather *gather,
>   			      unsigned long iova, size_t size, int lvl,
> @@ -694,11 +586,8 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
>   	 * case in a lock for the sake of correctness and be done with it.
>   	 */
>   	if (num_entries <= 1 && arm_v7s_pte_is_cont(pte[0], lvl)) {
> -		unsigned long flags;
> -
> -		spin_lock_irqsave(&data->split_lock, flags);
> -		pte[0] = arm_v7s_split_cont(data, iova, idx, lvl, ptep);
> -		spin_unlock_irqrestore(&data->split_lock, flags);
> +		WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
> +		return 0;
>   	}
>   
>   	/* If the size matches this level, we're in the right place */
> @@ -721,12 +610,8 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
>   		}
>   		return size;
>   	} else if (lvl == 1 && !ARM_V7S_PTE_IS_TABLE(pte[0], lvl)) {
> -		/*
> -		 * Insert a table at the next level to map the old region,
> -		 * minus the part we want to unmap
> -		 */
> -		return arm_v7s_split_blk_unmap(data, gather, iova, size, pte[0],
> -					       ptep);
> +		WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
> +		return 0;
>   	}
>   
>   	/* Keep on walkin' */
> @@ -811,8 +696,6 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>   	if (!data)
>   		return NULL;
>   
> -	spin_lock_init(&data->split_lock);
> -
>   	/*
>   	 * ARM_MTK_TTBR_EXT extend the translation table base support larger
>   	 * memory address.


