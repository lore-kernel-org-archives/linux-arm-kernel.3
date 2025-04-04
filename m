Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC1C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0He3sOFjcLng5OF7+ZXzck5D2d+Lox1ESeoAyDCInqo=; b=0kk6KP4Zbu4uOyLYSr9w/zk0eJ
	jHUNmzz2GTndAVzssNQISKBmppUTM8naioWO0Urin9B7bHCJ6yUhZT0aavWr5CpiQpIIGcmPr4Sfg
	ykKbOWOOZ1ocTmbFWTfmkZc+nQMHvPGIklG2rPyQ6rcbBmDU60ZUDIJkp5sU1R9OXKJ5txknW/mdi
	Rqofsh8v7cn8+Q0h/XC4eEcqQrgxKL5vqn0rLEUBQYIxTYzg7zSGBjGzw4bnJRFNiz5pGbRJE5Kib
	C8GnBMR/Wlpjr+iIZwQyCHo5hPzC58HRuyHvZgIbhDgV2/hqd3HiB9TFLOeW2xI+vPovre3R88WV1
	UGpbCWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Xsr-0000000Ai2c-3qia;
	Fri, 04 Apr 2025 03:38:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XKs-0000000AdhE-00w9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 03:03:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E4741516;
	Thu,  3 Apr 2025 20:03:15 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84AB23F694;
	Thu,  3 Apr 2025 20:03:07 -0700 (PDT)
Message-ID: <1d7c0c14-6758-4842-965c-2978c4a7f345@arm.com>
Date: Fri, 4 Apr 2025 08:33:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] arm64: hugetlb: Cleanup huge_pte size discovery
 mechanisms
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
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-2-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_200314_136945_DBB8EEFB 
X-CRM114-Status: GOOD (  30.01  )
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



On 3/4/25 20:34, Ryan Roberts wrote:
> Not all huge_pte helper APIs explicitly provide the size of the
> huge_pte. So the helpers have to depend on various methods to determine
> the size of the huge_pte. Some of these methods are dubious.
> 
> Let's clean up the code to use preferred methods and retire the dubious
> ones. The options in order of preference:
> 
>  - If size is provided as parameter, use it together with
>    num_contig_ptes(). This is explicit and works for both present and
>    non-present ptes.
> 
>  - If vma is provided as a parameter, retrieve size via
>    huge_page_size(hstate_vma(vma)) and use it together with
>    num_contig_ptes(). This is explicit and works for both present and
>    non-present ptes.
> 
>  - If the pte is present and contiguous, use find_num_contig() to walk
>    the pgtable to find the level and infer the number of ptes from
>    level. Only works for *present* ptes.
> 
>  - If the pte is present and not contiguous and you can infer from this
>    that only 1 pte needs to be operated on. This is ok if you don't care
>    about the absolute size, and just want to know the number of ptes.
> 
>  - NEVER rely on resolving the PFN of a present pte to a folio and
>    getting the folio's size. This is fragile at best, because there is
>    nothing to stop the core-mm from allocating a folio twice as big as
>    the huge_pte then mapping it across 2 consecutive huge_ptes. Or just
>    partially mapping it.
> 
> Where we require that the pte is present, add warnings if not-present.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index b3a7fafe8892..6a2af9fb2566 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -129,7 +129,7 @@ pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
>  	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
>  		return orig_pte;
>  
> -	ncontig = num_contig_ptes(page_size(pte_page(orig_pte)), &pgsize);
> +	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
>  	for (i = 0; i < ncontig; i++, ptep++) {
>  		pte_t pte = __ptep_get(ptep);
>  
> @@ -438,16 +438,19 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	pgprot_t hugeprot;
>  	pte_t orig_pte;
>  
> +	VM_WARN_ON(!pte_present(pte));
> +
>  	if (!pte_cont(pte))
>  		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>  
> -	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> +	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>  	dpfn = pgsize >> PAGE_SHIFT;
>  
>  	if (!__cont_access_flags_changed(ptep, pte, ncontig))
>  		return 0;
>  
>  	orig_pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
> +	VM_WARN_ON(!pte_present(orig_pte));
>  
>  	/* Make sure we don't lose the dirty or young state */
>  	if (pte_dirty(orig_pte))
> @@ -472,7 +475,10 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	size_t pgsize;
>  	pte_t pte;
>  
> -	if (!pte_cont(__ptep_get(ptep))) {
> +	pte = __ptep_get(ptep);
> +	VM_WARN_ON(!pte_present(pte));
> +
> +	if (!pte_cont(pte)) {
>  		__ptep_set_wrprotect(mm, addr, ptep);
>  		return;
>  	}
> @@ -496,11 +502,15 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  	struct mm_struct *mm = vma->vm_mm;
>  	size_t pgsize;
>  	int ncontig;
> +	pte_t pte;
> +
> +	pte = __ptep_get(ptep);
> +	VM_WARN_ON(!pte_present(pte));
>  
> -	if (!pte_cont(__ptep_get(ptep)))
> +	if (!pte_cont(pte))
>  		return ptep_clear_flush(vma, addr, ptep);
>  
> -	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> +	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>  	return get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
>  }
>  

Should a comment be added before all the VM_WARN_ON() explaining the rationale
about why the page table entries need to be present, before checking for their
contiguous attribute before subsequently calling into find_num_contig() ?

Regardless, LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

