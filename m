Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F79C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ63+ClY6OcJWX9ysYXFzf2rcrSbVsiqouN4m3wIEQQ=; b=GhwpR/k51RM3q6F9B3TjcoiTwS
	b3OhTdUl1m0fJ9a8g1y4GrajN/8fqrLBcmIhJHYiYhRVeKxyDwpyxe27IpOlY7uEGM2y7iKgDhbIu
	S4TsW1VHxQbDwHjx9MnX8jzVFwWGtqc8PV1Vj74rEoToQdj4XCSzzlXK95pM2DvexZQ6JWzvdDhSZ
	sxz6+k170JOgnXCvBwS/Se1rQqeKWWD4/GLX9500OOeDb0y5Z+M7Qna7xkIMc+VtDgBNKPQpf0god
	LgpPs8M37/hwFVC6IgbeOHTuyPi5uyq7hOWH++dZZGso43hfCqOd57lzB2JyHX16hRF5gtlMx7y8F
	aBIyIoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0eT-00000007NiZ-3KLF;
	Wed, 29 Jul 2026 09:32:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0eS-00000007NiB-1QIV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 09:32:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D6C3600B1;
	Wed, 29 Jul 2026 09:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE951F000E9;
	Wed, 29 Jul 2026 09:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785317555;
	bh=OZ63+ClY6OcJWX9ysYXFzf2rcrSbVsiqouN4m3wIEQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agYaSvIWAVylVBpeUol1lRZvfzrti5o8WbDuWlKrrwbYdr0dwifXMsGrmIlyHePPP
	 YyUYx7bvkZkm3NTlCUatW5WC8//OOLmb1h4P0nJAivd0tC01YefT5+jBuSmxUBbIqx
	 lZCAaSWFrJ0fDvQkeGy2oejHCSYrIfEcv0GdeWWvoahKvvdNSjO6ZPsRa/dzfDWMOU
	 R4sKlrkEC1w/6ufKoK+qGN9pNIfWgnXU58YOp+kjC4eKv+SyXrav4Yupo1+/PZbdeE
	 VCMOd+o3/AAkdy7vS8nsd9eHZR4xSq5YCOvLBnDvReNoEPVVnTWTUi+ghyJAG0Ew3f
	 0tqmc4P7eAPSA==
Date: Wed, 29 Jul 2026 10:32:20 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: cl@gentwo.org, dennis@kernel.org, tj@kernel.org, urezki@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, david@kernel.org, 
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/16] vmalloc: pass in pgd pointer for
 vmap{__vunmap}_range_noflush()
Message-ID: <amnIBsFnkt5Q2UUw@lucifer>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <20260715180455.515692-5-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715180455.515692-5-yang@os.amperecomputing.com>
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

On Wed, Jul 15, 2026 at 11:04:06AM -0700, Yang Shi wrote:
> vmap{__vunmap}_range_noflush() assume manipulate init_mm pgd.  The

It's not an assumption, it's a requirement.

There is now (and really should have always been) strictly a locking requirement
that the mm being manipulated is init_mm.

> following patch will map percpu local mapping into percpu page table by
> calling them, so the assumption will no longer stand.  Make them take
> pgd pointer as an parameter.

No, this isn't OK.

vmalloc is expressly for manipulating kernel mappings in init_mm.

>
> Also make vmap_range_noflush() non static, it will be called outside
> vmalloc in the following patch.

Hmm not loving the exposure of an internal function ehre.

>
> There is no functional change.
>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>

You're fundamentally changing something here, conceptually. I'm not sure why you
specifically need vmalloc to do it but it doesn't strike me as worthwhile for
what you're doing.

