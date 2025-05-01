Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1149BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 00:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZb7eMkJRyx/Lus2IgqKmamTgxXPWBKqlzSs8f4bCVI=; b=mIA2zcp4lE4P2cJKVFndgiwTdx
	o2kSf2Y9JmWFDtHDJvOaa8UumS70XcNZliCFGu/yjLTBzZ4pek0Z2pd3eGj2OVmHlv1H0QklA3RC/
	Ei6C64qTnxsBI8ErXvlDhE3Wff8FdqUdfWHk3hiq3cNcGSJBgus5pLLwzyeKDQ+NT8oWb/YaG/K5R
	Do3/uG6l2WlY+nUrJztb+eevqCDns2mNhDfnK3nM2dsKdxK00WispaoNh7fCq/3VSuUT1f4eWZ0Jf
	dZoAU1J1hKbgKlcFnxPogNyPVOYyb3NzRaoLnEEwtf9KRlReZjCXrO7BAeEcCBus834/0VodvNwXw
	KdBdA2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAHdj-0000000EIb4-16km;
	Thu, 01 May 2025 00:18:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAHbn-0000000EITH-1SL1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 00:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746058615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZb7eMkJRyx/Lus2IgqKmamTgxXPWBKqlzSs8f4bCVI=;
	b=XqaJKy3DRaF9pwN2f7oOzERmzPP0ljyQbb9n7ReMZJDmBExhSs/qKB83liINtTIliNaKg/
	2HLa8zg5NZ/9R3qGi9wldfehGLRu8xC2NQ4o9lLAV0BnS1uYjVptJzE2sz8EVoiEFrne2s
	peOaUB7wsrTSRlY8K0cjGvPKVkRMMTc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-3Ts2B419P_OR_wd3ySNL2g-1; Wed, 30 Apr 2025 20:16:51 -0400
X-MC-Unique: 3Ts2B419P_OR_wd3ySNL2g-1
X-Mimecast-MFC-AGG-ID: 3Ts2B419P_OR_wd3ySNL2g_1746058608
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3085f5855c4so418463a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 17:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746058608; x=1746663408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZb7eMkJRyx/Lus2IgqKmamTgxXPWBKqlzSs8f4bCVI=;
        b=dVzcgrUrJDPhtcj85vOz+8GBK1jMh5gy2MQYKYxqki7sxFNcZmtJVvJK2HtHxr+AZ9
         l9b85GNyRdtnsVZs4wSgcEnX4IwahRXKltyw0QR4s+4QhOq5DIi92BhtwxJ03bV6ZkXI
         3Ok77kEhCfmmB40Cvda36OeyuBrWJLx++NLwp4/JCWhWcBwY0lUNCP85zbdq74MyYRJL
         2yJoqEfgqGDlV2swLZLmkTr22XTPtN5EgiGSlWt8MToyuSmdLWygYAZe7Nj4m7uF7g/t
         DGwvQJH3P5pVjkSurQzO2CUAYMIHt9QNBE4MfaiPe5kJ3ta33pIL3hg3qBUxsErDY0X3
         biyg==
X-Forwarded-Encrypted: i=1; AJvYcCVvIuTLgRG4xKxYY1KwCukLMKCtITkHZEPqWEZqjbv8My6u8l84prflXTZXoI56XXef/cnFswI2BKjblqFOlo/2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Hb7gcKaK6IjZJMwsd+yxMkrn84qq3jtEou5UbOmseEr0Quk/
	fecn22LXwUjanYZ/Xhc+LZtpbvr0KhInZYjCeR1wD0RcEN6sgmFOfi1tWzJcYGBP3HqT/BrUX4f
	zcohb/tNua7Uaj883uDrqDNf+rIq2urvflqI6KmNlDATs/b4WUeid9On8Jfj5Shsp7gFH8Nvl
X-Gm-Gg: ASbGncv835fcHnzAnnrxPGTyOGDcGwd9xC3xKU6cqp7y1JDGHyEt1KW1DeF4iA4wl1Z
	Wge07wa+sHv8/oqmERhCadDf1Q1WJCSuYoWDgNpbvKCBFhU90sI8IOp6DxJFrITZsHu28haPSXi
	NtF92J7f0TZy2XoCqx9jvVxVRw7amL7h94lrmci8Y4tr/CMPoWjBd6/H3nLXq0vUtmqy8Ktl3Fc
	Z3FyhRHsYJXoZ8KBmPiaAA8N1bJ4ZzKxzHqhK8Cl14scVBtpgAhHFsuYHHbow7O8vo+uxXv2Lxx
	956aws4SNrxS
