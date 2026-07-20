Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A237C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hbz4m11xQLaEtf8XVVJxSHy4D4sghpoBDJFK4GKy9w=; b=xDH1Qtvi4ztIOjYJinpxyy/1+N
	sfVgdBYl/Tun7yOQzEuPIlwM9PvVxL5iZQzZCT3M+eNXtgZ+49Fa4T9GUuPtkH0zj6xeGJlGb5ZZd
	TAocIN+uC4YIp9S7paMq6Ai3Y5fmgxBNenuq1+gKLtE0jClsAAi0Ri7dNSrc4obf1WeJb+bktV0yM
	CPukxZH8vRKPKjtxNnS9lkY1iZ7SnzP0i98gRyPI57P6D28gK0A5IUCVyrTf1jVyv+yh2TUop47X+
	11+d245cEgNq6wH4TXuGZZRA3qtGoHCMhYaXrz/6Ih/BQTyD1MWy5/HSebe/gZ5LhnCVsIR79seKd
	ahwg/YEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlilV-000000068OH-2JbV;
	Mon, 20 Jul 2026 07:50:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlilS-000000068NW-2DX6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:50:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 436AB2B;
	Mon, 20 Jul 2026 00:50:06 -0700 (PDT)
Received: from [10.164.19.57] (unknown [10.164.19.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 298693F86F;
	Mon, 20 Jul 2026 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784533810; bh=20qVoOi+T2bd14GUaGlaJo6iftl057+Jngsl1bAE5qU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d+B7JwzjApBVbNGi/lZVbeh8UDrT1DNYUjgEgWc2GIraJ4HHEnEOz05tgrJy8uOcR
	 ly5nI4ECdfjDFJ6B1IAFwgGREIjN1LaSc5DQ3enBRjZoQgzj8vCP7YoXH3VqFxvdtv
	 2TrrKsNOSbNa7mTY1F58riP357VHmop81eIHr/1s=
Message-ID: <e650604f-316c-48f6-8279-05c162bcdf21@arm.com>
Date: Mon, 20 Jul 2026 13:20:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, ryan.roberts@arm.com, baohua@kernel.org,
 Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-7-jiangwen6@xiaomi.com>
 <fbea7f50-ee00-4466-8788-1cc78303f5bc@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <fbea7f50-ee00-4466-8788-1cc78303f5bc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_005014_663479_344196C1 
X-CRM114-Status: GOOD (  23.11  )
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

[------]

>> +
>> +	nr_contig = num_pages_contiguous(&pages[idx], max_steps);
>> +	if (nr_contig < 2)
>> +		return 0;
>> +
>> +	order = ilog2(nr_contig);
>> +	pfn = page_to_pfn(pages[idx]);
>> +
>> +	/* Limit order by pfn alignment */
>> +	if (pfn > 0)
>> +		order = min_t(int, order, __ffs(pfn));
> 
> Wouldn't it make sense to determine that before you call num_pages_contiguous?
> Because then, you can just scan to that maximum instead of the given nr_pages.

Right!


> 
>> +
>> +	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
>> +		return 0;
>> +
>> +	return order;
>> +}
>> +
>> +static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
>> +		pgprot_t prot, struct page **pages)
>> +{
>> +	unsigned int count = (end - addr) >> PAGE_SHIFT;
> 
> "nr_pages" ? Also, can be const.
> 
>> +	unsigned int prev_shift = 0, idx = 0;
>> +	unsigned long map_addr = addr, batch_end = addr;
>> +	int err;
>> +
>> +	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
>> +					     PAGE_SHIFT, GFP_KERNEL);
> 
> Is the indentation on the second parameter line off?
> 
>> +	if (err)
>> +		goto out;
>> +
>> +	for (unsigned int i = 0; i < count; ) {
>> +		unsigned int shift = PAGE_SHIFT +
>> +			get_vmap_batch_order(pages, prot, count - i, i);
> 
> Having two indices, i and idx, is just confusing.
> 
> The whole function is a bit overly complicated. Does it really buy us much to
> batch over vmap_pages_range_noflush_walk() calling with the same shift?

It will buy us more in the sense that, vmap() speed is sensitive to the number
of pagetable walks. I think that is reflected by the ioremap(1MB) 1.35x speedup
mentioned in the cover letter.

In terms of callers, not sure. I would expect a caller to get the highest
power of 2 from the total needed nr_pages, then get the next highest power
of 2 from the remaining, and so on.

For the arm64 TRBE usecase, the relevant code is the rb_alloc_aux_page() caller in
kernel/events/ring_buffer.c. We may get multiple same order requests if can't
get the first requested higher order.

Since on the cover letter I see Wen and team have tested on boards, I lean
towards saying it is reasonable to assume a usecase where such order
fallback can happen.

But yeah the code for this currently is not so nice I agree.

> 
>> +
>> +		if (!i)
>> +			prev_shift = shift;
>> +
>> +		if (shift != prev_shift) {
>> +			err = vmap_pages_range_noflush_walk(map_addr, batch_end,
>> +					prot, pages + idx, prev_shift);
>> +			if (err)
>> +				goto out;
>> +			prev_shift = shift;
>> +			map_addr = batch_end;
>> +			idx = i;
>> +		}
>> +
>> +		/*
>> +		 * Once small pages are encountered, the remaining pages
>> +		 * are likely small as well.
> 
> "small pages" is odd. Maybe
> 
> "Once we fail to batch pages, we expect to fail batching for all remaining
> pages, so just give up."
> 
>> +		 */
>> +		if (shift == PAGE_SHIFT)
>> +			break;
>> +
>> +		batch_end += 1UL << shift;
>> +		i += 1U << (shift - PAGE_SHIFT);
>> +	}
>> +
>> +	/* Remaining */
>> +	if (map_addr < end)
>> +		err = vmap_pages_range_noflush_walk(map_addr, end,
>> +				prot, pages + idx, prev_shift);
>> +
>> +out:
>> +	flush_cache_vmap(addr, end);
>> +	return err;
>> +}
>> +
>>  /**
>>   * vmap - map an array of pages into virtually contiguous space
>>   * @pages: array of page pointers
>> @@ -3600,8 +3678,8 @@ void *vmap(struct page **pages, unsigned int count,
>>  		return NULL;
>>
>>  	addr = (unsigned long)area->addr;
>> -	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
>> -				pages, PAGE_SHIFT) < 0) {
>> +	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot),
>> +				pages) < 0) {
> 
> Nit: single line would make that nicer to read.
> 


