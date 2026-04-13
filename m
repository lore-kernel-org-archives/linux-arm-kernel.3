Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056F5F34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvQ9j9MGoF9KJJFAzoRgrZyKdKTqB5LaNool0Iuh4YQ=; b=gqzFAutYxKUY6sX7IAHg0zQ4v+
	maeWRaSw8CiREHIdBqxG96eO9lgUKuVm2tkweRPbHbY1Tuvi3nyXcYR8MRFE2d7ub3NPna+f3hMyd
	LkvYuY7K7o25Qf41Fhbjl8/+sBWcrTIvXl+y49WB2PjSlA6Zp84HE1tTimE3zZaZ+HZkAmbdSGaHE
	EnOo21Gw/wufv1t3snJS4paPUJZ9NC81hV787Ibigeefd9Z/ckFBCgOhnChRWmd5eso2ZoNNmGUlO
	xjoIDbySn3P0hdNYEQIyqjT+ZEvbQB2bUxUE+IZFtt4i2QhHpPSnG88+ofrcPThvt+ojvrUpM4OCD
	i0+qxWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJpz-0000000G1qR-066u;
	Mon, 13 Apr 2026 16:08:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJpx-0000000G1qF-1QL4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CC4861336;
	Mon, 13 Apr 2026 16:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA7DC2BCAF;
	Mon, 13 Apr 2026 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776096512;
	bh=d825AxCCibvEeW1TS9m6BI8YXTIqv9i5TOVSoBg9bsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLgD6aLfOKT7I8UT9/pGuAtkMNU5pKGEL+PmzpXyknCX2JRD/MRLmW2OFA1NXCBV/
	 pdNzou3dwWx0Uip+kPcPhz6Ssaf065a5j+vm67Z9UbAeN3SMeG3pcalhKpRgi5xE4h
	 1/LYDpv7k8YMyKW+DJSNTmXqViWmyKOxRAw0fif2wbom7DHAAXR91i795M8Rg6OZfo
	 /y8nJZdclPaiVSHaBYwKR4PnasxsqZSOP1HAXlsxAmobUCVQjz7yEmlBOzItOprJed
	 lxWDMuCTHJcoMzIAvs8Mb1YriQKypH1b9btDAkpEUwwe+0zwS4eImaEcqa2TmbCJlT
	 ubo+kfd4RY8Cg==
Date: Mon, 13 Apr 2026 19:08:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com, ryan.roberts@arm.com, ajd@linux.ibm.com,
	david@kernel.org, Xueyuan.chen21@gmail.com
Subject: Re: [RFC PATCH 3/8] mm/vmalloc: Extend
 vmap_small_pages_range_noflush() to support larger page_shift sizes
Message-ID: <ad0U-IEvZkFwpBsg@kernel.org>
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-4-baohua@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408025115.27368-4-baohua@kernel.org>
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

Hi Barry,

On Wed, Apr 08, 2026 at 10:51:10AM +0800, Barry Song (Xiaomi) wrote:
> vmap_small_pages_range_noflush() provides a clean interface by taking
> struct page **pages and mapping them via direct PTE iteration. This
> avoids the page table zigzag seen when using
> vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> 
> Extend it to support larger page_shift values, and add PMD- and
> contiguous-PTE mappings as well.
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

Why is this related to HUGETLB_PAGE?

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

With this vmap_pages_pmd_range() looks quite similar to vmap_pmd_range().
Any changes we can consolidate the two?

> +		}
> +
> +		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
>  			return -ENOMEM;
>  	} while (pmd++, addr = next, addr != end);
>  	return 0;

-- 
Sincerely yours,
Mike.

