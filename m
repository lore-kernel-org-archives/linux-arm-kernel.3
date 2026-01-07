Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71B5CF6BE2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9cpNlHN3hqxmzuHBR+IH1AWmpz8EK2C2/QSy6gpp1o=; b=LGEeelb3hYygzIBPEzuzzmRxua
	UHtmYhWm4/NkxYXHJikPs00Jlrx/+J+WBqNUzaPaWeLhuuTUndA0a+HVQ26YHu3W/eAgk92/aDSKn
	i8XWhPMWZqKn6HSBk9cRCeMj4Uc2N9b9WPlOx4niuPpzjskTuiRoyMUYY545JsKSN6X4vUKKPLKOv
	2EkdMsU1bDl53y/HtefvXCwS7eBTfOwyiXpn6D7pRXwrkTKsOrN0vkH3N1eSHf95LypNxFlquaFVl
	itKwwvq7wXXwmJz4Fl1fVxI37oS8YpxfJdeVNKDglj5g4ZDnxHAcbcu0a1HRsycNn/SFDXV8wHe+C
	GU/y/Wqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJAr-0000000E44Z-2gno;
	Wed, 07 Jan 2026 02:21:25 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJAn-0000000E44D-47Jw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 02:21:23 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-88059c28da1so14058636d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 18:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767752480; x=1768357280; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9cpNlHN3hqxmzuHBR+IH1AWmpz8EK2C2/QSy6gpp1o=;
        b=lQBJ6MrX75mJmkM0gen+d3yY0KgSrFlBNF/KEiHqVr8zKMzjzC9OezonESgn6jEevp
         zCaXijoSIh+rX0XCHJyvNA/m2umvpfPYvlqzvQqiARXLvm2HV4aqsMLYeoUfvXBO5UHk
         rg32ZUDh51Zbp0UOab7hGrjqsp5E5r4KbMmnceNuVJXxTnGnkESuKxN2d57+nnLNostZ
         qjAlp6+jD44jaudEdPSS3KL5QoeiI4asAlWEuMVn+gQ6ixQp3eFt9Zd+1bFpKs2QqoXP
         upZmM89vWukQFJSWpxeNMkTeEZIPQDiX6fOxRblWEqAuNJ6IscrwXL5IAGCWrSK7YjQE
         2swQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767752480; x=1768357280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U9cpNlHN3hqxmzuHBR+IH1AWmpz8EK2C2/QSy6gpp1o=;
        b=M3VC9/AXOgDo8KybZQPVXACPs9Z6701mQGLMIJISKLU8qHWbES3cWZNirn29HCzZAF
         RmDAoJ3EAM78el9dSc/4fyrsM0S8LFeiCs3973xxSNzXAqcbhfS/xJEs8jPvZyQ2LUon
         zw/n6xX1mq3sVyWCQm5QWWPI6Ae8Nhtkdxadk3sMnNl7HCkb5AI/Fqay/0nti2cUvdsP
         r0HBmglXbcZsuCiVB1XoQ+NA3o+j+gdTRUTUPxroyeqzfhRhcn1whsE7n3g52Cm0btXW
         ZnGUQ43IFeI1AiypaB0eGh4p4w/gbLHG8X+rL0spsXJLpK5DIWjeJrBme+DtvycdxCbS
         D61A==
X-Forwarded-Encrypted: i=1; AJvYcCXMiJ0dJmD6N9xC//V7ZcGxaXnzdBaHroKy1Nhxls3ZRNzsJKiKdH7tpUIiOxHYYdEYEkrgvjuXy6XNpj8mXuUW@lists.infradead.org
X-Gm-Message-State: AOJu0YwGIl1wnsWaIJ3d6grOqEAC1EemU+U8ziU67WJkMGYtFv1IzDkf
	vpZuhGU/GeodTnv5LwaQakiVylmk5ngC9BCJ1wqbjRkDpurmnzQbwew3hLWk3ZW+eTx6johF4oJ
	2znZKPCGI8utU9/aN0SLE/w/xRjsSsz4=
