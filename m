Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDCDC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 06:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfT5j66TIy5bOj0HZ0JrS0SuQCmOp5snddIcXxEymy8=; b=h6EgVhFTBsliDo7eixNrSGONCc
	Ie+j7Mu4nRifnTzeSO12JDGa89UrFrkJlHQSa5uKMfkXvWBN/yz7kM1OuC1Z7vgB+768pIm4Z+OiN
	+DRK7ZHYQPOJt1477edErDjJrUGaBcjWXpFm9AMztUM7JWH6uY3odn+yoFAqpefyuMjuT4tZYhjMF
	QWsg6nnGYSNZaHMCRnevRO7CosdQI/wXmQT3efPAQEJJkytzNU5gouVlypLKvBq2cxUQ9SmN73ZpO
	dzndOP2VSMQlUehXfArK+18D9jQ+GjCyRabYVng8cCr3yP/BGFSVD11fktMO0sHCKM6N0ScXAFBf7
	x7GDCQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxEu-0000000ArDy-0Uef;
	Wed, 15 Jan 2025 06:50:56 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXx7B-0000000Apv8-3pvP;
	Wed, 15 Jan 2025 06:42:59 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-85bafa89d73so1319991241.2;
        Tue, 14 Jan 2025 22:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736923376; x=1737528176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfT5j66TIy5bOj0HZ0JrS0SuQCmOp5snddIcXxEymy8=;
        b=jqL/Q6QK7tS1XWmi75G3Neuw7wF4TyBa+gmXF1vscwT37V2yLv2W2f+QkegRXk0RIO
         NEejBCO8gAtw8ZNt7mbXbhoZ5yNKaJjGifwddQIKo8sKkKNsgku8X1gz4aG65UuwYyg/
         Bt7kpdEZu0ThBhQ2XkfT/Qa9AgIL3fsNNmzXCQQ7S5D4gdQstXxql4+imBI1ALLKAPfj
         r2SyVVD8LjTL+Xq9TD7gDZyG2nfSByqeRE7OxAeSDyGH3ceGLViTmOvTgnZ8ewH4lUJ/
         lvbLv0hh8I25jrwnEzeiPoMaVEQcDw7ZUpC7zIhIBm0G5F86YNbVajrR853SR9OQTtv9
         EjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736923376; x=1737528176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfT5j66TIy5bOj0HZ0JrS0SuQCmOp5snddIcXxEymy8=;
        b=XnzzM2NoYUjNO4CeouMCDRG90NbLWPbzSBxhP5ld1HFI/l861XnQrRPYB41GE399Va
         sUzHf0st174u/Z7f1ZGDx8kZNpv5u3WSsK0mkn/Ouj2j4Zh7f+x/d/u7rFfveRIp3m2d
         F7X5DPVU0JQ0zqn63P1TM2+lVD5fLgLM31XLKsJEWLNqGEJNA5F1Wsv4n/nIaaT8tZ+i
         eXAsJcQ4mkrhhBGAu0fe8b+f7W9TX74QANcZW1UOiWVTez8jqPGdIiPQFGpISMrKQ/P7
         FkukHOOkWZy0G4dc7uZ3D1RfyQ9fHnjQ6cBsaWDUPKyBvBP2rvy4d9oouBh3yH6ehmRT
         wxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5iuJANvvFmYdTWevGCMkiQJbP0ooeIHTPVCof4F2Tj8p/qZdXgEI4LRECY11XMuR6+Z4fmHqcNCEb9KYMl1NA@lists.infradead.org, AJvYcCXG+xrBMZXNEEFwafwho4UbKARw2zqBZYGY2/7I4+auRwJ46jusiNL+D9gPX06DAZt36RJXFUyI8HoRwMw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlwD9JHHtYt0e/q1CrAS7j90Mfiyriu7eWyDmezifG0zzmPdEf
	kp3OTy6WVjIVuzN6En5I6SQg0Y3tfvBR5CFCjLSKREy+jSPzFASYe7EVEwZP6ZFiZ7oi03VQ+El
	cwXW6WY7V8j6wCotuh3rcqWXoeIw=
