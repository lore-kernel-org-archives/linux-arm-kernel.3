Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C7AC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/ZcoCMxl0ovAN1t5G9wwoNNL73E8AEO36DTQsY0hjo=; b=HmcoTv/Uy65NpSiEJOq1eJX16H
	m40qoxIRs/ovpVv7CcHCjj74LjJBSkXLhyaIiRh5UEZmxVtvY55UpKB5Ko0Sl9bmpZvF4VQ7QttSc
	iheS8eGP/Gcd9pe27mALHUc6WUuFU/v+gW/B8RoQqgxGEZI9Qrcq0H6qsAZaO/pDBm8tg6R5uPBXz
	u5op+V3YRHaXIZVT6msQmRMVhM7NBF4YtKxcMBqNEQuDlILFU/Z9UUl0/XGjINrfHoQvlkm50XtqF
	tQYLde6xrSwkvnuBou43D0BaJKYsZugfnb2hM8cmPWeztfwb2h8NdnZZguLcqWvQ3SJtnwTME046S
	u0LdBtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmarC-0000000CTl0-1yuP;
	Wed, 22 Jul 2026 17:35:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmar9-0000000CTjV-1ouH;
	Wed, 22 Jul 2026 17:35:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 029251595;
	Wed, 22 Jul 2026 10:35:38 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A85363F66F;
	Wed, 22 Jul 2026 10:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784741742; bh=Doh3mUJDYwOhvgHP9u0NtOQTz30+j1JyC4YJU4QzEok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kYPkqXIr1auHkNWCpSBNQDVNj+PB1720mOK5x76sWN7ylhnlVrAUTp2kbyfEJAPYF
	 uqCWbOlwsofejB7FFzlLJS8ZxfCe+wID6Y6/YGOxLoPUcaN2GvmnlsVbK9FJCryxRQ
	 VJOi6QVdckLRe7KZ8KzUJRuSfw76ppKSvzNT9vvI=
Message-ID: <8a2073d3-b65f-4ba9-b784-7414002965e2@arm.com>
Date: Wed, 22 Jul 2026 18:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/rockchip: Drop global rk_ops in favor of
 per-device ops
To: Simon Xue <xxm@rock-chips.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260722073511.403252-1-xxm@rock-chips.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260722073511.403252-1-xxm@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_103543_587025_FF6CFE3E 
X-CRM114-Status: GOOD (  32.95  )
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

