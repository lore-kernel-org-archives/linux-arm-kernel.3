Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC22C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 00:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFqARnaWsfVIsueHxYAc51tuCHmb5rqqqqfMHtoWdZU=; b=Fi6o7xr0ScH4eBwVB8kjv78PWl
	AhIFZONFkTgdxtNXTwas6aX8b9z2geGghrPvXAZbhIOzHTVVwsRyI0PD+V0szxdi9HWt1TAy4gk+B
	xGxMskOAMzmO5JI5mqNn34VCCKJCfDDLhQneR+wSYi2pIfoHIA/bY/Jqa2PkFpm5RU0peHu7p/5pf
	7UReKqkxLtryCOIPwuiGmc08q0VS1zaux4IjavhW3s93YbpofAmHbGEOO2x/2v2WZWMW914jLvkzj
	Uf7ZxRKRcT/+27riAPqYY5zkkq1j4cT99jhbK2Q+59zdg2Gtd9gAwqgqKZp2zoosPjp8XhKzU9hVG
	+UTZHwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyerF-0000000HWgk-0RY4;
	Tue, 25 Aug 2026 00:17:41 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyerC-0000000HWgH-0Lr6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 00:17:39 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so8156071a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787617055; cv=none;
        d=google.com; s=arc-20260327;
        b=UPt2CqXd/YitLz+AZGzrC8ppUonpajf+xN6WaXQieC7mqL+QJuaxSU+BbuF0P9ojlx
         T2Gr7StqldxHzWbFqHfH//ufK52BJlz5LbHlluQqxrjEt8+z5pk4botxQkYK2qyqYDKf
         LRrPJo1NylzcPKL5K+6VitxBF0BMnqsIxla5jJPcRRPx8jf2cDcjfWPZhnYN0DgZaOtW
         eBoClFIte+ArRGz4o7D3o0BmgvEAZj/et/NIARYMqw1x8zvbEWai9s0FcpnK4Ba5kJk/
         Nmchnr3PR++dxknpSo0uvo02/5UVDARZkFrFDhPDgzVyG+j17grvtVLeP3vrsHT/5FWv
         35WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cFqARnaWsfVIsueHxYAc51tuCHmb5rqqqqfMHtoWdZU=;
        fh=85nDYd9rp8noPvQXXwanCXwVyYYnyJzgqjCPm5moxaE=;
        b=FjAsqa56HUq7Inu+PP1SV9MDQ1QYBbvQioncGXTFIwmfWVhiZh2Qsz2wosnJ5wSxKk
         hLqz7LoYeJ0SuehQseUaZTshhe+Ti+v7W9q/x/ybTV5XRRC2yRB35oRAXPksbdkJrGs2
         2urSTC7UfFXFkDzSYFfPmeFxAD3aJaRTP4MpxY+zjtbQ2utwnH8PBcJXB8dX9Z0sT05K
         Zl+cF7+wAwpbpwzx114bEr/phOA6DDxiarExqtWV04fbBm5cuvIhXWKu5NpgxORYwlmd
         YtYhVXgU1srF0k/wcm8Xs93ReaxFgry4x0KrHkMncHVChuWYbgculJ5dv14APWNfHeT/
         H9zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787617055; x=1788221855; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFqARnaWsfVIsueHxYAc51tuCHmb5rqqqqfMHtoWdZU=;
        b=OCCy50mL6itbC83aKHsVuix8kxn/Di3EemsTaICOfb7fzuUGyk2lI8PwhAoacO63Ia
         HLi8VXF6aLpCK+cZXBVwutLOyHyrAyU/KVIlnzBFcdZVVxlRcE+PRZjW0JVQqlascPav
         jAPGCSLKxbaukgHA+/qt7HkQnyhCA6zyjqCQhhCeKaU+tr7nMYhNVyRDUNw/vdvFpWIS
         HU8H2z3jymgC62rngLQRLYD4jwCNH1P1hGHvu8nnoeWk3uAa1Xz903TGzNRNMfZ2YodZ
         hhB/xRFUQJVYWdf2a0m29RR50XnGsMGBt4y3glgUAFiVUfBj3GxRM1XRbZtD4+7nVgDv
         DV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617055; x=1788221855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFqARnaWsfVIsueHxYAc51tuCHmb5rqqqqfMHtoWdZU=;
        b=pmE1SFOsHs8EVXrLBxBIngpuv4FcyZrRYc7j3ywvDW4P5k0hynqejjNg44Sen+eSF2
         fpjDoWHam5oXtl0uu4sdyM2spbrF/9BOpo6XzF2T0nWq+hhB8t/Sw7Xe4NTJ3zwH3Fd3
         dLDHDJ1okZ/GsEsGS1xY0w9b4C+PNNGJvCgZe05RT1fOSTXz5XH6lmzO18Hdu2D4s1vH
         yGKQSIUY1fN2our+89BdW3e+m0zpJU34DkbCLePtfzVVgl/BocA1igW6qGjv/OzqaSXg
         eANMyLx/2bwO9QLwQCkw3C2GrPIeRx+X7cIVd8rp8f5CbCZyjihES7K3EqkvjqmQ9qkE
         Odzg==
