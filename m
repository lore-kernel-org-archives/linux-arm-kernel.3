Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F32C1073C99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0H9zJfL6IkwhaRz6UhQTjJE34tHlIxmApDpb7jLyMw=; b=y70EzQB7MNCF19siCTWXeUdVlJ
	KR8Xabvao9GX+ybPk22SmrIrD4w9Gy6vHTPv9p+0/L0h1/yAWyHkN1SaJBf/hlW36t4QJSDG7ZJ8n
	VcBAnwmjYy5pbkfsd70rn73P8Kv68xhO5IYuizzb+MY9nQgLPXSAz/g1O6Nc8ze2miW3LKFHFcuRh
	Rw+cH191QmIJWhI14NGbMyQ1MLEg/D3qUmkpg924Vr5vI1KzyfbT9DIvvKWN9tJCxHWtYEoWxVNno
	/jJdCebnuIA1htAZzHlema+TuU+BF0xz7PN0akiuUlH0oBgELRqsIbpXL7iNzZsY+dHiIF2G/idXs
	w61/ehmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQm8-00000008j7o-3TZN;
	Wed, 08 Apr 2026 11:08:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQm6-00000008j7P-08dF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:08:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0369B32E3;
	Wed,  8 Apr 2026 04:08:39 -0700 (PDT)
Received: from [10.164.148.132] (unknown [10.164.148.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 857EF3F641;
	Wed,  8 Apr 2026 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775646524; bh=WusmM/JN0uOT9i9wjTFqibLgRU744Qp8wkgjMexj9do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g9HlyYXzT1sjXsGodnTVTmGGq4Mh2oNyVIwEu/pdYfuHvn3ZgIUqe1Nh9SkZYtWSk
	 Ox3Q6id5to3JfUsc54ciQLX+BpNGb9mA3Hn4PJtuFw3S6TMCtePHIAJZss+zFqaQe4
	 020mO5z8wnXArz9eUbbV6pKiLo73uOxYmuPQiUMA=
Message-ID: <f661064f-269c-4e1d-8d6c-a9a2e50cd82c@arm.com>
Date: Wed, 8 Apr 2026 16:38:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/8] mm/vmalloc: Extend
 vmap_small_pages_range_noflush() to support larger page_shift sizes
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-4-baohua@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260408025115.27368-4-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_040846_167416_9755D7B9 
X-CRM114-Status: GOOD (  21.54  )
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



On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> vmap_small_pages_range_noflush() provides a clean interface by taking
> struct page **pages and mapping them via direct PTE iteration. This
> avoids the page table zigzag seen when using

"Zigzag" is ambiguous. Just say "page table rewalk". Also please
elaborate on why the rewalk is happening currently.

> vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> 
> Extend it to support larger page_shift values, and add PMD- and
> contiguous-PTE mappings as well.

So we can drop the "small" here since now it supports larger chunks
as well.

Also at this point the code you add is a no-op since you pass PAGE_SHIFT.
Let us just squash patch 4 into this. This patch looks weird retaining
the pagetable-rewalk algorithm when it literally adds functionality
to avoid that.

> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmalloc.c | 54 ++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 42 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 57eae99d9909..5bf072297536 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -524,8 +524,9 @@ void vunmap_range(unsigned long addr, unsigned long end)
>  
>  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
> +	unsigned int steps = 1;
>  	int err = 0;
>  	pte_t *pte;
>  
> @@ -543,6 +544,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	do {
>  		struct page *page = pages[*nr];
>  
> +		steps = 1;
>  		if (WARN_ON(!pte_none(ptep_get(pte)))) {
>  			err = -EBUSY;
>  			break;
> @@ -556,9 +558,24 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  			break;
>  		}
>  
> +#ifdef CONFIG_HUGETLB_PAGE
> +		if (shift != PAGE_SHIFT) {
> +			unsigned long pfn = page_to_pfn(page), size;
> +
> +			size = arch_vmap_pte_range_map_size(addr, end, pfn, shift);
> +			if (size != PAGE_SIZE) {
> +				steps = size >> PAGE_SHIFT;
> +				pte_t entry = pfn_pte(pfn, prot);
> +
> +				entry = arch_make_huge_pte(entry, ilog2(size), 0);
> +				set_huge_pte_at(&init_mm, addr, pte, entry, size);
> +				continue;
> +			}
> +		}
> +#endif
> +
>  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> -		(*nr)++;
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	} while (pte += steps, *nr += steps, addr += PAGE_SIZE * steps, addr != end);
>  
>  	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
> @@ -568,7 +585,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  
>  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> @@ -578,7 +595,20 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  		return -ENOMEM;
>  	do {
>  		next = pmd_addr_end(addr, end);
> -		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> +
> +		if (shift == PMD_SHIFT) {
> +			struct page *page = pages[*nr];
> +			phys_addr_t phys_addr = page_to_phys(page);
> +
> +			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
> +						shift)) {
> +				*mask |= PGTBL_PMD_MODIFIED;
> +				*nr += 1 << (shift - PAGE_SHIFT);
> +				continue;
> +			}
> +		}
> +
> +		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
>  			return -ENOMEM;
>  	} while (pmd++, addr = next, addr != end);
>  	return 0;
> @@ -586,7 +616,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  
>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	pud_t *pud;
>  	unsigned long next;
> @@ -596,7 +626,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  		return -ENOMEM;
>  	do {
>  		next = pud_addr_end(addr, end);
> -		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> +		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
>  			return -ENOMEM;
>  	} while (pud++, addr = next, addr != end);
>  	return 0;
> @@ -604,7 +634,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  
>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> @@ -614,14 +644,14 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  		return -ENOMEM;
>  	do {
>  		next = p4d_addr_end(addr, end);
> -		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
> +		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift))
>  			return -ENOMEM;
>  	} while (p4d++, addr = next, addr != end);
>  	return 0;
>  }
>  
>  static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> -		pgprot_t prot, struct page **pages)
> +		pgprot_t prot, struct page **pages, unsigned int shift)
>  {
>  	unsigned long start = addr;
>  	pgd_t *pgd;
> @@ -636,7 +666,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_bad(*pgd))
>  			mask |= PGTBL_PGD_MODIFIED;
> -		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> +		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
>  		if (err)
>  			break;
>  	} while (pgd++, addr = next, addr != end);
> @@ -665,7 +695,7 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  
>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
>  			page_shift == PAGE_SHIFT)
> -		return vmap_small_pages_range_noflush(addr, end, prot, pages);
> +		return vmap_small_pages_range_noflush(addr, end, prot, pages, PAGE_SHIFT);
>  
>  	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
>  		int err;