X-Gm-Gg: ASbGnct4pzmVIRi5Ni7zY/T1v69zkr1Iev2mC7vIaZ6sVpqbp0/8bIjZtlbHPTMdVWv
	tHXGIxGOWF32gq2TH0s3DhtcBC51VZGJmmt/iCoaITH8v6PSsLFlODMASXtDY4KDcyYlwxJVc
X-Google-Smtp-Source: AGHT+IFeA886AAdmTgRpzsWoaJeHbplRnLYE/tk44/GUv9PSa7EdHW1js/dQwdEYkSzZc/Q6+8MgT3aaSUhpMnhPpms=
X-Received: by 2002:a05:6102:3582:b0:4af:fa7d:71bd with SMTP id
 ada2fe7eead31-4b3d0f66d4amr26682282137.3.1736923376403; Tue, 14 Jan 2025
 22:42:56 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-5-21cnbao@gmail.com>
 <CAK1f24=3LmQMzgosB0o9OKV-P8f6cPO2ZCPBA64QXQqZYPk=ww@mail.gmail.com>
 <CAGsJ_4xwHVmnKENYV6M6yMSUzeeR8tM7F8mbkAUd4eVHhfN_BA@mail.gmail.com> <CAK1f24mCYF4Ew0hHr2+a=98RbxmmHwXv8KeFARyMvnLi99c2fQ@mail.gmail.com>
In-Reply-To: <CAK1f24mCYF4Ew0hHr2+a=98RbxmmHwXv8KeFARyMvnLi99c2fQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 15 Jan 2025 19:42:43 +1300
X-Gm-Features: AbW1kvY3joK1Uy5NZW3NFfAWiiTRxsilAJP4JjE8-wj2Jry8A1MN1eOJwrgLAZc
Message-ID: <CAGsJ_4wCPHxdXOBeaP6T4Rv_QHjLhL+LCZH-r2fwCrCBDk42_Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_224257_958086_261606CD 
X-CRM114-Status: GOOD (  35.32  )
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