X-Gm-Gg: AY/fxX5PnTQ8MEVbs6u0RIzT3RbTziUGXQZ0AUJPx/C+bbikqSq+4m8e5FSrWYreVAX
	wFw/gDgvTRYEYnfNfjDhqUjeko8ksMGhYfp39EmeeU/FW3GGZHcWb7XQt0VxF4GQCT/UUyykEBs
	NFlNFtYg6/VmiP+fZ9ik6M1uLw6ECH/cHc+5NMcBGdHNgwBWIGjKjFB+DE1oOE6nlfs4//M3Rds
	k1+cc5HorBsL0fXESTFXbjT1Na/G8amH6mBdvHh4rnnUeNCacQ3Qx/EwsM28EYNsq9Bqg==
X-Google-Smtp-Source: AGHT+IHEeDTyOy/N8XIYTCLhg64xhVYMnmI/eJHgFbD/6zfBItwvl/vVHLKIaYBVmNPgiNfq31Nq4Z95zjp/zZW2QKM=
X-Received: by 2002:a05:6214:2dc6:b0:890:7084:e32 with SMTP id
 6a1803df08f44-890841871e8mr15281806d6.9.1767752480217; Tue, 06 Jan 2026
 18:21:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master> <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
 <20260107014601.dxvq6b7ljgxwg7iu@master>
In-Reply-To: <20260107014601.dxvq6b7ljgxwg7iu@master>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 Jan 2026 15:21:08 +1300
X-Gm-Features: AQt7F2oBRO9EL-TaBqBNZ53miS_qqh3dtM_egJf8cBa7y3uaGmOJ9tdSmO5VZyo
Message-ID: <CAGsJ_4xfVnPKSPvHYWa1cPK7kZC4F6hKreny9RsKfSCyC4RHuQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large folios
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	david@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, willy@infradead.org, 
	dev.jain@arm.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_182122_059872_A6453A9F 
X-CRM114-Status: GOOD (  34.00  )
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

On Wed, Jan 7, 2026 at 2:46=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com>=
 wrote:
>
> On Wed, Jan 07, 2026 at 10:29:25AM +1300, Barry Song wrote:
> >On Wed, Jan 7, 2026 at 2:22=E2=80=AFAM Wei Yang <richard.weiyang@gmail.c=
om> wrote:
> >>
> >> On Fri, Dec 26, 2025 at 02:07:59PM +0800, Baolin Wang wrote:
> >> >Similar to folio_referenced_one(), we can apply batched unmapping for=
 file
> >> >large folios to optimize the performance of file folios reclamation.
> >> >
> >> >Barry previously implemented batched unmapping for lazyfree anonymous=
 large
> >> >folios[1] and did not further optimize anonymous large folios or file=
-backed
> >> >large folios at that stage. As for file-backed large folios, the batc=
hed
> >> >unmapping support is relatively straightforward, as we only need to c=
lear
> >> >the consecutive (present) PTE entries for file-backed large folios.
> >> >
> >> >Performance testing:
> >> >Allocate 10G clean file-backed folios by mmap() in a memory cgroup, a=
nd try to
> >> >reclaim 8G file-backed folios via the memory.reclaim interface. I can=
 observe
