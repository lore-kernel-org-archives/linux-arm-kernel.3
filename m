Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888A9CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCawjAl+NONgE8jzAgegLJ0ZSZ0Z5OkZOZKFtqUGpZc=; b=q/nA7ZxLfvinqGk33sJZgTPNUz
	SeAYV5u1cIHZ+BJ+kdG3T0Wfnrg4uI2ogbrfAlkaSkOCQgZaIRb6epVTW4jvFFLeRlVpzO4ilCPot
	4tc+E2/0QI1hQbT6NfvEIHztYtQJiQ96Iy0X1JPTWvQMaFF+1XQo38KQxxrhqRr7/OH9ImsjF8kxb
	MpOLXVkEw2BGak9UAfLhKpbaIp8Mbw8FcsT2kvI0a6lilszSw+dvBmZT6Y4E0e8tDXdOVuoCsMwTu
	kVeektN9CC2BlnCnqCvlkhmrJtKJXf+LJT42+WyXxm3Pdy9P+Tq3nJ2IL1GvtQ4CpjnZrb3HnAhN0
	OsNgNipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSpld-00000006lLj-1hmz;
	Fri, 29 May 2026 05:28:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSpla-00000006lLL-023V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 05:28:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9282C202C;
	Thu, 28 May 2026 22:28:09 -0700 (PDT)
Received: from [10.164.19.8] (unknown [10.164.19.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A14243F7B4;
	Thu, 28 May 2026 22:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780032494; bh=GoSBuQs1KCUsbRbVPKVRa5mhiCL1VyTOqr0I0dgdgWc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vmO7qK43eGTwswE9djxFlSMuCgSf4V+12iZVIAIyIDt3TKQyzQoUidtrtNB5sHj1Y
	 N7jUgrqCK7UsLKGLqhgXck32WCaOk5YQG69VSjTaCFlhk6JzI7dwgj77y1wsE2f64m
	 ukk+iLqeQ6Z9i4aEKZR5NafmNQy9OZGNYBIk6QuQ=
Message-ID: <d9b97a50-a7d7-46e4-8e93-608d82926401@arm.com>
Date: Fri, 29 May 2026 10:58:06 +0530
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
X-CRM114-CacheID: sfid-20260528_222818_240149_8007E200 
X-CRM114-Status: GOOD (  29.52  )
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

Hmm - I think this is the issue of who validates what. I think the change
should be done but this is not an urgent issue, so let us leave this
for now.

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

Ah okay. It is really confusing to see PUD helpers everywhere when
they are basically dead code ...

> 
> Thanks,
> Wen
>>>  }
>>>
>>>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>


