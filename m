Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B956C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ub16g8RqXLcskK6Fsx6rpUpyK9owbsuzrSRMHq/iM7s=; b=rCkje+HagedsugubZVsZoQ/9vS
	m/l7254yGcevkdN8GgrXpOiOiaz7ipB89BSbUlu/Q6tnb0jqErp139JVQyzYoxUp8ds8HV7fefNFc
	7EOXiEW0tT54mRchOHTwlmCGVcGQarjDYO33JeVZpkRdFySUGfNYxSenEreHsb2E8iOIQ96ktXYUe
	mP0dPUspHlLeuzrY2N9x7576ag6Dm0rtlKTocKYXbdMyb/7bB4cvTw95Lr8XEAQ5hfDBn9xhexgnt
	VLl6g7uCaYVs/aO59qdzuhJGYJumSakGGqbfYpdeKk00OS+acScb93eY9sFeJQ7bbAtXU22KwMlUx
	2tCzJWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5M7-0000000DkiY-1Cyi;
	Mon, 29 Jun 2026 06:20:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5M4-0000000Dkhx-19pA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:20:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADFDA176B;
	Sun, 28 Jun 2026 23:20:22 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C37F43F85F;
	Sun, 28 Jun 2026 23:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782714027; bh=ymaXtgSzFABz4iScBxNN5MaznB6X3+kdvqfUSvn6QUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GkeTzKgDjQb/XP4L1JdrSTkO8QNtJM4GujIs+ZmXRxFoLmgki+UvDzQhq4MYvtrPR
	 /mtqkQXmGdUsRGffsknqiUIuKC6ffALraRQvWtk5LVsIqO4UHMGHWhgrDErlWkegW0
	 N24uiOwteB0KKrM124zQnvpNfJUkahCFLOFt9LSM=
Message-ID: <21c5415a-da5d-48c7-92cc-83e8bf1c6dd9@arm.com>
Date: Mon, 29 Jun 2026 11:50:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] mm/vmalloc: Extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
 shanghaoqiang@xiaomi.com
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-5-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260618084726.1070022-5-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_232028_421610_D90B55A3 
X-CRM114-Status: GOOD (  24.37  )
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



On 18/06/26 2:17 pm, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> provides a clean interface by taking struct page **pages and mapping them
> via direct PTE iteration. This avoids the page table rewalk seen when
> using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> 
> Extend it to support larger page_shift values, and add PMD- and
> contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_walk()
> since it now handles more than just small pages.
> 
> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> iterate over pages one by one via vmap_range_noflush(), which would
> otherwise lead to page table rewalk. The code is now unified with the
> PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 81 ++++++++++++++++++++++++++++++----------------------
>  1 file changed, 47 insertions(+), 34 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6660f240d27c9..253e017130e09 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -127,7 +127,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte_t *pte;
>  	u64 pfn;
>  	struct page *page;
> -	unsigned long size = PAGE_SIZE;
> +	unsigned long size;
> +	unsigned int steps;
>  
>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>  		return -EINVAL;
> @@ -149,8 +150,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		}
>  
>  		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> -		pfn += PFN_DOWN(size);
> -	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +		steps = PFN_DOWN(size);
> +	} while (pte += steps, pfn += steps, addr += size, addr != end);
>  

This belongs to previous patch.

Apart from that LGTM:

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
> @@ -542,8 +543,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
>  
>  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
> +	unsigned long pfn, size;
> +	unsigned int steps;
>  	int err = 0;
>  	pte_t *pte;
>  
> @@ -574,9 +577,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  			break;
>  		}
>  
> -		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> -		(*nr)++;
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +		pfn = page_to_pfn(page);
> +		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> +		steps = PFN_DOWN(size);
> +	} while (pte += steps, *nr += steps, addr += size, addr != end);
>  
>  	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
> @@ -586,7 +590,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  
>  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> @@ -596,7 +600,27 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  		return -ENOMEM;
>  	do {
>  		next = pmd_addr_end(addr, end);
> -		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> +
> +		if (shift >= PMD_SHIFT) {
> +			struct page *page = pages[*nr];
> +			phys_addr_t phys_addr;
> +
> +			if (WARN_ON(!page))
> +				return -ENOMEM;
> +			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> +				return -EINVAL;
> +
> +			phys_addr = page_to_phys(page);
> +
> +			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
> +						shift)) {
> +				*mask |= PGTBL_PMD_MODIFIED;
> +				*nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
> +				continue;
> +			}
> +		}
> +
> +		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
>  			return -ENOMEM;
>  	} while (pmd++, addr = next, addr != end);
>  	return 0;
> @@ -604,7 +628,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  
>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	pud_t *pud;
>  	unsigned long next;
> @@ -614,7 +638,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  		return -ENOMEM;
>  	do {
>  		next = pud_addr_end(addr, end);
> -		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> +		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
>  			return -ENOMEM;
>  	} while (pud++, addr = next, addr != end);
>  	return 0;
> @@ -622,7 +646,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  
>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> @@ -632,14 +656,18 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
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
> -static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> -		pgprot_t prot, struct page **pages)
> +/*
> + * It can take an array of pages which are not all contiguous, but it
> + * may have contiguous chunks, as hinted by @shift.
> + */
> +static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages, unsigned int shift)
>  {
>  	unsigned long start = addr;
>  	pgd_t *pgd;
> @@ -654,7 +682,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_bad(*pgd))
>  			mask |= PGTBL_PGD_MODIFIED;
> -		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> +		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
>  		if (err)
>  			break;
>  	} while (pgd++, addr = next, addr != end);
> @@ -677,27 +705,12 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
> -	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> -
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
> -	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -			page_shift == PAGE_SHIFT)
> -		return vmap_small_pages_range_noflush(addr, end, prot, pages);
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
> +		page_shift = PAGE_SHIFT;
>  
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> -		int err;
> -
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> -					page_to_phys(pages[i]), prot,
> -					page_shift);
> -		if (err)
> -			return err;
> -
> -		addr += 1UL << page_shift;
> -	}
> -
> -	return 0;
> +	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
>  }
>  
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,


