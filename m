Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18015EA8106
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ubwz3PJ5KFwF6j/mtmwUIbJPRZuOw2B/aSNEd0KC2Y=; b=U45HV5v1OKijvaw+8dtJarjYGj
	V0i6unDAu37H7JUIVjMFX6/AdDzvDFvl9jk0T/ozYEBFgwnucem9Pn7CZayl+F4icwlwydIkSYRYx
	pZb2lEg3DtMZw+1u0SeHTcbGWq8aDnth57/yHzTmJ2c+oFCIttSVybc8IIkzouLvSyzJ6NqjWcfQd
	oeYCJQuR1F9GI+ZptDRqP1BXESasYG7ZGTuXI3aSFF+lJf4TcE17Il/teTL74vj/pZ4Nh/uYEM+Hg
	Ke+YuormVrK0zTo29D38iDwhfh2Tge4BXT+fW32IpDtJl9FaacOvS/S1xgTeF6CqOhG8PbK5fxEMY
	+OLGUb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmR0-0000000GuiH-0hfw;
	Tue, 10 Feb 2026 12:01:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmQx-0000000Guhl-1Vua
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 12:01:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C1BA339;
	Tue, 10 Feb 2026 04:01:24 -0800 (PST)
Received: from [10.164.19.61] (unknown [10.164.19.61])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A7E63F632;
	Tue, 10 Feb 2026 04:01:24 -0800 (PST)
Message-ID: <ceece57f-e845-4557-8ec8-0f4935f8d03d@arm.com>
Date: Tue, 10 Feb 2026 17:31:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: rmap: skip batched unmapping for UFFD vmas
To: Barry Song <21cnbao@gmail.com>, "David Hildenbrand (Arm)"
 <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, catalin.marinas@arm.com, harry.yoo@oracle.com,
 jannh@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, riel@surriel.com,
 rppt@kernel.org, ryan.roberts@arm.com, surenb@google.com, vbabka@suse.cz,
 will@kernel.org, willy@infradead.org
References: <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260116162652.176054-1-baolin.wang@linux.alibaba.com>
 <e5175f66-56fd-437b-a183-b2ccc3f54f94@kernel.org>
 <CAGsJ_4w95tTGfanb0NdG5B+ajOUA4LaH7uh+Uxcq0ZNVaqK-Vg@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4w95tTGfanb0NdG5B+ajOUA4LaH7uh+Uxcq0ZNVaqK-Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_040135_500102_0B356114 
X-CRM114-Status: GOOD (  23.48  )
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


