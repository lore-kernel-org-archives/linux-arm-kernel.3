Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89375FC9ED3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 08:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtjhCeTQDdoAVsXN8dHO7TB8D+UZfktfl3sVcf19Ny0=; b=kN98qKGi4hElAQPn1w3yQPwkpP
	uo2hztjzXhAalve0qWWotj42Pt6lUIXGT20U05uwgHWDOYOF4sIzSVk8Xj3ZQF0isMTKoKN5pTczq
	yBKiZlisbNWJW1pmL4a3ykAAq/Xh5cbu2xJfnz8gg/Z/CmD4mBfDOTORsYp8bznyedkJ2B4THo+VA
	VN05/wW9at+IWLr1A5UrZI8CkTw2rOE0PtRjBhau6agg1X8JAyA2G3TfaUmeUyaM2Nx+X5oaAPVgb
	R1Dtlv8Ce2pCcWJUkdKWe/+LveuQiDf6baHLUXbR3Ve8IbH9PshAV7c2MuuQlntYfamUx3RDnrSNU
	Y2jB0fzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymco-00000004ztN-1goJ;
	Sat, 07 Mar 2026 08:03:02 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymcm-00000004zt1-0iqX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 08:03:01 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5062fc5d86aso88136931cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 00:02:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772870579; cv=none;
        d=google.com; s=arc-20240605;
        b=kY0nm4oaUFApA0ZyTtchdiiFXYHCb8bTs486zMjSsv/fIquBYNwE5ghubauqPzdfGp
         QadICqT4SyljDnUjjDqHG/MkPpChHhcalEoSRtuDzQUOScSkZFGkNPvb4JUHqCDlqjWS
         1JXWRDBU3rdui1rmR6MtNwGtldAQUvAMZ0z3ou3/sL+E1PACehh0ekbMx41PofQdvI4N
         IU2eELAN9NRYk/fqWK+Yn7KufchWZrZf9jk6qeAXuhIMPBxTf57rjhvUHrFVO7kzP0Iz
         ZG9iArUVhxiiz2zMtkovnUq4B/csNArHz/3EaYH9Mtd3TyJqkjQciIdUEmlSeiE13zHY
         dzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtjhCeTQDdoAVsXN8dHO7TB8D+UZfktfl3sVcf19Ny0=;
        fh=Xxl8Lnus+0vwIsQ/rG0+yQr5RNfaiXhob0IgH72j2kE=;
        b=gl1eCh/SqBtWsmo8Y8nR79BJ/TYiXcT9DDoi9iGPFzTw0g2hRojIkc9QGmyd1Q9jKY
         pTILIZyMG5/JylVYH+6EHy0SALeIjT9Ktn7OhOL1OAvYQckz9cry0iU/5O1682xhUdgw
         tf6yv7Wm3oQ1XtHd9XabXqlBCVT/LB4ngoDsP2EgyH9fMbK4iW0RrmCOY4aP3BT+6GkF
         qJ518pqytM9eOVKNMeOT7hEKCbQeAgcGSy2lwkSHU7ErbZrpL1tRKS7aHwSxZh6cOJFu
         Y5mTcLswO9Igy6EzaOgsmXW69xm+LcF8AwGagbQAmTdpWCDJIXfuxqR64IKgMuPHK6Gq
         fdeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772870579; x=1773475379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtjhCeTQDdoAVsXN8dHO7TB8D+UZfktfl3sVcf19Ny0=;
        b=M6q2vKwVzeIlGEucapxVsWBXvvTZBVkm9C0DmoevpZp79xMCmVHdL6o7K1KZjVHxOB
         kBHUOiSZkgtajpRUTpAhfS7PE8emsCJqkx8+bnYkCiYE7PVxu329Y790pdu2JPXTSFfb
         9IAklFV7cUozhBIv9mHsxqCj7ZLNxFNgzoYKSpRcaU2HS3C8zyFJuydqAYqc174Pud6M
         jXyZlCVD3bmJ2P2dslJdbfIH1Ejh5Z/QMNvCytbWRGNSpePDqfnHKeg5HFu7QxjcOCb5
         T/0R92VGs01+LOhtI6hOuQ6/0bRt1wztT+GQq3sySrY5vRHkKS3oKXb3+Qfid9sBaplD
         dMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772870579; x=1773475379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtjhCeTQDdoAVsXN8dHO7TB8D+UZfktfl3sVcf19Ny0=;
        b=ph2jsnu4XWmzpaBACoOz6lPyfshezuF+ioRxAxNC3JUxTT8ufZS8K3iPSKnPb0LM6r
         mcjx9LUZYHrG6xu8B3XDesoZ2g9WpMcqNASMZDBiVI/E5gn5NSnEOqxBBGlQkg3FikK5
         c3QN7hSbm78zQXMx4Dabi0wj1xW/P4vDqnRXF9SbNGnqxqt06OKMxOtz8FfJHQRw7JVa
         ZOjPp0/5MoJ4qyYfs//uIQhI5ZbNWyKUuNWpMBBumPjQ0iPYZFlMBflpzp8y708hWJVz
         KAZCVWTjFbFgx+i5ng9h68OglGE81o4cWfNzic5s7XqKMBuW5vkm29Xk/btZzQ7yR5cQ
         IsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0y1P6pHnoMUl6iB90u737jkZETekmQNVvrUvDxG26vqNsdgSRhV4K/93ZR/DWUhFZtTTsxHPUrfynejgKKvUB@lists.infradead.org
