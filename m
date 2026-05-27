Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC288CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZK1e6tGSqx3SOkpVhgOzNyRjcTO65ITv7rQ73O29Fo=; b=ZleTmAg4eTClDPCRaAeMHG4WtR
	uKfOicAHet2oe9+d0zm/iD517ut5o0vrQWjoQ3Y4ulK+DSsdKLEoURdGlKUXRJjhInY5kRV/KyMi7
	T+hTYzYWolaB4ifLJah5x6zYDUV5LXL7k124zIge9h0VNSOZSILNzlcP2guUOXlQ48ig2PrM0fG+I
	FfP8dcIcQQeFAH07kpFE1C86Gp7fevHTLqkfw5tTrBZ4seqFmuw9WLooskidhrA0YKescd7cfU0CK
	S1hbrj19S7EDeJC1IMWKlqJoj95UywbPUF+c1vKxxVv2pKwmG+58tpTt4ipYGqOq5ALmBgmDtjMA7
	CeWjuijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEym-00000004GUX-3UOR;
	Wed, 27 May 2026 14:11:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEyk-00000004GU0-11gk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:11:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0043027DC;
	Wed, 27 May 2026 07:11:17 -0700 (PDT)
Received: from [10.1.36.149] (XHFQ2J9959.cambridge.arm.com [10.1.36.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78AA23F905;
	Wed, 27 May 2026 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779891082; bh=EMYKD7dIdvCyC3aowqIV2NFcZLZ0MI2QgKxgRFdYwcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AmDfBmlKj8HpbsVvbsgw1jbwhZeeWkxSTV7bDMMlg1+bK8fvYnwMsP15d8wko/WWV
	 VOCsPReMRJocbcAJFrEl1EauTUnoE9MZl3UrhBvyh0Jzu284YxDtTleOoXbU9Bh87j
	 17N44GEdiMwH6h8Tklbiu1n+jhO6WyD2SuZV25EE=
Message-ID: <c981c1ba-ab86-4865-b74b-df8d2005507b@arm.com>
Date: Wed, 27 May 2026 15:11:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 07/14] arm64/mm: Route all pgtable reads via pxxval_get()
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Usama Arif <usama.arif@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-8-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260513044547.4128549-8-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_071126_460084_034226B9 
X-CRM114-Status: GOOD (  21.78  )
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

On 13/05/2026 05:45, Anshuman Khandual wrote:
> Define arm64 platform specific implementations for new pXdp_get() helpers.
> These resolve into READ_ONCE(), thus ensuring required single copy atomic
> semantics for the page table entry reads.
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
> Changes in RFC V2:
> 
> - Renamed all ptdesc_ instances as pxxval_ instead
> - Moved arm64 pgtable header READ_ONCE() replacements here in this patch
> 
>  arch/arm64/include/asm/pgtable.h | 38 +++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index cefe8ab86acd..72da582e8d12 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -84,6 +84,32 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	arch_flush_lazy_mmu_mode();
>  }
>  
> +#define pxxval_get(x)		READ_ONCE(x)

I think this would be better as an inline (or __force_inline) function, which
takes a pointer, and dereferences it. READ_ONCE() is special - it's modifying
how the dereference should be done, so it makes sense that the dereference is
done in the caller.

> +
> +#define pmdp_get pmdp_get
> +static inline pmd_t pmdp_get(pmd_t *pmdp)
> +{
> +	return pxxval_get(*pmdp);

This is weird to read. It would be clearer as:

	return pxxval_get(pmdp);

Thanks,
Ryan

> +}
> +
> +#define pudp_get pudp_get
> +static inline pud_t pudp_get(pud_t *pudp)
> +{
> +	return pxxval_get(*pudp);
> +}
> +
> +#define p4dp_get p4dp_get
> +static inline p4d_t p4dp_get(p4d_t *p4dp)
> +{
> +	return pxxval_get(*p4dp);
> +}
> +
> +#define pgdp_get pgdp_get
> +static inline pgd_t pgdp_get(pgd_t *pgdp)
> +{
> +	return pxxval_get(*pgdp);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  
> @@ -380,7 +406,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>  
>  static inline pte_t __ptep_get(pte_t *ptep)
>  {
> -	return READ_ONCE(*ptep);
> +	return pxxval_get(*ptep);
>  }
>  
>  extern void __sync_icache_dcache(pte_t pteval);
> @@ -1011,7 +1037,7 @@ static inline phys_addr_t pud_offset_phys(p4d_t *p4dp, unsigned long addr)
>  {
>  	BUG_ON(!pgtable_l4_enabled());
>  
> -	return p4d_page_paddr(READ_ONCE(*p4dp)) + pud_index(addr) * sizeof(pud_t);
> +	return p4d_page_paddr(p4dp_get(p4dp)) + pud_index(addr) * sizeof(pud_t);
>  }
>  
>  static inline
> @@ -1025,7 +1051,7 @@ pud_t *pud_offset_lockless(p4d_t *p4dp, p4d_t p4d, unsigned long addr)
>  
>  static inline pud_t *pud_offset(p4d_t *p4dp, unsigned long addr)
>  {
> -	return pud_offset_lockless(p4dp, READ_ONCE(*p4dp), addr);
> +	return pud_offset_lockless(p4dp, p4dp_get(p4dp), addr);
>  }
>  #define pud_offset	pud_offset
>  
> @@ -1134,7 +1160,7 @@ static inline phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
>  {
>  	BUG_ON(!pgtable_l5_enabled());
>  
> -	return pgd_page_paddr(READ_ONCE(*pgdp)) + p4d_index(addr) * sizeof(p4d_t);
> +	return pgd_page_paddr(pgdp_get(pgdp)) + p4d_index(addr) * sizeof(p4d_t);
>  }
>  
>  static inline
> @@ -1148,7 +1174,7 @@ p4d_t *p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
>  
>  static inline p4d_t *p4d_offset(pgd_t *pgdp, unsigned long addr)
>  {
> -	return p4d_offset_lockless(pgdp, READ_ONCE(*pgdp), addr);
> +	return p4d_offset_lockless(pgdp, pgdp_get(pgdp), addr);
>  }
>  
>  static inline p4d_t *p4d_set_fixmap(unsigned long addr)
> @@ -1346,7 +1372,7 @@ static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  		unsigned long address, pmd_t *pmdp)
>  {
>  	/* Operation applies to PMD table entry only if FEAT_HAFT is enabled */
> -	VM_WARN_ON(pmd_table(READ_ONCE(*pmdp)) && !system_supports_haft());
> +	VM_WARN_ON(pmd_table(pmdp_get(pmdp)) && !system_supports_haft());
>  	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */


