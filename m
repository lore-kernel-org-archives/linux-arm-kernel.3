Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2879FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFvK5oiBH8+JxtcYHZ8dNqgQlFpHniYFsNHsV6mOU4Y=; b=HYkI4QkB7ViV8nSm9qKzuoT1We
	jU7maUS27NcKve0bv2EDSxIkdpksOUyn7BzJYwOGDlYy5dF1RMBKk0/266iRuNlMAqoUpm+awonZ/
	bJXng6oD+YMG0B92/V9+X3y0jLsChb8W5Hg8WQ2OVpxyaO/klGrRDvpCOnGLTL5pWNh9ylsquid36
	FGD5IAzaPRFN07bzGiFEVtEs6me4Ah5PBX5u1oQIPyK6FgGa9ocIAplFRwps3n34Qa7yG5eqkK9Ob
	541xHKMTfT2OzlNSdDzwLQiAEx7s9ywQNPMR5vOc2XwAbu+YD/C9ijl51faPQeCdeQ1zCKGSYvXCL
	+LFuzcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXaT5-00000007bGv-2mWz;
	Tue, 14 Jan 2025 06:32:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXaRj-00000007b6L-3P6n;
	Tue, 14 Jan 2025 06:30:41 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d9b6b034easo5228170a12.3;
        Mon, 13 Jan 2025 22:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736836238; x=1737441038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFvK5oiBH8+JxtcYHZ8dNqgQlFpHniYFsNHsV6mOU4Y=;
        b=VJlleQ4+VHFJjOp4gq94PH4q63MCiaX7AJT6RZdXXVxxOOS3hKFFd8zkDNuatQskOQ
         ES3liV2kd2/S98AG3ZgVtCXO76U4PZfYSmg6xs6aCcJblNbAnE4TX9sf3i6HNs77BMPC
         d8m+5PPn0ev4pf46St7XJxlIgrVVScKpBkjgICOG7HZdVoHpNbP07UvNenCLOy/u2Vtv
         q0FQZNFISIanEtfQqiARnZzqVnzcM9zsyVrb3/WTGFwaEOUuL6cYTLlGt1/vKn/Kpw+c
         qgvmZkyUOzXMy6jP01Ay0Mq0jDiJhnsV+jfIj6tEQXp5eDFQFtzNddyBZr9fXEvHbhw2
         SxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736836238; x=1737441038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFvK5oiBH8+JxtcYHZ8dNqgQlFpHniYFsNHsV6mOU4Y=;
        b=oAXVwpv1qLgj0ofYxqDK6m80mb2981jOQySFLBj1bdqj7dm02WuYMRkYYOSIvIaG7k
         Ani6c+y9vX5isC6dlbfwIvd7c4Nro7Aijboc9iQuFcQnnqRc4XP1dG9/M6KoCX/aNaJt
         qf/sJrM7tz7dLFIe6EgDUG1m3XEG+1senqvjOn/CUb2TbnwYGXttcmMUe0NY76Xqz9uc
         w5Ct/2i0+TzJ/UMoulg6MFiaZmdBlZz09spQPKpz2DoPJjSjkh8vUKS6ZWfUsGH8HuPT
         X6Z43JZptxWDV5fOQLm90+bfHkqNICE9BpCFVDUedI/oPgPuzJqoD26Y7BDLjN8aQm8j
         Dzkw==
X-Forwarded-Encrypted: i=1; AJvYcCUHBAWaBuT+/aXD2ioi2BoWHt7GKy21agZstovwaN3ooZyZBeNRJIkElY5+uW5EJ63ZzzSoclTx6FrvdZZ4K9wM@lists.infradead.org, AJvYcCWdEPV1AudGdMZQmWGU2W0wh2Ibw/1g+x64QY6JfnBXtR2mlILDAm0684j+/qYm3/Hd0vq/QKZYpSRpIpY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzYOj3NvzgQqPcldAfxtq9NghiDxCoMX5pvHhwnuXsACV7kTIz
	eOhLv3eLQUXXOeb9iuSn5oinmYPpdRCZFZP/WEPreIHi5vhjLwy3KBp1lIdF95Dz1l1xOTBpdnL
	62eScr6+ETlTj0ig7ym2+wlryrAgqIw2g
