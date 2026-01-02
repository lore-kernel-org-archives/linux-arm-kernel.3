Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A718FA372A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qT3aT+OgG7suBjJEnQIsAgoG4+GG+980oTtAvcIy8Jk=; b=aACvuNGQcHsgov9xVeAjbUQO1H
	Spgy8EpW00ExyMu1Q1abAODo9pAJ6jeh217RPpRTrwcz9UkP2ROoE3jSFUz08u3snGASlwI7A+FnF
	9zz0d43VMl62L/tqB8in2wydme20HMzXMGrJQ+GYvaazMu4oCAfjJ6G9GFck55RL7GkKU1BWTGCbE
	Uav0/OtV+/83hryxDoogLoS+6hv2mBh/lCxPyxrMUdfy+8AHNYbmb2AKJGTKFwfRtmhXi5NAMMf3I
	aimm24XywoumV3Wtkc+B92S7odETXhLm+43ZqbYq/TB5jf5zet0sxnUzp6ItdqkwpxIbv3mYH89Tc
	rr7lrrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbd23-0000000878t-1hrd;
	Fri, 02 Jan 2026 11:09:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbd21-0000000878Y-1peS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:09:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5A2F497;
	Fri,  2 Jan 2026 03:09:11 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F40563F63F;
	Fri,  2 Jan 2026 03:09:14 -0800 (PST)
Message-ID: <81e4b007-bd9f-4770-b7fa-15a898bab9db@arm.com>
Date: Fri, 2 Jan 2026 11:09:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: mmu: avoid allocating pages while splitting
 the linear mapping
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, david@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
 vbabka@suse.cz, mhocko@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20251218194750.395301-1-yeoreum.yun@arm.com>
 <20251218194750.395301-2-yeoreum.yun@arm.com>
 <cd1c9dd0-dc1a-497c-b78f-d6c6dde898d9@arm.com>
In-Reply-To: <cd1c9dd0-dc1a-497c-b78f-d6c6dde898d9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_030921_587759_5BBB704A 
X-CRM114-Status: GOOD (  45.82  )
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

