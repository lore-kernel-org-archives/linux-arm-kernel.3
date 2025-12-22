Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EEEE6749B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/foXhPAufi6uRtrLX7dAC2wGmj4Wzh3PyX8slXMF67w=; b=4AjEvbJY1UQmDr677I1gzgcE4c
	WMmp8YixJYgHQtrA/LcTQuerk9DqHUN58+NfMcNcfqWyrsgMSLl7gPFyPTl4+TFrozgpU+x8cLZ5/
	q5f3Vv2cHcmtkqMD+UPN+kV5ipWhjpWhUgCTkcELkhlwiIhGweQR4DhYNmNd8j0k2sZtCu/2K0LnF
	w9lSaR2GmJ6EuXWX+W7r2n4Nw67Ievls2R68MuPGI26r8BLXdjPN7EFKFR2ONXuG0GWD5ev0inABX
	9Z0z+RRWxLgmXW0sGwHkxdb5JcDVmxQufNf3CLwrGW827bpufRK5tV57Yn981CS5VMpYzakQt6bcS
	/j/wXupQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeON-0000000DgQe-3lAP;
	Mon, 22 Dec 2025 11:47:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeOL-0000000DgPo-0pV9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 11:47:59 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-597d57d8bb3so3162573e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 03:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766404074; x=1767008874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/foXhPAufi6uRtrLX7dAC2wGmj4Wzh3PyX8slXMF67w=;
        b=ZvF5aW9KyoKcWS5rcYartRAVZ4xKTZ8eZ2Zijz7dt12+fE4KYW157pTySyACASeUHu
         nKEIlxTemn03N6m2GE2GOjaFKaBhztZZ7a6kw9bU+DGOparZFwdeE2Lt6HtFq68fAQ5i
         E1lISnjPB1LKWQw9oY+gmBDGZL8FhRvkdfvZgPiuGp0KoDQyuLsiCbNZwiNlHA9Yd/YN
         8GecAnXsYW+hVKaxmVf04M1GDzjwZt9vcyBbP5l+KzmaZCXcXyWF1qk6OQYByEXV8qaz
         J7em6CaBAIVDGK//tFE6bnaOq62mNJHW1f8oxbwiPIICxvveKfeaU2UHoLxy2mA9YUKQ
         AMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766404074; x=1767008874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/foXhPAufi6uRtrLX7dAC2wGmj4Wzh3PyX8slXMF67w=;
        b=mecGdeHbsJTYRqpPIg5hu3m+jpIzxPgPF2i8jWOkuuIsyJqo40O1Tl7rKWmDL+CllQ
         Y5CjS85+NqhIDJ9hd9QT0+POqFqplGmcW36B9to8sE8K0nkOCi2DbbvCKRUgM9Gp2xBZ
         NjXDdXON+r3er+BDpH7mjyxUjflsdnCPPg+o92Z6e5YooF6W1jwZ3X/TfgUyCQxsEj8L
         l0s8defamYxPini2F2MiOUm/nFDUz41fm0MfTFXjjLsR8s/1wed5M4IhK6NMnhMRU3yX
         RY9sTIixYd0vT/DHh0yD+EjmLI4bjhyJCRChrlHS/6dL/4NwexXrThwLNEDpU+xiav4A
         GkxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSqhnSmTSQxYlPd57VEO0cCqLALQSPFcv6JdgSdBRoIuUiDmGm7jDTXMcTC4WrGmyip89pJPztTxFT/wWuCbwK@lists.infradead.org
X-Gm-Message-State: AOJu0YzGL4ebDXYuvyxQvA2jLLHxzIwhrY7XUJAgfjVT0bXOXCc408rW
	43LmE0CMEnEELGGUHwm+vThTlPwm2MoDYS2Psp4KikMuwMGAm5d1b1VK
X-Gm-Gg: AY/fxX4mwzcFXI/h3fT4J9gW0b/7JRT/XLhVZWcmMWVijOoChdnqclBlOI+5A+0IPiO
	O3tB33GLCvD0V84p5HjQmqD7NCHh4n3Tq2yW1GFAXbYMLPxEUjgsRpoBQRBRn/10w6I5j3ZgxcG
	aVMjXuCDtmJapBn5z85AuRiYwSzrJ1S2ZpcXZPlWGUxaKhmJlEv4kRcuoq1NV3wMk589aBFuvsE
	4cZePai8xL/ovkIR92GimCQ4tsdKeLdU5AAe6jZRnLU/olN2kNUuDeA0VGLjV2hJzk9RjSRPt4/
	HLCxlXoTwRc7Wv3gjP9P9SToQms6eU6R/ylnsCiytemUj3RwnPA5QQD/8OuNwDW2dzeG7BX3J2v
	9Sjp3/RUlTmPDDZnKNIfW4SMpb7fTb5IB2GECPwqwr5w8FwSBghN8
