Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD00E74913
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkixSAhRxEVhX5M563rXharhRiWWamTV8SfoJKxI6V4=; b=mNUYI0TRH4JuamE8TXo6NOrWD/
	rHO3nlCKv5JV/4/AVtuSKJ0ym0GgQL+gwMn/lYMItJUFzeyp8jZPs60/EPu1o3c4x1QaTLODuS6PU
	utiHy1tdt/+4rm+ZFyBjOLhlKhrWZC32oKkTNvLnHWEZix5DQ/4azwXx4GyknOEzRvgJGAVm8FFuQ
	dB24a7B1vCPOfeaZNL0z08x3Nfvb0xJeWRgMmbUGxc5GBjBZwmfK/VgX9p1486vtUMVtE/L2lCBqB
	f2EYgA0Y4zpgAJLEH0hclLlPG9Y8FJAPxMGYwgAqllS2nnsnjbDBXNFcyOMa6AbC3CWsPPFyAdIpI
	SPelg3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYH3o-0000000GPrj-1UuP;
	Wed, 24 Dec 2025 05:05:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYH3k-0000000GPrC-2uZD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 05:05:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD602339;
	Tue, 23 Dec 2025 21:05:05 -0800 (PST)
Received: from [10.164.18.59] (MacBook-Pro.blr.arm.com [10.164.18.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 830543F73F;
	Tue, 23 Dec 2025 21:05:07 -0800 (PST)
Message-ID: <19e28edb-87b1-4e4d-accc-2219f717aa51@arm.com>
Date: Wed, 24 Dec 2025 10:35:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC PATCH 1/2] mm/vmalloc: Do not align size to huge size
To: Uladzislau Rezki <urezki@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, cem@kernel.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com,
 shijie@os.amperecomputing.com, yang@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, npiggin@gmail.com, willy@infradead.org,
 david@kernel.org, ziy@nvidia.com
References: <20251212042701.71993-1-dev.jain@arm.com>
 <20251212042701.71993-2-dev.jain@arm.com> <aUkv51yk8lgzW9jv@milan>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aUkv51yk8lgzW9jv@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_210516_828891_71C893E5 
X-CRM114-Status: GOOD (  31.59  )
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


On 22/12/25 5:17 pm, Uladzislau Rezki wrote:
> On Fri, Dec 12, 2025 at 09:57:00AM +0530, Dev Jain wrote:
>> vmalloc() consists of the following:
>>
>> (1) find empty space in the vmalloc space -> (2) get physical pages from
>> the buddy system -> (3) map the pages into the pagetable.
>>
>> It turns out that the cost of (1) and (3) is pretty insignificant. Hence,
>> the cost of vmalloc becomes highly sensitive to physical memory allocation
>> time.
>>
>> Currently, if we decide to use huge mappings, apart from aligning the start
>> of the target vm_struct region to the huge-alignment, we also align the
>> size. This does not seem to produce any benefit (apart from simplification
>> of the code), and there is a clear disadvantage - as mentioned above, the
>> main cost of vmalloc comes from its interaction with the buddy system, and
>> thus requesting more memory than was requested by the caller is suboptimal
>> and unnecessary.
>>
>> This change is also motivated due to the next patch ("arm64/mm: Enable
>> vmalloc-huge by default"). Suppose that some user of vmalloc maps 17 pages,
>> uses that mapping for an extremely short time, and vfree's it. That patch,
>> without this patch, on arm64 will ultimately map 16 * 2 = 32 pages in a
>> contiguous way. Since the mapping is used for a very short time, it is
>> likely that the extra cost of mapping 15 pages defeats any benefit from
>> reduced TLB pressure, and regresses that code path. 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  mm/vmalloc.c | 38 ++++++++++++++++++++++++++++++--------
>>  1 file changed, 30 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index ecbac900c35f..389225a6f7ef 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -654,7 +654,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>>  {
>> -	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
>> +	unsigned int i, step, nr = (end - addr) >> PAGE_SHIFT;
>>  
>>  	WARN_ON(page_shift < PAGE_SHIFT);
>>  
>> @@ -662,7 +662,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>  			page_shift == PAGE_SHIFT)
>>  		return vmap_small_pages_range_noflush(addr, end, prot, pages);
>>  
>> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
>> +	step = 1U << (page_shift - PAGE_SHIFT);
>> +	for (i = 0; i < ALIGN_DOWN(nr, step); i += step) {
>>  		int err;
>>  
>>  		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
>> @@ -673,8 +674,9 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>  
>>  		addr += 1UL << page_shift;
>>  	}
>> -
>> -	return 0;
>> +	if (IS_ALIGNED(nr, step))
>> +		return 0;
>> +	return vmap_small_pages_range_noflush(addr, end, prot, pages + i);
>>  }
>>  
> Can we improve the readability?
>
> <snip>
> index 25a4178188ee..14ca019b57af 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -655,6 +655,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
>         unsigned int i, step, nr = (end - addr) >> PAGE_SHIFT;
> +       unsigned int nr_aligned;
> +       unsigned long chunk_size;
>
>         WARN_ON(page_shift < PAGE_SHIFT);
>
> @@ -662,20 +664,24 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>                         page_shift == PAGE_SHIFT)
>                 return vmap_small_pages_range_noflush(addr, end, prot, pages);
>
> -       step = 1U << (page_shift - PAGE_SHIFT);
> -       for (i = 0; i < ALIGN_DOWN(nr, step); i += step) {
> -               int err;
> +       step = 1U << (page_shift - PAGE_SHIFT); /* small pages per huge chunk. */
> +       nr_aligned = ALIGN_DOWN(nr, step);
> +       chunk_size = 1UL << page_shift;
>
> -               err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> +       for (i = 0; i < nr_aligned; i += step) {
> +               int err = vmap_range_noflush(addr, addr + chunk_size,
>                                         page_to_phys(pages[i]), prot,
>                                         page_shift);
>                 if (err)
>                         return err;
>
> -               addr += 1UL << page_shift;
> +               addr += chunk_size;
>         }
> -       if (IS_ALIGNED(nr, step))
> +
> +       if (i == nr)
>                 return 0;
> +
> +       /* Map the tail using small pages. */
>         return vmap_small_pages_range_noflush(addr, end, prot, pages + i);
>  }
> <snip>

