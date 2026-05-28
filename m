Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1546CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 03:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8eCXBGOd5t/87xeLw45c9cWsz3mamZ+scLdG/p0E2Q=; b=Pv5PpgzafiZt11uQat49qFxkFE
	sN3M9hzjnUyd2oO36PFlN4D8HjSdnQC1E8OoCc2LTdMAu+orYQ8icxNLJWf0aRRtdoQxOklXFrNDA
	FoNjo2+xRk6UV9Apa4qiN35DejPXD+yzhyPOJ15loUTHI8h4ltHnzgUxbJbE6Dz5FmKWN8UkWomv1
	OPngM/Pu5q5OrbcQhYxulCsJ5CwzGjWQ/HQSwNZKClLBPle89zJE7PJy9PrCGlU2EZwxz8iifmitD
	1U3dyb4X6JxM70KCDRB2293EoeVLBxnd82TkUkWf7++mV3W1tpvMr3ZSpV7mlC/ZflJGumQZTN1v1
	z5aw1HZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSRbK-000000054Oc-1TCx;
	Thu, 28 May 2026 03:40:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSRbI-000000054Nt-1jvF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 03:40:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-459bf19e87bso7394388f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 20:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779939602; cv=none;
        d=google.com; s=arc-20240605;
        b=Wo65QHs+KjBwKPPQ0z41FzmyUvmBjHlVeyI2GssNUFUBIDfBUKR57YbQ6tg/kV/JEQ
         YZIm928pDbnGFt/zzAlibkPSXFc7aZ2Ipkv5P7h9EsJelkv8+0vpeWPGbgq1WQazBG9J
         0py7S/k9OUWXvUiAxA+xW/5nuZCPrAXYQeeJS/N6EgeMb15WlWfHzwnErSmg0IP72Om1
         TPAnlde+bVOabvxgq/BPgOGXJBevPeYWBDxp+pmdJegZvqm0qvQ/6eBVDindwKE1AMSg
         wzmT0bYy0oliUEZvHPwyWLkMP7L86+PV7dSGD5STPWWW7DyqT6j/5YssKQoynQd/+Je8
         RyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e8eCXBGOd5t/87xeLw45c9cWsz3mamZ+scLdG/p0E2Q=;
        fh=GSFyTZvswng0bEjrK4WZfI/RbeBqRy2QVXsfA9fBpJY=;
        b=BZ8TOk//8VD74TVg6GrHRD7EECYjgItInWq1pbwEKqApKUrVmJe1cqsS76dY6NjnpV
         Hjo/PSjzSPr5vpLXI3pxsHNjRX9wV6bEgj/UqJ+52XtHmHpsS0ULfo22dpYUbrfMQdkD
         ka0O8Acd57U2ZrAnobH6+7uj9r6a/K2sHWpuF8OdJIkI/u7KkljqhcOUIaJNUItJgiGE
         TIHhyrSlj8/n1eO3/I9VXkeY47Z+wapBD1LyJahcW1gRgHMEEhRW2Kwlk7DRqby4WKoA
         Y8+82PFn5XtJM5KfHXeO6yveYQVCrGKIJt6l2wTrbiUnueF9CKvvbaHmBX5XrRBDYHUa
         cyZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779939602; x=1780544402; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e8eCXBGOd5t/87xeLw45c9cWsz3mamZ+scLdG/p0E2Q=;
        b=gc110qP4xGXOMlvpu0HHDsPUTcZHmhP1VSynOfemQQXhsa4+biWt61LW+3IvH21cFf
         4MlT9jjwo/UE5uV/OyOfcyT0Kw+KDsgEP8lTHmIEa+sdjZgR72AzIv1l5qnCwWf1a+PA
         2of6tt29Cx4qLqca1QhzMpRBQVQ7v1H1yJodWbPMsGS/Ms6iuMY+Vrp7HMoFa/RZNaUx
         nA8ERVdcHNBNjx+PjnhsaeenzFJTA9w8JjotNZATrdp7lNauOGhus55cqqTCNu1JdNQ/
         CZyWEHA4vUQbpP4HPYeCIEP/I3kVOfB4/Lu8Z3++lhL5hMEsmoABz6QNXqpjklzofWC2
         ENuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779939602; x=1780544402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8eCXBGOd5t/87xeLw45c9cWsz3mamZ+scLdG/p0E2Q=;
        b=h/bmPAWrlqU6jJ/o2uVs3UQsFz+jiyvqRWrsIahdLLN1jS7jMqs3TqSc//Bibwx3PJ
         XyoZByjm2AO5bL1OqsS4HxpIM6dDX9lYMXP74iaQqMe/z96s8Q8pF2Rf6hU8FQl/nIu5
         ZQmzESs7/88TvOFsrjorD9uyKFzhpNe6MvbUjYlvjwnayxw8rsemrX3ZnAMHJ7i9MO7A
         6FhkPND0r6Yzmw3PLQ6JpraIPxLN5gbXWc2yzo6u089yCa2Xh0e9jUiUMhNdHlsPdBGH
         216v3XPA3msQJQR/bWma/Ez03/T58JV4mA7wHoBr/8bvFOvR0qK6kq9tP6h8QNsOxoXD
         p2yw==
