Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC2CC79FBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZMszV4Fo8yrNUR2DejJTxC4DKTXaJ4HLASWl15bV4E=; b=Ymo18sUXhdz752vmCxHzMNOdVx
	maAY1RvKh7MVCnMWzjfJlfY2RBnyvlfLG//4kw4mYc7KrBt4tPGI3NCnNQb0/7eiHIK/vggY2d8qY
	He9LZjSU22Uk5dZ4QCg7d5VE1dKPeY4ASdzgVWXuSPzsrxOniIIyQeQmTMtu8MDordmmjVThpxeJD
	W0AJSXCsmpM/NiQ0z92v2/UgziToO9pSl3fWrcg+KXbT32isOOmIO7cqjxa2k6ktS2ogIDETreMmy
	7bMruqQ8hFgrKGvMjEaW/A4ZozZS5RYlBCjFm86IURwHc/5EL7MMVcZZgf+9rfwiLI9O73Tw/Drt2
	tPE153CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkom-0000000EFtK-0PrB;
	Fri, 16 Jan 2026 14:28:52 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkoi-0000000EFsl-30Qb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 14:28:50 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50146483bf9so31321081cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768573727; x=1769178527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZMszV4Fo8yrNUR2DejJTxC4DKTXaJ4HLASWl15bV4E=;
        b=mtKrXpq2m2y6MvisTYBLukhK55Vk+Y8HBZRn6tE6q3Whv19HD3xWKVmtMzc1yhz9x/
         bvpw49/17TSBZiFn0HXqIwCvKLnBt8vMYUXEd9qSzh/cfp9drtA1eaumyPFtTsfeTLEk
         VCo034Vwo92PGEmTwZTVFiRwfrMBLijMs6CyNxO45G9D9bKi6N+RFATPDQWt+tQF9uZj
         eluynylw6ywqq6RYCnfKV+kPqf7GTw9ug51GUepyRNz1ILoZ3uxNzeid1JBwJVLEDe6c
         LLkGOkIFZDfY1sMP82ubzPbdRdufkhZbuWOeUP02/goSLIpvjECXLFHlVva5oSuvb+C9
         nn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768573727; x=1769178527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZMszV4Fo8yrNUR2DejJTxC4DKTXaJ4HLASWl15bV4E=;
        b=g7+bFNlkJe71dvoCOLrtpX/BJUyybfWj2Ib+RK68JQtcK/Kew+lQOXEtckz+KVqqlT
         Ko0tg1Dc6NnsKPAE3MZ/AScBUXbt3aML7WX89HsAPfc4DbTJaeoqOCRiazu3TnJudDOJ
         Q9//98o6jlJ4e7qqW7+psuTEQsVWiT2AeaAHKHnQLcuwvzxDQKAyz5//2hD/alp0o/9Z
         cbKgfEsPX0CEpmKevtXc01gMgWS4zrMsIHQ04vgf7E2Hc2cXNoDOMYQkIZqaJtGnRk9j
         fxgOP6C/+Hj2tp6dqH4UHNsyWUdtw5NR8ZoOrayeYyrqThu6PyzCMgxBCXRnWYpNeFNm
         h4rw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/R6dWzVFVZFYTFFW6k78HoU+9oYGmUDHqC/g6Q75oLzHtFkIYciZkZDcKk9bYoFB+tzCkAivJ8inGij+U3Ll@lists.infradead.org
X-Gm-Message-State: AOJu0YxvUylrT0nd7+CCo9UQ6ct3oG2im5r9vsH+6k4GN5Id04RWkRZl
	z8p41b5gXKVXfRvdKfcZl2xXQ3iPJtOJAppd+qIB+3Sb875/CvJt63dpg4ogKLHCRUeLKde+2jq
	GmsKC3I7+fXfbzQwm8xYBfChXv81gsD0=
X-Gm-Gg: AY/fxX4/FpDjdYLChkQcVY/0kpxRUwG0xaBPQQHs5K4ls+pDIXSmw5yNuysL7Hy2IZ3
	54+ijoo8iKa3/NNTLX3Sd94TMIMc4prwFcHWz3g0fwW3tIkJLEQ/+RufEUTBToU0puHnKU8rUV6
	vdmqRLl8LAOVsgX7kdLBT+NChZkiMbGchfwzaCFmMaNMhWdid5fr6rH6+GnSxsm3puVpKqxswFm
	WVcVmYNPIL5rK2K5mWVO4acyruZ0czAhLkB0PAepRIpzeCBMEy7KZRprKZlMpaMfki4qVtrBQ==
