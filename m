Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC63FCC9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 01:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhrc2zSy815zRqLDWu0GrGfLpE+YR1s6BVi+lBVNCR0=; b=meTHblAxHiqwKSWzA6MA1FBMYS
	Lrhl2KC0jEjrVsglForAB2p5UkwxJTy5PyXW9djvJJIelMcewCFt/woD8M0+pWIhCeloZstX07rL3
	Gf25uy3D6MlKhIX+lQk/dmqtwhK691DPlZPqQGu8y2umxV4jdj86C4acUIU9sbMAmPJgOW7OGj3w+
	uHw9jT3wy3YP+af4U6H6Vjtx51dTSh/BR/gBXkalv6yl95xKE/jwcUUpufJ9W3TyfsCUbmvTAuesz
	pYQiY1AWNrcDIOtVZ8YnJ0oGyR8/n4CLNntHA3rwETgJ1ELgsh6rCxvGLmQNjNT8+MHvQ3SzPMO0p
	rk2hwAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzm30-00000008UrF-3urh;
	Tue, 10 Mar 2026 01:38:10 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzm2x-00000008UqY-2MYM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 01:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773106682; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=mhrc2zSy815zRqLDWu0GrGfLpE+YR1s6BVi+lBVNCR0=;
	b=SXI4jGdte0Zkh8/Y5YIS4bnIJFcgj7yxirXmN3pr73mZ9Ql3HzfFWjjcYPYF1KCBbaXWaTFjs1e3ojP/WQq8WC0Z1QqXclXgd6OH87xxu7IAPZ8WLlAsw0t3gCoBTga41VSZuHsLiTFNwKs/+sXuP38RidcbI7M94qQFKakA3go=
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-e6KrH_1773106676 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Mar 2026 09:37:56 +0800
Message-ID: <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
Date: Tue, 10 Mar 2026 09:37:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
 <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
 <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_183808_458047_D2A37627 
X-CRM114-Status: GOOD (  19.83  )
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



