Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF51BCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WUeRXQIxnR9XpkkjIeWQnzVeCWSoXoruQ6cCNl/Q6Q=; b=gXfiFvnxveS/ME5VqCmNyTkSzc
	KU0+65ZhyKO0eZ7WE335sIRav6KfaQcJ+MkHUxYtKOt7Z7ClTPTwC7Igtgspv6xi4RMD6jfz4AgPL
	mZ5Jle4OXpsn87e+G/364qLqtXTbK8+nxYqfJnPaTaufk0EEbZIrQhVWNbOILldliz/7Occ17+7Ph
	q0ZnGeqdqdlNqPwv9O+nLpJ+BMbaH4hzN24eBE6gWHgvk3DRJdl8EEsa6myF2AbOFHzTWvWdHeHCi
	2F9dPAoIUoawTUtZXinQqZFl9M79K9KJrJNwWjCU2l58U3jZ1PtOLbkyvELLuAXnkO8pzq2zx2VqT
	dYtp4WBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBrJ-000000085xz-1hLO;
	Thu, 01 Oct 2026 08:09:41 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBrG-000000085xb-3HqW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:09:39 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so3798405f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790842177; cv=none;
        d=google.com; s=arc-20260327;
        b=cMfeEHI26VvBul1x2K2i2MtRQQi5nMIdYQTHtHDwoPQQy3fB/LKh8P7RBG879deP2C
         oIPVR3Ge4OKNtP3LQMBPieTHz5xQF5A93VQKnYiJizdVMnTkQbKShwWS+1beSgZmkZa4
         RAGVPbPOm7xP7+hCGxP7LgMamiYnQCjDKl3iY2CTFp0w/X4vuKzc+odQ+vgyCZlX9UZ6
         VtFm04GROE4Yt7hFbmCmhDcwe85+gErjRQ6zl62735Dg1yXjnR9TZK44ZVSGa27EDZpD
         DWu834+TUWJQsJT7yHtfdaASeluorzgiSrx4K70i0fI4Z8ALiG9fIEmvWHYmIOXHeeLx
         ZkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7WUeRXQIxnR9XpkkjIeWQnzVeCWSoXoruQ6cCNl/Q6Q=;
        fh=B9p25bCUY1XYx3p7ZIr9ZL6IHAbxcwRvsYDKbeOiFlA=;
        b=OixuycMQs3KNsh+luk7XGGNjUVmIkc0+y9CgxNrI82J7gyQ0mk37Dxl6SgLk2GITto
         WoNaXtERUZk5CCZp0MjLUhsu5PViX3OJt4l4trAWRY1uAz2aRlCvRgs4zvFUXNQlNdXl
         W4W1snqBxr4gzvyV5Q9pdLO6v2rNFnBUMa/we0HcEDaiHuXJETNWfO87DpBjh/lOjJSv
         QTFnr92dt//SokhRcctYd7t7ZsFspFiUzs2SwcrAxKu8g6cM2PFvd9psvJZtJo7e5XGY
         sXdXd4KvZ7ShV584SxC/0BE19tNqDeoDCkhhps0fPLeA/QYjRTfNFacr2LZNowuD+lhI
         430A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790842177; x=1791446977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7WUeRXQIxnR9XpkkjIeWQnzVeCWSoXoruQ6cCNl/Q6Q=;
        b=YwJu3CISmqM/jeQBAMUFYWq6xMpv0nV2Wv50WVQNRjrjeekYvZpgA4v/wYe0MjskGb
         Z42Jlo3ZHFt/K9sR09JUj9/A/7uiJYMRwXYWiASz77Yw/VttPiSE8i1QRTPvIM2uKJQ7
         EERiPleziqIcystxwAnciZ0vo5zOQ70M+5672E43Gc3y3TiUM1iIsYCmhwFELxR5wpu4
         Dj80yY/65de4PMfEUhpSd5RriUb6cGWQ5WTs2iSDtMi/1c2IU8PFJHgDQfqxviz8759Q
         gSkYLvRGhMqWkKCvSaJUUVF6gvxT4xDXD+cCR6q4n0I709GhZaP+1G/PWp4KG5HBwC/P
         kSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842177; x=1791446977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WUeRXQIxnR9XpkkjIeWQnzVeCWSoXoruQ6cCNl/Q6Q=;
        b=nIkZQgoq2CZsManC+jIw6Aql1vS1rgaG8nUJ/xo7z3u1qk8y5wFMQgwC7OT7F3PPHM
         /D7MwEl6tfxypTdNdgOkAGbbm8xNRcnwxPrf7+Fzz96MFvX81MyPksFKYG91ym7n0ZqG
         0oGdSUKClnN7zG5HKelIu0dpjRcFVnYxDnyihGxzsDyeU6jqSNwx//5YnF9DdoPE8e3J
         P8TBJx6fqRde/PNy/xe9DKYafpKsZLdW0crVzijMQtmZUvK3xHWFfbFAJ6Wk5tjvR+CB
         a5/CZbvDa71C9jDcv8HAEugCeRv1Lbn3e6bZ4uAJP+Fsfu3kc+Ub2pdf7b5jjcZ+ehfX
         W4IA==