Indeed I can do this.

>
>>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>> @@ -3197,7 +3199,7 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
>>  	unsigned long requested_size = size;
>>  
>>  	BUG_ON(in_interrupt());
>> -	size = ALIGN(size, 1ul << shift);
>> +	size = PAGE_ALIGN(size);
>>  	if (unlikely(!size))
>>  		return NULL;
>>  
>> @@ -3353,7 +3355,7 @@ static void vm_reset_perms(struct vm_struct *area)
>>  	 * Find the start and end range of the direct mappings to make sure that
>>  	 * the vm_unmap_aliases() flush includes the direct map.
>>  	 */
>> -	for (i = 0; i < area->nr_pages; i += 1U << page_order) {
>> +	for (i = 0; i < ALIGN_DOWN(area->nr_pages, 1U << page_order); i += (1U << page_order)) {
>>
> nr_blocks?
>
>>  		unsigned long addr = (unsigned long)page_address(area->pages[i]);
>>  
>>  		if (addr) {
>> @@ -3365,6 +3367,18 @@ static void vm_reset_perms(struct vm_struct *area)
>>  			flush_dmap = 1;
>>  		}
>>  	}
>> +	for (; i < area->nr_pages; ++i) {
>> +		unsigned long addr = (unsigned long)page_address(area->pages[i]);
>> +
>> +		if (addr) {
>> +			unsigned long page_size;
>> +
>> +			page_size = PAGE_SIZE;
>> +			start = min(addr, start);
>> +			end = max(addr + page_size, end);
>> +			flush_dmap = 1;
>> +		}
>> +	}
>>  
>>  	/*
>>  	 * Set direct map to something invalid so that it won't be cached if
>> @@ -3673,6 +3687,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>>  	 * more permissive.
>>  	 */
>>  	if (!order) {
>> +single_page:
>>  		while (nr_allocated < nr_pages) {
>>  			unsigned int nr, nr_pages_request;
>>  
>> @@ -3704,13 +3719,18 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>>  			 * If zero or pages were obtained partly,
>>  			 * fallback to a single page allocator.
>>  			 */
>> -			if (nr != nr_pages_request)
>> +			if (nr != nr_pages_request) {
>> +				order = 0;
>>  				break;
>> +			}
>>  		}
>>  	}
>>  
>>  	/* High-order pages or fallback path if "bulk" fails. */
>>  	while (nr_allocated < nr_pages) {
>> +		if (nr_pages - nr_allocated < (1UL << order)) {
>> +			goto single_page;
>> +		}
>>  		if (!(gfp & __GFP_NOFAIL) && fatal_signal_pending(current))
>>  			break;
>>
> Yes, it requires more attention. That "goto single_page" should be
> eliminated, IMO. We should not jump between blocks, logically the
> single_page belongs to "order-0 alloc path".
>
> Probably it requires more refactoring to simplify it.

I can think about refactoring this.

>
>>  
>> @@ -5179,7 +5199,9 @@ static void show_numa_info(struct seq_file *m, struct vm_struct *v,
>>  
>>  	memset(counters, 0, nr_node_ids * sizeof(unsigned int));
>>  
>> -	for (nr = 0; nr < v->nr_pages; nr += step)
>> +	for (nr = 0; nr < ALIGN_DOWN(v->nr_pages, step); nr += step)
>> +		counters[page_to_nid(v->pages[nr])] += step;
>> +	for (; nr < v->nr_pages; ++nr)
>>  		counters[page_to_nid(v->pages[nr])] += step;
>>
> Can we fit it into one loop? Last tail loop continuous adding step?

I don't see any other way.

>
> --
> Uladzislau Rezki

