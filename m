Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F58ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOkOONf35Vc+f2/jCpehV6jmJl8ts0t/RuyBoC60WSs=; b=g+fvQUTl7xZpLtfGbXkMeOh6M9
	ujK29GFf0g55yknat8Nn4MfV4t2NeZx+5yiIFqBns8jG1lgW6V5cB6pKBv7W5smbHwpz2Rw8jLcJ7
	cWd7cRLEFPJeMZpg+TC4KITXDBagQz3lpLW5ygM/DWerf4Z/ceCUhLGoelL75M0O0WuVFwBT3zNkN
	7WLT2Jk+Bj2K1LEdQkDqcEeTVbxjNSvxQO0tBwVVuJtLQOR3rDCms541HIOgnstq2KABcHU0gW6d9
	PimWSrheSMuhUiYMKNpnhVKtFEvZWanxTuzGK4WhzublCReKYBImMLeE7GVHHzwJyJcNwHU8TH6vD
	GgRoahPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzTUf-00000001r4D-1zzx;
	Fri, 19 Sep 2025 05:17:13 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzTUc-00000001r2Y-1nDD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 05:17:11 +0000
Message-ID: <120445c8-7250-42e0-ad6a-978020c8fad3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758259017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOkOONf35Vc+f2/jCpehV6jmJl8ts0t/RuyBoC60WSs=;
	b=bwewtoRO6hSgTV8DA6Xc9TuUOlFE+lEIL/WBwtB8DqfThzPrMM7GIIqWfPiIqVJBK8SAlh
	VHsRaUKfwZ3vLwyXMQSJZcQyNBMaIt2ys/niQWETMCGZLf369sc8vNiXG45JEJ2XerZYtB
	BGAVowKkxCMxpkYEK6vTTxqDGiR+sTs=
Date: Fri, 19 Sep 2025 13:16:42 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/6] mm: remap unused subpages to shared zeropage when
 splitting isolated thp
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "usamaarif642@gmail.com" <usamaarif642@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "yuzhao@google.com" <yuzhao@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
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
 <CABzRoyYWQMFTGYgfC7N=cWMnL_+5Y05=jrMhFjBf1aKOGxzq5g@mail.gmail.com>
 <ebedc478-7519-4e30-854e-f6616a7647b0@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <ebedc478-7519-4e30-854e-f6616a7647b0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_221710_895373_71972D06 
X-CRM114-Status: GOOD (  22.05  )
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



