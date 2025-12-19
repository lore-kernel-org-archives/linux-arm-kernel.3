Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F02FD711CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 01:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVOeY+3SuOrvYNqzmFJNbA4A4ujnPrtjXb52VW//WT8=; b=a2B/A5rt2zsoyJDfIIvzTY5QGr
	iiqqtxZIU/9cBbYO7bNb3h/BS032Xj5UriffH7NDEwY+Kc+0VM+89JfFr6vbIh78mWD23GY/u6onf
	Ox8BXMnKlfe/RZzXJY/54ZATAo0T9Vz+8HeK0XvZTunxx6dmBz1Q54YzXBpyijcAha1x0HbkJqZT1
	He7UU5HgfpBKsAMG+C1W7PQXvkTyU9SpgpE5JVHzq5m3JSjVgvgZgj5QGpxU2XRi7GtXq0drbzWsG
	6xEE9qA60qUyQqeYMvc201hCGOzBCOq70f+xicl7ygY9izLG5DiZj1gimK/dTzBaNKib6vo8hWdSN
	rqNvXomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWOrJ-00000009PbS-33Ir;
	Fri, 19 Dec 2025 01:00:41 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWOrH-00000009Pb1-2z1C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 01:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766106037; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=IVOeY+3SuOrvYNqzmFJNbA4A4ujnPrtjXb52VW//WT8=;
	b=tAgeRCYGGrMA5AyQtCnmYCjWQB5FidkPEJA02w8/OBD3ooicZSdL2ycpvSlmYlLvghEHD1GRqb5GeOcoNwseAw7RKlHVzvLmq/3ca69lGDwvicAPwPl3ZAiizxYs5UuP9RtQJDgpouH0UaLfSlE6qZuXg2GNm39h99vzW5VsXfs=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WvARIF8_1766106034 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 19 Dec 2025 09:00:34 +0800
Message-ID: <9c6393e1-fc88-46bf-9a3e-b28b8cda1c75@linux.alibaba.com>
Date: Fri, 19 Dec 2025 09:00:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: support batch clearing of the young
 flag for large folios
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <e10f876ce130134fa089befe83f30561b48b9889.1765439380.git.baolin.wang@linux.alibaba.com>
 <1beaa7de-4b31-4f19-abee-83872f868e28@arm.com>
 <96c0adcc-abfd-4a44-be93-1c6bd7942d6d@linux.alibaba.com>
 <d3b40df8-e5cf-42aa-8205-de624024fad1@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <d3b40df8-e5cf-42aa-8205-de624024fad1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_170039_931162_51DA51AB 
X-CRM114-Status: GOOD (  24.59  )
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



