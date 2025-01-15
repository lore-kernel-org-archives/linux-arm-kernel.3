Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63CEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O3QZsGSuRSWHlL1j6E1TG5WwZq7nPfjNi9Rr7JBI/E=; b=c4d8e8Mt7CYzG8dSJZQCPsppv7
	D/E6xOUz+BotkF3swWcQpNGO+OBXQlKya0i+jtbCROYx9GLA1xarfrFYi3YmQ5tRei9/SAAQVXbYs
	6HIVs9uS4eZRL0oEda5IYpMdDqiq1Mgo1/78b8/MrBSzdJi5I9nu2GqYlriEUhljojFg4SBCDeGy+
	JbQTYEHNZDLvHf1L3LnrfveR9dZVbWuE3+hCHwNg9hNHaXABlpFsCHS9laMcRWc0Kir5UxHkzF83A
	7xCj+vZ3InGI7elj+I5LXoND3d388y9tkY4vgopbnMU50wQttvHg1t2HpyiMjN2RwNKLYIT0QZj5D
	QsuReFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxQh-0000000Asf9-089p;
	Wed, 15 Jan 2025 07:03:07 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxPS-0000000AsaA-1itP;
	Wed, 15 Jan 2025 07:01:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so10946437a12.2;
        Tue, 14 Jan 2025 23:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924509; x=1737529309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O3QZsGSuRSWHlL1j6E1TG5WwZq7nPfjNi9Rr7JBI/E=;
        b=ZfJnKonm0PZnrKVS60FpTyqneb1mwq/9Ojk9LhbqMKKxGjVbaIHdCI63gbuO6pa4KN
         a+8Qrm6fGxWfnfJmE0qsPMXs0D1/cbRdiSqlA2VHtb9SBoYKSIwZ++8oPEDexo3R9wev
         IeflIykc9hO9xMRwGQj5IgMOxof0vbaVIuVZpL6VBoruFTpBMtuj2K3jpCKLKLEMgK05
         tIWcluRXk+KzNT6GiBYh4+8clXYXvLACrzuh29G+LkwhPDFDrIq7rRJOYhPSeYR2p1kl
         47f7VaUvLDcjOm6DiyNrCHiE2b8G5ibHSe5ykRFHqhFu2aEiY4O/tHjb+1sOGGkRoEZ3
         OlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924509; x=1737529309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6O3QZsGSuRSWHlL1j6E1TG5WwZq7nPfjNi9Rr7JBI/E=;
        b=tuakyxt2fT6mRkLvg4Sg4H8klFbZl5zwXo3+F8nHP0rad1VarqMPvbrXeFf9gFwV2L
         cniSlP3b3qgULMRLYsyMOwtlVxjjkD2Ao3IwtNNzSowPqbggR9+2I0rAYL/r58rm+JHb
         N3/gGiRpw96Km0rN56ucDl0hiEb9/ArgsHoc8u+3L4rHAR5gKmGEC0PTX2KqyFCzeD9d
         MSVbyZKAZffRj/g25cCLAIuEbK+HuB3a/4rHrFYRoLfX6+KAPYi0aKXqFsiEbMk1OFWv
         YJd91CVF3+qZgjbu7xGVP5UhYJUinsqxdaksxXTG1cXYa9eBpCVcmvbGk8woFtBqpYjE
         uFSw==
X-Forwarded-Encrypted: i=1; AJvYcCUOU2fWu+xlx+EyCVOB0NKK0ZX7C4coaQ0XZ55acTcw2D8VoDmNnWz9ddf7j3zmaqayoDeysfLQttWUrxYlCIOS@lists.infradead.org, AJvYcCWJSwPozOf0vKWmj+cGYgGDlCRurtMIsC0/z/zhb+dfupE+I9PlT1prDerRzP5cZGAZq5rGPFnQi1x2BVw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnsTXvXYNlbE6VSX1HdpYll7PQojSNB+typI0eP9YHTf34snmd
	JbJ9G4y3JBKPBCkIUxe2M6vFhnfK1eaRCoSpWWB09rMpdN7794+R2XZX8geU7HJfwq9jjg4kyw5
	SZUpYElX9i+2xNBfpRp/ENYVO43s=
X-Gm-Gg: ASbGncu/z896QeBxHbtWYggKlPwzTf/cMPGhDS5kX5/TcMYa/h/BMnWBtxaQoOeUUVa
	ulYUlk8n9yvZpCCt5JrXg/SZ3O4v37FvrlaLEoQ==
