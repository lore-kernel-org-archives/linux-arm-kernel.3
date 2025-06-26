Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96636C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY2E1jy/7MGPvO3Ll+Cvxe7OYf2h0jUrU+yFnWh2ZEg=; b=0Y2vh1tIsSN6RL7adz45oe5N7j
	LzTY+h51vwZLCWs7fb3ClDj0PUdln6M/1bMRu5dF4lX3r5pyd8wp+FdV86rqSgV14J+tllsKNpqag
	vwQ4TNxrX2H9kIFtbclq0Js9TqoPu6UyN+w44wrBZDXKGJkZB8g8slCSpGgjAxTbuh9E1I+/dEOlY
	e3s3MnbnNO4UakxwehDn9RwDtk1Cg+IC+DCFyufgAQnN4TSHyKZwg0FJewz4E4H+uSLkkiKzuiY7X
	SX/F5XRhRuO5kTFwVT9qfOoh0VsSmmJUz1CTDwFeSV7WVVdT9zjP1US32/27DQy0LkaODkxJhMQKU
	zf2k4t3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUno8-0000000BxqT-3z7f;
	Thu, 26 Jun 2025 14:42:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnl2-0000000BxPW-1HVr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Jun 2025 14:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BY2E1jy/7MGPvO3Ll+Cvxe7OYf2h0jUrU+yFnWh2ZEg=; b=qHbeqd/PHOUkSTYOviWh/AAQJq
	kLZKkWWxPNn/Hojr/7owU4RjrlcGL0LBz/mvgrF+0cIA6YNplik0cyg+KRLcATrstY7TuljNwVb39
	ApFdnPy+aByk+aWlJh5GW8DV9mWH4sG0bKUblUBKT68IbqJ4F1AGwC7Ooze3IVo9C83EIubJVm00r
	7RqW3+AN4cTudJfvICzAPnaWC6IbxZG8c8ZK6SdGA2F2HoVEomK3anx3LrS2TicRs79PIzyo4npYc
	BB++9mjo/1t78MS1pEIs+UnvK5yl91dS2il33sPkq3VFt7ATAd3CEIk9huWX0RDzEriQM40Iud8KC
	kMKuNYvw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnkx-0000000674e-2Xzn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750948751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BY2E1jy/7MGPvO3Ll+Cvxe7OYf2h0jUrU+yFnWh2ZEg=;
	b=WgySH4VqBNO9OwL65JVpoCMUoFvWZTPUVcT70eqxczRksBJRDwx+/XYPffwNFcHRsiwwcC
	2u3pUDB37KJ9eMpHMAdrrWjSJvKh9aYbrSD+UXTRnGrvUeJ0yV9+B0ftOTgP5FIe8Nroh2
	aTIHpcDmMNqZyg1ghJVeSNPsxnRVcpA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750948752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BY2E1jy/7MGPvO3Ll+Cvxe7OYf2h0jUrU+yFnWh2ZEg=;
	b=GSWtg7StKmppwW4CW5u7H9M3RtccLvlyhXlk4fsnxi5OuvuOxBliPjvzUzbUNuslsAbOwm
	57hHajOLY02K4BNsSBhpzy3H/EskhthY3jJdhtvorPaNcCeCXHVRlDf6iUU7PSxmLfSeRT
	oFF4r9kuDqC+Lb2kaWW5TZX3X5Yu154=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-ZkEMQ1pwNy6VuKWqEsKDPA-1; Thu, 26 Jun 2025 10:39:08 -0400
X-MC-Unique: ZkEMQ1pwNy6VuKWqEsKDPA-1
X-Mimecast-MFC-AGG-ID: ZkEMQ1pwNy6VuKWqEsKDPA_1750948747
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453817323afso6844625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 07:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948747; x=1751553547;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BY2E1jy/7MGPvO3Ll+Cvxe7OYf2h0jUrU+yFnWh2ZEg=;
        b=mHMyedD2w0IUBrHErg4x0Rc3EyPax8YKFmUrBMQqAPb0B4dgNIcjVivEm67hwPoqdl
         pNyiMX629T5aC0o6u9mO6AE/YOIYQ7d6qW7JZY7T/m/ENHIlMBVi8q13CqPlcKfSZAD/
         vErM1xO6S7qaeGvzHkKnzil0RbQkwmKD7gOFa7GvU9g7DylsN2QUi2bJ+CdwYw3CPl8R
         stnO+5pIATltZ5AZIg3YCXIk19ONYCwbIJSHAA0vwFW7wEEaPLs5SgwAp9mFfVDhfWaK
         gycqJEju0Slnmvgs9OVH6llV5TiZayVnU16/KFlrGfO1f/ARmOaAHSQihgdsAmnQXy4u
         gi3A==
