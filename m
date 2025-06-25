Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F766C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gRgjAak7xJTTxVLyGXCxsxOciNk+TsX5x7MsFcRu/Y=; b=T2BkIS4kUlRN+FgZjHp4QO3Oo9
	ZfSQGvinZbJ6ksZuYxCulH2EiV2ElejTW8neS6TdS5KnZLUvbUigppuoA3LqTdO/xqAp01kh60X+Z
	0zwotVbWvWlZHbn5NSDQZgsjjjtY0t0RNUsp5ixUa/EDPrGB8aWiARh4Jh8K+hJO0FCTv/ADYERQu
	FMK2X6v7lvAnKBv+X3yW6H7JHQ1UtylmrUpWk3Y0VQDCMS7k7PRllRwRPYj9jgTiNBErvI+TvrGlL
	nS62CUdBPly/CLhkfDj9qSbHhNeiK3ce31kjnnE/UZilS/tY98vSZFSrO2AH7c3u8it1D+obVlnpV
	MUkm7d8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUP8q-00000008bmt-0nH2;
	Wed, 25 Jun 2025 12:22:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNha-00000008MnC-17QZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750848601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9gRgjAak7xJTTxVLyGXCxsxOciNk+TsX5x7MsFcRu/Y=;
	b=UhcYOHTIKcuMkaj6NKokSyFNyhvizilPI6rxe/ReGGISrJrxizlghwMOmCf6EJAW0OcAq5
	PzptjFKHtc55ruiQGynzvfPocB3UZ9fNWFnkunl6YacFaDygY34zaIe8jPfwvZz5ATBbUO
	zUb4qiNr6dQfpMLeHZqwb1e/yqvw6UI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-ygefNO5oN1u8ckH6fwAaiQ-1; Wed, 25 Jun 2025 06:49:59 -0400
X-MC-Unique: ygefNO5oN1u8ckH6fwAaiQ-1
X-Mimecast-MFC-AGG-ID: ygefNO5oN1u8ckH6fwAaiQ_1750848598
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so2547211f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848598; x=1751453398;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9gRgjAak7xJTTxVLyGXCxsxOciNk+TsX5x7MsFcRu/Y=;
        b=SpSCq//tva5QIMjrXsPHli+5OT0bJ572jt6fIVIeOUdbCVFGdkMvdRH4vpPGjp2o2z
         L1xXjP/qbfyuAPeYqe25/c3gCU8fqeEJxsTKLrYMO3TNL/8UfvnKUt1f37FpMv+2DXBu
         PlN8F8mBfcgXdemmfJ8TrtCyJH/cgEajqwraccM6aDLvskibmUpQClRAqXDwrmlakwgf
         jLaLLrkqxly+XVJVCg4vc2xIFlirruEZlv7/qktRVWFZZR4Vilqm5nyU78AfIhtFUN+V
         Stt/6ROeZ1UDlx2AgddMdE0lNT+0c6NpuXllR9qI2Quw7hD3sUoKRVxw1KHhpVYeN82k
         gbMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEN+/R1KcR5jMXp11S7OTyTPstP1Ou4kexOBM2Dw9WjFk8ZAt1YG9xdICO1C5jXi2sddi7I9laxlRU2E080VgW@lists.infradead.org
X-Gm-Message-State: AOJu0YxzfSlsQpy3SijBw9/vQ+yOo/U5/RMExa1MZU6ASlMGU7tMsqxO
	oLbxAo4qukOnCqxYKnSuy/3SudvxgKAREVu9sapP5uQTQPxPXchcd+6gufmn/X79RfsmlIyF/xk
	h2TJjp0uPFb/Zi7XGa/Jkoz0gqeP1SI6MHYYEsnFGeS6rVq1SS9Wm7mceCuTCiwamDqSCdL5KiZ
	sP
X-Gm-Gg: ASbGnct+XDp1Qx6DaFLeZnNOzCCTcKGg2Mt/h/Pp/wqF5EqAXSJPcqIacWI9B4jKhdl
	2V6evKGDEwcSkMO6tkEwvaoC/u5BfnY64eguGYwL8rjzZpO1pxCdufi70qY6/1usz0AgBfhLXu0
	2okHyBY4/fSaMfTXrp1NQ4lSIiksUdj68i2vygwzsMs0DBoPT8+I7U/OSCEcWX5+IKHETKH1Szh
	HknMGLXFvu0erjrZc6zNTL7Nx3L8aEOWYl2Xe4O7lPVNFInHzsI9IXHfGUK1sAM/I1RjfgwWo/A
	ULwURE7Z5RMzedQTM29MiTWXadAT2oEFf92mEu6k4bMUD/JGM+09kAYva05AeO4/WLDH904nr9i
	lxcoL6kGC6yX9Vbp/IzTOWfvouyn8BRPYsi8wY+Tmo7D2