> >> >75% performance improvement on my Arm64 32-core server (and 50%+ impr=
ovement
> >> >on my X86 machine) with this patch.
> >> >
> >> >W/o patch:
> >> >real    0m1.018s
> >> >user    0m0.000s
> >> >sys     0m1.018s
> >> >
> >> >W/ patch:
> >> >real   0m0.249s
> >> >user   0m0.000s
> >> >sys    0m0.249s
> >> >
> >> >[1] https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.=
com/T/#u
> >> >Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >> >Acked-by: Barry Song <baohua@kernel.org>
> >> >Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >> >---
> >> > mm/rmap.c | 7 ++++---
> >> > 1 file changed, 4 insertions(+), 3 deletions(-)
> >> >
> >> >diff --git a/mm/rmap.c b/mm/rmap.c
> >> >index 985ab0b085ba..e1d16003c514 100644
> >> >--- a/mm/rmap.c
> >> >+++ b/mm/rmap.c
> >> >@@ -1863,9 +1863,10 @@ static inline unsigned int folio_unmap_pte_bat=
ch(struct folio *folio,
> >> >       end_addr =3D pmd_addr_end(addr, vma->vm_end);
> >> >       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
> >> >
> >> >-      /* We only support lazyfree batching for now ... */
> >> >-      if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> >> >+      /* We only support lazyfree or file folios batching for now ..=
. */
> >> >+      if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> >> >               return 1;
> >> >+
> >> >       if (pte_unused(pte))
> >> >               return 1;
> >> >
> >> >@@ -2231,7 +2232,7 @@ static bool try_to_unmap_one(struct folio *foli=
o, struct vm_area_struct *vma,
> >> >                        *
> >> >                        * See Documentation/mm/mmu_notifier.rst
> >> >                        */
> >> >-                      dec_mm_counter(mm, mm_counter_file(folio));
> >> >+                      add_mm_counter(mm, mm_counter_file(folio), -nr=
_pages);
> >> >               }
> >> > discard:
> >> >               if (unlikely(folio_test_hugetlb(folio))) {
> >> >--
> >> >2.47.3
> >> >
> >>
> >> Hi, Baolin
> >>
> >> When reading your patch, I come up one small question.
> >>
> >> Current try_to_unmap_one() has following structure:
> >>
> >>     try_to_unmap_one()
> >>         while (page_vma_mapped_walk(&pvmw)) {
> >>             nr_pages =3D folio_unmap_pte_batch()
> >>
> >>             if (nr_pages =3D folio_nr_pages(folio))
> >>                 goto walk_done;
> >>         }
> >>
> >> I am thinking what if nr_pages > 1 but nr_pages !=3D folio_nr_pages().
> >>
> >> If my understanding is correct, page_vma_mapped_walk() would start fro=
m
> >> (pvmw->address + PAGE_SIZE) in next iteration, but we have already cle=
ared to
> >> (pvmw->address + nr_pages * PAGE_SIZE), right?
> >>
> >> Not sure my understanding is correct, if so do we have some reason not=
 to
> >> skip the cleared range?
> >
> >I don=E2=80=99t quite understand your question. For nr_pages > 1 but not=
 equal
> >to nr_pages, page_vma_mapped_walk will skip the nr_pages - 1 PTEs inside=
.
> >
> >take a look:
> >
> >next_pte:
> >                do {
> >                        pvmw->address +=3D PAGE_SIZE;
> >                        if (pvmw->address >=3D end)
> >                                return not_found(pvmw);
> >                        /* Did we cross page table boundary? */
> >                        if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) =3D=
=3D 0) {
> >                                if (pvmw->ptl) {
> >                                        spin_unlock(pvmw->ptl);
> >                                        pvmw->ptl =3D NULL;
> >                                }
> >                                pte_unmap(pvmw->pte);
> >                                pvmw->pte =3D NULL;
> >                                pvmw->flags |=3D PVMW_PGTABLE_CROSSED;
> >                                goto restart;
> >                        }
> >                        pvmw->pte++;
> >                } while (pte_none(ptep_get(pvmw->pte)));
> >
>
> Yes, we do it in page_vma_mapped_walk() now. Since they are pte_none(), t=
hey
> will be skipped.
>
> I mean maybe we can skip it in try_to_unmap_one(), for example:
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 9e5bd4834481..ea1afec7c802 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2250,6 +2250,10 @@ static bool try_to_unmap_one(struct folio *folio, =
struct vm_area_struct *vma,
>                  */
>                 if (nr_pages =3D=3D folio_nr_pages(folio))
>                         goto walk_done;
> +               else {
> +                       pvmw.address +=3D PAGE_SIZE * (nr_pages - 1);
> +                       pvmw.pte +=3D nr_pages - 1;
> +               }
>                 continue;
>  walk_abort:
>                 ret =3D false;


I feel this couples the PTE walk iteration with the unmap
operation, which does not seem fine to me. It also appears
to affect only corner cases.

>
> Not sure this is reasonable.
>

Thanks
Barry

