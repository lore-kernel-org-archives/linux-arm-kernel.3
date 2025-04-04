Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C01C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbQX6Ypw2dmGdM9e6YkgLrIE+DUQlsu7fY3rshtNkcc=; b=sZQFj5IoLBTD1AAL5qKLlmDkSk
	yEIjbBalrB5HwPvaUzehm3s3q8GubdO/1Cr6wWCBYs0Jf7mgub1Otpok+bf9/KMTsjXGJNMkVN7/p
	i7dvFrtVeoukvzp0i2cEFJ7mggE2HI1TqloxAJ3auDs4XNlMcegPgQM/rWsIPO0kHiBvPO7cSz2MK
	ZTY6ntY0fOm29LdfJBVyzIQ4p4wC2L/RaHfZj3Vi3CIcApFQLV+O6tajJU8WjjFRSAtnN7v5XxEKV
	pLab51bRKOh2JFaqkL/gjhwcTkTyLLSTfn9OqeV4GcIGODfjsD7Tk2U0x869+bUvTaozm9pPB0ez/
	K4U3nAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Y6g-0000000AiWm-1xp8;
	Fri, 04 Apr 2025 03:52:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Y4s-0000000AiRV-33VD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 03:50:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DE041516;
	Thu,  3 Apr 2025 20:50:48 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10FBC3F694;
	Thu,  3 Apr 2025 20:50:40 -0700 (PDT)
Message-ID: <6e4e11ef-d0d2-48e8-9ecd-4ba6575c8e52@arm.com>
Date: Fri, 4 Apr 2025 09:20:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] arm64: hugetlb: Refine tlb maintenance scope
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
 <20250304150444.3788920-3-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-3-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_205046_869772_7173A3A8 
X-CRM114-Status: GOOD (  23.77  )
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
> When operating on contiguous blocks of ptes (or pmds) for some hugetlb
> sizes, we must honour break-before-make requirements and clear down the
> block to invalid state in the pgtable then invalidate the relevant tlb
> entries before making the pgtable entries valid again.
> 
> However, the tlb maintenance is currently always done assuming the worst
> case stride (PAGE_SIZE), last_level (false) and tlb_level
> (TLBI_TTL_UNKNOWN). We can do much better with the hinting; In reality,
> we know the stride from the huge_pte pgsize, we are always operating
> only on the last level, and we always know the tlb_level, again based on
> pgsize. So let's start providing these hints.
> 
> Additionally, avoid tlb maintenace in set_huge_pte_at().
> Break-before-make is only required if we are transitioning the
> contiguous pte block from valid -> valid. So let's elide the
> clear-and-flush ("break") if the pte range was previously invalid.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/hugetlb.h | 29 +++++++++++++++++++----------
>  arch/arm64/mm/hugetlbpage.c      |  9 ++++++---
>  2 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index 07fbf5bf85a7..2a8155c4a882 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -69,29 +69,38 @@ extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
>  
>  #include <asm-generic/hugetlb.h>
>  
> -#define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
> -static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> -					   unsigned long start,
> -					   unsigned long end)
> +static inline void __flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> +					     unsigned long start,
> +					     unsigned long end,
> +					     unsigned long stride,
> +					     bool last_level)
>  {
> -	unsigned long stride = huge_page_size(hstate_vma(vma));
> -
>  	switch (stride) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SIZE:
> -		__flush_tlb_range(vma, start, end, PUD_SIZE, false, 1);
> +		__flush_tlb_range(vma, start, end, PUD_SIZE, last_level, 1);
>  		break;
>  #endif
>  	case CONT_PMD_SIZE:
>  	case PMD_SIZE:
> -		__flush_tlb_range(vma, start, end, PMD_SIZE, false, 2);
> +		__flush_tlb_range(vma, start, end, PMD_SIZE, last_level, 2);
>  		break;
>  	case CONT_PTE_SIZE:
> -		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 3);
> +		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, 3);
>  		break;
>  	default:
> -		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, TLBI_TTL_UNKNOWN);
> +		__flush_tlb_range(vma, start, end, PAGE_SIZE, last_level, TLBI_TTL_UNKNOWN);
>  	}
>  }
>  
> +#define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
> +static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> +					   unsigned long start,
> +					   unsigned long end)
> +{
> +	unsigned long stride = huge_page_size(hstate_vma(vma));
> +
> +	__flush_hugetlb_tlb_range(vma, start, end, stride, false);
> +}
> +
>  #endif /* __ASM_HUGETLB_H */
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 6a2af9fb2566..065be8650aa5 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -183,8 +183,9 @@ static pte_t get_clear_contig_flush(struct mm_struct *mm,
>  {
>  	pte_t orig_pte = get_clear_contig(mm, addr, ptep, pgsize, ncontig);
>  	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
> +	unsigned long end = addr + (pgsize * ncontig);
>  
> -	flush_tlb_range(&vma, addr, addr + (pgsize * ncontig));
> +	__flush_hugetlb_tlb_range(&vma, addr, end, pgsize, true);
>  	return orig_pte;
>  }
>  
> @@ -209,7 +210,7 @@ static void clear_flush(struct mm_struct *mm,
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>  		__ptep_get_and_clear(mm, addr, ptep);
>  
> -	flush_tlb_range(&vma, saddr, addr);
> +	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>  }
>  
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> @@ -238,7 +239,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  	dpfn = pgsize >> PAGE_SHIFT;
>  	hugeprot = pte_pgprot(pte);
>  
> -	clear_flush(mm, addr, ptep, pgsize, ncontig);
> +	/* Only need to "break" if transitioning valid -> valid. */
> +	if (pte_valid(__ptep_get(ptep)))
> +		clear_flush(mm, addr, ptep, pgsize, ncontig);
>  
>  	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
>  		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);


LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

