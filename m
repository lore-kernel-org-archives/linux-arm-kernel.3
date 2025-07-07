Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47D2C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOso/rpbJ/NgC8eSTkPXsXfGalwkSd1v9wHI3jcpdtU=; b=b2uNHTZr8Df1LUd5ohn9GR15Ii
	Ehq3PDuSfcGSQi1t58yz7HWb3hLnbFH3r9XoUNjW1uTdW0YgaiqOl/1KBCjN45Fm/+8o3I7hXj0rp
	qUy8TpK/OjZKOUBjOjqhN+aR1lJoGg/T6lF8V3ICq6otFdquXp6wPnayQ0fdJOMdgBDlO6j0hGN6a
	DPX/uCljgvxNfuqYfZQMXydof14mX4+oEDi8vFXSO7bWACEv0VeA7HYEbBxIL1Cdz9UO+GFp4PDnX
	fBhsnCJJHQ3ni8dURoyFaGm9C8ZXxFV1PcR9UKmKNQxRwLZJpwFd/Jhg2RjSZhwbrkBr7LST441uq
	i1e8q9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYo8T-00000002veU-1LY7;
	Mon, 07 Jul 2025 15:52:05 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnxv-00000002tpq-2d2S;
	Mon, 07 Jul 2025 15:41:12 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-87ed676e631so2403271241.3;
        Mon, 07 Jul 2025 08:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751902869; x=1752507669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOso/rpbJ/NgC8eSTkPXsXfGalwkSd1v9wHI3jcpdtU=;
        b=Jgm4Nqj6/WgGo0B4O234Sks2btE697LfmE0xSP8zaXWM5BsZRwRfwkRYxSVZeamYtb
         u0SJH7bLXJ5p15kwTqHeLQw9dldiIXvzRyLDy8nSyZcaPJ/0vj6mMuPwDwyxMtSIdoDT
         CSV847qO4m9cwZl4dRxHMAGmYuJgu7Gvj/EfXqBRfw0M8K4IIOzj6m+KhQqE72zgQbzE
         09mPomNyKg/d3Wb7S9iRujFbrrYST1RHaEVKWzW+MwqtlzUqsKoyNfljVM6++c9pko1c
         B7rY3GJnJtNjQsslJOD7QIhOSVFZAqIvAQqpJDlclodKPmsiVChG2EsE0vex2Edg8Zlm
         oihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902869; x=1752507669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOso/rpbJ/NgC8eSTkPXsXfGalwkSd1v9wHI3jcpdtU=;
        b=iwBfhBKMBjCTrzLa5h+0Ui/fXLnUhxIyyFQpgAf7OFMvpza20OrQ6ThVNgnjmDYvk5
         XUyBuPbswiM19mcpE4JArmr0dSOPada4svhX8zi3lePlZxLmD+TnXBGR5/LZ3gTR7P/w
         hgtUoGbkgJK+ipeJOdLGbQxk8+JirH55bXA0BMUmHzf9WXGOrc+gJO6Rg2n5AA2MjuSq
         uxMpZtSJ8CRpQVFPrVlEZk7caOBlduTJ4T8Bx8vMaJJPiBguV2MuRhmJ8BAboiSjj4fb
         FvDZRkrfZxa8B/9PPSNhrEXAb00mxngAvWhLNvfmkfb8pJyIJqqeD1LC5PaknpbTeTqv
         +Geg==
X-Forwarded-Encrypted: i=1; AJvYcCUZb4h7IvyLwmO64FhqnqKNnCA4s+WKgLD0cTXS3ogX9WhdlFE0KQxyKYuhX/zGLZM1rU152eBuo3HuPz0=@lists.infradead.org, AJvYcCWkjYCanCTsuOMxG4E2P/VwQUKpX5pLKMOOtrEXdv3j0+zJUWFPDecsQZ3o4u3MHoQysJH+RukPBCVM3NPRuTi8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2igQs41bBYj3nxIBjAsVFX0F3KM0zESL/i2n4ZGDaZPI3sU9x
	yB0OJybc2YQitlx9roN2FoeXjsMujzb2l9Zfgyv0h/ZVDRvrNMungMDeY6oZcvCesI58WuF2YZJ
	tyrLxmWArKCFn/vbHOWot06HbvV88zpM=
X-Gm-Gg: ASbGncvL1z6v1M/tizBvV/J4qAl3KZyb8WOIOCVV2iZnwD9S7J+UQVmhA22vooqB/32
	5jFqMguAh5kx9hOqyDNYHxgZNl6gOIsylX1N0k2RkUSRecTWo8O1/Fy8TdnwFvGKMzowq1I/G5z
	KCPY2eW3pYlVzhzTD7Danm6bPWlEnOLRiO2P5Vkg7l7K0A