X-Received: by 2002:a05:6000:65a:b0:3a5:7967:cdb9 with SMTP id ffacd0b85a97d-3a6ed64b5f4mr1819016f8f.46.1750848598310;
        Wed, 25 Jun 2025 03:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPdnEmT0LicnyngP4DkPh4YUruLW0U3BgglpiHQRqZaWtUeIj3qNtHNoxkgOet2hSIfITdfQ==
X-Received: by 2002:a05:6000:65a:b0:3a5:7967:cdb9 with SMTP id ffacd0b85a97d-3a6ed64b5f4mr1818969f8f.46.1750848597763;
        Wed, 25 Jun 2025 03:49:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805caf3sm4259252f8f.22.2025.06.25.03.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:49:57 -0700 (PDT)
Message-ID: <de1f984c-d3d3-4b18-9681-03db2464fbe4@redhat.com>
Date: Wed, 25 Jun 2025 12:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>
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
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y20SnxQ2UywUKKCRLbYlv1Ve-QAmAZIXtaazDV0OJbw_1750848598
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035002_463146_7765E161 
X-CRM114-Status: GOOD (  23.52  )
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

On 25.06.25 12:47, Lance Yang wrote:
> 
> 
> On 2025/6/25 18:00, David Hildenbrand wrote:
>> On 24.06.25 18:25, Lance Yang wrote:
>>> On 2025/6/24 23:34, David Hildenbrand wrote:
>>>> On 24.06.25 17:26, Lance Yang wrote:
>>>>> On 2025/6/24 20:55, David Hildenbrand wrote:
>>>>>> On 14.02.25 10:30, Barry Song wrote:
>>>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>>> [...]
>>>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>>>> index 89e51a7a9509..8786704bd466 100644
>>>>>>> --- a/mm/rmap.c
>>>>>>> +++ b/mm/rmap.c
>>>>>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio
>>>>>>> *folio,
>>>>>>> struct page *page,
>>>>>>>      #endif
>>>>>>>      }
>>>>>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>>>>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>>>>> +            struct folio *folio, pte_t *ptep)
>>>>>>> +{
>>>>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>>>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>>>> +    int max_nr = folio_nr_pages(folio);
>>>>>>
>>>>>> Let's assume we have the first page of a folio mapped at the last page
>>>>>> table entry in our page table.
>>>>>
>>>>> Good point. I'm curious if it is something we've seen in practice ;)
>>>>
>>>> I challenge you to write a reproducer :P I assume it might be doable
>>>> through simple mremap().
>>>>
>>>>>
>>>>>>
>>>>>> What prevents folio_pte_batch() from reading outside the page table?
>>>>>
>>>>> Assuming such a scenario is possible, to prevent any chance of an
>>>>> out-of-bounds read, how about this change:
>>>>>
>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>> index fb63d9256f09..9aeae811a38b 100644
>>>>> --- a/mm/rmap.c
>>>>> +++ b/mm/rmap.c
>>>>> @@ -1852,6 +1852,25 @@ static inline bool
>>>>> can_batch_unmap_folio_ptes(unsigned long addr,
>>>>>         const fpb_t fpb_flags = FPB_IGNORE_DIRTY |
>>>>> FPB_IGNORE_SOFT_DIRTY;
>>>>>         int max_nr = folio_nr_pages(folio);
>>>>>         pte_t pte = ptep_get(ptep);
>>>>> +    unsigned long end_addr;
>>>>> +
>>>>> +    /*
>>>>> +     * To batch unmap, the entire folio's PTEs must be contiguous
>>>>> +     * and mapped within the same PTE page table, which corresponds to
>>>>> +     * a single PMD entry. Before calling folio_pte_batch(), which
>>>>> does
>>>>> +     * not perform boundary checks itself, we must verify that the
>>>>> +     * address range covered by the folio does not cross a PMD
>>>>> boundary.
>>>>> +     */
>>>>> +    end_addr = addr + (max_nr * PAGE_SIZE) - 1;
>>>>> +
>>>>> +    /*
>>>>> +     * A fast way to check for a PMD boundary cross is to align both
>>>>> +     * the start and end addresses to the PMD boundary and see if they
>>>>> +     * are different. If they are, the range spans across at least two
>>>>> +     * different PMD-managed regions.
>>>>> +     */
>>>>> +    if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
>>>>> +        return false;
>>>>
>>>> You should not be messing with max_nr = folio_nr_pages(folio) here at
>>>> all. folio_pte_batch() takes care of that.
>>>>
>>>> Also, way too many comments ;)
>>>>
>>>> You may only batch within a single VMA and within a single page table.
>>>>
>>>> So simply align the addr up to the next PMD, and make sure it does not
>>>> exceed the vma end.
>>>>
>>>> ALIGN and friends can help avoiding excessive comments.
>>>
>>> Thanks! How about this updated version based on your suggestion:
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index fb63d9256f09..241d55a92a47 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio
>>> *folio, struct page *page,
>>>    /* We support batch unmapping of PTEs for lazyfree large folios */
>>>    static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>> -            struct folio *folio, pte_t *ptep)
>>> +                          struct folio *folio, pte_t *ptep,
>>> +                          struct vm_area_struct *vma)
>>>    {
>>>        const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +    unsigned long next_pmd, vma_end, end_addr;
>>>        int max_nr = folio_nr_pages(folio);
>>>        pte_t pte = ptep_get(ptep);
>>> +    /*
>>> +     * Limit the batch scan within a single VMA and within a single
>>> +     * page table.
>>> +     */
>>> +    vma_end = vma->vm_end;
>>> +    next_pmd = ALIGN(addr + 1, PMD_SIZE);
>>> +    end_addr = addr + (unsigned long)max_nr * PAGE_SIZE;
>>> +
>>> +    if (end_addr > min(next_pmd, vma_end))
>>> +        return false;
>>
>> May I suggest that we clean all that up as we fix it?
> 
> Yeah, that looks much better. Thanks for the suggestion!
> 
>>
>> Maybe something like this:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 3b74bb19c11dd..11fbddc6ad8d6 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio,
>> struct page *page,
>>    #endif
>>    }
>>
>> -/* We support batch unmapping of PTEs for lazyfree large folios */
>> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>> -                       struct folio *folio, pte_t *ptep)
>> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
>> +               pte_t pte)
>>    {
>>           const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> -       int max_nr = folio_nr_pages(folio);
>> -       pte_t pte = ptep_get(ptep);
>> +       struct vm_area_struct *vma = pvmw->vma;
>> +       unsigned long end_addr, addr = pvmw->address;
>> +       unsigned int max_nr;
>> +
>> +       if (flags & TTU_HWPOISON)
>> +               return 1;
>> +       if (!folio_test_large(folio))
>> +               return 1;
>> +
>> +       /* We may only batch within a single VMA and a single page
>> table. */
>> +       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma-
>>   >vm_end);
>> +       max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>
>> +       /* We only support lazyfree batching for now ... */
>>           if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>> -               return false;
>> +               return 1;
>>           if (pte_unused(pte))
>> -               return false;
>> -       if (pte_pfn(pte) != folio_pfn(folio))
>> -               return false;
>> +               return 1;
>> +       /* ... where we must be able to batch the whole folio. */
>> +       if (pte_pfn(pte) != folio_pfn(folio) || max_nr !=
>> folio_nr_pages(folio))
>> +               return 1;
>> +       max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr,
>> fpb_flags,
>> +                                NULL, NULL, NULL);
>>
>> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr,
>> fpb_flags, NULL,
>> -                              NULL, NULL) == max_nr;
>> +       if (max_nr != folio_nr_pages(folio))
>> +               return 1;
>> +       return max_nr;
>>    }
>>
>>    /*
>> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio,
>> struct vm_area_struct *vma,
>>                           if (pte_dirty(pteval))
>>                                   folio_mark_dirty(folio);
>>                   } else if (likely(pte_present(pteval))) {
>> -                       if (folio_test_large(folio) && !(flags &
>> TTU_HWPOISON) &&
>> -                           can_batch_unmap_folio_ptes(address, folio,
>> pvmw.pte))
>> -                               nr_pages = folio_nr_pages(folio);
>> +                       nr_pages = folio_unmap_pte_batch(folio, &pvmw,
>> flags, pteval);
>>                           end_addr = address + nr_pages * PAGE_SIZE;
>>                           flush_cache_range(vma, address, end_addr);
>>
>>
>> Note that I don't quite understand why we have to batch the whole thing
>> or fallback to
>> individual pages. Why can't we perform other batches that span only some
>> PTEs? What's special
>> about 1 PTE vs. 2 PTEs vs. all PTEs?
> 
> That's a good point about the "all-or-nothing" batching logic ;)
> 
> It seems the "all-or-nothing" approach is specific to the lazyfree use
> case, which needs to unmap the entire folio for reclamation. If that's
> not possible, it falls back to the single-page slow path.
> 
> Also, supporting partial batches would be useful, but not common case
> I guess, so let's leave it as is ;p

We can literally make this code less complicated if we just support it? :)

I mean, it's dropping 3 if conditions from the code I shared.

-- 
Cheers,

David / dhildenb


