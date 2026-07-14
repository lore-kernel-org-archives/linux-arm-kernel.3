Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23742C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfTl3GQoSyoFUEnmuQBsyrvcEduJvtBv+v98cbpDZBc=; b=a+lZWFguF/c9IKm6qn4ikcfODq
	abVcL2E2iAcTmmM76WzMEvqnysy7j1FC9bkDQaJcfU6ZIwkJa934GFsC4QNBEz2UzjraTepBcMGwI
	xvgi0IoMhsGOWele2hIb2zhy7E+S2Nt4ehTBa9VMcxHMjviwUgx2dUi/+0cfeckFhCKGNxpALDK1w
	PyYS28vyPtGD+SdMDZsbDwcGpbIMRsczk4vXAbpHNu6qVSg+i62zlxTNwRrqqzBpZp6JRCZD+y42D
	fCBPzdgdlAGjybLnhT+Wp9mB+xjn4jIq/2AUxkuLtH3wzERmi52E8jNbsdhKT317RLYxTNeYWbwjJ
	v4cK9SfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVm6-0000000Awsd-0cCA;
	Tue, 14 Jul 2026 05:33:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVm3-0000000AwsD-3GlQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:33:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A4AC339;
	Mon, 13 Jul 2026 22:33:38 -0700 (PDT)
Received: from [10.164.148.52] (unknown [10.164.148.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FDB83F7D8;
	Mon, 13 Jul 2026 22:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784007222; bh=hccglgIXGsjwDzVnD98+WSP/z7D0qxzcLTBTl50S9mg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FSOAa8YNN3CVVYMjJlByEEDvCp3N6RiO2oahs9L5zy3NLSdL4eotRZOOzLXBgsR6c
	 QeIYYS2MnJjijJddDjToSP50t6vArkTP40fqUyhWbBaoCbjr/zmfwyDXdqfoJjJoEn
	 U6REtT/KH2W5L1HtBWEbunXMgohTA6E6QD/jFSyw=
Message-ID: <a9fe7408-8607-4115-8f2f-75ec9b5a4b21@arm.com>
Date: Tue, 14 Jul 2026 11:03:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, ryan.roberts@arm.com,
 "Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>,
 Leo Yan <leo.yan@arm.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
 <20260709073823.6643-6-jiangwen6@xiaomi.com>
 <aa5d2aa2-89c8-4b6c-9a28-5c22143277b0@arm.com>
 <CAHKocdG7iO=S+pZLSs+mYO3GmVC_WvpC0V_1Tjj7RZ-YxWVh_w@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAHKocdG7iO=S+pZLSs+mYO3GmVC_WvpC0V_1Tjj7RZ-YxWVh_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_223343_974962_344F9229 
X-CRM114-Status: GOOD (  21.62  )
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



On 14/07/26 10:46 am, Wen Jiang wrote:
> On Mon, 13 Jul 2026 at 23:19, Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 09/07/26 1:08 pm, Wen Jiang wrote:
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
>>> whenever possible. The mapping order is determined by taking the
>>> minimum of the contiguous page count and the pfn alignment, allowing
>>> graceful degradation when pfn alignment is less than the contiguous
>>> range.
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
>>> Tested-by: Leo Yan <leo.yan@arm.com>
>>> ---
>>>  mm/vmalloc.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 85 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index d2a4d649af549..db0492151ad08 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -3543,6 +3543,89 @@ void vunmap(const void *addr)
>>>  }
>>>  EXPORT_SYMBOL(vunmap);
>>>
>>> +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
>>> +{
>>> +     if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
>>> +             return PMD_SHIFT;
>>> +
>>> +     return arch_vmap_pte_supported_shift(size);
>>> +}
>>
>> Need to throw in a preparatory patch for this, which will (in addition to
>> introduction of the vm_shift() function) do:
>>
> 
> Hi Dev,
> 
> Your suggestion is to extract "vm_shift" into a separate patch, say
> Patch 5, to make it a common utility function just like Patch 3. And
> move the existing code that can use vm_shift into this new patch as
> well, correct?


Yes it will look like the current patch 3. So before the current patch 5,
you can have a patch introducing vm_shift and making the code chunk
in __vmalloc_node_range_noprof() call it.



> 
> Thanks,
> Wen
> 
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index afaa14ebf17bb..dac87e1cd484b 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -4175,10 +4175,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>>                  * supporting them.
>>                  */
>>
>> -               if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
>> -                       shift = PMD_SHIFT;
>> -               else
>> -                       shift = arch_vmap_pte_supported_shift(size);
>> +               shift = vm_shift(prot, size);
>>
>>                 align = max(original_align, 1UL << shift);
>>         }
>>
>>
>>
>>> +
>>> +static inline int get_vmap_batch_order(struct page **pages,
>>> +             pgprot_t prot, unsigned int max_steps, unsigned int idx)
>>> +{
>>> +     unsigned int nr_contig;
>>> +     int order;
>>> +
>>> +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
>>> +             return 0;
>>> +
>>> +     nr_contig = num_pages_contiguous(&pages[idx], max_steps);
>>> +     if (nr_contig < 2)
>>> +             return 0;
>>> +
>>> +     order = ilog2(nr_contig);
>>> +
>>> +     /* Limit order by pfn alignment */
>>> +     order = min_t(int, order, __ffs(page_to_pfn(pages[idx])));
>>
>> You missed Sashiko's point here :) the pfn may be zero and this
>> will blow up. You can just first derive the pfn and do the clamping
>> only when pfn > 0.
>>
>>
> 
> Will fix this.
> 
> Thanks,
> Wen
>>
>>> +
>>> +     if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
>>> +             return 0;
>>> +
>>> +     return order;
>>> +}
>>> +


