Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D64DCD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oamaMfzM9b8JvJK765Em42sr9TcA79ICVEv58eHRJqw=; b=zozgWph4egsQxNK0Mj+RjOdQcB
	5pq+v3hWOcmBa1yQaqBFRiEzKpVFT77jxtLzrwFlRMkBnfGFSVjmgPQOsERfGTWDbvZdidZGLDYcb
	0KmOcFpkruqpdPKH3thyI61mirL97lN0wEM+JXrguuNZAbIneWUOPChYFYHndp+eZDfBB9Vy/naY6
	DwC7nEa3sioSXoCRgWLihI9/WELZcxQMaQNUMGnftGgAswjCHt8U/3zWOeRlLeGj6u4EU+euCQvZ1
	hyh57Hp8V5nyUrHrBnmEmml+MxaZ1t7i5VA6S+vFeoScOaNk7ASwnrid2IaklACUNDT620qYEDegi
	nv5cbFsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNdt-000000008Os-0s1W;
	Fri, 05 Jun 2026 06:02:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNdq-000000008OP-1M0t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:02:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF01132AB;
	Thu,  4 Jun 2026 23:02:41 -0700 (PDT)
Received: from [10.164.19.28] (unknown [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 368793F86F;
	Thu,  4 Jun 2026 23:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780639366; bh=uh/GZdKZTzhxTkN2icyg9PhUzHZ6pL9SivtCFDI0ugM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WQvDMaFUXNSK+QfT0babDWN0PqczaocaeP11xLDjWIwm6SxkeZIALqX7/gr6y3q7k
	 MiS7e2ST/Ug55d4/EbZVFBvcHh5Js9O7gnzQwz3jQLJD3XAlukINZVZdaO7k7+onST
	 I2030DWVL9Pyf0pTwWclD2zoRkH01zfhwaAxPZLE=
Message-ID: <53a51128-8ad5-4faa-9151-1245084bdd4c@arm.com>
Date: Fri, 5 Jun 2026 11:32:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] mm/vmalloc: Extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
 rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
 jiangwen6@xiaomi.com
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-5-jiangwenxiaomi@gmail.com>
 <46b0f2a7-3c0d-4372-a45d-946d8259d410@arm.com>
 <CAHKocdEfX3dgUr3O6q1WOe4PddN2=LKfX6Y5DfrfTwF9MM5J3w@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAHKocdEfX3dgUr3O6q1WOe4PddN2=LKfX6Y5DfrfTwF9MM5J3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_230250_541790_C5F86F68 
X-CRM114-Status: GOOD (  28.39  )
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



On 28/05/26 9:09 am, Wen Jiang wrote:
> On Wed, 27 May 2026 at 13:59, Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 22/05/26 11:01 am, Wen Jiang wrote:
>> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
>>
>> vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
>> provides a clean interface by taking struct page **pages and mapping them
>> via direct PTE iteration. This avoids the page table rewalk seen when
>> using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
>>
>> Extend it to support larger page_shift values, and add PMD- and
>> contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_walk()
>> since it now handles more than just small pages.
>>
>> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
>> iterate over pages one by one via vmap_range_noflush(), which would
>> otherwise lead to page table rewalk. The code is now unified with the
>> PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
>>
>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>> ---
>>  mm/vmalloc.c | 71 +++++++++++++++++++++++++++++-----------------------
>>  1 file changed, 40 insertions(+), 31 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 53fd4ee460ea4..deb764abc0571 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -543,8 +543,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
>>
>>  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>> -             pgtbl_mod_mask *mask)
>> +             pgtbl_mod_mask *mask, unsigned int shift)
>>  {
>> +     unsigned long pfn, size;
>> +     unsigned int steps;
>>       int err = 0;
>>       pte_t *pte;
>>
>> @@ -575,9 +577,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>>                       break;
>>               }
>>
>> -             set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
>> -             (*nr)++;
>> -     } while (pte++, addr += PAGE_SIZE, addr != end);
>> +             pfn = page_to_pfn(page);
>> +             size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
>> +             steps = PFN_DOWN(size);
>> +     } while (pte += steps, *nr += steps, addr += size, addr != end);
>>
>>       lazy_mmu_mode_disable();
>>       *mask |= PGTBL_PTE_MODIFIED;
>> @@ -587,7 +590,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>>
>>  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>> -             pgtbl_mod_mask *mask)
>> +             pgtbl_mod_mask *mask, unsigned int shift)
>>  {
>>       pmd_t *pmd;
>>       unsigned long next;
>>> @@ -597,7 +600,27 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>>>               return -ENOMEM;
>>>       do {
>>>               next = pmd_addr_end(addr, end);
>>> -             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
>>> +
>>> +             if (shift == PMD_SHIFT) {
>>> +                     struct page *page = pages[*nr];
>>> +                     phys_addr_t phys_addr;
>>> +
>>> +                     if (WARN_ON(!page))
>>> +                             return -ENOMEM;
>>> +                     if (WARN_ON(!pfn_valid(page_to_pfn(page))))
>>> +                             return -EINVAL;
>>
>>
>> So I know these !page and !pfn_valid checks have been copied from vmap_pages_pte_range,
>> but do they mean anything?
>>
>> I think pfn_valid() makes sense in that someone may take a random VA/PA, convert it into a struct
>> page and pass to vmap layer. But I don't see how anyone would pass page == NULL? At the
>> very least, returning ENOMEM does not make sense because the pages are not being
>> allocated by vmap() but have already been allocated.
> 
> Hi Dev,
> 
> vmap() is EXPORT_SYMBOL with many callers across drivers, each
> constructing the pages array differently. The !page check guards
> against malformed arrays at this API boundary.
> 
> The same -ENOMEM issue also exists in vmap_pages_pte_range().
> Should I fix both in this patchset or leave it as a separate cleanup?
> 
>>
>>> +
>>> +                     phys_addr = page_to_phys(page);
>>> +
>>> +                     if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
>>> +                                             shift)) {
>>> +                             *mask |= PGTBL_PMD_MODIFIED;
>>> +                             *nr += 1 << (shift - PAGE_SHIFT);
>>> +                             continue;
>>> +                     }
>>> +             }
>>> +
>>> +             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
>>>                       return -ENOMEM;
>>>       } while (pmd++, addr = next, addr != end);
>>>       return 0;
>>> @@ -605,7 +628,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>>>
>>>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>>>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>>> -             pgtbl_mod_mask *mask)
>>> +             pgtbl_mod_mask *mask, unsigned int shift)
>>>  {
>>>       pud_t *pud;
>>>       unsigned long next;
>>> @@ -615,7 +638,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>>>               return -ENOMEM;
>>>       do {
>>>               next = pud_addr_end(addr, end);
>>> -             if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
>>> +             if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
>>>                       return -ENOMEM;
>>>       } while (pud++, addr = next, addr != end);
>>>       return 0;
>>> @@ -623,7 +646,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>>>
>>>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>>>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>>> -             pgtbl_mod_mask *mask)
>>> +             pgtbl_mod_mask *mask, unsigned int shift)
>>>  {
>>>       p4d_t *p4d;
>>>       unsigned long next;
>>> @@ -633,14 +656,14 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>>>               return -ENOMEM;
>>>       do {
>>>               next = p4d_addr_end(addr, end);
>>> -             if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
>>> +             if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift))
>>>                       return -ENOMEM;
>>>       } while (p4d++, addr = next, addr != end);
>>>       return 0;
>>>  }
>>>
>>> -static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>>> -             pgprot_t prot, struct page **pages)
>>> +static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
>>> +             pgprot_t prot, struct page **pages, unsigned int shift)
>>>  {
>>>       unsigned long start = addr;
>>>       pgd_t *pgd;
>>> @@ -655,7 +678,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>>>               next = pgd_addr_end(addr, end);
>>>               if (pgd_bad(*pgd))
>>>                       mask |= PGTBL_PGD_MODIFIED;
>>> -             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
>>> +             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
>>>               if (err)
>>>                       break;
>>>       } while (pgd++, addr = next, addr != end);
>>> @@ -678,27 +701,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>>>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>>               pgprot_t prot, struct page **pages, unsigned int page_shift)
>>>  {
>>> -     unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
>>> -
>>>       WARN_ON(page_shift < PAGE_SHIFT);
>>>
>>> -     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
>>> -                     page_shift == PAGE_SHIFT)
>>> -             return vmap_small_pages_range_noflush(addr, end, prot, pages);
>>> +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
>>> +             page_shift = PAGE_SHIFT;
>>>
>>> -     for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
>>> -             int err;
>>> -
>>> -             err = vmap_range_noflush(addr, addr + (1UL << page_shift),
>>> -                                     page_to_phys(pages[i]), prot,
>>> -                                     page_shift);
>>> -             if (err)
>>> -                     return err;
>>> -
>>> -             addr += 1UL << page_shift;
>>> -     }
>>> -
>>> -     return 0;
>>> +     return vmap_pages_range_noflush_walk(addr, end, prot, pages,
>>> +                     min(page_shift, PMD_SHIFT));
>>
>>
>> We can easily extend to PUD huge mappings right? Not sure whether we
>> should keep everything symmetric to how vmap_range_noflush() operates
>> right now, since P4D mappings don't exist, but PUD looks worthwhile.
>>
> 
> PUD mapping requires 1GB of contiguous physical memory, but the buddy
> allocator's MAX_PAGE_ORDER is 10 (4MB on 4K pages). So page_shift
> passed to vmap_pages_range_noflush_walk() never exceeds PMD_SHIFT.

Can we then just drop the min()? You can guard the try_huge_pmd with
shift >= PMD_SHIFT - the walker has the necessary ingredients to work
with a shift > PMD_SHIFT, so let us not confuse by this min() truncation.

> 
> Thanks,
> Wen
>>>  }
>>>
>>>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>


