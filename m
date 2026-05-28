Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3184CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 03:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCjNWcFWR6sJCprx1waql78UPwtAbOc2aIj3hPZm7SU=; b=mUuo20KATy0Pgns+KPjNUBDvvE
	aBiTjSAQ+QEAIksaqtfQjA32BiVz5A7ZIyHXydeG/l9xTETRZRYz/3sFvXWvXIJQEb8Cw7/HBGebd
	QycgVUSE6ZqJ3reC05HoVnyI/B8NpaYSHqXNfDQ9TuiTO457QVKUUpE3C4U1P7SGBmEP16eOTikvm
	k6FIhnpTIEUWrQw+IBmEPMPdAs7+Lqdre4+Ulb56Kz/VA6m0rWXFTasQ/Eg5DpkMBnPZyd94RxoS/
	xVAOQynxpkT/vRl98qOv2bY0p6Pp211bQ+bYnkAGXC8GOY+2APucbbPk+iMNBYwQ7xNVZlE0DjjHW
	icX+SW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSRdV-000000054dt-3bd5;
	Thu, 28 May 2026 03:42:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSRdT-000000054dJ-2eA0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 03:42:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-44509921fbcso7936110f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 20:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779939738; cv=none;
        d=google.com; s=arc-20240605;
        b=RiyC8HUFSSJX7A7Yvsz+3/PULi6lQN3Vub7AxJS5I4VrUSCmuo72I23bhWJb1AlFkU
         96zN6qT7R2sX8Rq6JFnrYQzq4WsaeTuz5IEKeSidIhVYTXRYnHUr85AsZndZvbJwtqy1
         n9Z5pbAjZtu3C4pVgle/9PV+P5y9ywd8acyYLuQHJC5bFt06+cyz/5KQH59cQl+hIlwW
         UVX8e+z/q0/ACgC2IEHZu60YWcvRnKlhP/33LlGWZh5qkmlq2UhoO4QLmgfP0LCjg4YD
         mJFzuKWwEwpxzmedOMJ5ybMZVIa0A2XLzOcmYNxkh4S1nmNmt1ONOi9u/dS+9igAskcn
         MTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCjNWcFWR6sJCprx1waql78UPwtAbOc2aIj3hPZm7SU=;
        fh=zXN/3Uq6+0X8wR8jhp5IYsHYyExRGcK2fVnf2jqpLWQ=;
        b=Hsxl9tpTPbkNVIaJVvv+Y+BK8aLkMDPbPd87oRicK5wQpZ+0rCiWBoEuiYvrwc2SPo
         zameQAjVYcj5JrDgtdjFqYV/93w2RXBeKCRUyHDowI5iOGZq2HITg4t+o4sobzHAP1H+
         oFMu4n84w2GqpfwwtNwSSt272QEZqJAPIS/16VQiWaWgb2x14pitTaUYDafc+CFaLPMY
         els0HwQj+LLqXy1SNY9PIKslDY+3Adu/tHHQb5Mfu0Zhb4EDG5NWaxrC6zM9ADTZf+s5
         D9ShGcrk6dMOX5gcKNtykTzDbH7KBS3MW9xp9DgfGQ97UHK3abbe8COVxP7n8doP4WR0
         1tsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779939738; x=1780544538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCjNWcFWR6sJCprx1waql78UPwtAbOc2aIj3hPZm7SU=;
        b=idpTe+GMAwPWyXr1dVAChcpQkAlNhL6Nrd/1HifK0gvZEo8FHDyqvI5xDpfdDpdke7
         1kfVIg5ZD724PBrreGKfe587qDoaOrtmqKxky3UvfLg91ecoREBcTDr07j/xbGr97L7E
         gtMGkRxOcnQ7ZY52HtPHNjn+8dn8amNyQ46smbjVI6waf/IG0zCQyHDnwtqgkAMFqjDz
         TnKzMFKy4hZArESgyNQDkLpdtTErjDurEi5b7bjgceYAw1llEzhOYlGjX6LkUxodzJMO
         zf58m1iXba183+qZT7mXV8h/k7ihxCm9pYhrTp/FOd2Vs8zEbuiRzhArKM7c31Ua2fTr
         DR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779939738; x=1780544538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCjNWcFWR6sJCprx1waql78UPwtAbOc2aIj3hPZm7SU=;
        b=IRIkgmJ1fohy4+iE+j1EOKiNDCARM3ogm8HymapIHza+oVivIAiN0kHnzjM7QV9d2k
         dgDlhrgOqyeW+4lRMBfxXpS3K06AcdK1b1L4KBsqdwrkmkBjzQ1vV7h93PbUMaIFt4lX
         3sm9kSLTaVJRAuzkAdO6QdZwPTwrVCO0Q360juAVPI2FCHW2FfHtWX/35mhzQxDOPkQP
         B8wjUm6Zo13mASg/tAYkkha531IDFnX1gNZO/iKua7LXd0NpQP30Iv92X9r+GeJVt3r2
         RHShvrvkMf4e7oxCdlJR33qc9GHorVhoFXc7E5Yj0OyC/6YBFq8Uk5haKvvcZi6MTVbu
         uXiw==