X-Google-Smtp-Source: AGHT+IEsiLInHUpO0B9wn6rIRScWVJqdnac8pFBEVqqQC42l41Q+lmgzVoCpWhWhGmaRmpj1YynoXQ==
X-Received: by 2002:a05:6512:2388:b0:595:7e8e:3bc4 with SMTP id 2adb3069b0e04-59a17d5a4f1mr3593333e87.42.1766404073974;
        Mon, 22 Dec 2025 03:47:53 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5eccsm3157947e87.14.2025.12.22.03.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 03:47:53 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 22 Dec 2025 12:47:51 +0100
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com,
	akpm@linux-foundation.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	cem@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
	shijie@os.amperecomputing.com, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, npiggin@gmail.com, willy@infradead.org,
	david@kernel.org, ziy@nvidia.com
Subject: Re: [RESEND RFC PATCH 1/2] mm/vmalloc: Do not align size to huge size
Message-ID: <aUkv51yk8lgzW9jv@milan>
References: <20251212042701.71993-1-dev.jain@arm.com>
 <20251212042701.71993-2-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212042701.71993-2-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_034757_784910_0C3F618D 
X-CRM114-Status: GOOD (  37.65  )
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

On Fri, Dec 12, 2025 at 09:57:00AM +0530, Dev Jain wrote:
> vmalloc() consists of the following:
> 
> (1) find empty space in the vmalloc space -> (2) get physical pages from
> the buddy system -> (3) map the pages into the pagetable.
> 
> It turns out that the cost of (1) and (3) is pretty insignificant. Hence,
> the cost of vmalloc becomes highly sensitive to physical memory allocation
> time.
> 
> Currently, if we decide to use huge mappings, apart from aligning the start
> of the target vm_struct region to the huge-alignment, we also align the
> size. This does not seem to produce any benefit (apart from simplification
> of the code), and there is a clear disadvantage - as mentioned above, the
> main cost of vmalloc comes from its interaction with the buddy system, and
> thus requesting more memory than was requested by the caller is suboptimal
> and unnecessary.
> 
> This change is also motivated due to the next patch ("arm64/mm: Enable
> vmalloc-huge by default"). Suppose that some user of vmalloc maps 17 pages,
> uses that mapping for an extremely short time, and vfree's it. That patch,
> without this patch, on arm64 will ultimately map 16 * 2 = 32 pages in a
> contiguous way. Since the mapping is used for a very short time, it is
> likely that the extra cost of mapping 15 pages defeats any benefit from
> reduced TLB pressure, and regresses that code path. 
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/vmalloc.c | 38 ++++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ecbac900c35f..389225a6f7ef 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -654,7 +654,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
> -	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> +	unsigned int i, step, nr = (end - addr) >> PAGE_SHIFT;
>  
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
> @@ -662,7 +662,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  			page_shift == PAGE_SHIFT)
>  		return vmap_small_pages_range_noflush(addr, end, prot, pages);
>  
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> +	step = 1U << (page_shift - PAGE_SHIFT);
> +	for (i = 0; i < ALIGN_DOWN(nr, step); i += step) {
>  		int err;
>  
>  		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> @@ -673,8 +674,9 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  
>  		addr += 1UL << page_shift;
>  	}
> -
> -	return 0;
> +	if (IS_ALIGNED(nr, step))
> +		return 0;
> +	return vmap_small_pages_range_noflush(addr, end, prot, pages + i);
>  }
>  
Can we improve the readability?

<snip>
index 25a4178188ee..14ca019b57af 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -655,6 +655,8 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
                pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
        unsigned int i, step, nr = (end - addr) >> PAGE_SHIFT;
+       unsigned int nr_aligned;
+       unsigned long chunk_size;

        WARN_ON(page_shift < PAGE_SHIFT);