X-Forwarded-Encrypted: i=1; AKwUvBylgMH02Y5bASFEtHQZj/c7vrBXzc2mnN9Ap6bg80siTaUGwWB5d6lUOygDncvdZVoQ78ozZerxode9nvblRBrb@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6eYz5CBNPOmGsMobUTdX4yaSoZE5E8W4yQglG5B9QMmkHeKB8
	Bn6hAl7n7dosI+qS7i+ByyTOg4Xcn9e6XwBHqZ5vvt0HXPfohPtHKgFdzP0v43uj/RXrqrhDQT9
	fEdJpQEfQsUt3EKwdSvgkCG2xdPTsbas=
X-Gm-Gg: AYBFou2EkJtZNRIxZ1zSJ6pNypbzsb5tF4w65ExicmRBr5n+p68TRsgTJzst4SIO/bC
	QZV1RKNaFpDTOMm0vzEf0GhimeXAChY8jc7xG/FN3p/hMyte7CC/bPUydetrRj2B8wSQ3e5LI6R
	93Rr942Q3zaPVZDNtDMLZjwOwSiBqtQAiRLPtzX70Ls3+YDxH+/sJfxg6Chvn646q7NYzP9ffLx
	EGyOzlkfytI2D20zH0pnF1BcHK3FHdcSSLxReGQE1QVDOL69QWpx64UTWGaXxGUd4qxfxyb8DeQ
	s0wfLPsiA9E2uVmWgvWYJ/MjM1YQ9b10h++jFB1gUz6LTFjEaJR2fLc2
X-Received: by 2002:a5d:6f0d:0:b0:48b:677:f80d with SMTP id
 ffacd0b85a97d-48b0677f9aamr3770293f8f.26.1790842176618; Thu, 01 Oct 2026
 01:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-10-jiangwen6@xiaomi.com>
 <ar0lMkKxugZV7xyw@milan>
In-Reply-To: <ar0lMkKxugZV7xyw@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 1 Oct 2026 16:09:24 +0800
X-Gm-Features: AclHuK8OMAhb_UVj1_7OhXb2I-BHJ5VHW4np9K-mqeZSCcIAGrWhZjO-kRMUNUQ
Message-ID: <CAHKocdEqnCCyW1TgmiRotFO0hQdHt7pXP1sdqzZ7Up6wc+-Bsw@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_010938_863910_2E41650B 
X-CRM114-Status: GOOD (  32.80  )
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

On Wed, 30 Sept 2026 at 23:05, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Wed, Sep 23, 2026 at 02:28:31PM +0800, Wen Jiang wrote:
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
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 80 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index a43965016eb4d..37cddb7f45a4f 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t pro=
t, unsigned long size)
> >       return arch_vmap_pte_supported_shift(size);
> >  }
> >
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             pgprot_t prot, unsigned int nr_pages)
> >
> get_vmap_mapping_order()?
>

Agreed, that's a clearer name.