X-Received: by 2002:a17:90b:544e:b0:2ff:5a9d:937f with SMTP id 98e67ed59e1d1-30a3335f521mr8269807a91.24.1746058607776;
        Wed, 30 Apr 2025 17:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0+5LsVstlB0oWs/emtPEk9ieFB3kYXVq8522/16fp81LD4gGp0OBkwBulVxLtIQwxremaeQ==
X-Received: by 2002:a17:90b:544e:b0:2ff:5a9d:937f with SMTP id 98e67ed59e1d1-30a3335f521mr8269777a91.24.1746058607287;
        Wed, 30 Apr 2025 17:16:47 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349ffe38sm2311087a91.12.2025.04.30.17.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 17:16:46 -0700 (PDT)
Message-ID: <c99b408c-3819-482a-a427-68045211e434@redhat.com>
Date: Thu, 1 May 2025 10:16:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/43] arm64: RME: Runtime faulting of memory
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-21-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-21-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5LPPOkQ3Qf7rJw1-2_sDZcRxK6DlVm502ZoQ6f_vaxk_1746058608
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_171659_562888_7EC8AAEB 
X-CRM114-Status: GOOD (  43.17  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
> At runtime if the realm guest accesses memory which hasn't yet been
> mapped then KVM needs to either populate the region or fault the guest.
> 
> For memory in the lower (protected) region of IPA a fresh page is
> provided to the RMM which will zero the contents. For memory in the
> upper (shared) region of IPA, the memory from the memslot is mapped
> into the realm VM non secure.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Remove redundant WARN_ONs for realm_create_rtt_levels() - it will
>     internally WARN when necessary.
> Changes since v6:
>   * Handle PAGE_SIZE being larger than RMM granule size.
>   * Some minor renaming following review comments.
> Changes since v5:
>   * Reduce use of struct page in preparation for supporting the RMM
>     having a different page size to the host.
>   * Handle a race when delegating a page where another CPU has faulted on
>     a the same page (and already delegated the physical page) but not yet
>     mapped it. In this case simply return to the guest to either use the
>     mapping from the other CPU (or refault if the race is lost).
>   * The changes to populate_par_region() are moved into the previous
>     patch where they belong.
> Changes since v4:
>   * Code cleanup following review feedback.
>   * Drop the PTE_SHARED bit when creating unprotected page table entries.
>     This is now set by the RMM and the host has no control of it and the
>     spec requires the bit to be set to zero.
> Changes since v2:
>   * Avoid leaking memory if failing to map it in the realm.
>   * Correctly mask RTT based on LPA2 flag (see rtt_get_phys()).
>   * Adapt to changes in previous patches.
> ---
>   arch/arm64/include/asm/kvm_emulate.h |  10 ++
>   arch/arm64/include/asm/kvm_rme.h     |  10 ++
>   arch/arm64/kvm/mmu.c                 | 127 ++++++++++++++++++-
>   arch/arm64/kvm/rme.c                 | 180 +++++++++++++++++++++++++++
>   4 files changed, 321 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index c803c8188d9c..def439d6d732 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -704,6 +704,16 @@ static inline bool kvm_realm_is_created(struct kvm *kvm)
>   	return kvm_is_realm(kvm) && kvm_realm_state(kvm) != REALM_STATE_NONE;
>   }
>   
> +static inline gpa_t kvm_gpa_from_fault(struct kvm *kvm, phys_addr_t ipa)
> +{
> +	if (kvm_is_realm(kvm)) {
> +		struct realm *realm = &kvm->arch.realm;
> +
> +		return ipa & ~BIT(realm->ia_bits - 1);
> +	}
> +	return ipa;
> +}
> +
>   static inline bool vcpu_is_rec(struct kvm_vcpu *vcpu)
>   {
>   	if (static_branch_unlikely(&kvm_rme_is_available))
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index d86051ef0c5c..47aa6362c6c9 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -108,6 +108,16 @@ void kvm_realm_unmap_range(struct kvm *kvm,
>   			   unsigned long ipa,
>   			   unsigned long size,
>   			   bool unmap_private);
> +int realm_map_protected(struct realm *realm,
> +			unsigned long base_ipa,
> +			kvm_pfn_t pfn,
> +			unsigned long size,
> +			struct kvm_mmu_memory_cache *memcache);
> +int realm_map_non_secure(struct realm *realm,
> +			 unsigned long ipa,
> +			 kvm_pfn_t pfn,
> +			 unsigned long size,
> +			 struct kvm_mmu_memory_cache *memcache);
>   
>   static inline bool kvm_realm_is_private_address(struct realm *realm,
>   						unsigned long addr)
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 71c04259e39f..02b66ee35426 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -338,8 +338,13 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
>   
>   	lockdep_assert_held_write(&kvm->mmu_lock);
>   	WARN_ON(size & ~PAGE_MASK);
> -	WARN_ON(stage2_apply_range(mmu, start, end, KVM_PGT_FN(kvm_pgtable_stage2_unmap),
> -				   may_block));
> +
> +	if (kvm_is_realm(kvm))
> +		kvm_realm_unmap_range(kvm, start, size, !only_shared);
> +	else
> +		WARN_ON(stage2_apply_range(mmu, start, end,
> +					   KVM_PGT_FN(kvm_pgtable_stage2_unmap),
> +					   may_block));
>   }
>   

