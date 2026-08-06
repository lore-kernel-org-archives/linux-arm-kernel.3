Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649A6C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMaEeVh+/U+NbRzoGC8Idgo7QP/ahOzSH8HwXGJHBcU=; b=tlB6UH3tE8RpuwsEGxm61+XtSF
	1lpQo1B02ak95KJbNh8+FJ0l+TqISFA1KQ4qa6xilezxb40EjTL/t+/40OKf1M2FwUQwF2JtO+cSy
	luCgSCW95jNJ7g7qnoFSwTKQTF3Plk4YR8BJsxdTTCCPO26o1UwhktUIOij/TscNwsYsVmnNk1V+m
	EAJm5863+t7X16KZBNt0vjOm06CfN5MBIdkgg6YQ9vJFeJoz8LqYGcNGkOODU3GUmr/SWHvqFpViG
	qty9pig1PrlrizGZjZyR464aVebIL3vkkzCn8KLU2YMeqhY62CxmPpmPt88YnVnjSr6+D756UTNiQ
	EFiAvUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvtB-00000005bwf-3vt0;
	Thu, 06 Aug 2026 11:03:53 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvt9-00000005bvK-08A8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:03:52 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6ae9b721927so1063191eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 04:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786014227; cv=none;
        d=google.com; s=arc-20260327;
        b=lxuyCZ9QWjxMV7uWBHYp3/rta0DPiVwOd8SUFQdj/iU6CfR9VJKoT60He8Lv0EtL+8
         S3v1jEJB1Ec+JbNHZceBZg4+ou1sIMdrD2WZMhzdLgzsBdnpyyNgca0YUgWdIn8g9Z58
         Sfm3IW2cRdGGVPNKIdl/MAv6MlEHwjT8eqicsm6BEuLZ4ZIHuaxYmrfc3kttYQMALiex
         1N1SmjewKtZ0O53aRPs5AFD3eIZtlwYnm4iKs3cOASbLpVkzYEtS6+Fqd8xhrgr1mriV
         1CoQy14GR7sNoItZVOW3wG936f2rD+moBZB0IQEs60sT1jSg1t2U1aDxaJ96I2+bqQMo
         qz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kMaEeVh+/U+NbRzoGC8Idgo7QP/ahOzSH8HwXGJHBcU=;
        fh=E3sPWx3RdGJluuYa5a6NA8tI/kYvCsvtRZqti7HJbjk=;
        b=Cudm3HPvccYBDE8gkCY2TOT+r8VN4cD6giJm+laFSIFJSP3zB9Zl7W8CkdBgfAwULV
         fTR12mnGXw+WV+gZVN2OAfczmSIVonbpqILjT2s8tQ9Jd3vaN8oELlYjbjxgKFxIqymI
         6rL5J8DiUBsAj/CHVrYtZFZlLLswdQdJlDxPDH17VDfiALO6pRmO+c6hq1MVQK6hXSX1
         g3eLrNmyHX/KYK1hPHWHA+o0FWMBbVClKd6E6/M2o3IElhxVIulx8wgRnselA4SGdpHb
         +z33rqs6DnkHcx0ySW478ucgykbzH71o9S3Wwupo974arExyrPjK6681lwF+LBNhCoIn
         nxjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786014227; x=1786619027; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kMaEeVh+/U+NbRzoGC8Idgo7QP/ahOzSH8HwXGJHBcU=;
        b=L2jaaWDTtlF7QNf82f6R+IbGOrkd7wQaQ7yTPAtPtz00Cp1pzOnrCdoXGgT36sZMRg
         U5HsD20+HN5dpLHba5chY1vwCn6ercPsuaZZbQslhHG0tTpFFPX1uuTbOlW6jm7BtrDo
         StGgKdKfSH4BV2Bg7F6jHggWX591/Bow9VJNMICxQeAKtV/mBM/wv4MAfSaSnetw+Kpm
         MBmOz5FivUSEuGt8mm9TF8AY5DNwStgIw8loYYdkO81/NA2jDX9M4NNziQ0Qf6V+7HyC
         J8Vg736iY+AaVRyjfgdcPRhYR1stYeCmGMkFjxq2aLJnjAWIMT9E7FF547q+x3GMoDLv
         wJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014227; x=1786619027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMaEeVh+/U+NbRzoGC8Idgo7QP/ahOzSH8HwXGJHBcU=;
        b=KbKFaNWlJpf2owc2x7iPm19ZrLXrcmjdGN52FlEkxXesHkMz2MH4/UtWn3zUylAUis
         yzWpmtd7pamRAl43nEIHiD5dNbNeDPu7SBHTTtozjbRdUFm/3CwHwdHU119dboWNV4wN
         QfPARVSieSGbXvSqBVVTEaGZwlsPDuOy62N31mboOztcf5qa9+W2W0QlPkJxycyuewyk
         g7OdU1QtGoAR1MqwBuLJzdrguImWRGAB6a7ekpM4f8ikPJ6jNOqau2ms+kbHEx7Vd+E+
         Vt6RgDkjhU0znxRxYBow1gH+ZN5yhRZMJnO9q+MhiWZ0LEwPSEtkk3JNwULjlOwgvb1a
         xxIA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2K1pG2hIsGUEuoys+xVy0fY8b5tlZ2UsStffO0KvX6S4rkVwWtNM/o9cxIaBZPWyqQKWeK44LdIdk6XTQ02p9@lists.infradead.org
