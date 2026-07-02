Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F3C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRnq28DDl24qnaxUog+KvBCqX6qAEmcRjJsw32pyFNk=; b=Td2MLWsKv/82qSkbegd8uQ/tGM
	ulbizBTqXacdcCv8V4GyJe6VRjMT4RKWTUSg3KkLSSgcxx5h2LWaJSApdcBJzOYIfxo/TVsoKeNUO
	iv8V7UbedLhhMarSCJOQx+f5lqRZGgpDXd1T/1h93AlL0WVBdRjjtJezOpTDUw2cRiYPhTb/lpd9R
	ne5XzDAhFxWFpnnvEQuFt9hN9rWiM1aqa0C5ToCmH/NQx6Dhc18F1D+uviTuzurQoHCnGXusnwfGZ
	EohLG8PBjlC4MH0nu87Lsso9Wup+eA7pION3cWJ7Kf8V/8ErN5WiaW18LawPhvRiiwL58jdAWu2hB
	riXtDQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDZc-00000003zbS-3srb;
	Thu, 02 Jul 2026 09:19:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDZa-00000003zaS-1TqP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:19:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493be1b9564so11579465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782983944; cv=none;
        d=google.com; s=arc-20260327;
        b=mqbNG0bYiAnNw06PsU7i40KG221Kc+cS/4aVZpo7kgvf8YIfLCBlCebl2UBrTWoda4
         4FIMDwQWzvz6wKOLwbmkzTtZnWv9X/16aBmFD6tMjyMiqlawfjdSAtS2B/7f1glCcTiI
         wH4ecskaG5Q4s0VCSFTiDw4m3xHm8WauCSHeP+fv9BTrJiFifphapdlCziuM3n2N8lY7
         DKrCDS4CXOvIzFlioBMe/JShVH/rxI2av09Nnf65IY/e8/sWiuYsEbKTdpj1a1x3TeD5
         U2ixJS0MRfvPkxToIs5A4UFVTWnwzLDf/rSXd+0cfoOUeRAeVemO4VX6LnL8LHy6Ld20
         2qAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GRnq28DDl24qnaxUog+KvBCqX6qAEmcRjJsw32pyFNk=;
        fh=5dgpJyHlLRfG7UE0rHDFqZ/qAN4Ot8/QKn2x8/KYZPM=;
        b=ofKZYXIKpa+USQpAWvNiFiQnwcpNdHtLJWZhNcNfq7brkHfZas+V5Wbr8UiHw46T6T
         ucSWDhk4zvQFfJ+kvrtLybu7PfjoKLSoCj3lbXQQwsyC0faqa9EZxc2TTKR2Udof5v8B
         OBgXD4Fmol17WAIj0P4BpuWg5707sdtda8qZ270YOUBlGtXGxT9z9G1CT8/Czyvk4Y9P
         MpOI5gwyqonA4bU7IgW4vw3FDDJpnJpOdddrMdhRE7azEe/8Mhb0qQl5SK+OdVUKU4nt
         4ldd5BkgfC2PjqvnqrtKhQAbZhJJaQYrVh5yN/zxwNpzRybpq/Qjvv9y6uheLuvmLd1O
         R+aw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782983944; x=1783588744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRnq28DDl24qnaxUog+KvBCqX6qAEmcRjJsw32pyFNk=;
        b=qVV39tqRPXhhJN2h0RQs9Bwd4FAkZrupVl0yU2M1jqHkXD3q6arZaADncg2Zp2ThNH
         Wvq/YcIWGxoFYt+LNi8hpRskpY8SNOive1bWEVjVi3BKyPXi3rc1xRbwQDB+SIV1qtF7
         vqX5mLQGQeij3AjdCFLDfxmtSZS6s850H4hp6412J/EO/Bdz6dje00Ie6qP1JrgDCoSV
         LSaTWvOSrwrEJ51SqAYiUsWcxjV4ET2QD4Kx8gfNckO5JMgMQnqiw4fmCOWIrUa5QVjg
         sqh40Z9T/jL7PP/LHujeQXI7ciA1B7YpfblyVWfhRACOtEEKFTwxhJkVm7HwZqxW70rV
         bkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983944; x=1783588744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRnq28DDl24qnaxUog+KvBCqX6qAEmcRjJsw32pyFNk=;
        b=nZi2PbXIgAoHATl3hNzg5MYnrn+DkPHCisKfMdDBPHoK7/eEL+3exMp15eW2fiQKxv
         Mr+E9MpYc7RDeIcHDG472FgUWpPfnLhcsNsydJAj120rgOV1xovqnRhEUIiOe8POtjeZ
         Xqf08zDauG9bUvgHh0dQwucVwt6BalWdcJP08rM2FgZ1s+IpEIVTj0YqDbU8Cb55ZLpY
         KyteNRZwU/eYYuAceK+0A93a0y9P8WUTmzFFlsTKmhi6WsRM3NiVH6OdONUwl15IqS/F
         xHysanPi6YP50jKA5ZuN8W701qNcULKLAkRAOo14AutgEj3+4EUQOmUGUm4NX7Cs+3K0
         +1rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0eaAqT9/qRCaVptNBlW4eM/G/3wikpVPGI0VzCBbZ9hdVMCoOwpdWeH6gcgvECv9BA6Nisi+WwDzzh75vcvhH@lists.infradead.org
