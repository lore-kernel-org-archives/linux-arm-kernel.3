Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A518E784BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 02:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5jiwUqQZpkFncIxj0w47U4jzh93+I75TVRu/PSNklQ=; b=Kmi9BAUE5iHBzqhvRgAoI6fRhm
	40f9T4W+9/Jmw/TrjMk7wCWW1vY+Xq7KTS+MAEnz2/M1/UdOMP8w2adfTxlA78uSbNHaG0DKSM0Os
	q1xvfoPa5RRgza3fSENcvkO8Cc8uOzPx8Bwbfh9++p5uZVoAvyy8sgPgNF4rwjgom84uRBSUZMpe3
	DmDO4mXmmXolRyAwzCQeP6JhShYYxAVG5VB2O47Aaq8mp6mygtBZsb7cfRcLba39f/XWFy/8irb4s
	Y7eB0bL+tsLREMyUW6UHzrgJkDie0gAhUJuzWZL79Xp5oXl+NlRQMpKWqLN6VJ+7EtlJP+5XA5vwm
	STSQYwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYbPI-000000000tv-1DfH;
	Thu, 25 Dec 2025 02:48:52 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYbPE-000000000tR-0v6I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 02:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766630924; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=D5jiwUqQZpkFncIxj0w47U4jzh93+I75TVRu/PSNklQ=;
	b=FVzoLV8G87K52+ZNOdYJzDYStn34oNV5YW5JhmWHax6QNoyWqhcRNKJ7BR1S+2QWw5jtXws5bf8FUm9XJeXjDiYZd1RUjGtt7ybI+7Eml1bRCTHuyHEDGtZd6DFg4JGHUDPugoWgTh4VknPxrdQ1Xb/tK0ODoQA5la+mQrrTCWk=
Received: from 30.74.144.121(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wvd.uPh_1766630922 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 25 Dec 2025 10:48:43 +0800
Message-ID: <02239ca7-9701-4bfa-af0f-dcf0d05a3e89@linux.alibaba.com>
Date: Thu, 25 Dec 2025 10:48:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm64: mm: support batch clearing of the young
 flag for large folios
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1766455377.git.baolin.wang@linux.alibaba.com>
 <3b427d9010a6d52f2b91342760f12be097d21cf6.1766455378.git.baolin.wang@linux.alibaba.com>
 <c5df1f9f-952a-4e83-9ae0-bd0a83dedd36@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <c5df1f9f-952a-4e83-9ae0-bd0a83dedd36@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_184848_972676_D936C963 
X-CRM114-Status: GOOD (  25.01  )
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



On 2025/12/24 22:07, Ryan Roberts wrote:
> On 23/12/2025 05:48, Baolin Wang wrote:
>> Currently, contpte_ptep_test_and_clear_young() and contpte_ptep_clear_flush_young()
>> only clear the young flag and flush TLBs for PTEs within the contiguous range.
>> To support batch PTE operations for other sized large folios in the following
>> patches, adding a new parameter to specify the number of PTEs that map consecutive
>> pages of the same large folio in a single VMA and a single page table.
>>
>> While we are at it, rename the functions to maintain consistency with other
>> contpte_*() functions.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 12 ++++++------
>>   arch/arm64/mm/contpte.c          | 33 ++++++++++++++++++--------------
>>   2 files changed, 25 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 445e18e92221..d5fbe72e820a 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1648,10 +1648,10 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>>   extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>>   				unsigned long addr, pte_t *ptep,
>>   				unsigned int nr, int full);
>> -extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>> -				unsigned long addr, pte_t *ptep);
>> -extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>> -				unsigned long addr, pte_t *ptep);
>> +int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep, unsigned int nr);
>> +int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep, unsigned int nr);
>>   extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>   				pte_t *ptep, unsigned int nr);
>>   extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>> @@ -1823,7 +1823,7 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>>   	if (likely(!pte_valid_cont(orig_pte)))
>>   		return __ptep_test_and_clear_young(vma, addr, ptep);
>>   
>> -	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
>> +	return contpte_test_and_clear_young_ptes(vma, addr, ptep, CONT_PTES);
> 
> As per your fixup patch, I agree that nr should be 1 here, not CONT_PTES.

Yes.