On Wed, Jan 15, 2025 at 7:26=E2=80=AFPM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> On Wed, Jan 15, 2025 at 1:09=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > On Wed, Jan 15, 2025 at 6:01=E2=80=AFPM Lance Yang <ioworker0@gmail.com=
> wrote:
> > >
> > > On Wed, Jan 15, 2025 at 11:38=E2=80=AFAM Barry Song <21cnbao@gmail.co=
m> wrote:
> > > >
> > > > From: Barry Song <v-songbaohua@oppo.com>
> > > >
> > > > The try_to_unmap_one() function currently handles PMD-mapped THPs
> > > > inefficiently. It first splits the PMD into PTEs, copies the dirty
> > > > state from the PMD to the PTEs, iterates over the PTEs to locate
> > > > the dirty state, and then marks the THP as swap-backed. This proces=
s
> > > > involves unnecessary PMD splitting and redundant iteration. Instead=
,
> > > > this functionality can be efficiently managed in
> > > > __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> > > > improving performance.
> > > >
> > > > The following microbenchmark redirties folios after invoking MADV_F=
REE,
> > > > then measures the time taken to perform memory reclamation (actuall=
y
> > > > set those folios swapbacked again) on the redirtied folios.
> > > >
> > > >  #include <stdio.h>
> > > >  #include <sys/mman.h>
> > > >  #include <string.h>
> > > >  #include <time.h>
> > > >
> > > >  #define SIZE 128*1024*1024  // 128 MB
> > > >
> > > >  int main(int argc, char *argv[])
> > > >  {
> > > >         while(1) {
> > > >                 volatile int *p =3D mmap(0, SIZE, PROT_READ | PROT_=
WRITE,
> > > >                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0)=
;
> > > >
> > > >                 memset((void *)p, 1, SIZE);
> > > >                 madvise((void *)p, SIZE, MADV_FREE);
> > > >                 /* redirty after MADV_FREE */
> > > >                 memset((void *)p, 1, SIZE);
> > > >
> > > >                 clock_t start_time =3D clock();
> > > >                 madvise((void *)p, SIZE, MADV_PAGEOUT);
> > > >                 clock_t end_time =3D clock();
> > > >
> > > >                 double elapsed_time =3D (double)(end_time - start_t=
ime) / CLOCKS_PER_SEC;
> > > >                 printf("Time taken by reclamation: %f seconds\n", e=
lapsed_time);
> > > >
> > > >                 munmap((void *)p, SIZE);
> > > >         }
> > > >         return 0;
> > > >  }
> > > >
> > > > Testing results are as below,
> > > > w/o patch:
> > > > ~ # ./a.out
> > > > Time taken by reclamation: 0.007300 seconds
> > > > Time taken by reclamation: 0.007226 seconds
> > > > Time taken by reclamation: 0.007295 seconds
> > > > Time taken by reclamation: 0.007731 seconds
> > > > Time taken by reclamation: 0.007134 seconds
> > > > Time taken by reclamation: 0.007285 seconds
> > > > Time taken by reclamation: 0.007720 seconds
> > > > Time taken by reclamation: 0.007128 seconds
> > > > Time taken by reclamation: 0.007710 seconds
> > > > Time taken by reclamation: 0.007712 seconds
> > > > Time taken by reclamation: 0.007236 seconds
> > > > Time taken by reclamation: 0.007690 seconds
> > > > Time taken by reclamation: 0.007174 seconds
> > > > Time taken by reclamation: 0.007670 seconds
> > > > Time taken by reclamation: 0.007169 seconds
> > > > Time taken by reclamation: 0.007305 seconds
> > > > Time taken by reclamation: 0.007432 seconds
> > > > Time taken by reclamation: 0.007158 seconds
> > > > Time taken by reclamation: 0.007133 seconds
> > > > =E2=80=A6
> > > >
> > > > w/ patch
> > > >
> > > > ~ # ./a.out
> > > > Time taken by reclamation: 0.002124 seconds
> > > > Time taken by reclamation: 0.002116 seconds
> > > > Time taken by reclamation: 0.002150 seconds
> > > > Time taken by reclamation: 0.002261 seconds
> > > > Time taken by reclamation: 0.002137 seconds
> > > > Time taken by reclamation: 0.002173 seconds
> > > > Time taken by reclamation: 0.002063 seconds
> > > > Time taken by reclamation: 0.002088 seconds
> > > > Time taken by reclamation: 0.002169 seconds
> > > > Time taken by reclamation: 0.002124 seconds
> > > > Time taken by reclamation: 0.002111 seconds
> > > > Time taken by reclamation: 0.002224 seconds
> > > > Time taken by reclamation: 0.002297 seconds
> > > > Time taken by reclamation: 0.002260 seconds
> > > > Time taken by reclamation: 0.002246 seconds
> > > > Time taken by reclamation: 0.002272 seconds
> > > > Time taken by reclamation: 0.002277 seconds
> > > > Time taken by reclamation: 0.002462 seconds
> > > > =E2=80=A6
> > > >
> > > > This patch significantly speeds up try_to_unmap_one() by allowing i=
t
> > > > to skip redirtied THPs without splitting the PMD.
> > > >
> > > > Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > > Suggested-by: Lance Yang <ioworker0@gmail.com>
> > > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > > ---
> > > >  mm/huge_memory.c | 24 +++++++++++++++++-------
> > > >  mm/rmap.c        | 13 ++++++++++---
> > > >  2 files changed, 27 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > > index 3d3ebdc002d5..47cc8c3f8f80 100644
> > > > --- a/mm/huge_memory.c
> > > > +++ b/mm/huge_memory.c
> > > > @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(=
struct vm_area_struct *vma,
> > > >         int ref_count, map_count;
> > > >         pmd_t orig_pmd =3D *pmdp;
> > > >
> > > > -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> > > > +       if (pmd_dirty(orig_pmd))
> > > > +               folio_set_dirty(folio);
> > > > +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPAB=
LE)) {
> > > > +               folio_set_swapbacked(folio);
> > > >                 return false;
> > > > +       }
> > >
> > > If either the PMD or the folio is dirty, should we just return false =
right away,
> > > regardless of VM_DROPPABLE? There=E2=80=99s no need to proceed furthe=
r in that
> > > case, IMHO ;)
> >
> > I don't quite understand you, but we need to proceed to clear pmd entry=
.
> > if vm_droppable is true, even if the folio is dirty, we still drop the =
folio.
>
> Hey barry,
>
> One thing I still don=E2=80=99t quite understand is as follows:
>
> One of the semantics of VM_DROPPABLE is that, under memory pressure,
> the kernel can drop the pages. Similarly, for MADV_FREE, one of its
> semantics is that the kernel can free the pages when memory pressure
> occurs, but only if there is no subsequent write (i.e., the PMD is clean)=
.
>
> So, if VM_DROPPABLE is true, we still drop the folio even if it's dirty. =
This
> seems to conflict with the semantics of MADV_FREE, which requires the
> folio or PMD to be clean before being dropped. wdyt?