X-Google-Smtp-Source: AGHT+IHTr/h5l3etOcELLw+AEUaUlNzZAGjDNs/fSDwtY8uTelZHVRZmbRM6DxRV5P4bU3LQyIMJ1k/3bslZiWZXe6A=
X-Received: by 2002:a05:6402:2689:b0:5d2:7383:a3b7 with SMTP id
 4fb4d7f45d1cf-5d972e6482cmr24311616a12.23.1736924508474; Tue, 14 Jan 2025
 23:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-5-21cnbao@gmail.com>
 <CAK1f24=3LmQMzgosB0o9OKV-P8f6cPO2ZCPBA64QXQqZYPk=ww@mail.gmail.com>
 <CAGsJ_4xwHVmnKENYV6M6yMSUzeeR8tM7F8mbkAUd4eVHhfN_BA@mail.gmail.com>
 <CAK1f24mCYF4Ew0hHr2+a=98RbxmmHwXv8KeFARyMvnLi99c2fQ@mail.gmail.com> <CAGsJ_4wCPHxdXOBeaP6T4Rv_QHjLhL+LCZH-r2fwCrCBDk42_Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4wCPHxdXOBeaP6T4Rv_QHjLhL+LCZH-r2fwCrCBDk42_Q@mail.gmail.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Wed, 15 Jan 2025 15:01:11 +0800
X-Gm-Features: AbW1kvYtB-OTeTnzBW80sbgsK3g7LTcWu2tQUEvRIy_gNS43i-szryvnWHRhFtY
Message-ID: <CAK1f24nyuyfERCpefLapukmaNrqYuO_69bVGnfhesrx37HmnSQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_230150_457299_294FDDE0 
X-CRM114-Status: GOOD (  38.30  )
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

