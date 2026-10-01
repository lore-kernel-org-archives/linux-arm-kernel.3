Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73336CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0ryAjqgJbQ97DrgWNuEBrn7YtVDsU7C9id15LD6WBU=; b=sCxqsdQ6tkVfuGwnORPsIigmEW
	OgppI0hiuUR0nhZEWzwPvXZReLgNI2H2NDf9SrCGf7323K8momv51KVrJkKN4d7lWTR1pY6r3rydc
	zwJYCzQamDenwn/6rmO2MYbVq5LDm8a7yxToRVqRx5OB4D9xIANZeYUrAnTV3nYKqHrKae/xlIwuz
	9r32UtYo54XS2WecctVTE/VIV4IfRQRCthL9fa6QrUAhG1KHKuU3CMo2+ChiJpUkrOvFCZgPb22bV
	EyYxWmrPOnbijYhjKFXxytGO3UKWepvoWnL3Qh4bj2WWMxaTlBF1ap/3Q7AQV//NBGvBF55BKLbCY
	LleAcDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBgc-000000084gR-4B1j;
	Thu, 01 Oct 2026 07:58:38 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBga-000000084fy-1GAB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:58:37 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af4663da5so2072989f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790841514; cv=none;
        d=google.com; s=arc-20260327;
        b=WQVVBRAmnovVabPBqrnDcC84GjBl6jQ/A36HxsMcPRyE8oMXTeE75o94maxQqlL8h2
         H+/Hvos5p5loou5jWXj4xymM95A5+YDweS8GD3GeDi5JqJrnjvLtLDpPWOy4KeWycMWW
         6k8krgsBJBm0qVW+J8yABODVudFnJUjBDqK17sLcyWHDKiEefWFSMlh8kHFclPMfSgTJ
         oMxR3xEhzB1rqZeb08KDRZr5BUUeDJBmXUphsN0MQBv/HvCRdvZWsJqEVlzRHW29NwKk
         ylQ6c98BjR4elaoxhpVsqnTKj5WFGbFy0z5dqg6wUKWmwlptaKJyVIPRhgM+pb9Fgr1Q
         i5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I0ryAjqgJbQ97DrgWNuEBrn7YtVDsU7C9id15LD6WBU=;
        fh=hfWcUKGcjzL9M6L3JwWFrtFiqr6e89QTMgbvkhyV9eo=;
        b=Uq+D2zitsxujTeESZhTpfJ/rD/0vUtZ5/paBXvPmgRhLaiZUOaX8YNnnVMJ6iATPL4
         2/DLE+Nu+Lw5/sWJZKFzUbnQsjZ5Q9ZrOUdYXPJNfBPN9QibjuLF4Nfy52C7vZKOfZmx
         AtNpUN8Ll3bO+yaTBQqkByczxBNZqAjEwHnehhWiqePwd0dJeqYgF0kggJvNkDYwyj5K
         M+AxJZa8fwj31UJblH722XdJH3LW1CHHNhNTpqSIO91dOJOcAqZX7ijwBFoYZ3RhgoW8
         YrLWYKeXJuO+JRhFtfOtAfsur5HWbrYtv27dMBO1nWJPYI49KBFYL17yZIB2v9kxozZO
         WFkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841514; x=1791446314; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0ryAjqgJbQ97DrgWNuEBrn7YtVDsU7C9id15LD6WBU=;
        b=mVFuwxpmXXtnP7tSCXoY1m7aXwSxpfMcg4URBGclojx4F8nEizZji6ji42t8HJg1uV
         UOASy5r8paYgZCfld3iG33fotQpcAsE5/OfiH5rvZ9rFCsndw8j5lixGLa7oFkgBe4ku
         CW/l8FqnfqyiB8h81KvfKw6b0lE6tcbO/R/h5BbE+h3ghjZ4/4/sABYPVhbp3sMw75vS
         JeJwTvRXhhZ5GN4gkZvbfcLv9VJBPXnx8HI6cNm06qyLxtP5Vrw71RMpo5J3hZA/UY/+
         75wMVQPEE/h8EHFKF3zQWhE3d0suYrGKOs5g6tOQGVy3jkt5AVfQy/c0dgEQQkHhGzZU
         hoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841514; x=1791446314;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I0ryAjqgJbQ97DrgWNuEBrn7YtVDsU7C9id15LD6WBU=;
        b=QR0hb86fnECt+g45eiRAwssMMKunTuxjMn0mRjy0Tu9tMjHHwWNUgW0gdAzfzlPJhk
         eezM0J8N5+R9PjmuAZP/3TMArEhChxO1g6B73y9d/3MJgOYyLwGGAcRipUhHUgFSf/u/
         P5/me3rs3KoZAts9NnaGQlCDlwg6m0V5saNwHKM6Bsdco7UKBaF9Bx/McpKGcnbQT+qM
         FPsqdqqgiiDKq8jnp5dcuK+pxbtjFvtQL5XQi5qkgwqALhDu7z3LFohgpRkv7Ja81sOc
         FhdrGuXPjPDtS3uRKpt80zPVwdiIAIhD/ZvLihXYZUbYgWzDStQeB5xUIGs5mmY85ApR
         L4Ew==