X-Gm-Gg: ASbGnctqNyAe73PcoTB8HwNSLITXNjhgNsAlVk+3SqsGAX6SGGBpMxO5C3Jk586NCQW
	7ZbUkAqT5LOsSgPG66lngUsraD7ce2vRoXt7yaNQn
X-Google-Smtp-Source: AGHT+IGF2PGcv/ddJcvq18Tqw5yvzNhCGSdnO2VVwGsY9CNG0MdQiK0klb2/fYcTkEUzs3VV5uaT0CaCnBfqbFxV2uc=
X-Received: by 2002:a05:6402:51d0:b0:5d2:723c:a559 with SMTP id
 4fb4d7f45d1cf-5d972e06b2bmr23233356a12.10.1736836237804; Mon, 13 Jan 2025
 22:30:37 -0800 (PST)
MIME-Version: 1.0
References: <c35845be-46dc-4868-b8f7-beb44eee04cc@linux.alibaba.com> <20250114040914.9986-1-21cnbao@gmail.com>
In-Reply-To: <20250114040914.9986-1-21cnbao@gmail.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Tue, 14 Jan 2025 14:30:01 +0800
X-Gm-Features: AbW1kvaplad4TfLLQqpTXzlvv8FYaLHUCpIqhqpG7RAFpIiKP56uUpv9oj3H-zI
Message-ID: <CAK1f24=yxwEP1xoC6ZHCXDES8hwD3wA27TxO+XWo8d8LgocDxA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Barry Song <21cnbao@gmail.com>
Cc: baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	chrisl@kernel.org, david@redhat.com, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_223039_868843_93028528 
X-CRM114-Status: GOOD (  31.72  )
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

