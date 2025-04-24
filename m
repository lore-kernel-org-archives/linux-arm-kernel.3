Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F11DC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np4v8rvRiTqO7Lw4N2PMb/7JYdrjHe9Ek1nHrQDN81E=; b=O8ur5KqkQv8jzCdFNzQnj3QN09
	VHm4pv9B3B+oj5f2UttV7iGcXpVq8gct/4dK8UH0U+CszEM0leh/s3RI+sWDbqV/uTFK3D/blXtEe
	K3QMIDwbIicwRgpT7TjicMn6Ncm9AQAkTgZSZBDDhl0O0u8r/hKvVvd/X4xu0dfvTOqcPi+AU67lE
	tjwOPmWojGNxkei2K1Z44wv0VsSxADvAxeGP128WzgCCbM7QQ/qXrXBogESs1ZOUE0f7nFDtst2+M
	L4Z/4B4Fz9WnfYX8U5v5mYCL4zET1Dc0XiPwQ/iCDaWCdh6IcGDJcEoRqQegn+YuEcewF/MIEa/gk
	MVFSefhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7u19-0000000DiWB-0BA0;
	Thu, 24 Apr 2025 10:41:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t4k-0000000DXjK-3EAO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=np4v8rvRiTqO7Lw4N2PMb/7JYdrjHe9Ek1nHrQDN81E=; b=b8EyInbV0fG2Zgj9kC8BCTtQXO
	t+X8Hm6M5ck1aGXuObv+R3E1m0eDAMGU0Z3MMmvvHN4Gp3fomJVheEEXxG2+d1lK3kwySW8RW/2B2
	ngzebfVY6/F6nvejPFfzqlrKEM5O3XxnO9CuQjfpv/ojvbeLOlDpWTf1Q8p5hp42yZcQ4RBbfVRaS
	idZJWSqNoLMEzQaMuwG1U0jCvhK8vpd9BM7C+TgQCBSLnQN/1VqWFS2Q0rFaw8S6sEJQP0w0TayQY
	f4KLmFtQ8FZO8TanT8hC1yn84yN8zCfOc/iAIqFY+Tykr/7fIeNwFBSNeQOoZxJ/dKAzU+oRJcW5Z
	8tP7h55A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t4h-0000000Bh2p-35lK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:40:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AEEA1063;
	Thu, 24 Apr 2025 02:40:49 -0700 (PDT)
