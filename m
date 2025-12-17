Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E04FD65C6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abdvEQJkynthqL8sHDVp2505J170tCfnRSLgiNHWyus=; b=ownHRBnAm1ZzRwzpKgVY6jnyRl
	QhZ+rA1JyteseVPiG2pQWftzZcbd79nS3mOZfYS2vkjngFnGEKT5oJm5GfDY7L9fpJZ4kt6TNgPJm
	haSCForqZaZOFbnQsgeXNoV2krFs0ScVYvWGIJXKCiAwDoVuc8FZ8ud0nwavJmYUEvlRRT8DkYD7w
	naalK+0mwcEHARPLpNb0ty0YwbQoLg2nyQbsCbR3+0Jre49zATy0XL4os0HHTFUTp8yvSd6YOGnlM
	GRuqhrpAIs1Px4JVEMBar1qm/2SCjL00h93C55cGSclZDwiN8gA/a6lo8SxbRVYyDCGRaLLJ8OhVX
	SEYMGDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtgs-000000071ue-36F2;
	Wed, 17 Dec 2025 15:43:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtgp-000000071uH-252j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:43:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DAC5FEC;
	Wed, 17 Dec 2025 07:43:39 -0800 (PST)
Received: from [10.57.91.77] (unknown [10.57.91.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03E363F73F;
	Wed, 17 Dec 2025 07:43:42 -0800 (PST)
Message-ID: <1beaa7de-4b31-4f19-abee-83872f868e28@arm.com>
Date: Wed, 17 Dec 2025 15:43:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: support batch clearing of the young
 flag for large folios
Content-Language: en-GB
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <e10f876ce130134fa089befe83f30561b48b9889.1765439380.git.baolin.wang@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <e10f876ce130134fa089befe83f30561b48b9889.1765439380.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_074348_529678_3A38C5B6 
X-CRM114-Status: GOOD (  22.30  )
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

Sorry I'm a bit late to the party...


On 11/12/2025 08:16, Baolin Wang wrote:
> Currently, contpte_ptep_test_and_clear_young() and contpte_ptep_clear_flush_young()
> only clear the young flag and flush TLBs for PTEs within the contiguous range.
> To support batch PTE operations for other sized large folios in the following
> patches, adding a new parameter to specify the number of PTEs.
> 
> While we are at it, rename the functions to maintain consistency with other
> contpte_*() functions.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 12 ++++-----
>  arch/arm64/mm/contpte.c          | 44 ++++++++++++++++++++++----------
>  2 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 0944e296dd4a..e03034683156 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1679,10 +1679,10 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>  extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>  				unsigned long addr, pte_t *ptep,
>  				unsigned int nr, int full);
> -extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
> -				unsigned long addr, pte_t *ptep);
> -extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
> -				unsigned long addr, pte_t *ptep);
> +extern int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
> +				unsigned long addr, pte_t *ptep, unsigned int nr);
> +extern int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
> +				unsigned long addr, pte_t *ptep, unsigned int nr);

The "contpte_" functions are intended to be private to the arm64 arch and should
be exposed via the generic APIs. But I don't see any generic batched API for
this, so you're only actually able to pass CONT_PTES as nr. Perhaps you're
planning to define "test_and_clear_young_ptes()" and "clear_flush_young_ptes()"
in later patches?

>  extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, unsigned int nr);
>  extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
> @@ -1854,7 +1854,7 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>  	if (likely(!pte_valid_cont(orig_pte)))
>  		return __ptep_test_and_clear_young(vma, addr, ptep);
>  
> -	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
> +	return contpte_test_and_clear_young_ptes(vma, addr, ptep, CONT_PTES);
>  }
>  
>  #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
> @@ -1866,7 +1866,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  	if (likely(!pte_valid_cont(orig_pte)))
>  		return __ptep_clear_flush_young(vma, addr, ptep);
>  
> -	return contpte_ptep_clear_flush_young(vma, addr, ptep);
> +	return contpte_clear_flush_young_ptes(vma, addr, ptep, CONT_PTES);
>  }
>  
>  #define wrprotect_ptes wrprotect_ptes
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index c0557945939c..19b122441be3 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -488,8 +488,9 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
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
> @@ -500,39 +501,56 @@ int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>  	 * having to unfold.
>  	 */
>  
> +	unsigned long start = addr;

Personally I wouldn't bother defining start - just reuse addr. You're
incrementing start in the below loop, so it's more appropriate to call it addr
anyway.

> +	unsigned long end = start + nr * PAGE_SIZE;
>  	int young = 0;
>  	int i;
>  
> -	ptep = contpte_align_down(ptep);
> -	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> +	if (pte_cont(__ptep_get(ptep + nr - 1)))
> +		end = ALIGN(end, CONT_PTE_SIZE);
>  
> -	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
> -		young |= __ptep_test_and_clear_young(vma, addr, ptep);
> +	if (pte_cont(__ptep_get(ptep))) {
> +		start = ALIGN_DOWN(start, CONT_PTE_SIZE);
> +		ptep = contpte_align_down(ptep);
> +	}
> +
> +	nr = (end - start) / PAGE_SIZE;
> +	for (i = 0; i < nr; i++, ptep++, start += PAGE_SIZE)

Given you're now defining end, perhaps we don't need nr?

	for (; addr != end; ptep++, addr += PAGE_SIZE)
		young |= __ptep_test_and_clear_young(vma, addr, ptep);

> +		young |= __ptep_test_and_clear_young(vma, start, ptep);
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
> +		unsigned long start = addr;
> +		unsigned long end = start + nr * PAGE_SIZE;
> +
> +		if (pte_cont(__ptep_get(ptep + nr - 1)))
> +			end = ALIGN(end, CONT_PTE_SIZE);
> +
> +		if (pte_cont(__ptep_get(ptep)))
> +			start = ALIGN_DOWN(start, CONT_PTE_SIZE);
> +

We now have this pattern of expanding contpte blocks up and down in 3 places.
Perhaps create a helper?

Thanks,
Ryan

>  		/*
>  		 * See comment in __ptep_clear_flush_young(); same rationale for
>  		 * eliding the trailing DSB applies here.
>  		 */
> -		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
> -		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
> +		__flush_tlb_range_nosync(vma->vm_mm, start, end,
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


