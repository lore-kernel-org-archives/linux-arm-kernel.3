Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069F3C531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=az69NFcHQRpQtQpk0RYT0bOWRtpe4QIe7DhS238fcTI=; b=mKrmrXkR1bD2FDidyD/mdj4QeU
	c7YB7GBTjBIZRYYRMFaXgri8Vbv8b43cvR0tkqyKKtFx9T1sqR/mRPQEkGlDttIY4FFZJHT3Cr6wq
	mMZzJmStEE3fog9tcBTDVBtvh18nugIe3UncoOFGHckx28kBWToDD/0C0vaC5irmP2QyqUXRJzkjt
	EimDjiPkH+lZNzzbP9znedj4+nMILX8vzOXEkI586ulzzFyLun+Df/C9A1l9rnIGrIpXZhWWtuZwr
	+qpTVzIgOIqCDqX5cNgwNGuKB4D3NXLxaHtjZoRI9wkuPFYgTNt23egIiUBtJWCihSmINuTAH2Hsa
	tn02HF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvMo-0000000Ebgf-2TJ4;
	Thu, 23 Jul 2026 15:29:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvMm-0000000Ebg6-0ssa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:29:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso75725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784820582; x=1785425382; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=az69NFcHQRpQtQpk0RYT0bOWRtpe4QIe7DhS238fcTI=;
        b=SCegs9So72+7QFpnTjgR768pyf/mqMBf3/p/y7FQG9a1xTlXhLj71vENisAUbXM2S3
         ajAILVLOJ3xKKwlD8gUA/SM+qpXV6f5M8kDijFVfr9f8iZVNwAx2HfdrKy4z8YOyDMRx
         ksU6i+wo1AzbVGeUZ1STrvDPW4PYIk1Tb6xV7x40J64ZPFDH85lQiUaX60wLG7VN2ClR
         F/ixkyu7pMTDEYqP9aG5QALVKkdGz1Xzx/kSVVi4ZzxVMaWVX4Q7dEgF40rVRErKmHIw
         l6Pn2olWWY6HQbNu3K6j6alIwBGUW4FAWIZ6lOZQbWo+Y2WhHbjcJBv4eb8ZZDC/D0fC
         wnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820582; x=1785425382;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=az69NFcHQRpQtQpk0RYT0bOWRtpe4QIe7DhS238fcTI=;
        b=iNyynKdfBKHNHPBYIEMUFcSJSDh24I/QkU1BL925AWcCa9p+3y5BKi6+x7/jsmBKnH
         0+yym7f/NtMq+joiEvbdMDPsyC2h/wBn5gbsDBOBpacKWvUj1yk5wKIMbrVwYLZm/+PS
         l+2Oknav6iYSPg/b7Ls910wMs+gWLoEG4XbtgaJhNbn9hFEVPhRFJaFGPq42IutH73a/
         QBit2GNx/Scmg1nHyI3F0+A3o3EK6/D0tqN9jd4wgRSB7f79pPY5gTwvzQoyghhxgBcf
         MVmGecGK0b6uSxEMrMk78gW8vqykO7tuvgl+PcqJihhdM4mYMD9s6OlZM3UKspPi8mlE
         yBRg==
X-Gm-Message-State: AOJu0Yz3eGY6826vuChjlXiGeZ9EjOTnIDZm06t447IoD80zJc2QWPYW
	1HPcKW+sVayLk6O8jRP+BakKGW6wY5Q5uN5Rx/OMsYcovWKj//lIGf96NCgiBlPjyQ==
X-Gm-Gg: AR+sD10YYODTNrxv4KmpTNnZT/WelzQIPnZpmvVnJ3UE1G74aHLuJhFuE5r9R+tx08h
	DgP023to53vsVOyJuFk/z/jp1MQlt0qS4vLnBh67LOwsSLQ09HbU9hqE9JxHiR262eFQw/GlWvq
	DJuIPAiX9ruW56AlifvFJNdNs5F+hljmzelngj5q+ROzC7XkoIbOuvkWo8W/KinyMR4ZuKk6BA5
	K73ptNoNgsB/ybRNtoqmR8u5S5mvmShkWF39Or9A6PlMCPtyMhPOj9MQvNdewd8iwCiDTG+2XGH
	Q1mJqXw+FnlalPSJdS0WJIqis6wqM0r65+1jTYYX9bt6RHGwQuuFApVxxgk5Ri101c6g944TO8D
	7A1fdi2TA1VXTX8UP66Exl4HB2ywqqnNwGqvuqNGWVcve0UtxgZ2memUvgvSi6JRCto7R2xcLxf
	ieLkXnTZVn7LR12yj1CD8BwPnmGq0p97WsIsobJbEmWgw=
