Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E2310987A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOEGSHocnt/m4ZgpeqC281LjExqPf1c0vXLuioJq1Xc=; b=FrhPOC9uFaiDI1rbN9onTJOWcn
	568UnMr+bKxeDactO9OyrJ3l7nOpidJ08NohIMaIZzRvI7hK2iWIwbj+WgfomUh82MrXwcJSp4oL/
	crwuMdZP2xD0jFGccjd7b2FePe/j1K5+8No4rIr+sK4/LDXbIvtivGk6bY/XugrqcvRglaXHm4F0u
	kr1aJtV3s/Tchh18LehqrRj6CKJKXZat4fDYPWZBBUvSSKdvKZcyvGnug/o8UUbWzReNLd5OEISsY
	MY+T4Qob3G6EVn0RJ2NBz6OB9zvS8npy4rHEUNioo4o7MLN54fGe8rUFwDOC/BpgKvM9ighSWGIou
	gOwklk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cVB-0000000D6R5-2agd;
	Fri, 20 Mar 2026 16:15:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cV8-0000000D6QO-4B9U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:15:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F8091682;
	Fri, 20 Mar 2026 09:14:59 -0700 (PDT)
Received: from [10.1.29.20] (e122027.cambridge.arm.com [10.1.29.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 069013F7BD;
	Fri, 20 Mar 2026 09:15:00 -0700 (PDT)
Message-ID: <34815656-b73f-4f07-857d-103abf654acf@arm.com>
Date: Fri, 20 Mar 2026 16:14:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 15/48] arm64: RMI: RTT tear down
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
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-16-steven.price@arm.com>
 <db905c7e-0a47-4f12-b1ff-dce55e0584ed@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <db905c7e-0a47-4f12-b1ff-dce55e0584ed@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_091507_119296_1CE9B71A 
X-CRM114-Status: GOOD (  39.11  )
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

On 20/03/2026 10:37, Suzuki K Poulose wrote:
> On 18/03/2026 15:53, Steven Price wrote:
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
>> Changes since v12:
>>   * Simplify some functions now we know RMM page size is the same as the
>>     host's.
>> Changes since v11:
>>   * Moved some code from earlier in the series to this one so that it's
>>     added when it's first used.
>> Changes since v10:
>>   * RME->RMI rename.
>>   * Some code to handle freeing stage 2 PGD moved into this patch where
>>     it belongs.
>> Changes since v9:
>>   * Add a comment clarifying that root level RTTs are not destroyed until
>>     after the RD is destroyed.
>> Changes since v8:
>>   * Introduce free_rtt() wrapper which calls free_delegated_granule()
>>     followed by kvm_account_pgtable_pages(). This makes it clear where an
>>     RTT is being freed rather than just a delegated granule.
>> Changes since v6:
>>   * Move rme_rtt_level_mapsize() and supporting defines from kvm_rme.h
>>     into rme.c as they are only used in that file.
>> Changes since v5:
>>   * Rename some RME_xxx defines to do with page sizes as RMM_xxx -
>> they are
>>     a property of the RMM specification not the RME architecture.
>> Changes since v2:
>>   * Moved {alloc,free}_delegated_page() and ensure_spare_page() to a
>>     later patch when they are actually used.
>>   * Some simplifications now rmi_xxx() functions allow NULL as an output
>>     parameter.
>>   * Improved comments and code layout.
>> ---
>>   arch/arm64/include/asm/kvm_rmi.h |   7 ++
>>   arch/arm64/kvm/mmu.c             |  15 +++-
>>   arch/arm64/kvm/rmi.c             | 145 +++++++++++++++++++++++++++++++
>>   3 files changed, 166 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/
>> asm/kvm_rmi.h
>> index 0ada525af18f..16a297f3091a 100644
>> --- a/arch/arm64/include/asm/kvm_rmi.h
>> +++ b/arch/arm64/include/asm/kvm_rmi.h
>> @@ -68,5 +68,12 @@ u32 kvm_realm_ipa_limit(void);
>>     int kvm_init_realm_vm(struct kvm *kvm);
>>   void kvm_destroy_realm(struct kvm *kvm);
>> +void kvm_realm_destroy_rtts(struct kvm *kvm);
>> +
>> +static inline bool kvm_realm_is_private_address(struct realm *realm,
>> +                        unsigned long addr)
>> +{
>> +    return !(addr & BIT(realm->ia_bits - 1));
>> +}
>>     #endif /* __ASM_KVM_RMI_H */
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 9dc242c3b9c8..41152abf55b2 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1098,10 +1098,23 @@ void stage2_unmap_vm(struct kvm *kvm)
>>   void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>>   {
>>       struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>> -    struct kvm_pgtable *pgt = NULL;
>> +    struct kvm_pgtable *pgt;
>>         write_lock(&kvm->mmu_lock);
>>       pgt = mmu->pgt;
>> +    if (kvm_is_realm(kvm) &&
>> +        (kvm_realm_state(kvm) != REALM_STATE_DEAD &&
>> +         kvm_realm_state(kvm) != REALM_STATE_NONE)) {
>> +        write_unlock(&kvm->mmu_lock);
>> +        kvm_realm_destroy_rtts(kvm);
>> +
>> +        /*
>> +         * The PGD pages can be reclaimed only after the realm (RD) is
>> +         * destroyed. We call this again from kvm_destroy_realm() after
>> +         * the RD is destroyed.
>> +         */
>> +        return;
>> +    }
>>       if (pgt) {
>>           mmu->pgd_phys = 0;
>>           mmu->pgt = NULL;
>> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>> index 700b8c935d29..1fd2c18f7381 100644
>> --- a/arch/arm64/kvm/rmi.c
>> +++ b/arch/arm64/kvm/rmi.c
>> @@ -15,6 +15,19 @@
>>   static unsigned long rmm_feat_reg0;
>>   static unsigned long rmm_feat_reg1;
>>  
> 
> -->
> 
>> +#define RMM_RTT_BLOCK_LEVEL    2
> ...
>> +
>> +#define RMM_L2_BLOCK_SIZE    PMD_SIZE
> 
> <--
> 
> Unused ? Even better we could use PMD_SIZE directly if at all we need
> it, as we are using PAGE_SIZE

They are used in realm_map_protected() to calculate 'map_level'. But
actually I should be able to drop that use. With the range-based APIs
there's no longer a need to create a temporary RTT when populating a
huge-page.

> 
> minor nit: Also, may be we can have a generic name for the
> RMM_RTT_MAX_LEVEL ? This applies to all page tables ?
> 
> I see we have KVM_PGTALBE_LAST_LEVEL, may be we could use that ?

Yes that would work - thanks for the suggestion.

> 
>> +
>> +static inline unsigned long rmi_rtt_level_mapsize(int level)
>> +{
>> +    if (WARN_ON(level > RMM_RTT_MAX_LEVEL))
>> +        return PAGE_SIZE;
>> +
>> +    return (1UL << ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
>> +}
>> +
>>   static bool rmi_has_feature(unsigned long feature)
>>   {
>>       return !!u64_get_bits(rmm_feat_reg0, feature);
>> @@ -189,6 +202,11 @@ u32 kvm_realm_ipa_limit(void)
>>       return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_S2SZ);
>>   }
>>   +static int get_start_level(struct realm *realm)
>> +{
>> +    return 4 - stage2_pgtable_levels(realm->ia_bits);
>> +}
>> +
>>   static int undelegate_range(phys_addr_t phys, unsigned long size)
>>   {
>>       unsigned long ret;
>> @@ -223,6 +241,131 @@ static int free_delegated_page(phys_addr_t phys)
>>       return 0;
>>   }
>>   +static void free_rtt(phys_addr_t phys)
>> +{
>> +    if (free_delegated_page(phys))
>> +        return;
>> +
>> +    kvm_account_pgtable_pages(phys_to_virt(phys), -1);
>> +}
> 
> 
> How about a comment here for the function below ?
> 
> Something like :
> 
> /*
>  * realm_rtt_destroy: Destroy an RTT at @level for @addr.
>  *
>  * Returns - Result of the RMI_RTT_DESTROY call, additionally :
>  *  @out_rtt  : RTT granule, if the RTT was destroyed.
>  *  @next_addr: IPA corresponding to the next possible valid Table entry
>  *        we can target.
>  */

Sure

>> +
>> +static int realm_rtt_destroy(struct realm *realm, unsigned long addr,
>> +                 int level, phys_addr_t *rtt_granule,
>> +                 unsigned long *next_addr)
>> +{
>> +    unsigned long out_rtt;
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
>> +    if (WARN_ON(level > RMM_RTT_MAX_LEVEL))
>> +        return -EINVAL;
>> +
>> +    map_size = rmi_rtt_level_mapsize(level - 1);
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
>> +            free_rtt(rtt_granule);
>> +            break;
>> +        case RMI_ERROR_RTT:
>> +            if (next_addr > addr) {
>> +                /* Missing RTT, skip */
>> +                break;
>> +            }
>> +            /*
>> +             * We tear down the RTT range for the full IPA
>> +             * space, after everything is unmapped. Also we
>> +             * descend down only if we cannot tear down a
>> +             * top level RTT. Thus RMM must be able to walk
>> +             * to the requested level. e.g., a block mapping
>> +             * exists at L1 or L2.
>> +             */
>> +            if (WARN_ON(RMI_RETURN_INDEX(ret) != level))
>> +                return -EBUSY;
>> +            if (WARN_ON(level == RMM_RTT_MAX_LEVEL))
>> +                return -EBUSY;
>> +
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
>> +    /*
>> +     * Root level RTTs can only be destroyed after the RD is
>> destroyed. So
>> +     * tear down everything below the root level
>> +     */
>> +    return realm_tear_down_rtt_level(realm, get_start_level(realm) + 1,
>> +                     start, end);
>> +}
>> +
>> +void kvm_realm_destroy_rtts(struct kvm *kvm)
>> +{
>> +    struct realm *realm = &kvm->arch.realm;
>> +    unsigned int ia_bits = realm->ia_bits;
>> +
>> +    WARN_ON(realm_tear_down_rtt_range(realm, 0, (1UL << ia_bits)));
> 
> AFAICS, we already WARN_ON() in all the cases where the
> realm_tear_down_rtt_range() fails, so may be we can skip this
> WARN_ON here ?

So we do - yes this WARN_ON is unnecessary.

Thanks,
Steve

> Suzuki
> 
>> +}
>> +
>>   void kvm_destroy_realm(struct kvm *kvm)
>>   {
>>       struct realm *realm = &kvm->arch.realm;
>> @@ -246,6 +389,8 @@ void kvm_destroy_realm(struct kvm *kvm)
>>       if (realm->rd) {
>>           phys_addr_t rd_phys = virt_to_phys(realm->rd);
>>   +        kvm_realm_destroy_rtts(kvm);
>> +
>>           if (WARN_ON(rmi_realm_destroy(rd_phys)))
>>               return;
>>           free_delegated_page(rd_phys);
> 