X-Forwarded-Encrypted: i=1; AJvYcCUpqB2VYw9Gey+7acT+oDN6X3tNYifM6wqu3SRGJX+iHwE7bSOrTBVEEgx8UvmHGX23njAFWIwYUPVPBoaLDCzq@lists.infradead.org
X-Gm-Message-State: AOJu0YySC6aXouiitS9pRfhwDnbibM9OvQi2crK6t2NPKFfD+e48zEhZ
	nDtVG8PiYJlLxnaVPCmUPQr2k5tm1zlqu71226FzDnrDkBp2r6ZoDc0I2S2FbOVu4BpL/Ps8lTa
	vR0Lsn3n+snaLrjHr9PNR7o9oR3140gGBaof3sqfRDT7mZ6EX4nX9SimwY0TkHFQ5hCJUR3RRhX
	jW
X-Gm-Gg: ASbGncv8q0EqgDj7A/ee56+yKZ/eW3fFi8u3ZR9B38jtkElc4ighifF7YqXuJzHCtE6
	oJyAkfcKaBup0eznUQT+/KIJRPn47mfjfhjwJRSxb8zFKne7TthDA4KoVDnruhxTiXQhC4/ld7/
	bNCZIQcS01V1XxF5msGH3FPNcvNBKhZv98U1ecN/34f/Pk3g6/8qXOj0M8iysPqYqwhvoiqspK/
	Qxyc+Zo/eCYxDpIMB5WJIQRnDbXUd/EoUWoCTZCxOLoRx1nbyhv3/bt8r+e4v3aIcasdtas/Chf
	jv54m5WXkN5nCVByoJOvZCqSlim5jYm9qZgg3t8hm6CqCbtmzCPuXYcooOIlXhAGDy/tw52TfKq
	/BabUgQDDp33CHPJ0kaPJD+O0+ic0nFNT+upjrnRMsU3hmJbhhg==
X-Received: by 2002:a05:600c:c491:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45389e486f7mr30363175e9.21.1750948746979;
        Thu, 26 Jun 2025 07:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy2qq2vLirOLZHC17Rj2lI4wcoy47uHLvz2KBNOe/SOzizf5s7I3AdBHz4Cd3zEi3bqVm/iQ==
X-Received: by 2002:a05:600c:c491:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45389e486f7mr30362805e9.21.1750948746491;
        Thu, 26 Jun 2025 07:39:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3b2fd7sm22569255e9.17.2025.06.26.07.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:39:06 -0700 (PDT)
Message-ID: <6fbcf806-eb3c-4bcd-8daf-8d87fd759d2b@redhat.com>
Date: Thu, 26 Jun 2025 16:39:04 +0200
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
References: <20250626092905.31305-1-ioworker0@gmail.com>
 <20250626124445.77865-1-ioworker0@gmail.com>
 <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
 <ce78181f-b8f0-4710-be22-eff123760a51@linux.dev>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ce78181f-b8f0-4710-be22-eff123760a51@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9CaMmgtj-zi4erBGMdl2WOBhKH7S9CW5kV8hzzUm5ZA_1750948747
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_153915_903483_22294FB7 
X-CRM114-Status: GOOD (  21.71  )
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

