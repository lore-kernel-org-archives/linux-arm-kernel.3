Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01459CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MDldjfo9tupcUWZQnJpfd82Ij9mxbI05fyuJdEjujE=; b=OQXAwrYH2wCx2bOnk4RpYmdVTs
	uNOQgnf9809sFSrJKk+n2d0naoXtZvj14TCwpIjY6eSk0gQS8AJW7oukbSUi6GYBo7WA96nOpSuHC
	aIeKKy/iNbZ3BQ5re8VpGFTrOediYpPCAGm3kmaEdXF4yBQHO84dfZRGctxJQMnuu39ZfnOZIoaWR
	MOKIqqiyR6K9iSyGmRBZ0RTwZIoTSTF0TYZmX6oeo8v8mliWCbo7ugXsW2ABw6vJBSLlpFBje6syI
	XzuzRkMiQKZqsu3tLVPaHZTiHulb3yjj8Zp7d2NqBXbFvjnssICH1hfRlHs0CPO24VnSWfMZ6r7KO
	tlno20Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD28-0000000HFLT-0dh2;
	Thu, 18 Sep 2025 11:42:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD25-0000000HFJq-1HzR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:42:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso555647f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758195755; x=1758800555; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MDldjfo9tupcUWZQnJpfd82Ij9mxbI05fyuJdEjujE=;
        b=Qi2fe8xTZZFa62hSoTc32XPzJcJiPWvbvryLA0rBRY/vVaeZ9uISyLtoWZOgLwqNp2
         uLTrwuNCWUvD9BSxfXgfb+AD2g+02jvGmdlVHQMHVvdV4bWDdo7dALl0ENKwgEBFIBws
         jcx7SV3CnyGUSuCJJKZdMAcJGnPBOJ8zfHlLQh7UzdOEqwix5eUVzoFItpSHiD7d97Zi
         2LZw6gF6L9L4r1wJzdCl1g2Cvfuj+Hq8VODBf4EilPpjKPJKaFTBlvqG4P8IQGEOw6EZ
         VQWAwSaw9yw1A3NtWDSQK4MSLzktm2F+bAQY2KxuQMd5Dx2MRm4upQkxU64tOVhBmQkJ
         hkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758195755; x=1758800555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MDldjfo9tupcUWZQnJpfd82Ij9mxbI05fyuJdEjujE=;
        b=GUx8ZKJBpnZkZcdX3g83cqydCO7eznhN/tATuvYZu7IVd4MXEIuNs8mjWbfka3Zy6i
         /rVrcgSfLPX5dRtOjIFnQDBqWn8dMqoVzjjxfUa2eZ4VckRgxbCinXMfykY8KOAhiU14
         joVFQ89I7oy7BCXyHmWKKCRjy9rFZA0Vcecf8kpRs/czoJK5YOh8ynSw4+lTawgecnuh
         UNqBmEKBEUVuR2aIUtZveIF0o+FT9uXWdody05rHr7HUKP2ykpPty9soZVUz5MKoSsU1
         GBAjgX2p6HYJinSqU7uNj561HQYf6/TQdcOt5KL/JrhI1TlRqb8tuNjnJW0P1n+sKBxX
         vvEA==
X-Forwarded-Encrypted: i=1; AJvYcCUPf8WyoiiRtiwPaOFxPtBrS7HeRshOJKHml3db7HcfQyo1r7Q1XkY1TSgR1ArqYN1YMtOQaQlAF+uR1H3YvF8x@lists.infradead.org
X-Gm-Message-State: AOJu0YyRLdcacaAjxRJUiYhe9DYkZnasmAIZYN9ZecQuGkNEwzo7Ia+Z
	mqJCO16CsWiyEqBVYO3Da73RvwnPRJmJJUShVzG0QnopOpiNZn0zWCxj
