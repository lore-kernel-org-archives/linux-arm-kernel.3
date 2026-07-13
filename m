Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E967EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPb9nw2DjjX5vlFuty7FNZD2YGQlvsv+r37tv8hIR3A=; b=MBWXqOK4+WwMWRdq0vvUgsALKt
	pJ381rFCmZTb4L9RLcy6c2DuruH9ZfDf1OSDb+gjiHKzaqvPDpsRpG12ZVAwIeStG9C7W92zYOWv6
	syP4B6EzhbEL2v0l0EUHDazp/SaPsHB5BciBfaOFDEwgZyqC4TJnpZNu6sviNpidijXnvCEa5GEBM
	4TSgVQfoWHhotle2VBqwOPYNKvKz6Fx6WTs/J+3Nzp41MuUdp+IqsCGdJNzkJdzK6h9YeohdF28XZ
	isCqJwIibeb/DADsRpqjaClPyaFdyqstX4vtQgsWMkAKF/O6QOE9IoIHL2Gmk+4hhO7G+YP8bUcZU
	V2Leb39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGeI-00000009OSb-3w24;
	Mon, 13 Jul 2026 13:24:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGe2-00000009ORT-0eW5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:24:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493f45e206dso15342825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783949064; x=1784553864; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPb9nw2DjjX5vlFuty7FNZD2YGQlvsv+r37tv8hIR3A=;
        b=qTjAzFN18ZKoBTdj2f231SoI1bOlprca/DdNbbo/0S/heo1HmpFon6e+J440+FNcmL
         4HPEeyfAvQkVVOQncvYVseJExQBj0y45LlQDlfHJbvH1TctU9FbZUT3lgt/JSs6GykeX
         frdsgoHVle4o/7hN+WGCXHZW9zfYZQCAqPeP6UyN8696eWjpj1MQf0/EXS40ipxz5NCB
         +iTEAYZFsVWTiTsG+5/iUwWiGsToTixQ/oVvgfCIT8h6Y/53EUPITZJ7BIPIqYc3zC1w
         VAz/MYJBQBirGqFuO13B75hwgJYFaeONN+oW/DRkf7Ect9Qx5MkbSqEu2npJ9YCo2oU1
         tEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783949064; x=1784553864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPb9nw2DjjX5vlFuty7FNZD2YGQlvsv+r37tv8hIR3A=;
        b=HlIsUTJD6WJ75W7/lqDGVxrJoBsuix2rOKHH5ZR145isPzX4m6Wmp6aTVnwZAmW+Iz
         P1oFAsSzm5+HW4dB/+4Fjx2eBOR2JRiSu6p4HuuU9cFo4T1YteK40xw+IcRTJFQoDmgy
         Ph6JsVrZqrVOwboJ20PZ+XWVLmN5MxeYVHHwYjMNHB58if4FF/NCBtt1soMJ4oY9qSuS
         8ywDiUHwhYBFTkT8gyB7/Hf2PXoNK9gK+txmBsLvbtS64BefhGoJPTdpq/70TyQzBl6j
         zdmlU04WHXu8FJhkhc/QHIgrplWuGdTjB/NO7p3y11941EVsci/oT1LWOkGqyS3KVDnV
         qPMQ==
X-Gm-Message-State: AOJu0YwkpIznniROVXNEiBz0EdzEEY7QBhyN5w3u1spAnl0L/170izUL
	dK8txexeIvwGO0Q1ySUzOpHggHpu+K/g0RYRhIULhP6qJHJvjPaJlcx4qM1I1KE9cQ==
