Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7FDF531CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 20:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ii618WCY4OPiNL7FtmIZQQ8wHuTxpWru2GswJI1aP9c=; b=OLgLdRXoEV1g+SXwWbUTjVoeT0
	ItOtcAsG9ejxLQ5Iwjw4pLPPIjbm1bGVVEU2tPd6/9S6YredNFFkcdXPln0Nij12md7KBvVzvxkVn
	YpOI03rrVqAdcRR91waxxqQuFoArrL8k5G1QwwxvySx9lnD25wQzf0/m4/cc/K0V+6pVCgcU6vMzL
	9N7+TMOI0jyChhq41JNsqM3NOzxvEdy4/2YM2zY7w3ErzpDtwBGVzABcy8MNIPrWBD12zU/fKUFG8
	arSBZhEUC5/nxKX/110S/zQCGD+zzosdunRy6TZEkJd1muSh8jPtdufnvx1tp6KZBB8b8Np3lcTux
	oi4xy3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCNhp-0000000GLpL-2DK2;
	Mon, 13 Apr 2026 20:16:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCNhn-0000000GLnI-36PW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 20:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FE7844512
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 20:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCD5C2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 20:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776111382;
	bh=j114EYxMPzWh3j8156US6so/8rc9cDU/wlHx2kr7Y4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uWF/artpWbuUnSooqdOaYbgdDRAeFll3VhcPUYZa5vgqoQ7IhHEQlKE0KYTCM5l9t
	 ekRnDW2zc4gzX6D94EXcQ+tUAhrImnJ5HrNgbS+bQstwEXTsjiyKq/ecFsOA15fvu6
	 TRCCKvnMTxBWHA9zuYX5Fjzi0n2zC/gdP2HCCztGqwSf3v+nFjSnt9UKvgM+ZU5hNO
	 a8edlJASLhuAaPWYWK7F0H+tQC2HKmJwQUqJwT79FonWVculVyU4ssABo8CZzn+TUU
	 MS+uf6K4edg+MQdynF4XJfkqCG56ScCMxT8ITH+KR1XvpPyCjPVEtm28D7NhyH2rvg
	 FX64rcF/wpSTw==
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89fc4147f2eso59800606d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 13:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lpc9C9tU2qPnpuojgnrn9+PQE5paq6rC3nLYcrcxzNiDoCx8Jk+PvCHsIbNBgxPFbIfs7d4wOaQHsinxQxMb+@lists.infradead.org
X-Gm-Message-State: AOJu0YwMV3YXVw02p7aCdg9SZEQ31bafHrewB3FIQaR0hcM8kPyzfOnJ
	MNsko/KD141MHd4Ga+GRy+/4ZcFVZHOdJfoGTSsJMejxg4F4/yQkIO7msfx023yDE5SZEzcQaOS
	wrhl9PJEnR2ZZhWHWQed/qLr2OFB+9HE=
X-Received: by 2002:a05:6214:4e85:b0:89c:806c:8c with SMTP id
 6a1803df08f44-8ac8628f246mr220911296d6.28.1776111382042; Mon, 13 Apr 2026
 13:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-4-baohua@kernel.org>
 <ad0U-IEvZkFwpBsg@kernel.org>
In-Reply-To: <ad0U-IEvZkFwpBsg@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 14 Apr 2026 04:16:10 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wnUvknCzM=jpDEDrdUKcrAR5MA2EW6eqCfGKgQWF53YA@mail.gmail.com>
X-Gm-Features: AQROBzBvu5KJKBkdHpOmlCQrUcrzTZlrSvZUBKKBwmAj4xBiS0yTsNJwhuzfp74
Message-ID: <CAGsJ_4wnUvknCzM=jpDEDrdUKcrAR5MA2EW6eqCfGKgQWF53YA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/8] mm/vmalloc: Extend vmap_small_pages_range_noflush()
 to support larger page_shift sizes
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, david@kernel.org, 
	Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_131623_840689_69D16D52 
X-CRM114-Status: GOOD (  28.26  )
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

On Tue, Apr 14, 2026 at 12:08=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> Hi Barry,

Thanks for reviewing, Mike!

