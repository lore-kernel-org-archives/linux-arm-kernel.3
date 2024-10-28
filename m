Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02079D33998
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3P9AdqL8WDtEOm70qel3SKWXkh1M5NTB9TGNfoDxEH8=; b=CcmY05HJESwpSMPxtkpskNjrIp
	nyH3hH8Bvax5uEfXehdYsSl9wkPCp+75np6W1JDBDVTXBCzB5csmddLI7sRnbmnBFfcbcC7xpxZI6
	/7uu/+Aa7tvgIcWBb0cvS/PIGFhr4siAnNU4qi6fHA6H1yNUA+HSD3IZiavP+eGgkd5+S0YLCOpRH
	4Nzts8KN4IyDU+lUQpHrZp8IyKv8YkTGNByCv6DA1+gyi3vNCpVGR7xGnEj61pTFtLJ2RgXiAPjEn
	DaNwdMYR/jkr/rUvy4zELHtY0yopdQ/q2UA3G3YGe1w0+5Wi122/uK+aGNvcY58+l/6Bivdvq7AmV
	/RUoybsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RwY-0000000BMNM-0jY4;
	Mon, 28 Oct 2024 15:46:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RLS-0000000BFgg-2k2m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD4DBA4270F;
	Mon, 28 Oct 2024 15:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07A2C4CEC3;
	Mon, 28 Oct 2024 15:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730128068;
	bh=Ulujy5g3QG+j+pOrsmdYv9bJseb/YWtolA2hM9ZB1/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kN/DSLa9xzEUdkwYNukltvI0/VyWifB4opqaJ+D8yB0dGBzrnT+2zl4H/tlk1LAm7
	 M/evJFeCzkTtrWoIBSkAm2pMxrCge3Jgl3FjMX1o/jFHC0mlUoAH8ghYdWNSK4qzOh
	 5VmQw4t2+PyQFniEBiF/sEGCG/+48/sl7JN6cqWLXJubKx6MnBW2rxRKr6kCtD0XuR
	 HX5d88uUv6tvaQPn7W1o0bmHs0DCdRJVB1Z4sjn6vH7hmIhABfepHdbpuccyPQUt0Y
	 aQT/tXHGs+SLYg9NG2F8XXgn+Mz8Ti0iZ+vCdYndV7HMcORtOdC0vTppOGe6UIJ6SY
	 Gxq9uO/e6QmaQ==
Date: Mon, 28 Oct 2024 17:03:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Hildenbrand <david@redhat.com>, Will Deacon <will@kernel.org>,
	Alistair Popple <apopple@nvidia.com>,
	Jordan Niethe <jniethe@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kaslr: rename physmem_end and PHYSMEM_END to
 direct_map_physmem_end
Message-ID: <Zx-n262DWdvYP8Gt@kernel.org>
References: <20241009025024.89813-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009025024.89813-1-jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080750_846142_80A56823 
X-CRM114-Status: GOOD (  34.81  )
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

On Tue, Oct 08, 2024 at 07:50:24PM -0700, John Hubbard wrote:
> For clarity. It's increasingly hard to reason about the code, when KASLR
> is moving around the boundaries. In this case where KASLR is randomizing
> the location of the kernel image within physical memory, the maximum
> number of address bits for physical memory has not changed.
> 
> What has changed is the ending address of memory that is allowed to be
> directly mapped by the kernel.
> 
> Let's name the variable, and the associated macro accordingly.
> 
> Also, enhance the comment above the direct_map_physmem_end definition,
> to further clarify how this all works.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Jordan Niethe <jniethe@nvidia.com>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> 
> David Hildenbrand, I recall you had an unanswered question in this
> vicinity [1] when tglx's recent kaslr fix was being reviewed. Maybe this
> will help with that.

To David's question, physmem_end (and now direct_map_physmem_end) is
updated kernel_randomize_memory() via kaslr_regions[0].base
 
