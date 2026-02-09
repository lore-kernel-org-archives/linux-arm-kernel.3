Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4B0E78D64
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBNUV6kod+9jlPmpVveNFKDk0XgxjGadUgD7ujMimhw=; b=BLhkLkWS/8Dbd7DWOfXueIDiJv
	KelnfMRcWIII599KWS8GSSgosIhiHZ1laQOO6pziwPp8lu5Ix8rs63ug2W/lIzSOPaZZ4y2zefm3G
	Q2sN5xYZbnIBCoUx4p31IYD17ub9ouCjzOqak4bAXCWZEOHnwMhFj5rlaw83DR+1pW41tAnHlD90Y
	Z5t+glRQI6+ExV4YeN2kbkUdvipeEx7CM1pWUcu7qTOJ+ECkIIosSUr6f4eIZhBaTjq8IRHsD9YW8
	KYqYmmrGKQDrtisrg3BonjU5WZECc5VabSQj0J+OEDip1h2CmMdHTN5neh4HY+g/3q3gZE4mn9fbx
	leyI6ykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNMU-0000000F6cs-2eNQ;
	Mon, 09 Feb 2026 09:15:20 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNMK-0000000F6ZP-3abz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770628498; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qBNUV6kod+9jlPmpVveNFKDk0XgxjGadUgD7ujMimhw=;
	b=w5IlLNuLMPgOWSu9bkIX4HuE5DeZYBZk9OuJtgz6ww3FOqoWwJ4tZW2lbwuTrPqCIOjs//eQKSUFS0I5LZcyVCwQxa1VrX5b4aU/pKGdqpi+LeuFDdAXDB6yNR3Q48Y68rJdtRiz1SUi/CYlj0JDclUuMnWKZ+SLhVaLyi7I/+U=
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wyq5Xur_1770628490 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 17:14:51 +0800
Message-ID: <44453a4c-50a2-4e7e-9d2a-ebf973ccf6b7@linux.alibaba.com>
Date: Mon, 9 Feb 2026 17:14:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mm: rmap: support batched checks of the references
 for large folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <18b3eb9c730d16756e5d23c7be22efe2f6219911.1766631066.git.baolin.wang@linux.alibaba.com>
 <3d5cb9a4-6604-4302-a110-3d8ff91baa56@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <3d5cb9a4-6604-4302-a110-3d8ff91baa56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_011509_252140_24EBCE82 
X-CRM114-Status: GOOD (  38.56  )
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



On 2/9/26 4:49 PM, David Hildenbrand (Arm) wrote:
> On 12/26/25 07:07, Baolin Wang wrote:
>> Currently, folio_referenced_one() always checks the young flag for 
>> each PTE
>> sequentially, which is inefficient for large folios. This inefficiency is
>> especially noticeable when reclaiming clean file-backed large folios, 
>> where
>> folio_referenced() is observed as a significant performance hotspot.
>>
>> Moreover, on Arm64 architecture, which supports contiguous PTEs, there 
>> is already
>> an optimization to clear the young flags for PTEs within a contiguous 
>> range.
>> However, this is not sufficient. We can extend this to perform batched 
>> operations
>> for the entire large folio (which might exceed the contiguous range: 
>> CONT_PTE_SIZE).
>>
>> Introduce a new API: clear_flush_young_ptes() to facilitate batched 
>> checking
>> of the young flags and flushing TLB entries, thereby improving 
>> performance
>> during large folio reclamation. And it will be overridden by the 
>> architecture
>> that implements a more efficient batch operation in the following 
>> patches.
>>
>> While we are at it, rename ptep_clear_flush_young_notify() to
>> clear_flush_young_ptes_notify() to indicate that this is a batch 
>> operation.
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   include/linux/mmu_notifier.h |  9 +++++----
>>   include/linux/pgtable.h      | 31 +++++++++++++++++++++++++++++++
>>   mm/rmap.c                    | 31 ++++++++++++++++++++++++++++---
>>   3 files changed, 64 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
>> index d1094c2d5fb6..07a2bbaf86e9 100644
>> --- a/include/linux/mmu_notifier.h
>> +++ b/include/linux/mmu_notifier.h
>> @@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner(
>>       range->owner = owner;
>>   }
>> -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)        \
>> +#define clear_flush_young_ptes_notify(__vma, __address, __ptep, 
>> __nr)    \
>>   ({                                    \
>>       int __young;                            \
>>       struct vm_area_struct *___vma = __vma;                \
>>       unsigned long ___address = __address;                \
>> -    __young = ptep_clear_flush_young(___vma, ___address, __ptep);    \
>> +    unsigned int ___nr = __nr;                    \
>> +    __young = clear_flush_young_ptes(___vma, ___address, __ptep, 
>> ___nr);    \
>>       __young |= mmu_notifier_clear_flush_young(___vma->vm_mm,    \
>>                             ___address,        \
>>                             ___address +        \
>> -                            PAGE_SIZE);    \
>> +                          ___nr * PAGE_SIZE);    \
>>       __young;                            \
>>   })
> 
> Man that's ugly, Not your fault, but can this possibly be turned into an 
> inline function in a follow-up patch.

Yes, the cleanup of these macros is already in my follow-up patch set.