X-Forwarded-Encrypted: i=1; AHgh+RqjHoAe08wFj/MEhmn5/5yX6L+BcfomSkQ0KYSvYGyl2u2i2ZoJJGJQWsVZK2Ukzrn7fk22o8gM10xVVww2iV7s@lists.infradead.org
X-Gm-Message-State: AFuF++keF4QBMFzmGlgd8PokFB3YW/T512zWMBwI7a7BQgaSlafL725R
	gkSgLL43bISdRn/unXbZ+gLo36n+Km0ET5hjHp/rUFAGCwyGf1LOw2ZSdfHG40tkD0iMRu4ZGT7
	b7ps6QjQbnb3/+OZJVFJzyyprHxzAJI1aK8aSqaX7
X-Gm-Gg: AR+sD10ElkSWdMNUL7/T0htrH2vGtkX4e+XKdkaaCjNCAYN578b1Q0SiYY/mVIDGTmU
	libYy5v8d3U2kLAk2kawzNz6rxiG0VjU1EJwPzBcgUWuU+3QSZFjEhbdS6bxEm0Tkn87Kd2LAu9
	W9OMFUDgR7iUNjKtkDO/JaSknwd5Eq5xZXL5veVN8dUpipdKVUeInPsFfY5ew4zWSsXepSm5hkf
	W/orWgGu0sj6TYG5wg2SB6b+aI6+ByQ4XUUHbT7JgFwDOtMr6uh8rzRHyupvSl8BQXMBLAs/Oiv
	sSppGdLL8ASsiXYuSzdjXtk/7O4uIb0OO8nfky0aGFE3WcsAJ/Xku+Q4/jBqwECqiz8M8AN+KwU
	OjF7PdDzweHqmN3Zf5QH/vlF+or6Baz0YSXsG5XteaEJVSRY962QC6U1ucCkGtRtcRkExyN+6xr
	+z8mwbjbK0ONMF
X-Received: by 2002:a17:906:3e5a:b0:c20:2165:d74f with SMTP id
 a640c23a62f3a-c246a6ca4f5mr2781903566b.22.1787617054440; Mon, 24 Aug 2026
 17:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-12-jthoughton@google.com> <aoR_5LHPsVXUnxt6@arm.com>
In-Reply-To: <aoR_5LHPsVXUnxt6@arm.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 24 Aug 2026 17:16:56 -0700
X-Gm-Features: AcwNN1XeyQDNjfznf_slsJ2-WVr_gTFPPucM9IuBLkDPTtT4L5ACRlCs4qb6Unw
Message-ID: <CADrL8HXpA7D3UAScj0+TpuqEPcQvLGA6htABnwYnOBXorBQrNw@mail.gmail.com>
Subject: Re: [PATCH 11/18] hugetlb_vmemmap: Use try_populate_vmemmap_pmd for
 replacing in-use PMDs
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_171738_159911_F78A2B86 
X-CRM114-Status: GOOD (  34.98  )
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