X-Forwarded-Encrypted: i=1; AFNElJ//0t1hOWr+4IzkHdLLaW1znuRDOXYZShuwf3vY8gTjI84zBvZyxNaDYhNFq4ZrnnXlURy0xDMTNUaxW0PWgTN6@lists.infradead.org
X-Gm-Message-State: AOJu0YyIvtaFpehdhUz+YTCKnfVF+xEmRiAM+q+jawkC4iihwWJXKbXs
	eoOMQfzX4BsqTftYCwRqgeXYo3D7eX7UoF9Ye/zKGyFRRrIBQasiEz0CK5vu617I4blvnz00kUq
	ib8sG23ErbYq+5nFQqj2vVMYdrbpt/5hVsGDORiE=
X-Gm-Gg: Acq92OHpNEqKylc/60kT+J2yzXYqin8z3R5hKVJuQiOjU5240LSJgGopp7TKD/ke0Zy
	k0n0ARMSzYRNHltIsrKcLZDByzQZBlRpDEqB26b+BqWX8PaKmh3ewnuZ8QwxuegE08IiaEZnF7W
	UbPvDIJR8ThTZC25nIYuwvpt2okNJxl1X3NIrPod9r+Jyp9tRgbDP/nQFmYBvkDbjykbNC1Ih4H
	UAJfSx+luPWox64MjGjsoebMrOXu/f3RSZi4oRjZCgG+NgOFH7YHk7oNDeqJyBS1oKKfoc5x4fT
	92H7yQwX2Z8Mp7Q5nUI=
X-Received: by 2002:a05:6000:2992:20b0:45e:c786:5cd4 with SMTP id
 ffacd0b85a97d-45ec7865d9amr22197007f8f.42.1779939737939; Wed, 27 May 2026
 20:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-6-jiangwenxiaomi@gmail.com> <340c811e-2501-46c3-8a55-19e955c5ae8a@arm.com>
In-Reply-To: <340c811e-2501-46c3-8a55-19e955c5ae8a@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 28 May 2026 11:42:06 +0800
X-Gm-Features: AVHnY4KddDJ3QPES_Z3XlC4q6Bj_kB7V574_4-TqsJtLPivMCxYpwZ5XM5S6H0Q
Message-ID: <CAHKocdHOT13DHdz+DsT2BaP0EJSKdoWU2NO-wjFwB9+--CqsHw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_204219_706380_2A88B302 
X-CRM114-Status: GOOD (  32.18  )
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

On Wed, 27 May 2026 at 16:28, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 22/05/26 11:01 am, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > In many cases, the pages passed to vmap() may include high-order
> > pages. For example, the systemheap often allocates pages in descending
> > order: order 8, then 4, then 0. Currently, vmap() iterates over every
> > page individually=E2=80=94even pages inside a high-order block are hand=
led
> > one by one.
> >
> > This patch detects physically contiguous pages (regardless of whether
> > they are compound or non-compound) by scanning with
> > num_pages_contiguous(), and maps them as a single contiguous block
> > whenever possible. The first page's pfn must be aligned to the
> > mapping order for the batched mapping to be used.
> >
> > Pages with the same page_shift are coalesced and mapped via
> > vmap_pages_range_noflush_walk() to avoid page table rewalk.
> >
> > As users typically allocate memory in descending orders (e.g.
> > 8 =E2=86=92 4 =E2=86=92 0), once an order-0 page is encountered, we sto=
p scanning
> > for contiguous pages since subsequent pages are likely order-0 as well.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 80 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index deb764abc0571..50642246f4d40 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3542,6 +3542,84 @@ void vunmap(const void *addr)
> >  }
> >  EXPORT_SYMBOL(vunmap);
> >
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             unsigned int max_steps, unsigned int idx)
> > +{
> > +     unsigned int nr_contig;
> > +     int order;
> > +
> > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
> > +                     ioremap_max_page_shift =3D=3D PAGE_SHIFT)
>
>
> Why bail out on ioremap_max_page_shift =3D=3D PAGE_SHIFT? The code
> path for ioremap is different from vmap right?
>
>

