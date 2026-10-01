Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC18CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wFYgQFxyClJH+0q2sU9iXyjK0XmqVNpkJ48os8SONM=; b=M9a8F36G8VXIpoN6NEChwSkYjF
	i6Kk4EWv4O4vfF06i7FQBnEnL742PwgSjR4AoQq+NrDzWhf02uyaGERVqvvPtlIfkjGfPAdYO1s3H
	An81BJaUvCt64yZlWR3aw9U1LTcgm759zKXCidfswAXdJRm/H99pDvnAn5uYm7ThvnAwsPKg8ckup
	x7zb1jIeEug33gCgHY0k0A8DcC6Q7ESvEAavbimN5edZ5cA98J+w/fWdtIQ1b14gIJAOR2lr4EzEl
	Xz05vO3qu5b53KV0NsxmjvdcYV+hzeDBmws4ByPyL8XhwHkziXD5y/NIYiSwIJ5RLxK0jRVky7stK
	Yc2b/9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBkP-0000000852S-24gn;
	Thu, 01 Oct 2026 08:02:33 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBkN-0000000851x-027I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:02:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f63546c3so4820923f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790841749; cv=none;
        d=google.com; s=arc-20260327;
        b=aanfucrg9rMpGKXkt4wk2F00CqCv/F/hWmELuSFQQABEaCPKPHmdpTTL+QPiVZtyQ7
         hXZZe1iiWNDYwXGZo9u7rmEZiKvZU1ewAmul3nh2cDBNOCmkq83CYdB6rNi6oEVGTCol
         4QSwbDTyEl+bnSo6ii8Xn3tWefWapUUNzBW60Pc7VhhJ1P+f7aufPx2p9d9I8eEUt4h9
         h5698WdsYXryzyLpMA16jE+XBdDyuRFgCxxUnGyxOqGERT7AlGHFj1bbRcYLoE/837ah
         +sYxzikUhmkPgUlmbmbCA+iLnMUeeoFR77l6T/0VQZeu+bhEckkrUD4ZN/EWxafacEQr
         KmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8wFYgQFxyClJH+0q2sU9iXyjK0XmqVNpkJ48os8SONM=;
        fh=pkMxaO97m3kBInxKd0KrBsS/T/a4poHdUw72xJa6DSs=;
        b=DCTIoMByOiU3ZF3pH865CPXYaQaZQ8VtE38uVeP+NdqYZCpcQK+SyydrGYmUmMaZtC
         YQa5MqzTEZtAoaRduyqQadb6fXkNu38KzHnKo6RT2rTl65QgFQ1fNYt/W5utn9Tw/bwV
         0fxER2KuiZUgan0ZgTJB8xww3TYR1v0bXac7LVQ/Yu0Ze9vkakqMAIoQ0GQ274N30Bkt
         FAQKi46UmCz5QpfN7S7ypyUKqvcErKDaUFVN0uxIWvP6ys2SF3Y3+IMIgLasdLBEBwWb
         ELOdZURSq8TQKj+7NSDHGuRMKbxjkDQXRkFC9DuosYDeQfReDUwhSmQCGZx6HLUF9tVy
         KsFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841749; x=1791446549; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wFYgQFxyClJH+0q2sU9iXyjK0XmqVNpkJ48os8SONM=;
        b=IrPO69lTgpDcoo6B+WP3fR9BNCso2NsvxyTANGFrJp8t3Rd4i7G5Y2VoV2TTgezn5f
         AyswvBgSOtTyY4uw3oBCdC6GxWxkg1cHcby3EvQPqaUNRdsVddbqU02v15U4BYQZLWUm
         9fZk1gkwECFv9kPi0HufxIe9NU32Txw/HFbkPDeAM5/9C9nIY9cEnOQ505VdyNabbpas
         aOfFFf+boxXbOypvYyL5NQgiR5U+YxDiTFP73i7xm3Q13xvjGqNfNx/+HkSf5CTDl8i0
         vU7EDGIrJG9UbiLOaj0ROVhWtMYdIl2T+uVhTiz4Yabm15DGq4CoSldeXWXjiUqMgwn3
         Tzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841749; x=1791446549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8wFYgQFxyClJH+0q2sU9iXyjK0XmqVNpkJ48os8SONM=;
        b=jdY/p9nZl/ioYBNe5fgW9ir8X8IHWPYIvJzUJS19Zu+9YalYocJu0C4vrKStKDlICl
         8t4cMN2U62P8RIpytpmSB/Y86hxD+QFumqv0egAOXAoc9AkMDhYnV0H12/W7pzZf83Gu
         jTvrUxes5oXfvtmVe27RrguGhDdDpd7uKZ8rnwIy77ISHh2/ZGoAhl7yo9G0kR8ucpkU
         PM+p/zKy3/yqfoI0MemYBtOwRVjLGGBNOcKY1FNkdUSMEyZLBz/3U0PKUZLmQmFr4zDK
         pC2QTezKv2yEVLytJGty3AKzuXGL7ypdM8EyPf/bBXkvAK8dO1Ko24H1Hd2UNm16BW4l
         XiqA==