X-Gm-Message-State: AOJu0YwreV8abTxmx0iNoTwd2OSGz83g2SxVbhhRNtsJ5OhHez8h5W/x
	MwMbdXCqD/K4HPsLe3lKIcxz9QL6u8XGgnszO+sReWRpD8i9epu/bRVGdkHu4F8Kk2PzQixX3Ke
	+zlBimyTiEgAUw5aUErvMFaUde5N3KZmCSFej
X-Gm-Gg: AfdE7clkYqJAKnr6AJISMLKLpqONwNkR6JiLxdzYqzFKgOh3D6DAki0mo8anU9eJS4J
	ZA5ZmZPyqpua37WDFu2KwmnUmdGqKKE0FSvdDbzxnFQQjfUsPQym7AzSoerncXV5wj+t+Dc7qxa
	OvM/+Yb+KrmlKqGsN0TOJB69uIMzu87egENC1sxL4BaBDRNJTq30YGaGZWtD/pd+R6mnHavtieM
	uxhtWOJWT3/kClKS+32uzQvac0a7ITWkYbmWPYj992e2hP8+sMgEGJ1SOllv+wNqP94FlrX/A==
X-Received: by 2002:a05:600c:3495:b0:493:bc4b:b8c with SMTP id
 5b1f17b1804b1-493c481e711mr41657125e9.38.1782983944234; Thu, 02 Jul 2026
 02:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-6-jiangwen6@xiaomi.com> <akPKkOt_GNbAbyN5@milan>
In-Reply-To: <akPKkOt_GNbAbyN5@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 2 Jul 2026 17:18:51 +0800
X-Gm-Features: AVVi8CclOI6-gGVe16jF5IrmDMEzt1cLHCgvcCxx0kXItuJQtnGkF-lvLQOZ_ZQ
Message-ID: <CAHKocdGiK0ij7FopLi6b_rQ3CDyVr=ARbC4cCwNG=pY=iTME5Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	baohua@kernel.org, Xueyuan.chen21@gmail.com, dev.jain@arm.com, 
	rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_021906_426993_95FDC117 
X-CRM114-Status: GOOD (  29.06  )
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

On Tue, 30 Jun 2026 at 21:54, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Thu, Jun 18, 2026 at 04:47:25PM +0800, Wen Jiang wrote:
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
> > whenever possible. The mapping order is determined by taking the
> > minimum of the contiguous page count and the pfn alignment, allowing
> > graceful degradation when pfn alignment is less than the contiguous
> > range.
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
> >  mm/vmalloc.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 85 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 253e017130e09..fffb885cb2158 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3545,6 +3545,89 @@ void vunmap(const void *addr)
> >  }
> >  EXPORT_SYMBOL(vunmap);
> >
> > +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> > +{
> > +     if (arch_vmap_pmd_supported(prot) && size >=3D PMD_SIZE)
> > +             return PMD_SHIFT;
> > +
> > +     return arch_vmap_pte_supported_shift(size);
> > +}
> > +
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             pgprot_t prot, unsigned int max_steps, unsigned int idx)
> > +{
> > +     unsigned int nr_contig;
> > +     int order;
> > +
> > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> > +             return 0;
> > +
> > +     nr_contig =3D num_pages_contiguous(&pages[idx], max_steps);
> > +     if (nr_contig < 2)
> > +             return 0;
> > +
> > +     order =3D ilog2(nr_contig);
> > +
> > +     /* Limit order by pfn alignment */
> > +     order =3D min_t(int, order, __ffs(page_to_pfn(pages[idx])));
> > +
> > +     if (vm_shift(prot, PAGE_SIZE << order) =3D=3D PAGE_SHIFT)
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
> > +                     get_vmap_batch_order(pages, prot, count - i, i);
> > +
> > +             if (!i)
> > +                     prev_shift =3D shift;
> > +
> > +             if (shift !=3D prev_shift) {
> > +                     err =3D vmap_pages_range_noflush_walk(map_addr, a=
ddr,
> > +                                     prot, pages + idx, prev_shift);
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
> > +                             prot, pages + idx, prev_shift);
> > +
> > +out:
> > +     flush_cache_vmap(start, end);
> > +     return err;
> > +}
> > +
> >  /**
> >   * vmap - map an array of pages into virtually contiguous space
> >   * @pages: array of page pointers
> > @@ -3588,8 +3671,8 @@ void *vmap(struct page **pages, unsigned int coun=
t,
> >               return NULL;
> >
> >       addr =3D (unsigned long)area->addr;
> > -     if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> > -                             pages, PAGE_SHIFT) < 0) {
> > +     if (vmap_batched(addr, addr + size, pgprot_nx(prot),
> > +                             pages) < 0) {
> >
> Better naming? vmap_pages_range_batched()?
>

Yes, I=E2=80=99ll adopt this naming in v5.

Thanks.
> --
> Uladzislau Rezki

