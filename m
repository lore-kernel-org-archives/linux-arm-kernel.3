Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE22C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6x25AG0NKTqt1lkb9Vl1FBFG/qqID/tFbHdX57Nvh8=; b=eA/+7OPqC/GvgnW02ttNTMaheO
	8ANrWiFQ/feLq2nSza8mcZV7NMBZsykbjxWMi/E4DnPAdnBJHd57SpvabCFX49/geFOL6pZRwC4Ff
	UbV7BnWnY7KBCqOdQCViyTud/6+NodPl9Msg6kb9uF13LkPMGxaSLAdPkvIzIq50vyTM8x2ge4Gj1
	TOd1U1G+SJw0UKShOiudjisqB9G1gv0JW8hdnkiq1Ng48niOxUhQXCBVM7SjTqA74I/abeOwgjXYd
	h+T9kM8O/nk3WbaHY/V8s3I2uSNQry4l7mP/Pa4w72lKdjcSZdqbtZmcNCL/oSKMdYhTHBgvX7Vil
	ACdlowFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQ5y-00000008nBr-1r5b;
	Wed, 25 Jun 2025 13:23:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMvw-00000008Ejh-1WVa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750845646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z6x25AG0NKTqt1lkb9Vl1FBFG/qqID/tFbHdX57Nvh8=;
	b=RUVdhZZfZ9O0WLNHipR5gJ2xxgZKoruwiOq3yMUJimcHLf4HPldioD7J7srnXbV7zS3+06
	TV5F4z5YOf8bgsMkEzLDwPh7icJfEpO561Z236k6NoE5b7Ptw0yHLAHbv5u+xW4Eef4hb9
	JKgJWQ5YSzJfFZev5vcOBo/K1FPj5v8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-Y747FxJ4ObWLvBLyiuYBQQ-1; Wed, 25 Jun 2025 06:00:44 -0400
X-MC-Unique: Y747FxJ4ObWLvBLyiuYBQQ-1
X-Mimecast-MFC-AGG-ID: Y747FxJ4ObWLvBLyiuYBQQ_1750845643
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so50459615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845643; x=1751450443;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z6x25AG0NKTqt1lkb9Vl1FBFG/qqID/tFbHdX57Nvh8=;
        b=KkoLp1y9guQVz3IdNlgR5XoWlfMmwngfLGGKbalYWOmMCO1EgZy0bESV89XPmkXEMt
         TlcPQYNc35VxBQXAbUUfw/In1/yLWsRVKaZMObf6NhkDN9EPDY8llPrXmOYcU3HsTvpT
         jSVcIBthRe49ZcIeh3sdUcOuwZ5nbJFcYO/qA4SOxMwDEBSPJM6YoC92YAv+kShKl6mr
         9dmoFn3y60rwGSE/wANAyn/SyAW//L51FF+QoA0twd4ElGLC2fnfy9KSOKBKAXsQaChP
         8phZvG98GGIViWROTcwb5/ZQGJQbnT7/NdB9NXQ9uzeqLJeaq5M6vG4BvxKhZlXk+OVa
         7vmg==
X-Forwarded-Encrypted: i=1; AJvYcCWKel8Bv44upd05r6LPtPBWSCjhhb3lkJCtuP1hVwVO58hDLxp2Er4xqZR6H2L9Mtnbwj/hGjQzzeMGBlGIdw7+@lists.infradead.org
X-Gm-Message-State: AOJu0YwrW999glMd4mDON2ijfj3S98S7MEsjUQGn6PAYV3w+SUTmVFJC
	FR4NSEaMj9CYH4V7YBqiJ7O8tTMSoPUSWpAq/pUEdrcJiNC36Ts8cDZ1wtzWUxQ48cps0zpvXPR
	u65k9p2JYwEX3HwiOl2y7XTgLG3ThUQ6sXG7Zr6awsyAHXmU17xyr+alY2JWFPJpz8RaRtn8R6h
	Fn