X-Forwarded-Encrypted: i=1; AFNElJ8Q+jS8eFvRj8X0dkUU7t6rxm0DMc2AT8BJijffsPanqCot9ut1x2GKBvVYQjybNoUIUviUyVsEp0E3m1upgbW+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6NHFDqjxIsVB41u1AjQ3zUjCpqw57SAdO2x7FOXWfMzfKOKrc
	Kt0G1/R+lsHUUC9OSisUbivaIwZs0K1MIFbRk8bn23Rg39gFGtrxG/falDuGRoJKIyGxxNesBzF
	/iARLmlLlaao591D+rCXnKemVNxJLLok=
X-Gm-Gg: Acq92OGF+foc5XrmOos1bzb+ONKacTA/J59O2u8c6rMLdXGjt8agS1l4y71fqhQR+Qp
	9fk/ekEvbytHa6vZlsdCqAW5YCN+QjiRq4FF7g5c85QEM4ECNMZEO8VJujTkvu4DoUC1hAQMtKu
	W8eIj5A4sdAi/fb3P7whJv8AoPJLB3ZPexiQjtvK8B5+6r9+2x/s+DjeAJA3D6AH8zzDanUtpoN
	XxlPBlHCd8Aj2WsYjGdYdjFsIzbz1ioI4GAvuZhSkg+ICJ6TiChTk47UjbXi9I9JsmhwwktKBBw
	U7uPUU1q0Ef8d2Q8Cks=
X-Received: by 2002:a05:6000:381:b0:455:4695:92d9 with SMTP id
 ffacd0b85a97d-45eb38a1c99mr44878903f8f.12.1779939601332; Wed, 27 May 2026
 20:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-5-jiangwenxiaomi@gmail.com> <46b0f2a7-3c0d-4372-a45d-946d8259d410@arm.com>
In-Reply-To: <46b0f2a7-3c0d-4372-a45d-946d8259d410@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 28 May 2026 11:39:49 +0800
X-Gm-Features: AVHnY4LR2gQ0CgXcwQN4_k_NUidEbLIum6ra-k-G0pa908sECZJ3chvNoXL5qT0
Message-ID: <CAHKocdEfX3dgUr3O6q1WOe4PddN2=LKfX6Y5DfrfTwF9MM5J3w@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mm/vmalloc: Extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_204004_512149_5702F85C 
X-CRM114-Status: GOOD (  33.85  )
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