X-Forwarded-Encrypted: i=1; AKwUvBxlM9EvdhwiLQaInZ7kvsKlHXqupk6z0+fBJch+YtrNG5GlULGSGfj3njQ/NwOSKS9FbWXtXNc4JMmy8l1C0ruQ@lists.infradead.org
X-Gm-Message-State: AFuF++kaqv0aGOkDqAcfQuiHgzDR32dCm4qT34McCbe0nVPefvwhUlzV
	cibSgA/gxCJEl+U+QUtEGk83os5hU02XbXyp4UZaF5BnSh+VexHm4QTKRtAcX7hnpASvdh/IpIZ
	FfnD+Fi87vtkpkzzbBX13YfpeJcGRE+Q=
X-Gm-Gg: AYBFou02ce71P/dk17o/BDZPmHEvvj7XdYdjYeyo/uLivKXxms3PLjiJSYJBqrz2GPO
	nuym/l37l6EkFzKz1HvAlry6welIC6QdYlgBBfDhLYSgm+WMFa+kEqc8KBxLMilSHewhT/bnIPi
	J5Uq76LeSwNgp2x0P+9IV+/7Tr8X9z01KxwUeJO0ryYAgf4TweNI1yGJX+B/Rtp38+IsbKGLCBZ
	D0cNCq+7MfS7hAWv7MieTfZ/mtaCShL9E7kIBSfuwUVcDAignqeBSYo08ARYk3VtL+PLSp96dhm
	bFLHQSKCVDWHKo5o55FSlMpu6LbtLTPYzc8jv2NpWLWUSF7LwSu9P/Rl
X-Received: by 2002:a05:600c:3152:b0:49c:fc6e:8cbb with SMTP id
 5b1f17b1804b1-4a01b131631mr63017475e9.31.1790841748605; Thu, 01 Oct 2026
 01:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-8-jiangwen6@xiaomi.com>
 <ar0nuJ7ocTMgbiMu@milan>
In-Reply-To: <ar0nuJ7ocTMgbiMu@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 1 Oct 2026 16:02:17 +0800
X-Gm-Features: AclHuK9TMMGS3_KK3AGC469G5gqBizlXQV9uB6i_baT8npA09Tvz5gZK4c--_ZU
Message-ID: <CAHKocdH-NeWYJBrCVfGctuDyh=D4a2YrzUf1VxB3cG7Di-EAMw@mail.gmail.com>
Subject: Re: [PATCH v9 07/10] mm/vmalloc: extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_010231_098252_A948406A 
X-CRM114-Status: GOOD (  33.33  )
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

