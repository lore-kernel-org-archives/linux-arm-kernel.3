Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9CBC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOmrewVBWBbwYNSJ/q7SkXbshpeOAA2493hbfdbgNq0=; b=SJrw0RQpbi1/jNOVdmOrbVW6AZ
	vW2anzru7Ktev2Hpg/qW1ZD4d1zukV6Lo0bzvlBE/pSZcA1qQHGAWuikmBhHudH1pK3BrXMNbKSa+
	bah20K43qJ2/h1e5SkB50dxbIMlu58evPAU3rVvbtKwn9ZjO0M0chvzEd9JcuvKvJVSoJAt8NlxJz
	oC+GAkfP3Xhe63kyLIjLhMLYwmbC8Xhzqej4OsWw7v+xMsmjFUgxOmW0HWJQOfdWkGGdWjkZYkK4s
	UOX0vZ1C6d7b4lntsDLwJGm+ucEL4C2jff5Ucs2vyi5pQOIRw5cyNGGwCRiAUEGHDxG0G5KX7zjqi
	8AssPXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXrU-00000009Dn0-2rhv;
	Thu, 30 Jan 2025 16:57:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXqA-00000009DbP-2N6r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 16:56:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E7DB497;
	Thu, 30 Jan 2025 08:56:55 -0800 (PST)
Received: from [10.1.32.52] (e122027.cambridge.arm.com [10.1.32.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20D4F3F63F;
	Thu, 30 Jan 2025 08:56:24 -0800 (PST)
Message-ID: <699f918e-5db4-467c-9dcf-c1474aaef265@arm.com>
Date: Thu, 30 Jan 2025 16:56:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/43] arm64: RME: Allow VMM to set RIPAS
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-17-steven.price@arm.com>
 <4c1c507d-25ae-488f-88d3-fd6ffe337d0d@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <4c1c507d-25ae-488f-88d3-fd6ffe337d0d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_085630_690745_65A41F8F 
X-CRM114-Status: GOOD (  27.56  )
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

On 29/01/2025 23:25, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> Each page within the protected region of the realm guest can be marked
>> as either RAM or EMPTY. Allow the VMM to control this before the guest
>> has started and provide the equivalent functions to change this (with
>> the guest's approval) at runtime.
>>
>> When transitioning from RIPAS RAM (1) to RIPAS EMPTY (0) the memory is
>> unmapped from the guest and undelegated allowing the memory to be reused
>> by the host. When transitioning to RIPAS RAM the actual population of
>> the leaf RTTs is done later on stage 2 fault, however it may be
>> necessary to allocate additional RTTs to allow the RMM track the RIPAS
>> for the requested range.
>>
>> When freeing a block mapping it is necessary to temporarily unfold the
>> RTT which requires delegating an extra page to the RMM, this page can
>> then be recovered once the contents of the block mapping have been
>> freed.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v5:
>>   * Adapt to rebasing.
>>   * Introduce find_map_level()
>>   * Rename some functions to be clearer.
>>   * Drop the "spare page" functionality.
>> Changes from v2:
>>   * {alloc,free}_delegated_page() moved from previous patch to this one.
>>   * alloc_delegated_page() now takes a gfp_t flags parameter.
>>   * Fix the reference counting of guestmem pages to avoid leaking memory.
>>   * Several misc code improvements and extra comments.
>> ---
>>   arch/arm64/include/asm/kvm_rme.h |  17 ++
>>   arch/arm64/kvm/mmu.c             |   8 +-
>>   arch/arm64/kvm/rme.c             | 411 +++++++++++++++++++++++++++++++
>>   3 files changed, 433 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/
>> asm/kvm_rme.h
>> index be64b749fcac..4e7758f0e4b5 100644
>> --- a/arch/arm64/include/asm/kvm_rme.h
>> +++ b/arch/arm64/include/asm/kvm_rme.h
>> @@ -92,6 +92,15 @@ void kvm_realm_destroy_rtts(struct kvm *kvm, u32
>> ia_bits);
>>   int kvm_create_rec(struct kvm_vcpu *vcpu);
>>   void kvm_destroy_rec(struct kvm_vcpu *vcpu);
>>   +void kvm_realm_unmap_range(struct kvm *kvm,
>> +               unsigned long ipa,
>> +               u64 size,
>> +               bool unmap_private);
>> +int realm_set_ipa_state(struct kvm_vcpu *vcpu,
>> +            unsigned long addr, unsigned long end,
>> +            unsigned long ripas,
>> +            unsigned long *top_ipa);
>> +
> 
> The declaration of realm_set_ipa_state() is unnecessary since its scope has
> been limited to rme.c

Ack, the function can be static too.

>>   #define RMM_RTT_BLOCK_LEVEL    2
>>   #define RMM_RTT_MAX_LEVEL    3
>>   @@ -110,4 +119,12 @@ static inline unsigned long
>> rme_rtt_level_mapsize(int level)
>>       return (1UL << RMM_RTT_LEVEL_SHIFT(level));
>>   }
>>   +static inline bool realm_is_addr_protected(struct realm *realm,
>> +                       unsigned long addr)
>> +{
>> +    unsigned int ia_bits = realm->ia_bits;
>> +
>> +    return !(addr & ~(BIT(ia_bits - 1) - 1));
>> +}
>> +
>>   #endif
> 
> The check on the specified address to determine its range seems a bit
> complicated
> to me, it can be simplified like below. Besides, it may be a good idea
> to rename
> it to have the prefix "kvm_realm_".
> 
> static inline bool kvm_realm_is_{private | protected}_address(struct
> realm *realm,
>                           unsigned long addr)
> {
>     return !(addr & BIT(realm->ia_bits - 1));
> }

Ack

> A question related to the terms used in this series to describe a
> granule's state:
> "protected" or "private", "unprotected" or "shared". Those terms are all
> used in
> the function names of this series. I guess it would be nice to unify so
> that
> "private" and "shared" to be used, which is consistent to the terms used by
> guest-memfd. For example, kvm_realm_is_protected_address() can be
> renamed to
> kvm_realm_is_private_address().

Happy with the rename here. More generally it's a little awkward because
the RMM spec does refer to protected/unprotected (e.g.
RMI_RTT_MAP_UNPROTECTED). So there's always a choice between aligning
with the RMM spec or aligning with guest-memfd.

Thanks,

Steve