X-Received: by 2002:a05:622a:1a8d:b0:501:4ca3:7420 with SMTP id
 d75a77b69052e-502a163bfcamr48413821cf.36.1768573726346; Fri, 16 Jan 2026
 06:28:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master> <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
 <20260107014601.dxvq6b7ljgxwg7iu@master> <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
In-Reply-To: <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 16 Jan 2026 22:28:35 +0800
X-Gm-Features: AZwV_QhAYlc9A1PxMbnzWgj5BABlaY8S87UmSa5kP3_oO1pH5nag-DoPjw1j2qU
Message-ID: <CAGsJ_4yo-EE__1VzHqxE8ehDOFQuxqP9GXcskkeZ-WTTyz12_A@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large folios
To: Dev Jain <dev.jain@arm.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_062848_784148_9A53EEFB 
X-CRM114-Status: GOOD (  39.36  )
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

On Fri, Jan 16, 2026 at 5:53=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 07/01/26 7:16 am, Wei Yang wrote:
> > On Wed, Jan 07, 2026 at 10:29:25AM +1300, Barry Song wrote:
> >> On Wed, Jan 7, 2026 at 2:22=E2=80=AFAM Wei Yang <richard.weiyang@gmail=
.com> wrote:
> >>> On Fri, Dec 26, 2025 at 02:07:59PM +0800, Baolin Wang wrote:
> >>>> Similar to folio_referenced_one(), we can apply batched unmapping fo=
r file
> >>>> large folios to optimize the performance of file folios reclamation.
> >>>>
> >>>> Barry previously implemented batched unmapping for lazyfree anonymou=
s large
> >>>> folios[1] and did not further optimize anonymous large folios or fil=
e-backed
> >>>> large folios at that stage. As for file-backed large folios, the bat=
ched
> >>>> unmapping support is relatively straightforward, as we only need to =
clear
> >>>> the consecutive (present) PTE entries for file-backed large folios.
> >>>>
> >>>> Performance testing:
> >>>> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, =
and try to
> >>>> reclaim 8G file-backed folios via the memory.reclaim interface. I ca=
n observe
> >>>> 75% performance improvement on my Arm64 32-core server (and 50%+ imp=
rovement
> >>>> on my X86 machine) with this patch.
> >>>>
> >>>> W/o patch:
> >>>> real    0m1.018s
> >>>> user    0m0.000s
> >>>> sys     0m1.018s
> >>>>
> >>>> W/ patch:
> >>>> real   0m0.249s
> >>>> user   0m0.000s
> >>>> sys    0m0.249s
> >>>>
> >>>> [1] https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail=
.com/T/#u
> >>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >>>> Acked-by: Barry Song <baohua@kernel.org>
> >>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>> ---
> >>>> mm/rmap.c | 7 ++++---
> >>>> 1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/mm/rmap.c b/mm/rmap.c
> >>>> index 985ab0b085ba..e1d16003c514 100644
> >>>> --- a/mm/rmap.c
> >>>> +++ b/mm/rmap.c
> >>>> @@ -1863,9 +1863,10 @@ static inline unsigned int folio_unmap_pte_ba=
tch(struct folio *folio,
> >>>>       end_addr =3D pmd_addr_end(addr, vma->vm_end);
> >>>>       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
> >>>>
> >>>> -      /* We only support lazyfree batching for now ... */
> >>>> -      if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> >>>> +      /* We only support lazyfree or file folios batching for now .=
.. */
> >>>> +      if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> >>>>               return 1;
> >>>> +
> >>>>       if (pte_unused(pte))
> >>>>               return 1;
> >>>>
> >>>> @@ -2231,7 +2232,7 @@ static bool try_to_unmap_one(struct folio *fol=
io, struct vm_area_struct *vma,
> >>>>                        *
> >>>>                        * See Documentation/mm/mmu_notifier.rst
> >>>>                        */
> >>>> -                      dec_mm_counter(mm, mm_counter_file(folio));
> >>>> +                      add_mm_counter(mm, mm_counter_file(folio), -n=
r_pages);
> >>>>               }
> >>>> discard:
> >>>>               if (unlikely(folio_test_hugetlb(folio))) {
> >>>> --
> >>>> 2.47.3
> >>>>
> >>> Hi, Baolin
> >>>
> >>> When reading your patch, I come up one small question.
> >>>
> >>> Current try_to_unmap_one() has following structure:
> >>>
> >>>     try_to_unmap_one()
> >>>         while (page_vma_mapped_walk(&pvmw)) {
> >>>             nr_pages =3D folio_unmap_pte_batch()
> >>>
> >>>             if (nr_pages =3D folio_nr_pages(folio))
> >>>                 goto walk_done;
> >>>         }
> >>>
> >>> I am thinking what if nr_pages > 1 but nr_pages !=3D folio_nr_pages()=
.
> >>>
> >>> If my understanding is correct, page_vma_mapped_walk() would start fr=
om
> >>> (pvmw->address + PAGE_SIZE) in next iteration, but we have already cl=
eared to
> >>> (pvmw->address + nr_pages * PAGE_SIZE), right?
> >>>
> >>> Not sure my understanding is correct, if so do we have some reason no=
t to
> >>> skip the cleared range?
> >> I don=E2=80=99t quite understand your question. For nr_pages > 1 but n=
ot equal
> >> to nr_pages, page_vma_mapped_walk will skip the nr_pages - 1 PTEs insi=
de.
> >>
> >> take a look:
> >>
> >> next_pte:
> >>                do {
> >>                        pvmw->address +=3D PAGE_SIZE;
> >>                        if (pvmw->address >=3D end)
> >>                                return not_found(pvmw);
> >>                        /* Did we cross page table boundary? */
> >>                        if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) =
=3D=3D 0) {
> >>                                if (pvmw->ptl) {
> >>                                        spin_unlock(pvmw->ptl);
> >>                                        pvmw->ptl =3D NULL;
> >>                                }
> >>                                pte_unmap(pvmw->pte);
> >>                                pvmw->pte =3D NULL;
> >>                                pvmw->flags |=3D PVMW_PGTABLE_CROSSED;
> >>                                goto restart;
> >>                        }
> >>                        pvmw->pte++;
> >>                } while (pte_none(ptep_get(pvmw->pte)));
> >>
> > Yes, we do it in page_vma_mapped_walk() now. Since they are pte_none(),=
 they
