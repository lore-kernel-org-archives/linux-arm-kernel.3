Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04C4CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsNNpwuaNWCx6IF2fYdIjP4i3Bg9HiXabOkg1WM5zo8=; b=Jxkyyvh2maDE7mPXZnZqW2M6eS
	+Iwre23VY2hYkiRLosnvGL/wlSER8UQ40ku8INpwEEg8U8Hg/2f1CrVvB7REdfnFzIP1B8A9ytTuO
	3HrvokuQPBr2Z+3h1vS4UFdwqbOr4N10VOaZ4lHKqs/xsSNom7buFIhkE+N4m3S3OiIvlMM/xUejC
	WTX7MO/Q0/ttgexVnYLBFknKcFZPshXo88hhR/M+8IYrK3EypIkTZyJfhIP3Hb/cOUKey7NGH1cDl
	SG/5XI/tQ6/w0YOstJqi0Ov8XtWgzBk52DBKWoQAEeFwg1GRGMep3IgEwav17md2y6CrNG8zHi8FJ
	dQwuu2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLIO-0000000HGr5-0CG5;
	Fri, 07 Nov 2025 12:10:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLIL-0000000HGqi-007g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:10:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46C6B1516;
	Fri,  7 Nov 2025 04:10:12 -0800 (PST)
Received: from [10.57.86.134] (unknown [10.57.86.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E6EB3F66E;
	Fri,  7 Nov 2025 04:10:18 -0800 (PST)
Message-ID: <823463ee-f8c9-4023-892e-6e6532a1a813@arm.com>
Date: Fri, 7 Nov 2025 12:10:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Don't sleep in
 split_kernel_leaf_mapping() when in atomic context
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, david@redhat.com, ardb@kernel.org, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@google.com>
References: <20251106160945.3182799-1-ryan.roberts@arm.com>
 <20251106160945.3182799-2-ryan.roberts@arm.com>
 <d6d7e038-aa94-491a-8ad6-f48541b98b6a@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <d6d7e038-aa94-491a-8ad6-f48541b98b6a@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_041021_848272_921DBD3E 
X-CRM114-Status: GOOD (  30.45  )
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

On 06/11/2025 20:46, Yang Shi wrote:
> 
> 
> On 11/6/25 8:09 AM, Ryan Roberts wrote:
>> It has been reported that split_kernel_leaf_mapping() is trying to sleep
>> in non-sleepable context. It does this when acquiring the
>> pgtable_split_lock mutex, when either CONFIG_DEBUG_PAGEALLOC or
>> CONFIG_KFENCE are enabled, which change linear map permissions within
>> softirq context during memory allocation and/or freeing. All other paths
>> into this function are called from sleepable context and so are safe.
>>
>> But it turns out that the memory for which these 2 features may attempt
>> to modify the permissions is always mapped by pte, so there is no need
>> to attempt to split the mapping. So let's exit early in these cases and
>> avoid attempting to take the mutex.
>>
>> There is one wrinkle to this approach; late-initialized kfence allocates
>> it's pool from the buddy which may be block mapped. So we must hook that
>> allocation and convert it to pte-mappings up front. Previously this was
>> done as a side-effect of kfence protecting all the individual pages in
>> its pool at init-time, but this no longer works due to the added early
>> exit path in split_kernel_leaf_mapping().
>>
>> So instead, do this via the existing arch_kfence_init_pool() arch hook,
>> and reuse the existing linear_map_split_to_ptes() infrastructure.
>>
>> Closes: https://lore.kernel.org/all/f24b9032-0ec9-47b1-8b95-
>> c0eeac7a31c5@roeck-us.net/
>> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
>> Tested-by: Guenter Roeck <groeck@google.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> Reviewed-by: Yang Shi <yang@os.amperecomputing.com>
> 
> Just a nit below:
> 
>> ---
>>   arch/arm64/include/asm/kfence.h |  3 +-
>>   arch/arm64/mm/mmu.c             | 92 +++++++++++++++++++++++----------
>>   2 files changed, 67 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kfence.h b/arch/arm64/include/asm/kfence.h
>> index a81937fae9f6..21dbc9dda747 100644
>> --- a/arch/arm64/include/asm/kfence.h
>> +++ b/arch/arm64/include/asm/kfence.h
>> @@ -10,8 +10,6 @@
>>     #include <asm/set_memory.h>
>>   -static inline bool arch_kfence_init_pool(void) { return true; }
>> -
>>   static inline bool kfence_protect_page(unsigned long addr, bool protect)
>>   {
>>       set_memory_valid(addr, 1, !protect);
>> @@ -25,6 +23,7 @@ static inline bool arm64_kfence_can_set_direct_map(void)
>>   {
>>       return !kfence_early_init;
>>   }
>> +bool arch_kfence_init_pool(void);
>>   #else /* CONFIG_KFENCE */
>>   static inline bool arm64_kfence_can_set_direct_map(void) { return false; }
>>   #endif /* CONFIG_KFENCE */
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index b8d37eb037fc..a364ac2c9c61 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -708,6 +708,16 @@ static int split_kernel_leaf_mapping_locked(unsigned long
>> addr)
>>       return ret;
>>   }
>>   +static inline bool force_pte_mapping(void)
>> +{
>> +    bool bbml2 = system_capabilities_finalized() ?
>> +        system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
>> +
>> +    return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
>> +               is_realm_world())) ||
>> +        debug_pagealloc_enabled();
>> +}
>> +
>>   static DEFINE_MUTEX(pgtable_split_lock);
>>     int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>> @@ -723,6 +733,16 @@ int split_kernel_leaf_mapping(unsigned long start,
>> unsigned long end)
>>       if (!system_supports_bbml2_noabort())
>>           return 0;
>>   +    /*
>> +     * If the region is within a pte-mapped area, there is no need to try to
>> +     * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
>> +     * change permissions from atomic context so for those cases (which are
>> +     * always pte-mapped), we must not go any further because taking the
>> +     * mutex below may sleep.
> 
> The path 3 changed the comment, but since patch 3 just does some cleanup and
> code deduplication, there is no functional change, so why not just use the
> comment from patch 3?

The reason I changed it is because in patch 3 we introduce
split_leaf_mapping_possible(), which is also doing the
!system_supports_bbml2_noabort() check above, so this original comment only
applies to a subset of the reasons we may exit here. It felt confusing to me. So
I decided to simplify it. The rationale is all captured in the commit log, so I
didn't think it was a big deal.

Thanks,
Ryan

> 
> Thanks,
> Yang
> 
>> +     */
>> +    if (force_pte_mapping() || is_kfence_address((void *)start))
>> +        return 0;
>> +
>>       /*
>>        * Ensure start and end are at least page-aligned since this is the
>>        * finest granularity we can split to.
>> @@ -758,30 +778,30 @@ int split_kernel_leaf_mapping(unsigned long start,
>> unsigned long end)
>>       return ret;
>>   }
>>   -static int __init split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>> -                      unsigned long next,
>> -                      struct mm_walk *walk)
>> +static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>> +                   unsigned long next, struct mm_walk *walk)
>>   {
>> +    gfp_t gfp = *(gfp_t *)walk->private;
>>       pud_t pud = pudp_get(pudp);
>>       int ret = 0;
>>         if (pud_leaf(pud))
>> -        ret = split_pud(pudp, pud, GFP_ATOMIC, false);
>> +        ret = split_pud(pudp, pud, gfp, false);
>>         return ret;
>>   }
>>   -static int __init split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>> -                      unsigned long next,
>> -                      struct mm_walk *walk)
>> +static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>> +                   unsigned long next, struct mm_walk *walk)
>>   {
>> +    gfp_t gfp = *(gfp_t *)walk->private;
>>       pmd_t pmd = pmdp_get(pmdp);
>>       int ret = 0;
>>         if (pmd_leaf(pmd)) {
>>           if (pmd_cont(pmd))
>>               split_contpmd(pmdp);
>> -        ret = split_pmd(pmdp, pmd, GFP_ATOMIC, false);
>> +        ret = split_pmd(pmdp, pmd, gfp, false);
>>             /*
>>            * We have split the pmd directly to ptes so there is no need to
>> @@ -793,9 +813,8 @@ static int __init split_to_ptes_pmd_entry(pmd_t *pmdp,
>> unsigned long addr,
>>       return ret;
>>   }
>>   -static int __init split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>> -                      unsigned long next,
>> -                      struct mm_walk *walk)
>> +static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>> +                   unsigned long next, struct mm_walk *walk)
>>   {
>>       pte_t pte = __ptep_get(ptep);
>>   @@ -805,12 +824,18 @@ static int __init split_to_ptes_pte_entry(pte_t *ptep,
>> unsigned long addr,
>>       return 0;
>>   }
>>   -static const struct mm_walk_ops split_to_ptes_ops __initconst = {
>> +static const struct mm_walk_ops split_to_ptes_ops = {
>>       .pud_entry    = split_to_ptes_pud_entry,
>>       .pmd_entry    = split_to_ptes_pmd_entry,
>>       .pte_entry    = split_to_ptes_pte_entry,
>>   };
>>   +static int range_split_to_ptes(unsigned long start, unsigned long end,
>> gfp_t gfp)
>> +{
>> +    return walk_kernel_page_table_range_lockless(start, end,
>> +                    &split_to_ptes_ops, NULL, &gfp);
>> +}
>> +
>>   static bool linear_map_requires_bbml2 __initdata;
>>     u32 idmap_kpti_bbml2_flag;
>> @@ -847,11 +872,9 @@ static int __init linear_map_split_to_ptes(void *__unused)
>>            * PTE. The kernel alias remains static throughout runtime so
>>            * can continue to be safely mapped with large mappings.
>>            */
>> -        ret = walk_kernel_page_table_range_lockless(lstart, kstart,
>> -                        &split_to_ptes_ops, NULL, NULL);
>> +        ret = range_split_to_ptes(lstart, kstart, GFP_ATOMIC);
>>           if (!ret)
>> -            ret = walk_kernel_page_table_range_lockless(kend, lend,
>> -                        &split_to_ptes_ops, NULL, NULL);
>> +            ret = range_split_to_ptes(kend, lend, GFP_ATOMIC);
>>           if (ret)
>>               panic("Failed to split linear map\n");
>>           flush_tlb_kernel_range(lstart, lend);
>> @@ -1002,6 +1025,33 @@ static void __init arm64_kfence_map_pool(phys_addr_t
>> kfence_pool, pgd_t *pgdp)
>>       memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
>>       __kfence_pool = phys_to_virt(kfence_pool);
>>   }
>> +
>> +bool arch_kfence_init_pool(void)
>> +{
>> +    unsigned long start = (unsigned long)__kfence_pool;
>> +    unsigned long end = start + KFENCE_POOL_SIZE;
>> +    int ret;
>> +
>> +    /* Exit early if we know the linear map is already pte-mapped. */
>> +    if (!system_supports_bbml2_noabort() || force_pte_mapping())
>> +        return true;
>> +
>> +    /* Kfence pool is already pte-mapped for the early init case. */
>> +    if (kfence_early_init)
>> +        return true;
>> +
>> +    mutex_lock(&pgtable_split_lock);
>> +    ret = range_split_to_ptes(start, end, GFP_PGTABLE_KERNEL);
>> +    mutex_unlock(&pgtable_split_lock);
>> +
>> +    /*
>> +     * Since the system supports bbml2_noabort, tlb invalidation is not
>> +     * required here; the pgtable mappings have been split to pte but larger
>> +     * entries may safely linger in the TLB.
>> +     */
>> +
>> +    return !ret;
>> +}
>>   #else /* CONFIG_KFENCE */
>>     static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
>> @@ -1009,16 +1059,6 @@ static inline void arm64_kfence_map_pool(phys_addr_t
>> kfence_pool, pgd_t *pgdp) {
>>     #endif /* CONFIG_KFENCE */
>>   -static inline bool force_pte_mapping(void)
>> -{
>> -    bool bbml2 = system_capabilities_finalized() ?
>> -        system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
>> -
>> -    return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
>> -               is_realm_world())) ||
>> -        debug_pagealloc_enabled();
>> -}
>> -
>>   static void __init map_mem(pgd_t *pgdp)
>>   {
>>       static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
> 