On Tue, Aug 18, 2026 at 8:53=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jul 08, 2026 at 03:11:21AM +0000, James Houghton wrote:
> > diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/=
pgalloc.h
> > index 1b4509d3382c..c8946250d431 100644
> > --- a/arch/arm64/include/asm/pgalloc.h
> > +++ b/arch/arm64/include/asm/pgalloc.h
> > @@ -121,4 +121,13 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pg=
table_t ptep)
> >                      PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
> >  }
> >
> > +#define __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
> > +static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable=
,
> > +                                        unsigned long addr)
> > +{
> > +     /* BBML2_NOABORT is required. Its presence has been checked. */
> > +     pmd_populate_kernel(&init_mm, pmdp, pgtable);
> > +     return 0;
> > +}
>
> This patch adds the same function in 4 different arch files. Can we not
> have a single generic implementation in linux/pgalloc.h, bracketed by
> some ARCH_WANTS_* (macro or config)?
>
> I think the same goes for patch 4 with try_update_vmemmap_pte(), we can
> reduce the code duplication.

Yeah putting the generic version behind an ARCH_WANTS ifdef is so much
better. Then I can just nix the EOPNOTSUPP branch; a compile error is
always better.

> > diff --git a/include/linux/pgalloc.h b/include/linux/pgalloc.h
> > index 9174fa59bbc5..ed446d95ca37 100644
> > --- a/include/linux/pgalloc.h
> > +++ b/include/linux/pgalloc.h
> > @@ -26,4 +26,24 @@
> >                       arch_sync_kernel_mappings(addr, addr);          \
> >       } while (0)
> >
> > +#ifndef __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
> > +/*
> > + * try_populate_vmemmap_pmd - Populate a PMD that is in use by the vme=
mmap.
> > + * @addr: Base address of the remapped PMD.
> > + * @pmdp: Page table pointer to be overwritten.
> > + * @pgtable: Pointer to the page table that the new PMD will point to.
> > + *
> > + * This function is only to be used to update PMDs that map the vmemma=
p to
> > + * point to a page of already-populated PTEs that map the same pages.
> > + *
> > + * Implementations of this function must ensure that, while the update=
 is taking
> > + * place, CPUs will not fault on the remapped virtual address range.
> > + */
> > +static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable=
,
> > +                                        unsigned long addr)
>
> Nit: if we follow try_update_vmemmap_pte(), we could place 'addr' first.
> It matches pgd_populate_kernel() as well in this file.

Will do.

> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +#endif
> > +
> >  #endif /* _LINUX_PGALLOC_H */
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 977249e22ed0..b445febac0d2 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -55,6 +55,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page =
*head, unsigned long start,
> >                            struct vmemmap_remap_walk *walk)
> >  {
> >       pmd_t __pmd;
> > +     int ret;
> >       int i;
> >       unsigned long addr =3D start;
> >       pte_t *pgtable;
> > @@ -74,8 +75,15 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page=
 *head, unsigned long start,
> >               set_pte_at(&init_mm, addr, pte, entry);
> >       }
> >
> > +     ret =3D 0;
> >       spin_lock(&init_mm.page_table_lock);
> >       if (likely(pmd_leaf(*pmd))) {
> > +             /* Make pte visible before pmd. See comment in pmd_instal=
l(). */
> > +             smp_wmb();
> > +             ret =3D try_populate_vmemmap_pmd(pmd, pgtable, start);
> > +             if (ret)
> > +                     goto free;
> > +
> >               /*
> >                * Higher order allocations from buddy allocator must be =
able to
> >                * be treated as independent small pages (as they can be =
freed
> > @@ -84,21 +92,17 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct pag=
e *head, unsigned long start,
> >               if (!PageReserved(head))
> >                       split_page(head, get_order(PMD_SIZE));
> >
> > -             /* Make pte visible before pmd. See comment in pmd_instal=
l(). */
> > -             smp_wmb();
> > -             /*
> > -              * On arm64, this requires BBML2_NOABORT. Its support has
> > -              * already been checked.
> > -              */
> > -             pmd_populate_kernel(&init_mm, pmd, pgtable);
> >               if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
> >                       flush_tlb_kernel_range(start, start + PMD_SIZE);
> > -     } else {
> > -             pte_free_kernel(&init_mm, pgtable);
> > -     }
> > -     spin_unlock(&init_mm.page_table_lock);
> > +     } else
> > +             goto free;
> >
> > -     return 0;
> > +out:
> > +     spin_unlock(&init_mm.page_table_lock);
> > +     return ret;
> > +free:
> > +     pte_free_kernel(&init_mm, pgtable);
> > +     goto out;
> >  }
>
> Would 'free' first with fall through 'out' read better?

Yes, yes it would. I think the current ordering is just a holdover
from earlier attempts at writing this function.

Thanks!

