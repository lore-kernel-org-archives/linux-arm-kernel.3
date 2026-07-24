Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D03C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQTURpMAeObF7dJ+XksltfWeYZ6LOjkjOUPDqZ3O/F4=; b=iao3uZYbMZ2qU0DqCReoOajGDb
	iX5iUPno9qSN6xLK3Y3d9v2Yuh/5yL/JS5zF2nd9G6LQ4SvGbPp/jb/qnRR7NztgaJLuApWmBJVpR
	OTxaM9lNuxwerVlob/cL+xl92tU78O5WiVmXM6lU2IcmpPx6W6voxFRtQUJP+Yib8vh/Cq+0CAOvN
	qaJMpGJlJr08KAZ+ybSzGCCoILUFSfRY0p2vmzmM02YpOFwj6zXZAz3vM76QibWCeXkvT+BNqR2dg
	sB/SxVbYtTaUdV4vbNzCMYoSYZ47CUMb5Esgo4jSJErr6YjvOvonRc04HdpAiEgWgzylOeoGnTQuF
	cnGWzYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAM9-0000000FhiV-1DK8;
	Fri, 24 Jul 2026 07:30:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAM6-0000000Fhi5-3dND
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:30:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954bb689dfso14155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784878201; x=1785483001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FQTURpMAeObF7dJ+XksltfWeYZ6LOjkjOUPDqZ3O/F4=;
        b=ogp+DNthPgXxj0pWPYDNhiZrS76iFITn9+4+SlDEzHXprFSkbR4MgBBP/1T/BXpCIj
         UA5toW3M6KKWfi+dPgPjQoEVk642HPwuKzDpuNazv5/bt7S0SlPTfixhDfqZKVWN+DPf
         Cw/46eTUsUSOaW4CQijkYvDbeVksa1tcNSjcfEVADdTz7W1d20OMbiE2OgKV86YQbLBZ
         wQlFk3PM31zi0oDlUpghIrDBzSUI8Af2PdinFLa/13EPexWBJOpguUuTFyXuLAe2BtdW
         yyZe1Hq/RWg63oeKMStYDGz8uJrij9mhH71/RytA3pF+YROYUTNL0KpSDR37JlJPcmfC
         PhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784878201; x=1785483001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQTURpMAeObF7dJ+XksltfWeYZ6LOjkjOUPDqZ3O/F4=;
        b=dOr6m1DoCIOWg1F3P/MmnZSVYp1DIIhLbAp/ojtSLx2rPvbOKDcR6QBH4Qcr+PA1i9
         R5AmfgWHqEyBUukpRNgpl/q2r6VZ2rDf3+aQmZzfEZuLPYWQgWW2CaX8VRYcVb7xf+OV
         vD9MeoGEydEm2/fg/Hjns7r1CfyzPLLfrysYthvlgPbBjOCp7kSVCQPBt+/omAttP0Ob
         vvIcf8B8GiDgyJnpZ69Eqlc8ngHiPbSf75m+42Il8irEwbq7nk4rG+9AivjTyIG6rtfJ
         frEEnB4W3YExaakB+FCPM+cjYZvP9U0BEz/O0hY0/Xj9nlu1sAkL9LLvXeF87pXuZqTQ
         Mcrw==
X-Gm-Message-State: AOJu0YyD3kSRmGhqoQBOVJvVbs7+vp2EDWgKxbzxoQw0jCQ+Nqp46w6D
	yN/rnnn9M2AJZHObjKwIFnX5+9wWsPKSX2hiZ0Z+RqttUGA9NrsvZzVJbtSiSXpiTA==
X-Gm-Gg: AR+sD12U+z4NmskVibmNF5YN2LdAMMFxunp4Mhz5mjQWH/aEqx7RmwnInO+t87Zkl/0
	v4Whbj+CgoPJSoS8xSetS7er4QKgEXZ9msK+bD+eCpRONEsyh3CPMCdzmMVw5Uki41cFO0cjCPl
	gQ4u1zi12fTcYQSQbT/9EMQPGhwk2ttT0h4kjie7vaqSGYYbYWgY6588UubHVOAK2JYqUCYcDc4
	B/34KVmM+/jr8K+aTIAjJvQUrRFLhmR3w5R5UJmr1RyEI6rEDhWZfBSZBMFiDgVGIlKNE6D09xD
	utt5rtN/39pPS7GSk5MHf+PUSiDsdGLFXJEhw7Wsryko2cV2H1HJ1gFCd/C6vPDqHAdrCitz+M6
	3+KQQui2Fa1pUdgbQ7dTRY5hQrjeEh2zxxHgcRddDxkhU9W+iBjuHF6KBsBU++hZzoJM+GXCD3z
	lmUWqPjfRS2kKnR0vCynEPWSJU10RlaX/K7sB+fksbQHzh1mD1
