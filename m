Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glghTutpEqXPnCOEeCh4W6AO1yrko6RLNG5OdFNkMv0=; b=Qr4JckZPB558hp0NWfLjkdLdzS
	y361vn4WOyX3rbJHUmBb5Iw9tjx4WxnVqJDVUsGhcamQGuA0bNWcNh0sZxdts25WOn2z5VwHl34R1
	MgOZuFGimhR3RbXBUPfgBfzU4wJJn8Qb4wnTOS4/R7tEdNZXMH+yDYd5vcafEoPFQzlvbRbDJHG1A
	iXEfMpnbPJ8grtzq+p5dyhn/M+U3M1KTLJ5hF6vDW/W2xWjMPrNEch0RnYLycOZ0UqVeqUGH64Rgj
	I9pApRWGPT3NUBX8fVQ0xQeacB7XS3eOJe6ON54WPyR8VUUUxkEDP/5RpIvEzP5lIi9Pk5DvPdceM
	tOPirgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWtx-0000000B5Ah-3Ykh;
	Tue, 14 Jul 2026 06:45:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWtu-0000000B5AG-3hc7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:45:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9BA11477;
	Mon, 13 Jul 2026 23:45:48 -0700 (PDT)
Received: from [10.164.19.52] (unknown [10.164.19.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B287D3F7B4;
	Mon, 13 Jul 2026 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784011553; bh=Hc0hzyscuk80FwBKUVOH73LX4dEOMupwQvGYeR9hS2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mjdADVBavbIfoQjjnjGAOKAsOn2SXw9RUkr+c9HkpzsjGg5F87xy9VajsbDz/hcD6
	 uKVLLFNAx7UapzoLhWhvYbppY8tZqx610mKhSI2M1QU0flV3xrwBv3jOGyHyM0n4mC
	 z1k1iHtkbnzeurZPkAHfsX9+cb2E+pFI9TkHTGgo=
Message-ID: <945bdf1a-10f8-41fd-956e-af40af809c7b@arm.com>
Date: Tue, 14 Jul 2026 12:15:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] mm/vmalloc: Extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, ryan.roberts@arm.com,
 "Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>,
 Leo Yan <leo.yan@arm.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709073823.6643-5-jiangwen6@xiaomi.com>
 <85a3a79a-2a78-47ed-bd93-48e8f1967551@arm.com>
 <CAHKocdH0KYPaqkTOEE7n8vX4BFdgPvVbRsh3Vtb6MtvmCTn4XQ@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAHKocdH0KYPaqkTOEE7n8vX4BFdgPvVbRsh3Vtb6MtvmCTn4XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_234555_098800_F8AA23FC 
X-CRM114-Status: GOOD (  18.35  )
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



On 14/07/26 11:40 am, Wen Jiang wrote:
> On Mon, 13 Jul 2026 at 21:49, Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 09/07/26 1:08 pm, Wen Jiang wrote:
>>> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
>>>
>>> vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
>>> provides a clean interface by taking struct page **pages and mapping them
>>> via direct PTE iteration. This avoids the page table rewalk seen when
>>> using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
>>>
>>> Extend it to support larger page_shift values, and add PMD- and
>>> contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_walk()
>>> since it now handles more than just small pages.
>>>
>>> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
>>> iterate over pages one by one via vmap_range_noflush(), which would
>>> otherwise lead to page table rewalk. The code is now unified with the
>>> PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
>>>
>>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>>> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>>> Tested-by: Leo Yan <leo.yan@arm.com>
>>> Reviewed-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>  mm/vmalloc.c | 81 ++++++++++++++++++++++++++++++----------------------
>>>  1 file changed, 47 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index d7fef85b241c4..d2a4d649af549 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -125,7 +125,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>>       pte_t *pte;
>>>       u64 pfn;
>>>       struct page *page;
>>> -     unsigned long size = PAGE_SIZE;
>>> +     unsigned long size;
>>> +     unsigned int steps;
>>>
>>>       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>>>               return -EINVAL;
>>> @@ -147,8 +148,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>>               }
>>>
>>>               size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
>>> -             pfn += PFN_DOWN(size);
>>> -     } while (pte += PFN_DOWN(size), addr += size, addr != end);
>>> +             steps = PFN_DOWN(size);
>>> +     } while (pte += steps, pfn += steps, addr += size, addr != end);
>>
>> I think I had also recommended to put these vmap_pte_range() changes
>> into the previous patch.
>>
> 
> Hi Dev
> 
> I put this change in patch 4 following Uladzislau's earlier suggestion:
> 
> https://lore.kernel.org/linux-mm/ah3Cn3YnefIVJDo2@milan/
> 
> Uladzislau, do you have a preference on where this hunk should go?
> 

Sorry if I wasn't clear enough. I am not contradicting Uladzislau's comment -
separate patch 3 and 4 are good. I was just commenting on the specific change
you did here w.r.t vmap_pte_range.

The only bit you change above is to introduce a local variable 'steps'. You
can move this bit into the previous patch, so that patch 4 is completely
focussed on extending the vmap_pages_* functions to accept a 'shift'.


> Thanks,
> Wen


