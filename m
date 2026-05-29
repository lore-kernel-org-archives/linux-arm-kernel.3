Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D7BCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 05:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bikGWbo7Z8u+Y86zGUnLKB2GE1vzG3CgAboXfzOGk8Q=; b=MNy/kFBeMJW8U0lvPkuI/62ODd
	UOTu4DE+jZS8s972nCrp6xf2Yf/qf/oTjPriTEKQZVRa0cPz5CdsJtSGwRZgcc1PRGJEb4c7sAI81
	esYwKa6hLurGdzmVAMhnZAb4Als2JG9sC4ZTPffvlQT6GtmSFkkE0GQJz0+C+QQWV9Vm2SaPE7Bkr
	hUNHUATCtxltPdeVbh4xDhETmR5WG3PSe7H1u53oAc5pNcn8ngsh6H2Wd8wIJMxxfTZ4/8XqkKzgo
	zPmUzoeVCX3nCYMjwz83RAqqtbBD8R82Ky0SIK82My1mNRmkCL8IlVaQi+d+8K+C6bxe1c1IcI8CJ
	otIq0wqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqDb-00000006mMQ-0cXI;
	Fri, 29 May 2026 05:57:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqDZ-00000006mM2-0fjg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 05:57:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC81C20E3;
	Thu, 28 May 2026 22:57:05 -0700 (PDT)
