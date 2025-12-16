Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3397D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 03:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UC+roNBiQGAi6eoketJwuLzcModJsVZ/qwQfTda8Tc=; b=bmHlDDFSwi+IfEnqVL/tlnUuWr
	pRGvjLbp5GtPPT8XCVPrDNhF1iqKddr+mh+1AKIJISdQV72PP4dE2JW6gtErUXbsUU9TF2J7tDgZk
	KmqNBVhfqqma6HU3kbcJTtBkrDZ6lxUH8f5CiBa6F8edguVaY0wLvvJfvUlxOMhLH8IW9hNkNSG/u
	4TwL+ltxDpmgz3p6BePj0hFTYrZnTUK4QgZlJFWph5g+tolY/0Fue0PLnp/b2Bm2yVbuF4C5CViFq
	LlPt+zy7wVDgoEWX8Gm8LwpDxfJQO7acPsPn9gZEkDdWjwCSyUhJNo09jG9yrm69RrSlQ1JojcNm5
	KApfJBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVLoG-00000004dCa-3RBI;
	Tue, 16 Dec 2025 03:33:12 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVLoB-00000004dBg-3K9W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 03:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765855981; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1UC+roNBiQGAi6eoketJwuLzcModJsVZ/qwQfTda8Tc=;
	b=eUBB4XPE/Y72ClpbapTojLZebjPgkj2FKJ5/G8uTgQ9jcytPHLUsplKWWrLYFNL/zP8iRzP2eAeyWfJltApaAlWqlLTr7DIdFsJUwfUdzSWPeYbefQ0SUKKtkNCn0WIA2JUluV/M360iBDEiViUvDc06FxLAJHG9QdeEqJqQ4LQ=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WuxNpfx_1765855978 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 16 Dec 2025 11:32:59 +0800
Message-ID: <1a0001cd-c38d-403b-b3ef-d19e85acd772@linux.alibaba.com>
Date: Tue, 16 Dec 2025 11:32:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: support batch clearing of the young
 flag for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <e10f876ce130134fa089befe83f30561b48b9889.1765439380.git.baolin.wang@linux.alibaba.com>
 <5039c6a2-09b6-4c9b-accb-26583ba120db@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <5039c6a2-09b6-4c9b-accb-26583ba120db@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_193308_456592_18946147 
X-CRM114-Status: GOOD (  39.41  )
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



On 2025/12/15 19:36, Lorenzo Stoakes wrote:
> On Thu, Dec 11, 2025 at 04:16:54PM +0800, Baolin Wang wrote:
>> Currently, contpte_ptep_test_and_clear_young() and contpte_ptep_clear_flush_young()
>> only clear the young flag and flush TLBs for PTEs within the contiguous range.
>> To support batch PTE operations for other sized large folios in the following
>> patches, adding a new parameter to specify the number of PTEs.
>>
>> While we are at it, rename the functions to maintain consistency with other
>> contpte_*() functions.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 12 ++++-----
>>   arch/arm64/mm/contpte.c          | 44 ++++++++++++++++++++++----------
>>   2 files changed, 37 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 0944e296dd4a..e03034683156 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1679,10 +1679,10 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>>   extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>>   				unsigned long addr, pte_t *ptep,
>>   				unsigned int nr, int full);
>> -extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>> -				unsigned long addr, pte_t *ptep);
>> -extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>> -				unsigned long addr, pte_t *ptep);
>> +extern int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep, unsigned int nr);
>> +extern int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep, unsigned int nr);
> 
> In core mm at least, as a convention, we strip 'extern' from header declarations
> as we go as they're not necessary.

Sure. I can remove the 'extern'.

> I wonder about this naming convention also. The contpte_xxx_() prefix
> obviously implies we are operating upon PTEs in the contiguous range, now
> we are doing something... different and 'nr' is a bit vague.
> 
> Is it the nr of contiguous ranges? Well in reality it's nr_pages right? But

Yes, 'nr' here means nr_pages, which follows the convention of the 
parameters in contpte_xxx_() functions.

> now we're not saying they're necessarily contiguous in the sense of contpte...
> 
> I wonder whether we'd be better off introducing a new function that
> explicitly has 'batch' or 'batched' in the name, and have the usual
> contpte_***() stuff and callers that need batching using a new underlying helper?

OK. I get your point. However, this is outside the scope of my patchset.

Perhaps we can clean up all the contpte_xxx_() functions if everyone 
agrees that this is confusing.