X-Received: by 2002:a05:600c:25a:b0:495:4593:616c with SMTP id 5b1f17b1804b1-49573dbe5f0mr1298465e9.1.1784820581451;
        Thu, 23 Jul 2026 08:29:41 -0700 (PDT)
Received: from google.com (145.16.38.34.bc.googleusercontent.com. [34.38.16.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm15860709f8f.24.2026.07.23.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:40 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:29:37 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, keirf@google.com
Subject: Re: [PATCH v7 07/24] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <amIzYUiVWGoepmkG@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-8-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715115906.2664882-8-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_082944_320601_ECE8F3DE 
X-CRM114-Status: GOOD (  44.45  )
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

On Wed, Jul 15, 2026 at 11:58:48AM +0000, Mostafa Saleh wrote:
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
>   - __pkvm_guest_share_host()
> 
> 3) In the lowest level function __host_update_page_state(), which
>    requires only one callback. However, in that case the page state
>    is not enough as we might need to know the old state also.
> 
> Option #2 was implemented here.
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
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   1 +
>  arch/arm64/kvm/hyp/nvhe/iommu.c               | 129 +++++++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  27 ++--
>  4 files changed, 145 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> index df3d0cc5d4db..857d7dd2ebc3 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> @@ -3,11 +3,15 @@
>  #define __ARM64_KVM_NVHE_IOMMU_H__
>  
>  #include <asm/kvm_host.h>
> +#include <asm/kvm_pgtable.h>
>  
>  struct pkvm_iommu_ops {
>  	int (*init)(void);
> +	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);

Hi Mostafa,

Maybe host_stage2_idmap_locked, since it is invoked while the host
stage-2 lock is acquired ?

>  };
>  
>  int pkvm_iommu_init(void);
>  
> +int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> +				 enum kvm_pgtable_prot prot);
>  #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 51b0eb3844a9..99b821b3cf65 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -59,6 +59,7 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct
>  int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
>  
>  bool addr_is_memory(phys_addr_t phys);
> +
>  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
>  int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id);
>  int kvm_host_prepare_stage2(void *pgt_pool_base);
> diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
> index ef456eff42d2..08009609ec59 100644
> --- a/arch/arm64/kvm/hyp/nvhe/iommu.c
> +++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
> @@ -4,16 +4,137 @@
>   *
>   * Copyright (C) 2022 Linaro Ltd.
>   */
> +#include <linux/iommu.h>
> +#include <asm/kvm_pkvm.h>
> +
>  #include <nvhe/iommu.h>
> +#include <nvhe/mem_protect.h>
> +#include <nvhe/spinlock.h>
>  
>  /* Only one set of ops supported */
>  struct pkvm_iommu_ops *pkvm_iommu_ops;
>  
> -int pkvm_iommu_init(void)
> +/* Protected by host_mmu.lock */
> +static bool pkvm_idmap_initialized;
> +
> +static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
>  {
> -	/* Keep DMA isolation optional. */
> -	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init)
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
> +/*
> + * IOMMU page tables are shadowed and not shared, that is mainly because:
> + * - Possible inconsistency between IOMMU and CPU features or format.
> + * - KVM relies on handling in page faults (BBM, lazy mapping).
> + */
> +static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
> +				  enum kvm_pgtable_walk_flags visit)
> +{
> +	u64 start = ctx->addr;
> +	u64 block_end = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level)) +
> +			kvm_granule_size(ctx->level);
> +	u64 end = min(ctx->end, block_end);
> +	kvm_pte_t pte = *ctx->ptep;
> +	bool is_memory = *(bool *)ctx->arg;
> +	int prot;
> +
> +	/*
> +	 * Keep annotated PTEs unmapped, and map everything else even lazily
> +	 * mapped PTEs(0), as the IOMMU can't handle page faults.
> +	 * That maps the whole address space which can be large, but that doesn't
> +	 * use a lot of memory as it will be mostly large block (1 GB with 4kb pages)
> +	 */
> +	if (pte && !kvm_pte_valid(pte))
>  		return 0;

>  
> -	return pkvm_iommu_ops->init();
> +	if (kvm_pte_valid(pte))
> +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> +	else
> +		prot = IOMMU_READ | IOMMU_WRITE;

If it's invalid in the host stage-2 why do you make it read/write in the IOMMU
? Shouldn't it be an invalid descriptor in the IOMMU pagetables as well
?