X-Gm-Gg: ASbGnctxCJ9dsIccKOUfKu320Qu2085Fwf9qdO1n3/m00tke4RtKIP7ZwjohxlzvXJC
	g7TJmjWKYSp3XrwBH7hPT3r95OzPvc7fzsakazUvxlBYJ8P3lzhEPV6vBwUiYRYHptBYEd4ds1b
	3BqVWRn7pl6ASUvXIyG4C0mBBwGXsuJ6AuKPtTTcQhSV+0mIzDMDDBV5Pw5Yql6oyJZt72LOYzg
	iK3QYruDho1cvcSssuh0G8P8UVscAJQ5FWMYV9Mv1nlBKbLU+TeNICbCHTrjg5xcthhHQe8qVTm
	mzWJewv3rddXmVJMa764SRReg2p0mVdR6Fnxcr99SAbRgWyDaztOJJfUWzImxwupXCS2ZDqu5aj
	8bmZxUTfMITeMFMr8SzjBHOGCBABOlfgxTCbTfpQ14cOpv+BffTUcPNAKhqcPdNZi5qXGMKGek7
	Vkbv3rEa8QfDAy6OSqfTOWPVbP9EYA0uOuZgnPYJAsJbhkhKs=
X-Google-Smtp-Source: AGHT+IF829AGz7l52wXYxA2mF38Hka9ir3qUf7a8oPfBCDeW8zhPeoB6ZqT8hn60Yp5Ltk7KFhTa5Q==
X-Received: by 2002:a05:6000:4383:b0:3e1:219e:a74a with SMTP id ffacd0b85a97d-3ecdf9c277cmr5586035f8f.21.1758195754770;
        Thu, 18 Sep 2025 04:42:34 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e759:7e00:1047:5c2a:74d8:1f23? ([2a02:6b6f:e759:7e00:1047:5c2a:74d8:1f23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbfedd6sm3405278f8f.60.2025.09.18.04.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 04:42:33 -0700 (PDT)
Message-ID: <52175d87-50b5-49f8-bb68-6071e6b03557@gmail.com>
Date: Thu, 18 Sep 2025 12:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] mm: remap unused subpages to shared zeropage when
 splitting isolated thp
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>,
 =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "yuzhao@google.com" <yuzhao@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 =?UTF-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>,
 "npache@redhat.com" <npache@redhat.com>, "rppt@kernel.org"
 <rppt@kernel.org>, "willy@infradead.org" <willy@infradead.org>,
 "kernel-team@meta.com" <kernel-team@meta.com>,
 "roman.gushchin@linux.dev" <roman.gushchin@linux.dev>,
 "hannes@cmpxchg.org" <hannes@cmpxchg.org>,
 "cerasuolodomenico@gmail.com" <cerasuolodomenico@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ryncsn@gmail.com" <ryncsn@gmail.com>, "surenb@google.com"
 <surenb@google.com>, "riel@surriel.com" <riel@surriel.com>,
 "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>,
 =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?=
 <chinwen.chang@mediatek.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 =?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "baohua@kernel.org" <baohua@kernel.org>,
 "kaleshsingh@google.com" <kaleshsingh@google.com>,
 "zhais@google.com" <zhais@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240830100438.3623486-1-usamaarif642@gmail.com>
 <20240830100438.3623486-3-usamaarif642@gmail.com>
 <a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com>
 <434c092b-0f19-47bf-a5fa-ea5b4b36c35e@redhat.com>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <434c092b-0f19-47bf-a5fa-ea5b4b36c35e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_044237_408741_BDBD35DF 
X-CRM114-Status: GOOD (  19.10  )
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



On 18/09/2025 09:56, David Hildenbrand wrote:
> On 18.09.25 10:53, Qun-wei Lin (林群崴) wrote:
>> On Fri, 2024-08-30 at 11:03 +0100, Usama Arif wrote:
>>> From: Yu Zhao <yuzhao@google.com>
>>>
>>> Here being unused means containing only zeros and inaccessible to
>>> userspace. When splitting an isolated thp under reclaim or migration,
>>> the unused subpages can be mapped to the shared zeropage, hence
>>> saving
>>> memory. This is particularly helpful when the internal
>>> fragmentation of a thp is high, i.e. it has many untouched subpages.
>>>
>>> This is also a prerequisite for THP low utilization shrinker which
>>> will
>>> be introduced in later patches, where underutilized THPs are split,
>>> and
>>> the zero-filled pages are freed saving memory.
>>>
>>> Signed-off-by: Yu Zhao <yuzhao@google.com>
>>> Tested-by: Shuang Zhai <zhais@google.com>
>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>> ---
>>>   include/linux/rmap.h |  7 ++++-
>>>   mm/huge_memory.c     |  8 ++---
>>>   mm/migrate.c         | 72 ++++++++++++++++++++++++++++++++++++++----
>>> -- 
>>>   mm/migrate_device.c  |  4 +--
>>>   4 files changed, 75 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>> index 91b5935e8485..d5e93e44322e 100644
>>> --- a/include/linux/rmap.h
>>> +++ b/include/linux/rmap.h
>>> @@ -745,7 +745,12 @@ int folio_mkclean(struct folio *);
>>>   int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages,
>>> pgoff_t pgoff,
>>>                 struct vm_area_struct *vma);
>>>   -void remove_migration_ptes(struct folio *src, struct folio *dst,
>>> bool locked);
>>> +enum rmp_flags {
>>> +    RMP_LOCKED        = 1 << 0,
>>> +    RMP_USE_SHARED_ZEROPAGE    = 1 << 1,
>>> +};
>>> +
>>> +void remove_migration_ptes(struct folio *src, struct folio *dst, int
>>> flags);
>>>     /*
>>>    * rmap_walk_control: To control rmap traversing for specific needs
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 0c48806ccb9a..af60684e7c70 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -3020,7 +3020,7 @@ bool unmap_huge_pmd_locked(struct
>>> vm_area_struct *vma, unsigned long addr,
>>>       return false;
>>>   }
>>>   -static void remap_page(struct folio *folio, unsigned long nr)
>>> +static void remap_page(struct folio *folio, unsigned long nr, int
>>> flags)
>>>   {
>>>       int i = 0;
>>>   @@ -3028,7 +3028,7 @@ static void remap_page(struct folio *folio,
>>> unsigned long nr)
>>>       if (!folio_test_anon(folio))
>>>           return;
>>>       for (;;) {
>>> -        remove_migration_ptes(folio, folio, true);
>>> +        remove_migration_ptes(folio, folio, RMP_LOCKED |
>>> flags);
>>>           i += folio_nr_pages(folio);
>>>           if (i >= nr)
>>>               break;
>>> @@ -3240,7 +3240,7 @@ static void __split_huge_page(struct page
>>> *page, struct list_head *list,
>>>         if (nr_dropped)
>>>           shmem_uncharge(folio->mapping->host, nr_dropped);
>>> -    remap_page(folio, nr);
>>> +    remap_page(folio, nr, PageAnon(head) ?
>>> RMP_USE_SHARED_ZEROPAGE : 0);
>>>         /*
>>>        * set page to its compound_head when split to non order-0
>>> pages, so
>>> @@ -3542,7 +3542,7 @@ int split_huge_page_to_list_to_order(struct
>>> page *page, struct list_head *list,
>>>           if (mapping)
>>>               xas_unlock(&xas);
>>>           local_irq_enable();
>>> -        remap_page(folio, folio_nr_pages(folio));
>>> +        remap_page(folio, folio_nr_pages(folio), 0);
>>>           ret = -EAGAIN;
>>>       }
>>>   diff --git a/mm/migrate.c b/mm/migrate.c
>>> index 6f9c62c746be..d039863e014b 100644
>>> --- a/mm/migrate.c
>>> +++ b/mm/migrate.c
>>> @@ -204,13 +204,57 @@ bool isolate_folio_to_list(struct folio *folio,
>>> struct list_head *list)
>>>       return true;
>>>   }
>>>   +static bool try_to_map_unused_to_zeropage(struct
>>> page_vma_mapped_walk *pvmw,
>>> +                      struct folio *folio,
>>> +                      unsigned long idx)
>>> +{
>>> +    struct page *page = folio_page(folio, idx);
>>> +    bool contains_data;
>>> +    pte_t newpte;
>>> +    void *addr;
>>> +
>>> +    VM_BUG_ON_PAGE(PageCompound(page), page);
>>> +    VM_BUG_ON_PAGE(!PageAnon(page), page);
>>> +    VM_BUG_ON_PAGE(!PageLocked(page), page);
>>> +    VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
>>> +
>>> +    if (folio_test_mlocked(folio) || (pvmw->vma->vm_flags &
>>> VM_LOCKED) ||
>>> +        mm_forbids_zeropage(pvmw->vma->vm_mm))
>>> +        return false;
>>> +
>>> +    /*
>>> +     * The pmd entry mapping the old thp was flushed and the pte
>>> mapping
>>> +     * this subpage has been non present. If the subpage is only
>>> zero-filled
>>> +     * then map it to the shared zeropage.
>>> +     */
>>> +    addr = kmap_local_page(page);
>>> +    contains_data = memchr_inv(addr, 0, PAGE_SIZE);
>>> +    kunmap_local(addr);
>>> +
>>> +    if (contains_data)
>>> +        return false;
>>> +
>>> +    newpte = pte_mkspecial(pfn_pte(my_zero_pfn(pvmw->address),
>>> +                    pvmw->vma->vm_page_prot));
>>> +    set_pte_at(pvmw->vma->vm_mm, pvmw->address, pvmw->pte,
>>> newpte);
>>> +
>>> +    dec_mm_counter(pvmw->vma->vm_mm, mm_counter(folio));
>>> +    return true;
>>> +}
>>> +
>>> +struct rmap_walk_arg {
>>> +    struct folio *folio;
>>> +    bool map_unused_to_zeropage;
>>> +};
>>> +
>>>   /*
>>>    * Restore a potential migration pte to a working pte entry
>>>    */
>>>   static bool remove_migration_pte(struct folio *folio,
>>> -        struct vm_area_struct *vma, unsigned long addr, void
>>> *old)
>>> +        struct vm_area_struct *vma, unsigned long addr, void
>>> *arg)
>>>   {
>>> -    DEFINE_FOLIO_VMA_WALK(pvmw, old, vma, addr, PVMW_SYNC |
>>> PVMW_MIGRATION);
>>> +    struct rmap_walk_arg *rmap_walk_arg = arg;
>>> +    DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr,
>>> PVMW_SYNC | PVMW_MIGRATION);
>>>         while (page_vma_mapped_walk(&pvmw)) {
>>>           rmap_t rmap_flags = RMAP_NONE;
>>> @@ -234,6 +278,9 @@ static bool remove_migration_pte(struct folio
>>> *folio,
>>>               continue;
>>>           }
>>>   #endif
>>> +        if (rmap_walk_arg->map_unused_to_zeropage &&
>>> +            try_to_map_unused_to_zeropage(&pvmw, folio,
>>> idx))
>>> +            continue;
>>>             folio_get(folio);
>>>           pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
>>> @@ -312,14 +359,21 @@ static bool remove_migration_pte(struct folio
>>> *folio,
>>>    * Get rid of all migration entries and replace them by
>>>    * references to the indicated page.
>>>    */
>>> -void remove_migration_ptes(struct folio *src, struct folio *dst,
>>> bool locked)
>>> +void remove_migration_ptes(struct folio *src, struct folio *dst, int
>>> flags)
>>>   {
>>> +    struct rmap_walk_arg rmap_walk_arg = {
>>> +        .folio = src,
>>> +        .map_unused_to_zeropage = flags &
>>> RMP_USE_SHARED_ZEROPAGE,
>>> +    };
>>> +
>>>       struct rmap_walk_control rwc = {
>>>           .rmap_one = remove_migration_pte,
>>> -        .arg = src,
>>> +        .arg = &rmap_walk_arg,
>>>       };
>>>   -    if (locked)
>>> +    VM_BUG_ON_FOLIO((flags & RMP_USE_SHARED_ZEROPAGE) && (src !=
>>> dst), src);
>>> +
>>> +    if (flags & RMP_LOCKED)
>>>           rmap_walk_locked(dst, &rwc);
>>>       else
>>>           rmap_walk(dst, &rwc);
>>> @@ -934,7 +988,7 @@ static int writeout(struct address_space
>>> *mapping, struct folio *folio)
>>>        * At this point we know that the migration attempt cannot
>>>        * be successful.
>>>        */
>>> -    remove_migration_ptes(folio, folio, false);
>>> +    remove_migration_ptes(folio, folio, 0);
>>>         rc = mapping->a_ops->writepage(&folio->page, &wbc);
>>>   @@ -1098,7 +1152,7 @@ static void migrate_folio_undo_src(struct folio
>>> *src,
>>>                      struct list_head *ret)
>>>   {
>>>       if (page_was_mapped)
>>> -        remove_migration_ptes(src, src, false);
>>> +        remove_migration_ptes(src, src, 0);
>>>       /* Drop an anon_vma reference if we took one */
>>>       if (anon_vma)
>>>           put_anon_vma(anon_vma);
>>> @@ -1336,7 +1390,7 @@ static int migrate_folio_move(free_folio_t
>>> put_new_folio, unsigned long private,
>>>           lru_add_drain();
>>>         if (old_page_state & PAGE_WAS_MAPPED)
>>> -        remove_migration_ptes(src, dst, false);
>>> +        remove_migration_ptes(src, dst, 0);
>>>     out_unlock_both:
>>>       folio_unlock(dst);
>>> @@ -1474,7 +1528,7 @@ static int unmap_and_move_huge_page(new_folio_t
>>> get_new_folio,
>>>         if (page_was_mapped)
>>>           remove_migration_ptes(src,
>>> -            rc == MIGRATEPAGE_SUCCESS ? dst : src,
>>> false);
>>> +            rc == MIGRATEPAGE_SUCCESS ? dst : src, 0);
>>>     unlock_put_anon:
>>>       folio_unlock(dst);
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index 8d687de88a03..9cf26592ac93 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -424,7 +424,7 @@ static unsigned long
>>> migrate_device_unmap(unsigned long *src_pfns,
>>>               continue;
>>>             folio = page_folio(page);
>>> -        remove_migration_ptes(folio, folio, false);
>>> +        remove_migration_ptes(folio, folio, 0);
>>>             src_pfns[i] = 0;
>>>           folio_unlock(folio);
>>> @@ -840,7 +840,7 @@ void migrate_device_finalize(unsigned long
>>> *src_pfns,
>>>               dst = src;
>>>           }
>>>   -        remove_migration_ptes(src, dst, false);
>>> +        remove_migration_ptes(src, dst, 0);
>>>           folio_unlock(src);
>>>             if (folio_is_zone_device(src))
>>
>> Hi,
>>
>> This patch has been in the mainline for some time, but we recently
>> discovered an issue when both mTHP and MTE (Memory Tagging Extension)
>> are enabled.
>>
>> It seems that remapping to the same zeropage might causes MTE tag
>> mismatches, since MTE tags are associated with physical addresses.
> 
> Does this only trigger when the VMA has mte enabled? Maybe we'll have to bail out if we detect that mte is enabled.
> 

I believe MTE is all or nothing? i.e. all the memory is tagged when enabled, but will let the arm folks confirm.

Yeah unfortunately I think that might be the only way. We cant change the pointers and I dont think there is a way
to mark the memory as "untagged". If we cant remap to zeropage, then there is no point of shrinker. I am guessing
instead of checking at runtime whether mte is enabled when remapping to shared zeropage, we need to ifndef the
shrinker if CONFIG_ARM64_MTE is enabled?

> Also, I wonder how KSM and the shared zeropage works in general with that, because I would expect similar issues when we de-duplicate memory?
> 

Yeah thats a very good point!

Also the initial report mentioned mTHP instead of THP, but I dont think that matters.


