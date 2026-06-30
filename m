Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3EFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eNIJQnRMK2SdmmUofdTI44ZDndAOS8N0eRrZb61g0Q=; b=a7uspd4SQl834dHTzmVkuxzKw0
	+MJImMG2seEta3vxXt6+AG5chXSSuWawOsn/dddCmk/zYAfyU7RcrSm7dn7qo1YBM1u1IT2p5v80A
	mbabSJ1fpca4S35ajYJ3hrFn2sBxLYNdx9fQ4E2daTwvRiXtrGybsC4hHQDP9ba3P2UZFJtVaWQ1W
	NDd6PF+b7bCmoYGi6YYSQgJ6KabkvS6672t8agyEiWeGcE3p0RvQ4ZrmUH6YQ8aP32poYq9BHLf/X
	l7mryH0fRgWFT0nszZ4OOElkrb2lp7Ald9cjFGs1PJkac/PcoqN9ShhR8/Bv2uq/x7En4z7CzZr+t
	rDXbB2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYv5-0000000HDeu-2SWF;
	Tue, 30 Jun 2026 13:54:35 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYv1-0000000HDdk-3zMI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:54:33 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so2540563e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827667; x=1783432467; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8eNIJQnRMK2SdmmUofdTI44ZDndAOS8N0eRrZb61g0Q=;
        b=D2+rQf7ghE2CLayOL7h8QHVugiEtgXpyaUfkDDTjYloPtHTuo+YjW2iIm4rJGRuegl
         0DDnbmOtPN9R8FrVKe5X/hFba0PHlqHVPCTIPziTHs/KRrK+ZgRNG08EC1vDZ3as5vT2
         pll8OR0cjmXqxhrufWlwuNVnnKeU/cMk4gBn7mvCySC3izFtnnWjRPj0uvjNQ/WVjnRm
         5fChRSXnx4fDKDJz2p0w603sLLEzzk2RNaFyKqWAKVCMGJOfszbV8oq1lWbx0uVtWbac
         PeqRh3D6wgCGaZuYRXpyiB1mixRnXHxTCZrCnn5vwQTX0zYj1lP9EaKBjRRBAybVHcRF
         h68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827667; x=1783432467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eNIJQnRMK2SdmmUofdTI44ZDndAOS8N0eRrZb61g0Q=;
        b=XqGkxLYeZWJl2Vte5x0qZ4L8iRxYLIAxjqfFVjqzU86ni4GPP5KTfFQdKl+4jByau1
         LAzl79XWZZFRUxzE/610pw6flYNVCycGRXsqSVlaamUbEf56/jNuxjBji5C9uGnEGKW4
         tNaF74YXPkK/IZbnUf7rOHP2Pc26xRj0WRH31eh63m0cGKU3Qpr+HQ04asm/a1nw6a+V
         p9GWVuglSV65f82LMDHphOzJvEwxjmwx+28kofxownKhS0GI297N6jxfTek0/lrbqkEw
         BOPLqhCSahkltSulAe6/tL/tNl3sD++MwPgLcKdbz+Sfk7hFkK4Qm/HYFM5kHRUwnmMY
         G9EQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtCjtjEMEgmrp+wloIAIAC0ZgrBU3H9VfXEyFx8R6jwEwlG5GE9VrQR8Rg4MNbQ5jrBV2ZfwNRbwbp7d7P9rzR@lists.infradead.org
X-Gm-Message-State: AOJu0YzUbpFOegYgg6RpMfTN8sBaq5qL3iDt1VjQy+k1znBWdTDatnS0
	V1rJKrstjDCKw42UPX861cKXmsD+6mxx28i5ce6eZM+tiFMRYS0bRBvz
X-Gm-Gg: AfdE7clRL6HTr30a3fDwjTitQNTXrHqQehVJDghJ548u0C81+MiyvPDCwTnkWT/HopN
	XIIklmxeJa6qisAPOor/qyK0goNL7rov9FMy+cZcsaYFfjJyxAwT+qol+r/iKci79X6dRLSvCyd
	lCnigRrtjKmUnoO6DjdSRuGMTVpClSPF7A3zNaDz3k9v18umf5MLxNuLWG0g/72oyJoKQn5g3BW
	0z7h8i9oROwm8Z7yLTH9JVoSOQJ8Y1xyEIMOKUa5rc9gryXoIz9Nxkw5WVJ+DmobPeS+xnkqa61
	8x1jrb/L/bOFsEPXOo+EEbISPRi/UHZCwJw3E9jnJ18pEqQsqOzI+6azg+WMR2835yyCrdXax9t
	SNVUNvy5CW94EMZ140uKY7LWvrTBaAro8nk7Pot29yqM89/MMTcRW2Q==
X-Received: by 2002:a05:6512:3410:b0:5ae:bf5c:bdc5 with SMTP id 2adb3069b0e04-5aebf5cbec4mr644835e87.52.1782827666670;
        Tue, 30 Jun 2026 06:54:26 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe344f03sm593321e87.30.2026.06.30.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:54:26 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 30 Jun 2026 15:54:24 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com
Subject: Re: [PATCH v4 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
Message-ID: <akPKkOt_GNbAbyN5@milan>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-6-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260618084726.1070022-6-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_065432_029249_5EED2022 
X-CRM114-Status: GOOD (  26.87  )
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

On Thu, Jun 18, 2026 at 04:47:25PM +0800, Wen Jiang wrote:
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
> whenever possible. The mapping order is determined by taking the
> minimum of the contiguous page count and the pfn alignment, allowing
> graceful degradation when pfn alignment is less than the contiguous
> range.
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
>  mm/vmalloc.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 253e017130e09..fffb885cb2158 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3545,6 +3545,89 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>  
> +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> +{
> +	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> +		return PMD_SHIFT;
> +
> +	return arch_vmap_pte_supported_shift(size);
> +}
> +
> +static inline int get_vmap_batch_order(struct page **pages,
> +		pgprot_t prot, unsigned int max_steps, unsigned int idx)
> +{
> +	unsigned int nr_contig;
> +	int order;
> +
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +		return 0;
> +
> +	nr_contig = num_pages_contiguous(&pages[idx], max_steps);
> +	if (nr_contig < 2)
> +		return 0;
> +
> +	order = ilog2(nr_contig);
> +
> +	/* Limit order by pfn alignment */
> +	order = min_t(int, order, __ffs(page_to_pfn(pages[idx])));
> +
> +	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
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
> +			get_vmap_batch_order(pages, prot, count - i, i);
> +
> +		if (!i)
> +			prev_shift = shift;
> +
> +		if (shift != prev_shift) {
> +			err = vmap_pages_range_noflush_walk(map_addr, addr,
> +					prot, pages + idx, prev_shift);
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
> +				prot, pages + idx, prev_shift);
> +
> +out:
> +	flush_cache_vmap(start, end);
> +	return err;
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3588,8 +3671,8 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	addr = (unsigned long)area->addr;
> -	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> -				pages, PAGE_SHIFT) < 0) {
> +	if (vmap_batched(addr, addr + size, pgprot_nx(prot),
> +				pages) < 0) {
>
Better naming? vmap_pages_range_batched()?

--
Uladzislau Rezki