As spotted previsouly, the parameter @may_block isn't handled by kvm_realm_unmap_range().

>   void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
> @@ -359,7 +364,10 @@ static void stage2_flush_memslot(struct kvm *kvm,
>   	phys_addr_t addr = memslot->base_gfn << PAGE_SHIFT;
>   	phys_addr_t end = addr + PAGE_SIZE * memslot->npages;
>   
> -	kvm_stage2_flush_range(&kvm->arch.mmu, addr, end);
> +	if (kvm_is_realm(kvm))
> +		kvm_realm_unmap_range(kvm, addr, end - addr, false);
> +	else
> +		kvm_stage2_flush_range(&kvm->arch.mmu, addr, end);
>   }
>   
>   /**
> @@ -1053,6 +1061,10 @@ void stage2_unmap_vm(struct kvm *kvm)
>   	struct kvm_memory_slot *memslot;
>   	int idx, bkt;
>   
> +	/* For realms this is handled by the RMM so nothing to do here */
> +	if (kvm_is_realm(kvm))
> +		return;
> +
>   	idx = srcu_read_lock(&kvm->srcu);
>   	mmap_read_lock(current->mm);
>   	write_lock(&kvm->mmu_lock);
> @@ -1078,6 +1090,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>   	if (kvm_is_realm(kvm) &&
>   	    (kvm_realm_state(kvm) != REALM_STATE_DEAD &&
>   	     kvm_realm_state(kvm) != REALM_STATE_NONE)) {
> +		kvm_stage2_unmap_range(mmu, 0, (~0ULL) & PAGE_MASK, false);
>   		write_unlock(&kvm->mmu_lock);
>   		kvm_realm_destroy_rtts(kvm, pgt->ia_bits);

(~0ULL & PAGE_MASK) wouldn't be a problem since the range will be limited to
[0, BIT(realm->ia_bits) - 1] in kvm_realm_unmap_range(). I think it's reasonable
to pass the maximal size here, something like:

		kvm_stage2_unmap_range(mmu, 0, BIT(realm->ia_bits - 1), false);

>   
> @@ -1482,6 +1495,82 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
>   	return vma->vm_flags & VM_MTE_ALLOWED;
>   }
>   
> +static int realm_map_ipa(struct kvm *kvm, phys_addr_t ipa,
> +			 kvm_pfn_t pfn, unsigned long map_size,
> +			 enum kvm_pgtable_prot prot,
> +			 struct kvm_mmu_memory_cache *memcache)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +
> +	if (WARN_ON(!(prot & KVM_PGTABLE_PROT_W)))
> +		return -EFAULT;

A comment to explain why KVM_PGTABLE_PROT_W is required would be nice, something like:

	/*
	 * Write permission is required for now even though it's possible to
	 * map unprotected pages (granules) as read-only. It's impossible to
	 * map protected pages (granules) as read-only.
	 */