On 02/01/2026 11:03, Ryan Roberts wrote:
> On 18/12/2025 19:47, Yeoreum Yun wrote:
>> linear_map_split_to_ptes() currently allocates page tables while
>> splitting the linear mapping into PTEs under stop_machine() using GFP_ATOMIC.
>>
>> This is fine for non-PREEMPT_RT configurations.
>> However, it becomes problematic on PREEMPT_RT, because
>> generic memory allocation/free APIs (e.g. pgtable_alloc(), __get_free_pages(), etc.)
>> cannot be called from a non-preemptible context, except for the _nolock() variants.
>> This is because generic memory allocation/free paths are sleepable,
>> as they rely on spin_lock(), which becomes sleepable on PREEMPT_RT.
>>
>> In other words, even calling pgtable_alloc() with GFP_ATOMIC is not permitted
>> in __linear_map_split_to_pte() when it is executed by the stopper thread,
>>  where preemption is disabled on PREEMPT_RT.
>>
>> To address this, the required number of page tables is first collected
>> and preallocated, and the preallocated page tables are then used
>> when splitting the linear mapping in __linear_map_split_to_pte().
>>
>> Fixes: 3df6979d222b ("arm64: mm: split linear mapping if BBML2 unsupported on secondary CPUs")
>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> ---
>>  arch/arm64/mm/mmu.c | 232 +++++++++++++++++++++++++++++++++++---------
>>  1 file changed, 184 insertions(+), 48 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 9ae7ce00a7ef..96a9fa505e71 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -527,18 +527,15 @@ static void early_create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>>  		panic("Failed to create page tables\n");
>>  }
>>  
>> -static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>> -				       enum pgtable_type pgtable_type)
>> -{
>> -	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>> -	struct ptdesc *ptdesc = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
>> -	phys_addr_t pa;
>> -
>> -	if (!ptdesc)
>> -		return INVALID_PHYS_ADDR;
>> -
>> -	pa = page_to_phys(ptdesc_page(ptdesc));
>> +static struct ptdesc **split_pgtables;
>> +static int split_pgtables_order;
>> +static unsigned long split_pgtables_count;
>> +static unsigned long split_pgtables_idx;
>>  
>> +static __always_inline void __pgd_pgtable_init(struct mm_struct *mm,
>> +					       struct ptdesc *ptdesc,
>> +					       enum pgtable_type pgtable_type)
>> +{
>>  	switch (pgtable_type) {
>>  	case TABLE_PTE:
>>  		BUG_ON(!pagetable_pte_ctor(mm, ptdesc));
>> @@ -554,19 +551,28 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>>  		break;
>>  	}
>>  
> 
> nit: no need for this empty line
> 
>> -	return pa;
>>  }
>>  
>> -static phys_addr_t
>> -pgd_pgtable_alloc_init_mm_gfp(enum pgtable_type pgtable_type, gfp_t gfp)
>> +static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
> 
> nit: all remaining callers pass gfp=GFP_PGTABLE_KERNEL so you could remove the
> param?
> 
>> +				       enum pgtable_type pgtable_type)
>>  {
>> -	return __pgd_pgtable_alloc(&init_mm, gfp, pgtable_type);
>> +	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>> +	struct ptdesc *ptdesc = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
>> +
>> +	if (!ptdesc)
>> +		return INVALID_PHYS_ADDR;
>> +
>> +	__pgd_pgtable_init(mm, ptdesc, pgtable_type);
>> +
>> +	return page_to_phys(ptdesc_page(ptdesc));
>>  }
>>  
>> +typedef phys_addr_t (split_pgtable_alloc_fn)(enum pgtable_type);
> 
> This type is used more generally than just for splitting. Perhaps simply call it
> "pgtable_alloc_fn"?
> 
> We also pass this type around in __create_pgd_mapping() and friends; perhaps we
> should have a preparatory patch to define this type and consistently use it
> everywhere instead of passing around "phys_addr_t (*pgtable_alloc)(enum
> pgtable_type)"?
> 
>> +
>>  static phys_addr_t __maybe_unused
> 
> This is no longer __maybe_unused; you can drop the decorator.
> 
>>  pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
>>  {
>> -	return pgd_pgtable_alloc_init_mm_gfp(pgtable_type, GFP_PGTABLE_KERNEL);
>> +	return __pgd_pgtable_alloc(&init_mm, GFP_PGTABLE_KERNEL, pgtable_type);
>>  }
>>  
>>  static phys_addr_t
>> @@ -575,6 +581,23 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
>>  	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_type);
>>  }
>>  
>> +static phys_addr_t
>> +pgd_pgtable_get_preallocated(enum pgtable_type pgtable_type)
>> +{
>> +	struct ptdesc *ptdesc;
>> +
>> +	if (WARN_ON(split_pgtables_idx >= split_pgtables_count))
>> +		return INVALID_PHYS_ADDR;
>> +
>> +	ptdesc = split_pgtables[split_pgtables_idx++];
>> +	if (!ptdesc)
>> +		return INVALID_PHYS_ADDR;
>> +
>> +	__pgd_pgtable_init(&init_mm, ptdesc, pgtable_type);
>> +
>> +	return page_to_phys(ptdesc_page(ptdesc));
>> +}
>> +
>>  static void split_contpte(pte_t *ptep)
>>  {
>>  	int i;
>> @@ -584,7 +607,9 @@ static void split_contpte(pte_t *ptep)
>>  		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
>>  }
>>  
>> -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>> +static int split_pmd(pmd_t *pmdp, pmd_t pmd,
>> +		     split_pgtable_alloc_fn *pgtable_alloc_fn,
> 
> nit: I believe the * has no effect when passing function pointers and the usual
> convention in Linux is to not use the *. Existing functions are also calling it
> "pgtable_alloc" so perhaps this is a bit more consistent:
> 
> pgtable_alloc_fn pgtable_alloc
> 
> (same nitty comment for all uses below :) )
> 
>> +		     bool to_cont)
>>  {
>>  	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>>  	unsigned long pfn = pmd_pfn(pmd);
>> @@ -593,7 +618,7 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>>  	pte_t *ptep;
>>  	int i;
>>  
>> -	pte_phys = pgd_pgtable_alloc_init_mm_gfp(TABLE_PTE, gfp);
>> +	pte_phys = pgtable_alloc_fn(TABLE_PTE);
>>  	if (pte_phys == INVALID_PHYS_ADDR)
>>  		return -ENOMEM;
>>  	ptep = (pte_t *)phys_to_virt(pte_phys);
>> @@ -628,7 +653,9 @@ static void split_contpmd(pmd_t *pmdp)
>>  		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
>>  }
>>  
>> -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>> +static int split_pud(pud_t *pudp, pud_t pud,
>> +		     split_pgtable_alloc_fn *pgtable_alloc_fn,
>> +		     bool to_cont)
>>  {
>>  	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>>  	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
>> @@ -638,7 +665,7 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>>  	pmd_t *pmdp;
>>  	int i;
>>  
>> -	pmd_phys = pgd_pgtable_alloc_init_mm_gfp(TABLE_PMD, gfp);
>> +	pmd_phys = pgtable_alloc_fn(TABLE_PMD);
>>  	if (pmd_phys == INVALID_PHYS_ADDR)
>>  		return -ENOMEM;
>>  	pmdp = (pmd_t *)phys_to_virt(pmd_phys);
>> @@ -707,7 +734,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>  	if (!pud_present(pud))
>>  		goto out;
>>  	if (pud_leaf(pud)) {
>> -		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
>> +		ret = split_pud(pudp, pud, pgd_pgtable_alloc_init_mm, true);
>>  		if (ret)
>>  			goto out;
>>  	}
>> @@ -732,7 +759,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>  		 */
>>  		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>  			goto out;
>> -		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>> +		ret = split_pmd(pmdp, pmd, pgd_pgtable_alloc_init_mm, true);
>>  		if (ret)
>>  			goto out;
>>  	}
>> @@ -831,34 +858,35 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>  static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>>  				   unsigned long next, struct mm_walk *walk)
>>  {
>> -	gfp_t gfp = *(gfp_t *)walk->private;
>> +	split_pgtable_alloc_fn *pgtable_alloc_fn = walk->private;
>>  	pud_t pud = pudp_get(pudp);
>> -	int ret = 0;
>>  
>> -	if (pud_leaf(pud))
>> -		ret = split_pud(pudp, pud, gfp, false);
>> +	if (!pud_leaf(pud))
>> +		return 0;
>>  
>> -	return ret;
>> +	return split_pud(pudp, pud, pgtable_alloc_fn, false);
> 
> why are you changing the layout of this function? Seems like unneccessary churn.
> Just pass pgtable_alloc to split_pud() instead of gfp.
> 
>>  }
>>  
>>  static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>>  				   unsigned long next, struct mm_walk *walk)
>>  {
>> -	gfp_t gfp = *(gfp_t *)walk->private;
>> +	split_pgtable_alloc_fn *pgtable_alloc_fn = walk->private;
>>  	pmd_t pmd = pmdp_get(pmdp);
>> -	int ret = 0;
>> +	int ret;
>>  
>> -	if (pmd_leaf(pmd)) {
>> -		if (pmd_cont(pmd))
>> -			split_contpmd(pmdp);
>> -		ret = split_pmd(pmdp, pmd, gfp, false);
>> +	if (!pmd_leaf(pmd))
>> +		return 0;
>>  
>> -		/*
>> -		 * We have split the pmd directly to ptes so there is no need to
>> -		 * visit each pte to check if they are contpte.
>> -		 */
>> -		walk->action = ACTION_CONTINUE;
>> -	}
>> +	if (pmd_cont(pmd))
>> +		split_contpmd(pmdp);
>> +
>> +	ret = split_pmd(pmdp, pmd, pgtable_alloc_fn, false);
>> +
>> +	/*
>> +	 * We have split the pmd directly to ptes so there is no need to
>> +	 * visit each pte to check if they are contpte.
>> +	 */
>> +	walk->action = ACTION_CONTINUE;
> 
> Same comment; no need to change the layout of the function.
> 
>>  
>>  	return ret;
>>  }
>> @@ -880,13 +908,15 @@ static const struct mm_walk_ops split_to_ptes_ops = {
>>  	.pte_entry	= split_to_ptes_pte_entry,
>>  };
>>  
>> -static int range_split_to_ptes(unsigned long start, unsigned long end, gfp_t gfp)
>> +static int range_split_to_ptes(unsigned long start, unsigned long end,
>> +			       split_pgtable_alloc_fn *pgtable_alloc_fn)
>>  {
>>  	int ret;
>>  
>>  	arch_enter_lazy_mmu_mode();
>>  	ret = walk_kernel_page_table_range_lockless(start, end,
>> -					&split_to_ptes_ops, NULL, &gfp);
>> +						    &split_to_ptes_ops, NULL,
>> +						    pgtable_alloc_fn);
>>  	arch_leave_lazy_mmu_mode();
>>  
>>  	return ret;
>> @@ -903,6 +933,105 @@ static void __init init_idmap_kpti_bbml2_flag(void)
>>  	smp_mb();
>>  }
>>  
>> +static int __init
>> +collect_to_split_pud_entry(pud_t *pudp, unsigned long addr,
>> +			   unsigned long next, struct mm_walk *walk)
>> +{
>> +	pud_t pud = pudp_get(pudp);
>> +
>> +	if (pud_leaf(pud))
>> +		split_pgtables_count += 1 + PTRS_PER_PMD;
> 
> I think you probably want:
> 
> 	walk->action = ACTION_CONTINUE;
> 
> Likely you will end up with the same behaviour regardless. But you should at
> least we consistent with collect_to_split_pmd_entry().
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int __init
>> +collect_to_split_pmd_entry(pmd_t *pmdp, unsigned long addr,
>> +			   unsigned long next, struct mm_walk *walk)
>> +{
>> +	pmd_t pmd = pmdp_get(pmdp);
>> +
>> +	if (pmd_leaf(pmd))
>> +		split_pgtables_count++;
>> +
>> +	walk->action = ACTION_CONTINUE;
>> +
>> +	return 0;
>> +}
>> +
>> +static void __init linear_map_free_split_pgtables(void)
>> +{
>> +	int i;
>> +
>> +	if (!split_pgtables_count || !split_pgtables)
>> +		goto skip_free;
>> +
>> +	for (i = split_pgtables_idx; i < split_pgtables_count; i++) {
>> +		if (split_pgtables[i])
>> +			pagetable_free(split_pgtables[i]);
>> +	}
>> +
>> +	free_pages((unsigned long)split_pgtables, split_pgtables_order);
>> +
>> +skip_free:
>> +	split_pgtables = NULL;
>> +	split_pgtables_count = 0;
>> +	split_pgtables_idx = 0;
>> +	split_pgtables_order = 0;
>> +}
>> +
>> +static int __init linear_map_prealloc_split_pgtables(void)
>> +{
>> +	int ret, i;
>> +	unsigned long lstart = _PAGE_OFFSET(vabits_actual);
>> +	unsigned long lend = PAGE_END;
>> +	unsigned long kstart = (unsigned long)lm_alias(_stext);
>> +	unsigned long kend = (unsigned long)lm_alias(__init_begin);
>> +
>> +	const struct mm_walk_ops collect_to_split_ops = {
>> +		.pud_entry	= collect_to_split_pud_entry,
>> +		.pmd_entry	= collect_to_split_pmd_entry
>> +	};
>> +
>> +	split_pgtables_idx = 0;
>> +	split_pgtables_count = 0;
>> +
>> +	ret = walk_kernel_page_table_range_lockless(lstart, kstart,
>> +						    &collect_to_split_ops,
>> +						    NULL, NULL);
>> +	if (!ret)
>> +		ret = walk_kernel_page_table_range_lockless(kend, lend,
>> +							    &collect_to_split_ops,
>> +							    NULL, NULL);
>> +	if (ret || !split_pgtables_count)
>> +		goto error;
>> +
>> +	ret = -ENOMEM;
>> +
>> +	split_pgtables_order =
>> +		order_base_2(PAGE_ALIGN(split_pgtables_count *
>> +					sizeof(struct ptdesc *)) >> PAGE_SHIFT);
> 
> Wouldn't this be simpler?
> 
> 	split_pgtables_order = get_order(split_pgtables_count *
> 					 sizeof(struct ptdesc *));
> 
>> +
>> +	split_pgtables = (struct ptdesc **) __get_free_pages(GFP_KERNEL | __GFP_ZERO,
>> +							     split_pgtables_order);
> 
> Do you really need the cast? (I'm not sure).
> 
>> +	if (!split_pgtables)
>> +		goto error;
>> +
>> +	for (i = 0; i < split_pgtables_count; i++) {
>> +		split_pgtables[i] = pagetable_alloc(GFP_KERNEL, 0);
> 
> For consistency with other code, perhaps spell it out?:
> 
> 	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
> 	gfp_t gfp = GFP_PGTABLE_KERNEL & ~__GFP_ZERO;
> 
> 	for (i = 0; i < split_pgtables_count; i++) {
> 		split_pgtables[i] = pagetable_alloc(gfp, 0);
> 
>> +		if (!split_pgtables[i])
>> +			goto error;
>> +	}
>> +
>> +	ret = 0;
>> +
>> +error:
>> +	if (ret)
>> +		linear_map_free_split_pgtables();
>> +
>> +	return ret;
>> +}
> 
> I wonder if there is value in generalizing this a bit to separate out the
> determination of the number of pages from the actual pre-allocation and free
> functions? Then you have a reusable pre-allocation function that you could also
> use for the KPTI case instead of having it have yet another private pre-allocator?

Actually ignore this comment; looks like the KPTI case requires the allocation
to be contiguous because it needs to map it into a temp pgtable. So there is a
valid reason for the 2 pre-allocators to be different.

> 
>> +
>>  static int __init linear_map_split_to_ptes(void *__unused)
>>  {
>>  	/*
>> @@ -928,9 +1057,9 @@ static int __init linear_map_split_to_ptes(void *__unused)
>>  		 * PTE. The kernel alias remains static throughout runtime so
>>  		 * can continue to be safely mapped with large mappings.
>>  		 */
>> -		ret = range_split_to_ptes(lstart, kstart, GFP_ATOMIC);
>> +		ret = range_split_to_ptes(lstart, kstart, pgd_pgtable_get_preallocated);
>>  		if (!ret)
>> -			ret = range_split_to_ptes(kend, lend, GFP_ATOMIC);
>> +			ret = range_split_to_ptes(kend, lend, pgd_pgtable_get_preallocated);
>>  		if (ret)
>>  			panic("Failed to split linear map\n");
>>  		flush_tlb_kernel_range(lstart, lend);
>> @@ -963,10 +1092,16 @@ static int __init linear_map_split_to_ptes(void *__unused)
>>  
>>  void __init linear_map_maybe_split_to_ptes(void)
>>  {
>> -	if (linear_map_requires_bbml2 && !system_supports_bbml2_noabort()) {
>> -		init_idmap_kpti_bbml2_flag();
>> -		stop_machine(linear_map_split_to_ptes, NULL, cpu_online_mask);
>> -	}
>> +	if (!linear_map_requires_bbml2 || system_supports_bbml2_noabort())
>> +		return;
>> +
>> +	if (linear_map_prealloc_split_pgtables())
>> +		panic("Failed to split linear map\n");
>> +
>> +	init_idmap_kpti_bbml2_flag();
>> +	stop_machine(linear_map_split_to_ptes, NULL, cpu_online_mask);
>> +
>> +	linear_map_free_split_pgtables();
>>  }
>>  
>>  /*
>> @@ -1088,6 +1223,7 @@ bool arch_kfence_init_pool(void)
>>  	unsigned long end = start + KFENCE_POOL_SIZE;
>>  	int ret;
>>  
>> +
> 
> nit: Remove extra empty line.
> 
> This is looking much cleaner now; nearly there!
> 
> Thanks,
> Ryan
> 
> 
>>  	/* Exit early if we know the linear map is already pte-mapped. */
>>  	if (!split_leaf_mapping_possible())
>>  		return true;
>> @@ -1097,7 +1233,7 @@ bool arch_kfence_init_pool(void)
>>  		return true;
>>  
>>  	mutex_lock(&pgtable_split_lock);
>> -	ret = range_split_to_ptes(start, end, GFP_PGTABLE_KERNEL);
>> +	ret = range_split_to_ptes(start, end, pgd_pgtable_alloc_init_mm);
>>  	mutex_unlock(&pgtable_split_lock);
>>  
>>  	/*
> 