ioremap_max_page_shift is under CONFIG_HAVE_ARCH_HUGE_VMAP which
controls both ioremap and vmap huge mappings.

> > +             return 0;
> > +
> > +     nr_contig =3D num_pages_contiguous(&pages[idx], max_steps);
> > +     if (nr_contig < 2)
> > +             return 0;
> > +
> > +     order =3D fls(nr_contig) - 1;
> > +
> > +     if (arch_vmap_pte_supported_shift(PAGE_SIZE << order) =3D=3D PAGE=
_SHIFT)
> > +             return 0;
> > +
> > +     /* Ensure the first page's pfn is aligned to the order */
> > +     if (!IS_ALIGNED(page_to_pfn(pages[idx]), 1 << order))
> > +             return 0;
> > +
> > +     return order;
> > +}
> > +
> > +static int vmap_batched(unsigned long addr, unsigned long end,
> > +             pgprot_t prot, struct page **pages)
> > +{
> > +     unsigned int count =3D (end - addr) >> PAGE_SHIFT;
> > +     unsigned int prev_shift =3D 0, idx =3D 0;
> > +     unsigned long start =3D addr, map_addr =3D addr;
> > +     int err;
> > +
> > +     err =3D kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> > +                                             PAGE_SHIFT, GFP_KERNEL);
> > +     if (err)
> > +             goto out;
> > +
> > +     for (unsigned int i =3D 0; i < count; ) {
> > +             unsigned int shift =3D PAGE_SHIFT +
> > +                     get_vmap_batch_order(pages, count - i, i);
> > +
> > +             if (!i)
> > +                     prev_shift =3D shift;
> > +
> > +             if (shift !=3D prev_shift) {
> > +                     err =3D vmap_pages_range_noflush_walk(map_addr, a=
ddr,
>
> It would be worth documenting vmap_pages_range_noflush_walk() that
> it can take an array of pages which are not all contiguous, but it
> may have contiguous chunks, as hinted by page_shift.
>
> Otherwise this looks good.
>
> > +                                     prot, pages + idx,
> > +                                     min(prev_shift, PMD_SHIFT));
> > +                     if (err)
> > +                             goto out;
> > +                     prev_shift =3D shift;
> > +                     map_addr =3D addr;
> > +                     idx =3D i;
> > +             }
> > +
> > +             /*
> > +              * Once small pages are encountered, the remaining pages
> > +              * are likely small as well.
> > +              */
> > +             if (shift =3D=3D PAGE_SHIFT)
> > +                     break;
> > +
> > +             addr +=3D 1UL << shift;
> > +             i +=3D 1U << (shift - PAGE_SHIFT);
> > +     }
> > +
> > +     /* Remaining */
> > +     if (map_addr < end)
> > +             err =3D vmap_pages_range_noflush_walk(map_addr, end,
> > +                             prot, pages + idx, min(prev_shift, PMD_SH=
IFT));
> > +
> > +out:
> > +     flush_cache_vmap(start, end);
> > +     return err;
> > +}
> > +
> >  /**
> >   * vmap - map an array of pages into virtually contiguous space
> >   * @pages: array of page pointers
> > @@ -3585,8 +3663,8 @@ void *vmap(struct page **pages, unsigned int coun=
t,
> >               return NULL;
> >
> >       addr =3D (unsigned long)area->addr;
> > -     if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> > -                             pages, PAGE_SHIFT) < 0) {
> > +     if (vmap_batched(addr, addr + size, pgprot_nx(prot),
> > +                             pages) < 0) {
> >               vunmap(area->addr);
> >               return NULL;
> >       }
>