I think we can simply revisit the patch where VM_DROPPABLE was introduced:
commit 9651fcedf7b92d3f7
"mm: add MAP_DROPPABLE for designating always lazily freeable mappings"

>
> Thanks,
> Lance
>
>
>
>
> >
> > >
> > > Thanks,
> > > Lance
> > >
> > > >
> > > >         orig_pmd =3D pmdp_huge_clear_flush(vma, addr, pmdp);
> > > >
> > > > @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(=
struct vm_area_struct *vma,
> > > >          *
> > > >          * The only folio refs must be one from isolation plus the =
rmap(s).
> > > >          */
> > > > -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> > > > -           ref_count !=3D map_count + 1) {
> > > > +       if (pmd_dirty(orig_pmd))
> > > > +               folio_set_dirty(folio);
> > > > +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPAB=
LE)) {
> > > > +               folio_set_swapbacked(folio);
> > > > +               set_pmd_at(mm, addr, pmdp, orig_pmd);
> > > > +               return false;
> > > > +       }
> > > > +
> > > > +       if (ref_count !=3D map_count + 1) {
> > > >                 set_pmd_at(mm, addr, pmdp, orig_pmd);
> > > >                 return false;
> > > >         }
> > > > @@ -3119,12 +3130,11 @@ bool unmap_huge_pmd_locked(struct vm_area_s=
truct *vma, unsigned long addr,
> > > >  {
> > > >         VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
> > > >         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
> > > > +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> > > > +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
> > > >         VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
> > > >
> > > > -       if (folio_test_anon(folio) && !folio_test_swapbacked(folio)=
)
> > > > -               return __discard_anon_folio_pmd_locked(vma, addr, p=
mdp, folio);
> > > > -
> > > > -       return false;
> > > > +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, fol=
io);
> > > >  }
> > > >
> > > >  static void remap_page(struct folio *folio, unsigned long nr, int =
flags)
> > > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > > index be1978d2712d..a859c399ec7c 100644
> > > > --- a/mm/rmap.c
> > > > +++ b/mm/rmap.c
> > > > @@ -1724,9 +1724,16 @@ static bool try_to_unmap_one(struct folio *f=
olio, struct vm_area_struct *vma,
> > > >                 }
> > > >
> > > >                 if (!pvmw.pte) {
> > > > -                       if (unmap_huge_pmd_locked(vma, pvmw.address=
, pvmw.pmd,
> > > > -                                                 folio))
> > > > -                               goto walk_done;
> > > > +                       if (folio_test_anon(folio) && !folio_test_s=
wapbacked(folio)) {
> > > > +                               if (unmap_huge_pmd_locked(vma, pvmw=
.address, pvmw.pmd, folio))
> > > > +                                       goto walk_done;
> > > > +                               /*
> > > > +                                * unmap_huge_pmd_locked has either=
 already marked
> > > > +                                * the folio as swap-backed or deci=
ded to retain it
> > > > +                                * due to GUP or speculative refere=
nces.
> > > > +                                */
> > > > +                               goto walk_abort;
> > > > +                       }
> > > >
> > > >                         if (flags & TTU_SPLIT_HUGE_PMD) {
> > > >                                 /*
> > > > --
> > > > 2.39.3 (Apple Git-146)
> > > >

Thanks
Barry

