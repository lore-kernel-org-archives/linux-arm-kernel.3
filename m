Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF53EA3C22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2FigYED1pze1+QNonRTD2+UmVbmoc123ryoS8VxaOU=; b=gjr3gvreFfwmHG8XCeRsN3hmp9
	vHjfFE9F8473PyUStnF4uvYaEcJFFAPbc670DQ5NNPeyaq4kxp6T6b4oWQxhymF7N4b8MAMktaxtQ
	utxNQ2592/YXpqwZQDZlU1wn1lKGLD3zCw76C6ET6csGJrqSTE3umIMxyB0m6a2jchU2GwJ9JuSWU
	C6zsyAMa9+jF6iIznic/AMLWXqgxVVE9d63I6yEKdo2NthMcgqStz0mSUrTxGdNGn+/suqaGz6Ier
	B9yuyHF+0hZzd/RGeJSf9n8UYEInuRQfPBlxfjpJQ/kHsLGKKEhnw0vGr2k/iFd1cL9YKZgCtNeeV
	l9O4KqvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmLh-0000000A83f-2Emw;
	Thu, 09 Apr 2026 10:10:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmLf-0000000A82u-0ttQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:10:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73DAE3297;
	Thu,  9 Apr 2026 03:10:46 -0700 (PDT)
Received: from [10.164.148.43] (unknown [10.164.148.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A9393F632;
	Thu,  9 Apr 2026 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775729452; bh=xIGIsShfGZskdnuFPNvuPLkTAert80RGZC2aB1q7CjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DoXJefwmEF4Xv70LZdkYk6MtFwB06HynMMQiS9dxHAGyDBhDs6tIQxU6JqGlaxxT1
	 5l0KuSbVXUsmv7dZFj7pBdLci58Ix28p+xTpPcqqgCgREtAbIg718vw3jXbj/yM9py
	 6vibhorVUqWAuDsmXYGl7v3TKTbr8WA+aB2BJdKI=
Message-ID: <46fbd241-4d64-409a-b9dc-77e778ca088e@arm.com>
Date: Thu, 9 Apr 2026 15:40:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Barry Song <baohua@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-6-baohua@kernel.org>
 <c54e12b0-1a35-48e1-b243-991de246a8ca@arm.com>
 <CAGsJ_4yL3Y1Sr0MjTd6=ROC0jKf4JkCqNPODMh-m155rUFcS9g@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4yL3Y1Sr0MjTd6=ROC0jKf4JkCqNPODMh-m155rUFcS9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_031055_352986_E632097F 
X-CRM114-Status: GOOD (  32.02  )
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



On 09/04/26 3:24 am, Barry Song wrote:
> On Wed, Apr 8, 2026 at 10:03 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
>>> In many cases, the pages passed to vmap() may include high-order
>>> pages allocated with __GFP_COMP flags. For example, the systemheap
>>> often allocates pages in descending order: order 8, then 4, then 0.
>>> Currently, vmap() iterates over every page individually—even pages
>>> inside a high-order block are handled one by one.
>>>
>>> This patch detects high-order pages and maps them as a single
>>> contiguous block whenever possible.
>>>
>>> An alternative would be to implement a new API, vmap_sg(), but that
>>> change seems to be large in scope.
>>>
>>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>>> ---
>>>  mm/vmalloc.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 49 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index eba436386929..e8dbfada42bc 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -3529,6 +3529,53 @@ void vunmap(const void *addr)
>>>  }
>>>  EXPORT_SYMBOL(vunmap);
>>>
>>> +static inline int get_vmap_batch_order(struct page **pages,
>>> +             unsigned int max_steps, unsigned int idx)
>>> +{
>>> +     unsigned int nr_pages;
>>> +
>>> +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
>>> +                     ioremap_max_page_shift == PAGE_SHIFT)
>>> +             return 0;
>>> +
>>> +     nr_pages = compound_nr(pages[idx]);
>>> +     if (nr_pages == 1 || max_steps < nr_pages)
>>> +             return 0;
>>
>> This assumes that the page array passed to vmap() will have compound pages
>> if it is a higher order allocation.
>>
>> See rb_alloc_aux_page(). It gets higher-order allocations without passing
>> GFP_COMP.
>>
>> That is why my implementation does not assume anything about the property
>> of the pages.
> 
> If you’re asking about support for non-compound pages, I think
> that’s fine. My current use case is dma-buf, where pages are
> compound. I recall discussing this previously with David and
> Uladzislau.
> 
> If you’re working with non-compound pages, I’m happy to add
> support in the next version. I’m also happy to reuse some of your
> code and credit you as Co-developed-by if you’re willing. I actually
> prefer your __vmap_huge() name over my
> vmap_contig_pages_range().
> 
> Does that make sense to you?

Yeah it will perhaps be better to have a fast-path detecting compound
pages, and if not then checking contiguity. So sure please go ahead
sharing some of my code and you can co-credit me.


> 
>>
>> Also it may be useful to do regression-testing for the common case of
>> vmap() with a single page (assuming it is common, I don't know), in
>> which case we may have to special case it.
> 
> I agree, so I had Xueyuan test single pages and highlighted this
> in the cover letter. There is no regression: "vmap() is 5.6×
> faster when memory includes some order-8 pages, with no
> regression observed for order-0 pages."
> 
>>
>> My implementation requires opting in with VM_ALLOW_HUGE_VMAP - I suspect
>> you may run into problems if you make vmap() do huge-mappings as best-effort
>> by default. I am guessing this because ...
>>
>> Drivers can operate on individual pages, so vmalloc() calls split_page()
>> and then does the block/cont mappings. This same issue should be present
>> with vmap() too? In which case if we are to do huge-mappings by default
>> then we can do split_page() after detecting contiguous chunks.
>>
>> But ... that may create problems for the caller of vmap() - vmap now
>> has the changed the properties of the pages.
> 
> I don’t see this as a problem at all. Splitting pages does not
> affect physical or virtual contiguity; it only changes the
> contents of struct page objects, not the PTE/PMD mappings.
> For ioremap, there isn’t even a struct page, yet the mappings
> can still be huge.

Okay so I was under the impression that *not* splitting the page
will be problematic.

But, vmalloc splits pages because the caller can operate on
individual struct pages by vmalloc_to_page(). To the contrary,
since the caller of vmap() decides what kind of pages to
virtually-map, we don't have the problem I was raising. So
I guess we are fine by making vmap do huge-mappings by default.

> 
> Thanks
> Barry