X-Google-Smtp-Source: AGHT+IGSN1O8lQpDTPtqxgti1UrH4RQigSLZXKTO63RCc9Ii3DWxoJb0zhIToaSJqmxiqFJzc6TxB9dgjkrGQ0NAAJA=
X-Received: by 2002:a05:6102:5813:b0:4e7:dbd2:4605 with SMTP id
 ada2fe7eead31-4f305bbfb6bmr5513792137.24.1751902868878; Mon, 07 Jul 2025
 08:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250701143100.6970-1-lance.yang@linux.dev> <aGtdwn0bLlO2FzZ6@harry>
In-Reply-To: <aGtdwn0bLlO2FzZ6@harry>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 7 Jul 2025 23:40:55 +0800
X-Gm-Features: Ac12FXzNubUaYli6QAPDLGtouYMN2VMWCTFnQ5iaenP8VAQuo6CN289JAgNG3X4
Message-ID: <CAGsJ_4yk5FPfieyRyzLwrgHu2CYADOtZRZKa0ORo=y4nYd-KrQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, david@redhat.com, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, 
	riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	mingzhe.yang@ly.com, stable@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_084111_667381_64E8AFEB 
X-CRM114-Status: GOOD (  28.17  )
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

On Mon, Jul 7, 2025 at 1:40=E2=80=AFPM Harry Yoo <harry.yoo@oracle.com> wro=
te:
>
> On Tue, Jul 01, 2025 at 10:31:00PM +0800, Lance Yang wrote:
> > From: Lance Yang <lance.yang@linux.dev>
> >
> > As pointed out by David[1], the batched unmap logic in try_to_unmap_one=
()
> > may read past the end of a PTE table when a large folio's PTE mappings
> > are not fully contained within a single page table.
> >
> > While this scenario might be rare, an issue triggerable from userspace =
must
> > be fixed regardless of its likelihood. This patch fixes the out-of-boun=
ds
> > access by refactoring the logic into a new helper, folio_unmap_pte_batc=
h().
> >
> > The new helper correctly calculates the safe batch size by capping the =
scan
> > at both the VMA and PMD boundaries. To simplify the code, it also suppo=
rts
> > partial batching (i.e., any number of pages from 1 up to the calculated
> > safe maximum), as there is no strong reason to special-case for fully
> > mapped folios.
> >
> > [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fc=
be@redhat.com
> >
> > Cc: <stable@vger.kernel.org>
> > Reported-by: David Hildenbrand <david@redhat.com>
> > Closes: https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c8=
57fcbe@redhat.com
> > Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large foli=
os during reclamation")
> > Suggested-by: Barry Song <baohua@kernel.org>
> > Acked-by: Barry Song <baohua@kernel.org>
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > ---
>
> LGTM,
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
>
> With a minor comment below.
>
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index fb63d9256f09..1320b88fab74 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -2206,13 +2213,16 @@ static bool try_to_unmap_one(struct folio *foli=
o, struct vm_area_struct *vma,
> >                       hugetlb_remove_rmap(folio);
> >               } else {
> >                       folio_remove_rmap_ptes(folio, subpage, nr_pages, =
vma);
> > -                     folio_ref_sub(folio, nr_pages - 1);
> >               }
> >               if (vma->vm_flags & VM_LOCKED)
> >                       mlock_drain_local();
> > -             folio_put(folio);
> > -             /* We have already batched the entire folio */
> > -             if (nr_pages > 1)
> > +             folio_put_refs(folio, nr_pages);
> > +
> > +             /*
> > +              * If we are sure that we batched the entire folio and cl=
eared
> > +              * all PTEs, we can just optimize and stop right here.
> > +              */
> > +             if (nr_pages =3D=3D folio_nr_pages(folio))
> >                       goto walk_done;
>
> Just a minor comment.
>
> We should probably teachhttps://lore.kernel.org/linux-mm/5db6fb4c-079d-42=
37-80b3-637565457f39@redhat.com/() to skip nr_pages pages,
> or just rely on next_pte: do { ... } while (pte_none(ptep_get(pvmw->pte))=
)
> loop in page_vma_mapped_walk() to skip those ptes?
>
> Taking different paths depending on (nr_pages =3D=3D folio_nr_pages(folio=
))
> doesn't seem sensible.

Hi Harry,

I believe we've already had this discussion here:
https://lore.kernel.org/linux-mm/5db6fb4c-079d-4237-80b3-637565457f39@redha=
t.com/

My main point is that nr_pages =3D folio_nr_pages(folio) is the
typical/common case.
Also, modifying page_vma_mapped_walk() feels like a layering violation.

>
> >               continue;
>
> --
> Cheers,
> Harry / Hyeonggon

Thanks
Barry

