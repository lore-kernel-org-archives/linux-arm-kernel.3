Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735C2C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO/1dnV3gMK6FLfKtGasXPRYY7u7uKAkp8m0gMlXF18=; b=WVZKnquKKufti2393HgUVF+IHk
	EASddd9vumCF2/MlPKH8+hfD3TcS0O+wx0cHmKvBvIAzm3+kU2qGAWTh4OlIGHYsiBMWcL8RMdKI6
	S/oQ3SPvGs5T1e2rMw9oeJ8/bdmKBwLni2vtLZYCDqBTLDIPtgGizRUl0MM7pPx5xMQNeSllzPBsp
	7PBG824zqKTZehw6MUWDvyTCSpipsUbWfQm1s8ZgoWW8JRFozzEgNrXp2j59+osLEY5Q59yF0eViH
	36u1+um0l19yqBW285rlBTFvZ4CM/DdNSoizILeaaOtQVJ/pVAF1I7zAJI3V454Azl46BQ8tIMGgp
	/JF7Krbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOIR-0000000DEFT-2EXk;
	Tue, 20 May 2025 14:50:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOGE-0000000DDoY-1PsO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:48:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1B6F1516;
	Tue, 20 May 2025 07:47:51 -0700 (PDT)
Received: from [10.57.50.40] (unknown [10.57.50.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E0A53F6A8;
	Tue, 20 May 2025 07:48:02 -0700 (PDT)
Message-ID: <d1b3caaf-636f-48e6-90e6-0bb650753748@arm.com>
Date: Tue, 20 May 2025 15:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/43] arm64: RME: Runtime faulting of memory
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Gavin Shan <gshan@redhat.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-21-steven.price@arm.com>
 <c99b408c-3819-482a-a427-68045211e434@redhat.com>
 <4fca6bfa-3687-4fdf-8204-00fa90d36e2a@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <4fca6bfa-3687-4fdf-8204-00fa90d36e2a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_074806_528666_5BDB8665 
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

On 16/05/2025 16:33, Steven Price wrote:
> On 01/05/2025 01:16, Gavin Shan wrote:
>> On 4/16/25 11:41 PM, Steven Price wrote:
>>> At runtime if the realm guest accesses memory which hasn't yet been
>>> mapped then KVM needs to either populate the region or fault the guest.
>>>
>>> For memory in the lower (protected) region of IPA a fresh page is
>>> provided to the RMM which will zero the contents. For memory in the
>>> upper (shared) region of IPA, the memory from the memslot is mapped
>>> into the realm VM non secure.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v7:
>>>    * Remove redundant WARN_ONs for realm_create_rtt_levels() - it will
>>>      internally WARN when necessary.
>>> Changes since v6:
>>>    * Handle PAGE_SIZE being larger than RMM granule size.
>>>    * Some minor renaming following review comments.
>>> Changes since v5:
>>>    * Reduce use of struct page in preparation for supporting the RMM
>>>      having a different page size to the host.
>>>    * Handle a race when delegating a page where another CPU has faulted on
>>>      a the same page (and already delegated the physical page) but not yet
>>>      mapped it. In this case simply return to the guest to either use the
>>>      mapping from the other CPU (or refault if the race is lost).
>>>    * The changes to populate_par_region() are moved into the previous
>>>      patch where they belong.
>>> Changes since v4:
>>>    * Code cleanup following review feedback.
>>>    * Drop the PTE_SHARED bit when creating unprotected page table entries.
>>>      This is now set by the RMM and the host has no control of it and the
>>>      spec requires the bit to be set to zero.
>>> Changes since v2:
>>>    * Avoid leaking memory if failing to map it in the realm.
>>>    * Correctly mask RTT based on LPA2 flag (see rtt_get_phys()).
>>>    * Adapt to changes in previous patches.
>>> ---
>>>    arch/arm64/include/asm/kvm_emulate.h |  10 ++
>>>    arch/arm64/include/asm/kvm_rme.h     |  10 ++
>>>    arch/arm64/kvm/mmu.c                 | 127 ++++++++++++++++++-
>>>    arch/arm64/kvm/rme.c                 | 180 +++++++++++++++++++++++++++
>>>    4 files changed, 321 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/
>>> include/asm/kvm_emulate.h
>>> index c803c8188d9c..def439d6d732 100644
>>> --- a/arch/arm64/include/asm/kvm_emulate.h
>>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>>> @@ -704,6 +704,16 @@ static inline bool kvm_realm_is_created(struct
>>> kvm *kvm)
>>>        return kvm_is_realm(kvm) && kvm_realm_state(kvm) !=
>>> REALM_STATE_NONE;
>>>    }
>>>    +static inline gpa_t kvm_gpa_from_fault(struct kvm *kvm, phys_addr_t
>>> ipa)
>>> +{
>>> +    if (kvm_is_realm(kvm)) {
>>> +        struct realm *realm = &kvm->arch.realm;
>>> +
>>> +        return ipa & ~BIT(realm->ia_bits - 1);
>>> +    }
>>> +    return ipa;
>>> +}
>>> +
>>>    static inline bool vcpu_is_rec(struct kvm_vcpu *vcpu)
>>>    {
>>>        if (static_branch_unlikely(&kvm_rme_is_available))
>>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/
>>> asm/kvm_rme.h
>>> index d86051ef0c5c..47aa6362c6c9 100644
>>> --- a/arch/arm64/include/asm/kvm_rme.h
>>> +++ b/arch/arm64/include/asm/kvm_rme.h
>>> @@ -108,6 +108,16 @@ void kvm_realm_unmap_range(struct kvm *kvm,
>>>                   unsigned long ipa,
>>>                   unsigned long size,
>>>                   bool unmap_private);
>>> +int realm_map_protected(struct realm *realm,
>>> +            unsigned long base_ipa,
>>> +            kvm_pfn_t pfn,
>>> +            unsigned long size,
>>> +            struct kvm_mmu_memory_cache *memcache);
>>> +int realm_map_non_secure(struct realm *realm,
>>> +             unsigned long ipa,
>>> +             kvm_pfn_t pfn,
>>> +             unsigned long size,
>>> +             struct kvm_mmu_memory_cache *memcache);
>>>      static inline bool kvm_realm_is_private_address(struct realm *realm,
>>>                            unsigned long addr)
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>> index 71c04259e39f..02b66ee35426 100644
>>> --- a/arch/arm64/kvm/mmu.c
>>> +++ b/arch/arm64/kvm/mmu.c
>>> @@ -338,8 +338,13 @@ static void __unmap_stage2_range(struct
>>> kvm_s2_mmu *mmu, phys_addr_t start, u64
>>>          lockdep_assert_held_write(&kvm->mmu_lock);
>>>        WARN_ON(size & ~PAGE_MASK);
>>> -    WARN_ON(stage2_apply_range(mmu, start, end,
>>> KVM_PGT_FN(kvm_pgtable_stage2_unmap),
>>> -                   may_block));
>>> +
>>> +    if (kvm_is_realm(kvm))
>>> +        kvm_realm_unmap_range(kvm, start, size, !only_shared);
>>> +    else
>>> +        WARN_ON(stage2_apply_range(mmu, start, end,
>>> +                       KVM_PGT_FN(kvm_pgtable_stage2_unmap),
>>> +                       may_block));
>>>    }
>>>    
>>
>> As spotted previsouly, the parameter @may_block isn't handled by
>> kvm_realm_unmap_range().
> 
> Ack.
> 
>>>    void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
>>> @@ -359,7 +364,10 @@ static void stage2_flush_memslot(struct kvm *kvm,
>>>        phys_addr_t addr = memslot->base_gfn << PAGE_SHIFT;
>>>        phys_addr_t end = addr + PAGE_SIZE * memslot->npages;
>>>    -    kvm_stage2_flush_range(&kvm->arch.mmu, addr, end);
>>> +    if (kvm_is_realm(kvm))
>>> +        kvm_realm_unmap_range(kvm, addr, end - addr, false);
>>> +    else
>>> +        kvm_stage2_flush_range(&kvm->arch.mmu, addr, end);
>>>    }
>>>      /**
>>> @@ -1053,6 +1061,10 @@ void stage2_unmap_vm(struct kvm *kvm)
>>>        struct kvm_memory_slot *memslot;
>>>        int idx, bkt;
>>>    +    /* For realms this is handled by the RMM so nothing to do here */
>>> +    if (kvm_is_realm(kvm))
>>> +        return;
>>> +
>>>        idx = srcu_read_lock(&kvm->srcu);
>>>        mmap_read_lock(current->mm);
>>>        write_lock(&kvm->mmu_lock);
>>> @@ -1078,6 +1090,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>>>        if (kvm_is_realm(kvm) &&
>>>            (kvm_realm_state(kvm) != REALM_STATE_DEAD &&
>>>             kvm_realm_state(kvm) != REALM_STATE_NONE)) {
>>> +        kvm_stage2_unmap_range(mmu, 0, (~0ULL) & PAGE_MASK, false);
>>>            write_unlock(&kvm->mmu_lock);
>>>            kvm_realm_destroy_rtts(kvm, pgt->ia_bits);
>>
>> (~0ULL & PAGE_MASK) wouldn't be a problem since the range will be
>> limited to
>> [0, BIT(realm->ia_bits) - 1] in kvm_realm_unmap_range(). I think it's
>> reasonable
>> to pass the maximal size here, something like:
>>
>>          kvm_stage2_unmap_range(mmu, 0, BIT(realm->ia_bits - 1), false);

I think this must be, given the end is excluding:
	   kvm_stage2_unmap_range(mmu, 0, BIT(realm->ia_bits), false);

BIT(realm->ia_bits - 1) only covers the protected half. The unprotected 
half spans  [ BIT(realm->ia_bits - 1), BIT(realm->ia_bits))

Suzuki

