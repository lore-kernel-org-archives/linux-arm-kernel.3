Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C340EC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jl80bScP1989Jw/doOWDr7lv1ZyVMPhVjdM3zVsi0aw=; b=3nNy87w/bYyy3Qs0E1tJJgeUUD
	6V6BOUjAQyY4MZ8WNInWnHSUQlQwUEgT1h4iJ5drogjddrUm2hXoEvn02W+eRl+AQlY62W13gk3eo
	M4a1aTPCXrio7NiEkfT+A+eeyW3pLFjSkKB8KV1knzuaaii6HIBQX7YLLYYm7kBK4CrfmGKSs/JrU
	HaxF7c4zJ6ZMfHik6yoQWOzCbtFKULvmi1Lp7vp4msgUW6cAeyEPT7A/wrAoACKQP8CzstGJIoXl0
	Jg0EooJBG6J2HbvCEZWg5TOSjYyROcORjs0Sb0r374/9op7URI2vZIirNvUciSvZN3xt2QdS1du2V
	N2SyjEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7hd-000000049sM-0egu;
	Mon, 16 Jun 2025 11:08:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6ha-000000041Of-3wbS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:04:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CE8212FC;
	Mon, 16 Jun 2025 03:04:08 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 601873F58B;
	Mon, 16 Jun 2025 03:04:28 -0700 (PDT)
Message-ID: <38fb7875-88c0-4687-8421-f92ae3ffaa72@arm.com>
Date: Mon, 16 Jun 2025 11:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: mm: make __create_pgd_mapping() and helpers
 non-void
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaitanya S Prakash <chaitanyas.prakash@arm.com>
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-3-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250531024545.1101304-3-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_030431_080473_ABD62059 
X-CRM114-Status: GOOD (  28.56  )
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

On 31/05/2025 03:41, Yang Shi wrote:
> The later patch will enhance __create_pgd_mapping() and related helpers
> to split kernel linear mapping, it requires have return value.  So make
> __create_pgd_mapping() and helpers non-void functions.
> 
> And move the BUG_ON() out of page table alloc helper since failing
> splitting kernel linear mapping is not fatal and can be handled by the
> callers in the later patch.  Have BUG_ON() after
> __create_pgd_mapping_locked() returns to keep the current callers behavior
> intact.
> 
> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>