On Wed, Jan 15, 2025 at 2:42=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Wed, Jan 15, 2025 at 7:26=E2=80=AFPM Lance Yang <ioworker0@gmail.com> =
wrote:
> >
> > On Wed, Jan 15, 2025 at 1:09=E2=80=AFPM Barry Song <21cnbao@gmail.com> =
wrote:
> > >
> > > On Wed, Jan 15, 2025 at 6:01=E2=80=AFPM Lance Yang <ioworker0@gmail.c=
om> wrote:
> > > >
> > > > On Wed, Jan 15, 2025 at 11:38=E2=80=AFAM Barry Song <21cnbao@gmail.=
com> wrote:
> > > > >
> > > > > From: Barry Song <v-songbaohua@oppo.com>
> > > > >
> > > > > The try_to_unmap_one() function currently handles PMD-mapped THPs
> > > > > inefficiently. It first splits the PMD into PTEs, copies the dirt=
y
> > > > > state from the PMD to the PTEs, iterates over the PTEs to locate
> > > > > the dirty state, and then marks the THP as swap-backed. This proc=
ess
> > > > > involves unnecessary PMD splitting and redundant iteration. Inste=
ad,
> > > > > this functionality can be efficiently managed in
> > > > > __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> > > > > improving performance.
> > > > >
> > > > > The following microbenchmark redirties folios after invoking MADV=
_FREE,
> > > > > then measures the time taken to perform memory reclamation (actua=
lly
> > > > > set those folios swapbacked again) on the redirtied folios.
> > > > >
> > > > >  #include <stdio.h>
> > > > >  #include <sys/mman.h>
> > > > >  #include <string.h>
> > > > >  #include <time.h>
> > > > >
> > > > >  #define SIZE 128*1024*1024  // 128 MB
> > > > >
> > > > >  int main(int argc, char *argv[])
> > > > >  {
> > > > >         while(1) {
> > > > >                 volatile int *p =3D mmap(0, SIZE, PROT_READ | PRO=
T_WRITE,
> > > > >                                 MAP_PRIVATE | MAP_ANONYMOUS, -1, =
0);
> > > > >
> > > > >                 memset((void *)p, 1, SIZE);
> > > > >                 madvise((void *)p, SIZE, MADV_FREE);
> > > > >                 /* redirty after MADV_FREE */
> > > > >                 memset((void *)p, 1, SIZE);
> > > > >
> > > > >                 clock_t start_time =3D clock();
> > > > >                 madvise((void *)p, SIZE, MADV_PAGEOUT);
> > > > >                 clock_t end_time =3D clock();
> > > > >
> > > > >                 double elapsed_time =3D (double)(end_time - start=
_time) / CLOCKS_PER_SEC;
> > > > >                 printf("Time taken by reclamation: %f seconds\n",=
 elapsed_time);
> > > > >
> > > > >                 munmap((void *)p, SIZE);
> > > > >         }
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > Testing results are as below,
> > > > > w/o patch:
> > > > > ~ # ./a.out
> > > > > Time taken by reclamation: 0.007300 seconds
> > > > > Time taken by reclamation: 0.007226 seconds
> > > > > Time taken by reclamation: 0.007295 seconds
> > > > > Time taken by reclamation: 0.007731 seconds
> > > > > Time taken by reclamation: 0.007134 seconds
> > > > > Time taken by reclamation: 0.007285 seconds
> > > > > Time taken by reclamation: 0.007720 seconds
> > > > > Time taken by reclamation: 0.007128 seconds
> > > > > Time taken by reclamation: 0.007710 seconds
> > > > > Time taken by reclamation: 0.007712 seconds
> > > > > Time taken by reclamation: 0.007236 seconds
> > > > > Time taken by reclamation: 0.007690 seconds
> > > > > Time taken by reclamation: 0.007174 seconds
> > > > > Time taken by reclamation: 0.007670 seconds
> > > > > Time taken by reclamation: 0.007169 seconds
> > > > > Time taken by reclamation: 0.007305 seconds
> > > > > Time taken by reclamation: 0.007432 seconds
> > > > > Time taken by reclamation: 0.007158 seconds
> > > > > Time taken by reclamation: 0.007133 seconds
> > > > > =E2=80=A6
> > > > >
> > > > > w/ patch
> > > > >
> > > > > ~ # ./a.out
> > > > > Time taken by reclamation: 0.002124 seconds
> > > > > Time taken by reclamation: 0.002116 seconds
> > > > > Time taken by reclamation: 0.002150 seconds
> > > > > Time taken by reclamation: 0.002261 seconds
> > > > > Time taken by reclamation: 0.002137 seconds
> > > > > Time taken by reclamation: 0.002173 seconds
> > > > > Time taken by reclamation: 0.002063 seconds
> > > > > Time taken by reclamation: 0.002088 seconds
> > > > > Time taken by reclamation: 0.002169 seconds
> > > > > Time taken by reclamation: 0.002124 seconds
> > > > > Time taken by reclamation: 0.002111 seconds
> > > > > Time taken by reclamation: 0.002224 seconds
> > > > > Time taken by reclamation: 0.002297 seconds
> > > > > Time taken by reclamation: 0.002260 seconds
> > > > > Time taken by reclamation: 0.002246 seconds
> > > > > Time taken by reclamation: 0.002272 seconds
> > > > > Time taken by reclamation: 0.002277 seconds
> > > > > Time taken by reclamation: 0.002462 seconds
> > > > > =E2=80=A6
> > > > >
> > > > > This patch significantly speeds up try_to_unmap_one() by allowing=
 it
> > > > > to skip redirtied THPs without splitting the PMD.
> > > > >
> > > > > Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > > > Suggested-by: Lance Yang <ioworker0@gmail.com>
> > > > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > > > ---
> > > > >  mm/huge_memory.c | 24 +++++++++++++++++-------
> > > > >  mm/rmap.c        | 13 ++++++++++---
> > > > >  2 files changed, 27 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > > > index 3d3ebdc002d5..47cc8c3f8f80 100644
> > > > > --- a/mm/huge_memory.c
> > > > > +++ b/mm/huge_memory.c
> > > > > @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locke=
d(struct vm_area_struct *vma,
> > > > >         int ref_count, map_count;
> > > > >         pmd_t orig_pmd =3D *pmdp;
> > > > >
> > > > > -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> > > > > +       if (pmd_dirty(orig_pmd))
> > > > > +               folio_set_dirty(folio);
> > > > > +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPP=
ABLE)) {
> > > > > +               folio_set_swapbacked(folio);
> > > > >                 return false;
> > > > > +       }
> > > >
> > > > If either the PMD or the folio is dirty, should we just return fals=
e right away,
> > > > regardless of VM_DROPPABLE? There=E2=80=99s no need to proceed furt=
her in that
> > > > case, IMHO ;)
> > >
> > > I don't quite understand you, but we need to proceed to clear pmd ent=
ry.
> > > if vm_droppable is true, even if the folio is dirty, we still drop th=
e folio.
> >
> > Hey barry,
> >
> > One thing I still don=E2=80=99t quite understand is as follows:
> >
> > One of the semantics of VM_DROPPABLE is that, under memory pressure,
> > the kernel can drop the pages. Similarly, for MADV_FREE, one of its
> > semantics is that the kernel can free the pages when memory pressure
> > occurs, but only if there is no subsequent write (i.e., the PMD is clea=
n).
> >
> > So, if VM_DROPPABLE is true, we still drop the folio even if it's dirty=
. This
> > seems to conflict with the semantics of MADV_FREE, which requires the
> > folio or PMD to be clean before being dropped. wdyt?
>
> I think we can simply revisit the patch where VM_DROPPABLE was introduced=
:
> commit 9651fcedf7b92d3f7
> "mm: add MAP_DROPPABLE for designating always lazily freeable mappings"