> Obviously I defer to Ryan on all this, just my thoughts...
> 
>>   extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>   				pte_t *ptep, unsigned int nr);
>>   extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>> @@ -1854,7 +1854,7 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>>   	if (likely(!pte_valid_cont(orig_pte)))
>>   		return __ptep_test_and_clear_young(vma, addr, ptep);
>>
>> -	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
>> +	return contpte_test_and_clear_young_ptes(vma, addr, ptep, CONT_PTES);
>>   }
>>
>>   #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
>> @@ -1866,7 +1866,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>>   	if (likely(!pte_valid_cont(orig_pte)))
>>   		return __ptep_clear_flush_young(vma, addr, ptep);
>>
>> -	return contpte_ptep_clear_flush_young(vma, addr, ptep);
>> +	return contpte_clear_flush_young_ptes(vma, addr, ptep, CONT_PTES);
>>   }
>>
>>   #define wrprotect_ptes wrprotect_ptes
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index c0557945939c..19b122441be3 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -488,8 +488,9 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
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
>> @@ -500,39 +501,56 @@ int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>>   	 * having to unfold.
>>   	 */
> 
> Hmm shouldn't you need to update this comment now 'nr' is a thing? E.g.:
> 
> "And since we only create a contig range when the range is covered by a single
> folio, we can get away with clearing young for the whole contig range here, so
> we avoid having to unfold."

I think the original comments are still clear:
"
/*
  * ptep_clear_flush_young() technically requires us to clear the access
  * flag for a _single_ pte. However, the core-mm code actually tracks
  * access/dirty per folio, not per page. And since we only create a
  * contig range when the range is covered by a single folio, we can get
  * away with clearing young for the whole contig range here, so we avoid
  * having to unfold.
  */
"

> However now you're allowing for large folios that are not contpte?
> 
> Overall feeling pretty iffy about implementing this this way.

Please see the above comments, which explain why we should do that.

>> +	unsigned long start = addr;
>> +	unsigned long end = start + nr * PAGE_SIZE;
> 
> So now [addr, addr + nr * PAGE_SIZE) must for sure be within a single PTE
> table?

Caller has made sure that (see folio_referenced_one()).

>>   	int young = 0;
>>   	int i;
>>
>> -	ptep = contpte_align_down(ptep);
>> -	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>> +	if (pte_cont(__ptep_get(ptep + nr - 1)))
>> +		end = ALIGN(end, CONT_PTE_SIZE);
> 
> OK so I guess for PTE_CONT to be set, it must be aligned to CONT_PTE_SIZE,
> with other PTE entries present there not having PTE_CONT set (Ryan - do
> correct me if I'm wrong!)
> 
> I guess then no worry about running off the end of the PTE table here.
> 
> I wonder about using pte_cont_addr_end() here, but I guess you are not
> intending to limit to a range here but rather capture the entire contpte
> range of the end.

Right.

> I don't love that now a function prefixed with contpte_... can have a
> condition where part of the input range is _not_ a contpte entry, or is
> specified partially...

Like I said above, this is outside the scope of my patchset. If Ryan 
also thinks we need to do some cleanups for all the contpte_xxx() 
functions in the contpte.c file, we can send a follow-up patchset to 
rename all the contpte_xxx() functions to make it clear.

>> -	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
>> -		young |= __ptep_test_and_clear_young(vma, addr, ptep);
>> +	if (pte_cont(__ptep_get(ptep))) {
>> +		start = ALIGN_DOWN(start, CONT_PTE_SIZE);
>> +		ptep = contpte_align_down(ptep);
>> +	}
>> +
>> +	nr = (end - start) / PAGE_SIZE;
> 
> Hm don't love this reuse of input param.

OK. Will use another local variable instead.

> 
>> +	for (i = 0; i < nr; i++, ptep++, start += PAGE_SIZE)
>> +		young |= __ptep_test_and_clear_young(vma, start, ptep);
> 
> Again, overall find it a bit iffy that we are essentially overloading the
> code with non-contpte behaviour.

Let me clarify further: this is the handling logic of the contpte_xxx() 
functions in the contpte.c file. For example, the function 
contpte_set_ptes() has a parameter 'nr', which may be greater than 
CONT_PTES, meaning that it can handle multiple CONT_PTES range sizes of 
a large folio.

It might be a bit confusing, and I understand this is why you want to 
change the 'contpte_' prefix to the 'batch_' prefix. Of course, we can 
hope Ryan can provide some input on this.

Thanks for reviewing.