On 26.06.25 15:52, Lance Yang wrote:
> 
> 
> On 2025/6/26 21:16, David Hildenbrand wrote:
>> On 26.06.25 14:44, Lance Yang wrote:
>>>
>>> On 2025/6/26 17:29, Lance Yang wrote:
>>>> Before I send out the real patch, I'd like to get some quick feedback to
>>>> ensure I've understood the discussion correctly ;)
>>>>
>>>> Does this look like the right direction?
>>>>
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index fb63d9256f09..5ebffe2137e4 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1845,23 +1845,37 @@ void folio_remove_rmap_pud(struct folio
>>>> *folio, struct page *page,
>>>>     #endif
>>>>     }
>>>> -/* We support batch unmapping of PTEs for lazyfree large folios */
>>>> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>> -            struct folio *folio, pte_t *ptep)
>>>> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>>> +            struct page_vma_mapped_walk *pvmw,
>>>> +            enum ttu_flags flags, pte_t pte)
>>>>     {
>>>>         const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> -    int max_nr = folio_nr_pages(folio);
>>>> -    pte_t pte = ptep_get(ptep);
>>>> +    unsigned long end_addr, addr = pvmw->address;
>>>> +    struct vm_area_struct *vma = pvmw->vma;
>>>> +    unsigned int max_nr;
>>>> +
>>>> +    if (flags & TTU_HWPOISON)
>>>> +        return 1;
>>>> +    if (!folio_test_large(folio))
>>>> +        return 1;
>>>> +    /* We may only batch within a single VMA and a single page
>>>> table. */
>>>> +    end_addr = pmd_addr_end(addr, vma->vm_end);
>>>> +    max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>>> +
>>>> +    /* We only support lazyfree batching for now ... */
>>>>         if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>>>> -        return false;
>>>> +        return 1;
>>>>         if (pte_unused(pte))
>>>> -        return false;
>>>> -    if (pte_pfn(pte) != folio_pfn(folio))
>>>> -        return false;
>>>> +        return 1;
>>>> +
>>>> +    /* ... where we must be able to batch the whole folio. */
>>>> +    if (pte_pfn(pte) != folio_pfn(folio) || max_nr !=
>>>> folio_nr_pages(folio))
>>>> +        return 1;
>>>> +    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr,
>>>> fpb_flags,
>>>> +                 NULL, NULL, NULL);
>>>> -    return folio_pte_batch(folio, addr, ptep, pte, max_nr,
>>>> fpb_flags, NULL,
>>>> -                   NULL, NULL) == max_nr;
>>>> +    return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>>>>     }
>>>>     /*
>>>> @@ -2024,9 +2038,7 @@ static bool try_to_unmap_one(struct folio
>>>> *folio, struct vm_area_struct *vma,
>>>>                 if (pte_dirty(pteval))
>>>>                     folio_mark_dirty(folio);
>>>>             } else if (likely(pte_present(pteval))) {
>>>> -            if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
>>>> -                can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
>>>> -                nr_pages = folio_nr_pages(folio);
>>>> +            nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags,
>>>> pteval);
>>>>                 end_addr = address + nr_pages * PAGE_SIZE;
>>>>                 flush_cache_range(vma, address, end_addr);
>>>> @@ -2206,13 +2218,16 @@ static bool try_to_unmap_one(struct folio
>>>> *folio, struct vm_area_struct *vma,
>>>>                 hugetlb_remove_rmap(folio);
>>>>             } else {
>>>>                 folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
>>>> -            folio_ref_sub(folio, nr_pages - 1);
>>>>             }
>>>>             if (vma->vm_flags & VM_LOCKED)
>>>>                 mlock_drain_local();
>>>> -        folio_put(folio);
>>>> -        /* We have already batched the entire folio */
>>>> -        if (nr_pages > 1)
>>>> +        folio_put_refs(folio, nr_pages);
>>>> +
>>>> +        /*
>>>> +         * If we are sure that we batched the entire folio and cleared
>>>> +         * all PTEs, we can just optimize and stop right here.
>>>> +         */
>>>> +        if (nr_pages == folio_nr_pages(folio))
>>>>                 goto walk_done;
>>>>             continue;
>>>>     walk_abort:
>>>> -- 
>>>
>>> Oops ... Through testing on my machine, I found that the logic doesn't
>>> behave as expected because I messed up the meaning of max_nr (the
>>> available
>>> scan room in the page table) with folio_nr_pages(folio) :(
>>>
>>> With the following change:
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index 5ebffe2137e4..b1407348e14e 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1850,9 +1850,9 @@ static inline unsigned int
>>> folio_unmap_pte_batch(struct folio *folio,
>>>                enum ttu_flags flags, pte_t pte)
>>>    {
>>>        const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +    unsigned int max_nr, nr_pages = folio_nr_pages(folio);
>>>        unsigned long end_addr, addr = pvmw->address;
>>>        struct vm_area_struct *vma = pvmw->vma;
>>> -    unsigned int max_nr;
>>>        if (flags & TTU_HWPOISON)
>>>            return 1;
>>> @@ -1870,12 +1870,13 @@ static inline unsigned int
>>> folio_unmap_pte_batch(struct folio *folio,
>>>            return 1;
>>>        /* ... where we must be able to batch the whole folio. */
>>
>> Why is that still required? :)
> 
> Sorry ... I was still stuck in the "all-or-nothing" mindset ...
> 
> So, IIUC, you mean we should completely remove the "max_nr < nr_pages"
> check and just let folio_pte_batch handle whatever partial batch it
> safely can.
> 
>>
>>> -    if (pte_pfn(pte) != folio_pfn(folio) || max_nr !=
>>> folio_nr_pages(folio))
>>> +    if (pte_pfn(pte) != folio_pfn(folio) || max_nr < nr_pages)
>>>            return 1;
>>> -    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr,
>>> fpb_flags,
>>> -                 NULL, NULL, NULL);
>>> -    return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
>>> +    max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, nr_pages,
>>> +                 fpb_flags, NULL, NULL, NULL);
>>> +
>>> +    return (max_nr != nr_pages) ? 1 : max_nr;
>>
>> Why is that still required? :)
> 
> Then simply return the number of PTEs that consecutively map to the
> large folio. Right?

Yes. Any part of the large folio. Just return folio_pte_batch() ...

-- 
Cheers,

David / dhildenb


