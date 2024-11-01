Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B39E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSiXXJjqUAXNM3Q7M0Jyp2Bq/iajtRechuXczqvHBLM=; b=XiEkWSPn1jL+Vze/GN4hb4cvrV
	bGsl/hbTPgJFj1/cx0u09d0uYrZhGeNicKqPGiH/cF3nz82S+4N78oMwc479EFd9Ezw0jYyo7r83w
	/IK+IZErsj839Z0plwHD8eVp7BCh+WVLUFdWUGiQue9xKfYtbb/ixV3QhmAzct+jLJ4wNlTsz2OiD
	0Kz5uZks1/ANmACEwAalP/DFfHS1cYoLHILOBaNvNVTbUArl8GPBCT4E/jBpk59uEue9C8TeTrOLE
	TaPheWHOkbryC72bv2Y/FTqsY60MTLpf2ZQQc6hlYwDg+bWK8ao7U3tacetFgvNUi3C+Hjn9eMcmb
	uEcSUlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uiS-00000007iPY-4AUi;
	Fri, 01 Nov 2024 16:41:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uc8-00000007hOK-30SA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:35:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3815FEC;
	Fri,  1 Nov 2024 09:35:37 -0700 (PDT)
Received: from [10.1.33.21] (e122027.cambridge.arm.com [10.1.33.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27FBA3F73B;
	Fri,  1 Nov 2024 09:35:02 -0700 (PDT)
Message-ID: <5e23ce30-494b-43a5-9514-7701e799e49b@arm.com>
Date: Fri, 1 Nov 2024 16:35:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/43] arm64: RME: RTT tear down
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20241004152804.72508-1-steven.price@arm.com>
 <20241004152804.72508-14-steven.price@arm.com>
 <a4dc1efc-8202-4440-8106-cf475da1a7d5@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <a4dc1efc-8202-4440-8106-cf475da1a7d5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093508_907753_9D90DFFD 
X-CRM114-Status: GOOD (  28.95  )
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

On 15/10/2024 12:25, Suzuki K Poulose wrote:
> Hi Steven
> 
> On 04/10/2024 16:27, Steven Price wrote:
>> The RMM owns the stage 2 page tables for a realm, and KVM must request
>> that the RMM creates/destroys entries as necessary. The physical pages
>> to store the page tables are delegated to the realm as required, and can
>> be undelegated when no longer used.
>>
>> Creating new RTTs is the easy part, tearing down is a little more
>> tricky. The result of realm_rtt_destroy() can be used to effectively
>> walk the tree and destroy the entries (undelegating pages that were
>> given to the realm).
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v2:
>>   * Moved {alloc,free}_delegated_page() and ensure_spare_page() to a
>>     later patch when they are actually used.
>>   * Some simplifications now rmi_xxx() functions allow NULL as an output
>>     parameter.
>>   * Improved comments and code layout.
>> ---
>>   arch/arm64/include/asm/kvm_rme.h |  19 ++++++
>>   arch/arm64/kvm/mmu.c             |   6 +-
>>   arch/arm64/kvm/rme.c             | 113 +++++++++++++++++++++++++++++++
>>   3 files changed, 135 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rme.h
>> b/arch/arm64/include/asm/kvm_rme.h
>> index bd306bd7b64b..e5704859a6e5 100644
>> --- a/arch/arm64/include/asm/kvm_rme.h
>> +++ b/arch/arm64/include/asm/kvm_rme.h
>> @@ -76,5 +76,24 @@ u32 kvm_realm_ipa_limit(void);
>>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>>   int kvm_init_realm_vm(struct kvm *kvm);
>>   void kvm_destroy_realm(struct kvm *kvm);
>> +void kvm_realm_destroy_rtts(struct kvm *kvm, u32 ia_bits);
>> +
>> +#define RME_RTT_BLOCK_LEVEL    2
>> +#define RME_RTT_MAX_LEVEL    3
>> +
>> +#define RME_PAGE_SHIFT        12
>> +#define RME_PAGE_SIZE        BIT(RME_PAGE_SHIFT)
>> +/* See ARM64_HW_PGTABLE_LEVEL_SHIFT() */
>> +#define RME_RTT_LEVEL_SHIFT(l)    \
>> +    ((RME_PAGE_SHIFT - 3) * (4 - (l)) + 3)
>> +#define RME_L2_BLOCK_SIZE    BIT(RME_RTT_LEVEL_SHIFT(2))
>> +
>> +static inline unsigned long rme_rtt_level_mapsize(int level)
>> +{
>> +    if (WARN_ON(level > RME_RTT_MAX_LEVEL))
>> +        return RME_PAGE_SIZE;
>> +
>> +    return (1UL << RME_RTT_LEVEL_SHIFT(level));
>> +}
>>     #endif
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index d4ef6dcf8eb7..a26cdac59eb3 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1054,17 +1054,17 @@ void stage2_unmap_vm(struct kvm *kvm)
>>   void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>>   {
>>       struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>> -    struct kvm_pgtable *pgt = NULL;
>> +    struct kvm_pgtable *pgt;
>>         write_lock(&kvm->mmu_lock);
>> +    pgt = mmu->pgt;
>>       if (kvm_is_realm(kvm) &&
>>           (kvm_realm_state(kvm) != REALM_STATE_DEAD &&
>>            kvm_realm_state(kvm) != REALM_STATE_NONE)) {
>> -        /* Tearing down RTTs will be added in a later patch */
>>           write_unlock(&kvm->mmu_lock);
>> +        kvm_realm_destroy_rtts(kvm, pgt->ia_bits);
>>           return;
>>       }
>> -    pgt = mmu->pgt;
>>       if (pgt) {
>>           mmu->pgd_phys = 0;
>>           mmu->pgt = NULL;
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index f6430d460519..7db405d2b2b2 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
>> @@ -125,6 +125,119 @@ static int realm_create_rd(struct kvm *kvm)
>>       return r;
>>   }
>>   +static int realm_rtt_destroy(struct realm *realm, unsigned long addr,
>> +                 int level, phys_addr_t *rtt_granule,
>> +                 unsigned long *next_addr)
>> +{
>> +    unsigned long out_rtt;
> 
> minor nit: You could drop the local variable out_rtt.

I could, but I was trying to avoid assuming that phys_addr_t was
compatible with unsigned long - i.e. I don't want to do the type-punning
to pass rtt_granule straight into rmi_rtt_destroy(). I would expect the
compiler will inline this function and get rid of the temporary.

>> +    int ret;
>> +
>> +    ret = rmi_rtt_destroy(virt_to_phys(realm->rd), addr, level,
>> +                  &out_rtt, next_addr);
>> +
>> +    *rtt_granule = out_rtt;
>> +
>> +    return ret;
>> +}
>> +
>> +static int realm_tear_down_rtt_level(struct realm *realm, int level,
>> +                     unsigned long start, unsigned long end)
>> +{
>> +    ssize_t map_size;
>> +    unsigned long addr, next_addr;
>> +
>> +    if (WARN_ON(level > RME_RTT_MAX_LEVEL))
>> +        return -EINVAL;
>> +
>> +    map_size = rme_rtt_level_mapsize(level - 1);
>> +
>> +    for (addr = start; addr < end; addr = next_addr) {
>> +        phys_addr_t rtt_granule;
>> +        int ret;
>> +        unsigned long align_addr = ALIGN(addr, map_size);
>> +
>> +        next_addr = ALIGN(addr + 1, map_size);
>> +
>> +        if (next_addr > end || align_addr != addr) {
>> +            /*
>> +             * The target range is smaller than what this level
>> +             * covers, recurse deeper.
>> +             */
>> +            ret = realm_tear_down_rtt_level(realm,
>> +                            level + 1,
>> +                            addr,
>> +                            min(next_addr, end));
>> +            if (ret)
>> +                return ret;
>> +            continue;
>> +        }
>> +
>> +        ret = realm_rtt_destroy(realm, addr, level,
>> +                    &rtt_granule, &next_addr);
>> +
>> +        switch (RMI_RETURN_STATUS(ret)) {
>> +        case RMI_SUCCESS:
>> +            if (!WARN_ON(rmi_granule_undelegate(rtt_granule)))
>> +                free_page((unsigned long)phys_to_virt(rtt_granule));
>> +            break;
>> +        case RMI_ERROR_RTT:
>> +            if (next_addr > addr) {
>> +                /* Missing RTT, skip */
>> +                break;
>> +            }
>> +            if (WARN_ON(RMI_RETURN_INDEX(ret) != level))
>> +                return -EBUSY;
>> +            /*
>> +             * We tear down the RTT range for the full IPA
>> +             * space, after everything is unmapped. Also we
>> +             * descend down only if we cannot tear down a
>> +             * top level RTT. Thus RMM must be able to walk
>> +             * to the requested level. e.g., a block mapping
>> +             * exists at L1 or L2.
>> +             */
> 
> This comment really applies to the if (RMI_RETURN_INDEX(ret) != level)
> check above. Please move it up.

Good spot.

> With that :
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 

Thanks,
Steve

> 
> 
> 
>> +            if (WARN_ON(level == RME_RTT_MAX_LEVEL))
>> +                return -EBUSY;    > +
>> +            /*
>> +             * The table has active entries in it, recurse deeper
>> +             * and tear down the RTTs.
>> +             */
>> +            next_addr = ALIGN(addr + 1, map_size);
>> +            ret = realm_tear_down_rtt_level(realm,
>> +                            level + 1,
>> +                            addr,
>> +                            next_addr);
>> +            if (ret)
>> +                return ret;
>> +            /*
>> +             * Now that the child RTTs are destroyed,
>> +             * retry at this level.
>> +             */
>> +            next_addr = addr;
>> +            break;
>> +        default:
>> +            WARN_ON(1);
>> +            return -ENXIO;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int realm_tear_down_rtt_range(struct realm *realm,
>> +                     unsigned long start, unsigned long end)
>> +{
>> +    return realm_tear_down_rtt_level(realm, get_start_level(realm) + 1,
>> +                     start, end);
>> +}
>> +
>> +void kvm_realm_destroy_rtts(struct kvm *kvm, u32 ia_bits)
>> +{
>> +    struct realm *realm = &kvm->arch.realm;
>> +
>> +    WARN_ON(realm_tear_down_rtt_range(realm, 0, (1UL << ia_bits)));
>> +}
>> +
>>   /* Protects access to rme_vmid_bitmap */
>>   static DEFINE_SPINLOCK(rme_vmid_lock);
>>   static unsigned long *rme_vmid_bitmap;
> 