X-Gm-Gg: AfdE7clpXkWOfQ3ndJQa42Nos/57fq0jgABHF0uLrqxlGr9ZuGUmM/xcsnx9c7JQqR9
	2jO9NVB2zlrY0L3PlvZ89jm+i7sOizu1MNY+xRA9JNXJHgfN42JqClsGM4k0W3ycDgrbbJfwOPV
	kMUeECYmmPGICdha3atRB21ekU8p1Y/WuukiClbzOspa+8YCgrRush6H8rr5kLEykxq3WW9eWgh
	OM9illFjBV6mLwrzedG8WF9mKLaUv5cjqXV5SjEDorB72Y4uF0jC2sRpLrBYXjg/9O8QmXhhSZT
	3dIS3UteQbqOYRzWcR2fubbJtDUC9gZ6oa5ESvNe2AUM8wf05ukHXMrlzsIk8fk7RE9vdyBPrxE
	nTY7+rrl/WzFsNDDfzRDAe7DyBCw9JszywvD4w+yhHBJ4BH12Df0/CDofZygIlFXpoOFCRjdfBL
	XbJFyiIhbRq9nc1dTG+XeSY4sWWR8a0Q+YQnuwMHiOyZkKGcUhePk=
X-Received: by 2002:a05:600c:1c27:b0:492:3fb5:3a17 with SMTP id 5b1f17b1804b1-493f887ab70mr98283125e9.2.1783949063602;
        Mon, 13 Jul 2026 06:24:23 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm356961685e9.1.2026.07.13.06.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:24:22 -0700 (PDT)
Date: Mon, 13 Jul 2026 14:24:19 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alTnAy7jvjUamwUA@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-9-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_062426_249000_4035A14E 
X-CRM114-Status: GOOD (  53.95  )
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