On 22/07/2026 8:35 am, Simon Xue wrote:
> The driver currently uses a global rk_ops pointer, forcing all IOMMU
> instances to share the same operations. This restricts the driver from
> supporting SoCs that might integrate different versions of IOMMU hardware.
> 
> Since the IOMMU framework passes the master device information to
> iommu_paging_domain_alloc(), the global variable is no longer needed.
> 
> Fix this by moving rk_ops into struct rk_iommu and struct rk_iommu_domain.
> Initialize it per-device during probe via of_device_get_match_data(),
> and replace all global references with the instance-specific pointers.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Simon Xue <xxm@rock-chips.com>
> ---
> v3:
>   - Restore rk_ops compatibility check, moved into rk_iommu_attach_device()
> v2:
>   - Remove the one-time-used 'ops' variable in rk_iommu_probe()
> 
>   drivers/iommu/rockchip-iommu.c | 74 +++++++++++++++++-----------------
>   1 file changed, 36 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 0013cf196c57..7d1642366b8b 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -82,6 +82,14 @@
>     */
>   #define RK_IOMMU_PGSIZE_BITMAP 0x007ff000
>   
> +struct rk_iommu_ops {
> +	phys_addr_t (*pt_address)(u32 dte);
> +	u32 (*mk_dtentries)(dma_addr_t pt_dma);
> +	u32 (*mk_ptentries)(phys_addr_t page, int prot);
> +	u64 dma_bit_mask;
> +	gfp_t gfp_flags;
> +};
> +
>   struct rk_iommu_domain {
>   	struct list_head iommus;
>   	u32 *dt; /* page directory table */
> @@ -89,6 +97,7 @@ struct rk_iommu_domain {
>   	spinlock_t iommus_lock; /* lock for iommus list */
>   	spinlock_t dt_lock; /* lock for modifying page directory table */
>   	struct device *dma_dev;
> +	const struct rk_iommu_ops *rk_ops;
>   
>   	struct iommu_domain domain;
>   };
> @@ -98,14 +107,6 @@ static const char * const rk_iommu_clocks[] = {
>   	"aclk", "iface",
>   };
>   
> -struct rk_iommu_ops {
> -	phys_addr_t (*pt_address)(u32 dte);
> -	u32 (*mk_dtentries)(dma_addr_t pt_dma);
> -	u32 (*mk_ptentries)(phys_addr_t page, int prot);
> -	u64 dma_bit_mask;
> -	gfp_t gfp_flags;
> -};
> -
>   struct rk_iommu {
>   	struct device *dev;
>   	void __iomem **bases;
> @@ -117,6 +118,7 @@ struct rk_iommu {
>   	struct iommu_device iommu;
>   	struct list_head node; /* entry in rk_iommu_domain.iommus */
>   	struct iommu_domain *domain; /* domain to which iommu is attached */
> +	const struct rk_iommu_ops *rk_ops;
>   };
>   
>   struct rk_iommudata {
> @@ -124,7 +126,6 @@ struct rk_iommudata {
>   	struct rk_iommu *iommu;
>   };
>   
> -static const struct rk_iommu_ops *rk_ops;
>   static struct iommu_domain rk_identity_domain;
>   
>   static inline void rk_table_flush(struct rk_iommu_domain *dom, dma_addr_t dma,
> @@ -510,7 +511,7 @@ static int rk_iommu_force_reset(struct rk_iommu *iommu)
>   	 * and verifying that upper 5 (v1) or 7 (v2) nybbles are read back.
>   	 */
>   	for (i = 0; i < iommu->num_mmu; i++) {
> -		dte_addr = rk_ops->pt_address(DTE_ADDR_DUMMY);
> +		dte_addr = iommu->rk_ops->pt_address(DTE_ADDR_DUMMY);
>   		rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR, dte_addr);
>   
>   		if (dte_addr != rk_iommu_read(iommu->bases[i], RK_MMU_DTE_ADDR)) {
> @@ -551,7 +552,7 @@ static void log_iova(struct rk_iommu *iommu, int index, dma_addr_t iova)
>   	page_offset = rk_iova_page_offset(iova);
>   
>   	mmu_dte_addr = rk_iommu_read(base, RK_MMU_DTE_ADDR);
> -	mmu_dte_addr_phys = rk_ops->pt_address(mmu_dte_addr);
> +	mmu_dte_addr_phys = iommu->rk_ops->pt_address(mmu_dte_addr);
>   
>   	dte_addr_phys = mmu_dte_addr_phys + (4 * dte_index);
>   	dte_addr = phys_to_virt(dte_addr_phys);
> @@ -560,14 +561,14 @@ static void log_iova(struct rk_iommu *iommu, int index, dma_addr_t iova)
>   	if (!rk_dte_is_pt_valid(dte))
>   		goto print_it;
>   
> -	pte_addr_phys = rk_ops->pt_address(dte) + (pte_index * 4);
> +	pte_addr_phys = iommu->rk_ops->pt_address(dte) + (pte_index * 4);
>   	pte_addr = phys_to_virt(pte_addr_phys);
>   	pte = *pte_addr;
>   
>   	if (!rk_pte_is_page_valid(pte))
>   		goto print_it;
>   
> -	page_addr_phys = rk_ops->pt_address(pte) + page_offset;
> +	page_addr_phys = iommu->rk_ops->pt_address(pte) + page_offset;
>   	page_flags = pte & RK_PTE_PAGE_FLAGS_MASK;
>   
>   print_it:
> @@ -663,13 +664,13 @@ static phys_addr_t rk_iommu_iova_to_phys(struct iommu_domain *domain,
>   	if (!rk_dte_is_pt_valid(dte))
>   		goto out;
>   
> -	pt_phys = rk_ops->pt_address(dte);
> +	pt_phys = rk_domain->rk_ops->pt_address(dte);
>   	page_table = (u32 *)phys_to_virt(pt_phys);
>   	pte = page_table[rk_iova_pte_index(iova)];
>   	if (!rk_pte_is_page_valid(pte))
>   		goto out;
>   
> -	phys = rk_ops->pt_address(pte) + rk_iova_page_offset(iova);
> +	phys = rk_domain->rk_ops->pt_address(pte) + rk_iova_page_offset(iova);
>   out:
>   	spin_unlock_irqrestore(&rk_domain->dt_lock, flags);
>   
> @@ -730,7 +731,7 @@ static u32 *rk_dte_get_page_table(struct rk_iommu_domain *rk_domain,
>   	if (rk_dte_is_pt_valid(dte))
>   		goto done;
>   
> -	page_table = iommu_alloc_pages_sz(GFP_ATOMIC | rk_ops->gfp_flags,
> +	page_table = iommu_alloc_pages_sz(GFP_ATOMIC | rk_domain->rk_ops->gfp_flags,
>   					  SPAGE_SIZE);
>   	if (!page_table)
>   		return ERR_PTR(-ENOMEM);
> @@ -742,13 +743,13 @@ static u32 *rk_dte_get_page_table(struct rk_iommu_domain *rk_domain,
>   		return ERR_PTR(-ENOMEM);
>   	}
>   
> -	dte = rk_ops->mk_dtentries(pt_dma);
> +	dte = rk_domain->rk_ops->mk_dtentries(pt_dma);
>   	*dte_addr = dte;
>   
>   	rk_table_flush(rk_domain,
>   		       rk_domain->dt_dma + dte_index * sizeof(u32), 1);
>   done:
> -	pt_phys = rk_ops->pt_address(dte);
> +	pt_phys = rk_domain->rk_ops->pt_address(dte);
>   	return (u32 *)phys_to_virt(pt_phys);
>   }
>   
> @@ -790,7 +791,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
>   		if (rk_pte_is_page_valid(pte))
>   			goto unwind;
>   
> -		pte_addr[pte_count] = rk_ops->mk_ptentries(paddr, prot);
> +		pte_addr[pte_count] = rk_domain->rk_ops->mk_ptentries(paddr, prot);
>   
>   		paddr += SPAGE_SIZE;
>   	}
> @@ -812,7 +813,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
>   			    pte_count * SPAGE_SIZE);
>   
>   	iova += pte_count * SPAGE_SIZE;
> -	page_phys = rk_ops->pt_address(pte_addr[pte_count]);
> +	page_phys = rk_domain->rk_ops->pt_address(pte_addr[pte_count]);
>   	pr_err("iova: %pad already mapped to %pa cannot remap to phys: %pa prot: %#x\n",
>   	       &iova, &page_phys, &paddr, prot);
>   
> @@ -849,7 +850,7 @@ static int rk_iommu_map(struct iommu_domain *domain, unsigned long _iova,
>   	pte_index = rk_iova_pte_index(iova);
>   	pte_addr = &page_table[pte_index];
>   
> -	pte_dma = rk_ops->pt_address(dte_index) + pte_index * sizeof(u32);
> +	pte_dma = rk_domain->rk_ops->pt_address(dte_index) + pte_index * sizeof(u32);
>   	ret = rk_iommu_map_iova(rk_domain, pte_addr, pte_dma, iova,
>   				paddr, size, prot);
>   
> @@ -887,7 +888,7 @@ static size_t rk_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
>   		return 0;
>   	}
>   
> -	pt_phys = rk_ops->pt_address(dte);
> +	pt_phys = rk_domain->rk_ops->pt_address(dte);
>   	pte_addr = (u32 *)phys_to_virt(pt_phys) + rk_iova_pte_index(iova);
>   	pte_dma = pt_phys + rk_iova_pte_index(iova) * sizeof(u32);
>   	unmap_size = rk_iommu_unmap_iova(rk_domain, pte_addr, pte_dma, size);
> @@ -945,7 +946,7 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>   
>   	for (i = 0; i < iommu->num_mmu; i++) {
>   		rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR,
> -			       rk_ops->mk_dtentries(rk_domain->dt_dma));
> +			       iommu->rk_ops->mk_dtentries(rk_domain->dt_dma));
>   		rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE);
>   		rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
>   	}
> @@ -1027,6 +1028,9 @@ static int rk_iommu_attach_device(struct iommu_domain *domain,
>   	if (iommu->domain == domain)
>   		return 0;
>   
> +	if (rk_domain->rk_ops != iommu->rk_ops)
> +		return -EINVAL;
> +
>   	ret = rk_iommu_identity_attach(&rk_identity_domain, dev, old);
>   	if (ret)
>   		return ret;
> @@ -1068,17 +1072,19 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
>   	if (!rk_domain)
>   		return NULL;
>   
> +	iommu = rk_iommu_from_dev(dev);
> +	rk_domain->rk_ops = iommu->rk_ops;
> +
>   	/*
>   	 * rk32xx iommus use a 2 level pagetable.
>   	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
>   	 * Allocate one 4 KiB page for each table.
>   	 */
> -	rk_domain->dt = iommu_alloc_pages_sz(GFP_KERNEL | rk_ops->gfp_flags,
> +	rk_domain->dt = iommu_alloc_pages_sz(GFP_KERNEL | rk_domain->rk_ops->gfp_flags,
>   					     SPAGE_SIZE);
>   	if (!rk_domain->dt)
>   		goto err_free_domain;
>   
> -	iommu = rk_iommu_from_dev(dev);
>   	rk_domain->dma_dev = iommu->dev;
>   	rk_domain->dt_dma = dma_map_single(rk_domain->dma_dev, rk_domain->dt,
>   					   SPAGE_SIZE, DMA_TO_DEVICE);
> @@ -1117,7 +1123,7 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
>   	for (i = 0; i < NUM_DT_ENTRIES; i++) {
>   		u32 dte = rk_domain->dt[i];
>   		if (rk_dte_is_pt_valid(dte)) {
> -			phys_addr_t pt_phys = rk_ops->pt_address(dte);
> +			phys_addr_t pt_phys = rk_domain->rk_ops->pt_address(dte);
>   			u32 *page_table = phys_to_virt(pt_phys);
>   			dma_unmap_single(rk_domain->dma_dev, pt_phys,
>   					 SPAGE_SIZE, DMA_TO_DEVICE);
> @@ -1197,7 +1203,6 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct rk_iommu *iommu;
>   	struct resource *res;
> -	const struct rk_iommu_ops *ops;
>   	int num_res = pdev->num_resources;
>   	int err, i;
>   
> @@ -1211,16 +1216,9 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   	iommu->dev = dev;
>   	iommu->num_mmu = 0;
>   
> -	ops = of_device_get_match_data(dev);
> -	if (!rk_ops)
> -		rk_ops = ops;
> -
> -	/*
> -	 * That should not happen unless different versions of the
> -	 * hardware block are embedded the same SoC
> -	 */
> -	if (WARN_ON(rk_ops != ops))
> -		return -EINVAL;
> +	iommu->rk_ops = of_device_get_match_data(dev);
> +	if (!iommu->rk_ops)
> +		return -ENOENT;
>   
>   	iommu->bases = devm_kcalloc(dev, num_res, sizeof(*iommu->bases),
>   				    GFP_KERNEL);
> @@ -1286,7 +1284,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   			goto err_pm_disable;
>   	}
>   
> -	dma_set_mask_and_coherent(dev, rk_ops->dma_bit_mask);
> +	dma_set_mask_and_coherent(dev, iommu->rk_ops->dma_bit_mask);
>   
>   	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
>   	if (err)