>
> On Wed, Apr 08, 2026 at 10:51:10AM +0800, Barry Song (Xiaomi) wrote:
> > vmap_small_pages_range_noflush() provides a clean interface by taking
> > struct page **pages and mapping them via direct PTE iteration. This
> > avoids the page table zigzag seen when using
> > vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> >
> > Extend it to support larger page_shift values, and add PMD- and
> > contiguous-PTE mappings as well.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  mm/vmalloc.c | 54 ++++++++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 42 insertions(+), 12 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 57eae99d9909..5bf072297536 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -524,8 +524,9 @@ void vunmap_range(unsigned long addr, unsigned long=
 end)
> >
> >  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, in=
t *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> > +     unsigned int steps =3D 1;
> >       int err =3D 0;
> >       pte_t *pte;
> >
> > @@ -543,6 +544,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigne=
d long addr,
> >       do {
> >               struct page *page =3D pages[*nr];
> >
> > +             steps =3D 1;
> >               if (WARN_ON(!pte_none(ptep_get(pte)))) {
> >                       err =3D -EBUSY;
> >                       break;
> > @@ -556,9 +558,24 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsign=
ed long addr,
> >                       break;
> >               }
> >
> > +#ifdef CONFIG_HUGETLB_PAGE
>
> Why is this related to HUGETLB_PAGE?

This is also a question I asked myself during development.
Currently, huge mappings in mm/vmalloc have an ugly
dependency on HUGETLB, as hugetlb provides the APIs for
mapping multiple PTEs. Right now, set_ptes() is mainly used
for large folios in userspace; if it can fully support kernel
page tables, I would be very happy to remove this dependency
on HUGETLB entirely, including in the ioremap case in
vmap_pte_range().

I recall Ryan once mentioned some issues with using set_ptes()
for kernel mappings?

Once that issue is resolved, we can entirely remove the
HUGETLB dependency in mm/vmalloc.c.

>
> > +             if (shift !=3D PAGE_SHIFT) {
> > +                     unsigned long pfn =3D page_to_pfn(page), size;
> > +
> > +                     size =3D arch_vmap_pte_range_map_size(addr, end, =
pfn, shift);
> > +                     if (size !=3D PAGE_SIZE) {
> > +                             steps =3D size >> PAGE_SHIFT;
> > +                             pte_t entry =3D pfn_pte(pfn, prot);
> > +
> > +                             entry =3D arch_make_huge_pte(entry, ilog2=
(size), 0);
> > +                             set_huge_pte_at(&init_mm, addr, pte, entr=
y, size);
> > +                             continue;
> > +                     }
> > +             }
> > +#endif
> > +
> >               set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> > -             (*nr)++;
> > -     } while (pte++, addr +=3D PAGE_SIZE, addr !=3D end);
> > +     } while (pte +=3D steps, *nr +=3D steps, addr +=3D PAGE_SIZE * st=
eps, addr !=3D end);
> >
> >       lazy_mmu_mode_disable();
> >       *mask |=3D PGTBL_PTE_MODIFIED;
> > @@ -568,7 +585,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigne=
d long addr,
> >
> >  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, in=
t *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       pmd_t *pmd;
> >       unsigned long next;
> > @@ -578,7 +595,20 @@ static int vmap_pages_pmd_range(pud_t *pud, unsign=
ed long addr,
> >               return -ENOMEM;
> >       do {
> >               next =3D pmd_addr_end(addr, end);
> > -             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr=
, mask))
> > +
> > +             if (shift =3D=3D PMD_SHIFT) {
> > +                     struct page *page =3D pages[*nr];
> > +                     phys_addr_t phys_addr =3D page_to_phys(page);
> > +
> > +                     if (vmap_try_huge_pmd(pmd, addr, next, phys_addr,=
 prot,
> > +                                             shift)) {
> > +                             *mask |=3D PGTBL_PMD_MODIFIED;
> > +                             *nr +=3D 1 << (shift - PAGE_SHIFT);
> > +                             continue;
> > +                     }
>
> With this vmap_pages_pmd_range() looks quite similar to vmap_pmd_range().
> Any changes we can consolidate the two?

vmap_pmd_range() is for the ioremap case where we may have
8MB of contiguous memory. This is the case where we have
8MB total, but it is composed of 2MB chunks plus some
remainder. We might be able to extract some common code
though.

Thanks
Barry