On Tue, Jan 14, 2025 at 12:09=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>
> On Tue, Jan 14, 2025 at 4:40=E2=80=AFPM Baolin Wang <baolin.wang@linux.al=
ibaba.com> wrote:
> >
> >
> >
> > On 2025/1/13 11:39, Barry Song wrote:
> > > From: Barry Song <v-songbaohua@oppo.com>
> > >
> > > The try_to_unmap_one() function currently handles PMD-mapped THPs
> > > inefficiently. It first splits the PMD into PTEs, copies the dirty
> > > state from the PMD to the PTEs, iterates over the PTEs to locate
> > > the dirty state, and then marks the THP as swap-backed. This process
> > > involves unnecessary PMD splitting and redundant iteration. Instead,
> > > this functionality can be efficiently managed in
> > > __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> > > improving performance.
> > >
> > > The following microbenchmark redirties folios after invoking MADV_FRE=
E,
> > > then measures the time taken to perform memory reclamation (actually
> > > set those folios swapbacked again) on the redirtied folios.
> > >
> > >   #include <stdio.h>
> > >   #include <sys/mman.h>
> > >   #include <string.h>
> > >   #include <time.h>
> > >
> > >   #define SIZE 128*1024*1024  // 128 MB
> > >
> > >   int main(int argc, char *argv[])
> > >   {
> > >       while(1) {
> > >               volatile int *p =3D mmap(0, SIZE, PROT_READ | PROT_WRIT=
E,
> > >                               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > >
> > >               memset((void *)p, 1, SIZE);
> > >               madvise((void *)p, SIZE, MADV_FREE);
> > >               /* redirty after MADV_FREE */
> > >               memset((void *)p, 1, SIZE);
> > >
> > >               clock_t start_time =3D clock();
> > >               madvise((void *)p, SIZE, MADV_PAGEOUT);
> > >               clock_t end_time =3D clock();
> > >
> > >               double elapsed_time =3D (double)(end_time - start_time)=
 / CLOCKS_PER_SEC;
> > >               printf("Time taken by reclamation: %f seconds\n", elaps=
ed_time);
> > >
> > >               munmap((void *)p, SIZE);
> > >       }
> > >       return 0;
> > >   }
> > >
> > > Testing results are as below,
> > > w/o patch:
> > > ~ # ./a.out
> > > Time taken by reclamation: 0.007300 seconds
> > > Time taken by reclamation: 0.007226 seconds
> > > Time taken by reclamation: 0.007295 seconds
> > > Time taken by reclamation: 0.007731 seconds
> > > Time taken by reclamation: 0.007134 seconds
> > > Time taken by reclamation: 0.007285 seconds
> > > Time taken by reclamation: 0.007720 seconds
> > > Time taken by reclamation: 0.007128 seconds
> > > Time taken by reclamation: 0.007710 seconds
> > > Time taken by reclamation: 0.007712 seconds
> > > Time taken by reclamation: 0.007236 seconds
> > > Time taken by reclamation: 0.007690 seconds
> > > Time taken by reclamation: 0.007174 seconds
> > > Time taken by reclamation: 0.007670 seconds
> > > Time taken by reclamation: 0.007169 seconds
> > > Time taken by reclamation: 0.007305 seconds
> > > Time taken by reclamation: 0.007432 seconds
> > > Time taken by reclamation: 0.007158 seconds
> > > Time taken by reclamation: 0.007133 seconds
> > > =E2=80=A6
> > >
> > > w/ patch
> > >
> > > ~ # ./a.out
> > > Time taken by reclamation: 0.002124 seconds
> > > Time taken by reclamation: 0.002116 seconds
> > > Time taken by reclamation: 0.002150 seconds
> > > Time taken by reclamation: 0.002261 seconds
> > > Time taken by reclamation: 0.002137 seconds
> > > Time taken by reclamation: 0.002173 seconds
> > > Time taken by reclamation: 0.002063 seconds
> > > Time taken by reclamation: 0.002088 seconds
> > > Time taken by reclamation: 0.002169 seconds
> > > Time taken by reclamation: 0.002124 seconds
> > > Time taken by reclamation: 0.002111 seconds
> > > Time taken by reclamation: 0.002224 seconds
> > > Time taken by reclamation: 0.002297 seconds
> > > Time taken by reclamation: 0.002260 seconds
> > > Time taken by reclamation: 0.002246 seconds
> > > Time taken by reclamation: 0.002272 seconds
> > > Time taken by reclamation: 0.002277 seconds
> > > Time taken by reclamation: 0.002462 seconds
> > > =E2=80=A6
> > >
> > > This patch significantly speeds up try_to_unmap_one() by allowing it
> > > to skip redirtied THPs without splitting the PMD.
> > >
> > > Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Suggested-by: Lance Yang <ioworker0@gmail.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > ---
> > >   mm/huge_memory.c | 17 ++++++++++++++---
> > >   mm/rmap.c        | 11 ++++++++++-
> > >   2 files changed, 24 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 3d3ebdc002d5..aea49f7125f1 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(st=
ruct vm_area_struct *vma,
> > >       int ref_count, map_count;
> > >       pmd_t orig_pmd =3D *pmdp;
> > >
> > > -     if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> > > +     if (pmd_dirty(orig_pmd))
> > > +             folio_set_dirty(folio);
> > > +     if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE))=
 {
> > > +             folio_set_swapbacked(folio);
> > >               return false;
> > > +     }
> > >
> > >       orig_pmd =3D pmdp_huge_clear_flush(vma, addr, pmdp);
> > >
> > > @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(st=
ruct vm_area_struct *vma,
> > >        *
> > >        * The only folio refs must be one from isolation plus the rmap=
(s).
> > >        */
> > > -     if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> > > -         ref_count !=3D map_count + 1) {
> > > +     if (pmd_dirty(orig_pmd))
> > > +             folio_set_dirty(folio);
> > > +     if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE))=
 {
> > > +             folio_set_swapbacked(folio);
> > > +             set_pmd_at(mm, addr, pmdp, orig_pmd);
> > > +             return false;
> > > +     }
> > > +
> > > +     if (ref_count !=3D map_count + 1) {
> > >               set_pmd_at(mm, addr, pmdp, orig_pmd);
> > >               return false;
> > >       }
> > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > index 3ef659310797..02c4e4b2cd7b 100644
> > > --- a/mm/rmap.c
> > > +++ b/mm/rmap.c
> > > @@ -1671,7 +1671,7 @@ static bool try_to_unmap_one(struct folio *foli=
o, struct vm_area_struct *vma,
> > >       DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> > >       pte_t pteval;
> > >       struct page *subpage;
> > > -     bool anon_exclusive, ret =3D true;
> > > +     bool anon_exclusive, lazyfree, ret =3D true;
> > >       struct mmu_notifier_range range;
> > >       enum ttu_flags flags =3D (enum ttu_flags)(long)arg;
> > >       int nr_pages =3D 1;
> > > @@ -1724,9 +1724,18 @@ static bool try_to_unmap_one(struct folio *fol=
io, struct vm_area_struct *vma,
> > >               }
> > >
> > >               if (!pvmw.pte) {
> > > +                     lazyfree =3D folio_test_anon(folio) && !folio_t=
est_swapbacked(folio);
> >
> > You've checked lazyfree here, so can we remove the duplicate check in
> > unmap_huge_pmd_locked()? Then the code should be:
> >
> >                 if (lazyfree && unmap_huge_pmd_locked(...))
> >                         goto walk_done;
>
>
> right. it seems unmap_huge_pmd_locked() only handles lazyfree pmd-mapped
> thp. so i guess the code could be:

Yep, it would be better to remove the duplicate check in
unmap_huge_pmd_locked(), and we can extend unmap_huge_pmd_locked()
in the future if needed.

Thanks,
Lance


>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index aea49f7125f1..c4c3a7896de4 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3131,11 +3131,10 @@ bool unmap_huge_pmd_locked(struct vm_area_struct =
*vma, unsigned long addr,
>         VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
>         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
>         VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
> +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
>
> -       if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
> -               return __discard_anon_folio_pmd_locked(vma, addr, pmdp, f=
olio);
> -
> -       return false;
> +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
>  }
>
>  static void remap_page(struct folio *folio, unsigned long nr, int flags)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 02c4e4b2cd7b..72907eb1b8fe 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1671,7 +1671,7 @@ static bool try_to_unmap_one(struct folio *folio, s=
truct vm_area_struct *vma,
>         DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>         pte_t pteval;
>         struct page *subpage;
> -       bool anon_exclusive, lazyfree, ret =3D true;
> +       bool anon_exclusive, ret =3D true;
>         struct mmu_notifier_range range;
>         enum ttu_flags flags =3D (enum ttu_flags)(long)arg;
>         int nr_pages =3D 1;
> @@ -1724,18 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio,=
 struct vm_area_struct *vma,
>                 }
>
>                 if (!pvmw.pte) {
> -                       lazyfree =3D folio_test_anon(folio) && !folio_tes=
t_swapbacked(folio);
> -
> -                       if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw=
.pmd,
> -                                                 folio))
> -                               goto walk_done;
> -                       /*
> -                        * unmap_huge_pmd_locked has either already marke=
d
> -                        * the folio as swap-backed or decided to retain =
it
> -                        * due to GUP or speculative references.
> -                        */
> -                       if (lazyfree)
> +                       if (folio_test_anon(folio) && !folio_test_swapbac=
ked(folio)) {
> +                               if (unmap_huge_pmd_locked(vma, pvmw.addre=
ss, pvmw.pmd, folio))
> +                                       goto walk_done;
> +                               /*
> +                                * unmap_huge_pmd_locked has either alrea=
dy marked
> +                                * the folio as swap-backed or decided to=
 retain it
> +                                * due to GUP or speculative references.
> +                                */
>                                 goto walk_abort;
> +                       }
>
>                         if (flags & TTU_SPLIT_HUGE_PMD) {
>                                 /*
>
> >
> > >                       if (unmap_huge_pmd_locked(vma, pvmw.address, pv=
mw.pmd,
> > >                                                 folio))
> > >                               goto walk_done;
> > > +                     /*
> > > +                      * unmap_huge_pmd_locked has either already mar=
ked
> > > +                      * the folio as swap-backed or decided to retai=
n it
> > > +                      * due to GUP or speculative references.
> > > +                      */
> > > +                     if (lazyfree)
> > > +                             goto walk_abort;
> > >
> > >                       if (flags & TTU_SPLIT_HUGE_PMD) {
> > >                               /*

