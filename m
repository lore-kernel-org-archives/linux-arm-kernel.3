Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D32C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9znuLwMG7/bwbWiZGynguB+oJV4iL4W2VVgKTamDp8=; b=EQEBUgpLBrov/hkhUimWgH9hdY
	GCw/pS/cE7TwcFCgCP6jwK0btXOJTL6mbzQbTCPwCdUKSszoTDd5YfkjUYWJxXmUb4jlkKyLgqbBF
	sz1E21mDStS38bQoSmfr+G8OINiOlVMpAJKb4dHv2KPTpPQiD5kg2Twqo3qGMzzEmTpTLtzlbJGT6
	jQ1jAuyDqQz9jvUQeHYXFrIsIa5/0beeMit8ykuPKK01kJfexwCfbQL85V0K2Dqv1YikRM+YaE7oe
	GXHcKoXlSBP2O8ISBT4nEs7MJc3nSzzEHr6SBPsXWg8G5FYYCRp/3fwSD4gJCuloWZKtw2YKynUDg
	XoADOk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFUW-00000001y23-1La1;
	Tue, 04 Aug 2026 13:47:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFUU-00000001y1Y-1yM3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:47:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E338E60A75;
	Tue,  4 Aug 2026 13:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314DF1F000E9;
	Tue,  4 Aug 2026 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785851253;
	bh=p9znuLwMG7/bwbWiZGynguB+oJV4iL4W2VVgKTamDp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ow6k0OgbNlWxz6A+WOV7j/Pcr593FXte0NU7P4xA6WBHih0UuTl/E+UNqNo0GI59C
	 4dDc3+77Q4elBRJ2ntrlK3P2GAmBsdCq8kKYaqjUzR3SzEBxJuZmwRXbyFDeo+nbFt
	 8G90MTxz2DxafhjA/UY+PABxcrlOSed7NByg4NRJSwZe19Mo9y8CAfACxTHod0fWJD
	 +pPX5o/+bXmtKbRbtS+SKT46SU7Ea/OJKPFIBeqp8AGfq0UJm1EWYCA62knc8cni2f
	 cQoUVtqSdg3rtllZUSLyBbpeWV4tJoiUT0PLA4qfW0fmvvR+BpFMyLIWxRoMog2E8i
	 2os1Z8BVW/vEg==
Date: Tue, 4 Aug 2026 14:47:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: cl@gentwo.org, dennis@kernel.org, tj@kernel.org, urezki@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, david@kernel.org, 
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/16] vmalloc: pass in pgd pointer for
 vmap{__vunmap}_range_noflush()
Message-ID: <anHqZbo87H1hpC7V@lucifer>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <20260715180455.515692-5-yang@os.amperecomputing.com>
 <amnIBsFnkt5Q2UUw@lucifer>
 <64d83bb0-b19c-47cd-94db-34ac99686ed0@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64d83bb0-b19c-47cd-94db-34ac99686ed0@os.amperecomputing.com>
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

On Mon, Aug 03, 2026 at 12:12:03PM -0700, Yang Shi wrote:
>
>
> On 7/29/26 2:32 AM, Lorenzo Stoakes (ARM) wrote:
> > On Wed, Jul 15, 2026 at 11:04:06AM -0700, Yang Shi wrote:
> > > vmap{__vunmap}_range_noflush() assume manipulate init_mm pgd.  The
> > It's not an assumption, it's a requirement.
> >
> > There is now (and really should have always been) strictly a locking requirement
> > that the mm being manipulated is init_mm.
> >
> > > following patch will map percpu local mapping into percpu page table by
> > > calling them, so the assumption will no longer stand.  Make them take
> > > pgd pointer as an parameter.
> > No, this isn't OK.
> >
> > vmalloc is expressly for manipulating kernel mappings in init_mm.
>
> This commit message may be a little bit misleading. vmalloc still

It is - it's worse than that implies :) as you're actually allowing arbitrary
mm's to be manipulated.

> manipulates init_mm all the time. The percpu allocator uses some vmalloc
> APIs to map memory. So the APIs used by percpu allocator needs to manipulate
> percpu page table when mapping memory for the new percpu area added by the
> following patches. So percpu pgd is just used when mapping the specific
> percpu area by percpu allocator.

Yup I understand all that, but my objection remains the same. You're essentially
hacking something in to the vmalloc code which adds complexity and confusion.