Received: from [10.164.19.8] (unknown [10.164.19.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08C023F7B4;
	Thu, 28 May 2026 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780034230; bh=xtznZdFjBfsx+x5Ya5ydKOlmG98EyGoHWLUMAFrCTzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fgqx2Y8RR687yU7zdX7ZpAqBz6WeA7sNuW3FzjxAGEN1Z7gVhSnzL5ZXasdq2mGvp
	 905qzto8FzndnoeDZUaU/fLkjBxjXTkaV4N86n9HCvGjJVkq4Ksnd7IOMxL6ZT9FeW
	 9GMisM4bQxSR4tTSRIe40iHkFT2ePhj7hn4oYxlg=
Message-ID: <176c83fb-edf0-47b3-9823-21a92ea8b4c7@arm.com>
Date: Fri, 29 May 2026 11:27:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
 rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
 jiangwen6@xiaomi.com
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-6-jiangwenxiaomi@gmail.com>
 <340c811e-2501-46c3-8a55-19e955c5ae8a@arm.com>
 <CAHKocdHOT13DHdz+DsT2BaP0EJSKdoWU2NO-wjFwB9+--CqsHw@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAHKocdHOT13DHdz+DsT2BaP0EJSKdoWU2NO-wjFwB9+--CqsHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_225713_295772_16F0A791 
X-CRM114-Status: GOOD (  25.66  )
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



On 28/05/26 9:12 am, Wen Jiang wrote:
> On Wed, 27 May 2026 at 16:28, Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 22/05/26 11:01 am, Wen Jiang wrote:
>>> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
>>>
>>> In many cases, the pages passed to vmap() may include high-order
>>> pages. For example, the systemheap often allocates pages in descending
>>> order: order 8, then 4, then 0. Currently, vmap() iterates over every
>>> page individually—even pages inside a high-order block are handled
>>> one by one.
>>>
>>> This patch detects physically contiguous pages (regardless of whether
>>> they are compound or non-compound) by scanning with
>>> num_pages_contiguous(), and maps them as a single contiguous block
>>> whenever possible. The first page's pfn must be aligned to the
>>> mapping order for the batched mapping to be used.
>>>
>>> Pages with the same page_shift are coalesced and mapped via
>>> vmap_pages_range_noflush_walk() to avoid page table rewalk.
>>>
>>> As users typically allocate memory in descending orders (e.g.
>>> 8 → 4 → 0), once an order-0 page is encountered, we stop scanning
>>> for contiguous pages since subsequent pages are likely order-0 as well.
>>>
>>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>>> Co-developed-by: Dev Jain <dev.jain@arm.com>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>>> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>>> ---
>>>  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 80 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index deb764abc0571..50642246f4d40 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -3542,6 +3542,84 @@ void vunmap(const void *addr)
>>>  }
>>>  EXPORT_SYMBOL(vunmap);
>>>
>>> +static inline int get_vmap_batch_order(struct page **pages,
>>> +             unsigned int max_steps, unsigned int idx)
>>> +{
>>> +     unsigned int nr_contig;
>>> +     int order;
>>> +
>>> +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
>>> +                     ioremap_max_page_shift == PAGE_SHIFT)
>>
>>
>> Why bail out on ioremap_max_page_shift == PAGE_SHIFT? The code
>> path for ioremap is different from vmap right?
>>
>>
> 
> ioremap_max_page_shift is under CONFIG_HAVE_ARCH_HUGE_VMAP which
> controls both ioremap and vmap huge mappings.

I don't get it. So with this patch if nohugeiomap is passed on kernel
cmdline, then vmap-huge is also disabled. That does not sound correct.
Currently ioremap_max_page_shift does not play at all with the normal
vmap code path. It is only involved in ioremap_page_range().


> 
>>> +             return 0;
>>> +
>>> +     nr_contig = num_pages_contiguous(&pages[idx], max_steps);
>>> +     if (nr_contig < 2)
>>> +             return 0;
>>> +
>>> +     order = fls(nr_contig) - 1;
>>> +
>>> +     if (arch_vmap_pte_supported_shift(PAGE_SIZE << order) == PAGE_SHIFT)
>>> +             return 0;

Also, for arches where this function does not do anything special
(i.e return PAGE_SHIFT), we will effectively not do any huge mappings
for them.


>>> +
>>> +     /* Ensure the first page's pfn is aligned to the order */
>>> +     if (!IS_ALIGNED(page_to_pfn(pages[idx]), 1 << order))
>>> +             return 0;

This condition is a bit fragile. It may happen that we have, say 2^8
contigous pages, but they are aligned to only 2^4. We are operating
on a page array and have no idea if the caller has passed some
random subrange of the array.

I think the purpose of these checks is this - to do an early bailout
if arch does not support huge mappings, or the alignment is not correct,
instead of finding this out very deep into vmap_pages_range_noflush_walk.

So you could do something like (completely untested and may miss some edge cases):

order = ilog2(nr_contig);

order = min(order, __ffs(page_to_pfn(pages[idx])));

order = vm_shift(PAGE_SIZE << order) - PAGE_SHIFT;

Where vm_shift() is the helper I had used in my patch.

>>> +
>>> +     return order;
>>> +}
>>> +
>>> +static int vmap_batched(unsigned long addr, unsigned long end,
>>> +             pgprot_t prot, struct page **pages)
>>> +{
>>> +     unsigned int count = (end - addr) >> PAGE_SHIFT;
>>> +     unsigned int prev_shift = 0, idx = 0;
>>> +     unsigned long start = addr, map_addr = addr;
>>> +     int err;
>>> +
>>> +     err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
>>> +                                             PAGE_SHIFT, GFP_KERNEL);
>>> +     if (err)
>>> +             goto out;
>>> +
>>> +     for (unsigned int i = 0; i < count; ) {
>>> +             unsigned int shift = PAGE_SHIFT +
>>> +                     get_vmap_batch_order(pages, count - i, i);
>>> +
>>> +             if (!i)
>>> +                     prev_shift = shift;
>>> +
>>> +             if (shift != prev_shift) {
>>> +                     err = vmap_pages_range_noflush_walk(map_addr, addr,
>>
>> It would be worth documenting vmap_pages_range_noflush_walk() that
>> it can take an array of pages which are not all contiguous, but it
>> may have contiguous chunks, as hinted by page_shift.
>>
>> Otherwise this looks good.
>>
>>> +                                     prot, pages + idx,
>>> +                                     min(prev_shift, PMD_SHIFT));
>>> +                     if (err)
>>> +                             goto out;
>>> +                     prev_shift = shift;
>>> +                     map_addr = addr;
>>> +                     idx = i;
>>> +             }
>>> +
>>> +             /*
>>> +              * Once small pages are encountered, the remaining pages
>>> +              * are likely small as well.
>>> +              */
>>> +             if (shift == PAGE_SHIFT)
>>> +                     break;
>>> +
>>> +             addr += 1UL << shift;
>>> +             i += 1U << (shift - PAGE_SHIFT);
>>> +     }
>>> +
>>> +     /* Remaining */
>>> +     if (map_addr < end)
>>> +             err = vmap_pages_range_noflush_walk(map_addr, end,
>>> +                             prot, pages + idx, min(prev_shift, PMD_SHIFT));
>>> +
>>> +out:
>>> +     flush_cache_vmap(start, end);
>>> +     return err;
>>> +}
>>> +
>>>  /**
>>>   * vmap - map an array of pages into virtually contiguous space
>>>   * @pages: array of page pointers
>>> @@ -3585,8 +3663,8 @@ void *vmap(struct page **pages, unsigned int count,
>>>               return NULL;
>>>
>>>       addr = (unsigned long)area->addr;
>>> -     if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
>>> -                             pages, PAGE_SHIFT) < 0) {
>>> +     if (vmap_batched(addr, addr + size, pgprot_nx(prot),
>>> +                             pages) < 0) {
>>>               vunmap(area->addr);
>>>               return NULL;
>>>       }
>>