X-Gm-Message-State: AOJu0YzWTBJkdWbEVzOsPX9iXUrpCJ+JiyBeZ2X9JGIOinv8mFN4rBlG
	w4mcRpBU+0L26FSx5FFMFz38ik9dZXVCOqjBpeU6crgPh8Sw+Ui4fC2ua3NT1mxtP57qEUJQeiv
	2k/VAEUeyhoi69Rm4BkEuhZL6E51BRYo9OQ1mHxcE1Q==
X-Gm-Gg: AR+sD12tkLvTz1jJqDk54urgBFgmkeKyqWlyyUrpxFHWyGNBiAPgzG8GZONpAkLCTVw
	i5nQkbiOW2dnAK19ZAF4JKlqS3A4xxEGvR1t0HIl/vLwLsopnqt5p1tdEHrqEZVRDd+uGLNOfyU
	fjbZ15B748A2iXo7fndySfFx3NsP+SThq04sXQtKW6R82m/NCIA630Re7DbpdfO56bdHm13/uc0
	FAHZ+Lrqq2VmLu+vqcHxNVNQ56irjCSLERNdhozsGoT+YFtxZGfnDejtQ8byQ1o25hiLzHdeDtc
	27tpKWWEgIzVsqvbvRtzBvoTUPtTrjko2n3KipNFsETyvKk=
X-Received: by 2002:a4a:e910:0:b0:6ac:ac32:b5ff with SMTP id
 006d021491bc7-6ae96c1b306mr7392747eaf.2.1786014225348; Thu, 06 Aug 2026
 04:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784201104.git.cuiyunhui@bytedance.com> <138d74aa9863ae8ff445e16a2798d062895b75bc.1784201104.git.cuiyunhui@bytedance.com>
 <anQ2bW3JxraT6PFY@lucifer>
In-Reply-To: <anQ2bW3JxraT6PFY@lucifer>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 6 Aug 2026 19:03:33 +0800
X-Gm-Features: AUfX_myo8uemIR_J8tcaFPQk5bQ_19S-a0xl3xjkzuEjy5SWJNGo65WwssSv6nw
Message-ID: <CAEEQ3wk62WBSJb5JcnPJoVSb+JQq3ZcE4CRmqqTvkAO20XFjbg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 10/15] mm/gup: add fast-GUP specific
 lockless PTE helpers
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_040351_078456_7F1CEBA9 
X-CRM114-Status: GOOD (  41.21  )
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

Hi Lorenzo,

On Thu, Aug 6, 2026 at 3:35=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> +cc literally everybody you failed to contact...!
>
> Why on earth are you doing sending a series like this which changes core =
mm,
> non-RFC and at v2 to boot, without bothering to Cc relevant people?
>
> I am also very confused as to why you are sending an ostensible RISC-V se=
ries
> then changing how core mm works to fit it, that's not how that works.
>
> And if you're seeking to change core mm send it as an RFC!
>
> On Thu, Jul 16, 2026 at 08:41:45PM +0800, Yunhui Cui wrote:
> > fast-GUP snapshots a PTE without holding the PTL, pins the page, and
> > then revalidates that the PTE did not change. Keep both reads under the
> > same lockless PTE semantics by defaulting the fast-GUP revalidation to
> > ptep_get_lockless().
>
> Why?...

Thanks for the review. Let me first explain the motivation behind patch
10/15, and then address the RFC/Cc and naming issues.

The goal of this patchset is to let RISC-V Svnapot provide contiguous PTE
semantics similar to arm64 contpte: generic MM should still see a normal
per-page PTE view, while RISC-V can fold eligible PTE ranges into the
Svnapot/NAPOT encoding underneath. Because of that, the RISC-V public
ptep_get_lockless() may, for a Svnapot PTE, return the sub-PTE for the
current address expected by generic MM, after checking the whole NAPOT rang=
e
for consistency and aggregating block-wide A/D bits.

fast-GUP has a narrower requirement. It needs the PTE for the current addre=
ss
for permission/PFN/page lookup, then pins the page, and finally checks that
the page table entry it relied on did not change during the pin. fast-GUP d=
oes
not consume the block-wide A/D aggregation. If fast-GUP uses the public
ptep_get_lockless() for both the initial read and the revalidation, it pays
the cost of the NAPOT range scan and A/D aggregation in the fast path, even
though that information is not used.

So patch 10/15 is not trying to wrap a simple equality check. The intent is=
 to