X-Gm-Gg: ASbGncuKabVBOK9tggmWpS3pg6/zYevgDUR8K0+OwqiJivjCVsWlFV7CE4sX1oNPQhV
	yJPyyJLY1m0OQEkS8CA8/ETc9FC6/zPb58NYbswrbU3Ja31u1o1Kf3xqDZFhmx3XNyZF8OnZAzn
	821ODxNeiWH8Lf5Ir83xcxD1Nc3WfjZsFpkm9153iJX8SoOA7Mpx5tOIdEH+Az9/7/1NEsawEju
	fwd4QWCiVnVXPwqOonsExOlerfpcB8B788Bcyz7JwLJDEs1zYuyQcY/MPtPoKZW9EcYUjybWjwX
	NRIgYLO58/Qsj4Wwp/1Zn+nR4OHgXEOsXaDOtY6A7Tc/YusKupQ+EMM22rlEkkkb6tfSbsidG9o
	lX8VkytALHe9wxleryvqTzaS4pVSn4Aqz9nC278JShvHG
X-Received: by 2002:a05:600c:34d5:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-45381aa54a4mr19589805e9.6.1750845643108;
        Wed, 25 Jun 2025 03:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbFu+V0sZ3EiTRGRhEf4Kgy4D0bfZ6Q+UXw5h7nqUWzo/Aj45oYcdj8mNtUHNPs1PdualaTw==
X-Received: by 2002:a05:600c:34d5:b0:442:f97b:87e with SMTP id 5b1f17b1804b1-45381aa54a4mr19589155e9.6.1750845642504;
        Wed, 25 Jun 2025 03:00:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382366f88sm14780565e9.30.2025.06.25.03.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:00:40 -0700 (PDT)
Message-ID: <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
Date: Wed, 25 Jun 2025 12:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <ioworker0@gmail.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250624162503.78957-1-ioworker0@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MtZCXKBuZdQmdl7lR_s0wL30gC99hMWCgCEi6a9JgQI_1750845643
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_030048_555714_6C2BFE5A 
X-CRM114-Status: GOOD (  31.15  )
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