> +
> +	ipa = ALIGN_DOWN(ipa, PAGE_SIZE);
> +
> +	if (!kvm_realm_is_private_address(realm, ipa))
> +		return realm_map_non_secure(realm, ipa, pfn, map_size,
> +					    memcache);
> +
> +	return realm_map_protected(realm, ipa, pfn, map_size, memcache);
> +}
> +
> +static int private_memslot_fault(struct kvm_vcpu *vcpu,
> +				 phys_addr_t fault_ipa,
> +				 struct kvm_memory_slot *memslot)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	gpa_t gpa = kvm_gpa_from_fault(kvm, fault_ipa);
> +	gfn_t gfn = gpa >> PAGE_SHIFT;
> +	bool is_priv_gfn = kvm_mem_is_private(kvm, gfn);
> +	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
> +	struct page *page;
> +	kvm_pfn_t pfn;
> +	int ret;
> +	/*
> +	 * For Realms, the shared address is an alias of the private GPA with
> +	 * the top bit set. Thus is the fault address matches the GPA then it
> +	 * is the private alias.
> +	 */
> +	bool is_priv_fault = (gpa == fault_ipa);
> +
> +	if (is_priv_gfn != is_priv_fault) {
> +		kvm_prepare_memory_fault_exit(vcpu,
> +					      gpa,
> +					      PAGE_SIZE,
> +					      kvm_is_write_fault(vcpu),
> +					      false, is_priv_fault);

nit:

		kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
				kvm_is_write_fault(vcpu), false, is_priv_fault);

> +
> +		/*
> +		 * KVM_EXIT_MEMORY_FAULT requires an return code of -EFAULT,
> +		 * see the API documentation
> +		 */
> +		return -EFAULT;
> +	}
> +
> +	if (!is_priv_fault) {
> +		/* Not a private mapping, handling normally */
> +		return -EINVAL;
> +	}
> +
> +	ret = kvm_mmu_topup_memory_cache(memcache,
> +					 kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
> +	if (ret)
> +		return ret;
> +
> +	ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &pfn, &page, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* FIXME: Should be able to use bigger than PAGE_SIZE mappings */
> +	ret = realm_map_ipa(kvm, fault_ipa, pfn, PAGE_SIZE, KVM_PGTABLE_PROT_W,
> +			    memcache);
> +	if (!ret)
> +		return 1; /* Handled */
> +
> +	put_page(page);
> +	return ret;
> +}
> +
>   static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   			  struct kvm_s2_trans *nested,
>   			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1509,6 +1598,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (fault_is_perm)
>   		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
>   	write_fault = kvm_is_write_fault(vcpu);
> +
> +	/*
> +	 * Realms cannot map protected pages read-only
> +	 * FIXME: It should be possible to map unprotected pages read-only
> +	 */
> +	if (vcpu_is_rec(vcpu))
> +		write_fault = true;
> +
>   	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
>   	VM_BUG_ON(write_fault && exec_fault);
>   
> @@ -1623,7 +1720,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   		ipa &= ~(vma_pagesize - 1);
>   	}
>   
> -	gfn = ipa >> PAGE_SHIFT;
> +	gfn = kvm_gpa_from_fault(kvm, ipa) >> PAGE_SHIFT;
>   	mte_allowed = kvm_vma_mte_allowed(vma);
>   
>   	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
> @@ -1756,6 +1853,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   		 */
>   		prot &= ~KVM_NV_GUEST_MAP_SZ;
>   		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault_ipa, prot, flags);
> +	} else if (kvm_is_realm(kvm)) {
> +		ret = realm_map_ipa(kvm, fault_ipa, pfn, vma_pagesize,
> +				    prot, memcache);
>   	} else {
>   		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, vma_pagesize,
>   					     __pfn_to_phys(pfn), prot,
> @@ -1897,8 +1997,15 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   		nested = &nested_trans;
>   	}
>   
> -	gfn = ipa >> PAGE_SHIFT;
> +	gfn = kvm_gpa_from_fault(vcpu->kvm, ipa) >> PAGE_SHIFT;
>   	memslot = gfn_to_memslot(vcpu->kvm, gfn);
> +
> +	if (kvm_slot_can_be_private(memslot)) {
> +		ret = private_memslot_fault(vcpu, ipa, memslot);
> +		if (ret != -EINVAL)
> +			goto out;
> +	}
> +
>   	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
>   	write_fault = kvm_is_write_fault(vcpu);
>   	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
> @@ -1942,7 +2049,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>   		 * of the page size.
>   		 */
>   		ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
> -		ret = io_mem_abort(vcpu, ipa);
> +		ret = io_mem_abort(vcpu, kvm_gpa_from_fault(vcpu->kvm, ipa));
>   		goto out_unlock;
>   	}
>   
> @@ -1990,6 +2097,10 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   	if (!kvm->arch.mmu.pgt)
>   		return false;
>   
> +	/* We don't support aging for Realms */
> +	if (kvm_is_realm(kvm))
> +		return true;
> +
>   	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
>   						   range->start << PAGE_SHIFT,
>   						   size, true);
> @@ -2006,6 +2117,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   	if (!kvm->arch.mmu.pgt)
>   		return false;
>   
> +	/* We don't support aging for Realms */
> +	if (kvm_is_realm(kvm))
> +		return true;
> +
>   	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
>   						   range->start << PAGE_SHIFT,
>   						   size, false);
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index f6af3ea6ea8a..b6959cd17a6c 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -714,6 +714,186 @@ static int realm_create_protected_data_page(struct realm *realm,
>   	return -ENXIO;
>   }
>   
> +static int fold_rtt(struct realm *realm, unsigned long addr, int level)
> +{
> +	phys_addr_t rtt_addr;
> +	int ret;
> +
> +	ret = realm_rtt_fold(realm, addr, level, &rtt_addr);
> +	if (ret)
> +		return ret;
> +
> +	free_delegated_granule(rtt_addr);
> +
> +	return 0;
> +}
> +
> +int realm_map_protected(struct realm *realm,
> +			unsigned long ipa,
> +			kvm_pfn_t pfn,
> +			unsigned long map_size,
> +			struct kvm_mmu_memory_cache *memcache)
> +{
> +	phys_addr_t phys = __pfn_to_phys(pfn);
> +	phys_addr_t rd = virt_to_phys(realm->rd);
> +	unsigned long base_ipa = ipa;
> +	unsigned long size;
> +	int map_level;
> +	int ret = 0;
> +
> +	if (WARN_ON(!IS_ALIGNED(map_size, RMM_PAGE_SIZE)))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!IS_ALIGNED(ipa, map_size)))
> +		return -EINVAL;
> +
> +	if (IS_ALIGNED(map_size, RMM_L2_BLOCK_SIZE))
> +		map_level = 2;
> +	else
> +		map_level = 3;
> +

