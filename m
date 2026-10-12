Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AA2CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TB1tvVpc7k0BKK/tU4j4YuTf01twWs+L2M2upFeIsNA=; b=YZv8p74M5OCV3pwNyyqCZTafpT
	aUE+LYPA9KyvvJB929wsAgMRIPd/gt44WFEYbeqX78oz4Tbpo6336mSUM3ZaeT2d6w8WVGwlYD9AT
	6VLQA5hLZH80d7ts3uobR16BEJOSynQk2Ly2+6j8oAuAVk7ztUq+//zS3iJPyEZENiU3Zi8q4TeRi
	XOA7BBS/yIAMCn9rGCoIDm6mgK7yNVqxmzZsOne/CmUNy+LlcSgqZkDyFdphIS0sLatwmnh7xsj0L
	O3jpP2uyirwpdbkLMazdRWkJH9umLswc3KBAEcFKYQi/39S/oR1ppYJMmu2Np/Fd/RU+MXRxbT3Tx
	lL/DWz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAY7-00000009qeU-1taz;
	Mon, 12 Oct 2026 07:34:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAY5-00000009qdr-2mWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:34:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b03f23305so1282768f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 00:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791790455; cv=none;
        d=google.com; s=arc-20260327;
        b=htPlgnNdBxbG0Aae1p9/7/+nsVJ+EmSIwZjk8nSM0G95AZH4DYzBJHLWz0LkNN7MZr
         4gpGxLUtghIf/kZQPzAu0dIl5X3ZAJuXgwmHnOKc6Idr74XDKcL23lAZ+msz+oMyBTWN
         xKbnqJLUbHbQazXL9EC0BCeVdFqBiXqguP0GgslPW5waNfdyhQqhbJvjhpFxWR3TvHiX
         1jpx4nrDRpRFQvAnAOgAjFbyHXXTUISgTJPA/tBc8ns4M2JD7PMq32HJoXtrsMzCdwYN
         66rjzNffU6TwsQrTKszTK6+CSeNaiMcVtT5jowae7y6lTj9HvUAes/OW0orwKf7RYa2P
         9Nng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TB1tvVpc7k0BKK/tU4j4YuTf01twWs+L2M2upFeIsNA=;
        fh=7X5BNKzBUHeoDBFU3mrFZ15QXhUBvZb+vXZRAu8uVnI=;
        b=nHE/wTSOkLiLfH0Otub0azYHqh7VGxVKomFaQMGa75PtNnNwMSQOtbuZ0PgTzstr5l
         vGdpsM9uVvBAsCpIsYP/4gnaruq7d3hP5cSIBogvwq3szQdHmuMVSEajSNNNuSqLj641
         z3xfXWMrGduE6x2vlzEb/Tg88XXrc6Kh1Nrn5OalLgUuH21z7roEn5RLOOp/fRRr6w4Q
         /AsAXuSHdd6t1CiuuI0OozloW1z27sBoqQpbVrsKKVFepsggkGPkJwL9tBISqRu0yfpd
         759uT1kx4fvN56QR76/GxTep83J2QB19eS3Sy0JgDGfnhMggcuE+TgST1O7vx6B9wFRZ
         PsAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791790455; x=1792395255; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TB1tvVpc7k0BKK/tU4j4YuTf01twWs+L2M2upFeIsNA=;
        b=cUsRU2z+lCm2ssGSZUShDBAs/V2rMedGhtunD6FERlYVTyqSVKWvnYxkCUwrhKXL3s
         nDzAfaC9Ip4kqRdtWCG5mVTxOhmmcTCLdzyJkHQCEboggNiZT5sdt4WTOGuSBBGHa+4H
         i4F90mtVwDocpg+wWgFRwOkhNhoaHOZZHE6iz2/UJsl7EL5OIOstuA9qKNzPNr38MQX9
         AieRJOFZCkVIP6kNo3qpASvgH1UEyFCuJZo6fYOesn++z+wbIZbwIUi5eyWZ2YIRTx2j
         vxwLNxn7+LegJ7yTEyS82LLlom8h0EgsjN13lHaFsgq/3L+tm6QSCru8ItBj9wt388Dn
         0btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790455; x=1792395255;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TB1tvVpc7k0BKK/tU4j4YuTf01twWs+L2M2upFeIsNA=;
        b=qykQrWTByABr+aAplxE1YlP6TtklzNqI5FUe3XhqW9UQUZ6TZwH9ULobgG5jkvD9Dv
         rCsim3PxmQikCEBQCWh46qjmjCDbGbNs9Fs7fzGmDPOoo0fd+D18MaAwKqMP7dHlIU1J
         0JrU6lVrjGGuy5Yyl4z5S5jYNH+V9jnrlTMzs/mJ3DnhKwOzTTWTF6D5ZPjcSNiNCRMJ
         J4Bb+a84kpN2sTUgn4W6NrIPJnXixFNddwxntX6aVujwRk2/ZdxH8/nSmDRzLwYR6rgg
         +RiSGZGKDAXC5z80w/gQe315Md0ek+9IHR7etJYJFp1WKBgejvfuk2mK3ser27wTMtCq
         QKGA==
X-Forwarded-Encrypted: i=1; AKwUvBxf+fY6pVEuLquLzFgokZRQM0Gq/yiVEwzCbbiUACfpFC7bDrC1VpzpfGzxA1gFMvK0GH7Owv6hUfsgVXQkwWC1@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4OqTsNvbl+pMMEYXVrqN7S0TjrjBi7Y+uLrWDWVD8oIMtsN1N
	xpdOW16DwGiilN0WmgxAw09cWbrjh2dot/I5X51WH+DOXiKhhXqSvceI+mn5r6K4usW2RJvxfFm
	pVjavlSZtOugGdKo4TlfKbLlDyaQ4aA4=
