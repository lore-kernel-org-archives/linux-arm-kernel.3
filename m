Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3167CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9J49Os8avM03pcKxT1/hTZ/Z159dOkFm8fYJNoACPhw=; b=gcRiKEWA6pQdTV8kryp6o1O6pn
	PmUeSdfCDWsrSHC2naLwPTRK1d3C/KU3+LOxn3vy7u5ALeN8oxtukQt3z8jA+BwBhHyoAm4s28Dhm
	ToeqfkH31XxAPfDesLeMyCMzCttGMp+5564G++lye/pvyJuJAKay742N+5AXKZOrX1W6N30bw1Tnv
	RMl6dpHrtOnJuulJ5cpw5sWnkGaZt4+Yukagjvai0rtofXGq2ZK3kfQZtx34y5r2R7FWvlZZFPZeK
	NT/LvddcFxAIVZPRuPQtTMQ9smOn3lxoHWvaMTAy2dbMRc+0S9AnrpcxKY3nvyRUeHOcWhdcZbKNL
	4usvgVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9cb-00000003Xl6-3jy9;
	Wed, 27 May 2026 08:28:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9ca-00000003XkO-1I6N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:28:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAE082880;
	Wed, 27 May 2026 01:27:57 -0700 (PDT)
Received: from [10.164.19.7] (unknown [10.164.19.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA27D3F7D8;
	Wed, 27 May 2026 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779870482; bh=zqMwayjvGNQaNb1jqTGaRplGikMOmx9Kmixu6dv1Veo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QHsKKMwGP18WsqNGBObxNHu/wRN2qzvaTMPP6VCByY/l1/dY9p7BMOCdN3lJW9zPz
	 fr9zo2x4dzUU8sEebR42jOwW/Z66FwdWXVTpvlSM6hOL8ouhtWjOHrbcc1HzUrweVS
	 CwRvhY6w9YNz4xyH0T+cn0bWSm0lGsUspT7ebhYs=
Message-ID: <340c811e-2501-46c3-8a55-19e955c5ae8a@arm.com>
Date: Wed, 27 May 2026 13:57:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-6-jiangwenxiaomi@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260522053146.83209-6-jiangwenxiaomi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_012812_426471_50619DC2 
X-CRM114-Status: GOOD (  25.47  )
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



On 22/05/26 11:01 am, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> In many cases, the pages passed to vmap() may include high-order
> pages. For example, the systemheap often allocates pages in descending
> order: order 8, then 4, then 0. Currently, vmap() iterates over every
> page individually—even pages inside a high-order block are handled
> one by one.
> 
> This patch detects physically contiguous pages (regardless of whether
> they are compound or non-compound) by scanning with
> num_pages_contiguous(), and maps them as a single contiguous block
> whenever possible. The first page's pfn must be aligned to the
> mapping order for the batched mapping to be used.
> 
> Pages with the same page_shift are coalesced and mapped via
> vmap_pages_range_noflush_walk() to avoid page table rewalk.
> 
> As users typically allocate memory in descending orders (e.g.
> 8 → 4 → 0), once an order-0 page is encountered, we stop scanning
> for contiguous pages since subsequent pages are likely order-0 as well.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Co-developed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index deb764abc0571..50642246f4d40 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3542,6 +3542,84 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int max_steps, unsigned int idx)
> +{
> +	unsigned int nr_contig;
> +	int order;
> +
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
> +			ioremap_max_page_shift == PAGE_SHIFT)


Why bail out on ioremap_max_page_shift == PAGE_SHIFT? The code
path for ioremap is different from vmap right?


> +		return 0;
> +
> +	nr_contig = num_pages_contiguous(&pages[idx], max_steps);
> +	if (nr_contig < 2)
> +		return 0;
> +
> +	order = fls(nr_contig) - 1;
> +
> +	if (arch_vmap_pte_supported_shift(PAGE_SIZE << order) == PAGE_SHIFT)
> +		return 0;
> +
> +	/* Ensure the first page's pfn is aligned to the order */
> +	if (!IS_ALIGNED(page_to_pfn(pages[idx]), 1 << order))
> +		return 0;
> +
> +	return order;
> +}
> +
> +static int vmap_batched(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages)
> +{
> +	unsigned int count = (end - addr) >> PAGE_SHIFT;
> +	unsigned int prev_shift = 0, idx = 0;
> +	unsigned long start = addr, map_addr = addr;
> +	int err;
> +
> +	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> +						PAGE_SHIFT, GFP_KERNEL);
> +	if (err)
> +		goto out;
> +
> +	for (unsigned int i = 0; i < count; ) {
> +		unsigned int shift = PAGE_SHIFT +
> +			get_vmap_batch_order(pages, count - i, i);
> +
> +		if (!i)
> +			prev_shift = shift;
> +
> +		if (shift != prev_shift) {
> +			err = vmap_pages_range_noflush_walk(map_addr, addr,

It would be worth documenting vmap_pages_range_noflush_walk() that
it can take an array of pages which are not all contiguous, but it
may have contiguous chunks, as hinted by page_shift.

Otherwise this looks good.

> +					prot, pages + idx,
> +					min(prev_shift, PMD_SHIFT));
> +			if (err)
> +				goto out;
> +			prev_shift = shift;
> +			map_addr = addr;
> +			idx = i;
> +		}
> +
> +		/*
> +		 * Once small pages are encountered, the remaining pages
> +		 * are likely small as well.
> +		 */
> +		if (shift == PAGE_SHIFT)
> +			break;
> +
> +		addr += 1UL << shift;
> +		i += 1U << (shift - PAGE_SHIFT);
> +	}
> +
> +	/* Remaining */
> +	if (map_addr < end)
> +		err = vmap_pages_range_noflush_walk(map_addr, end,
> +				prot, pages + idx, min(prev_shift, PMD_SHIFT));
> +
> +out:
> +	flush_cache_vmap(start, end);
> +	return err;
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3585,8 +3663,8 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	addr = (unsigned long)area->addr;
> -	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> -				pages, PAGE_SHIFT) < 0) {
> +	if (vmap_batched(addr, addr + size, pgprot_nx(prot),
> +				pages) < 0) {
>  		vunmap(area->addr);
>  		return NULL;
>  	}