(The correct version of this, assuming the per-CPU page table stuff was
acceptable, would be to separate out common code and have vmalloc and the
per-CPU page table stuff use the common code :)

>
> >
> > > Also make vmap_range_noflush() non static, it will be called outside
> > > vmalloc in the following patch.
> > Hmm not loving the exposure of an internal function ehre.
>
> The RFC reused and extended the vmalloc APIs. We don't have to do so if it
> is not preferred. I think I can create some percpu allocator specific APIs
> to manipulate percpu area mapping with percpu pgd.
>
> >
> > > There is no functional change.
> > >
> > > Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> > You're fundamentally changing something here, conceptually. I'm not sure why you
> > specifically need vmalloc to do it but it doesn't strike me as worthwhile for
> > what you're doing.
>
> The percpu allocator uses vmalloc APIs to map percpu variables currently. So
> the patch extended it to take pgd pointer as an extra parameter. This helped
> to reduce duplicate code. I can add percpu specific APIs if extending the
> APIs doesn't make too much sense.

I mean again, the correct version of this would be to separate out common code
and refactor etc. etc.

But yes, I'd rather the vmalloc code is left as-is. Doing what you're proposing
in this patch adds complexity and confusion as to whether remote mm's can be
updated.

(Overall my impression is that the per-CPU page table approach isn't something
Linus wants and there's push back from the commnity, so maybe worth discussing
the approach in general first rather than respinning?)

