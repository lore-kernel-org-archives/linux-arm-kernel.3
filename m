Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB4CC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxJ/+GIT8i2T2VJ1n6tfW4Ns7LsKzLgWRa8bu373EG0=; b=J4qMvkgVSzOJqfkoculgqXgWhF
	X7iDAMhptpy7p4CCKYxKoTfU/Ftkcc2bBCvgYv2n8pmtAixIiIRdoUnOHwA04/6s8tg2i5kbYWBXH
	OHqwlZe4NXPF78SCfU1XbtsQyA8brSHPgLE7qZ5r8o3XqGSt6La2x49Oa8N9fO4qGHgTPYQiJBGMg
	lOqV29jEmcEYPK1HZhLKBQ7tQZgfJ+S2deiVJu9evaMWIL++LHh8g/bMTwaPpSqhunMC8lOWE4Uzw
	ygzV9ZfQyUEEhuHhcCkuRlzioAic/5SYrJd0ERXS9bJVkuSNpbNMoyvHeEtQ8gt/V5CyYhuHbC2IY
	2A85JSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUn71-0000000BpW0-1khb;
	Thu, 26 Jun 2025 13:57:59 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUn2k-0000000Blio-1raY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 13:53:35 +0000
Message-ID: <ce78181f-b8f0-4710-be22-eff123760a51@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750946001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxJ/+GIT8i2T2VJ1n6tfW4Ns7LsKzLgWRa8bu373EG0=;
	b=q3Rv2EQwghbWQOo1XaSDbcFu49quE13kRIvVREM0PKjnsNVV1rc3AS10a0Mx3LudcEXvHs
	sDaC2vuB+PvgI3l8Q1InsFKXX5w4xajOJHTVvZnsY2a+Aa4C7FzZrtH3nn7i95qwN2ot5Z
	QHjYdgduBbJf/3HTfvAdwv0zsn5hlAM=
Date: Thu, 26 Jun 2025 21:52:58 +0800
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <20250626092905.31305-1-ioworker0@gmail.com>
 <20250626124445.77865-1-ioworker0@gmail.com>
 <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
Content-Language: en-US
In-Reply-To: <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_065334_614500_97659AF2 
X-CRM114-Status: GOOD (  18.35  )
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