>> +#ifndef clear_flush_young_ptes
>> +/**
>> + * clear_flush_young_ptes - Clear the access bit and perform a TLB 
>> flush for PTEs
>> + *                that map consecutive pages of the same folio.
> 
> With clear_young_dirty_ptes() description in mind, this should probably 
> be "Mark PTEs that map consecutive pages of the same folio as clean and 
> flush the TLB" ?

IMO, “clean” is confusing here, as it sounds like clear the dirty bit to 
make the folio clean.

>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
>> + * @nr: Number of entries to clear access bit.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a 
>> simple
>> + * loop over ptep_clear_flush_young().
>> + *
>> + * Note that PTE bits in the PTE range besides the PFN can differ. 
>> For example,
>> + * some PTEs might be write-protected.
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map 
>> consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same 
>> PMD.
>> + */
>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>> +                     unsigned long addr, pte_t *ptep,
>> +                     unsigned int nr)
> 
> Two-tab alignment on second+ line like all similar functions here.

Sure.

>> +{
>> +    int i, young = 0;
>> +
>> +    for (i = 0; i < nr; ++i, ++ptep, addr += PAGE_SIZE)
>> +        young |= ptep_clear_flush_young(vma, addr, ptep);
>> +
> 
> Why don't we use a similar loop we use in clear_young_dirty_ptes() or 
> clear_full_ptes() etc? It's not only consistent but also optimizes out 
> the first check for nr.
> for (;;) {
>      young |= ptep_clear_flush_young(vma, addr, ptep);
>      if (--nr == 0)
>          break;
>      ptep++;
>      addr += PAGE_SIZE;
> }

We’ve discussed this loop pattern before [1], and it seems that people 
prefer the ‘for (;;)’ loop. Do you have a strong preference for changing 
it back?

[1]https://lore.kernel.org/all/ec49f0fe-9df8-4762-b315-240cbb1ed3ce@arm.com/

>> +    return young;
>> +}
>> +#endif
>> +
>>   /*
>>    * On some architectures hardware does not set page access bit when 
>> accessing
>>    * memory page, it is responsibility of software setting this bit. 
>> It brings
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index e805ddc5a27b..985ab0b085ba 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -828,9 +828,11 @@ static bool folio_referenced_one(struct folio 
>> *folio,
>>       struct folio_referenced_arg *pra = arg;
>>       DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>>       int ptes = 0, referenced = 0;
>> +    unsigned int nr;
>>       while (page_vma_mapped_walk(&pvmw)) {
>>           address = pvmw.address;
>> +        nr = 1;
>>           if (vma->vm_flags & VM_LOCKED) {
>>               ptes++;
>> @@ -875,9 +877,24 @@ static bool folio_referenced_one(struct folio 
>> *folio,
>>               if (lru_gen_look_around(&pvmw))
>>                   referenced++;
>>           } else if (pvmw.pte) {
>> -            if (ptep_clear_flush_young_notify(vma, address,
>> -                        pvmw.pte))
>> +            if (folio_test_large(folio)) {
>> +                unsigned long end_addr =
>> +                    pmd_addr_end(address, vma->vm_end);
>> +                unsigned int max_nr =
>> +                    (end_addr - address) >> PAGE_SHIFT;
> 
> Good news: you can both fit into a single line as we are allowed to 
> exceed 80c if it aids readability.

Sure.

>> +                pte_t pteval = ptep_get(pvmw.pte);
>> +
>> +                nr = folio_pte_batch(folio, pvmw.pte,
>> +                             pteval, max_nr);
>> +            }
>> +
>> +            ptes += nr;
> 
> I'm not sure about whether we should mess with the "ptes" variable that 
> is so far only used for VM_LOCKED vmas. See below, maybe we can just 
> avoid that.

See below.

> 
>> +            if (clear_flush_young_ptes_notify(vma, address,
>> +                        pvmw.pte, nr))
> 
> Could maybe fit that into a single line as well, whatever you prefer.

Sure.

>>                   referenced++;
>> +            /* Skip the batched PTEs */
>> +            pvmw.pte += nr - 1;
>> +            pvmw.address += (nr - 1) * PAGE_SIZE;
>>           } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>>               if (pmdp_clear_flush_young_notify(vma, address,
>>                           pvmw.pmd))
>> @@ -887,7 +904,15 @@ static bool folio_referenced_one(struct folio 
>> *folio,
>>               WARN_ON_ONCE(1);
>>           }
>> -        pra->mapcount--;
>> +        pra->mapcount -= nr;
>> +        /*
>> +         * If we are sure that we batched the entire folio,
>> +         * we can just optimize and stop right here.
>> +         */
>> +        if (ptes == pvmw.nr_pages) {
>> +            page_vma_mapped_walk_done(&pvmw);
>> +            break;
>> +        }
> Why not check for !pra->mapcount? Then you can also drop the comment, 
> because it's exactly the same thing we check after the loop to indicate 
> what to return to the caller.
> 
> And you will not have to mess with the "ptes" variable?

We can't rely on pra->mapcount here, because a folio can be mapped in 
multiple VMAs. Even if the pra->mapcount is not zero, we can still call 
page_vma_mapped_walk_done() for the current VMA mapping when the entire 
folio is batched.

> Only minor stuff.

Thanks for taking a look.

