Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D379BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 17:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0V1FTARVtoHKDhD2y26WaLiZ0OdS9Qk3q3wsxYlCeSQ=; b=j0jIy3dBfCpc7P9Nh6/m8myG2p
	KeiX6IvXxwLUVoBskiZSzt0qrrZEp9DjvFAlQ5NLA7ctT1MB2LjULSqwM7w3QajCkN6pZtgRECXJR
	F5pTmnRCGawBZpuGeBxGviapKI+QWW9g3csGjhzSX27S6yB/ffceou0PxJRdm5T4X2DaysXizasjD
	jDrluKkE4Ch+gqsmuhDql95GJHBMRLjPWYOMyn1JtnPSfYzqWAUQxd4sW3IjYx/BdwhfkFIxOX5pG
	QTnS2r4yYFJzZGccIDOOMKv41gOEQk4KFG/z78oy1mIhvqZT4bBtpY83o3Pv888bITOTHZIhV8Aor
	aCLmDHvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3qc-0000000Fbc4-3fbB;
	Wed, 15 Jul 2026 17:56:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3qa-0000000FbbO-1dt7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 17:56:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso34185235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784138198; x=1784742998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0V1FTARVtoHKDhD2y26WaLiZ0OdS9Qk3q3wsxYlCeSQ=;
        b=BxKYEDRJAvynEMXq/yC0YSyhh1oq2V+3hEY9vrEOVEJLldzQa9wPrtbo7EKpBV1usX
         rl50Om8RFelXBNo60m8ZysDYEm8cMTo3kr8iPzP3NIknvxIdctGOjQzLAxwztkFT7zKM
         3XyntFK4heD0HSd2xztVgFcDfIEx/VPup2o4+n3Tnih+8CWlNKdbOaRLujMJgfve1/xf
         yABZSLxrdfWyxQFPlOeFC3EWnMMmW4joSRgOrkQIVzcBb46n9DOUlNmWPlUVdBtbpJov
         2dkIlNdrzGVgqeX1vgPCakrWqaWlhO+rXSK6wAEib3wjAZTwFsFbSpzMLN7j+t4K7N3J
         zChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138198; x=1784742998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V1FTARVtoHKDhD2y26WaLiZ0OdS9Qk3q3wsxYlCeSQ=;
        b=Maxx/eTSYG+WhpLX4C97tYTJUc8mBdCW6vSn1WB3PishsknU/VJ5MtIj3HLZZoz4Gj
         Nub3CdM79hZ9sIZVqXaRZBbNr6LizKxl7WslmEAXN1etRO31CLzTFGOAGpG5T4TLYZtc
         o59J/XI0iZgjSlaWytORJoCXdgTdnwA+5wmrTAMKsvCq8hXRTlPk1mQ8Nz9OyDzl6aKh
         GE2YB6BI1HZR505tP5Vbm+226JF3ApjPCxd1f6sbXVCIHFFWISt6LB6Xar+2+O2qE5ga
         x840+5ck9pbwemLJjkAlkWeLJtgkGC2JD1rbBz+GjW6cv1Sgino0LWYis6fXSBbOJYX3
         /srQ==
X-Gm-Message-State: AOJu0YzgJdlgn+UhwbxwpmMY0wleKbCO1pSIUIIzlp9f1Ogch5k2vqKn
	EuX8Pxg0bLT229nyzpLarGFT75y2DX/B/llm+1Szhjy3esgyJ1xVoXd6ZKTA2T8w9g==
X-Gm-Gg: AfdE7clX99H+nYo60A47eFI/azJgNzVQ1DlNy1vohsyoBgCb4iPG+jXzYVGFFMcgvxi
	SQon/nUOzmc6rOolBeelCmXnrh0D4VAxYYR9aqgDXaap4RpRB+6WNparKvJu3OfnVQiE7Ymem3W
	RZMRNW9lz52C0VqvwYnyJGg/xLlOZig6GvCc7q0o1vtZZ4UCUwVqRt9DL4WZRMpzDgPB5IibnfR
	Pv01w5+cnyJdTbqpNk610FWVNxgyrJM1jSMOSOD2Z1cYrgHGFXmsfpTjNhgzYnz49QlxuFktICb
	sRLbyeEo99LfHh4rBd3iZ38kmRh7c1aTuWCWV6ZZtnE1jBUhAdfyEYKbKtR963Qdm1Uk6S9jsRa
	imsgGLdl0+4jk360gtnJtDPrkom2770Rt1HD0DAoRYwpB9mgHBF7AkOieVVmoBmshDrmUPXP2/M
	JfdYm+LXXTY22uEc3yd8XCdxtWW0o5jAWD7As6bJP3yXDbSoIjjZg=
X-Received: by 2002:a05:600c:a00b:b0:493:f261:d295 with SMTP id 5b1f17b1804b1-4953f1552bfmr26635515e9.4.1784138197915;
        Wed, 15 Jul 2026 10:56:37 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508728019sm163467455e9.5.2026.07.15.10.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:56:36 -0700 (PDT)
Date: Wed, 15 Jul 2026 18:56:33 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 07/24] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alfJ0cLRSw-qmCrP@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-8-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715115906.2664882-8-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_105640_499699_69A98CEE 
X-CRM114-Status: GOOD (  46.84  )
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

nit: I believe that for more complex init like that we should just put it after
the declarations.

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

nit: You could have a helper? So is_memory isn't passed as a reference.

__snapshot_host_stage2(u64 start, u64 end, bool is_memory)

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
> +
> +	ret = pkvm_iommu_ops->init();
> +	if (ret)
> +		return ret;
> +
> +	return pkvm_iommu_snapshot_host_stage2();
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

Out of curiosity, why is it "host_stage2_idmap" and not just "idmap" ?

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

On error here the host stage-2 annotation needs to be reverted. Or just
WARN_ON() here. It also probably better to do it before the page-state has
changed, even if we hold the host stage-2 lock.

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

Ha ok I understand your remark yesterday. I thought you'd put
pkvm_iommu_host_stage2_idmap() into host_stage2_idmap_locked()... but then it
means it tries to map on very host abort. 

(same though as host_stage2_set_owner_metadata_locked(), I would first update
the iommu and then update the page-state)

>  unlock:
>  	guest_unlock_component(vm);
>  	host_unlock_component();
> -- 
> 2.55.0.141.g00534a21ce-goog
> 