X-Received: by 2002:a05:600c:5354:b0:493:b169:784d with SMTP id 5b1f17b1804b1-4957bce335cmr934215e9.8.1784878200153;
        Fri, 24 Jul 2026 00:30:00 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531basm21931338f8f.19.2026.07.24.00.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:29:59 -0700 (PDT)
Date: Fri, 24 Jul 2026 07:29:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, keirf@google.com
Subject: Re: [PATCH v7 07/24] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <amMUc79daKqAGNFM@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-8-smostafa@google.com>
 <amIzYUiVWGoepmkG@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amIzYUiVWGoepmkG@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_003002_979393_FA735EDF 
X-CRM114-Status: GOOD (  38.22  )
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

Hi Seb,

On Thu, Jul 23, 2026 at 03:29:37PM +0000, Sebastian Ene wrote:
> On Wed, Jul 15, 2026 at 11:58:48AM +0000, Mostafa Saleh wrote:
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> > index df3d0cc5d4db..857d7dd2ebc3 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> > @@ -3,11 +3,15 @@
> >  #define __ARM64_KVM_NVHE_IOMMU_H__
> >  
> >  #include <asm/kvm_host.h>
> > +#include <asm/kvm_pgtable.h>
> >  
> >  struct pkvm_iommu_ops {
> >  	int (*init)(void);
> > +	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
> 
> Hi Mostafa,
> 
> Maybe host_stage2_idmap_locked, since it is invoked while the host
> stage-2 lock is acquired ?

Vincent mentioned in earlier version that it can be called idmap()
also, I believe as this is not a function but a pointer, we do not
have over descirbe the name, but no strong opionion.

> 
> >  };
> >  
> >  int pkvm_iommu_init(void);
> >  
> > +int pkvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> > +				 enum kvm_pgtable_prot prot);
> >  #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 51b0eb3844a9..99b821b3cf65 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -59,6 +59,7 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct
> >  int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
> >  
> >  bool addr_is_memory(phys_addr_t phys);
> > +
> >  int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
> >  int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id);
> >  int kvm_host_prepare_stage2(void *pgt_pool_base);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
> > index ef456eff42d2..08009609ec59 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/iommu.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
> > @@ -4,16 +4,137 @@
> >   *
> >   * Copyright (C) 2022 Linaro Ltd.
> >   */
> > +#include <linux/iommu.h>
> > +#include <asm/kvm_pkvm.h>
> > +
> >  #include <nvhe/iommu.h>
> > +#include <nvhe/mem_protect.h>
> > +#include <nvhe/spinlock.h>
> >  
> >  /* Only one set of ops supported */
> >  struct pkvm_iommu_ops *pkvm_iommu_ops;
> >  
> > -int pkvm_iommu_init(void)
> > +/* Protected by host_mmu.lock */
> > +static bool pkvm_idmap_initialized;
> > +
> > +static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
> >  {
> > -	/* Keep DMA isolation optional. */
> > -	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init)
> > +	int iommu_prot = 0;
> > +
> > +	if (prot & KVM_PGTABLE_PROT_R)
> > +		iommu_prot |= IOMMU_READ;
> > +	if (prot & KVM_PGTABLE_PROT_W)
> > +		iommu_prot |= IOMMU_WRITE;
> > +
> > +	/* We don't understand that, might be dangerous. */
> > +	WARN_ON(prot & ~PKVM_HOST_MEM_PROT);
> > +	return iommu_prot;
> > +}
> > +
> > +/*
> > + * IOMMU page tables are shadowed and not shared, that is mainly because:
> > + * - Possible inconsistency between IOMMU and CPU features or format.
> > + * - KVM relies on handling in page faults (BBM, lazy mapping).
> > + */
> > +static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
> > +				  enum kvm_pgtable_walk_flags visit)
> > +{
> > +	u64 start = ctx->addr;
> > +	u64 block_end = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level)) +
> > +			kvm_granule_size(ctx->level);
> > +	u64 end = min(ctx->end, block_end);
> > +	kvm_pte_t pte = *ctx->ptep;
> > +	bool is_memory = *(bool *)ctx->arg;
> > +	int prot;
> > +
> > +	/*
> > +	 * Keep annotated PTEs unmapped, and map everything else even lazily
> > +	 * mapped PTEs(0), as the IOMMU can't handle page faults.
> > +	 * That maps the whole address space which can be large, but that doesn't
> > +	 * use a lot of memory as it will be mostly large block (1 GB with 4kb pages)
> > +	 */
> > +	if (pte && !kvm_pte_valid(pte))
> >  		return 0;
> 
> >  
> > -	return pkvm_iommu_ops->init();
> > +	if (kvm_pte_valid(pte))
> > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > +	else
> > +		prot = IOMMU_READ | IOMMU_WRITE;
> 
> If it's invalid in the host stage-2 why do you make it read/write in the IOMMU
> ? Shouldn't it be an invalid descriptor in the IOMMU pagetables as well
> ?
> 

