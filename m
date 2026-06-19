Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF2ACD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtf17nAcqkE1zeYx4XFyfSd3nuagmsNAdww1s1Bnf6s=; b=SdyAWFvmqCa7Jwhux+hvDvMTpY
	Lxbyg9B4Km9ie8E2poBpFMqgG0gLV8FPKNZ1zIUGV6QuFHsfD66HEPA9NvFos1avaxaw/I+ljO72h
	hvpAbA/kWHE3BdL3p1jQS6gPP0RWF1DVcl6bm1+dNNKV2GlJcQ5m44vSLtQ4UEjKfO6wQuAmbTC/K
	F64x4hFHs8ZuDcDoR38x5cHnlGZukpNKTsvqYhqJZ012UePmh8RVgzMo2aeBEh/ey3Hqoia6DukVG
	1qk6stlmezwJNATBE5PuEILIZGJuRp9DdezKJ47caTW/Hqdmoc6Dbw6yhhYBprImB4InHEyOhrr19
	Caodw+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZSj-00000002UmJ-3H4S;
	Fri, 19 Jun 2026 13:40:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZSg-00000002Uln-3P3I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:40:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29BBD2938;
	Fri, 19 Jun 2026 06:40:40 -0700 (PDT)
Received: from [10.57.95.87] (unknown [10.57.95.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F6933F763;
	Fri, 19 Jun 2026 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781876444; bh=y77XA/7DurDkPJ2sey/hBkpk1xYL1y8lp90KZto/uGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q0rebgoV9kbYM+UCSCpFvFXQDl4J/hTGO6VKF2YwiiWQbcD+O7Sb7asfjcYALJU7A
	 ITh9NtR6JMKPRTW7KiwKPH8JFrWi+qe6PpDfIVLdzdSfoTvoAUSH0z6CndtUrxL10S
	 5XiJReaf2hs3gJX0flOJRN5h0ZSd+CjCPM+qSypg=
Message-ID: <799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com>
Date: Fri, 19 Jun 2026 14:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] arm64: mm: support PMD page coalescing in the
 linear map
Content-Language: en-GB
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-7-abarnas@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260611130144.1385343-7-abarnas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_064046_965430_B7C31FE5 
X-CRM114-Status: GOOD (  41.24  )
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

On 11/06/2026 14:01, Adrian Barnaś wrote:
> Implement PMD block coalescing to merge fragmented linear mapping regions
> back into huge pages when restoring the read-only attribute.
> 
> When memory allocated with VM_ALLOW_HUGE_VMAP (such as for the execmem
> ROX cache) has its permissions modified, the PMD block mapping is split
> into individual PTEs. Without this change, when that memory have its RO
> attribute subsequently cleared and set the mapping remains permanently
> fragmented into 4K pages.

I'd like to make sure I understand this correctly: So the execmem ROX cache is
allocated using vmalloc_huge such that all it's backing memory are PMD-sized
pages. It is initially poisoned with a faulting instruction and marked ROX. When
a module is loaded, it's text is copied into a portion of the ROX cache and
executed from there? To do that, the required number of (4K) pages are allocated
from ROX cache, and the permissions are changed on that sub-region to RW,
meaning we have to split the mapping from a PMD to (cont)PTEs in both vmalloc
space and in the linear map. After the text is copied, the sub-region is
switched back to ROX. But without that change, the 2M region is now mapped by
(cont)PTEs for all of time?

> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/arm64/include/asm/mmu.h |  1 +
>  arch/arm64/mm/mmu.c          | 95 ++++++++++++++++++++++++++++++++++++
>  arch/arm64/mm/pageattr.c     |  7 +++
>  3 files changed, 103 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 137a173df1ff..19158bacb2df 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -80,6 +80,7 @@ extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
>  extern void mark_linear_text_alias_ro(void);
>  extern int split_kernel_leaf_mapping(unsigned long start, unsigned long end);
>  extern void linear_map_maybe_split_to_ptes(void);
> +void try_collapse_kernel_pmd(unsigned long addr);
>  
>  /*
>   * This check is triggered during the early boot before the cpufeature
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a6a00accf4f9..d74226fa1c9b 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -769,6 +769,101 @@ static inline bool force_pte_mapping(void)
>  
>  static DEFINE_MUTEX(pgtable_split_lock);
>  
> +static inline bool __pte_can_be_collapsed(pte_t pte, unsigned long pfn, pgprot_t prot)
> +{
> +	if (!pte_valid(pte))
> +		return false;
> +	if (pte_pfn(pte) != pfn)
> +		return false;
> +	if ((pgprot_val(pte_pgprot(pte)) & ~PTE_CONT) != pgprot_val(prot))

Do we want to permit differing values for access and dirty? We do for user
space, but I think for kernel, those bits are always set? In which case, what
you're doing is correct.

> +		return false;
> +
> +	return true;
> +}
> +
> +static void __try_collapse_pmd(pmd_t *pmdp, pmd_t pmd, unsigned long addr)
> +{
> +	pte_t *ptep;
> +	pte_t first_pte;
> +	unsigned long pfn;
> +	pgprot_t prot;
> +	int i;
> +
> +	ptep = (pte_t *)pmd_page_vaddr(pmd);
> +	first_pte = __ptep_get(ptep);
> +
> +	if (!pte_valid(first_pte))
> +		return;
> +
> +	prot = pte_pgprot(first_pte);
> +	prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
> +	pfn = pte_pfn(first_pte);
> +
> +	if (!IS_ALIGNED(pfn, PMD_SIZE >> PAGE_SHIFT))
> +		return;
> +
> +	for (i = 1; i < PTRS_PER_PTE; i++) {
> +		if (!__pte_can_be_collapsed(__ptep_get(ptep + i), pfn + i, prot))
> +			return;
> +	}
> +
> +	set_pmd(pmdp, pmd_mkhuge(pfn_pmd(pfn, prot)));
> +
> +	__flush_tlb_kernel_pgtable(addr);
> +

nit: suggest adding the same comment that other sites has, since this is not
obvious:

/* See comment in pud_free_pmd_page for static key logic */

> +	if (static_branch_unlikely(&arm64_ptdump_lock_key)) {
> +		mmap_read_lock(&init_mm);
> +		mmap_read_unlock(&init_mm);
> +	}
> +
> +	pte_free_kernel(NULL, ptep);

Ooh, fun. Per my comments below we definitely have opportunity for racy pte
table accesses (beyond ptdump). I _think_ if you fix that then this will be safe.

> +}
> +
> +void try_collapse_kernel_pmd(unsigned long addr)
> +{
> +	pgd_t *pgdp;
> +	p4d_t *p4dp;
> +	pud_t *pudp;
> +	pmd_t *pmdp;
> +	pmd_t pmd;
> +
> +	/*
> +	 * collapse_pmd expects exact address of block to be collapsed
> +	 */
> +	if (WARN_ON(ALIGN_DOWN(addr, PMD_SIZE) != addr))
> +		return;
> +
> +	mutex_lock(&pgtable_split_lock);

I don't think this is safe in general. Let's say we have a 2M region split into
512 x 4K PTEs. It's possible that the first 1M is one object and the second 1M
is another object. Different CPUs could set_memory_*() on those 2 objects
concurrently. If one of them then calls this function, we could end up
collapsing the whole 2M while the other is trying to modify the PTEs and they
will race.

Note that splitting _is_ safe (and protected by this lock) because you'd have 2
objects backed by the same PMD, so they would both have to split before
modifying the PTEs.

I think you'd need to ensure mutual exclusion at a higher level if doing this;
probably execmem is the place that can ensure that no objects within a 2M region
are racily trying to modify their permissions?

> +
> +	pgdp = pgd_offset_k(addr);
> +	if (pgd_none(READ_ONCE(*pgdp)))

nit: use the getters (e.g. pXdp_get()) instead of READ_ONCE().

> +		goto out;
> +
> +	p4dp = p4d_offset(pgdp, addr);
> +	if (p4d_none(READ_ONCE(*p4dp)))
> +		goto out;
> +
> +	pudp = pud_offset(p4dp, addr);
> +	if (pud_none(READ_ONCE(*pudp)))
> +		goto out;
> +
> +	if (pud_leaf(READ_ONCE(*pudp)))
> +		goto out;
> +
> +	pmdp = pmd_offset(pudp, addr);
> +	pmd = pmdp_get(pmdp);
> +
> +	if (!pmd_table(pmd))
> +		goto out;
> +
> +	lazy_mmu_mode_enable();
> +	__try_collapse_pmd(pmdp, pmd, addr);
> +	lazy_mmu_mode_disable();
> +
> +out:
> +	mutex_unlock(&pgtable_split_lock);
> +}
> +
>  int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>  {
>  	int ret;
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index eaefdf90b0d5..11e0b60264c3 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -200,6 +200,13 @@ static int change_memory_common(unsigned long addr, int numpages,
>  			if (ret)
>  				return ret;
>  		}

The loop here in the unchanged code, calls __change_memory_common() for each
PAGE_SIZE page in the linear alias. Perhaps it should be area->page_order aware?
That way, if we are changing the permissions of the whole 2M chunk of vmalloc
space and it's backed by a 2M page, then we won't split the mapping to PTEs in
the linear map. Similarly, if we are changing permissions on a sub-region of the
2M area, we might be able to split only as far as contpte and still have some
performance benefit?


> +		/*
> +		 * When setting a read-only flag on the linear region, the memory
> +		 * may have been backed by a PMD before being split. Try to
> +		 * collapse it back into a PMD to restore huge page performance.
> +		 */
> +		if (pgprot_val(set_mask) == PTE_RDONLY && area->flags & VM_ALLOW_HUGE_VMAP)
> +			try_collapse_kernel_pmd((u64)page_address(area->pages[0]));

try_collapse_kernel_pmd() requires a PMD-aligned address. VM_ALLOW_HUGE_VMAP
doesn't guarrantee that - it only says that it's _allowed_ to be huge (and 64K
would still be huge). vmalloc may have failed to allocate a PMD-sized page and
reverted to something smaller (64K contpte or 4K). You need to look at
area->page_order, I think.

You're only calling this for the linear alias. Don't you want to call it for the
vmalloc range too? I assume the module text executes using the vmalloc address
so you'd want it mapped by a single PMD for best performance?

But in general, I don't really like the idea of special-casing a collapse to pmd
here for just execmem. I think we should either investigate a general purpose
collapse mechanism or execmem should have extra hooks added to request specific
collapse.

Thanks,
Ryan


>  	}
>  
>  	/*


