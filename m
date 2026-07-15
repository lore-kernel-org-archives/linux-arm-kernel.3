Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16A7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYuefCM79gXuAodISgJJBncvBoTe4PB5cbdqzkO39pc=; b=niHXGgdjP7ELoPwX3WabLygRhJ
	Ngr/fWi40xlv/EWYYMi+houLLPeJw4S6Ax2ltr33egqXShxR2dB4sU28ZwFLCrEBitSyzWl4bjTUB
	U0b0p3+O2mYiu75vxJdVcbyffC+XyebPHtdnITrgIo+KHpTnnNH5DAi3G/f4Lr3ASJO3v8uO/GCQb
	AQ3we9cqtwpzIU+eH5wIpT1nL7WOUPXUTyTrafb+psJFvC+F+b9pZcLvBp46zWQPGUrPMe+pS/m9P
	O0T70Ro6+glTMd8SgYKjLUn0Gi+tUPSYbThUXAGG6y6SsfXAVFOpT+Y9CvK4aBVmHxCXw3KbwdVnN
	q/uJAt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3Ng-0000000FYvl-08lB;
	Wed, 15 Jul 2026 17:26:48 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3Nd-0000000FYvF-3KMx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 17:26:47 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47df440fcd5so3236188f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784136404; x=1784741204; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PYuefCM79gXuAodISgJJBncvBoTe4PB5cbdqzkO39pc=;
        b=W051BiUh6AXe3uXo4WPi00FCDFX3v+CqzN4ICCVU4s13h6dcYThhHZvEYJtvjevq3t
         lbA9EmeBq7VoIKMx3pamVXEmLD2nPrOakMGnVVNu0gJ6ddSdIpgCVOktLSIQk7HwZx6E
         pr1Vpmr4jpU4ltWWWv2IOrgA12Fo9NC7b5YVH7GieUNeXC3jpFOkLX7SMEb44IcRqxKC
         VnI0oY2U7VO7yEK5Q8KDShgkV6B5XtOX1/vr2N71OmGwEdIpzVoFLGw2F0inLGVn7s9c
         LxkYQbMUhS01SrejEJvjRSyuacy0AUUrFBzeD27BzLImdhA6UBG7K24uuOivti2KtlrZ
         xujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784136404; x=1784741204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PYuefCM79gXuAodISgJJBncvBoTe4PB5cbdqzkO39pc=;
        b=egnrGAMBFi3GNgwS/NUGhSWkVo5OmX1sdnadn38KaJh9zBReIA1Z9jUz9KOE46W61t
         vHgJad+KctJpRbZMHaH3l9eti3YmvcjzTa38kKli7bcBvPjbdjDwJvKxy+kgzPsh9VOU
         EVhQbxzVdYQfQ7oimHlQhAkmi1tpLaw8xjSokIOaSCl3ANhzE6lj7dDoINYizZF8ZMAc
         OMj45eJ0FRb6PIeU0ukeXKySaImFhcoaaHrF8aoj8q4a9YLtDyGnmedqy4n84D3NE05h
         eY9Q8QZrVQ0eUiFEXX8oY2TAAmiMg5C+sr2chWxhBWr/6BGMfqaT7NRErfiUlfFusPQx
         CFqA==
X-Gm-Message-State: AOJu0YxqDwBtui+o/d1EtYBgKX2kTOLUFo7N5648fE8MkshTxyHXq/He
	4ZmGIcbgay1znq3YLlQ536fOoBZBN96m0YSnsnbCr0JhsS/zMIjaIsGBuw09ne502Q==
X-Gm-Gg: AfdE7ckZMpidjG3P5uzMI254j6H6GOhCChEGl91IK+ivfP+jMBZBbHDSiJ9LSufoPmi
	G/5jgdagfjySSsBROSzBinRI6+V26ioCnpoEa/j2Fgp6+j6UjuotjtP2jv1jp6cEgTqFCVxlt2n
	N4p2AdTsJGVXBIkRVZpMkFSL4Z95cU2nfrmSMMIOsgOIHGBA5tuSnkrcWIa7c1vO+/avoqskpgk
	dNBtNvSmQ+zXPV2VBTYnLLqNGfs7jeb3bdFDub9YXtdTg4QoWk5T5MOYKOedmriA9yiPpZdMlVX
	gt0SfqrcPL5lnN0Qe7uulobVnnQu7uWMereQF6eIbiNJ6fUKRuwdcl1s44eQuCi9CjQQ738zeIz
	ubFq9tC1ff7CDV6ebx6+AVA5/jYKCBHI8wCPq7N5NkNpYAggD+3rafmN+/7y3bh0O0Wzvb6fJ1A
	cfclpuMZlRTgBZ6edXKTFsiTxTwlRFOjT3bpqqsvW5m72O6A4nLmI=
X-Received: by 2002:a05:600c:8183:b0:495:4056:9473 with SMTP id 5b1f17b1804b1-49540569485mr13706785e9.28.1784136403312;
        Wed, 15 Jul 2026 10:26:43 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322dc6sm171452445e9.10.2026.07.15.10.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:26:42 -0700 (PDT)
Date: Wed, 15 Jul 2026 18:26:39 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 02/24] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <alfCz_WQR_Al2lFw@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715115906.2664882-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_102645_872586_17DE393D 
X-CRM114-Status: GOOD (  37.83  )
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

