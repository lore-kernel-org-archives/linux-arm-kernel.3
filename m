Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03844C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csN3NGyJz0Plq+DSLlEX2Pakhu0xabELB8Wjy8HXAeM=; b=UvtYpffjCnMkEQhlhK6w0sWlJm
	THPR2qy/3T31Efs7QI+QrJU80n+QMhCVLZXVS7DmXD1AX4jUnqEgehOpZ/gQJBfUHv42y1+5XTQ77
	1TQctankeDiUmEG0+JSpmw4uGDtbTbb35EXmhJqGVA9edJO/eYLV24cd9AiQO8wghiCiCPme3rf7i
	TVlGrQGN8lUxghpXmXqshQv6xlKshaKw9sw22ALGrg+Vj3ZyI/WFohD1BcRYKDKx6jFkUgQ8ka3eU
	W6iWhG2j2B60zlVLwuKGla7K0bmuLFenTcOvmK+stK1RQ8fiveWvx099SOsg2lLu5tSi+OUZ8UY2K
	wXQgIRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUP6Q-00000008bJd-3MDk;
	Wed, 25 Jun 2025 12:19:47 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNfx-00000008MYw-1lv5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:48:22 +0000
Message-ID: <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750848488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csN3NGyJz0Plq+DSLlEX2Pakhu0xabELB8Wjy8HXAeM=;
	b=BWB+hSf9s40JKUag99JUhdHNhY+hi/eWwJYO4YD9eHSuRniIiKbey15lYX6sZe0B1ZFnok
	sZPk4HhuguE7ZuMeAVTkLE7Zes+IVipMQAhigbH1G++5xpJpTMC8j8KZxnXpNdNO2AFCWs
	FaaRff8WSDn24xARtP5xY/nLqjGRjxI=
Date: Wed, 25 Jun 2025 18:47:55 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_034821_607682_D9479786 
X-CRM114-Status: GOOD (  34.57  )
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



