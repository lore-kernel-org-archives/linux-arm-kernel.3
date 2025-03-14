Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D036C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aqyitw+gdmIi1YbuPmoUYkP1heLBu3YcCjKB7lHWTok=; b=E5+QfEJV4E8pKgsgFPv6tzUsvz
	hLMwPC56g+/lk+NiPiAfDUCJ+67ipE9gdyIfUjqMRGsT+12pLpT4ahsp95p4C2a3c1Qz5s88lhtcz
	zRHQ8k+awjJM245OeQGRBeUQE2i7GEcthOCLnM/aq3+6O1/HB3Z5752sxCWsMESaxVNOxnmSM0Tqk
	1f8AxZ8LIhmZQ+vk1vjN9LOd2lb7Tl1lOY9ootG0CES2OO+zNVRJozDUMOvcmTgPFcpUDi48T6J6p
	MW3A2QnXzaCciYHH4g63TZbaOg4cXql+teBG+moROBMOydmnnbw6oNVm67jPB5qpaq8fUI+jXR4WV
	JIoKf9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5HA-0000000EJ7U-19RL;
	Fri, 14 Mar 2025 13:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt59x-0000000EHu2-1AVU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 13:33:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4DDF1424;
	Fri, 14 Mar 2025 06:33:18 -0700 (PDT)
