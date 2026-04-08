Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7081073CBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imGrul+C5vLlXrsDsW6/7MXfYzG50a3heIIE95FfoQc=; b=HODP3nGrSTBWRgi3j5Q5x+3HJV
	MgP5PZe1um/2hLYepexAqBWVaRyuSq5Z8cfQWgbCHLEHcJPJYOppxdoXtlEBrDPk4+Sj7BetJ7xJT
	X2PXjRd1W0Dk2QvI7ZlSeic3rD4bsaTr3z8a8xmiis/pK3RdtJJU2ClY59ES1DVKaD8rOgzyy/6zL
	R8SLncCZSxWrnM1O7VdbwyuMIOHw7LdVmHeXjG7I5c++p1Rgc8XaPEbHUnzGK6IBrIZTPSaD1HgnB
	QkppYX2vSdu9uGjkbLbj41fXtfvv1y37WHL0Y5hdUwt+wKIbngw21pHMuVxe4V3YGs+pj3TO2E2vI
	QxMJxb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATV4-00000008xxA-3gad;
	Wed, 08 Apr 2026 14:03:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATV2-00000008xwp-23Rm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 14:03:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB44A267F;
	Wed,  8 Apr 2026 07:03:12 -0700 (PDT)
Received: from [10.164.148.132] (unknown [10.164.148.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E27483F632;
	Wed,  8 Apr 2026 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775656998; bh=mBcTI6iP+yGZjitLw/2y8VAoswxzOV+GzQFjaDM+rJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uF9YVPoAWLM3ZMXDgsdRN7uBAZmC4m2DTAjbtsmHJSmKIqlnn0hpH/YV/zwN+CwCY
	 9Rv5VIummHWSwrF7YZboLxLu4ZY72hI3IuiMkoAaxfrPO3L6LgDecLOjy+RbhddIk4
	 kEdfUxyC3bvZI/toZbKG/FmOS94Lwrw731gFOf4Q=
Message-ID: <c54e12b0-1a35-48e1-b243-991de246a8ca@arm.com>
Date: Wed, 8 Apr 2026 19:33:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-6-baohua@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260408025115.27368-6-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_070320_605714_40AE8B4A 
X-CRM114-Status: GOOD (  25.86  )
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



On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> In many cases, the pages passed to vmap() may include high-order
> pages allocated with __GFP_COMP flags. For example, the systemheap
> often allocates pages in descending order: order 8, then 4, then 0.
> Currently, vmap() iterates over every page individually—even pages
> inside a high-order block are handled one by one.
> 
> This patch detects high-order pages and maps them as a single
> contiguous block whenever possible.
> 
> An alternative would be to implement a new API, vmap_sg(), but that
> change seems to be large in scope.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmalloc.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index eba436386929..e8dbfada42bc 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3529,6 +3529,53 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int max_steps, unsigned int idx)
> +{
> +	unsigned int nr_pages;
> +
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
> +			ioremap_max_page_shift == PAGE_SHIFT)
> +		return 0;
> +
> +	nr_pages = compound_nr(pages[idx]);
> +	if (nr_pages == 1 || max_steps < nr_pages)
> +		return 0;

This assumes that the page array passed to vmap() will have compound pages
if it is a higher order allocation.

See rb_alloc_aux_page(). It gets higher-order allocations without passing
GFP_COMP.

That is why my implementation does not assume anything about the property
of the pages.

Also it may be useful to do regression-testing for the common case of
vmap() with a single page (assuming it is common, I don't know), in
which case we may have to special case it.

My implementation requires opting in with VM_ALLOW_HUGE_VMAP - I suspect
you may run into problems if you make vmap() do huge-mappings as best-effort
by default. I am guessing this because ...

Drivers can operate on individual pages, so vmalloc() calls split_page()
and then does the block/cont mappings. This same issue should be present
with vmap() too? In which case if we are to do huge-mappings by default
then we can do split_page() after detecting contiguous chunks.

But ... that may create problems for the caller of vmap() - vmap now
has the changed the properties of the pages.


> +
> +	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
> +		return compound_order(pages[idx]);
> +	return 0;
> +}
> +
> +static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages)
> +{
> +	unsigned int count = (end - addr) >> PAGE_SHIFT;
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
> +		err = vmap_range_noflush(addr, addr + (1UL << shift),
> +				page_to_phys(pages[i]), prot, shift);
> +		if (err)
> +			goto out;
> +
> +		addr += 1UL << shift;
> +		i += 1U << (shift - PAGE_SHIFT);
> +	}
> +
> +out:
> +	flush_cache_vmap(addr, end);
> +	return err;
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3572,8 +3619,8 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	addr = (unsigned long)area->addr;
> -	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> -				pages, PAGE_SHIFT) < 0) {
> +	if (vmap_contig_pages_range(addr, addr + size, pgprot_nx(prot),
> +				pages) < 0) {
>  		vunmap(area->addr);
>  		return NULL;
>  	}