On 2025/6/25 18:00, David Hildenbrand wrote:
> On 24.06.25 18:25, Lance Yang wrote:
>> On 2025/6/24 23:34, David Hildenbrand wrote:
>>> On 24.06.25 17:26, Lance Yang wrote:
>>>> On 2025/6/24 20:55, David Hildenbrand wrote:
>>>>> On 14.02.25 10:30, Barry Song wrote:
>>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>> [...]
>>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>>> index 89e51a7a9509..8786704bd466 100644
>>>>>> --- a/mm/rmap.c
>>>>>> +++ b/mm/rmap.c
>>>>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio 
>>>>>> *folio,
>>>>>> struct page *page,
>>>>>>     #endif
>>>>>>     }
>>>>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>>>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>>>> +            struct folio *folio, pte_t *ptep)
>>>>>> +{
>>>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | 
>>>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>>> +    int max_nr = folio_nr_pages(folio);
>>>>>
>>>>> Let's assume we have the first page of a folio mapped at the last page
>>>>> table entry in our page table.
>>>>
>>>> Good point. I'm curious if it is something we've seen in practice ;)
>>>
>>> I challenge you to write a reproducer :P I assume it might be doable
>>> through simple mremap().
>>>
>>>>
>>>>>
>>>>> What prevents folio_pte_batch() from reading outside the page table?
>>>>
>>>> Assuming such a scenario is possible, to prevent any chance of an
>>>> out-of-bounds read, how about this change:
>>>>
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index fb63d9256f09..9aeae811a38b 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1852,6 +1852,25 @@ static inline bool
>>>> can_batch_unmap_folio_ptes(unsigned long addr,
>>>>        const fpb_t fpb_flags = FPB_IGNORE_DIRTY | 
>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>        int max_nr = folio_nr_pages(folio);
>>>>        pte_t pte = ptep_get(ptep);
>>>> +    unsigned long end_addr;
>>>> +
>>>> +    /*
>>>> +     * To batch unmap, the entire folio's PTEs must be contiguous
>>>> +     * and mapped within the same PTE page table, which corresponds to
>>>> +     * a single PMD entry. Before calling folio_pte_batch(), which 
>>>> does
>>>> +     * not perform boundary checks itself, we must verify that the
>>>> +     * address range covered by the folio does not cross a PMD 
>>>> boundary.
>>>> +     */
>>>> +    end_addr = addr + (max_nr * PAGE_SIZE) - 1;
>>>> +
>>>> +    /*
>>>> +     * A fast way to check for a PMD boundary cross is to align both
>>>> +     * the start and end addresses to the PMD boundary and see if they
>>>> +     * are different. If they are, the range spans across at least two
>>>> +     * different PMD-managed regions.
>>>> +     */
>>>> +    if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
>>>> +        return false;
>>>
>>> You should not be messing with max_nr = folio_nr_pages(folio) here at
>>> all. folio_pte_batch() takes care of that.
>>>
>>> Also, way too many comments ;)
>>>
>>> You may only batch within a single VMA and within a single page table.
>>>
>>> So simply align the addr up to the next PMD, and make sure it does not
>>> exceed the vma end.
>>>
>>> ALIGN and friends can help avoiding excessive comments.
>>
>> Thanks! How about this updated version based on your suggestion:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..241d55a92a47 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio 
>> *folio, struct page *page,
>>   /* We support batch unmapping of PTEs for lazyfree large folios */
>>   static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>> -            struct folio *folio, pte_t *ptep)
>> +                          struct folio *folio, pte_t *ptep,
>> +                          struct vm_area_struct *vma)
>>   {
>>       const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +    unsigned long next_pmd, vma_end, end_addr;
>>       int max_nr = folio_nr_pages(folio);
>>       pte_t pte = ptep_get(ptep);
>> +    /*
>> +     * Limit the batch scan within a single VMA and within a single
>> +     * page table.
>> +     */
>> +    vma_end = vma->vm_end;
>> +    next_pmd = ALIGN(addr + 1, PMD_SIZE);
>> +    end_addr = addr + (unsigned long)max_nr * PAGE_SIZE;
>> +
>> +    if (end_addr > min(next_pmd, vma_end))
>> +        return false;
> 
> May I suggest that we clean all that up as we fix it?

Yeah, that looks much better. Thanks for the suggestion!

> 
> Maybe something like this:
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3b74bb19c11dd..11fbddc6ad8d6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio, 
> struct page *page,
>   #endif
>   }
> 
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -                       struct folio *folio, pte_t *ptep)
> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
> +               pte_t pte)
>   {
>          const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> -       int max_nr = folio_nr_pages(folio);
> -       pte_t pte = ptep_get(ptep);
> +       struct vm_area_struct *vma = pvmw->vma;
> +       unsigned long end_addr, addr = pvmw->address;
> +       unsigned int max_nr;
> +
> +       if (flags & TTU_HWPOISON)
> +               return 1;
> +       if (!folio_test_large(folio))
> +               return 1;
> +
> +       /* We may only batch within a single VMA and a single page 
> table. */
> +       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma- 
>  >vm_end);
> +       max_nr = (end_addr - addr) >> PAGE_SHIFT;
> 
> +       /* We only support lazyfree batching for now ... */
>          if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> -               return false;
> +               return 1;
>          if (pte_unused(pte))
> -               return false;
> -       if (pte_pfn(pte) != folio_pfn(folio))
> -               return false;
> +               return 1;
> +       /* ... where we must be able to batch the whole folio. */
> +       if (pte_pfn(pte) != folio_pfn(folio) || max_nr != 
> folio_nr_pages(folio))
> +               return 1;
> +       max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, 
> fpb_flags,
> +                                NULL, NULL, NULL);
> 
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, 
> fpb_flags, NULL,
> -                              NULL, NULL) == max_nr;
> +       if (max_nr != folio_nr_pages(folio))
> +               return 1;
> +       return max_nr;
>   }
> 
>   /*
> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio, 
> struct vm_area_struct *vma,
>                          if (pte_dirty(pteval))
>                                  folio_mark_dirty(folio);
>                  } else if (likely(pte_present(pteval))) {
> -                       if (folio_test_large(folio) && !(flags & 
> TTU_HWPOISON) &&
> -                           can_batch_unmap_folio_ptes(address, folio, 
> pvmw.pte))
> -                               nr_pages = folio_nr_pages(folio);
> +                       nr_pages = folio_unmap_pte_batch(folio, &pvmw, 
> flags, pteval);
>                          end_addr = address + nr_pages * PAGE_SIZE;
>                          flush_cache_range(vma, address, end_addr);
> 
> 
> Note that I don't quite understand why we have to batch the whole thing 
> or fallback to
> individual pages. Why can't we perform other batches that span only some 
> PTEs? What's special
> about 1 PTE vs. 2 PTEs vs. all PTEs?

That's a good point about the "all-or-nothing" batching logic ;)

It seems the "all-or-nothing" approach is specific to the lazyfree use
case, which needs to unmap the entire folio for reclamation. If that's
not possible, it falls back to the single-page slow path.

Also, supporting partial batches would be useful, but not common case
I guess, so let's leave it as is ;p

Thanks,
Lance

> 
> 
> Can someone enlighten me why that is required?
> 