On Wed, 27 May 2026 at 13:59, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 22/05/26 11:01 am, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
>
> vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> provides a clean interface by taking struct page **pages and mapping them
> via direct PTE iteration. This avoids the page table rewalk seen when
> using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
>
> Extend it to support larger page_shift values, and add PMD- and
> contiguous-PTE mappings as well. Rename it to vmap_pages_range_noflush_walk()
> since it now handles more than just small pages.
>
> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> iterate over pages one by one via vmap_range_noflush(), which would
> otherwise lead to page table rewalk. The code is now unified with the
> PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 71 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 40 insertions(+), 31 deletions(-)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 53fd4ee460ea4..deb764abc0571 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -543,8 +543,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
>
>  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -             pgtbl_mod_mask *mask)
> +             pgtbl_mod_mask *mask, unsigned int shift)
>  {
> +     unsigned long pfn, size;
> +     unsigned int steps;
>       int err = 0;
>       pte_t *pte;
>
> @@ -575,9 +577,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>                       break;
>               }
>
> -             set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> -             (*nr)++;
> -     } while (pte++, addr += PAGE_SIZE, addr != end);
> +             pfn = page_to_pfn(page);
> +             size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> +             steps = PFN_DOWN(size);
> +     } while (pte += steps, *nr += steps, addr += size, addr != end);
>
>       lazy_mmu_mode_disable();
>       *mask |= PGTBL_PTE_MODIFIED;
> @@ -587,7 +590,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>
>  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -             pgtbl_mod_mask *mask)
> +             pgtbl_mod_mask *mask, unsigned int shift)
>  {
>       pmd_t *pmd;
>       unsigned long next;
> > @@ -597,7 +600,27 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
> >               return -ENOMEM;
> >       do {
> >               next = pmd_addr_end(addr, end);
> > -             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> > +
> > +             if (shift == PMD_SHIFT) {
> > +                     struct page *page = pages[*nr];
> > +                     phys_addr_t phys_addr;
> > +
> > +                     if (WARN_ON(!page))
> > +                             return -ENOMEM;
> > +                     if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> > +                             return -EINVAL;
>
>
> So I know these !page and !pfn_valid checks have been copied from vmap_pages_pte_range,
> but do they mean anything?
>
> I think pfn_valid() makes sense in that someone may take a random VA/PA, convert it into a struct
> page and pass to vmap layer. But I don't see how anyone would pass page == NULL? At the
> very least, returning ENOMEM does not make sense because the pages are not being
> allocated by vmap() but have already been allocated.

Hi Dev,

vmap() is EXPORT_SYMBOL with many callers across drivers, each
constructing the pages array differently. The !page check guards
against malformed arrays at this API boundary.

The same -ENOMEM issue also exists in vmap_pages_pte_range().
Should I fix both in this patchset or leave it as a separate cleanup?

>
> > +
> > +                     phys_addr = page_to_phys(page);
> > +
> > +                     if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
> > +                                             shift)) {
> > +                             *mask |= PGTBL_PMD_MODIFIED;
> > +                             *nr += 1 << (shift - PAGE_SHIFT);
> > +                             continue;
> > +                     }
> > +             }
> > +
> > +             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift))
> >                       return -ENOMEM;
> >       } while (pmd++, addr = next, addr != end);
> >       return 0;
> > @@ -605,7 +628,7 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
> >
> >  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       pud_t *pud;
> >       unsigned long next;
> > @@ -615,7 +638,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >               return -ENOMEM;
> >       do {
> >               next = pud_addr_end(addr, end);
> > -             if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> > +             if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift))
> >                       return -ENOMEM;
> >       } while (pud++, addr = next, addr != end);
> >       return 0;
> > @@ -623,7 +646,7 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >
> >  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       p4d_t *p4d;
> >       unsigned long next;
> > @@ -633,14 +656,14 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
> >               return -ENOMEM;
> >       do {
> >               next = p4d_addr_end(addr, end);
> > -             if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
> > +             if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift))
> >                       return -ENOMEM;
> >       } while (p4d++, addr = next, addr != end);
> >       return 0;
> >  }
> >
> > -static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> > -             pgprot_t prot, struct page **pages)
> > +static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
> > +             pgprot_t prot, struct page **pages, unsigned int shift)
> >  {
> >       unsigned long start = addr;
> >       pgd_t *pgd;
> > @@ -655,7 +678,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >               next = pgd_addr_end(addr, end);
> >               if (pgd_bad(*pgd))
> >                       mask |= PGTBL_PGD_MODIFIED;
> > -             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> > +             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
> >               if (err)
> >                       break;
> >       } while (pgd++, addr = next, addr != end);
> > @@ -678,27 +701,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >               pgprot_t prot, struct page **pages, unsigned int page_shift)
> >  {
> > -     unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> > -
> >       WARN_ON(page_shift < PAGE_SHIFT);
> >
> > -     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                     page_shift == PAGE_SHIFT)
> > -             return vmap_small_pages_range_noflush(addr, end, prot, pages);
> > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
> > +             page_shift = PAGE_SHIFT;
> >
> > -     for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > -             int err;
> > -
> > -             err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > -                                     page_to_phys(pages[i]), prot,
> > -                                     page_shift);
> > -             if (err)
> > -                     return err;
> > -
> > -             addr += 1UL << page_shift;
> > -     }
> > -
> > -     return 0;
> > +     return vmap_pages_range_noflush_walk(addr, end, prot, pages,
> > +                     min(page_shift, PMD_SHIFT));
>
>
> We can easily extend to PUD huge mappings right? Not sure whether we
> should keep everything symmetric to how vmap_range_noflush() operates
> right now, since P4D mappings don't exist, but PUD looks worthwhile.
>

PUD mapping requires 1GB of contiguous physical memory, but the buddy
allocator's MAX_PAGE_ORDER is 10 (4MB on 4K pages). So page_shift
passed to vmap_pages_range_noflush_walk() never exceeds PMD_SHIFT.

Thanks,
Wen
> >  }
> >
> >  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>