Received: from [10.57.85.159] (unknown [10.57.85.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 927103F673;
	Fri, 14 Mar 2025 06:33:07 -0700 (PDT)
Message-ID: <fe8ced5d-c9d8-479b-9088-e0294565cb95@arm.com>
Date: Fri, 14 Mar 2025 13:33:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 5/6] arm64: mm: support split CONT mappings
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <20250304222018.615808-6-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250304222018.615808-6-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_063309_415425_362A0002 
X-CRM114-Status: GOOD (  29.43  )
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

On 04/03/2025 22:19, Yang Shi wrote:
> Add split CONT mappings support in order to support CONT mappings for
> direct map.  This should help reduce TLB pressure further.
> 
> When splitting PUD, all PMDs will have CONT bit set since the leaf PUD
> must be naturally aligned.  When splitting PMD, all PTEs will have CONT
> bit set since the leaf PMD must be naturally aligned too, but the PMDs
> in the cont range of split PMD will have CONT bit cleared.  Splitting
> CONT PTEs by clearing CONT bit for all PTEs in the range.

My expectation is that this patch is not needed if you take the approach of
reusing the existing code to generate the new lower parts of the hierachy as
suggested in the previous patch.

Thanks,
Ryan

> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/pgtable.h |  5 ++
>  arch/arm64/mm/mmu.c              | 82 ++++++++++++++++++++++++++------
>  arch/arm64/mm/pageattr.c         |  2 +
>  3 files changed, 75 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index ed2fc1dcf7ae..3c6ef47f5813 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -290,6 +290,11 @@ static inline pmd_t pmd_mkcont(pmd_t pmd)
>  	return __pmd(pmd_val(pmd) | PMD_SECT_CONT);
>  }
>  
> +static inline pmd_t pmd_mknoncont(pmd_t pmd)
> +{
> +	return __pmd(pmd_val(pmd) & ~PMD_SECT_CONT);
> +}
> +
>  static inline pte_t pte_mkdevmap(pte_t pte)
>  {
>  	return set_pte_bit(pte, __pgprot(PTE_DEVMAP | PTE_SPECIAL));
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ad0f1cc55e3a..d4dfeabc80e9 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -167,19 +167,36 @@ static void init_clear_pgtable(void *table)
>  	dsb(ishst);
>  }
>  
> +static void split_cont_pte(pte_t *ptep)
> +{
> +	pte_t *_ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
> +	pte_t _pte;
> +	for (int i = 0; i < CONT_PTES; i++, _ptep++) {
> +		_pte = READ_ONCE(*_ptep);
> +		_pte = pte_mknoncont(_pte);
> +		__set_pte_nosync(_ptep, _pte);
> +	}
> +
> +	dsb(ishst);
> +	isb();
> +}
> +
>  static int split_pmd(pmd_t *pmdp, pmd_t pmdval,
> -		     phys_addr_t (*pgtable_alloc)(int))
> +		     phys_addr_t (*pgtable_alloc)(int), int flags)
>  {
>  	unsigned long pfn;
>  	pgprot_t prot;
>  	phys_addr_t pte_phys;
>  	pte_t *ptep;
> +	bool cont;
> +	int i;
>  
>  	if (!pmd_leaf(pmdval))
>  		return 0;
>  
>  	pfn = pmd_pfn(pmdval);
>  	prot = pmd_pgprot(pmdval);
> +	cont = pgprot_val(prot) & PTE_CONT;
>  
>  	pte_phys = pgtable_alloc(PAGE_SHIFT);
>  	if (!pte_phys)
> @@ -188,11 +205,27 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmdval,
>  	ptep = (pte_t *)phys_to_virt(pte_phys);
>  	init_clear_pgtable(ptep);
>  	prot = __pgprot(pgprot_val(prot) | PTE_TYPE_PAGE);
> -	for (int i = 0; i < PTRS_PER_PTE; i++, ptep++)
> +
> +	/* It must be naturally aligned if PMD is leaf */
> +	if ((flags & NO_CONT_MAPPINGS) == 0)
> +		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
> +
> +	for (i = 0; i < PTRS_PER_PTE; i++, ptep++)
>  		__set_pte_nosync(ptep, pfn_pte(pfn + i, prot));
>  
>  	dsb(ishst);
>  
> +	/* Clear CONT bit for the PMDs in the range */
> +	if (cont) {
> +		pmd_t *_pmdp, _pmd;
> +		_pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
> +		for (i = 0; i < CONT_PMDS; i++, _pmdp++) {
> +			_pmd = READ_ONCE(*_pmdp);
> +			_pmd = pmd_mknoncont(_pmd);
> +			set_pmd(_pmdp, _pmd);
> +		}
> +	}
> +
>  	set_pmd(pmdp, pfn_pmd(__phys_to_pfn(pte_phys),
>  		__pgprot(PMD_TYPE_TABLE)));
>  
> @@ -200,7 +233,7 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmdval,
>  }
>  
>  static int split_pud(pud_t *pudp, pud_t pudval,
> -		     phys_addr_t (*pgtable_alloc)(int))
> +		     phys_addr_t (*pgtable_alloc)(int), int flags)
>  {
>  	unsigned long pfn;
>  	pgprot_t prot;
> @@ -221,6 +254,11 @@ static int split_pud(pud_t *pudp, pud_t pudval,
>  
>  	pmdp = (pmd_t *)phys_to_virt(pmd_phys);
>  	init_clear_pgtable(pmdp);
> +
> +	/* It must be naturally aligned if PUD is leaf */
> +	if ((flags & NO_CONT_MAPPINGS) == 0)
> +		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
> +
>  	for (int i = 0; i < PTRS_PER_PMD; i++, pmdp++) {
>  		__set_pmd_nosync(pmdp, pfn_pmd(pfn, prot));
>  		pfn += step;
> @@ -235,11 +273,18 @@ static int split_pud(pud_t *pudp, pud_t pudval,
>  }
>  
>  static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
> -		     phys_addr_t phys, pgprot_t prot)
> +		     phys_addr_t phys, pgprot_t prot, int flags)
>  {
>  	do {
>  		pte_t old_pte = __ptep_get(ptep);
>  
> +		if (flags & SPLIT_MAPPINGS) {
> +			if (pte_cont(old_pte))
> +				split_cont_pte(ptep);
> +
> +			continue;
> +		}
> +
>  		/*
>  		 * Required barriers to make this visible to the table walker
>  		 * are deferred to the end of alloc_init_cont_pte().
> @@ -266,8 +311,16 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  	unsigned long next;
>  	pmd_t pmd = READ_ONCE(*pmdp);
>  	pte_t *ptep;
> +	bool split = flags & SPLIT_MAPPINGS;
>  
>  	BUG_ON(pmd_sect(pmd));
> +
> +	if (split) {
> +		BUG_ON(pmd_none(pmd));
> +		ptep = pte_offset_kernel(pmdp, addr);
> +		goto split_pgtable;
> +	}
> +
>  	if (pmd_none(pmd)) {
>  		pmdval_t pmdval = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>  		phys_addr_t pte_phys;
> @@ -287,6 +340,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  		ptep = pte_set_fixmap_offset(pmdp, addr);
>  	}
>  
> +split_pgtable:
>  	do {
>  		pgprot_t __prot = prot;
>  
> @@ -297,7 +351,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  		    (flags & NO_CONT_MAPPINGS) == 0)
>  			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
> -		init_pte(ptep, addr, next, phys, __prot);
> +		init_pte(ptep, addr, next, phys, __prot, flags);
>  
>  		ptep += pte_index(next) - pte_index(addr);
>  		phys += next - addr;
> @@ -308,7 +362,8 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  	 * ensure that all previous pgtable writes are visible to the table
>  	 * walker.
>  	 */
> -	pte_clear_fixmap();
> +	if (!split)
> +		pte_clear_fixmap();
>  
>  	return 0;
>  }
> @@ -327,7 +382,12 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  		next = pmd_addr_end(addr, end);
>  
>  		if (split) {
> -			ret = split_pmd(pmdp, old_pmd, pgtable_alloc);
> +			ret = split_pmd(pmdp, old_pmd, pgtable_alloc, flags);
> +			if (ret)
> +				break;
> +
> +			ret = alloc_init_cont_pte(pmdp, addr, next, phys, prot,
> +						  pgtable_alloc, flags);
>  			if (ret)
>  				break;
>  
> @@ -469,7 +529,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  		next = pud_addr_end(addr, end);
>  
>  		if (split) {
> -			ret = split_pud(pudp, old_pud, pgtable_alloc);
> +			ret = split_pud(pudp, old_pud, pgtable_alloc, flags);
>  			if (ret)
>  				break;
>  
> @@ -846,9 +906,6 @@ static void __init map_mem(pgd_t *pgdp)
>  	if (force_pte_mapping())
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  
> -	if (rodata_full)
> -		flags |= NO_CONT_MAPPINGS;
> -
>  	/*
>  	 * Take care not to create a writable alias for the
>  	 * read-only text and rodata sections of the kernel image.
> @@ -1547,9 +1604,6 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	if (force_pte_mapping())
>  		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  
> -	if (rodata_full)
> -		flags |= NO_CONT_MAPPINGS;
> -
>  	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
>  			     size, params->pgprot, __pgd_pgtable_alloc,
>  			     flags);
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 5d42d87ea7e1..25c068712cb5 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -43,6 +43,8 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>  	struct page_change_data *cdata = data;
>  	pte_t pte = __ptep_get(ptep);
>  
> +	BUG_ON(pte_cont(pte));
> +
>  	pte = clear_pte_bit(pte, cdata->clear_mask);
>  	pte = set_pte_bit(pte, cdata->set_mask);
>  