This block of code can be compacted a bit:

	int map_level = IS_ALIGNED(map_size, RMM_L2_BLOCK_SIZE) ? 2 : 3;

	if (WARN_ON(!IS_ALIGNED(map_size, RMM_PAGE_SIZE) || !IS_ALIGNED(ipa, map_size))
		return -EINVAL;

> +	if (map_level < RMM_RTT_MAX_LEVEL) {
> +		/*
> +		 * A temporary RTT is needed during the map, precreate it,
> +		 * however if there is an error (e.g. missing parent tables)
> +		 * this will be handled below.
> +		 */
> +		realm_create_rtt_levels(realm, ipa, map_level,
> +					RMM_RTT_MAX_LEVEL, memcache);
> +	}
> +
> +	for (size = 0; size < map_size; size += RMM_PAGE_SIZE) {
> +		if (rmi_granule_delegate(phys)) {
> +			/*
> +			 * It's likely we raced with another VCPU on the same
> +			 * fault. Assume the other VCPU has handled the fault
> +			 * and return to the guest.
> +			 */
> +			return 0;
> +		}
> +
> +		ret = rmi_data_create_unknown(rd, phys, ipa);
> +
> +		if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> +			/* Create missing RTTs and retry */
> +			int level = RMI_RETURN_INDEX(ret);
> +
> +			WARN_ON(level == RMM_RTT_MAX_LEVEL);
> +
> +			ret = realm_create_rtt_levels(realm, ipa, level,
> +						      RMM_RTT_MAX_LEVEL,
> +						      memcache);
> +			if (ret)
> +				goto err_undelegate;
> +
> +			ret = rmi_data_create_unknown(rd, phys, ipa);
> +		}
> +
> +		if (WARN_ON(ret))
> +			goto err_undelegate;
> +
> +		phys += RMM_PAGE_SIZE;
> +		ipa += RMM_PAGE_SIZE;
> +	}
> +
> +	if (map_size == RMM_L2_BLOCK_SIZE) {
> +		ret = fold_rtt(realm, base_ipa, map_level + 1);
> +		if (WARN_ON(ret))
> +			goto err;
> +	}
> +
> +	return 0;
> +
> +err_undelegate:
> +	if (WARN_ON(rmi_granule_undelegate(phys))) {
> +		/* Page can't be returned to NS world so is lost */
> +		get_page(phys_to_page(phys));
> +	}
> +err:
> +	while (size > 0) {
> +		unsigned long data, top;
> +
> +		phys -= RMM_PAGE_SIZE;
> +		size -= RMM_PAGE_SIZE;
> +		ipa -= RMM_PAGE_SIZE;
> +
> +		WARN_ON(rmi_data_destroy(rd, ipa, &data, &top));
> +
> +		if (WARN_ON(rmi_granule_undelegate(phys))) {
> +			/* Page can't be returned to NS world so is lost */
> +			get_page(phys_to_page(phys));
> +		}
> +	}
> +	return -ENXIO;
> +}
> +
> +int realm_map_non_secure(struct realm *realm,
> +			 unsigned long ipa,
> +			 kvm_pfn_t pfn,
> +			 unsigned long size,
> +			 struct kvm_mmu_memory_cache *memcache)
> +{
> +	phys_addr_t rd = virt_to_phys(realm->rd);
> +	phys_addr_t phys = __pfn_to_phys(pfn);
> +	unsigned long offset;
> +	int map_size, map_level;
> +	int ret = 0;
> +
> +	if (WARN_ON(!IS_ALIGNED(size, RMM_PAGE_SIZE)))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!IS_ALIGNED(ipa, size)))
> +		return -EINVAL;
> +
> +	if (IS_ALIGNED(size, RMM_L2_BLOCK_SIZE)) {
> +		map_level = 2;
> +		map_size = RMM_L2_BLOCK_SIZE;
> +	} else {
> +		map_level = 3;
> +		map_size = RMM_PAGE_SIZE;
> +	}
> +