X-Gm-Message-State: AOJu0YysPv1V4YGPJtF2lqYpblWJIFjmF7TDV4sfavHWX+1I0y4wdp9s
	J5+JVwmDXxljjiwk9I4SQRN5HHvjez6qCmsO57SibJrAJbOLTtW+98FY/ULzQtBQ3EhAvpnWMZ7
	l2EzyovXd7ODNZF4rB3NKPIRh86mrp6w=
X-Gm-Gg: ATEYQzzWaPjjxDvrcMVIDAbA/lKIPllfEfNtCB9GsHq+vneDJ3FAfl3bRn9RHICNQhg
	2i4YSUsH8Zutc6kkumS6zJEJZzQrK7BKQY76C7hrmY47jbnb2ZhDrIvn/TsX5sQVd9fbvJV3IOy
	tqbZk3hJ0huak2n/D1xOvxb844KCeEDwMPPhrvk3nPvZ+1AM/BW7QzK7Akmxo7kOc2+/75Gh6nm
	03sQr936s+qxhhuhHkFqt5cBQT0qDU8fNXwgDEGZt4FQhEGr0xmv7Ak5zMw0jxY4po3LfltczWF
	FcB/cA==
X-Received: by 2002:a05:622a:34b:b0:4ed:65d9:162a with SMTP id
 d75a77b69052e-508f491cfe5mr61359861cf.34.1772870578464; Sat, 07 Mar 2026
 00:02:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com> <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
In-Reply-To: <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 7 Mar 2026 16:02:47 +0800
X-Gm-Features: AaiRm51Igc6ecK3xB2tUcUl4HRL0_fGlACMYx6lVkSr1t0qRUoao4ymxCbT83sk
Message-ID: <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_000300_268031_FCB5D27C 
X-CRM114-Status: GOOD (  30.99  )
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

On Sat, Mar 7, 2026 at 10:22=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 3/7/26 5:07 AM, Barry Song wrote:
> > On Mon, Feb 9, 2026 at 10:07=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >>
> >> Currently, folio_referenced_one() always checks the young flag for eac=
h PTE
> >> sequentially, which is inefficient for large folios. This inefficiency=
 is
> >> especially noticeable when reclaiming clean file-backed large folios, =
where
> >> folio_referenced() is observed as a significant performance hotspot.
> >>
> >> Moreover, on Arm64 architecture, which supports contiguous PTEs, there=
 is already
> >> an optimization to clear the young flags for PTEs within a contiguous =
range.
> >> However, this is not sufficient. We can extend this to perform batched=
 operations
> >> for the entire large folio (which might exceed the contiguous range: C=
ONT_PTE_SIZE).
> >>
> >> Introduce a new API: clear_flush_young_ptes() to facilitate batched ch=
ecking
> >> of the young flags and flushing TLB entries, thereby improving perform=
ance
> >> during large folio reclamation. And it will be overridden by the archi=
tecture
> >> that implements a more efficient batch operation in the following patc=
hes.
> >>
> >> While we are at it, rename ptep_clear_flush_young_notify() to
> >> clear_flush_young_ptes_notify() to indicate that this is a batch opera=
tion.
> >>
> >> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> >> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >
> > LGTM,
> >
> > Reviewed-by: Barry Song <baohua@kernel.org>
>
> Thanks.
>
> >> ---
> >>   include/linux/mmu_notifier.h |  9 +++++----
> >>   include/linux/pgtable.h      | 35 ++++++++++++++++++++++++++++++++++=
+
> >>   mm/rmap.c                    | 28 +++++++++++++++++++++++++---
> >>   3 files changed, 65 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier=
.h
> >> index d1094c2d5fb6..07a2bbaf86e9 100644
> >> --- a/include/linux/mmu_notifier.h
> >> +++ b/include/linux/mmu_notifier.h
> >> @@ -515,16 +515,17 @@ static inline void mmu_notifier_range_init_owner=
(
> >>          range->owner =3D owner;
> >>   }
> >>
> >> -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)      =
          \