On 3/7/26 4:02 PM, Barry Song wrote:
> On Sat, Mar 7, 2026 at 10:22 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 3/7/26 5:07 AM, Barry Song wrote:
>>> On Mon, Feb 9, 2026 at 10:07 PM Baolin Wang
>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>
>>>> Currently, folio_referenced_one() always checks the young flag for each PTE
>>>> sequentially, which is inefficient for large folios. This inefficiency is
>>>> especially noticeable when reclaiming clean file-backed large folios, where
>>>> folio_referenced() is observed as a significant performance hotspot.
>>>>
>>>> Moreover, on Arm64 architecture, which supports contiguous PTEs, there is already
>>>> an optimization to clear the young flags for PTEs within a contiguous range.
>>>> However, this is not sufficient. We can extend this to perform batched operations
>>>> for the entire large folio (which might exceed the contiguous range: CONT_PTE_SIZE).
>>>>
>>>> Introduce a new API: clear_flush_young_ptes() to facilitate batched checking
>>>> of the young flags and flushing TLB entries, thereby improving performance
>>>> during large folio reclamation. And it will be overridden by the architecture
>>>> that implements a more efficient batch operation in the following patches.
>>>>
>>>> While we are at it, rename ptep_clear_flush_young_notify() to
>>>> clear_flush_young_ptes_notify() to indicate that this is a batch operation.
>>>>
>>>> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
>>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>
>>> LGTM,
>>>
>>> Reviewed-by: Barry Song <baohua@kernel.org>
>>
>> Thanks.
>>
>>>> ---
>>>>    include/linux/mmu_notifier.h |  9 +++++----
>>>>    include/linux/pgtable.h      | 35 +++++++++++++++++++++++++++++++++++
>>>>    mm/rmap.c                    | 28 +++++++++++++++++++++++++---
>>>>    3 files changed, 65 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
>>>> index d1094c2d5fb6..07a2bbaf86e9 100644
>>>> --- a/include/linux/mmu_notifier.h
>>>> +++ b/include/linux/mmu_notifier.h
>>>> @@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner(
>>>>           range->owner = owner;
>>>>    }
>>>>
>>>> -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)                \
>>>> +#define clear_flush_young_ptes_notify(__vma, __address, __ptep, __nr)  \
>>>>    ({                                                                     \
>>>>           int __young;                                                    \
>>>>           struct vm_area_struct *___vma = __vma;                          \
>>>>           unsigned long ___address = __address;                           \
>>>> -       __young = ptep_clear_flush_young(___vma, ___address, __ptep);   \
>>>> +       unsigned int ___nr = __nr;                                      \
>>>> +       __young = clear_flush_young_ptes(___vma, ___address, __ptep, ___nr);    \
>>>>           __young |= mmu_notifier_clear_flush_young(___vma->vm_mm,        \
>>>>                                                     ___address,           \
>>>>                                                     ___address +          \
>>>> -                                                       PAGE_SIZE);     \
>>>> +                                                 ___nr * PAGE_SIZE);   \
>>>>           __young;                                                        \
>>>>    })
>>>>
>>>> @@ -650,7 +651,7 @@ static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
>>>>
>>>>    #define mmu_notifier_range_update_to_read_only(r) false
>>>>
>>>> -#define ptep_clear_flush_young_notify ptep_clear_flush_young
>>>> +#define clear_flush_young_ptes_notify clear_flush_young_ptes
>>>>    #define pmdp_clear_flush_young_notify pmdp_clear_flush_young
>>>>    #define ptep_clear_young_notify ptep_test_and_clear_young
>>>>    #define pmdp_clear_young_notify pmdp_test_and_clear_young
>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>> index 21b67d937555..a50df42a893f 100644
>>>> --- a/include/linux/pgtable.h
>>>> +++ b/include/linux/pgtable.h
>>>> @@ -1068,6 +1068,41 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>>>    }
>>>>    #endif
>>>>
>>>> +#ifndef clear_flush_young_ptes
>>>> +/**
>>>> + * clear_flush_young_ptes - Mark PTEs that map consecutive pages of the same
>>>> + *                         folio as old and flush the TLB.
>>>> + * @vma: The virtual memory area the pages are mapped into.
>>>> + * @addr: Address the first page is mapped at.
>>>> + * @ptep: Page table pointer for the first entry.
>>>> + * @nr: Number of entries to clear access bit.
>>>> + *
>>>> + * May be overridden by the architecture; otherwise, implemented as a simple
>>>> + * loop over ptep_clear_flush_young().
>>>> + *
>>>> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
>>>> + * some PTEs might be write-protected.
>>>> + *
>>>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>>>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>>>> + */
>>>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>>>> +               unsigned long addr, pte_t *ptep, unsigned int nr)
>>>> +{
>>>> +       int young = 0;
>>>> +
>>>> +       for (;;) {
>>>> +               young |= ptep_clear_flush_young(vma, addr, ptep);
>>>> +               if (--nr == 0)
>>>> +                       break;
>>>> +               ptep++;
>>>> +               addr += PAGE_SIZE;
>>>> +       }
>>>> +
>>>> +       return young;
>>>> +}
>>>> +#endif
>>>
>>> We might have an opportunity to batch the TLB synchronization,
>>> using flush_tlb_range() instead of calling flush_tlb_page()
>>> one by one. Not sure the benefit would be significant though,
>>> especially if only one entry among nr has the young bit set.
>>
>> Yes. In addition, this will involve many architectures’ implementations
>> and their differing TLB flush mechanisms, so it’s difficult to make a
>> reasonable per-architecture measurement. If any architecture has a more
>> efficient flush method, I’d prefer to implement an architecture‑specific
>> clear_flush_young_ptes().
> 
> Right! Since TLBI is usually quite expensive, I wonder if a generic
> implementation for architectures lacking clear_flush_young_ptes()
> might benefit from something like the below (just a very rough idea):
> 
> int clear_flush_young_ptes(struct vm_area_struct *vma,
>                  unsigned long addr, pte_t *ptep, unsigned int nr)
> {
>          unsigned long curr_addr = addr;
>          int young = 0;
> 
>          while (nr--) {
>                  young |= ptep_test_and_clear_young(vma, curr_addr, ptep);
>                  ptep++;
>                  curr_addr += PAGE_SIZE;
>          }
> 
>          if (young)
>                  flush_tlb_range(vma, addr, curr_addr);
>          return young;
> }

I understand your point. I’m concerned that I can’t test this patch on 
every architecture to validate the benefits. Anyway, let me try this on 
my X86 machine first.