On Wed, Jul 15, 2026 at 11:58:43AM +0000, Mostafa Saleh wrote:
> Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> drivers can protect and access the MMIO of IOMMUs.
> 
> As donating MMIO is very rare, and we don’t need to encode the full
> state, it’s reasonable to have a separate function to do this.
> It will init the host s2 page table with an invalid leaf with the owner ID
> to prevent the host from mapping the page on faults.
> 
> Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> stage-2 PTEs, as this can be triggered from recycle logic under memory
> pressure. There is no code relying on this, as all ownership changes is
> done via kvm_pgtable_stage2_set_owner()
> 
> For the error path in IOMMU drivers, add a function to donate MMIO
> back from hyp to host. However, that leaks the hypervisor virtual
> address range which should be acceptable as this is quite rare and
> it matches the behaviour of fix_map/block.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  7 ++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 91 ++++++++++++++++++-
>  arch/arm64/kvm/hyp/pgtable.c                  | 11 +--
>  3 files changed, 102 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 29935c7da1de..51b0eb3844a9 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -36,6 +36,13 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
>  int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
>  int __pkvm_host_unshare_hyp(u64 pfn);
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> +/*
> + * Donate MMIO range to the hypervisor, it will be mapped in the hypervisor's
> + * private range and unmapped from the host stage-2.
> + */
> +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr);
> +/* Remaps MMIO range in the host, typically used in error path. */
> +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 4e329e39a695..d803b3dd4cb4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -378,7 +378,11 @@ static int host_stage2_unmap_dev_all(void)
>  	u64 addr = 0;
>  	int i, ret;
>  
> -	/* Unmap all non-memory regions to recycle the pages */
> +	/*
> +	 * Unmap all non-memory regions to recycle the pages.
> +	 * That relies on kvm_pgtable_stage2_unmap() not clearing
> +	 * counted PTEs which include hypervisor MMIO.
> +	 */
>  	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
>  		reg = &hyp_memory[i];
>  		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
> @@ -1119,6 +1123,91 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  	return ret;
>  }
>  
> +int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned long *haddr)
> +{
> +	kvm_pte_t pte;
> +	u64 offset;
> +	int ret;
> +
> +	/* Only before de-privilege. */
> +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> +		return -EPERM;
> +
> +	if (!PAGE_ALIGNED(addr | size) ||

You wouldn't need that with u64 pfn, u64 nr_pages :) 

> +	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
> +		return -EINVAL;
> +
> +	ret = __pkvm_create_private_mapping(addr, size, PAGE_HYP_DEVICE, haddr);
> +	if (ret)
> +		return ret;
> +
> +	host_lock_component();
> +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> +		if (addr_is_memory(addr + offset)) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> +		if (ret)
> +			goto unlock;

Is that called for big regions? because that looks quite inefficient even for
something that is init and IIRC we want to use this for GIC hardening too?

Perhaps it wouldn't be complicated to walk hyp_memory[] to make sure this
doesn't overlap any memory region. And then to reuse check_page_state_range() to
verify the host stage-2? 

> +		if (pte && !kvm_pte_valid(pte)) {
> +			ret = -EPERM;
> +			goto unlock;
> +		}
> +	}
> +	/*
> +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> +	 */

Not sure we want that level of detail, it will probably become stall very
quickly. Perhaps we can simply say "the annotation is refcounted and protects
this region until it is released with __pkvm_hyp_donate_host_mmio()" or
something like that?

Also that makes me think, do we want to add this to the ownership_selftest?

> +	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> +			      addr, size, &host_s2_pool,
> +			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
> +			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
> +unlock:
> +	host_unlock_component();
> +	return ret;
> +}
> +
> +int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
> +{
> +	kvm_pte_t pte;
> +	u64 offset;
> +	int ret = 0;
> +
> +	if (static_branch_unlikely(&kvm_protected_mode_initialized))
> +		return -EPERM;
> +
> +	if (!PAGE_ALIGNED(addr | size) ||
> +	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
> +		return -EINVAL;
> +
> +	host_lock_component();
> +	for (offset = 0; offset < size; offset += PAGE_SIZE) {
> +		if (addr_is_memory(addr + offset)) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
> +		if (ret)
> +			goto unlock;
> +		if (!pte || kvm_pte_valid(pte)) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +		if (FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) != PKVM_ID_HYP) {
> +			ret = -EPERM;
> +			goto unlock;
> +		}
> +	}
> +	WARN_ON(host_stage2_idmap_locked(addr, size, PKVM_HOST_MMIO_PROT));
> +unlock:
> +	host_unlock_component();
> +	return ret;
> +}
> +
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
>  {
>  	u64 phys = hyp_pfn_to_phys(pfn);
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 91a7dfad6686..3073184cf6ad 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	kvm_pte_t *childp = NULL;
>  	bool need_flush = false;
>  
> -	if (!kvm_pte_valid(ctx->old)) {
> -		if (stage2_pte_is_counted(ctx->old)) {
> -			kvm_clear_pte(ctx->ptep);
> -			mm_ops->put_page(ctx->ptep);
> -		}
> +	/*
> +	 * That also ignores stage2_pte_is_counted() instead of clearing
> +	 * the PTE as the MMIO can be owned by the hypervisor.

Not sure we should reference something pKVM specific in that code. Perhaps just
say we don't touch refcounted PTEs?


> +	 */
> +	if (!kvm_pte_valid(ctx->old))
>  		return 0;
> -	}
>  
>  	if (kvm_pte_table(ctx->old, ctx->level)) {
>  		childp = kvm_pte_follow(ctx->old, mm_ops);
> -- 
> 2.55.0.141.g00534a21ce-goog
> 