X-Gm-Gg: AYBFou1i9UcBt4+wpAmMzdbHUpD0ogjJz0rAqyBLMliIvOTkI4Pd700I7zd++szk7rx
	obiaHHvX4MkJQFNB3I4u8mAIQnRKuiYpsnID+c0qrMQXtJEqxYtJmBokWZ021GEqxFh1O2tjrzv
	bnvJbeqWkjLTHyAr/0SWS0wRM1utARF+Ggq8sL8KO7yozp+duPd0SfK8kncqQZzXLlriJ96qJk2
	2qLpCAqGEoh0fvbzHjIcIqAZM8+fyilPFTiwqlSC3qJ3bF7h1fJPB2GPvpohOkq/iHox0D/iHUQ
	/HU+X8mAMqVpw+gMdJdphwrZEaLDaeudrpZqfjQd5724zL5Pe4DaG+C+
X-Received: by 2002:a05:600c:154b:b0:49c:fed6:cd3f with SMTP id
 5b1f17b1804b1-4a18e4d0be2mr158510455e9.23.1791790455069; Mon, 12 Oct 2026
 00:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261002090947.869220-1-jiangwen6@xiaomi.com> <20261002090947.869220-4-jiangwen6@xiaomi.com>
 <asudY_EhrT5fZGmZ@milan>
In-Reply-To: <asudY_EhrT5fZGmZ@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Mon, 12 Oct 2026 15:34:02 +0800
X-Gm-Features: AclHuK_LlxXaCmKE3CgA4amsUlg18qyTu4ifi545sZ2ZwusM-AnLpZx1y3tgmDI
Message-ID: <CAHKocdH9Cmjb4oEVvZnxDhYRKfK+b00k3mm_YwWmSnO4fZ+qyg@mail.gmail.com>
Subject: Re: [PATCH v10 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
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
X-CRM114-CacheID: sfid-20261012_003417_742647_F67D39E9 
X-CRM114-Status: GOOD (  30.88  )
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

On Sun, 11 Oct 2026 at 22:29, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Fri, Oct 02, 2026 at 05:09:40PM +0800, Wen Jiang wrote:
> > vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> > huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> > the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
> > couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> >
> > Now that arm64 and powerpc/8xx provide pte_set_huge() and
> > pte_clear_huge(), add the generic fallbacks next to the existing
> > pmd/pud_set_huge() family and convert vmap_pte_range() and
> > vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> > around the block-mapping paths are dropped, so PTE-level block mappings
> > now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
> > longer includes <linux/hugetlb.h>.
> >
> > The fallbacks exist only to keep the build working on architectures
> > without PTE-level block mapping support. They are unreachable there:
> > the callers only run when arch_vmap_pte_range_map_size() or
> > arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> > which requires an arch implementation. BUILD_BUG() makes that
> > explicit rather than silently doing nothing.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Reviewed-by: Barry Song <baohua@kernel.org>
> > ---
> >  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
> >  mm/vmalloc.c            | 19 ++++++-------------
> >  2 files changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 8c093c119e5a8..a7fd51fec8a17 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
> >  }
> >  #endif       /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> >
> > +/*
> > + * PTE-level block mappings for vmap.
> > + *
> > + * pte_set_huge() only has to be implemented by architectures whose
> > + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
> > + */
> > +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> > +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> > +                             phys_addr_t phys, pgprot_t prot,
> > +                             unsigned long size)
> > +{
> > +     BUILD_BUG();
> > +}
> > +#endif
> > +
> > +/*
> > + * Likewise, pte_clear_huge() only has to be implemented by architectures
> > + * whose arch_vmap_pte_range_unmap_size() can return a size other than
> > + * PAGE_SIZE.
> > + */
> > +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
> > +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
> > +                                unsigned long size)
> > +{
> > +     BUILD_BUG();
> > +     return __pte(0);
> > +}
> > +#endif
> > +
> >  #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >  /*
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index bea9f76ed7e74..fb757d95bde25 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -38,7 +38,6 @@
> >  #include <linux/rbtree_augmented.h>
> >  #include <linux/overflow.h>
> >  #include <linux/pgtable.h>
> > -#include <linux/hugetlb.h>
> >  #include <linux/sched/mm.h>
> >  #include <asm/tlbflush.h>
> >  #include <asm/shmparam.h>
> > @@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >       pte_t *pte;
> >       u64 pfn;
> >       struct page *page;
> > -     unsigned long size = PAGE_SIZE;
> > +     unsigned long size;
> >
> >       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> >               return -EINVAL;
> > @@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >                       BUG();
> >               }
> >
> > -#ifdef CONFIG_HUGETLB_PAGE
> >               size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> >               if (size != PAGE_SIZE) {
> > -                     pte_t entry = pfn_pte(pfn, prot);
> > -
> > -                     entry = arch_make_huge_pte(entry, ilog2(size), 0);
> > -                     set_huge_pte_at(&init_mm, addr, pte, entry, size);
> > +                     pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> >
> As far as i understand, X86_64 arches do not use this path. This
> specifically is only for ARM64 or powerpc. pte_set_huge() makes me
> thinking about huge-page mappings(PMD/PUD/hugetlb). This helper is
> about mutli page mapping on the PTE level.
>
> Better naming? pte_set_large()?
>
> Any thoughts?
>

Agreed, "huge" is misleading here: on arm64 these are CONT_PTE entries
and the helper writes a range of PTEs rather than a single leaf, so it
is not a PMD/PUD/hugetlb huge mapping. I'll rename them to
pte_set_large()/pte_clear_large() in v11.

Thanks,
Wen