separate two semantics: the current-address PTE consumed by fast-GUP, and t=
he
original PTE snapshot used for post-pin revalidation. On normal architectur=
es
these are the same value, and the default implementation preserves the
existing ptep_get_lockless() behavior. On RISC-V Svnapot, the value consume=
d
by fast-GUP is the sub-PTE, while revalidation compares whether the raw
snapshot has changed.

Patch 11/15 is the RISC-V use of this hook. It avoids the public
ptep_get_lockless() block-wide A/D aggregation path in fast-GUP, while stil=
l
keeping correctness through raw snapshot revalidation. In the 64K THP alway=
s
mode, fio 4K random direct read improved from 2.615M IOPS / 9.97GiB/s to
2.874M IOPS / 11.0GiB/s, and the average clat dropped from 95.54 usec to
86.97 usec.

Regarding the RFC/Cc issue, you are right, I handled that poorly. Although
this series is mainly about RISC-V Svnapot, patch 10/15 adds a generic MM/G=
UP
helper and patch 12/15 also changes the arm64 contpte fast-GUP path, so the=
y
are no longer RISC-V-local changes. I was worried that the large list of
individual recipients from get_maintainer.pl would create too much noise, s=
o
I mostly kept the mailing lists and dropped some individual Cc's. That was =
a
bad call; the relevant maintainers/reviewers should have been Cc'ed
explicitly. Sorry about that.

For the next version, I will split the generic fast-GUP helper out as a
separate RFC, add the relevant MM/GUP/arm64/RISC-V maintainers and reviewer=
s
to Cc, and explain the semantic difference between the PTE consumed by
fast-GUP and the post-pin revalidation snapshot. If I keep the arm64
optimization, I will include the arm64 maintainers/reviewers in that RFC;
otherwise I will drop it from the RISC-V series for now. I will also improv=
e
the naming, such as `rawp`/`raw_pte`, and add comments to make the snapshot
semantics clearer.

>
> >
> > Introduce fast-GUP specific PTE snapshot and revalidation helpers. The
> > default implementation preserves the existing ptep_get_lockless()
> > semantics, while allowing architectures to override the helpers when th=
e
> > public lockless getter provides extra semantics that fast-GUP does not
> > consume.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  include/linux/pgtable.h | 18 ++++++++++++++++++
> >  mm/gup.c                |  6 ++++--
> >  2 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index da14328093a86..62943fcbf7046 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -813,6 +813,24 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
> >  }
> >  #endif
> >
>
> Of course, no comments, helpful!
>
> > +#ifndef gup_ptep_get_lockless
> > +static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
>
> rawp? This is terrible naming.
>
> And 'gup_ptep_get_lockless()' is worse. What on earth is this function me=
ant to
> do? And why is 'gup lockless' considered different from lockless?
>
> And you return the value twice, because of course you do. Why? Who knows.
>
> > +{
> > +     pte_t pte =3D ptep_get_lockless(ptep);
> > +
> > +     *rawp =3D pte;
> > +
> > +     return pte;
> > +}
> > +#endif
> > +
> > +#ifndef gup_ptep_revalidate
> > +static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
> > +{
> > +     return pte_val(raw_pte) =3D=3D pte_val(ptep_get_lockless(ptep));
> > +}
>
> Again this naming is utterly terrible and I'm at a loss as to why on eart=
h
> you're doing this?
>
> We don't need to abstract equality checks?
>
> > +#endif
> > +
> >  #ifndef pmdp_get_lockless
> >  static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
> >  {
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 99902c15703b0..72fb147193e55 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2842,10 +2842,12 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t =
*pmdp, unsigned long addr,
> >       if (!ptep)
> >               return 0;
> >       do {
> > -             pte_t pte =3D ptep_get_lockless(ptep);
> > +             pte_t raw_pte, pte;
>
> What on earth is a 'raw' PTE?
>
> >               struct page *page;
> >               struct folio *folio;
> >
> > +             pte =3D gup_ptep_get_lockless(ptep, &raw_pte);
> > +
> >               /*
> >                * Always fallback to ordinary GUP on PROT_NONE-mapped pa=
ges:
> >                * pte_access_permitted() better should reject these page=
s
> > @@ -2871,7 +2873,7 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *p=
mdp, unsigned long addr,
> >                       goto pte_unmap;
> >
> >               if (unlikely(pmd_val(pmd) !=3D pmd_val(pmdp_get_lockless(=
pmdp))) ||
> > -                 unlikely(pte_val(pte) !=3D pte_val(ptep_get_lockless(=
ptep)))) {
> > +                 unlikely(!gup_ptep_revalidate(ptep, raw_pte))) {
>
> Why do we need to refadctor a comparison between a local variable and a l=
ockless
> get?
>
> I'm just so confused by what on earth this patch is meant to be or why it=
's here...
>
> >                       gup_put_folio(folio, 1, flags);
> >                       goto pte_unmap;
> >               }
> > --
> > 2.39.5
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> --
> Cheers, Lorenzo


Thanks,
Yunhui