On 2025/12/18 20:20, Ryan Roberts wrote:
> On 18/12/2025 07:15, Baolin Wang wrote:
>>
>>
>> On 2025/12/17 23:43, Ryan Roberts wrote:
>>> Sorry I'm a bit late to the party...
>>
>> Never mind. It's not late and comments are always welcome :)
>>
>>> On 11/12/2025 08:16, Baolin Wang wrote:
>>>> Currently, contpte_ptep_test_and_clear_young() and
>>>> contpte_ptep_clear_flush_young()
>>>> only clear the young flag and flush TLBs for PTEs within the contiguous range.
>>>> To support batch PTE operations for other sized large folios in the following
>>>> patches, adding a new parameter to specify the number of PTEs.
>>>>
>>>> While we are at it, rename the functions to maintain consistency with other
>>>> contpte_*() functions.
>>>>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>    arch/arm64/include/asm/pgtable.h | 12 ++++-----
>>>>    arch/arm64/mm/contpte.c          | 44 ++++++++++++++++++++++----------
>>>>    2 files changed, 37 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>>> index 0944e296dd4a..e03034683156 100644
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -1679,10 +1679,10 @@ extern void contpte_clear_full_ptes(struct mm_struct
>>>> *mm, unsigned long addr,
>>>>    extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>>>>                    unsigned long addr, pte_t *ptep,
>>>>                    unsigned int nr, int full);
>>>> -extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>>>> -                unsigned long addr, pte_t *ptep);
>>>> -extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>>>> -                unsigned long addr, pte_t *ptep);
>>>> +extern int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
>>>> +                unsigned long addr, pte_t *ptep, unsigned int nr);
>>>> +extern int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
>>>> +                unsigned long addr, pte_t *ptep, unsigned int nr);
>>>
>>> The "contpte_" functions are intended to be private to the arm64 arch and should
>>> be exposed via the generic APIs. But I don't see any generic batched API for
>>> this, so you're only actually able to pass CONT_PTES as nr. Perhaps you're
>>> planning to define "test_and_clear_young_ptes()" and "clear_flush_young_ptes()"
>>> in later patches?
>>
>> Right. This is a preparation patch, and will be used in patch 2.
>>
>>>>    extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>>>                    pte_t *ptep, unsigned int nr);
>>>>    extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>>>> @@ -1854,7 +1854,7 @@ static inline int ptep_test_and_clear_young(struct
>>>> vm_area_struct *vma,
>>>>        if (likely(!pte_valid_cont(orig_pte)))
>>>>            return __ptep_test_and_clear_young(vma, addr, ptep);
>>>>    -    return contpte_ptep_test_and_clear_young(vma, addr, ptep);
>>>> +    return contpte_test_and_clear_young_ptes(vma, addr, ptep, CONT_PTES);
>>>>    }
>>>>      #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
>>>> @@ -1866,7 +1866,7 @@ static inline int ptep_clear_flush_young(struct
>>>> vm_area_struct *vma,
>>>>        if (likely(!pte_valid_cont(orig_pte)))
>>>>            return __ptep_clear_flush_young(vma, addr, ptep);
>>>>    -    return contpte_ptep_clear_flush_young(vma, addr, ptep);
>>>> +    return contpte_clear_flush_young_ptes(vma, addr, ptep, CONT_PTES);
>>>>    }
>>>>      #define wrprotect_ptes wrprotect_ptes
>>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>>> index c0557945939c..19b122441be3 100644
>>>> --- a/arch/arm64/mm/contpte.c
>>>> +++ b/arch/arm64/mm/contpte.c
>>>> @@ -488,8 +488,9 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
>>>>    -int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>>>> -                    unsigned long addr, pte_t *ptep)
>>>> +int contpte_test_and_clear_young_ptes(struct vm_area_struct *vma,
>>>> +                    unsigned long addr, pte_t *ptep,
>>>> +                    unsigned int nr)
>>>>    {
>>>>        /*
>>>>         * ptep_clear_flush_young() technically requires us to clear the access
>>>> @@ -500,39 +501,56 @@ int contpte_ptep_test_and_clear_young(struct
>>>> vm_area_struct *vma,
>>>>         * having to unfold.
>>>>         */
>>>>    +    unsigned long start = addr;
>>>
>>> Personally I wouldn't bother defining start - just reuse addr. You're
>>> incrementing start in the below loop, so it's more appropriate to call it addr
>>> anyway.
>>
>> OK.
>>
>>>> +    unsigned long end = start + nr * PAGE_SIZE;
>>>>        int young = 0;
>>>>        int i;
>>>>    -    ptep = contpte_align_down(ptep);
>>>> -    addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>>>> +    if (pte_cont(__ptep_get(ptep + nr - 1)))
>>>> +        end = ALIGN(end, CONT_PTE_SIZE);
>>>>    -    for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
>>>> -        young |= __ptep_test_and_clear_young(vma, addr, ptep);
>>>> +    if (pte_cont(__ptep_get(ptep))) {
>>>> +        start = ALIGN_DOWN(start, CONT_PTE_SIZE);
>>>> +        ptep = contpte_align_down(ptep);
>>>> +    }
>>>> +
>>>> +    nr = (end - start) / PAGE_SIZE;
>>>> +    for (i = 0; i < nr; i++, ptep++, start += PAGE_SIZE)
>>>
>>> Given you're now defining end, perhaps we don't need nr?
>>>
>>>      for (; addr != end; ptep++, addr += PAGE_SIZE)
>>>          young |= __ptep_test_and_clear_young(vma, addr, ptep);
>>
>> Yes, good point.
>>
>>>> +        young |= __ptep_test_and_clear_young(vma, start, ptep);
>>>>          return young;
>>>>    }
>>>> -EXPORT_SYMBOL_GPL(contpte_ptep_test_and_clear_young);
>>>> +EXPORT_SYMBOL_GPL(contpte_test_and_clear_young_ptes);
>>>>    -int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>>>> -                    unsigned long addr, pte_t *ptep)
>>>> +int contpte_clear_flush_young_ptes(struct vm_area_struct *vma,
>>>> +                unsigned long addr, pte_t *ptep,
>>>> +                unsigned int nr)
>>>>    {
>>>>        int young;
>>>>    -    young = contpte_ptep_test_and_clear_young(vma, addr, ptep);
>>>> +    young = contpte_test_and_clear_young_ptes(vma, addr, ptep, nr);
>>>>          if (young) {
>>>> +        unsigned long start = addr;
>>>> +        unsigned long end = start + nr * PAGE_SIZE;
>>>> +
>>>> +        if (pte_cont(__ptep_get(ptep + nr - 1)))
>>>> +            end = ALIGN(end, CONT_PTE_SIZE);
>>>> +
>>>> +        if (pte_cont(__ptep_get(ptep)))
>>>> +            start = ALIGN_DOWN(start, CONT_PTE_SIZE);
>>>> +
>>>
>>> We now have this pattern of expanding contpte blocks up and down in 3 places.
>>> Perhaps create a helper?
>>
>> Sounds reasonable. How about the following helper?
>>
>> static pte_t *contpte_align_addr_ptep(unsigned long *start, unsigned long *end,
>>                                          pte_t *ptep, unsigned int nr)
>> {
>>          unsigned long end_addr = *start + nr * PAGE_SIZE;
>>
>>          if (pte_cont(__ptep_get(ptep + nr - 1)))
> 
> I think this is safe but calling it out to check; you're not checking that the
> pte is valid, so theoretically you could have a swap-entry here with whatever
> overlays the contiguous bit set. So then you would incorrectly extend.
> 
> But I think it is safe because the expectation is that core-mm has already
> checked that the whole range is present?

Yes. They must be present PTEs that map consecutive pages of the same 
large folio within a single VMA and a single page table. I will add some 
comments to make this clear.

>>                  *end = ALIGN(end_addr, CONT_PTE_SIZE);
>>
>>          if (pte_cont(__ptep_get(ptep))) {
>>                  *start = ALIGN_DOWN(*start, CONT_PTE_SIZE);
>>                  ptep = contpte_align_down(ptep);
>>          }
>>
>>          return ptep;
>> }
> 
> Looks good.

Thanks for reviewing.