> ---
>  mm/internal.h    |  5 ++++-
>  mm/kmsan/hooks.c | 14 +++++++-------
>  mm/vmalloc.c     | 25 +++++++++++++------------
>  3 files changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 181e79f1d6a2..9d9f08cb26a1 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1552,10 +1552,13 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm);
>  int __must_check __vmap_pages_range_noflush(unsigned long addr,
>  			       unsigned long end, pgprot_t prot,
>  			       struct page **pages, unsigned int page_shift);
> +int __must_check vmap_range_noflush(pgd_t *pgdir, unsigned long addr,
> +			unsigned long end, phys_addr_t phys_addr,
> +			pgprot_t prot, unsigned int max_page_shift);
>
>  void vunmap_range_noflush(unsigned long start, unsigned long end);
>
> -void __vunmap_range_noflush(unsigned long start, unsigned long end);
> +void __vunmap_range_noflush(pgd_t *pgdir, unsigned long start, unsigned long end);
>
>  static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
>  {
> diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> index 8f22d1f22981..e2a0faf344b9 100644
> --- a/mm/kmsan/hooks.c
> +++ b/mm/kmsan/hooks.c
> @@ -135,8 +135,8 @@ static unsigned long vmalloc_origin(unsigned long addr)
>
>  void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
>  {
> -	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end));
> -	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end));
> +	__vunmap_range_noflush(init_mm.pgd, vmalloc_shadow(start), vmalloc_shadow(end));
> +	__vunmap_range_noflush(init_mm.pgd, vmalloc_origin(start), vmalloc_origin(end));
>  	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
>  	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
>  }
> @@ -181,7 +181,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
>  			vmalloc_origin(start + off + PAGE_SIZE), prot, &origin,
>  			PAGE_SHIFT);
>  		if (mapped) {
> -			__vunmap_range_noflush(
> +			__vunmap_range_noflush(init_mm.pgd,
>  				vmalloc_shadow(start + off),
>  				vmalloc_shadow(start + off + PAGE_SIZE));
>  			err = mapped;
> @@ -203,10 +203,10 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
>  			__free_pages(shadow, 1);
>  		if (origin)
>  			__free_pages(origin, 1);
> -		__vunmap_range_noflush(
> +		__vunmap_range_noflush(init_mm.pgd,
>  			vmalloc_shadow(start),
>  			vmalloc_shadow(start + clean * PAGE_SIZE));
> -		__vunmap_range_noflush(
> +		__vunmap_range_noflush(init_mm.pgd,
>  			vmalloc_origin(start),
>  			vmalloc_origin(start + clean * PAGE_SIZE));
>  	}
> @@ -233,8 +233,8 @@ void kmsan_iounmap_page_range(unsigned long start, unsigned long end)
>  	     i++, v_shadow += PAGE_SIZE, v_origin += PAGE_SIZE) {
>  		shadow = kmsan_vmalloc_to_page_or_null((void *)v_shadow);
>  		origin = kmsan_vmalloc_to_page_or_null((void *)v_origin);
> -		__vunmap_range_noflush(v_shadow, vmalloc_shadow(end));
> -		__vunmap_range_noflush(v_origin, vmalloc_origin(end));
> +		__vunmap_range_noflush(init_mm.pgd, v_shadow, vmalloc_shadow(end));
> +		__vunmap_range_noflush(init_mm.pgd, v_origin, vmalloc_origin(end));
>  		if (shadow)
>  			__free_pages(shadow, 1);
>  		if (origin)
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 1afca3568b9b..17c26e9796b2 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -295,9 +295,9 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>  	return err;
>  }
>
> -static int vmap_range_noflush(unsigned long addr, unsigned long end,
> -			phys_addr_t phys_addr, pgprot_t prot,
> -			unsigned int max_page_shift)
> +int vmap_range_noflush(pgd_t *pgdir, unsigned long addr, unsigned long end,
> +		       phys_addr_t phys_addr, pgprot_t prot,
> +		       unsigned int max_page_shift)
>  {
>  	pgd_t *pgd;
>  	unsigned long start;
> @@ -314,7 +314,7 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
>  	BUG_ON(addr >= end);
>
>  	start = addr;
> -	pgd = pgd_offset_k(addr);
> +	pgd = pgd_offset_pgd(pgdir, addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
>  		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
> @@ -334,8 +334,8 @@ int vmap_page_range(unsigned long addr, unsigned long end,
>  {
>  	int err;
>
> -	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> -				 ioremap_max_page_shift);
> +	err = vmap_range_noflush(init_mm.pgd, addr, end, phys_addr,
> +				 pgprot_nx(prot), ioremap_max_page_shift);
>  	flush_cache_vmap(addr, end);
>  	if (!err)
>  		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> @@ -478,7 +478,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>   *
>   * This is an internal function only. Do not use outside mm/.
>   */
> -void __vunmap_range_noflush(unsigned long start, unsigned long end)
> +void __vunmap_range_noflush(pgd_t *pgdir, unsigned long start, unsigned long end)
>  {
>  	unsigned long next;
>  	pgd_t *pgd;
> @@ -486,7 +486,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>  	pgtbl_mod_mask mask = 0;
>
>  	BUG_ON(addr >= end);
> -	pgd = pgd_offset_k(addr);
> +	pgd = pgd_offset_pgd(pgdir, addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_bad(*pgd))
> @@ -503,7 +503,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>  void vunmap_range_noflush(unsigned long start, unsigned long end)
>  {
>  	kmsan_vunmap_range_noflush(start, end);
> -	__vunmap_range_noflush(start, end);
> +	__vunmap_range_noflush(init_mm.pgd, start, end);
>  }
>
>  /**
> @@ -670,9 +670,10 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
>  		int err;
>
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> -					page_to_phys(pages[i]), prot,
> -					page_shift);
> +		err = vmap_range_noflush(init_mm.pgd, addr,
> +					 addr + (1UL << page_shift),
> +					 page_to_phys(pages[i]), prot,
> +					 page_shift);
>  		if (err)
>  			return err;
>
> --
> 2.47.0
>
>
>

Cheers, Lorenzo

