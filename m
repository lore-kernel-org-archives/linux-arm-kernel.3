Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F226BC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 19:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kNqOTPkZp3J7RemsYmMnYNi7t0didLL0edZoqZbuyw=; b=YmwMOlQD5C5HGI7lyQCcahgy8g
	LSJWM63A0a1hoH73+gmLZPzNMz2gVoBTgyNTWqpoFXJkLqoXEwljZt04876rhGqUhthifrFrukZSq
	/qnlWkh2n9ojNgBlaWgJeFlDgpJQ+jFqU1ddVHNpFvaF4IJB9qD48Qf/gePmqJqIU1yqHdLe7irMr
	ao03ag4iEECXpYlJPwCnbu7FODXtIzJHDXmP/XNa6yjRij32wQu2pWl4c20qKgpxpHZSzMk3zN8i9
	+//BLkV1UrQvww9LNOTRd45Ax8JHZG5bsSg7TnHp/GlVc4e550NgtkwjANEzAdLeNJackQOlQizI7
	b/tvXcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3IcF-00000005VeB-1cg6;
	Sun, 06 Sep 2026 19:33:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3IcE-00000005Ve1-053G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 19:33:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24BB3601F9;
	Sun,  6 Sep 2026 19:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2B71F00A3A;
	Sun,  6 Sep 2026 19:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788723200;
	bh=0kNqOTPkZp3J7RemsYmMnYNi7t0didLL0edZoqZbuyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UOQ+l3C3lLujBRXFNmIZbndVsdbScZNJL6O1tqSdqMjmQrjL6ZYziJuWgml1fG0Sf
	 YZjhOpebC9esQLeWBd/jXa9dy1aBOGM9VUfFMdkM1pq8Z2PBJM6ySVz5xzTC6IWHcr
	 hUPG4TiNf0iGjXu2vtdIdxNSmSj85hQyuGO+G/8KJIYORUlSuKuQuG/X9RChqR/x9Y
	 DsHFniEg6Ij/QnQKTcdYooZxqdcI9V1/aRc3LxVfuVuJOyhGvQIWOkfgrAxuFPAZe2
	 vs5e1PdKfZ70Pm/jfgXnCkSDYJMr9D6/FyFbnT3DbR7iuUbU7GjmYCz5kkL2F0VMoz
	 puMLclabJJmcQ==
Date: Sun, 6 Sep 2026 22:33:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap2_926WXr7uAYVX@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-2-vdonnefort@google.com>
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

On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> Keeping last-level mappings is interesting on some architectures as it
> allows mapping/unmapping pages from the kernel direct map without the
> risk of splitting blocks which, under the break-before-make rule, may
> trigger page-faults the kernel can't handle.
> 
> However, mapping the entire direct map at PTE-level is costly. So
> instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system

I believe MEMBLOCK_PTE_MAP sounds more descriptive.

> to decide which region must be covered by mappings up to the last-level.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index d62db9e776cf..d40a5ded188d 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -52,6 +52,7 @@ extern unsigned long long max_possible_pfn;
>   * kernel that we know is good to use. It is the only memory that
>   * allocations may happen from in this phase.
>   * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
> + * @MEMBLOCK_LLMAP: memory region to be mapped using last-level mapping
>   */
>  enum memblock_flags {
>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
> @@ -63,6 +64,7 @@ enum memblock_flags {
>  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
>  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
>  	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
> +	MEMBLOCK_LLMAP		= 0x100,/* last-level mapping */
>  };
>  
>  /**
> @@ -160,6 +162,8 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
>  int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
>  int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
>  int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
> +int memblock_mark_llmap(phys_addr_t base, phys_addr_t size);
> +int memblock_clear_llmap(phys_addr_t base, phys_addr_t size);
>  
>  void memblock_free(void *ptr, size_t size);
>  void reset_all_zones_managed_pages(void);
> @@ -306,6 +310,11 @@ static inline bool memblock_is_kho_scratch(struct memblock_region *m)
>  	return m->flags & MEMBLOCK_KHO_SCRATCH;
>  }
>  
> +static inline bool memblock_is_llmap(struct memblock_region *m)
> +{
> +	return m->flags & MEMBLOCK_LLMAP;
> +}
> +
>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>  			    unsigned long  *end_pfn);
>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 9ce86349a29f..1591b50503ed 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1119,6 +1119,16 @@ int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
>   */
>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t size)
>  {
> +	struct memblock_region *r;
> +
> +	memblock_cap_size(base, &size);
> +
> +	for_each_mem_region(r) {
> +		if (memblock_is_llmap(r) &&
> +		    memblock_addrs_overlap(base, size, r->base, r->size))
> +			return -EINVAL;
> +	}

I'm not very fond of implicit skips here. memblock has no idea what's the
caller intention, maybe it actually wants to change the memory from nomap
to pte-mapped.

I'd rather warn in memblock_is_nomap() and memblock_is_llmap() if they both
are set and let the caller deal with making sure they are not.

> +
>  	return memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_NOMAP);
>  }
>  
> @@ -1204,6 +1214,45 @@ __init int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
>  				    MEMBLOCK_KHO_SCRATCH);
>  }
>  
> +/**
> + * memblock_mark_llmap - Mark a memory region with flag MEMBLOCK_LLMAP.
> + * @base: the base phys addr of the region
> + * @size: the size of the region
> + *
> + * If supported by the architecture, such region is mapped at the last-level in
> + * the kernel direct map.
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int __init_memblock memblock_mark_llmap(phys_addr_t base, phys_addr_t size)
> +{
> +	struct memblock_region *r;
> +
> +	memblock_cap_size(base, &size);
> +
> +	for_each_mem_region(r) {
> +		if (memblock_is_nomap(r) &&
> +		    memblock_addrs_overlap(base, size, r->base, r->size))
> +			return -EINVAL;
> +	}

same here

> +
> +	return memblock_setclr_flag(&memblock.memory, base, size, 1,
> +				    MEMBLOCK_LLMAP);
> +}
> +
> +/**
> + * memblock_clear_llmap - Clear flag MEMBLOCK_LLMAP for a specified region.
> + * @base: the base phys addr of the region
> + * @size: the size of the region
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int __init_memblock memblock_clear_llmap(phys_addr_t base, phys_addr_t size)
> +{
> +	return memblock_setclr_flag(&memblock.memory, base, size, 0,
> +				    MEMBLOCK_LLMAP);
> +}
> +
>  static bool should_skip_region(struct memblock_type *type,
>  			       struct memblock_region *m,
>  			       int nid, int flags)
> @@ -2886,6 +2935,7 @@ static const char * const flagname[] = {
>  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
> +	[ilog2(MEMBLOCK_LLMAP)] = "LLMAP",
>  };
>  
>  static int memblock_debug_show(struct seq_file *m, void *private)
> -- 
> 2.55.0.970.g62bdec98f9-goog
> 

-- 
Sincerely yours,
Mike.

