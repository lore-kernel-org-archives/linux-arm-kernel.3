Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBA1FCE064
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toSZr/wk0D+ZLB4X3GL8tdvy8Pfuhw55RvV5q/azapM=; b=EPgsGMJxcLtUQKYUmpcebcJ3ha
	Nh3i42PgwP0TX35qDv5V9OtOqXahZJ0hA/7qvoFD6lMeM0WMkAr5Diua/QGzyprdGbvCQdHSrNMCk
	NixL67jaeULWEVCGIxO3pbpKc/cNyVN76qh9xUb+Viyg9ol5xDqcyRsnU0kqRg49ZB9IOAsY9hh6/
	6KyP2mzuusSQKaPv4QLZQOLbc0RkQer7oewRul7z6mQ/Lfae86o5RoA+0NYJ3YEIkQb+tl4fSlFPf
	R7zpfF27hPPytt8Cl7nkXHhstNySe2E+K2fzM18aLYNa7pCnnjmHsZ5MNY3PHfbETlqxnDFx1vZJa
	d66xUKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaaK-0000000685a-2QuO;
	Thu, 26 Feb 2026 12:35:16 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaaG-0000000681g-44e9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 12:35:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772109296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toSZr/wk0D+ZLB4X3GL8tdvy8Pfuhw55RvV5q/azapM=;
	b=REmHYhHJH8JbL1SxuExvYSceF4yEaGJbivS6xDSQE9K5ymP6CJpeL9wvMbAGx4KwMpl8dy
	MWnJSF//2NEorFNH5fXDdJKyHs3HYayyJfEAYar4KO3O74WyeZCZPvZW7JPNOeZezeXh/z
	XzDcaAvgPUfvzAW3HYyp9mg/OUKgolU=
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
Subject: Re: [RFC V1 01/16] mm: Abstract printing of pxd_val()
Date: Thu, 26 Feb 2026 04:34:39 -0800
Message-ID: <20260226123442.759447-1-usama.arif@linux.dev>
In-Reply-To: <20260224051153.3150613-2-anshuman.khandual@arm.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_043513_154485_17084252 
X-CRM114-Status: GOOD (  22.16  )
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

On Tue, 24 Feb 2026 10:41:38 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Ahead of adding support for D128 pgtables, refactor places that print
> PTE values to use the new __PRIpte format specifier and __PRIpte_args()
> macro to prepare the argument(s). When using D128 pgtables in future,
> we can simply redefine __PRIpte and __PTIpte_args().
> 
> Besides there is also an assumption about pxd_val() being always capped
> at 'unsigned long long' size but that will not work for D128 pgtables.
> Just increase its size to u128 if the compiler supports via a separate
> data type pxdval_t which also defaults to existing 'unsigned long long'.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/pgtable.h |  5 +++++
>  mm/memory.c             | 29 +++++++++++++++++++----------
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index a50df42a893f..da17139a1279 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -17,6 +17,11 @@
>  #include <asm-generic/pgtable_uffd.h>
>  #include <linux/page_table_check.h>
>  
> +#ifndef __PRIpte
> +#define __PRIpte		"016llx"
> +#define __PRIpte_args(val)	((u64)val)
> +#endif
> +
>  #if 5 - defined(__PAGETABLE_P4D_FOLDED) - defined(__PAGETABLE_PUD_FOLDED) - \
>  	defined(__PAGETABLE_PMD_FOLDED) != CONFIG_PGTABLE_LEVELS
>  #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
> diff --git a/mm/memory.c b/mm/memory.c
> index 07778814b4a8..cfc3077fc52f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -532,9 +532,15 @@ static bool is_bad_page_map_ratelimited(void)
>  	return false;
>  }
>  
> +#ifdef __SIZEOF_INT128__
> +	typedef u128 pxdval_t;
> +#else
> +	typedef unsigned long long pxdval_t;
> +#endif
> +
>  static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
>  {
> -	unsigned long long pgdv, p4dv, pudv, pmdv;
> +	pxdval_t pgdv, p4dv, pudv, pmdv;
>  	p4d_t p4d, *p4dp;
>  	pud_t pud, *pudp;
>  	pmd_t pmd, *pmdp;
> @@ -548,7 +554,7 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>  	pgdv = pgd_val(*pgdp);
>  
>  	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
> -		pr_alert("pgd:%08llx\n", pgdv);
> +		pr_alert("pgd:%" __PRIpte "\n", __PRIpte_args(pgdv));
>  		return;
>  	}
>  
> @@ -557,7 +563,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>  	p4dv = p4d_val(p4d);
>  
>  	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
> -		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
> +		pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "\n",

Hi Anshuman,

The original format had a space between values ("pgd:%08llx p4d:%08llx").
The replacement loses the space separator producing output like
"pgd:123p4d:456" instead of "pgd:123 p4d:456". The same issue exists
in other places in this commit.

> +			 __PRIpte_args(pgdv), __PRIpte_args(p4dv));
>  		return;
>  	}
>  
> @@ -566,7 +573,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>  	pudv = pud_val(pud);
>  
>  	if (!pud_present(pud) || pud_leaf(pud)) {
> -		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
> +		pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "pud:%" __PRIpte "\n",
> +			 __PRIpte_args(pgdv), __PRIpte_args(p4dv), __PRIpte_args(pudv));
>  		return;
>  	}
>  
> @@ -580,8 +588,9 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>  	 * doing another map would be bad. print_bad_page_map() should
>  	 * already take care of printing the PTE.
>  	 */
> -	pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
> -		 p4dv, pudv, pmdv);
> +	pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "pud:%" __PRIpte "pmd:%" __PRIpte "\n",
> +		 __PRIpte_args(pgdv), __PRIpte_args(p4dv),
> +		 __PRIpte_args(pudv), __PRIpte_args(pmdv));
>  }
>  
>  /*
> @@ -597,7 +606,7 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>   * page table lock.
>   */
>  static void print_bad_page_map(struct vm_area_struct *vma,
> -		unsigned long addr, unsigned long long entry, struct page *page,
> +		unsigned long addr, pxdval_t entry, struct page *page,
>  		enum pgtable_level level)
>  {
>  	struct address_space *mapping;
> @@ -609,8 +618,8 @@ static void print_bad_page_map(struct vm_area_struct *vma,
>  	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
>  	index = linear_page_index(vma, addr);
>  
> -	pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
> -		 pgtable_level_to_str(level), entry);
> +	pr_alert("BUG: Bad page map in process %s  %s:%" __PRIpte, current->comm,
> +		 pgtable_level_to_str(level), __PRIpte_args(entry));
>  	__print_bad_page_map_pgtable(vma->vm_mm, addr);
>  	if (page)
>  		dump_page(page, "bad page map");
> @@ -695,7 +704,7 @@ static void print_bad_page_map(struct vm_area_struct *vma,
>   */
>  static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
>  		unsigned long addr, unsigned long pfn, bool special,
> -		unsigned long long entry, enum pgtable_level level)
> +		pxdval_t entry, enum pgtable_level level)
>  {
>  	if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
>  		if (unlikely(special)) {
> -- 
> 2.43.0
> 
> 