On 2025/9/18 20:35, David Hildenbrand wrote:
> On 18.09.25 14:22, Lance Yang wrote:
>> On Thu, Sep 18, 2025 at 5:21 PM David Hildenbrand <david@redhat.com> 
>> wrote:
>>>
>>> On 18.09.25 10:53, Qun-wei Lin (林群崴) wrote:
>>>> On Fri, 2024-08-30 at 11:03 +0100, Usama Arif wrote:
>>>>> From: Yu Zhao <yuzhao@google.com>
>>>>>
>>>>> Here being unused means containing only zeros and inaccessible to
>>>>> userspace. When splitting an isolated thp under reclaim or migration,
>>>>> the unused subpages can be mapped to the shared zeropage, hence
>>>>> saving
>>>>> memory. This is particularly helpful when the internal
>>>>> fragmentation of a thp is high, i.e. it has many untouched subpages.
>>>>>
>>>>> This is also a prerequisite for THP low utilization shrinker which
>>>>> will
>>>>> be introduced in later patches, where underutilized THPs are split,
>>>>> and
>>>>> the zero-filled pages are freed saving memory.
>>>>>
>>>>> Signed-off-by: Yu Zhao <yuzhao@google.com>
>>>>> Tested-by: Shuang Zhai <zhais@google.com>
>>>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>>>> ---
>>>>>    include/linux/rmap.h |  7 ++++-
>>>>>    mm/huge_memory.c     |  8 ++---
>>>>>    mm/migrate.c         | 72 +++++++++++++++++++++++++++++++++++++ 
>>>>> +----
>>>>> -- 
>>>>>    mm/migrate_device.c  |  4 +--
>>>>>    4 files changed, 75 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>> index 91b5935e8485..d5e93e44322e 100644
>>>>> --- a/include/linux/rmap.h
>>>>> +++ b/include/linux/rmap.h
>>>>> @@ -745,7 +745,12 @@ int folio_mkclean(struct folio *);
>>>>>    int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages,
>>>>> pgoff_t pgoff,
>>>>>                     struct vm_area_struct *vma);
>>>>>
>>>>> -void remove_migration_ptes(struct folio *src, struct folio *dst,
>>>>> bool locked);
>>>>> +enum rmp_flags {
>>>>> +    RMP_LOCKED              = 1 << 0,
>>>>> +    RMP_USE_SHARED_ZEROPAGE = 1 << 1,
>>>>> +};
>>>>> +
>>>>> +void remove_migration_ptes(struct folio *src, struct folio *dst, int
>>>>> flags);
>>>>>
>>>>>    /*
>>>>>     * rmap_walk_control: To control rmap traversing for specific needs
>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>> index 0c48806ccb9a..af60684e7c70 100644
>>>>> --- a/mm/huge_memory.c
>>>>> +++ b/mm/huge_memory.c
>>>>> @@ -3020,7 +3020,7 @@ bool unmap_huge_pmd_locked(struct
>>>>> vm_area_struct *vma, unsigned long addr,
>>>>>       return false;
>>>>>    }
>>>>>
>>>>> -static void remap_page(struct folio *folio, unsigned long nr)
>>>>> +static void remap_page(struct folio *folio, unsigned long nr, int
>>>>> flags)
>>>>>    {
>>>>>       int i = 0;
>>>>>
>>>>> @@ -3028,7 +3028,7 @@ static void remap_page(struct folio *folio,
>>>>> unsigned long nr)
>>>>>       if (!folio_test_anon(folio))
>>>>>               return;
>>>>>       for (;;) {
>>>>> -            remove_migration_ptes(folio, folio, true);
>>>>> +            remove_migration_ptes(folio, folio, RMP_LOCKED |
>>>>> flags);
>>>>>               i += folio_nr_pages(folio);
>>>>>               if (i >= nr)
>>>>>                       break;
>>>>> @@ -3240,7 +3240,7 @@ static void __split_huge_page(struct page
>>>>> *page, struct list_head *list,
>>>>>
>>>>>       if (nr_dropped)
>>>>>               shmem_uncharge(folio->mapping->host, nr_dropped);
>>>>> -    remap_page(folio, nr);
>>>>> +    remap_page(folio, nr, PageAnon(head) ?
>>>>> RMP_USE_SHARED_ZEROPAGE : 0);
>>>>>
>>>>>       /*
>>>>>        * set page to its compound_head when split to non order-0
>>>>> pages, so
>>>>> @@ -3542,7 +3542,7 @@ int split_huge_page_to_list_to_order(struct
>>>>> page *page, struct list_head *list,
>>>>>               if (mapping)
>>>>>                       xas_unlock(&xas);
>>>>>               local_irq_enable();
>>>>> -            remap_page(folio, folio_nr_pages(folio));
>>>>> +            remap_page(folio, folio_nr_pages(folio), 0);
>>>>>               ret = -EAGAIN;
>>>>>       }
>>>>>
>>>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>>>> index 6f9c62c746be..d039863e014b 100644
>>>>> --- a/mm/migrate.c
>>>>> +++ b/mm/migrate.c
>>>>> @@ -204,13 +204,57 @@ bool isolate_folio_to_list(struct folio *folio,
>>>>> struct list_head *list)
>>>>>       return true;
>>>>>    }
>>>>>
>>>>> +static bool try_to_map_unused_to_zeropage(struct
>>>>> page_vma_mapped_walk *pvmw,
>>>>> +                                      struct folio *folio,
>>>>> +                                      unsigned long idx)
>>>>> +{
>>>>> +    struct page *page = folio_page(folio, idx);
>>>>> +    bool contains_data;
>>>>> +    pte_t newpte;
>>>>> +    void *addr;
>>>>> +
>>>>> +    VM_BUG_ON_PAGE(PageCompound(page), page);
>>>>> +    VM_BUG_ON_PAGE(!PageAnon(page), page);
>>>>> +    VM_BUG_ON_PAGE(!PageLocked(page), page);
>>>>> +    VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
>>>>> +
>>>>> +    if (folio_test_mlocked(folio) || (pvmw->vma->vm_flags &
>>>>> VM_LOCKED) ||
>>>>> +        mm_forbids_zeropage(pvmw->vma->vm_mm))
>>>>> +            return false;
>>>>> +
>>>>> +    /*
>>>>> +     * The pmd entry mapping the old thp was flushed and the pte
>>>>> mapping
>>>>> +     * this subpage has been non present. If the subpage is only
>>>>> zero-filled
>>>>> +     * then map it to the shared zeropage.
>>>>> +     */
>>>>> +    addr = kmap_local_page(page);
>>>>> +    contains_data = memchr_inv(addr, 0, PAGE_SIZE);
>>>>> +    kunmap_local(addr);
>>>>> +
>>>>> +    if (contains_data)
>>>>> +            return false;
>>>>> +
>>>>> +    newpte = pte_mkspecial(pfn_pte(my_zero_pfn(pvmw->address),
>>>>> +                                    pvmw->vma->vm_page_prot));
>>>>> +    set_pte_at(pvmw->vma->vm_mm, pvmw->address, pvmw->pte,
>>>>> newpte);
>>>>> +
>>>>> +    dec_mm_counter(pvmw->vma->vm_mm, mm_counter(folio));
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>> +struct rmap_walk_arg {
>>>>> +    struct folio *folio;
>>>>> +    bool map_unused_to_zeropage;
>>>>> +};
>>>>> +
>>>>>    /*
>>>>>     * Restore a potential migration pte to a working pte entry
>>>>>     */
>>>>>    static bool remove_migration_pte(struct folio *folio,
>>>>> -            struct vm_area_struct *vma, unsigned long addr, void
>>>>> *old)
>>>>> +            struct vm_area_struct *vma, unsigned long addr, void
>>>>> *arg)
>>>>>    {
>>>>> -    DEFINE_FOLIO_VMA_WALK(pvmw, old, vma, addr, PVMW_SYNC |
>>>>> PVMW_MIGRATION);
>>>>> +    struct rmap_walk_arg *rmap_walk_arg = arg;
>>>>> +    DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr,
>>>>> PVMW_SYNC | PVMW_MIGRATION);
>>>>>
>>>>>       while (page_vma_mapped_walk(&pvmw)) {
>>>>>               rmap_t rmap_flags = RMAP_NONE;
>>>>> @@ -234,6 +278,9 @@ static bool remove_migration_pte(struct folio
>>>>> *folio,
>>>>>                       continue;
>>>>>               }
>>>>>    #endif
>>>>> +            if (rmap_walk_arg->map_unused_to_zeropage &&
>>>>> +                try_to_map_unused_to_zeropage(&pvmw, folio,
>>>>> idx))
>>>>> +                    continue;
>>>>>
>>>>>               folio_get(folio);
>>>>>               pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
>>>>> @@ -312,14 +359,21 @@ static bool remove_migration_pte(struct folio
>>>>> *folio,
>>>>>     * Get rid of all migration entries and replace them by
>>>>>     * references to the indicated page.
>>>>>     */
>>>>> -void remove_migration_ptes(struct folio *src, struct folio *dst,
>>>>> bool locked)
>>>>> +void remove_migration_ptes(struct folio *src, struct folio *dst, int
>>>>> flags)
>>>>>    {
>>>>> +    struct rmap_walk_arg rmap_walk_arg = {
>>>>> +            .folio = src,
>>>>> +            .map_unused_to_zeropage = flags &
>>>>> RMP_USE_SHARED_ZEROPAGE,
>>>>> +    };
>>>>> +
>>>>>       struct rmap_walk_control rwc = {
>>>>>               .rmap_one = remove_migration_pte,
>>>>> -            .arg = src,
>>>>> +            .arg = &rmap_walk_arg,
>>>>>       };
>>>>>
>>>>> -    if (locked)
>>>>> +    VM_BUG_ON_FOLIO((flags & RMP_USE_SHARED_ZEROPAGE) && (src !=
>>>>> dst), src);
>>>>> +
>>>>> +    if (flags & RMP_LOCKED)
>>>>>               rmap_walk_locked(dst, &rwc);
>>>>>       else
>>>>>               rmap_walk(dst, &rwc);
>>>>> @@ -934,7 +988,7 @@ static int writeout(struct address_space
>>>>> *mapping, struct folio *folio)
>>>>>        * At this point we know that the migration attempt cannot
>>>>>        * be successful.
>>>>>        */
>>>>> -    remove_migration_ptes(folio, folio, false);
>>>>> +    remove_migration_ptes(folio, folio, 0);
>>>>>
>>>>>       rc = mapping->a_ops->writepage(&folio->page, &wbc);
>>>>>
>>>>> @@ -1098,7 +1152,7 @@ static void migrate_folio_undo_src(struct folio
>>>>> *src,
>>>>>                                  struct list_head *ret)
>>>>>    {
>>>>>       if (page_was_mapped)
>>>>> -            remove_migration_ptes(src, src, false);
>>>>> +            remove_migration_ptes(src, src, 0);
>>>>>       /* Drop an anon_vma reference if we took one */
>>>>>       if (anon_vma)
>>>>>               put_anon_vma(anon_vma);
>>>>> @@ -1336,7 +1390,7 @@ static int migrate_folio_move(free_folio_t
>>>>> put_new_folio, unsigned long private,
>>>>>               lru_add_drain();
>>>>>
>>>>>       if (old_page_state & PAGE_WAS_MAPPED)
>>>>> -            remove_migration_ptes(src, dst, false);
>>>>> +            remove_migration_ptes(src, dst, 0);
>>>>>
>>>>>    out_unlock_both:
>>>>>       folio_unlock(dst);
>>>>> @@ -1474,7 +1528,7 @@ static int unmap_and_move_huge_page(new_folio_t
>>>>> get_new_folio,
>>>>>
>>>>>       if (page_was_mapped)
>>>>>               remove_migration_ptes(src,
>>>>> -                    rc == MIGRATEPAGE_SUCCESS ? dst : src,
>>>>> false);
>>>>> +                    rc == MIGRATEPAGE_SUCCESS ? dst : src, 0);
>>>>>
>>>>>    unlock_put_anon:
>>>>>       folio_unlock(dst);
>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>>> index 8d687de88a03..9cf26592ac93 100644
>>>>> --- a/mm/migrate_device.c
>>>>> +++ b/mm/migrate_device.c
>>>>> @@ -424,7 +424,7 @@ static unsigned long
>>>>> migrate_device_unmap(unsigned long *src_pfns,
>>>>>                       continue;
>>>>>
>>>>>               folio = page_folio(page);
>>>>> -            remove_migration_ptes(folio, folio, false);
>>>>> +            remove_migration_ptes(folio, folio, 0);
>>>>>
>>>>>               src_pfns[i] = 0;
>>>>>               folio_unlock(folio);
>>>>> @@ -840,7 +840,7 @@ void migrate_device_finalize(unsigned long
>>>>> *src_pfns,
>>>>>                       dst = src;
>>>>>               }
>>>>>
>>>>> -            remove_migration_ptes(src, dst, false);
>>>>> +            remove_migration_ptes(src, dst, 0);
>>>>>               folio_unlock(src);
>>>>>
>>>>>               if (folio_is_zone_device(src))
>>>>
>>>> Hi,
>>>>
>>>> This patch has been in the mainline for some time, but we recently
>>>> discovered an issue when both mTHP and MTE (Memory Tagging Extension)
>>>> are enabled.
>>>>
>>>> It seems that remapping to the same zeropage might causes MTE tag
>>>> mismatches, since MTE tags are associated with physical addresses.
>>>
>>> Does this only trigger when the VMA has mte enabled? Maybe we'll have to
>>> bail out if we detect that mte is enabled.
>>
>> It seems RISC-V also has a similar feature (RISCV_ISA_SUPM) that uses
>> the same prctl(PR_{GET,SET}_TAGGED_ADDR_CTRL) API.
>>
>> config RISCV_ISA_SUPM
>>          bool "Supm extension for userspace pointer masking"
>>          depends on 64BIT
>>          default y
>>          help
>>            Add support for pointer masking in userspace (Supm) when the
>>            underlying hardware extension (Smnpm or Ssnpm) is detected 
>> at boot.
>>
>>            If this option is disabled, userspace will be unable to use
>>            the prctl(PR_{SET,GET}_TAGGED_ADDR_CTRL) API.
>>
>> I wonder if we should disable the THP shrinker for such architectures 
>> that
> 
> I think where possible we really only want to identify problematic 
> (tagged) pages and skip them. And we should either look into fixing KSM 
> as well or finding out why KSM is not affected.

Yeah. Seems like we could introduce a new helper, 
folio_test_mte_tagged(struct
folio *folio). By default, it would return false, and architectures like 
arm64
can override it.

Looking at the code, the PG_mte_tagged flag is not set for regular THP. 
The MTE
status actually comes from the VM_MTE flag in the VMA that maps it.

static inline bool folio_test_hugetlb_mte_tagged(struct folio *folio)
{
	bool ret = test_bit(PG_mte_tagged, &folio->flags.f);

	VM_WARN_ON_ONCE(!folio_test_hugetlb(folio));

	/*
	 * If the folio is tagged, ensure ordering with a likely subsequent
	 * read of the tags.
	 */
	if (ret)
		smp_rmb();
	return ret;
}

static inline bool page_mte_tagged(struct page *page)
{
	bool ret = test_bit(PG_mte_tagged, &page->flags.f);

	VM_WARN_ON_ONCE(folio_test_hugetlb(page_folio(page)));

	/*
	 * If the page is tagged, ensure ordering with a likely subsequent
	 * read of the tags.
	 */
	if (ret)
		smp_rmb();
	return ret;
}

contpte_set_ptes()
	__set_ptes()
		__set_ptes_anysz()
			__sync_cache_and_tags()
				mte_sync_tags()
					set_page_mte_tagged()

Then, having the THP shrinker skip any folios that are identified as
MTE-tagged.
Cheers,
Lance



