Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279DBE94626
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 02:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQ50p2KNl3amfBot28o/Z8pfWvYK3Anb03Fg5LdckDw=; b=WraiNz076jQAF1kcxeMQxKQpAb
	JnzDzhBCtWYEMa7R5FM1DPFsvUeUmSch3MBYaaymIgy+jRlCumn9UKhuRJeI3I9WSvJZ2EV/UGl4t
	bn6gNYZf9XetriLRFJDEO57BRfBy0eON5cRumD90YJdgpgj9WjOCWFlrl7nQgrvEozydSfjtt82Vx
	/JwnUYC7B2vJxL4JR5TheMLFV/ZJR6P+48NakziH+sNFph2RY2NUmZr/2o2/W/LO0yHMCVqMZfEJ7
	OP2ttixCh6QDBH+LICdZm92l5GEWQ1nBfC34G7C0CXnu+W//U7Fh/8VQ4f/X63yVhQ7LG/4zhDInm
	RSH33BXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpd3x-0000000GItf-2lVu;
	Tue, 10 Feb 2026 02:01:13 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpd3t-0000000GIt3-1g46
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 02:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770688864; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=nQ50p2KNl3amfBot28o/Z8pfWvYK3Anb03Fg5LdckDw=;
	b=RzZNqhju5pPL81zVsYOXc4q7plI9vLbPuEYCl/qFt68nrkpAd17x1RZ3apS/vRbRhzyVXz4r5sgF3BqUfjklTRnsZW0s67BzD3bNpDcIq+2F7DVwtYCLzlPqyQo9ei8Ksbdr12wlfKY7Frq8gSTCk25M8lnyoBkhFXJYhe3STas=
Received: from 30.74.144.109(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WyxHdcT_1770688862 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Feb 2026 10:01:03 +0800
Message-ID: <de69443f-8e0f-4d83-9f29-0b349ff682c8@linux.alibaba.com>
Date: Tue, 10 Feb 2026 10:01:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] support batch checking of references and unmapping
 for large folios
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <20260209175316.2ef64ee244599765a74a6975@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260209175316.2ef64ee244599765a74a6975@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_180110_066533_96DE3DD6 
X-CRM114-Status: GOOD (  28.84  )
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



On 2/10/26 9:53 AM, Andrew Morton wrote:
> On Mon,  9 Feb 2026 22:07:23 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>> Currently, folio_referenced_one() always checks the young flag for each PTE
>> sequentially, which is inefficient for large folios. This inefficiency is
>> especially noticeable when reclaiming clean file-backed large folios, where
>> folio_referenced() is observed as a significant performance hotspot.
>>
>> Moreover, on Arm architecture, which supports contiguous PTEs, there is already
>> an optimization to clear the young flags for PTEs within a contiguous range.
>> However, this is not sufficient. We can extend this to perform batched operations
>> for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).
>>
>> Similar to folio_referenced_one(), we can also apply batched unmapping for large
>> file folios to optimize the performance of file folio reclamation. By supporting
>> batched checking of the young flags, flushing TLB entries, and unmapping, I can
>> observed a significant performance improvements in my performance tests for file
>> folios reclamation. Please check the performance data in the commit message of
>> each patch.
>>
> 
> Thanks, I updated mm.git to this version.  Below is how v6 altered
> mm.git.
> 
> I notice that this fix:
> 
> https://lore.kernel.org/all/de141225-a0c1-41fd-b3e1-bcab09827ddd@linux.alibaba.com/T/#u
> 
> was not carried forward.  Was this deliberate?

Yes. After discussing with David[1], we believe the original patch is 
correct, so the 'fix' is unnecessary.

[1] 
https://lore.kernel.org/all/280ae63e-d66e-438f-8045-6c870420fe76@linux.alibaba.com/

The following diff looks good to me. Thanks.

> Also, regarding the 80-column tricks in folio_referenced_one(): we're
> allowed to do this ;)
> 
> 
> 				unsigned long end_addr;
> 				unsigned int max_nr;
> 
> 				end_addr = pmd_addr_end(address, vma->vm_end);
> 				max_nr = (end_addr - address) >> PAGE_SHIFT;
> 
> 
> 
> 
>   arch/arm64/include/asm/pgtable.h |    2 +-
>   include/linux/pgtable.h          |   16 ++++++++++------
>   mm/rmap.c                        |    9 +++------
>   3 files changed, 14 insertions(+), 13 deletions(-)
> 
> --- a/arch/arm64/include/asm/pgtable.h~b
> +++ a/arch/arm64/include/asm/pgtable.h
> @@ -1843,7 +1843,7 @@ static inline int clear_flush_young_ptes
>   					 unsigned long addr, pte_t *ptep,
>   					 unsigned int nr)
>   {
> -	if (likely(nr == 1 && !pte_valid_cont(__ptep_get(ptep))))
> +	if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
>   		return __ptep_clear_flush_young(vma, addr, ptep);
>   
>   	return contpte_clear_flush_young_ptes(vma, addr, ptep, nr);
> --- a/include/linux/pgtable.h~b
> +++ a/include/linux/pgtable.h
> @@ -1070,8 +1070,8 @@ static inline void wrprotect_ptes(struct
>   
>   #ifndef clear_flush_young_ptes
>   /**
> - * clear_flush_young_ptes - Clear the access bit and perform a TLB flush for PTEs
> - *			    that map consecutive pages of the same folio.
> + * clear_flush_young_ptes - Mark PTEs that map consecutive pages of the same
> + *			    folio as old and flush the TLB.
>    * @vma: The virtual memory area the pages are mapped into.
>    * @addr: Address the first page is mapped at.
>    * @ptep: Page table pointer for the first entry.
> @@ -1087,13 +1087,17 @@ static inline void wrprotect_ptes(struct
>    * pages that belong to the same folio.  The PTEs are all in the same PMD.
>    */
>   static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
> -					 unsigned long addr, pte_t *ptep,
> -					 unsigned int nr)
> +		unsigned long addr, pte_t *ptep, unsigned int nr)
>   {
> -	int i, young = 0;
> +	int young = 0;
>   
> -	for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE)
> +	for (;;) {
>   		young |= ptep_clear_flush_young(vma, addr, ptep);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		addr += PAGE_SIZE;
> +	}
>   
>   	return young;
>   }
> --- a/mm/rmap.c~b
> +++ a/mm/rmap.c
> @@ -963,10 +963,8 @@ static bool folio_referenced_one(struct
>   				referenced++;
>   		} else if (pvmw.pte) {
>   			if (folio_test_large(folio)) {
> -				unsigned long end_addr =
> -					pmd_addr_end(address, vma->vm_end);
> -				unsigned int max_nr =
> -					(end_addr - address) >> PAGE_SHIFT;
> +				unsigned long end_addr = pmd_addr_end(address, vma->vm_end);
> +				unsigned int max_nr = (end_addr - address) >> PAGE_SHIFT;
>   				pte_t pteval = ptep_get(pvmw.pte);
>   
>   				nr = folio_pte_batch(folio, pvmw.pte,
> @@ -974,8 +972,7 @@ static bool folio_referenced_one(struct
>   			}
>   
>   			ptes += nr;
> -			if (clear_flush_young_ptes_notify(vma, address,
> -						pvmw.pte, nr))
> +			if (clear_flush_young_ptes_notify(vma, address, pvmw.pte, nr))
>   				referenced++;
>   			/* Skip the batched PTEs */
>   			pvmw.pte += nr - 1;
> _