These are invalid and empty PTEs as a few lines up we return early for
invalid non-empty ones. For the empty PTEs, they are owned by the host
but lazily mapped. The IOMMU page table need to eagrly map those as it
can not handle page faults like the CPU.

> > +
> > +	if (!is_memory)
> > +		prot |= IOMMU_MMIO;
> > +
> > +	return pkvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > +}
> > +
> > +static int pkvm_iommu_snapshot_host_stage2(void)
> > +{
> > +	struct kvm_pgtable *pgt = &host_mmu.pgt;
> > +	bool is_memory;
> > +	struct kvm_pgtable_walker walker = {
> > +		.cb	= __snapshot_host_stage2,
> > +		.flags	= KVM_PGTABLE_WALK_LEAF,
> > +		.arg	= &is_memory,
> > +	};
> > +	int ret = 0, i;
> > +	u64 start = 0;
> > +
> > +	hyp_spin_lock(&host_mmu.lock);
> > +	for (i = 0; i < hyp_memblock_nr; i++) {
> > +		struct memblock_region *reg = &hyp_memory[i];
> > +
> > +		if (start < reg->base) {
> > +			is_memory = false;
> > +			ret = kvm_pgtable_walk(pgt, start, reg->base - start, &walker);
> > +			if (ret)
> > +				goto out_unlock;
> > +		}
> > +
> > +		is_memory = true;
> > +		ret = kvm_pgtable_walk(pgt, reg->base, reg->size, &walker);
> > +		if (ret)
> > +			goto out_unlock;
> > +
> > +		start = reg->base + reg->size;
> > +	}
> > +
> > +	if (start < BIT(pgt->ia_bits)) {
> > +		is_memory = false;
> > +		ret = kvm_pgtable_walk(pgt, start, BIT(pgt->ia_bits) - start, &walker);
> > +		if (ret)
> > +			goto out_unlock;
> > +	}
> > +
> > +	pkvm_idmap_initialized = true;
> > +
> > +out_unlock:
> > +	hyp_spin_unlock(&host_mmu.lock);
> > +	return ret;
> > +}
> > +
> > +int pkvm_iommu_init(void)
> > +{
> > +	int ret;
> > +
> > +	/* Keep DMA isolation optional. */
> > +	if (!pkvm_iommu_ops || !pkvm_iommu_ops->init ||
> > +	    !pkvm_iommu_ops->host_stage2_idmap)
> > +		return 0;
> 
> Shouldn't this scream or return not supported ? 
> 

This was the case in the earlier versions, but I figured it would
regress so many setups, so I made DMA isolation optinal for now, I
think long term this can be a cmdline option. But t's up to the
maintainers how do they want to support this. I am happy to bring
the error return back.

> > +
> > +	ret = pkvm_iommu_ops->init();
> > +	if (ret)
> > +		return ret;
> > +
> > +	return pkvm_iommu_snapshot_host_stage2();
> 
> If pkvm_iommu_snapshot_host_stage2() fails would you have to provide a
> ->deinit() corresponding callback ?
> 

Good point, I tried to avoid having a deinit by making the IOMMU the
last thing done during setup as I did not want to make the patches
bigger.

Maybe WARN_ON() is enough for now? I need to think more about it.

Thanks,
Mostafa