On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> Create a page-table for the IOMMU that shadows the host CPU stage-2
> to establish DMA isolation.
> 
> An initial snapshot is created after the driver init, then
> on every permission change a callback would be called for
> the IOMMU driver to update the page table.
> 
> There are 3 different ways to add the callback:
> 1) In the high level memory transitions: (__pkvm_host_donate_hyp(),
>   __pkvm_host_donate_guest()...
> 
> 2) In Lower level functions covering all transitions
>   - host_stage2_set_owner_metadata_locked() which covers:
>    - __pkvm_host_donate_hyp()
>    - __pkvm_host_donate_guest()
>    - __pkvm_host_donate_hyp()
>    - __pkvm_guest_unshare_host()
>   - host_stage2_set_owner_locked() only for ID_HOST which covers:
>    - __pkvm_hyp_donate_host()
>    - __pkvm_host_force_reclaim_page_guest()
>    - __pkvm_host_reclaim_page_guest()
>    - __pkvm_guest_share_host()
> 
> 3) In the lowest level function __host_update_page_state(), which
>    requires only one callback. However, in that case the page state
>    is not enough as we might need to know the old state also.
> 
> Option #3 was implemented here.
> 
> For some cases, an SMMUv3 may be able to share the same page-table
> used with the host CPU stage-2 directly.
> 
> However, this is too strict and requires changes to the core hypervisor
> page-table code, plus it would require the hypervisor to handle IOMMU
> page-faults. This can be added later as an optimization for SMMUV3.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/iommu.h       |   4 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   2 +
>  arch/arm64/kvm/hyp/nvhe/iommu/iommu.c         | 108 +++++++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  35 ++++++
>  4 files changed, 146 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> index 1ac70cc28a9e..6277d845cdcf 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> @@ -3,11 +3,15 @@
>  #define __ARM64_KVM_NVHE_IOMMU_H__
>  
>  #include <asm/kvm_host.h>
> +#include <asm/kvm_pgtable.h>
>  
>  struct kvm_iommu_ops {
>  	int (*init)(void);
> +	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
>  };
>  
>  int kvm_iommu_init(void);
>  
> +int kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> +				enum kvm_pgtable_prot prot);
>  #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index ff440204d2c7..f7faecc3b70a 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -54,6 +54,8 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct
>  int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
>  
>  bool addr_is_memory(phys_addr_t phys);
> +u64 find_mem_range_from(u64 start, bool *is_memory);
> +
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
>  int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id);
>  int kvm_host_prepare_stage2(void *pgt_pool_base);
> diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> index 406c8fb9b3b9..1db52bd87c38 100644
> --- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> @@ -4,17 +4,119 @@
>   *
>   * Copyright (C) 2022 Linaro Ltd.
>   */
> +#include <linux/iommu.h>
> +
>  #include <nvhe/iommu.h>
> +#include <nvhe/mem_protect.h>
> +#include <nvhe/spinlock.h>
>  
>  /* Only one set of ops supported */
>  struct kvm_iommu_ops *kvm_iommu_ops;
>  
> +/* Protected by host_mmu.lock */
> +static bool kvm_idmap_initialized;
> +
> +static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
> +{
> +	int iommu_prot = 0;
> +
> +	if (prot & KVM_PGTABLE_PROT_R)
> +		iommu_prot |= IOMMU_READ;
> +	if (prot & KVM_PGTABLE_PROT_W)
> +		iommu_prot |= IOMMU_WRITE;
> +
> +	/* We don't understand that, might be dangerous. */
> +	WARN_ON(prot & ~PKVM_HOST_MEM_PROT);
> +	return iommu_prot;
> +}
> +
> +static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
> +				  enum kvm_pgtable_walk_flags visit)
> +{
> +	u64 start = ctx->addr;
> +	u64 end = start + kvm_granule_size(ctx->level);
> +	kvm_pte_t pte = *ctx->ptep;
> +	bool is_memory;
> +	u64 region_end;
> +	int prot;
> +	int ret;
> +
> +	/*
> +	 * Keep annotated PTEs unmapped, and map everything else even lazily
> +	 * mapped MMIO with pte == 0, as the IOMMU can't handle page faults.
> +	 * That maps the whole address space which can be large, but that doesn't
> +	 * use a lot of memory as it will be mostly large block (1 GB with 4kb pages)
> +	 */
> +	if (pte && !kvm_pte_valid(pte))
> +		return 0;
> +
> +	if (kvm_pte_valid(pte)) {
> +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> +		/* If the range is mapped in a single PTE, it must be the same type.*/
> +		if (!addr_is_memory(start))
> +			prot |= IOMMU_MMIO;
> +
> +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);

Do we really need to do that when is_memory()? 

fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
host_stage2_set_owner_locked() should already handle the memory region. That
would also get rid of kvm_idmap_initialized.

So this one here could only take care of the MMIO?

Overall we would have a common point of synchro which is
fix_host_ownership_walker() after which the host ownership is ready for both
CPU stage-2 and the IOMMU?

> +	}
> +
> +	/* In case of invalid PTE, we need to figure out which part of it is MMIO */
> +	do {
> +		prot = IOMMU_READ | IOMMU_WRITE;
> +		region_end = find_mem_range_from(start, &is_memory);
> +		region_end = min(end, region_end);
> +		if (!is_memory)
> +			prot |= IOMMU_MMIO;
> +
> +		ret = kvm_iommu_ops->host_stage2_idmap(start, region_end, prot);
> +		if (ret)
> +			return ret;
> +
> +		start = region_end;
> +	} while (start < end);
> +
> +	return 0;
> +}
> +
> +static int kvm_iommu_snapshot_host_stage2(void)
> +{
> +	int ret;
> +	struct kvm_pgtable_walker walker = {
> +		.cb	= __snapshot_host_stage2,
> +		.flags	= KVM_PGTABLE_WALK_LEAF,
> +	};
> +	struct kvm_pgtable *pgt = &host_mmu.pgt;
> +
> +	hyp_spin_lock(&host_mmu.lock);
> +	ret = kvm_pgtable_walk(pgt, 0, BIT(pgt->ia_bits), &walker);
> +	/* Start receiving calls to host_stage2_idmap. */
> +	kvm_idmap_initialized = !ret;
> +	hyp_spin_unlock(&host_mmu.lock);
> +
> +	return ret;
> +}
>  
>  int kvm_iommu_init(void)
>  {
> -	/* Keep DMA isolation optional. */
> -	if (!kvm_iommu_ops || !kvm_iommu_ops->init)
> +	int ret;
> +
> +	if (!kvm_iommu_ops || !kvm_iommu_ops->init ||
> +	    !kvm_iommu_ops->host_stage2_idmap)
> +		return 0;
> +
> +	ret = kvm_iommu_ops->init();
> +	if (ret)
> +		return ret;
> +
> +	return kvm_iommu_snapshot_host_stage2();
> +}
> +
> +int kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> +				enum kvm_pgtable_prot prot)
> +{
> +	hyp_assert_lock_held(&host_mmu.lock);
> +
> +	if (!kvm_idmap_initialized)
>  		return 0;
>  
> -	return kvm_iommu_ops->init();
> +	return kvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
>  }
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 2fb20a63a417..b54cb72ed88c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -15,6 +15,7 @@
>  #include <hyp/fault.h>
>  
>  #include <nvhe/gfp.h>
> +#include <nvhe/iommu.h>
>  #include <nvhe/memory.h>
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/mm.h>
> @@ -481,6 +482,14 @@ static int check_range_allowed_memory(u64 start, u64 end)
>  	return 0;
>  }
>  
> +u64 find_mem_range_from(u64 start, bool *is_memory)
> +{
> +	struct kvm_mem_range r;
> +
> +	*is_memory = !!find_mem_range(start, &r);
> +	return r.end;
> +}
> +
>  static bool range_is_memory(u64 start, u64 end)
>  {
>  	struct kvm_mem_range r;
> @@ -577,8 +586,34 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
>  
>  static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)