Similiarly, it can be compacted a bit:

	int map_size = IS_ALIGNED(size, RMM_L2_BLOCK_SIZE) ? RMM_L2_BLOCK_SIZE : RMM_PAGE_SIZE;
	int map_level = IS_ALIGNED(map_size, RMM_L2_BLOCK_SIZE) ? 2 : 3;

	if (WARN_ON(!IS_ALIGNED(size, RMM_PAGE_SIZE) || !IS_ALIGNED(ipa, size))
		return -EINVAL;

> +	for (offset = 0; offset < size; offset += map_size) {
> +		/*
> +		 * realm_map_ipa() enforces that the memory is writable,
> +		 * so for now we permit both read and write.
> +		 */
> +		unsigned long desc = phys |
> +				     PTE_S2_MEMATTR(MT_S2_FWB_NORMAL) |
> +				     KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R |
> +				     KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
> +		ret = rmi_rtt_map_unprotected(rd, ipa, map_level, desc);
> +
> +		if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> +			/* Create missing RTTs and retry */
> +			int level = RMI_RETURN_INDEX(ret);
> +
> +			ret = realm_create_rtt_levels(realm, ipa, level,
> +						      map_level, memcache);
> +			if (ret)
> +				return -ENXIO;
> +
> +			ret = rmi_rtt_map_unprotected(rd, ipa, map_level, desc);
> +		}
> +		/*
> +		 * RMI_ERROR_RTT can be reported for two reasons: either the
> +		 * RTT tables are not there, or there is an RTTE already
> +		 * present for the address.  The call to
> +		 * realm_create_rtt_levels() above handles the first case, and
> +		 * in the second case this indicates that another thread has
> +		 * already populated the RTTE for us, so we can ignore the
> +		 * error and continue.
> +		 */
> +		if (ret && RMI_RETURN_STATUS(ret) != RMI_ERROR_RTT)
> +			return -ENXIO;

The comments needs to be aligned in format :)

If RMM returns RMI_ERROR_RTT for third case in the future, the assumption here
is broken. I think it's worthy to double confirm by checking the RTT entry
through RTT_READ_ENTRY interface. If the mapping doesn't exist, we probably
still need to retry.

> +
> +		ipa += map_size;
> +		phys += map_size;
> +	}
> +
> +	return 0;
> +}
> +
>   static int populate_region(struct kvm *kvm,
>   			   phys_addr_t ipa_base,
>   			   phys_addr_t ipa_end,

Thanks,
Gavin


