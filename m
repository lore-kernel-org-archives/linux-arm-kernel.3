Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D943C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ik/O3lKW8D4PX3b9RKMi5Pl8dRCbo+JtmwcqMh8DqL4=; b=oARKplntQyUfZT9KbgIY8q36o2
	J5CfPEH/6tM541F+xlCj7531cIi5ukyGowEEe9uhM/8RJ+23YAC8fWYPm7y/AeghGenOGKpw8qvzj
	oK1PJekICYtQOGxNtqqkx1y2GTXjYq0c8yzuZP5Td24qtgtyApIdwTMUDFMPyRN73/ihH1Scno+Ao
	o9Xg8B0eFTLttFEvdPMtOMGoBYrsO606XlHl3i8mUxRGImEVg1sjGmRqgVE55+wUaBiki/j8YheVN
	b889RKR3hOVhJFYjTQY7l22Byua15WOPOnfFHTQI8wiUBQa1F+w9pRUf4v0ZtdfZkpUX9Fq/lHukW
	DHCkAeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNu7-00000008PHO-2sJL;
	Wed, 25 Jun 2025 11:02:59 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMaR-000000089YO-1GC8;
	Wed, 25 Jun 2025 09:38:36 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-531a1d5519aso2000580e0c.3;
        Wed, 25 Jun 2025 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750844313; x=1751449113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ik/O3lKW8D4PX3b9RKMi5Pl8dRCbo+JtmwcqMh8DqL4=;
        b=MMX98M6KrLDYxVOm/3wJw5p0TdecayDsSi9b6ta9q1xH0wW+YwRth1hOgcdYVNDcUS
         /cal/+WWrHcUguP402cHxJxRspO1wXWAsomnF5rYuL1s9ddshx2dIJrvKpscqk14/sjV
         ftH/e7MpHiCPcYfXUUuHZGVCKL4dIT4ihZealBZowq8ayvMF2nGs4N9YFB/t0N+Irp2b
         uviKPuqoK6ygTqJ9IvG+h2dmIOLkT3FD7tqT7c2qAL3NbJ+LmBxp9uOjEoQMY2ozSszj
         v5nznMplERzYnP/h/sX+R1EkU2AQsGTlk3BdWMMlsiXqv4/MyxTOSPCL5ztwLlRyma11
         v3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750844313; x=1751449113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ik/O3lKW8D4PX3b9RKMi5Pl8dRCbo+JtmwcqMh8DqL4=;
        b=GGTz2IbHTZapmnTJnijbHdIGtzHQq9b/jziEFQDCczCaQLY2MWLCSGZJWlpmG2cvUI
         h3qvRZSHff+1fx/Eoy2LkxEubXC67icB77xvStxkIQUdsaoEkQxAKafd1ZWNYlqF1hX9
         1MME8amYzcLijWlmqgyA8Rru4aZswEIGKXG+xdG8N6VHRaSrVTDiA2HAoFGBFJGV+QW2
         NgF38tCeqF4ri7mz8CJJELSI3FlVbnjNNRMYKnokFuLcmibEDQFvuUf6Sgguxd2h/xLE
         ktyFDoQoA3HuUyeUeV7ZQ2Hmg05p6aRCJfYH0MvHU5fVa38gdZDH3l+54nd7eGrwGLe0
         JSUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUofGWUICViCTzNA6GEm+c2+vG1mlojz1EV+65VA+CHdk6LR4gShTeIhpQTPTA4crsU1XiUevPUD6rDEb0=@lists.infradead.org, AJvYcCWAoUlZtvr+DSm7/CY/fAO0267aWkYat+Ahe1ZsMmNdPj+VNQ/+DoJ/pPTo23+pnBuAn5o+ultUN5ybl/3GRqVv@lists.infradead.org
X-Gm-Message-State: AOJu0YzrM56BAfZyW4QimlU/oqvYxVtrU+niE+SLSjtFFQkdZ8Ac7Q6+
	37cF+c4dYxxegwwQt6gNln7I8+yXW1uSCCZ0zq56Mu2ZJ2EIYQuFenRphUK9GGIdzTg1gLFo3/v
	64knnat5E3t0pYG98SVJXVQbScw64hmM=
X-Gm-Gg: ASbGncuB3IVXyxHXQTG28ZGt08Xe2TiNu2x1JxGVXUEPuvTTq/qLtaOvMSFjiGxtD2S
	O3iH5DhUmF3dxCEZzygDnnnSPYNyiCszYDwrt/M74gz2jHqC/+kRPubEiTb7SfstL25/R+pO/I1
	pmYeyVeY7UT3rwNBefSnAaVxN2EdUPs9ax4ASdB5eRHS0=
X-Google-Smtp-Source: AGHT+IHFsEjf8mVqrGJlOglZXBqK+LXUAHLKDnHRegX9xwHltPGn1BuflQtnpCujXSYlVduWzyct2ogezPY53n9zi2Q=
X-Received: by 2002:a05:6122:2516:b0:530:81ac:51be with SMTP id
 71dfb90a1353d-532ef6cc1e4mr985532e0c.8.1750844313457; Wed, 25 Jun 2025
 02:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com> <20250624162503.78957-1-ioworker0@gmail.com>
In-Reply-To: <20250624162503.78957-1-ioworker0@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 21:38:21 +1200
X-Gm-Features: Ac12FXwzgBA5qA6Bu1rSIUYx-JEmY2u59OAGcqCQlCXMv4jDK2aouZ9-YNF9zfQ
Message-ID: <CAGsJ_4x+YaF3bVjMuNv2iJtdoD2-GgGsbJA__cpxb7U5YtK9ig@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <ioworker0@gmail.com>
Cc: david@redhat.com, akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_023835_360789_885B60E8 
X-CRM114-Status: GOOD (  33.93  )
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

On Wed, Jun 25, 2025 at 4:27=E2=80=AFAM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> On 2025/6/24 23:34, David Hildenbrand wrote:
> > On 24.06.25 17:26, Lance Yang wrote:
> >> On 2025/6/24 20:55, David Hildenbrand wrote:
> >>> On 14.02.25 10:30, Barry Song wrote:
> >>>> From: Barry Song <v-songbaohua@oppo.com>
> >> [...]
> >>>> diff --git a/mm/rmap.c b/mm/rmap.c
> >>>> index 89e51a7a9509..8786704bd466 100644
> >>>> --- a/mm/rmap.c
> >>>> +++ b/mm/rmap.c
> >>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *foli=
o,
> >>>> struct page *page,
> >>>>    #endif
> >>>>    }
> >>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
> >>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> >>>> +            struct folio *folio, pte_t *ptep)
> >>>> +{
> >>>> +    const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DI=
RTY;
> >>>> +    int max_nr =3D folio_nr_pages(folio);
> >>>
> >>> Let's assume we have the first page of a folio mapped at the last pag=
e
> >>> table entry in our page table.
> >>
> >> Good point. I'm curious if it is something we've seen in practice ;)
> >
> > I challenge you to write a reproducer :P I assume it might be doable
> > through simple mremap().
> >
> >>
> >>>
> >>> What prevents folio_pte_batch() from reading outside the page table?
> >>
> >> Assuming such a scenario is possible, to prevent any chance of an
> >> out-of-bounds read, how about this change:
> >>
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index fb63d9256f09..9aeae811a38b 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -1852,6 +1852,25 @@ static inline bool
> >> can_batch_unmap_folio_ptes(unsigned long addr,
> >>       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIR=
TY;
> >>       int max_nr =3D folio_nr_pages(folio);
> >>       pte_t pte =3D ptep_get(ptep);
> >> +    unsigned long end_addr;
> >> +
> >> +    /*
> >> +     * To batch unmap, the entire folio's PTEs must be contiguous
> >> +     * and mapped within the same PTE page table, which corresponds t=
o
> >> +     * a single PMD entry. Before calling folio_pte_batch(), which do=
es
> >> +     * not perform boundary checks itself, we must verify that the
> >> +     * address range covered by the folio does not cross a PMD bounda=
ry.
> >> +     */
> >> +    end_addr =3D addr + (max_nr * PAGE_SIZE) - 1;
> >> +
> >> +    /*
> >> +     * A fast way to check for a PMD boundary cross is to align both
> >> +     * the start and end addresses to the PMD boundary and see if the=
y
> >> +     * are different. If they are, the range spans across at least tw=
o
> >> +     * different PMD-managed regions.
> >> +     */
> >> +    if ((addr & PMD_MASK) !=3D (end_addr & PMD_MASK))
> >> +        return false;
> >
> > You should not be messing with max_nr =3D folio_nr_pages(folio) here at
> > all. folio_pte_batch() takes care of that.
> >
> > Also, way too many comments ;)
> >
> > You may only batch within a single VMA and within a single page table.
> >
> > So simply align the addr up to the next PMD, and make sure it does not
> > exceed the vma end.
> >
> > ALIGN and friends can help avoiding excessive comments.
>
> Thanks! How about this updated version based on your suggestion:
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..241d55a92a47 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *folio, s=
truct page *page,
>
>  /* We support batch unmapping of PTEs for lazyfree large folios */
>  static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -                       struct folio *folio, pte_t *ptep)
> +                                             struct folio *folio, pte_t =
*ptep,
> +                                             struct vm_area_struct *vma)
>  {
>         const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
> +       unsigned long next_pmd, vma_end, end_addr;
>         int max_nr =3D folio_nr_pages(folio);
>         pte_t pte =3D ptep_get(ptep);
>
> +       /*
> +        * Limit the batch scan within a single VMA and within a single
> +        * page table.
> +        */
> +       vma_end =3D vma->vm_end;
> +       next_pmd =3D ALIGN(addr + 1, PMD_SIZE);
> +       end_addr =3D addr + (unsigned long)max_nr * PAGE_SIZE;
> +
> +       if (end_addr > min(next_pmd, vma_end))
> +               return false;
> +

I had a similar check in do_swap_page() for both forward and backward
out-of-bounds page tables, but I forgot to add it for this unmap path.

this is do_swap_page():

        if (folio_test_large(folio) && folio_test_swapcache(folio)) {
                int nr =3D folio_nr_pages(folio);
                unsigned long idx =3D folio_page_idx(folio, page);
                unsigned long folio_start =3D address - idx * PAGE_SIZE;
                unsigned long folio_end =3D folio_start + nr * PAGE_SIZE;

                pte_t *folio_ptep;
                pte_t folio_pte;

                if (unlikely(folio_start < max(address & PMD_MASK,
vma->vm_start)))
                        goto check_folio;
                if (unlikely(folio_end > pmd_addr_end(address, vma->vm_end)=
))
                        goto check_folio;
       }

So maybe something like folio_end > pmd_addr_end(address, vma->vm_end)?

Thanks
Barry