> > will be skipped.
> >
> > I mean maybe we can skip it in try_to_unmap_one(), for example:
> >
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 9e5bd4834481..ea1afec7c802 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -2250,6 +2250,10 @@ static bool try_to_unmap_one(struct folio *folio=
, struct vm_area_struct *vma,
> >                */
> >               if (nr_pages =3D=3D folio_nr_pages(folio))
> >                       goto walk_done;
> > +             else {
> > +                     pvmw.address +=3D PAGE_SIZE * (nr_pages - 1);
> > +                     pvmw.pte +=3D nr_pages - 1;
> > +             }
> >               continue;
> >  walk_abort:
> >               ret =3D false;
>
> I am of the opinion that we should do something like this. In the interna=
l pvmw code,

I am still not convinced that skipping PTEs in try_to_unmap_one()
is the right place. If we really want to skip certain PTEs early,
should we instead hint page_vma_mapped_walk()? That said, I don't
see much value in doing so, since in most cases nr is either 1 or
folio_nr_pages(folio).

> we keep skipping ptes till the ptes are none. With my proposed uffd-fix [=
1], if the old
> ptes were uffd-wp armed, pte_install_uffd_wp_if_needed will convert all p=
tes from none
> to not none, and we will lose the batching effect. I also plan to extend =
support to
> anonymous folios (therefore generalizing for all types of memory) which w=
ill set a
> batch of ptes as swap, and the internal pvmw code won't be able to skip t=
hrough the
> batch.

Thanks for catching this, Dev. I already filter out some of the more
complex cases, for example:
if (pte_unused(pte))
        return 1;

Since the userfaultfd write-protection case is also a corner case,
could we filter it out as well?

diff --git a/mm/rmap.c b/mm/rmap.c
index c86f1135222b..6bb8ba6f046e 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1870,6 +1870,9 @@ static inline unsigned int
folio_unmap_pte_batch(struct folio *folio,
        if (pte_unused(pte))
                return 1;

+       if (userfaultfd_wp(vma))
+               return 1;
+
        return folio_pte_batch(folio, pvmw->pte, pte, max_nr);
}

Just offering a second option =E2=80=94 yours is probably better.

Thanks
Barry

