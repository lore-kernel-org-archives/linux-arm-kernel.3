Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C3BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WupShnkJ2qD8yc8SiHYos+Q1qd1Igx9L4rZI4E0Y64w=; b=vkAAeU5R9sPpb7N0NFAJp3QiAn
	6IHOBtr/sS59TCMRDn5cMl7k7tT/RtN5nxLk4ZODht/YghU1FU7m8WEMbeRxvoIsPasF+WOtRwBjp
	eWLueUJB41VhVjfnJz00H0dipG10+KfauoELSrD3dRPXS5i9PSxbnvTZvJRQMN42q7C5RUB8UXsJJ
	2hY5kyfq9ym0rFyeMEzU5UoQ4QZdtttjjnSYTgsiYpgmjTGhv+pdiyRO/6U7q2pqQoTLGAdByqYHW
	+lUrkjWmvefydfWgA56tWOkvB2VDY7sTuTbhJDJVVB772ZIe8kS92burIdZ97QvFgyWD/QP3oiYCJ
	LTiSm5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxQg-0000000AGOG-10jb;
	Mon, 03 Nov 2025 16:29:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxQd-0000000AGNl-2Z3K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 737191D14;
	Mon,  3 Nov 2025 08:29:02 -0800 (PST)
Received: from [10.1.36.161] (XHFQ2J9959.cambridge.arm.com [10.1.36.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A13F63F694;
	Mon,  3 Nov 2025 08:29:07 -0800 (PST)
Message-ID: <3611cfeb-53d5-4db5-95a1-1d095edfc3c9@arm.com>
Date: Mon, 3 Nov 2025 16:28:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: mm: Don't sleep in split_kernel_leaf_mapping()
 when in atomic context
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, yang@os.amperecomputing.com, david@redhat.com,
 ardb@kernel.org, dev.jain@arm.com, scott@os.amperecomputing.com,
 cl@gentwo.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@google.com>
References: <20251103125738.3073566-1-ryan.roberts@arm.com>
 <aQjMUhspJrRQn5Ew@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aQjMUhspJrRQn5Ew@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_082911_751011_1B1130FA 
X-CRM114-Status: GOOD (  36.41  )
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

Thanks for the fast review!


On 03/11/2025 15:37, Will Deacon wrote:
> On Mon, Nov 03, 2025 at 12:57:37PM +0000, Ryan Roberts wrote:
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
>> and reuse the existing linear_map_split_to_ptes() infrastructure. This
>> will now also be more efficient as a result.
>>
>> Closes: https://lore.kernel.org/all/f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net/
>> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
>> Tested-by: Guenter Roeck <groeck@google.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>
>> Hi All,
>>
>> This is a fuller fix than the suggestion I sent yesterday, and works correctly
>> with late-init kfence (thanks to Yang Shi for pointing that out).
>>
>> I've verified this on AmpereOne with CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE
>> individually, and I've also forced it to take the linear_map_split_to_ptes() to
>> verify that I haven't broken it during the refactoring.
>>
>> I've kept Guenter's T-b since the early-init kfence path that he was testing is
>> unchanged.
>>
>> Assuming nobody spots any issues, I'fd like to get it into the next round of
>> arm64 bug fixes for this cycle.
>>
>> Thanks,
>> Ryan
>>
>>
>>  arch/arm64/include/asm/kfence.h |  4 +-
>>  arch/arm64/mm/mmu.c             | 92 +++++++++++++++++++++++----------
>>  2 files changed, 68 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kfence.h b/arch/arm64/include/asm/kfence.h
>> index a81937fae9f6..4a921e06d750 100644
>> --- a/arch/arm64/include/asm/kfence.h
>> +++ b/arch/arm64/include/asm/kfence.h
>> @@ -10,8 +10,6 @@
>>
>>  #include <asm/set_memory.h>
>>
>> -static inline bool arch_kfence_init_pool(void) { return true; }
>> -
>>  static inline bool kfence_protect_page(unsigned long addr, bool protect)
>>  {
>>  	set_memory_valid(addr, 1, !protect);
>> @@ -25,8 +23,10 @@ static inline bool arm64_kfence_can_set_direct_map(void)
>>  {
>>  	return !kfence_early_init;
>>  }
>> +bool arch_kfence_init_pool(void);
>>  #else /* CONFIG_KFENCE */
>>  static inline bool arm64_kfence_can_set_direct_map(void) { return false; }
>> +static inline bool arch_kfence_init_pool(void) { return false; }
> 
> Why do we need this for the !KFENCE case?

We don't, my bad. I'll remove.

> 
>>  #endif /* CONFIG_KFENCE */
>>
>>  #endif /* __ASM_KFENCE_H */
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index b8d37eb037fc..0385e9b17ab0 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -708,6 +708,16 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>  	return ret;
>>  }
>>
>> +static inline bool force_pte_mapping(void)
>> +{
>> +	bool bbml2 = system_capabilities_finalized() ?
>> +		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
>> +
>> +	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
>> +			   is_realm_world())) ||
>> +		debug_pagealloc_enabled();
>> +}
>> +
>>  static DEFINE_MUTEX(pgtable_split_lock);
>>
>>  int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>> @@ -723,6 +733,16 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>  	if (!system_supports_bbml2_noabort())
>>  		return 0;
>>
>> +	/*
>> +	 * If the region is within a pte-mapped area, there is no need to try to
>> +	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
>> +	 * change permissions from softirq context so for those cases (which are
>> +	 * always pte-mapped), we must not go any further because taking the
>> +	 * mutex below may sleep.
>> +	 */
>> +	if (force_pte_mapping() || is_kfence_address((void *)start))
>> +		return 0;
>> +
>>  	/*
>>  	 * Ensure start and end are at least page-aligned since this is the
>>  	 * finest granularity we can split to.
>> @@ -758,30 +778,30 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>  	return ret;
>>  }
>>
>> -static int __init split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>> -					  unsigned long next,
>> -					  struct mm_walk *walk)
>> +static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>> +				   unsigned long next, struct mm_walk *walk)
>>  {
>> +	gfp_t gfp = *(gfp_t *)walk->private;
>>  	pud_t pud = pudp_get(pudp);
>>  	int ret = 0;
>>
>>  	if (pud_leaf(pud))
>> -		ret = split_pud(pudp, pud, GFP_ATOMIC, false);
>> +		ret = split_pud(pudp, pud, gfp, false);
>>
>>  	return ret;
>>  }
>>
>> -static int __init split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>> -					  unsigned long next,
>> -					  struct mm_walk *walk)
>> +static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>> +				   unsigned long next, struct mm_walk *walk)
>>  {
>> +	gfp_t gfp = *(gfp_t *)walk->private;
>>  	pmd_t pmd = pmdp_get(pmdp);
>>  	int ret = 0;
>>
>>  	if (pmd_leaf(pmd)) {
>>  		if (pmd_cont(pmd))
>>  			split_contpmd(pmdp);
>> -		ret = split_pmd(pmdp, pmd, GFP_ATOMIC, false);
>> +		ret = split_pmd(pmdp, pmd, gfp, false);
>>
>>  		/*
>>  		 * We have split the pmd directly to ptes so there is no need to
>> @@ -793,9 +813,8 @@ static int __init split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>>  	return ret;
>>  }
>>
>> -static int __init split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>> -					  unsigned long next,
>> -					  struct mm_walk *walk)
>> +static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>> +				   unsigned long next, struct mm_walk *walk)
>>  {
>>  	pte_t pte = __ptep_get(ptep);
>>
>> @@ -805,12 +824,24 @@ static int __init split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>>  	return 0;
>>  }
>>
>> -static const struct mm_walk_ops split_to_ptes_ops __initconst = {
>> +static const struct mm_walk_ops split_to_ptes_ops = {
>>  	.pud_entry	= split_to_ptes_pud_entry,
>>  	.pmd_entry	= split_to_ptes_pmd_entry,
>>  	.pte_entry	= split_to_ptes_pte_entry,
>>  };
>>
>> +static int range_split_to_ptes(unsigned long start, unsigned long end, gfp_t gfp)
>> +{
>> +	int ret;
>> +
>> +	arch_enter_lazy_mmu_mode();
>> +	ret = walk_kernel_page_table_range_lockless(start, end,
>> +					&split_to_ptes_ops, NULL, &gfp);
>> +	arch_leave_lazy_mmu_mode();
> 
> Why are you entering/leaving lazy mode now? linear_map_split_to_ptes()
> calls flush_tlb_kernel_range() right after this so now it looks like
> we have more barriers than we need there.

Without the lazy mmu block, every write to every pte (or pmd/pud) will cause a
dsb and isb to be emitted. With the lazy mmu block, we only emit a single
dsb/isb at the end of the block.

linear_map_split_to_ptes() didn't previously have a lazy mmu block; that was an
oversight, I believe. So when refactoring I thought it made sense to make it
common for both cases.

Yes, the flush_tlb_kernel_range() also has the barriers, so the lazy mmu mode is
reducing from a gazillion barriers to 2. We could further optimize from 2 to 1,
but I doubt the performance improvement will be measurable.

Perhaps I've misunderstood your point...?

> 
>> +
>> +	return ret;
>> +}
>> +
>>  static bool linear_map_requires_bbml2 __initdata;
>>
>>  u32 idmap_kpti_bbml2_flag;
>> @@ -847,11 +878,9 @@ static int __init linear_map_split_to_ptes(void *__unused)
>>  		 * PTE. The kernel alias remains static throughout runtime so
>>  		 * can continue to be safely mapped with large mappings.
>>  		 */
>> -		ret = walk_kernel_page_table_range_lockless(lstart, kstart,
>> -						&split_to_ptes_ops, NULL, NULL);
>> +		ret = range_split_to_ptes(lstart, kstart, GFP_ATOMIC);
>>  		if (!ret)
>> -			ret = walk_kernel_page_table_range_lockless(kend, lend,
>> -						&split_to_ptes_ops, NULL, NULL);
>> +			ret = range_split_to_ptes(kend, lend, GFP_ATOMIC);
>>  		if (ret)
>>  			panic("Failed to split linear map\n");
>>  		flush_tlb_kernel_range(lstart, lend);
>> @@ -1002,6 +1031,27 @@ static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp)
>>  	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
>>  	__kfence_pool = phys_to_virt(kfence_pool);
>>  }
>> +
>> +bool arch_kfence_init_pool(void)
>> +{
>> +	unsigned long start = (unsigned long)__kfence_pool;
>> +	unsigned long end = start + KFENCE_POOL_SIZE;
>> +	int ret;
>> +
>> +	/* Exit early if we know the linear map is already pte-mapped. */
>> +	if (!system_supports_bbml2_noabort() || force_pte_mapping())
>> +		return true;
>> +
>> +	/* Kfence pool is already pte-mapped for the early init case. */
>> +	if (kfence_early_init)
>> +		return true;
>> +
>> +	mutex_lock(&pgtable_split_lock);
>> +	ret = range_split_to_ptes(start, end, GFP_PGTABLE_KERNEL);
>> +	mutex_unlock(&pgtable_split_lock);
>> +
>> +	return ret ? false : true;
> 
> return !ret

Yes good point - will fix in the next spin.

Thanks,
Ryan

> 
> Will