Ah, I see ~

As the patch says: "Unlike MADV_FREE mappings, VM_DROPPABLE ones
can be dropped even if they've been dirtied".

Thanks a lot for the lesson!
Lance

>
> >
> > Thanks,
> > Lance
> >
> >
> >
> >
> > >
> > > >
> > > > Thanks,
> > > > Lance
> > > >
> > > > >
> > > > >         orig_pmd =3D pmdp_huge_clear_flush(vma, addr, pmdp);
> > > > >
> > > > > @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locke=
d(struct vm_area_struct *vma,
> > > > >          *
> > > > >          * The only folio refs must be one from isolation plus th=
e rmap(s).
> > > > >          */
> > > > > -       if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> > > > > -           ref_count !=3D map_count + 1) {
> > > > > +       if (pmd_dirty(orig_pmd))
> > > > > +               folio_set_dirty(folio);
> > > > > +       if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPP=
ABLE)) {
> > > > > +               folio_set_swapbacked(folio);
> > > > > +               set_pmd_at(mm, addr, pmdp, orig_pmd);
> > > > > +               return false;
> > > > > +       }
> > > > > +
> > > > > +       if (ref_count !=3D map_count + 1) {
> > > > >                 set_pmd_at(mm, addr, pmdp, orig_pmd);
> > > > >                 return false;
> > > > >         }
> > > > > @@ -3119,12 +3130,11 @@ bool unmap_huge_pmd_locked(struct vm_area=
_struct *vma, unsigned long addr,
> > > > >  {
> > > > >         VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
> > > > >         VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
> > > > > +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> > > > > +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
> > > > >         VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
> > > > >
> > > > > -       if (folio_test_anon(folio) && !folio_test_swapbacked(foli=
o))
> > > > > -               return __discard_anon_folio_pmd_locked(vma, addr,=
 pmdp, folio);
> > > > > -
> > > > > -       return false;
> > > > > +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, f=
olio);
> > > > >  }
> > > > >
> > > > >  static void remap_page(struct folio *folio, unsigned long nr, in=
t flags)
> > > > > diff --git a/mm/rmap.c b/mm/rmap.c
> > > > > index be1978d2712d..a859c399ec7c 100644
> > > > > --- a/mm/rmap.c
> > > > > +++ b/mm/rmap.c
> > > > > @@ -1724,9 +1724,16 @@ static bool try_to_unmap_one(struct folio =
*folio, struct vm_area_struct *vma,
> > > > >                 }
> > > > >
> > > > >                 if (!pvmw.pte) {
> > > > > -                       if (unmap_huge_pmd_locked(vma, pvmw.addre=
ss, pvmw.pmd,
> > > > > -                                                 folio))
> > > > > -                               goto walk_done;
> > > > > +                       if (folio_test_anon(folio) && !folio_test=
_swapbacked(folio)) {
> > > > > +                               if (unmap_huge_pmd_locked(vma, pv=
mw.address, pvmw.pmd, folio))
> > > > > +                                       goto walk_done;
> > > > > +                               /*
> > > > > +                                * unmap_huge_pmd_locked has eith=
er already marked
> > > > > +                                * the folio as swap-backed or de=
cided to retain it
> > > > > +                                * due to GUP or speculative refe=
rences.
> > > > > +                                */
> > > > > +                               goto walk_abort;
> > > > > +                       }
> > > > >
> > > > >                         if (flags & TTU_SPLIT_HUGE_PMD) {
> > > > >                                 /*
> > > > > --
> > > > > 2.39.3 (Apple Git-146)
> > > > >
>
> Thanks
> Barry

