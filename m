Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A760AFA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXM8LJ6n5DBtUq8ca9svyjVLB1Hucrj6X6R3AG8yJB0=; b=VK4JRWUF3AGksW6nswLyFN2kOu
	2IVB6WG8wutc6qYHBk9coU4yue8Lkszov6OunP/LyuU98HROem+yRQpjs4s3ldGTGcwqV6IfkBkzP
	I8AwMsAafh2B6Z24N00rtUWVpy20gva4QE+6cdPLVgXum/D8o6JzhYXbFBaI2DjDrSlNJzkXl9r81
	hzQAxbseMn5EpP4SjoKB8JKyEEIOrkm8KBOOggJ5W7g3dZeXOlhfC3hfu9dTK8eOXoaoLfSlToDEt
	BNtFl/89fZ3Q6y1c3lFy03eNugXUIbSm4GBl2Qn963EoRj9k04J1Fj1+QjaLwHUYF1TxYeZejUsEW
	5QXVHbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbe9i-00000008Bef-4ABE;
	Fri, 02 Jan 2026 12:21:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbe9g-00000008BeC-2Hii
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:21:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B0B4497;
	Fri,  2 Jan 2026 04:21:12 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F283F63F;
	Fri,  2 Jan 2026 04:21:16 -0800 (PST)
Message-ID: <fdf816d2-716a-466a-97be-9d8e8b442be5@arm.com>
Date: Fri, 2 Jan 2026 12:21:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: mm: support batch clearing of the young
 flag for large folios
Content-Language: en-GB
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <a5138065a70a7588904d0bcfc569a5d856dcc65e.1766631066.git.baolin.wang@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a5138065a70a7588904d0bcfc569a5d856dcc65e.1766631066.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_042120_684357_A7890835 
X-CRM114-Status: GOOD (  19.80  )
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

On 26/12/2025 06:07, Baolin Wang wrote:
> Currently, contpte_ptep_test_and_clear_young() and contpte_ptep_clear_flush_young()
> only clear the young flag and flush TLBs for PTEs within the contiguous range.
> To support batch PTE operations for other sized large folios in the following
> patches, adding a new parameter to specify the number of PTEs that map consecutive
> pages of the same large folio in a single VMA and a single page table.
> 
> While we are at it, rename the functions to maintain consistency with other
> contpte_*() functions.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/include/asm/pgtable.h | 12 ++++++------
>  arch/arm64/mm/contpte.c          | 33 ++++++++++++++++++--------------
>  2 files changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 445e18e92221..5e9ff16146c3 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1648,10 +1648,10 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>  extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>  				unsigned long addr, pte_t *ptep,
>  				unsigned int nr, int full);
> -extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
> -				unsigned long addr, pte_t *ptep);
> -extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
> -				unsigned long addr, pte_t *ptep);
> +int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
> +				unsigned long addr, pte_t *ptep, unsigned int nr);
> +int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
> +				unsigned long addr, pte_t *ptep, unsigned int nr);
>  extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, unsigned int nr);
>  extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
> @@ -1823,7 +1823,7 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>  	if (likely(!pte_valid_cont(orig_pte)))
>  		return __ptep_test_and_clear_young(vma, addr, ptep);
>  
> -	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
> +	return contpte_test_and_clear_young_ptes(vma, addr, ptep, 1);
>  }
>  
>  #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
> @@ -1835,7 +1835,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  	if (likely(!pte_valid_cont(orig_pte)))
>  		return __ptep_clear_flush_young(vma, addr, ptep);
>  
> -	return contpte_ptep_clear_flush_young(vma, addr, ptep);
> +	return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
>  }
>  
>  #define wrprotect_ptes wrprotect_ptes
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index e4ddeb46f25d..b929a455103f 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -508,8 +508,9 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>  }
>  EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
>  
> -int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
> -					unsigned long addr, pte_t *ptep)
> +int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
> +					unsigned long addr, pte_t *ptep,
> +					unsigned int nr)
>  {
>  	/*
>  	 * ptep_clear_flush_young() technically requires us to clear the access
> @@ -518,41 +519,45 @@ int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>  	 * contig range when the range is covered by a single folio, we can get
>  	 * away with clearing young for the whole contig range here, so we avoid
>  	 * having to unfold.
> +	 *
> +	 * The 'nr' means consecutive (present) PTEs that map consecutive pages
> +	 * of the same large folio in a single VMA and a single page table.
>  	 */
>  
> +	unsigned long end = addr + nr * PAGE_SIZE;
>  	int young = 0;
> -	int i;
>  
> -	ptep = contpte_align_down(ptep);
> -	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> -
> -	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
> +	ptep = contpte_align_addr_ptep(&addr, &end, ptep, nr);
> +	for (; addr != end; ptep++, addr += PAGE_SIZE)
>  		young |= __ptep_test_and_clear_young(vma, addr, ptep);
>  
>  	return young;
>  }
> -EXPORT_SYMBOL_GPL(contpte_ptep_test_and_clear_young);
> +EXPORT_SYMBOL_GPL(contpte_test_and_clear_young_ptes);
>  
> -int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
> -					unsigned long addr, pte_t *ptep)
> +int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
> +				unsigned long addr, pte_t *ptep,
> +				unsigned int nr)
>  {
>  	int young;
>  
> -	young = contpte_ptep_test_and_clear_young(vma, addr, ptep);
> +	young = contpte_test_and_clear_young_ptes(vma, addr, ptep, nr);
>  
>  	if (young) {
> +		unsigned long end = addr + nr * PAGE_SIZE;
> +
> +		contpte_align_addr_ptep(&addr, &end, ptep, nr);
>  		/*
>  		 * See comment in __ptep_clear_flush_young(); same rationale for
>  		 * eliding the trailing DSB applies here.
>  		 */
> -		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> -		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
> +		__flush_tlb_range_nosync(vma->vm_mm, addr, end,
>  					 PAGE_SIZE, true, 3);
>  	}
>  
>  	return young;
>  }
> -EXPORT_SYMBOL_GPL(contpte_ptep_clear_flush_young);
> +EXPORT_SYMBOL_GPL(contpte_clear_flush_young_ptes);
>  
>  void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>  					pte_t *ptep, unsigned int nr)