@@ -662,20 +664,24 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
                        page_shift == PAGE_SHIFT)
                return vmap_small_pages_range_noflush(addr, end, prot, pages);

-       step = 1U << (page_shift - PAGE_SHIFT);
-       for (i = 0; i < ALIGN_DOWN(nr, step); i += step) {
-               int err;
+       step = 1U << (page_shift - PAGE_SHIFT); /* small pages per huge chunk. */
+       nr_aligned = ALIGN_DOWN(nr, step);
+       chunk_size = 1UL << page_shift;

-               err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+       for (i = 0; i < nr_aligned; i += step) {
+               int err = vmap_range_noflush(addr, addr + chunk_size,
                                        page_to_phys(pages[i]), prot,
                                        page_shift);
                if (err)
                        return err;

-               addr += 1UL << page_shift;
+               addr += chunk_size;
        }
-       if (IS_ALIGNED(nr, step))
+
+       if (i == nr)
                return 0;
+
+       /* Map the tail using small pages. */
        return vmap_small_pages_range_noflush(addr, end, prot, pages + i);
 }
<snip>


>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> @@ -3197,7 +3199,7 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
>  	unsigned long requested_size = size;
>  
>  	BUG_ON(in_interrupt());
> -	size = ALIGN(size, 1ul << shift);
> +	size = PAGE_ALIGN(size);
>  	if (unlikely(!size))
>  		return NULL;
>  
> @@ -3353,7 +3355,7 @@ static void vm_reset_perms(struct vm_struct *area)
>  	 * Find the start and end range of the direct mappings to make sure that
>  	 * the vm_unmap_aliases() flush includes the direct map.
>  	 */
> -	for (i = 0; i < area->nr_pages; i += 1U << page_order) {
> +	for (i = 0; i < ALIGN_DOWN(area->nr_pages, 1U << page_order); i += (1U << page_order)) {
>
nr_blocks?

>  		unsigned long addr = (unsigned long)page_address(area->pages[i]);
>  
>  		if (addr) {
> @@ -3365,6 +3367,18 @@ static void vm_reset_perms(struct vm_struct *area)
>  			flush_dmap = 1;
>  		}
>  	}
> +	for (; i < area->nr_pages; ++i) {
> +		unsigned long addr = (unsigned long)page_address(area->pages[i]);
> +
> +		if (addr) {
> +			unsigned long page_size;
> +
> +			page_size = PAGE_SIZE;
> +			start = min(addr, start);
> +			end = max(addr + page_size, end);
> +			flush_dmap = 1;
> +		}
> +	}
>  
>  	/*
>  	 * Set direct map to something invalid so that it won't be cached if
> @@ -3673,6 +3687,7 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>  	 * more permissive.
>  	 */
>  	if (!order) {
> +single_page:
>  		while (nr_allocated < nr_pages) {
>  			unsigned int nr, nr_pages_request;
>  
> @@ -3704,13 +3719,18 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>  			 * If zero or pages were obtained partly,
>  			 * fallback to a single page allocator.
>  			 */
> -			if (nr != nr_pages_request)
> +			if (nr != nr_pages_request) {
> +				order = 0;
>  				break;
> +			}
>  		}
>  	}
>  
>  	/* High-order pages or fallback path if "bulk" fails. */
>  	while (nr_allocated < nr_pages) {
> +		if (nr_pages - nr_allocated < (1UL << order)) {
> +			goto single_page;
> +		}
>  		if (!(gfp & __GFP_NOFAIL) && fatal_signal_pending(current))
>  			break;
>
Yes, it requires more attention. That "goto single_page" should be
eliminated, IMO. We should not jump between blocks, logically the
single_page belongs to "order-0 alloc path".

Probably it requires more refactoring to simplify it.

>  
> @@ -5179,7 +5199,9 @@ static void show_numa_info(struct seq_file *m, struct vm_struct *v,
>  
>  	memset(counters, 0, nr_node_ids * sizeof(unsigned int));
>  
> -	for (nr = 0; nr < v->nr_pages; nr += step)
> +	for (nr = 0; nr < ALIGN_DOWN(v->nr_pages, step); nr += step)
> +		counters[page_to_nid(v->pages[nr])] += step;
> +	for (; nr < v->nr_pages; ++nr)
>  		counters[page_to_nid(v->pages[nr])] += step;
>
Can we fit it into one loop? Last tail loop continuous adding step?

--
Uladzislau Rezki

