Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFF5C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exG/AXyrr+JXl9+ykc8tK7skhSydPCBzrUM83og95Qc=; b=nPOR+X1hLGqLYm+aYHdpyOeQDk
	hS8ZnWx48Q9UaPvzhjZhCnGjbcHMNA1ETz71bb/4OgN77une65F//4Oue+yLO8n8RN3H2PgjQGGJv
	EjnJYq7p7pSPS3BVzrov2aNVqzHZT8GMWEs25EJeOIEOT6bixbGQVbj1beCn5zzB4pPApZXnoHWoY
	6rtzsQFPz+eI5v5r9CNac4bWQl6mFwBc3VA1Pl2JPm2PeSRTMBrHo+bMjHoqH8o1WgOViXCXxrHRD
	hmLlL5tU1A+ZtCBglIvbsAuCixSU6Mg08t8Nd+p9dhAxOmvpgRrY1ipVlgg2OxuJlf0YKXlvcrZiQ
	Ewf8tAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JuX-0000000CaOm-3R0q;
	Thu, 17 Sep 2026 21:44:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JuW-0000000CaOS-0iek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:44:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2F2E43AD0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A613D1F0089B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789681491;
	bh=exG/AXyrr+JXl9+ykc8tK7skhSydPCBzrUM83og95Qc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=npcV7UoWW8Jdj8dCOiJjPz7NjvHEweQKVyJTOE6EGl+6CXaSXa7Cw5OVetwNA0yjL
	 h6TfoM6Dfif4CAsnrhQwtPWh9kFaQNiTS/ftDGCbVLNPOVI9S/lJcEmj5xyQDqYTmN
	 4ggdves30XSDnwvnOFL4hI3msybJF/Lz7+iqcOZPOOzu46+i0EIy/6sj+UOBlD1JFo
	 ILbB39sk6mpXz/GPDWpGqIe4Mx0g+kV9n4XGrwO9HrCL1sQqEDYUt6q1x/2esCOndY
	 FlVZRxvROq3asnpA7qRe55ewDZVxSRiT7yskG6bEOsB4CTOzEyN7jIbb3SY4BaZOsZ
	 ORbUBr6pMgLsA==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c4so7411685a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOfdFxcESEN2CJJK690UqxjkVy/OZBxiZ+wCUcN1CGEjklDptEKVqt+s7vE0sokWQtwG+4T35miPmExjQjfgm8@lists.infradead.org
X-Gm-Message-State: AFuF++kOkM2XJEofbIfPkA5c0PSWWYxpdE8UKxeO/4oD5R9ZPs0Us9M1
	m2Osbc0rQkCfgZ0LnWsq2HFi3uUx6DHH1uwfYNywyfqmW+YJu3KP3EaLKc/HBPYHDoTM459Key8
	OwVMZighVNFZLOW53D9HhjkzRLbVXo7Y=
X-Received: by 2002:a05:620a:1a28:b0:939:b099:d52f with SMTP id
 af79cd13be357-93bdc6d9164mr57128485a.20.1789681490948; Thu, 17 Sep 2026
 14:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com> <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
 <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
In-Reply-To: <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 05:44:39 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com>
X-Gm-Features: AcwNN1UtqgSSOa91gBxdyOasYnD1juDs3qwDvpJofhPchMKWgrPs9IOwN7QDNfg
Message-ID: <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	linux-mm@kvack.org, urezki@gmail.com, will@kernel.org, 
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 17, 2026 at 10:41=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.co=
m> wrote:
>
> On Thu, 17 Sept 2026 at 22:00, Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> >
> >
> > Le 17/09/2026 =C3=A0 07:29, Wen Jiang a =C3=A9crit :
> > > From: Wen Jiang <jiangwen6@xiaomi.com>
> > >
> > > vmap installs PTE-level block mappings by reusing set_huge_pte_at() a=
nd
> > > huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This make=
s
> > > the feature silently unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels a=
nd
> > > couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> > >
> > > Now that arm64 and powerpc/8xx provide pte_set_huge() and
> > > pte_clear_huge(), add the generic fallbacks next to the existing
> > > pmd/pud_set_huge() family and convert vmap_pte_range() and
> > > vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> > > around the block-mapping paths are dropped, so PTE-level block mappin=
gs
> > > now also work on CONFIG_HUGETLB_PAGE=3Dn kernels, and mm/vmalloc.c no
> > > longer includes <linux/hugetlb.h>.
> > >
> > > The fallbacks exist only to keep the build working on architectures
> > > without PTE-level block mapping support. They are unreachable there:
> > > the callers only run when arch_vmap_pte_range_map_size() or
> > > arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> > > which requires an arch implementation. WARN_ON_ONCE() makes that
> > > explicit rather than silently doing nothing.
> > >
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > ---
> > >   include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
> > >   mm/vmalloc.c            | 19 ++++++-------------
> > >   2 files changed, 35 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > index cdd68ed3ae1a9..349ced999f959 100644
> > > --- a/include/linux/pgtable.h
> > > +++ b/include/linux/pgtable.h
> > > @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd=
, unsigned long addr)
> > >   }
> > >   #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> > >
> > > +/*
> > > + * PTE-level block mappings for vmap.
> > > + *
> > > + * pte_set_huge() only has to be implemented by architectures whose
> > > + * arch_vmap_pte_range_map_size() can return a size other than PAGE_=
SIZE.
> > > + */
> > > +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> > > +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> > > +                             phys_addr_t phys, pgprot_t prot,
> > > +                             unsigned long size)
> > > +{
> > > +     WARN_ON_ONCE(1);
> >
> > BUILD_BUG_ON() would be better here.
> >
> > It should be possible because fallback arch_vmap_pte_range_map_size()
> > will constant-fold PAGE_SIZE so pte_set_huge() will never be called.
> >
>
> Agreed. These fallbacks exist only to keep the build working on
> architectures with PTE-level block mappings and should never actually
> be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.
>

I am not quite sure. It won't be called at runtime because
`vmap size`/`unmap size` return `PAGE_SIZE`, so the code won't
reach this branch. But it will still be built.

So, would a `BUILD_BUG_ON()` trigger a build failure here?

Best Regards
Barry