Received: from [10.163.49.106] (unknown [10.163.49.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FC063F66E;
	Thu, 24 Apr 2025 02:40:49 -0700 (PDT)
Message-ID: <1e148263-1155-411b-9b1d-16599bd875cd@arm.com>
Date: Thu, 24 Apr 2025 15:10:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] arm64: hugetlb: Use __set_ptes_anysz() and
 __ptep_get_and_clear_anysz()
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250422081822.1836315-1-ryan.roberts@arm.com>
 <20250422081822.1836315-6-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250422081822.1836315-6-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_104056_114593_3C071039 
X-CRM114-Status: GOOD (  24.14  )
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



On 4/22/25 13:48, Ryan Roberts wrote:
> Refactor the huge_pte helpers to use the new common __set_ptes_anysz()
> and __ptep_get_and_clear_anysz() APIs.
> 
> This provides 2 benefits; First, when page_table_check=on, hugetlb is
> now properly/fully checked. Previously only the first page of a hugetlb
> folio was checked. Second, instead of having to call __set_ptes(nr=1)
> for each pte in a loop, the whole contiguous batch can now be set in one
> go, which enables some efficiencies and cleans up the code.
> 
> One detail to note is that huge_ptep_clear_flush() was previously
> calling ptep_clear_flush() for a non-contiguous pte (i.e. a pud or pmd
> block mapping). This has a couple of disadvantages; first
> ptep_clear_flush() calls ptep_get_and_clear() which transparently
> handles contpte. Given we only call for non-contiguous ptes, it would be
> safe, but a waste of effort. It's preferable to go straight to the layer
> below. However, more problematic is that ptep_get_and_clear() is for
> PAGE_SIZE entries so it calls page_table_check_pte_clear() and would not
> clear the whole hugetlb folio. So let's stop special-casing the non-cont
> case and just rely on get_clear_contig_flush() to do the right thing for
> non-cont entries.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 53 +++++++------------------------------
>  1 file changed, 10 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 087fc43381c6..d34703846ef4 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -159,12 +159,11 @@ static pte_t get_clear_contig(struct mm_struct *mm,
>  	pte_t pte, tmp_pte;
>  	bool present;
>  
> -	pte = __ptep_get_and_clear(mm, addr, ptep);
> +	pte = __ptep_get_and_clear_anysz(mm, ptep, pgsize);
>  	present = pte_present(pte);
>  	while (--ncontig) {
>  		ptep++;
> -		addr += pgsize;
> -		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
> +		tmp_pte = __ptep_get_and_clear_anysz(mm, ptep, pgsize);
>  		if (present) {
>  			if (pte_dirty(tmp_pte))
>  				pte = pte_mkdirty(pte);
> @@ -208,7 +207,7 @@ static void clear_flush(struct mm_struct *mm,
>  	unsigned long i, saddr = addr;
>  
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
> -		__ptep_get_and_clear(mm, addr, ptep);
> +		__ptep_get_and_clear_anysz(mm, ptep, pgsize);
>  
>  	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>  }
> @@ -219,32 +218,20 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  	size_t pgsize;
>  	int i;
>  	int ncontig;
> -	unsigned long pfn, dpfn;
> -	pgprot_t hugeprot;
>  
>  	ncontig = num_contig_ptes(sz, &pgsize);
>  
>  	if (!pte_present(pte)) {
>  		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
> -			__set_ptes(mm, addr, ptep, pte, 1);
> +			__set_ptes_anysz(mm, ptep, pte, 1, pgsize);
>  		return;
>  	}
>  
> -	if (!pte_cont(pte)) {
> -		__set_ptes(mm, addr, ptep, pte, 1);
> -		return;
> -	}
> -
> -	pfn = pte_pfn(pte);
> -	dpfn = pgsize >> PAGE_SHIFT;
> -	hugeprot = pte_pgprot(pte);
> -
>  	/* Only need to "break" if transitioning valid -> valid. */
> -	if (pte_valid(__ptep_get(ptep)))
> +	if (pte_cont(pte) && pte_valid(__ptep_get(ptep)))
>  		clear_flush(mm, addr, ptep, pgsize, ncontig);
>  
> -	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> +	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
>  }
>  
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -434,11 +421,9 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  			       unsigned long addr, pte_t *ptep,
>  			       pte_t pte, int dirty)
>  {
> -	int ncontig, i;
> +	int ncontig;
>  	size_t pgsize = 0;
> -	unsigned long pfn = pte_pfn(pte), dpfn;
>  	struct mm_struct *mm = vma->vm_mm;
> -	pgprot_t hugeprot;
>  	pte_t orig_pte;
>  
>  	VM_WARN_ON(!pte_present(pte));
> @@ -447,7 +432,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>  
>  	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
> -	dpfn = pgsize >> PAGE_SHIFT;
>  
>  	if (!__cont_access_flags_changed(ptep, pte, ncontig))
>  		return 0;
> @@ -462,19 +446,14 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	if (pte_young(orig_pte))
>  		pte = pte_mkyoung(pte);
>  
> -	hugeprot = pte_pgprot(pte);
> -	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> -
> +	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
>  	return 1;
>  }
>  
>  void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  			     unsigned long addr, pte_t *ptep)
>  {
> -	unsigned long pfn, dpfn;
> -	pgprot_t hugeprot;
> -	int ncontig, i;
> +	int ncontig;
>  	size_t pgsize;
>  	pte_t pte;
>  
> @@ -487,16 +466,11 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	}
>  
>  	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> -	dpfn = pgsize >> PAGE_SHIFT;
>  
>  	pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
>  	pte = pte_wrprotect(pte);
>  
> -	hugeprot = pte_pgprot(pte);
> -	pfn = pte_pfn(pte);
> -
> -	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> +	__set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
>  }
>  
>  pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> @@ -505,13 +479,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  	struct mm_struct *mm = vma->vm_mm;
>  	size_t pgsize;
>  	int ncontig;
> -	pte_t pte;
> -
> -	pte = __ptep_get(ptep);
> -	VM_WARN_ON(!pte_present(pte));
> -
> -	if (!pte_cont(pte))
> -		return ptep_clear_flush(vma, addr, ptep);
>  
>  	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>  	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