On 2025/6/26 21:16, David Hildenbrand wrote:
> On 26.06.25 14:44, Lance Yang wrote:
>>
>> On 2025/6/26 17:29, Lance Yang wrote:
>>> Before I send out the real patch, I'd like to get some quick feedback to
>>> ensure I've understood the discussion correctly ;)
>>>
>>> Does this look like the right direction?
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index fb63d9256f09..5ebffe2137e4 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1845,23 +1845,37 @@ void folio_remove_rmap_pud(struct folio 
>>> *folio, struct page *page,
>>>    #endif
>>>    }
>>> -/* We support batch unmapping of PTEs for lazyfree large folios */
>>> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>> -            struct folio *folio, pte_t *ptep)
>>> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>> +            struct page_vma_mapped_walk *pvmw,
>>> +            enum ttu_flags flags, pte_t pte)
>>>    {
>>>        const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> -    int max_nr = folio_nr_pages(folio);
>>> -    pte_t pte = ptep_get(ptep);
>>> +    unsigned long end_addr, addr = pvmw->address;
>>> +    struct vm_area_struct *vma = pvmw->vma;
>>> +    unsigned int max_nr;
>>> +
>>> +    if (flags & TTU_HWPOISON)
>>> +        return 1;
>>> +    if (!folio_test_large(folio))
>>> +        return 1;
>>> +    /* We may only batch within a single VMA and a single page 
>>> table. */
>>> +    end_addr = pmd_addr_end(addr, vma->vm_end);
>>> +    max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>> +
>>> +    /* We only support lazyfree batching for now ... */
>>>        if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>>> -        return false;
>>> +        return 1;
>>>        if (pte_unused(pte))
>>> -        return false;
>>> -    if (pte_pfn(pte) != folio_pfn(folio))
>>> -        return false;
>>> +        return 1;
>>> +
>>> +    /* ... where we must be able to batch the whole folio. */
>>> +    if (pte_pfn(pte) != folio_pfn(folio) || max_nr != 
>>> folio_nr_pages(folio))
>>> +        return 1;
>>> +    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, 
>>> fpb_flags,
>>> +                 NULL, NULL, NULL);
>>> -    return folio_pte_batch(folio, addr, ptep, pte, max_nr, 
>>> fpb_flags, NULL,
>>> -                   NULL, NULL) == max_nr;
>>> +    return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>>>    }
>>>    /*
>>> @@ -2024,9 +2038,7 @@ static bool try_to_unmap_one(struct folio 
>>> *folio, struct vm_area_struct *vma,
>>>                if (pte_dirty(pteval))
>>>                    folio_mark_dirty(folio);
>>>            } else if (likely(pte_present(pteval))) {
>>> -            if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
>>> -                can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
>>> -                nr_pages = folio_nr_pages(folio);
>>> +            nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, 
>>> pteval);
>>>                end_addr = address + nr_pages * PAGE_SIZE;
>>>                flush_cache_range(vma, address, end_addr);
>>> @@ -2206,13 +2218,16 @@ static bool try_to_unmap_one(struct folio 
>>> *folio, struct vm_area_struct *vma,
>>>                hugetlb_remove_rmap(folio);
>>>            } else {
>>>                folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
>>> -            folio_ref_sub(folio, nr_pages - 1);
>>>            }
>>>            if (vma->vm_flags & VM_LOCKED)
>>>                mlock_drain_local();
>>> -        folio_put(folio);
>>> -        /* We have already batched the entire folio */
>>> -        if (nr_pages > 1)
>>> +        folio_put_refs(folio, nr_pages);
>>> +
>>> +        /*
>>> +         * If we are sure that we batched the entire folio and cleared
>>> +         * all PTEs, we can just optimize and stop right here.
>>> +         */
>>> +        if (nr_pages == folio_nr_pages(folio))
>>>                goto walk_done;
>>>            continue;
>>>    walk_abort:
>>> -- 
>>
>> Oops ... Through testing on my machine, I found that the logic doesn't
>> behave as expected because I messed up the meaning of max_nr (the 
>> available
>> scan room in the page table) with folio_nr_pages(folio) :(
>>
>> With the following change:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 5ebffe2137e4..b1407348e14e 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1850,9 +1850,9 @@ static inline unsigned int 
>> folio_unmap_pte_batch(struct folio *folio,
>>               enum ttu_flags flags, pte_t pte)
>>   {
>>       const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +    unsigned int max_nr, nr_pages = folio_nr_pages(folio);
>>       unsigned long end_addr, addr = pvmw->address;
>>       struct vm_area_struct *vma = pvmw->vma;
>> -    unsigned int max_nr;
>>       if (flags & TTU_HWPOISON)
>>           return 1;
>> @@ -1870,12 +1870,13 @@ static inline unsigned int 
>> folio_unmap_pte_batch(struct folio *folio,
>>           return 1;
>>       /* ... where we must be able to batch the whole folio. */
> 
> Why is that still required? :)

Sorry ... I was still stuck in the "all-or-nothing" mindset ...

So, IIUC, you mean we should completely remove the "max_nr < nr_pages"
check and just let folio_pte_batch handle whatever partial batch it
safely can.

> 
>> -    if (pte_pfn(pte) != folio_pfn(folio) || max_nr != 
>> folio_nr_pages(folio))
>> +    if (pte_pfn(pte) != folio_pfn(folio) || max_nr < nr_pages)
>>           return 1;
>> -    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, 
>> fpb_flags,
>> -                 NULL, NULL, NULL);
>> -    return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>> +    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, nr_pages,
>> +                 fpb_flags, NULL, NULL, NULL);
>> +
>> +    return (max_nr != nr_pages) ? 1 : max_nr;
> 
> Why is that still required? :)

Then simply return the number of PTEs that consecutively map to the
large folio. Right?