On 09/02/26 4:19 pm, Barry Song wrote:
> On Mon, Feb 9, 2026 at 5:54 PM David Hildenbrand (Arm) <david@kernel.org> wrote:
>> On 1/16/26 17:26, Baolin Wang wrote:
>>> As Dev reported[1], it's not ready to support batched unmapping for uffd case.
>>> Let's still fallback to per-page unmapping for the uffd case.
>>>
>>> [1] https://lore.kernel.org/linux-mm/20260116082721.275178-1-dev.jain@arm.com/
>>> Reported-by: Dev Jain <dev.jain@arm.com>
>>> Suggested-by: Barry Song <baohua@kernel.org>
>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> ---
>>>   mm/rmap.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index f13480cb9f2e..172643092dcf 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1953,6 +1953,9 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>>       if (pte_unused(pte))
>>>               return 1;
>>>
>>> +     if (userfaultfd_wp(vma))
>>> +             return 1;
>>> +
>> Interesting. I was just wondering why we didn't run into that with lazyfree folios.
>>
>> Staring at pte_install_uffd_wp_if_needed(), we never set the marker for
>> anonymous VMAs.
>>
>> So, yeah, if one sets lazyfree on a uffd-wp PTE, the uffd-wp bit will just get
>> zapped alongside. Just like MADV_DONTNEED.
>>
>>
>> I'm fine with that temporary fix. But I guess the non-hacky way to handle this would be:
>>
>>
>>  From 53d016d6e6f624425dbdbc2fb1dec7c91fbef15c Mon Sep 17 00:00:00 2001
>> From: "David Hildenbrand (Arm)" <david@kernel.org>
>> Date: Mon, 9 Feb 2026 10:52:59 +0100
>> Subject: [PATCH] tmp
>>
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>>   include/linux/mm_inline.h | 15 ++++++---------
>>   mm/memory.c               | 21 +--------------------
>>   mm/rmap.c                 |  2 +-
>>   3 files changed, 8 insertions(+), 30 deletions(-)
>>
>> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
>> index fa2d6ba811b5..8a9a2c5f5ee3 100644
>> --- a/include/linux/mm_inline.h
>> +++ b/include/linux/mm_inline.h
>> @@ -566,9 +566,8 @@ static inline pte_marker copy_pte_marker(
>>    *
>>    * Returns true if an uffd-wp pte was installed, false otherwise.
>>    */
>> -static inline bool
>> -pte_install_uffd_wp_if_needed(struct vm_area_struct *vma, unsigned long addr,
>> -                             pte_t *pte, pte_t pteval)
>> +static inline bool install_uffd_wp_ptes_if_needed(struct vm_area_struct *vma,
>> +               unsigned long addr, pte_t *pte, unsigned int nr, pte_t pteval)
>>   {
>>         bool arm_uffd_pte = false;
>>
>> @@ -598,13 +597,11 @@ pte_install_uffd_wp_if_needed(struct vm_area_struct *vma, unsigned long addr,
>>         if (unlikely(pte_swp_uffd_wp_any(pteval)))
>>                 arm_uffd_pte = true;
>>
>> -       if (unlikely(arm_uffd_pte)) {
>> -               set_pte_at(vma->vm_mm, addr, pte,
>> -                          make_pte_marker(PTE_MARKER_UFFD_WP));
>> -               return true;
>> -       }
>> +       if (likely(!arm_uffd_pte))
>> +               return false;
>>
>> -       return false;
>> +       set_ptes(vma->vm_mm, addr, pte, make_pte_marker(PTE_MARKER_UFFD_WP), nr);
>> +       return true;
>>   }
>>
>>   static inline bool vma_has_recency(const struct vm_area_struct *vma)
>> diff --git a/mm/memory.c b/mm/memory.c
>> index da360a6eb8a4..0a87d02a9a69 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -1592,29 +1592,10 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
>>                               unsigned long addr, pte_t *pte, int nr,
>>                               struct zap_details *details, pte_t pteval)
>>   {
>> -       bool was_installed = false;
>> -
>> -       if (!uffd_supports_wp_marker())
>> -               return false;
>> -
>> -       /* Zap on anonymous always means dropping everything */
>> -       if (vma_is_anonymous(vma))
>> -               return false;
>> -
>>         if (zap_drop_markers(details))
>>                 return false;
>>
>> -       for (;;) {
>> -               /* the PFN in the PTE is irrelevant. */
>> -               if (pte_install_uffd_wp_if_needed(vma, addr, pte, pteval))
>> -                       was_installed = true;
>> -               if (--nr == 0)
>> -                       break;
>> -               pte++;
>> -               addr += PAGE_SIZE;
>> -       }
>> -
>> -       return was_installed;
>> +       return install_uffd_wp_ptes_if_needed(vma, addr, pte, nr, pteval);
>>   }
>>
>>   static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 7b9879ef442d..f71aacf35925 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -2061,7 +2061,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>                  * we may want to replace a none pte with a marker pte if
>>                  * it's file-backed, so we don't lose the tracking info.
>>                  */
>> -               pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
>> +               install_uffd_wp_ptes_if_needed(vma, address, pvmw.pte, nr_pages, pteval);
>>
>>                 /* Update high watermark before we lower rss */
>>                 update_hiwater_rss(mm);
>> --
>> 2.43.0
>>
>>
>>
>> Does somebody have time to look into that? We should also adjust the doc of pte_install_uffd_wp_if_needed()
>> and turn it into some proper kerneldoc.
> I'd nominate Dev, if he has the time, as he has been working on
> related changes and is already familiar with this area :-)
>
> https://lore.kernel.org/linux-mm/20260116082721.275178-1-dev.jain@arm.com/

Indeed, I'll be taking a stab on the uffd batching, and the generic folio batching
(meaning anon folios now).

>
> I assume this could be treated as a separate optimization, as
> the current temporary fix seems acceptable?
>
> Thanks
> Barry

