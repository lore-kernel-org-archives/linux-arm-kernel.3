Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FDF10FC454
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 21:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHslSwDxFYmJz+2ZwRUejS0CvrNUsSr/wt9GVySUqng=; b=p1SUoXqs70x7ShBW/gyHdkKCID
	c5MXpdmvKrU/HDIGVosiK9z8D/0E1l4NYqbhRDAE5BgOQ6RQa+z7vjkvOmpVsG5AIMGYiZjOQCbbM
	mQCG5p8QfRbv74CTtxgxuRg586hlLLdp24ivoqDG/z0m9ERi6LXiuik6L4ccxegZgJrjkH0rj15D0
	3iodHziQj6dHPWWfDzyBk7hQvpEbCQoWEpan4/FuD6UCQ9X3sQqsWT4r0ZmZNX+oX8JLYvLtPp3L2
	An8ArmM97jf9fqfDRZsIitP4oz5H/O6oZE8sUEjh4BLxN3JOHME313zCHS5A7PtB+av8LH+mqi4Ks
	gC91GXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAarg-00000009SGs-1Gro;
	Wed, 08 Apr 2026 21:55:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAard-00000009SGT-2iCG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 21:55:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C907C43FBB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 21:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974CEC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 21:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775685308;
	bh=9tyfiUj/h3G9nYoqcv1nsHUxCG2DuNBXO0qSeyZXX/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NeeK5KtC6jdHoDdFOv1ocGFUO/QKc2/suIgnSYtB2lAPIFb/xLQ5S230iibtS7wvu
	 p93wEk29+hav4AOPEOPoe33SgLxQukMuyDDb4MeWy3DYrMeW6+JYxnuKyWSYUIsQ94
	 FtepC6YWuPozjrU0izkuQaTzGID00Q0k+Flq3JKGrjiKh71xEDjaQrES60kIDJvp7q
	 NJ5h2SQNn2GxeHrR7ypkGWDU3ytHAsrRTQHv799+3/0uDVraCB//iSzZJAlPrOS3IE
	 2jPoLOwNhnm8UjYeAluEEnIQ4GTU09T+mkiCw19cMaPqQ0RxA7mPFmZX65YcrdicDQ
	 cXyQxqaiCYaPg==
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89f87257904so2172136d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 14:55:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHwZDIb4G0zwQTRQO68KtFqmkJGfn09xtfoxLrnXJxZ/ZTNVWnTyM32BqVwRiNoPVv/TK49HdvTIMSw9/ek3N5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0xxefmok1Es25xsSBwalEygngth10Bt1K9CtMKKQCQy+LPQMF
	x8p7xxTIiLeqdDpLT9lmYITCzA38pcYYPza59Jt+cjM/L5k5bCsppsdriSyg30xekQfsBs2sZmZ
	a8g5CwKSBIfCWQJiZrf+hTr/TpbjX4ic=
X-Received: by 2002:a05:6214:5c82:b0:8a0:f8b7:391d with SMTP id
 6a1803df08f44-8a7042f27cdmr310757796d6.31.1775685307892; Wed, 08 Apr 2026
 14:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-6-baohua@kernel.org>
 <c54e12b0-1a35-48e1-b243-991de246a8ca@arm.com>
In-Reply-To: <c54e12b0-1a35-48e1-b243-991de246a8ca@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 9 Apr 2026 05:54:55 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yL3Y1Sr0MjTd6=ROC0jKf4JkCqNPODMh-m155rUFcS9g@mail.gmail.com>
X-Gm-Features: AQROBzDWRyq6ermL0Gg6O6aynt5Lhi1rCxfVFeVsKmdjacHsxC88F_qdnibnoyI
Message-ID: <CAGsJ_4yL3Y1Sr0MjTd6=ROC0jKf4JkCqNPODMh-m155rUFcS9g@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org, 
	Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_145509_758510_33161733 
X-CRM114-Status: GOOD (  34.83  )
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

On Wed, Apr 8, 2026 at 10:03=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> > In many cases, the pages passed to vmap() may include high-order
> > pages allocated with __GFP_COMP flags. For example, the systemheap
> > often allocates pages in descending order: order 8, then 4, then 0.
> > Currently, vmap() iterates over every page individually=E2=80=94even pa=
ges
> > inside a high-order block are handled one by one.
> >
> > This patch detects high-order pages and maps them as a single
> > contiguous block whenever possible.
> >
> > An alternative would be to implement a new API, vmap_sg(), but that
> > change seems to be large in scope.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  mm/vmalloc.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 49 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index eba436386929..e8dbfada42bc 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3529,6 +3529,53 @@ void vunmap(const void *addr)
> >  }
> >  EXPORT_SYMBOL(vunmap);
> >
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             unsigned int max_steps, unsigned int idx)
> > +{
> > +     unsigned int nr_pages;
> > +
> > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) ||
> > +                     ioremap_max_page_shift =3D=3D PAGE_SHIFT)
> > +             return 0;
> > +
> > +     nr_pages =3D compound_nr(pages[idx]);
> > +     if (nr_pages =3D=3D 1 || max_steps < nr_pages)
> > +             return 0;
>
> This assumes that the page array passed to vmap() will have compound page=
s
> if it is a higher order allocation.
>
> See rb_alloc_aux_page(). It gets higher-order allocations without passing
> GFP_COMP.
>
> That is why my implementation does not assume anything about the property
> of the pages.

If you=E2=80=99re asking about support for non-compound pages, I think
that=E2=80=99s fine. My current use case is dma-buf, where pages are
compound. I recall discussing this previously with David and
Uladzislau.

If you=E2=80=99re working with non-compound pages, I=E2=80=99m happy to add
support in the next version. I=E2=80=99m also happy to reuse some of your
code and credit you as Co-developed-by if you=E2=80=99re willing. I actuall=
y
prefer your __vmap_huge() name over my
vmap_contig_pages_range().

Does that make sense to you?

>
> Also it may be useful to do regression-testing for the common case of
> vmap() with a single page (assuming it is common, I don't know), in
> which case we may have to special case it.

I agree, so I had Xueyuan test single pages and highlighted this
in the cover letter. There is no regression: "vmap() is 5.6=C3=97
faster when memory includes some order-8 pages, with no
regression observed for order-0 pages."

>
> My implementation requires opting in with VM_ALLOW_HUGE_VMAP - I suspect
> you may run into problems if you make vmap() do huge-mappings as best-eff=
ort
> by default. I am guessing this because ...
>
> Drivers can operate on individual pages, so vmalloc() calls split_page()
> and then does the block/cont mappings. This same issue should be present
> with vmap() too? In which case if we are to do huge-mappings by default
> then we can do split_page() after detecting contiguous chunks.
>
> But ... that may create problems for the caller of vmap() - vmap now
> has the changed the properties of the pages.

I don=E2=80=99t see this as a problem at all. Splitting pages does not
affect physical or virtual contiguity; it only changes the
contents of struct page objects, not the PTE/PMD mappings.
For ioremap, there isn=E2=80=99t even a struct page, yet the mappings
can still be huge.

Thanks
Barry