X-Forwarded-Encrypted: i=1; AKwUvByGUAiNvBV1e8BT2+OFs4pyUD7ADcmKBfZjFo3kED+MFjl6hwBBWzGqaG9pkvVG8zG/M+hHLEJyTaabg2RrvO6d@lists.infradead.org
X-Gm-Message-State: AFq9FYJU+NGBptNvDVIabskLt+BZ9F2+nagPeak0TaQaBkEh8I2AHvQq
	ptYMTJIIfLv5hioiTrdFu/Ew3ltyxFDBO6+EV+H65BZaKe8CPvXq4Bx4Uu7yYmLDj5pfFDMlCEW
	bvwB9vnRwU89PAnvnTLDsO818Yyvbtsg=
X-Gm-Gg: AYBFou0TfagXEJbvy9GfCN/QKKuQUYzZX2pTXMDM5s8jKDvkD63SVwe+g/LKypBStpX
	vBpIzDT04sxo5z0OtfsRzC+TezJ0zFjDuxlrY6H2uQ6R4X/V6J402kJ1S61W8VKbp4Ija18HNJN
	OSvmn6ZIfrC/9le2zcKt5lBaVA50Jr1/Fr2qVAxk3wgihsUn9ElmjxaZR3pKZvyxEwTO3O6GuTV
	bnVtFn2VXGeU4pkdy47kC3jjoXD3PPolnaajrR/R1XP6b8x2OS7WBeNGVdBJuMjejqw89a4kySP
	ao9HfoJvy2DhLZb2wnYp0iyLeh8wRQAafgFVSN1aR8IkkmkEFNiQ9qMGWbR0UlLWKms=
X-Received: by 2002:a05:6000:4a19:b0:48b:1b6:3df8 with SMTP id
 ffacd0b85a97d-48b02520a95mr7176472f8f.35.1790841514203; Thu, 01 Oct 2026
 00:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-7-jiangwen6@xiaomi.com>
 <ar0fJcjNmGGV6uFu@milan>
In-Reply-To: <ar0fJcjNmGGV6uFu@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 1 Oct 2026 15:58:21 +0800
X-Gm-Features: AclHuK_89bv7uwzbXx-_ECYL_ZRmqX93WJQq5H0UucnAezX9o9f55Dqa5iDge00
Message-ID: <CAHKocdF43Rqnt8-v0WP-t=Dxz2sSJ9xpyjLAYc2fzzKAW1_N8A@mail.gmail.com>
Subject: Re: [PATCH v9 06/10] mm/vmalloc: extract vmap_set_ptes() to
 consolidate PTE mapping logic
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
X-CRM114-CacheID: sfid-20261001_005836_392920_ED30EEF4 
X-CRM114-Status: GOOD (  26.26  )
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

On Wed, 30 Sept 2026 at 22:39, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Wed, Sep 23, 2026 at 02:28:28PM +0800, Wen Jiang wrote:
> > Extract the common PTE mapping logic from vmap_pte_range() into a
> > shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> > PTE mappings in a single function, preparing for the next patch which
> > will extend vmap_pages_pte_range() to also use this helper.
> >
> > No functional change.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
> >  1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index fb757d95bde25..d475e52110e4a 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -92,6 +92,29 @@ struct vfree_deferred {
> >  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
> >
> >  /*** Page table manipulation functions ***/
> > +
> > +/*
> > + * Try contiguous mappings at the PTE level for arches which support them, and if
> > + * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
> > + *
> > + * Return: mapping size.
> > + */
> > +static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
> > +             unsigned long addr, unsigned long end, u64 pfn,
> > +             pgprot_t prot, unsigned int max_page_shift)
> > +{
> > +     unsigned long size;
> > +
> > +     size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > +     if (size != PAGE_SIZE) {
> > +             pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
> > +             return size;
> > +     }
> > +
> > +     set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
> > +     return PAGE_SIZE;
> > +}
> > +
> >  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >                       phys_addr_t phys_addr, pgprot_t prot,
> >                       unsigned int max_page_shift, pgtbl_mod_mask *mask)
> > @@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >       u64 pfn;
> >       struct page *page;
> >       unsigned long size;
> > +     unsigned int steps;
> >
> >       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> >               return -EINVAL;
> > @@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >                       BUG();
> >               }
> >
> > -             size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> > -             if (size != PAGE_SIZE) {
> > -                     pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> > -                     pfn += PFN_DOWN(size);
> > -                     continue;
> > -             }
> > -             set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> > -             pfn++;
> > -     } while (pte += PFN_DOWN(size), addr += size, addr != end);
> > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> > +             steps = PFN_DOWN(size);
> > +     } while (pte += steps, pfn += steps, addr += size, addr != end);
> >
> #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT) - how many pages covers the size.
> Replace steps by nr_pages or nr_ptes?
>

Agreed, I'll use nr_pages. Since vmap_pages_pte_range() in the next patch has
the same "step = PFN_DOWN(size)" pattern, I'll rename it there too.

Thanks,
Wen