>>   }
>>   
>>   #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
>> @@ -1835,7 +1835,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>>   	if (likely(!pte_valid_cont(orig_pte)))
>>   		return __ptep_clear_flush_young(vma, addr, ptep);
>>   
>> -	return contpte_ptep_clear_flush_young(vma, addr, ptep);
>> +	return contpte_clear_flush_young_ptes(vma, addr, ptep, CONT_PTES);
> 
> And same here.
> 
>>   }
>>   
>>   #define wrprotect_ptes wrprotect_ptes
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index e4ddeb46f25d..b929a455103f 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -508,8 +508,9 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>>   }
>>   EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
>>   
>> -int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>> -					unsigned long addr, pte_t *ptep)
>> +int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
>> +					unsigned long addr, pte_t *ptep,
>> +					unsigned int nr)
>>   {
>>   	/*
>>   	 * ptep_clear_flush_young() technically requires us to clear the access
>> @@ -518,41 +519,45 @@ int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>>   	 * contig range when the range is covered by a single folio, we can get
>>   	 * away with clearing young for the whole contig range here, so we avoid
>>   	 * having to unfold.
>> +	 *
>> +	 * The 'nr' means consecutive (present) PTEs that map consecutive pages
>> +	 * of the same large folio in a single VMA and a single page table.
>>   	 */
>>   
>> +	unsigned long end = addr + nr * PAGE_SIZE;
>>   	int young = 0;
>> -	int i;
>>   
>> -	ptep = contpte_align_down(ptep);
>> -	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>> -
>> -	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
>> +	ptep = contpte_align_addr_ptep(&addr, &end, ptep, nr);
>> +	for (; addr != end; ptep++, addr += PAGE_SIZE)
>>   		young |= __ptep_test_and_clear_young(vma, addr, ptep);
>>   
>>   	return young;
>>   }
>> -EXPORT_SYMBOL_GPL(contpte_ptep_test_and_clear_young);
>> +EXPORT_SYMBOL_GPL(contpte_test_and_clear_young_ptes);
>>   
>> -int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>> -					unsigned long addr, pte_t *ptep)
>> +int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep,
>> +				unsigned int nr)
>>   {
>>   	int young;
>>   
>> -	young = contpte_ptep_test_and_clear_young(vma, addr, ptep);
>> +	young = contpte_test_and_clear_young_ptes(vma, addr, ptep, nr);
>>   
>>   	if (young) {
>> +		unsigned long end = addr + nr * PAGE_SIZE;
>> +
>> +		contpte_align_addr_ptep(&addr, &end, ptep, nr);
>>   		/*
>>   		 * See comment in __ptep_clear_flush_young(); same rationale for
>>   		 * eliding the trailing DSB applies here.
>>   		 */
>> -		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>> -		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
>> +		__flush_tlb_range_nosync(vma->vm_mm, addr, end,
>>   					 PAGE_SIZE, true, 3);
> 
> Hmm... The requirement is that we must flush the _page_ if clearing access for a
> pte that does not have the contiguous bit set, or we must flush the _contpte
> block_ if clearing access for a pte that does have the contiguous bit set.
> 
> With your changes, you may call for a large range that covers multiple contpte
> blocks but only has a single pte in a single contpte block for which the access
> bit was previously set. But that will cause flushing the TLB for the full range.
> Could this cause a performance issue? Yes, no, maybe... I think it's unlikely
> but I wouldn't rule it out in some edge case.
> 
> I wonder if it's better to track the sub-ranges where access was cleared and
> only issue tlbi for those sub-ranges? Probably just keep it simple (the way you
> have done it) until/unless we see an actual problem?

Good question. Indeed, as you said, we flush the TLB per folio now, 
which might increase the flush range. However, I think this approach is 
relatively reasonable for now.

First, the mm-core also tracks the access status per folio, and it's 
really unnecessary to add excessive complexity to track the access 
status of sub-pages (or sub-ranges). I can already imagine that tracking 
the access status for each cont-block range as well as for non-cont 
pages across the entire large folio range, which can be too complicated.

Second, __flush_tlb_range_nosync() is a lightweight flush. I quickly ran 
a measurement on my machine and found that the overhead of 
__flush_tlb_range_nosync() barely changes between nr=16 and nr=256 (both 
are around 40 ns).

Therefore, I would still prefer to keep the logic here simple.