On Wed, 30 Sept 2026 at 23:16, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Wed, Sep 23, 2026 at 02:28:29PM +0800, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> > provides a clean interface by taking struct page **pages and mapping them
> > via direct PTE iteration. This avoids the page table rewalk seen when
> > using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> >
> > Extend it to support larger page_shift values, and add PMD- and
> > contiguous-PTE mappings as well.
> >
> > Rename it to vmap_pages_range_noflush_walk() since it now handles
> > more than just small pages.
> >
> > For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> > iterate over pages one by one via vmap_range_noflush(), which would
> > otherwise lead to page table rewalk. The code is now unified with the
> > PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  mm/vmalloc.c | 84 +++++++++++++++++++++++++++++++---------------------
> >  1 file changed, 50 insertions(+), 34 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index d475e52110e4a..6e0dec73107a7 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
> >
> >  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> > +     unsigned long pfn, size;
> > +     unsigned int steps;
> >       int err = 0;
> >       pte_t *pte;
> >
> > @@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >                       break;
> >               }
> >
> > -             set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> > -             (*nr)++;
> > -     } while (pte++, addr += PAGE_SIZE, addr != end);
> > +             pfn = page_to_pfn(page);
> > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> > +             steps = PFN_DOWN(size);
> > +     } while (pte += steps, *nr += steps, addr += size, addr != end);
> >
> nr_mapped_pages?
>

As noted in the patch 6 reply, I'll rename steps to nr_pages here as well.

> >
> >       lazy_mmu_mode_disable();
> >       *mask |= PGTBL_PTE_MODIFIED;
> > @@ -602,60 +605,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >
> >  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       pmd_t *pmd;
> >       unsigned long next;
> > +     int err;
> >
> >       pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
> >       if (!pmd)
> >               return -ENOMEM;
> >       do {
> >               next = pmd_addr_end(addr, end);
> > -             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> > -                     return -ENOMEM;
> > +
> > +             if (shift >= PMD_SHIFT) {
> > +                     struct page *page = pages[*nr];
> > +                     phys_addr_t phys_addr;
> > +
> > +                     if (WARN_ON(!page))
> > +                             return -ENOMEM;
> > +                     if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> > +                             return -EINVAL;
> > +
> > +                     phys_addr = page_to_phys(page);
> > +
> > +                     if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
> > +                             *mask |= PGTBL_PMD_MODIFIED;
> > +                             *nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
> >
> *nr += 1 << (PMD_SHIFT - PAGE_SHIFT); --->  *nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
> as it used to be?
>

Agreed, I'll use 1U.

> > +                             continue;
> > +                     }
> > +             }
> > +             err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
> > +             if (err)
> > +                     return err;
> >       } while (pmd++, addr = next, addr != end);
> >       return 0;
> >  }
> >
> >  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       pud_t *pud;
> >       unsigned long next;
> > +     int err;
> >
> >       pud = pud_alloc_track(&init_mm, p4d, addr, mask);
> >       if (!pud)
> >               return -ENOMEM;
> >       do {
> >               next = pud_addr_end(addr, end);
> > -             if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> > -                     return -ENOMEM;
> > +             err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
> > +             if (err)
> > +                     return err;
> >       } while (pud++, addr = next, addr != end);
> >       return 0;
> >  }
> >
> >  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       p4d_t *p4d;
> >       unsigned long next;
> > +     int err;
> >
> >       p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
> >       if (!p4d)
> >               return -ENOMEM;
> >       do {
> >               next = p4d_addr_end(addr, end);
> > -             if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
> > -                     return -ENOMEM;
> > +             err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
> > +             if (err)
> > +                     return err;
> >       } while (p4d++, addr = next, addr != end);
> >       return 0;
> >  }
> >
> > -static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> > -             pgprot_t prot, struct page **pages)
> > +/*
> > + * It can take an array of pages which are not all contiguous, but it
> > + * may have contiguous chunks, as hinted by @shift.
> > + */
> > +static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
> > +             pgprot_t prot, struct page **pages, unsigned int shift)
> >  {
> >       unsigned long start = addr;
> >       pgd_t *pgd;
> > @@ -670,7 +701,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >               next = pgd_addr_end(addr, end);
> >               if (pgd_bad(*pgd))
> >                       mask |= PGTBL_PGD_MODIFIED;
> > -             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> > +             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
> >               if (err)
> >                       break;
> >       } while (pgd++, addr = next, addr != end);
> > @@ -693,27 +724,12 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >               pgprot_t prot, struct page **pages, unsigned int page_shift)
> >  {
> > -     unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> > -
> >       WARN_ON(page_shift < PAGE_SHIFT);
> >
> This is not about this patch but probably on that WARN_ON we should bail out
> early.
>

I'll send a separate cleanup patch changing it to:

        if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
                return -EINVAL;

Thanks,
Wen
> --
> Uladzislau Rezki