With the nits below taken care of:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/kernel/cpufeature.c |  10 ++-
>  arch/arm64/mm/mmu.c            | 130 +++++++++++++++++++++++----------
>  2 files changed, 99 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 25e1fbfab6a3..e879bfcf853b 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1933,9 +1933,9 @@ static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
>  #define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
>  
>  extern
> -void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
> -			     phys_addr_t size, pgprot_t prot,
> -			     phys_addr_t (*pgtable_alloc)(int), int flags);
> +int create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
> +			    phys_addr_t size, pgprot_t prot,
> +			    phys_addr_t (*pgtable_alloc)(int), int flags);
>  
>  static phys_addr_t __initdata kpti_ng_temp_alloc;
>  
> @@ -1957,6 +1957,7 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>  	u64 kpti_ng_temp_pgd_pa = 0;
>  	pgd_t *kpti_ng_temp_pgd;
>  	u64 alloc = 0;
> +	int err;
>  
>  	if (levels == 5 && !pgtable_l5_enabled())
>  		levels = 4;
> @@ -1986,9 +1987,10 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>  		// covers the PTE[] page itself, the remaining entries are free
>  		// to be used as a ad-hoc fixmap.
>  		//
> -		create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc),
> +		err = create_kpti_ng_temp_pgd(kpti_ng_temp_pgd, __pa(alloc),
>  					KPTI_NG_TEMP_VA, PAGE_SIZE, PAGE_KERNEL,
>  					kpti_ng_pgd_alloc, 0);
> +		BUG_ON(err);
>  	}
>  
>  	cpu_install_idmap();
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..775c0536b194 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -189,15 +189,16 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>  	} while (ptep++, addr += PAGE_SIZE, addr != end);
>  }
>  
> -static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
> -				unsigned long end, phys_addr_t phys,
> -				pgprot_t prot,
> -				phys_addr_t (*pgtable_alloc)(int),
> -				int flags)
> +static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
> +			       unsigned long end, phys_addr_t phys,
> +			       pgprot_t prot,
> +			       phys_addr_t (*pgtable_alloc)(int),
> +			       int flags)
>  {
>  	unsigned long next;
>  	pmd_t pmd = READ_ONCE(*pmdp);
>  	pte_t *ptep;
> +	int ret = 0;
>  
>  	BUG_ON(pmd_sect(pmd));
>  	if (pmd_none(pmd)) {
> @@ -208,6 +209,10 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  			pmdval |= PMD_TABLE_PXN;
>  		BUG_ON(!pgtable_alloc);
>  		pte_phys = pgtable_alloc(PAGE_SHIFT);
> +		if (pte_phys == -1) {

It would be better to have a macro definition for the invalid PA case instead of
using the magic -1 everywhere. I think it can be local to this file. Perhaps:

#define INVAL_PHYS_ADDR -1

> +			ret = -ENOMEM;
> +			goto out;
> +		}
>  		ptep = pte_set_fixmap(pte_phys);
>  		init_clear_pgtable(ptep);
>  		ptep += pte_index(addr);
> @@ -239,13 +244,17 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  	 * walker.
>  	 */
>  	pte_clear_fixmap();
> +
> +out:
> +	return ret;
>  }
>  
> -static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
> -		     phys_addr_t phys, pgprot_t prot,
> -		     phys_addr_t (*pgtable_alloc)(int), int flags)
> +static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
> +		    phys_addr_t phys, pgprot_t prot,
> +		    phys_addr_t (*pgtable_alloc)(int), int flags)
>  {
>  	unsigned long next;
> +	int ret = 0;
>  
>  	do {
>  		pmd_t old_pmd = READ_ONCE(*pmdp);
> @@ -264,22 +273,27 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
>  						      READ_ONCE(pmd_val(*pmdp))));
>  		} else {
> -			alloc_init_cont_pte(pmdp, addr, next, phys, prot,
> +			ret = alloc_init_cont_pte(pmdp, addr, next, phys, prot,
>  					    pgtable_alloc, flags);
> +			if (ret)
> +				break;
>  
>  			BUG_ON(pmd_val(old_pmd) != 0 &&
>  			       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
>  		}
>  		phys += next - addr;
>  	} while (pmdp++, addr = next, addr != end);
> +
> +	return ret;
>  }
>  
> -static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
> -				unsigned long end, phys_addr_t phys,
> -				pgprot_t prot,
> -				phys_addr_t (*pgtable_alloc)(int), int flags)
> +static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
> +			       unsigned long end, phys_addr_t phys,
> +			       pgprot_t prot,
> +			       phys_addr_t (*pgtable_alloc)(int), int flags)
>  {
>  	unsigned long next;
> +	int ret = 0;
>  	pud_t pud = READ_ONCE(*pudp);
>  	pmd_t *pmdp;
>  
> @@ -295,6 +309,10 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  			pudval |= PUD_TABLE_PXN;
>  		BUG_ON(!pgtable_alloc);
>  		pmd_phys = pgtable_alloc(PMD_SHIFT);
> +		if (pmd_phys == -1) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
>  		pmdp = pmd_set_fixmap(pmd_phys);
>  		init_clear_pgtable(pmdp);
>  		pmdp += pmd_index(addr);
> @@ -314,21 +332,27 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  		    (flags & NO_CONT_MAPPINGS) == 0)
>  			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
> -		init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
> +		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
> +		if (ret)
> +			break;
>  
>  		pmdp += pmd_index(next) - pmd_index(addr);
>  		phys += next - addr;
>  	} while (addr = next, addr != end);
>  
>  	pmd_clear_fixmap();
> +
> +out:
> +	return ret;
>  }
>  
> -static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
> -			   phys_addr_t phys, pgprot_t prot,
> -			   phys_addr_t (*pgtable_alloc)(int),
> -			   int flags)
> +static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
> +			  phys_addr_t phys, pgprot_t prot,
> +			  phys_addr_t (*pgtable_alloc)(int),
> +			  int flags)
>  {
>  	unsigned long next;
> +	int ret = 0;
>  	p4d_t p4d = READ_ONCE(*p4dp);
>  	pud_t *pudp;
>  
> @@ -340,6 +364,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  			p4dval |= P4D_TABLE_PXN;
>  		BUG_ON(!pgtable_alloc);
>  		pud_phys = pgtable_alloc(PUD_SHIFT);
> +		if (pud_phys == -1) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
>  		pudp = pud_set_fixmap(pud_phys);
>  		init_clear_pgtable(pudp);
>  		pudp += pud_index(addr);
> @@ -369,8 +397,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  			BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
>  						      READ_ONCE(pud_val(*pudp))));
>  		} else {
> -			alloc_init_cont_pmd(pudp, addr, next, phys, prot,
> +			ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
>  					    pgtable_alloc, flags);
> +			if (ret)
> +				break;
>  
>  			BUG_ON(pud_val(old_pud) != 0 &&
>  			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
> @@ -379,14 +409,18 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  	} while (pudp++, addr = next, addr != end);
>  
>  	pud_clear_fixmap();
> +
> +out:
> +	return ret;
>  }
>  
> -static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
> -			   phys_addr_t phys, pgprot_t prot,
> -			   phys_addr_t (*pgtable_alloc)(int),
> -			   int flags)
> +static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
> +			  phys_addr_t phys, pgprot_t prot,
> +			  phys_addr_t (*pgtable_alloc)(int),
> +			  int flags)
>  {
>  	unsigned long next;
> +	int ret = 0;
>  	pgd_t pgd = READ_ONCE(*pgdp);
>  	p4d_t *p4dp;
>  
> @@ -398,6 +432,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  			pgdval |= PGD_TABLE_PXN;
>  		BUG_ON(!pgtable_alloc);
>  		p4d_phys = pgtable_alloc(P4D_SHIFT);
> +		if (p4d_phys == -1) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
>  		p4dp = p4d_set_fixmap(p4d_phys);
>  		init_clear_pgtable(p4dp);
>  		p4dp += p4d_index(addr);
> @@ -412,8 +450,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  
>  		next = p4d_addr_end(addr, end);
>  
> -		alloc_init_pud(p4dp, addr, next, phys, prot,
> +		ret = alloc_init_pud(p4dp, addr, next, phys, prot,
>  			       pgtable_alloc, flags);
> +		if (ret)
> +			break;
>  
>  		BUG_ON(p4d_val(old_p4d) != 0 &&
>  		       p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
> @@ -422,23 +462,27 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  	} while (p4dp++, addr = next, addr != end);
>  
>  	p4d_clear_fixmap();
> +
> +out:
> +	return ret;
>  }
>  
> -static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
> -					unsigned long virt, phys_addr_t size,
> -					pgprot_t prot,
> -					phys_addr_t (*pgtable_alloc)(int),
> -					int flags)
> +static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
> +				       unsigned long virt, phys_addr_t size,
> +				       pgprot_t prot,
> +				       phys_addr_t (*pgtable_alloc)(int),
> +				       int flags)
>  {
>  	unsigned long addr, end, next;
>  	pgd_t *pgdp = pgd_offset_pgd(pgdir, virt);
> +	int ret = 0;
>  
>  	/*
>  	 * If the virtual and physical address don't have the same offset
>  	 * within a page, we cannot map the region as the caller expects.
>  	 */
>  	if (WARN_ON((phys ^ virt) & ~PAGE_MASK))
> -		return;
> +		return -EINVAL;
>  
>  	phys &= PAGE_MASK;
>  	addr = virt & PAGE_MASK;
> @@ -446,10 +490,14 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>  
>  	do {
>  		next = pgd_addr_end(addr, end);
> -		alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
> +		ret = alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
>  			       flags);
> +		if (ret)
> +			break;
>  		phys += next - addr;
>  	} while (pgdp++, addr = next, addr != end);
> +
> +	return ret;
>  }
>  
>  static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
> @@ -458,17 +506,20 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>  				 phys_addr_t (*pgtable_alloc)(int),
>  				 int flags)
>  {
> +	int err;
> +
>  	mutex_lock(&fixmap_lock);
> -	__create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
> -				    pgtable_alloc, flags);
> +	err = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
> +					  pgtable_alloc, flags);
> +	BUG_ON(err);
>  	mutex_unlock(&fixmap_lock);
>  }
>  
>  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>  extern __alias(__create_pgd_mapping_locked)
> -void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
> -			     phys_addr_t size, pgprot_t prot,
> -			     phys_addr_t (*pgtable_alloc)(int), int flags);
> +int create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
> +			    phys_addr_t size, pgprot_t prot,
> +			    phys_addr_t (*pgtable_alloc)(int), int flags);
>  #endif

Personally I would have converted this from an alias to a wrapper:

void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
			     phys_addr_t size, pgprot_t prot,
			     phys_addr_t (*pgtable_alloc)(int), int flags)
{
	int ret;

	ret = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
					  pgtable_alloc, flags);
	BUG_ON(err);
}

Then there is no churn in cpufeature.c. But it's not a strong opinion. If you
prefer it like this then I'm ok with it (We'll need to see what Catalin and Will
prefer ultimately anyway).

Thanks,
Ryan

>  
>  static phys_addr_t __pgd_pgtable_alloc(int shift)
> @@ -476,13 +527,17 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
>  	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>  	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
>  
> -	BUG_ON(!ptr);
> +	if (!ptr)
> +		return -1;
> +
>  	return __pa(ptr);
>  }
>  
>  static phys_addr_t pgd_pgtable_alloc(int shift)
>  {
>  	phys_addr_t pa = __pgd_pgtable_alloc(shift);
> +	if (pa == -1)
> +		goto out;
>  	struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
>  
>  	/*
> @@ -498,6 +553,7 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
>  	else if (shift == PMD_SHIFT)
>  		BUG_ON(!pagetable_pmd_ctor(ptdesc));
>  
> +out:
>  	return pa;
>  }
>  