> +
> +	if (!is_memory)
> +		prot |= IOMMU_MMIO;
> +
> +	return pkvm_iommu_ops->host_stage2_idmap(start, end, prot);
> +}
> +
> +static int pkvm_iommu_snapshot_host_stage2(void)
> +{
> +	struct kvm_pgtable *pgt = &host_mmu.pgt;
> +	bool is_memory;
> +	struct kvm_pgtable_walker walker = {
> +		.cb	= __snapshot_host_stage2,
> +		.flags	= KVM_PGTABLE_WALK_LEAF,
> +		.arg	= &is_memory,
> +	};
> +	int ret = 0, i;
> +	u64 start = 0;
> +
> +	hyp_spin_lock(&host_mmu.lock);
> +	for (i = 0; i < hyp_memblock_nr; i++) {
> +		struct memblock_region *reg = &hyp_memory[i];
> +
> +		if (start < reg->base) {
> +			is_memory = false;
> +			ret = kvm_pgtable_walk(pgt, start, reg->base - start, &walker);
> +			if (ret)
> +				goto out_unlock;
> +		}
> +
> +		is_memory = true;
> +		ret = kvm_pgtable_walk(pgt, reg->base, reg->size, &walker);
> +		if (ret)
> +			goto out_unlock;
> +
> +		start = reg->base + reg->size;
> +	}
> +
> +	if (start < BIT(pgt->ia_bits)) {
> +		is_memory = false;
> +		ret = kvm_pgtable_walk(pgt, start, BIT(pgt->ia_bits) - start, &walker);
> +		if (ret)
> +			goto out_unlock;
> +	}
> +
> +	pkvm_idmap_initialized = true;
> +
> +out_unlock:
> +	hyp_spin_unlock(&host_mmu.lock);
> +	return ret;
> +}
> +
> +int pkvm_iommu_init(void)
> +{
> +	int ret;
> +
> +	/* Keep DMA isolation optional. */
> +	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init ||
> +	    !pkvm_iommu_ops->host_stage2_idmap)
> +		return 0;

Shouldn't this scream or return not supported ? 

> +
> +	ret = pkvm_iommu_ops->init();
> +	if (ret)
> +		return ret;
> +
> +	return pkvm_iommu_snapshot_host_stage2();

If pkvm_iommu_snapshot_host_stage2() fails would you have to provide a
->deinit() corresponding callback ?

> +}
> +
> +int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> +				enum kvm_pgtable_prot prot)
> +{
> +	hyp_assert_lock_held(&host_mmu.lock);
> +
> +	if (!pkvm_idmap_initialized)
> +		return 0;
> +
> +	return pkvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
>  }
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index d803b3dd4cb4..ce610274bda0 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -17,6 +17,7 @@
>  
>  #include <nvhe/arm-smccc.h>
>  #include <nvhe/gfp.h>
> +#include <nvhe/iommu.h>
>  #include <nvhe/memory.h>
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/mm.h>
> @@ -596,16 +597,15 @@ static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
>  	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
>  			      addr, size, &host_s2_pool,
>  			      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
> -	if (!ret) {
> -		/*
> -		 * After stage2 maintenance has happened, but before the page
> -		 * owner has changed.
> -		 */
> -		pkvm_sme_dvmsync_fw_call();
> -		__host_update_page_state(addr, size, PKVM_NOPAGE);
> -	}
> -
> -	return ret;
> +	if (ret)
> +		return ret;
> +	/*
> +	 * After stage2 maintenance has happened, but before the page
> +	 * owner has changed.
> +	 */
> +	pkvm_sme_dvmsync_fw_call();
> +	__host_update_page_state(addr, size, PKVM_NOPAGE);
> +	return pkvm_iommu_host_stage2_idmap(addr, addr + size, 0);
>  }
>  
>  int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
> @@ -618,8 +618,10 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
>  			return -EPERM;
>  
>  		ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
> -		if (!ret)
> -			__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
> +		if (ret)
> +			break;
> +		__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
> +		ret = pkvm_iommu_host_stage2_idmap(addr, addr + size, PKVM_HOST_MEM_PROT);
>  		break;
>  	case PKVM_ID_HYP:
>  		ret = host_stage2_set_owner_metadata_locked(addr, size,
> @@ -1022,6 +1024,7 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
>  				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
>  				       &vcpu->vcpu.arch.pkvm_memcache, 0));
>  	WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
> +	WARN_ON(pkvm_iommu_host_stage2_idmap(phys, phys + PAGE_SIZE, PKVM_HOST_MEM_PROT));
>  unlock:
>  	guest_unlock_component(vm);
>  	host_unlock_component();
> -- 
> 2.55.0.141.g00534a21ce-goog
> 