> >> +#define clear_flush_young_ptes_notify(__vma, __address, __ptep, __nr)=
  \
> >>   ({                                                                  =
   \
> >>          int __young;                                                 =
   \
> >>          struct vm_area_struct *___vma =3D __vma;                     =
     \
> >>          unsigned long ___address =3D __address;                      =
     \
> >> -       __young =3D ptep_clear_flush_young(___vma, ___address, __ptep)=
;   \
> >> +       unsigned int ___nr =3D __nr;                                  =
    \
> >> +       __young =3D clear_flush_young_ptes(___vma, ___address, __ptep,=
 ___nr);    \
> >>          __young |=3D mmu_notifier_clear_flush_young(___vma->vm_mm,   =
     \
> >>                                                    ___address,        =
   \
> >>                                                    ___address +       =
   \
> >> -                                                       PAGE_SIZE);   =
  \
> >> +                                                 ___nr * PAGE_SIZE); =
  \
> >>          __young;                                                     =
   \
> >>   })
> >>
> >> @@ -650,7 +651,7 @@ static inline void mmu_notifier_subscriptions_dest=
roy(struct mm_struct *mm)
> >>
> >>   #define mmu_notifier_range_update_to_read_only(r) false
> >>
> >> -#define ptep_clear_flush_young_notify ptep_clear_flush_young
> >> +#define clear_flush_young_ptes_notify clear_flush_young_ptes
> >>   #define pmdp_clear_flush_young_notify pmdp_clear_flush_young
> >>   #define ptep_clear_young_notify ptep_test_and_clear_young
> >>   #define pmdp_clear_young_notify pmdp_test_and_clear_young
> >> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >> index 21b67d937555..a50df42a893f 100644
> >> --- a/include/linux/pgtable.h
> >> +++ b/include/linux/pgtable.h
> >> @@ -1068,6 +1068,41 @@ static inline void wrprotect_ptes(struct mm_str=
uct *mm, unsigned long addr,
> >>   }
> >>   #endif
> >>
> >> +#ifndef clear_flush_young_ptes
> >> +/**
> >> + * clear_flush_young_ptes - Mark PTEs that map consecutive pages of t=
he same
> >> + *                         folio as old and flush the TLB.
> >> + * @vma: The virtual memory area the pages are mapped into.
> >> + * @addr: Address the first page is mapped at.
> >> + * @ptep: Page table pointer for the first entry.
> >> + * @nr: Number of entries to clear access bit.
> >> + *
> >> + * May be overridden by the architecture; otherwise, implemented as a=
 simple
> >> + * loop over ptep_clear_flush_young().
> >> + *
> >> + * Note that PTE bits in the PTE range besides the PFN can differ. Fo=
r example,
> >> + * some PTEs might be write-protected.
> >> + *
> >> + * Context: The caller holds the page table lock.  The PTEs map conse=
cutive
> >> + * pages that belong to the same folio.  The PTEs are all in the same=
 PMD.
> >> + */
> >> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
> >> +               unsigned long addr, pte_t *ptep, unsigned int nr)
> >> +{
> >> +       int young =3D 0;
> >> +
> >> +       for (;;) {
> >> +               young |=3D ptep_clear_flush_young(vma, addr, ptep);
> >> +               if (--nr =3D=3D 0)
> >> +                       break;
> >> +               ptep++;
> >> +               addr +=3D PAGE_SIZE;
> >> +       }
> >> +
> >> +       return young;
> >> +}
> >> +#endif
> >
> > We might have an opportunity to batch the TLB synchronization,
> > using flush_tlb_range() instead of calling flush_tlb_page()
> > one by one. Not sure the benefit would be significant though,
> > especially if only one entry among nr has the young bit set.
>
> Yes. In addition, this will involve many architectures=E2=80=99 implement=
ations
> and their differing TLB flush mechanisms, so it=E2=80=99s difficult to ma=
ke a
> reasonable per-architecture measurement. If any architecture has a more
> efficient flush method, I=E2=80=99d prefer to implement an architecture=
=E2=80=91specific
> clear_flush_young_ptes().

Right! Since TLBI is usually quite expensive, I wonder if a generic
implementation for architectures lacking clear_flush_young_ptes()
might benefit from something like the below (just a very rough idea):

int clear_flush_young_ptes(struct vm_area_struct *vma,
                unsigned long addr, pte_t *ptep, unsigned int nr)
{
        unsigned long curr_addr =3D addr;
        int young =3D 0;

        while (nr--) {
                young |=3D ptep_test_and_clear_young(vma, curr_addr, ptep);
                ptep++;
                curr_addr +=3D PAGE_SIZE;
        }

        if (young)
                flush_tlb_range(vma, addr, curr_addr);
        return young;
}

Thanks
Barry