I would really split this. I know that this is convinient, but as the function
says, it only update the page state so it shouldn't hide an update to the IOMMU.

Beside, we have examples already in Android where we want to update the
page-state but not the IOMMU, so it doesn't feel future-proof...

>  {
> +	enum pkvm_page_state old = get_host_state(hyp_phys_to_page(addr));
> +	enum kvm_pgtable_prot prot = 0;
> +
>  	for_each_hyp_page(page, addr, size)
>  		set_host_state(page, state);
> +
> +	/*
> +	 * Any transition to PKVM_NOPAGE, unmaps the page from the host
> +	 * Any transition to PKVM_PAGE_SHARED_BORROWED, maps the page in the host
> +	 * Any transition to PKVM_PAGE_SHARED_OWNED is ignored as page is already mapped.
> +	 * Transitions to PKVM_PAGE_OWNED from anything but PKVM_NOPAGE are ignored.
> +	 * Transitions to PKVM_PAGE_OWNED from PKVM_NOPAGE will map the page.
> +	 */
> +	if ((state == PKVM_PAGE_SHARED_OWNED) ||
> +		((state == PKVM_PAGE_OWNED) && (old != PKVM_NOPAGE)))
> +		return;
> +
> +	if ((state == PKVM_PAGE_SHARED_BORROWED) ||
> +		(state == PKVM_PAGE_OWNED))
> +		prot = PKVM_HOST_MEM_PROT;

... and that would avoid that sort of things here. The caller decides if the IOMMU
is updated or not.

And as the patch says, we "shadow" the host stage2. So probably modifying
host_stage2_idmap and host_stage2_set_owner_metdata() sounds really a better
approach.

> +
> +	/*
> +	 * Only update the IOMMU from here, as MMIO can't transition after
> +	 * de-privilege, that will need to change when device assignment
> +	 * is supported.
> +	 * And WARN on failure as we can't unroll at this point.
> +	 */
> +	WARN_ON(kvm_iommu_host_stage2_idmap(addr, addr + size, prot));

>  }
>  
>  #define KVM_HOST_DONATION_PTE_OWNER_MASK	GENMASK(3, 1)
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