>
> Thanks,
> Yang
>
> >
> > > ---
> > >   mm/internal.h    |  5 ++++-
> > >   mm/kmsan/hooks.c | 14 +++++++-------
> > >   mm/vmalloc.c     | 25 +++++++++++++------------
> > >   3 files changed, 24 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/mm/internal.h b/mm/internal.h
> > > index 181e79f1d6a2..9d9f08cb26a1 100644
> > > --- a/mm/internal.h
> > > +++ b/mm/internal.h
> > > @@ -1552,10 +1552,13 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm);
> > >   int __must_check __vmap_pages_range_noflush(unsigned long addr,
> > >   			       unsigned long end, pgprot_t prot,
> > >   			       struct page **pages, unsigned int page_shift);
> > > +int __must_check vmap_range_noflush(pgd_t *pgdir, unsigned long addr,
> > > +			unsigned long end, phys_addr_t phys_addr,
> > > +			pgprot_t prot, unsigned int max_page_shift);
> > >
> > >   void vunmap_range_noflush(unsigned long start, unsigned long end);
> > >
> > > -void __vunmap_range_noflush(unsigned long start, unsigned long end);
> > > +void __vunmap_range_noflush(pgd_t *pgdir, unsigned long start, unsigned long end);
> > >
> > >   static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
> > >   {
> > > diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
> > > index 8f22d1f22981..e2a0faf344b9 100644
> > > --- a/mm/kmsan/hooks.c
> > > +++ b/mm/kmsan/hooks.c
> > > @@ -135,8 +135,8 @@ static unsigned long vmalloc_origin(unsigned long addr)
> > >
> > >   void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
> > >   {
> > > -	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end));
> > > -	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end));
> > > +	__vunmap_range_noflush(init_mm.pgd, vmalloc_shadow(start), vmalloc_shadow(end));
> > > +	__vunmap_range_noflush(init_mm.pgd, vmalloc_origin(start), vmalloc_origin(end));
> > >   	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
> > >   	flush_cache_vmap(vmalloc_origin(start), vmalloc_origin(end));
> > >   }
> > > @@ -181,7 +181,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
> > >   			vmalloc_origin(start + off + PAGE_SIZE), prot, &origin,
> > >   			PAGE_SHIFT);
> > >   		if (mapped) {
> > > -			__vunmap_range_noflush(
> > > +			__vunmap_range_noflush(init_mm.pgd,
> > >   				vmalloc_shadow(start + off),
> > >   				vmalloc_shadow(start + off + PAGE_SIZE));
> > >   			err = mapped;
> > > @@ -203,10 +203,10 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
> > >   			__free_pages(shadow, 1);
> > >   		if (origin)
> > >   			__free_pages(origin, 1);
> > > -		__vunmap_range_noflush(
> > > +		__vunmap_range_noflush(init_mm.pgd,
> > >   			vmalloc_shadow(start),
> > >   			vmalloc_shadow(start + clean * PAGE_SIZE));
> > > -		__vunmap_range_noflush(
> > > +		__vunmap_range_noflush(init_mm.pgd,
> > >   			vmalloc_origin(start),
> > >   			vmalloc_origin(start + clean * PAGE_SIZE));
> > >   	}
> > > @@ -233,8 +233,8 @@ void kmsan_iounmap_page_range(unsigned long start, unsigned long end)
> > >   	     i++, v_shadow += PAGE_SIZE, v_origin += PAGE_SIZE) {
> > >   		shadow = kmsan_vmalloc_to_page_or_null((void *)v_shadow);
> > >   		origin = kmsan_vmalloc_to_page_or_null((void *)v_origin);
> > > -		__vunmap_range_noflush(v_shadow, vmalloc_shadow(end));
> > > -		__vunmap_range_noflush(v_origin, vmalloc_origin(end));
> > > +		__vunmap_range_noflush(init_mm.pgd, v_shadow, vmalloc_shadow(end));
> > > +		__vunmap_range_noflush(init_mm.pgd, v_origin, vmalloc_origin(end));
> > >   		if (shadow)
> > >   			__free_pages(shadow, 1);
> > >   		if (origin)
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 1afca3568b9b..17c26e9796b2 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -295,9 +295,9 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
> > >   	return err;
> > >   }
> > >
> > > -static int vmap_range_noflush(unsigned long addr, unsigned long end,
> > > -			phys_addr_t phys_addr, pgprot_t prot,
> > > -			unsigned int max_page_shift)
> > > +int vmap_range_noflush(pgd_t *pgdir, unsigned long addr, unsigned long end,
> > > +		       phys_addr_t phys_addr, pgprot_t prot,
> > > +		       unsigned int max_page_shift)
> > >   {
> > >   	pgd_t *pgd;
> > >   	unsigned long start;
> > > @@ -314,7 +314,7 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
> > >   	BUG_ON(addr >= end);
> > >
> > >   	start = addr;
> > > -	pgd = pgd_offset_k(addr);
> > > +	pgd = pgd_offset_pgd(pgdir, addr);
> > >   	do {
> > >   		next = pgd_addr_end(addr, end);
> > >   		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
> > > @@ -334,8 +334,8 @@ int vmap_page_range(unsigned long addr, unsigned long end,
> > >   {
> > >   	int err;
> > >
> > > -	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> > > -				 ioremap_max_page_shift);
> > > +	err = vmap_range_noflush(init_mm.pgd, addr, end, phys_addr,
> > > +				 pgprot_nx(prot), ioremap_max_page_shift);
> > >   	flush_cache_vmap(addr, end);
> > >   	if (!err)
> > >   		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> > > @@ -478,7 +478,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
> > >    *
> > >    * This is an internal function only. Do not use outside mm/.
> > >    */
> > > -void __vunmap_range_noflush(unsigned long start, unsigned long end)
> > > +void __vunmap_range_noflush(pgd_t *pgdir, unsigned long start, unsigned long end)
> > >   {
> > >   	unsigned long next;
> > >   	pgd_t *pgd;
> > > @@ -486,7 +486,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
> > >   	pgtbl_mod_mask mask = 0;
> > >
> > >   	BUG_ON(addr >= end);
> > > -	pgd = pgd_offset_k(addr);
> > > +	pgd = pgd_offset_pgd(pgdir, addr);
> > >   	do {
> > >   		next = pgd_addr_end(addr, end);
> > >   		if (pgd_bad(*pgd))
> > > @@ -503,7 +503,7 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
> > >   void vunmap_range_noflush(unsigned long start, unsigned long end)
> > >   {
> > >   	kmsan_vunmap_range_noflush(start, end);
> > > -	__vunmap_range_noflush(start, end);
> > > +	__vunmap_range_noflush(init_mm.pgd, start, end);
> > >   }
> > >
> > >   /**
> > > @@ -670,9 +670,10 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > >   	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > >   		int err;
> > >
> > > -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > > -					page_to_phys(pages[i]), prot,
> > > -					page_shift);
> > > +		err = vmap_range_noflush(init_mm.pgd, addr,
> > > +					 addr + (1UL << page_shift),
> > > +					 page_to_phys(pages[i]), prot,
> > > +					 page_shift);
> > >   		if (err)
> > >   			return err;
> > >
> > > --
> > > 2.47.0
> > >
> > >
> > >
> > Cheers, Lorenzo
>

--
Cheers, Lorenzo