On 24.06.25 18:25, Lance Yang wrote:
> On 2025/6/24 23:34, David Hildenbrand wrote:
>> On 24.06.25 17:26, Lance Yang wrote:
>>> On 2025/6/24 20:55, David Hildenbrand wrote:
>>>> On 14.02.25 10:30, Barry Song wrote:
>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>> [...]
>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>> index 89e51a7a9509..8786704bd466 100644
>>>>> --- a/mm/rmap.c
>>>>> +++ b/mm/rmap.c
>>>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio,
>>>>> struct page *page,
>>>>>     #endif
>>>>>     }
>>>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>>> +            struct folio *folio, pte_t *ptep)
>>>>> +{
>>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>>> +    int max_nr = folio_nr_pages(folio);
>>>>
>>>> Let's assume we have the first page of a folio mapped at the last page
>>>> table entry in our page table.
>>>
>>> Good point. I'm curious if it is something we've seen in practice ;)
>>
>> I challenge you to write a reproducer :P I assume it might be doable
>> through simple mremap().
>>
>>>
>>>>
>>>> What prevents folio_pte_batch() from reading outside the page table?
>>>
>>> Assuming such a scenario is possible, to prevent any chance of an
>>> out-of-bounds read, how about this change:
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index fb63d9256f09..9aeae811a38b 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1852,6 +1852,25 @@ static inline bool
>>> can_batch_unmap_folio_ptes(unsigned long addr,
>>>        const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>        int max_nr = folio_nr_pages(folio);
>>>        pte_t pte = ptep_get(ptep);
>>> +    unsigned long end_addr;
>>> +
>>> +    /*
>>> +     * To batch unmap, the entire folio's PTEs must be contiguous
>>> +     * and mapped within the same PTE page table, which corresponds to
>>> +     * a single PMD entry. Before calling folio_pte_batch(), which does
>>> +     * not perform boundary checks itself, we must verify that the
>>> +     * address range covered by the folio does not cross a PMD boundary.
>>> +     */
>>> +    end_addr = addr + (max_nr * PAGE_SIZE) - 1;
>>> +
>>> +    /*
>>> +     * A fast way to check for a PMD boundary cross is to align both
>>> +     * the start and end addresses to the PMD boundary and see if they
>>> +     * are different. If they are, the range spans across at least two
>>> +     * different PMD-managed regions.
>>> +     */
>>> +    if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
>>> +        return false;
>>
>> You should not be messing with max_nr = folio_nr_pages(folio) here at
>> all. folio_pte_batch() takes care of that.
>>
>> Also, way too many comments ;)
>>
>> You may only batch within a single VMA and within a single page table.
>>
>> So simply align the addr up to the next PMD, and make sure it does not
>> exceed the vma end.
>>
>> ALIGN and friends can help avoiding excessive comments.
> 
> Thanks! How about this updated version based on your suggestion:
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..241d55a92a47 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>   
>   /* We support batch unmapping of PTEs for lazyfree large folios */
>   static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -			struct folio *folio, pte_t *ptep)
> +					      struct folio *folio, pte_t *ptep,
> +					      struct vm_area_struct *vma)
>   {
>   	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	unsigned long next_pmd, vma_end, end_addr;
>   	int max_nr = folio_nr_pages(folio);
>   	pte_t pte = ptep_get(ptep);
>   
> +	/*
> +	 * Limit the batch scan within a single VMA and within a single
> +	 * page table.
> +	 */
> +	vma_end = vma->vm_end;
> +	next_pmd = ALIGN(addr + 1, PMD_SIZE);
> +	end_addr = addr + (unsigned long)max_nr * PAGE_SIZE;
> +
> +	if (end_addr > min(next_pmd, vma_end))
> +		return false;

May I suggest that we clean all that up as we fix it?

Maybe something like this:

diff --git a/mm/rmap.c b/mm/rmap.c
index 3b74bb19c11dd..11fbddc6ad8d6 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
  #endif
  }
  
-/* We support batch unmapping of PTEs for lazyfree large folios */
-static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-                       struct folio *folio, pte_t *ptep)
+static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
+               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
+               pte_t pte)
  {
         const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
-       int max_nr = folio_nr_pages(folio);
-       pte_t pte = ptep_get(ptep);
+       struct vm_area_struct *vma = pvmw->vma;
+       unsigned long end_addr, addr = pvmw->address;
+       unsigned int max_nr;
+
+       if (flags & TTU_HWPOISON)
+               return 1;
+       if (!folio_test_large(folio))
+               return 1;
+
+       /* We may only batch within a single VMA and a single page table. */
+       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma->vm_end);
+       max_nr = (end_addr - addr) >> PAGE_SHIFT;
  
+       /* We only support lazyfree batching for now ... */
         if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
-               return false;
+               return 1;
         if (pte_unused(pte))
-               return false;
-       if (pte_pfn(pte) != folio_pfn(folio))
-               return false;
+               return 1;
+       /* ... where we must be able to batch the whole folio. */
+       if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
+               return 1;
+       max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+                                NULL, NULL, NULL);
  
-       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-                              NULL, NULL) == max_nr;
+       if (max_nr != folio_nr_pages(folio))
+               return 1;
+       return max_nr;
  }
  
  /*
@@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
                         if (pte_dirty(pteval))
                                 folio_mark_dirty(folio);
                 } else if (likely(pte_present(pteval))) {
-                       if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-                           can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-                               nr_pages = folio_nr_pages(folio);
+                       nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
                         end_addr = address + nr_pages * PAGE_SIZE;
                         flush_cache_range(vma, address, end_addr);
  

Note that I don't quite understand why we have to batch the whole thing or fallback to
individual pages. Why can't we perform other batches that span only some PTEs? What's special
about 1 PTE vs. 2 PTEs vs. all PTEs?


Can someone enlighten me why that is required?

-- 
Cheers,

David / dhildenb