> > +{
> > +     unsigned long pfn;
> > +     unsigned int nr_contig;
> > +     int order;
> > +
> > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> > +             return 0;
> > +
> > +     /* Limit nr_pages by pfn alignment */
> > +     pfn =3D page_to_pfn(*pages);
> > +     if (pfn > 0)
> > +             nr_pages =3D min_t(size_t, nr_pages, 1UL << __ffs(pfn));
> > +
> > +     nr_contig =3D num_pages_contiguous(pages, nr_pages);
> > +     if (nr_contig < 2)
> > +             return 0;
> > +
> > +     order =3D ilog2(nr_contig);
> > +
> > +     if (vm_shift(prot, PAGE_SIZE << order) =3D=3D PAGE_SHIFT)
> > +             return 0;
> > +
> > +     return order;
> > +}
> > +
> > +static int vmap_pages_range_batched(unsigned long addr, unsigned long =
end,
> > +             pgprot_t prot, struct page **pages)
> > +{
> > +     const unsigned int nr_pages =3D (end - addr) >> PAGE_SHIFT;
> > +     unsigned int prev_shift =3D 0, batch_idx =3D 0;
> > +     unsigned long batch_start =3D addr, batch_end =3D addr;
> > +     int err;
> > +
> > +     err =3D kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> > +                                          PAGE_SHIFT, GFP_KERNEL);
> > +
> > +     if (err)
> > +             goto out;
> > +
> > +     for (unsigned int i =3D 0; i < nr_pages; ) {
> > +             unsigned int shift =3D PAGE_SHIFT +
> > +                     get_vmap_batch_order(pages + i, prot, nr_pages - =
i);
> > +
> > +             if (!i)
> > +                     prev_shift =3D shift;
> > +
> > +             if (shift !=3D prev_shift) {
> > +                     err =3D vmap_pages_range_noflush_walk(batch_start=
, batch_end,
> > +                                     prot, pages + batch_idx, prev_shi=
ft);
> > +                     if (err)
> > +                             goto out;
> > +                     prev_shift =3D shift;
> > +                     batch_start =3D batch_end;
> > +                     batch_idx =3D i;
> > +             }
> > +
> > +             /*
> > +              * Once we fail to batch pages, we expect to fail batchin=
g
> > +              * for all remaining pages, so just give up.
> > +              */
> > +             if (shift =3D=3D PAGE_SHIFT)
> > +                     break;
> > +
> > +             batch_end +=3D 1UL << shift;
> > +             i +=3D 1U << (shift - PAGE_SHIFT);
> > +     }
> > +
> > +     /* Remaining */
> > +     if (batch_start < end)
> > +             err =3D vmap_pages_range_noflush_walk(batch_start, end, p=
rot,
> > +                             pages + batch_idx, prev_shift);
> > +
> > +out:
> > +     flush_cache_vmap(addr, end);
> > +     return err;
> >
> On error, if kmsan_vmap_pages_range_noflush() succeed you do not do a
> proper cleanup?
>
> i.e. to cleanup KMSAN metadata: kmsan_vunmap_range_noflush(addr, end);
>

The KMSAN metadata is cleaned up by the caller: on error vmap calls
vunmap(area->addr), which reaches kmsan_vunmap_range_noflush() through
remove_vm_area() -> free_unmap_vmap_area() -> vunmap_range_noflush().
That is the same contract as the pre-existing vmap_pages_range() path,
which likewise relied on the caller's vunmap() to clean up. So there
is no behavioral
change here.

Thanks,
Wen

> > +}
> > +
> >  /**
> >   * vmap - map an array of pages into virtually contiguous space
> >   * @pages: array of page pointers
> > @@ -3619,8 +3698,7 @@ void *vmap(struct page **pages, unsigned int coun=
t,
> >               return NULL;
> >
> >       addr =3D (unsigned long)area->addr;
> > -     if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> > -                             pages, PAGE_SHIFT) < 0) {
> > +     if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), =
pages) < 0) {
> >               vunmap(area->addr);
> >               return NULL;
> >       }
> > --
> > 2.34.1
> >

