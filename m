Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B901FCE069
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPNsJJopwXeIQajTPzQOqmwoq99q8dZhkvlRtgNDvjs=; b=odID4HX1phJG7ZrNopbkz7smuS
	s7ZvHOKeLrCRP4sB5sZL2w7h6gSJAKayrHTM1gwi/1pfDtBTRgvuS2wacSGwxK+MTtxfLJpVZJ9t7
	Upd/72XE+VpPZJADOuU4V0Pcjxh1wrW1PVWU46baH1jKwweyGZYantSBFtRjkdY1ol9977wtkpKb/
	EJCGGuSA+Y0/BZzq3an/fXRsoq/KmVQ/vzkJX34M9mFn/jVzbXJpG+GfaVMifALbu1SuCxLpIVvz3
	zuFdsI5VBENau9lSyPHc9CkeZOcrDlq98dJI062zX9M9JF0X8pURGWZ1cyBPHBDhkJ9qYHI2P3j7G
	M+Fvq1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvacw-000000068Ue-1rLJ;
	Thu, 26 Feb 2026 12:37:58 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvacu-000000068UG-0fGa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 12:37:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772109473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPNsJJopwXeIQajTPzQOqmwoq99q8dZhkvlRtgNDvjs=;
	b=DGpr3FmInTfsEa7ak4gaWrS03UTVFfbW9HJv0UQy+RlyTfuJR6/UpOsr9dyf+aH2kO7T66
	+YmOMY44vxffMh/T02Q+dbb3ocIUW7Avb2n+bBA1V0DkTzFeB5kQot0jlV8roM9f/AtXFx
	b2MxQG9FNaKVyeDXagSTpEApubu7kf4=
From: Usama Arif <usama.arif@linux.dev>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC V1 10/16] arm64/mm: Route all pgtable writes via ptdesc_set()
Date: Thu, 26 Feb 2026 04:37:45 -0800
Message-ID: <20260226123747.801496-1-usama.arif@linux.dev>
In-Reply-To: <20260224051153.3150613-11-anshuman.khandual@arm.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_043756_501576_CD66DC3A 
X-CRM114-Status: GOOD (  19.76  )
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

On Tue, 24 Feb 2026 10:41:47 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Currently ptdesc_set() is defined as WRITE_ONCE() but this will change for
> D128 pgtable builds, for which WRITE_ONCE() is not sufficient for single
> copy atomicity.
> 
> In future this infrastructure can be used for D128 to maintain single copy
> atomicity semantics with inline asm blocks.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 11 ++++++-----
>  arch/arm64/mm/mmu.c              |  4 ++--
>  mm/debug_vm_pgtable.c            |  4 ++--
>  3 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 804ef49aea88..42124d2f323d 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -85,6 +85,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  }
>  
>  #define ptdesc_get(x)		READ_ONCE(x)
> +#define ptdesc_set(x, val)	WRITE_ONCE(x, val)
>  
>  #define pmdp_get pmdp_get
>  static inline pmd_t pmdp_get(pmd_t *pmdp)
> @@ -389,7 +390,7 @@ static inline pte_t pte_clear_uffd_wp(pte_t pte)
>  
>  static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>  {
> -	WRITE_ONCE(*ptep, pte);
> +	ptdesc_set(*ptep, pte);
>  }
>  
>  static inline void __set_pte_complete(pte_t pte)
> @@ -856,7 +857,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>  	}
>  #endif /* __PAGETABLE_PMD_FOLDED */
>  
> -	WRITE_ONCE(*pmdp, pmd);
> +	ptdesc_set(*pmdp, pmd);
>  
>  	if (pmd_valid(pmd))
>  		queue_pte_barriers();
> @@ -917,7 +918,7 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
>  		return;
>  	}
>  
> -	WRITE_ONCE(*pudp, pud);
> +	ptdesc_set(*pudp, pud);
>  
>  	if (pud_valid(pud))
>  		queue_pte_barriers();
> @@ -999,7 +1000,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
>  		return;
>  	}
>  
> -	WRITE_ONCE(*p4dp, p4d);
> +	ptdesc_set(*p4dp, p4d);
>  	queue_pte_barriers();
>  }
>  
> @@ -1120,7 +1121,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
>  		return;
>  	}
>  
> -	WRITE_ONCE(*pgdp, pgd);
> +	ptdesc_set(*pgdp, pgd);
>  	queue_pte_barriers();
>  }
>  
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index bcf32d1a92de..ffd307c546f5 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -83,7 +83,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>  	 * writable in the kernel mapping.
>  	 */
>  	if (rodata_is_rw) {
> -		WRITE_ONCE(*pgdp, pgd);
> +		ptdesc_set(*pgdp, pgd);
>  		dsb(ishst);
>  		isb();
>  		return;
> @@ -91,7 +91,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>  
>  	spin_lock(&swapper_pgdir_lock);
>  	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
> -	WRITE_ONCE(*fixmap_pgdp, pgd);
> +	ptdesc_set(*fixmap_pgdp, pgd);
>  	/*
>  	 * We need dsb(ishst) here to ensure the page-table-walker sees
>  	 * our new entry before set_p?d() returns. The fixmap's
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 83cf07269f13..faf6a19a89a1 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -445,7 +445,7 @@ static void __init pmd_huge_tests(struct pgtable_debug_args *args)
>  	 * X86 defined pmd_set_huge() verifies that the given
>  	 * PMD is not a populated non-leaf entry.
>  	 */
> -	WRITE_ONCE(*args->pmdp, __pmd(0));
> +	ptdesc_set(*args->pmdp, __pmd(0));

The ptdesc_set() and ptdesc_get() macros are defined in
arch/arm64/include/asm/pgtable.h and are arm64-specific. This change is
in mm/debug_vm_pgtable.c which is generic code compiled for all
architectures. Other architectures do not define ptdesc_set(), so this
will would cause a build failure on other architectures..

>  	WARN_ON(!pmd_set_huge(args->pmdp, __pfn_to_phys(args->fixed_pmd_pfn), args->page_prot));
>  	WARN_ON(!pmd_clear_huge(args->pmdp));
>  	pmd = pmdp_get(args->pmdp);
> @@ -465,7 +465,7 @@ static void __init pud_huge_tests(struct pgtable_debug_args *args)
>  	 * X86 defined pud_set_huge() verifies that the given
>  	 * PUD is not a populated non-leaf entry.
>  	 */
> -	WRITE_ONCE(*args->pudp, __pud(0));
> +	ptdesc_set(*args->pudp, __pud(0));
>  	WARN_ON(!pud_set_huge(args->pudp, __pfn_to_phys(args->fixed_pud_pfn), args->page_prot));
>  	WARN_ON(!pud_clear_huge(args->pudp));
>  	pud = pudp_get(args->pudp);
> -- 
> 2.43.0
> 
> 