> 
> [1] https://lore.kernel.org/linux-mm/ee205448-5fdd-495e-9d7c-c8a2b59f9c9e@roeck-us.net/T/#mdf442f077c9023590e144dbed2b04a109793484d
> 
> thanks,
> John Hubbard
> 
> 
>  arch/arm64/include/asm/memory.h         |  2 +-
>  arch/x86/include/asm/page_64.h          |  2 +-
>  arch/x86/include/asm/pgtable_64_types.h |  2 +-
>  arch/x86/mm/init_64.c                   |  2 +-
>  arch/x86/mm/kaslr.c                     | 14 +++++++++-----
>  include/linux/mm.h                      |  6 +++---
>  kernel/resource.c                       |  4 ++--
>  mm/memory_hotplug.c                     |  2 +-
>  mm/sparse.c                             |  2 +-
>  9 files changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index 0480c61dbb4f..73eaa8c2536a 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -110,7 +110,7 @@
>  #define PAGE_END		(_PAGE_END(VA_BITS_MIN))
>  #endif /* CONFIG_KASAN */
>  
> -#define PHYSMEM_END		__pa(PAGE_END - 1)
> +#define DIRECT_MAP_PHYSMEM_END	__pa(PAGE_END - 1)
>  
>  #define MIN_THREAD_SHIFT	(14 + KASAN_THREAD_SHIFT)
>  
> diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
> index f3d257c45225..d63576608ce7 100644
> --- a/arch/x86/include/asm/page_64.h
> +++ b/arch/x86/include/asm/page_64.h
> @@ -17,7 +17,7 @@ extern unsigned long phys_base;
>  extern unsigned long page_offset_base;
>  extern unsigned long vmalloc_base;
>  extern unsigned long vmemmap_base;
> -extern unsigned long physmem_end;
> +extern unsigned long direct_map_physmem_end;
>  
>  static __always_inline unsigned long __phys_addr_nodebug(unsigned long x)
>  {
> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> index a98e53491a4e..ec68f8369bdc 100644
> --- a/arch/x86/include/asm/pgtable_64_types.h
> +++ b/arch/x86/include/asm/pgtable_64_types.h
> @@ -141,7 +141,7 @@ extern unsigned int ptrs_per_p4d;
>  #endif /* CONFIG_DYNAMIC_MEMORY_LAYOUT */
>  
>  #ifdef CONFIG_RANDOMIZE_MEMORY
> -# define PHYSMEM_END		physmem_end
> +# define DIRECT_MAP_PHYSMEM_END	direct_map_physmem_end
>  #endif
>  
>  /*
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index ff253648706f..5a564130b9d0 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -961,7 +961,7 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>  	unsigned long end = ((start_pfn + nr_pages) << PAGE_SHIFT) - 1;
>  	int ret;
>  
> -	if (WARN_ON_ONCE(end > PHYSMEM_END))
> +	if (WARN_ON_ONCE(end > DIRECT_MAP_PHYSMEM_END))
>  		return -ERANGE;
>  
>  	ret = __add_pages(nid, start_pfn, nr_pages, params);
> diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
> index 230f1dee4f09..70d3353c92fa 100644
> --- a/arch/x86/mm/kaslr.c
> +++ b/arch/x86/mm/kaslr.c
> @@ -52,7 +52,7 @@ static __initdata struct kaslr_memory_region {
>  } kaslr_regions[] = {
>  	{
>  		.base	= &page_offset_base,
> -		.end	= &physmem_end,
> +		.end	= &direct_map_physmem_end,
>  	},
>  	{
>  		.base	= &vmalloc_base,
> @@ -62,8 +62,12 @@ static __initdata struct kaslr_memory_region {
>  	},
>  };
>  
> -/* The end of the possible address space for physical memory */
> -unsigned long physmem_end __ro_after_init;
> +/*
> + * The end of the physical address space that can be mapped directly by the
> + * kernel. This starts out at (1<<MAX_PHYSMEM_BITS) - 1), but KASLR may reduce
> + * that in order to increase the available entropy for mapping other regions.
> + */
> +unsigned long direct_map_physmem_end __ro_after_init;
>  
>  /* Get size in bytes used by the memory region */
>  static inline unsigned long get_padding(struct kaslr_memory_region *region)
> @@ -94,7 +98,7 @@ void __init kernel_randomize_memory(void)
>  	BUILD_BUG_ON(vaddr_end > __START_KERNEL_map);
>  
>  	/* Preset the end of the possible address space for physical memory */
> -	physmem_end = ((1ULL << MAX_PHYSMEM_BITS) - 1);
> +	direct_map_physmem_end = ((1ULL << MAX_PHYSMEM_BITS) - 1);
>  	if (!kaslr_memory_enabled())
>  		return;
>  
> @@ -145,7 +149,7 @@ void __init kernel_randomize_memory(void)
>  		vaddr += get_padding(&kaslr_regions[i]);
>  		/*
>  		 * KASLR trims the maximum possible size of the
> -		 * direct-map. Update the physmem_end boundary.
> +		 * direct-map. Update the direct_map_physmem_end boundary.
>  		 * No rounding required as the region starts
>  		 * PUD aligned and size is in units of TB.
>  		 */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ecf63d2b0582..92c35fb60d18 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -97,11 +97,11 @@ extern const int mmap_rnd_compat_bits_max;
>  extern int mmap_rnd_compat_bits __read_mostly;
>  #endif
>  
> -#ifndef PHYSMEM_END
> +#ifndef DIRECT_MAP_PHYSMEM_END
>  # ifdef MAX_PHYSMEM_BITS
> -# define PHYSMEM_END	((1ULL << MAX_PHYSMEM_BITS) - 1)
> +# define DIRECT_MAP_PHYSMEM_END	((1ULL << MAX_PHYSMEM_BITS) - 1)
>  # else
> -# define PHYSMEM_END	(((phys_addr_t)-1)&~(1ULL<<63))
> +# define DIRECT_MAP_PHYSMEM_END	(((phys_addr_t)-1)&~(1ULL<<63))
>  # endif
>  #endif
>  
> diff --git a/kernel/resource.c b/kernel/resource.c
> index b730bd28b422..afa3ad09b834 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -1871,7 +1871,7 @@ static resource_size_t gfr_start(struct resource *base, resource_size_t size,
>  	if (flags & GFR_DESCENDING) {
>  		resource_size_t end;
>  
> -		end = min_t(resource_size_t, base->end, PHYSMEM_END);
> +		end = min_t(resource_size_t, base->end, DIRECT_MAP_PHYSMEM_END);
>  		return end - size + 1;
>  	}
>  
> @@ -1888,7 +1888,7 @@ static bool gfr_continue(struct resource *base, resource_size_t addr,
>  	 * @size did not wrap 0.
>  	 */
>  	return addr > addr - size &&
> -	       addr <= min_t(resource_size_t, base->end, PHYSMEM_END);
> +	       addr <= min_t(resource_size_t, base->end, DIRECT_MAP_PHYSMEM_END);
>  }
>  
>  static resource_size_t gfr_next(resource_size_t addr, resource_size_t size,
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 621ae1015106..c43b4e7fb298 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1681,7 +1681,7 @@ struct range __weak arch_get_mappable_range(void)
>  
>  struct range mhp_get_pluggable_range(bool need_mapping)
>  {
> -	const u64 max_phys = PHYSMEM_END;
> +	const u64 max_phys = DIRECT_MAP_PHYSMEM_END;
>  	struct range mhp_range;
>  
>  	if (need_mapping) {
> diff --git a/mm/sparse.c b/mm/sparse.c
> index dc38539f8560..4cb9793f0b52 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -129,7 +129,7 @@ static inline int sparse_early_nid(struct mem_section *section)
>  static void __meminit mminit_validate_memmodel_limits(unsigned long *start_pfn,
>  						unsigned long *end_pfn)
>  {
> -	unsigned long max_sparsemem_pfn = (PHYSMEM_END + 1) >> PAGE_SHIFT;
> +	unsigned long max_sparsemem_pfn = (DIRECT_MAP_PHYSMEM_END + 1) >> PAGE_SHIFT;
>  
>  	/*
>  	 * Sanity checks - do not allow an architecture to pass
> -- 
> 2.47.0
> 
> 

-- 
Sincerely yours,
Mike.

