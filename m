Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77664C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=; b=l/QZ5aD/3HqKbDag1cBPSo5z4l
	II9FiWvG1yJDNU57JAIvRn0h+G39NLpS2yeKvl9JmUK5WOIE1hiBi/LeIxeKxSfVG8GM/ZLYBhMj+
	xlbObkbynMb/OJTm/rl0ZPAc4fcw+1K9+tI6LFX7jeVSEhwW4QtOXoSXzQJ9svjMqSca8Hkh+kyjj
	jg3CXjn70SzuVh6YNziK32KlvTdMDSKfaqvsEgHXPYTnJuRqOPKTOWEvPS8Jguv4hO7WeMVP029L+
	tKFd50VGop5l0GOAoobmjmok8uoJogzQ2WiWHXUmRR5ZhHjXodQ7MJIax1iHzyWV0C+6yeTRXDg6e
	1/hDGRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPdO-00000008h3E-21ag;
	Wed, 25 Jun 2025 12:53:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNXB-00000008L20-1S98;
	Wed, 25 Jun 2025 10:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=; b=Y7HbrUHQ/w3i5GNtNNSgLAvog4
	3Nn7K2ttBOJAWkjCn0uZGNcwurmG2ehSGM6MVI83dcK6a9XYUKIRWLviR3eSeWMPRgY6Riieo1C9u
	1FnPrHwXjGxG1iG1jKimR+uIv07FBa39X+9dbxgxN2zGSA8vHbgHTXxNKjQ9OpA6BB1U/5Oq+dnqT
	ASTW76AR+90LkV+HI4dDNG3orWFbxBDqittzYj923lDYutoBxnR34asXz+iO3A4wCYlV+di03lg+h
	4OO3GZNw05GxzTYoZze0foVzFSyitgh46ihvK4yj84rZ0uz4+yDUJen7SDFmBXTfWp3leU4KHK7hG
	XH92J97A==;
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNX7-00000005n6Y-1VJ7;
	Wed, 25 Jun 2025 10:39:16 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-4e9a7b4a412so5172240137.0;
        Wed, 25 Jun 2025 03:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750847950; x=1751452750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=;
        b=VEK8yReSzRfjclJ+CmltpwdfN014pVBEmWYgYJ8pCL/Wuz3VrrDVIoDeAm6YSf6yAb
         nbA/1fZhxUs86DXX4XqZigZ76EeP2GCa2Jk0+yMLwvVVdoF6YsQWE4Cx8c1mYeNH1P1e
         ucC/SHSw+Cb57qVGyLeYtZO+zkHnZ7GnJHkF5p4DTvJ6fKD0s6ojwD9cZis7TwD8E4Nr
         nTHAxF6EoVei+fXLrIf9Ll8QClokj/zyquerhd4pmqkAT40i1PRwCqNgz9tsuk3ZGjNL
         IYWnvgZa35fCc6HKuOuZSKNivK1TXpRGQIdf7zwG9y120qgACH5RkXxelKpT4dEyjt7w
         c/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847950; x=1751452750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=;
        b=ocVeqmWVG68NkPqpMVAve89OR9K5MtXW+XE6ARHnnuZegUbHvkm/StOXxbgMDO+dJb
         Ar1OgC8NSWS8Y32S7ZXnPUj0rvlJu3/Nz1BIsrD0Jw3IodmR6JLyvOVFUJjlwiZ7LgsT
         r8LcckFGkJBmxDpW3i/3vYT+UvD+Rmt+FUOTbJ0zCQKeGk8iko5HcbXa2rTFtuHA8dI9
         gWE8X6Hw/vBPqBnezasWQqpC81vutnMTE1Qpdx5hRkKQizyQMJSDJ7ZG3RjMvWN5Obxd
         x02fbw1xL90VsWP6PTZJJ0yeEWeNKMwSgeIgbTV6OQlqwFgw5ZzZlHhkq7/zKN3rmAxU
         LhFg==
X-Forwarded-Encrypted: i=1; AJvYcCVjDABgm4zjKjEU7/BZhQcCAR37THNqK7shfHUH8MbafH8cnXrAJ0FYuTehE4BfMFzbBhaKiDHaNUvfmx8=@lists.infradead.org, AJvYcCXkFJobEiA7+IJvBNvzXQ489HIPrdhoZ4nAuc3feL9l1xDPKjF3be/OwX2SaWvB04SKeFuY/+1nKtWIiKphSzI9@lists.infradead.org
X-Gm-Message-State: AOJu0YzuP2Eo546f/i0nqbGy5891IPSbf3AkZc7EmPhDGySui4I4mM1y
	DjZvs24YB7mTZxmF1tztGZoVjHL8UYENpNw0WK7AjqfvsBSw5nvSwpEpVubHVTPkpNmhvveu20e
	HWOtbQ2NbJ/BH1VHpIC3l9hwqb9UHJI4=
X-Gm-Gg: ASbGncugI3QwxSiqEAOoKZXdYnC+EVj9PSa3HGBHu4MVn9K6uzoVkuKEXDvKUH8xPA6
	7w70KClMGqR46Gj8C9+EqP/PHPaDjxXLGf6UARDphQgQGZloL2qEwjDT8U9lEdoXzl4CrYi5Weq
	9ZECH+nuJH9bmcsT3PqGhqMyHnj7GxexC/kQ6e9JjvDxT5kGKENpbAOQ==
X-Google-Smtp-Source: AGHT+IG24obpqrnDUZOrsCnGBhTMkO5P7QnbH3Bpi0PqgrwKSJcAQukZsZf78Wd+0Bu3XZMIHzdxuYrYGefspIVUODE=
X-Received: by 2002:a05:6102:5107:b0:4e6:df73:f147 with SMTP id
 ada2fe7eead31-4ecc6a7a5e2mr1211118137.11.1750847949712; Wed, 25 Jun 2025
 03:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
In-Reply-To: <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 22:38:57 +1200
X-Gm-Features: Ac12FXxBwpebbLn5QzN4mzU9-3AOYto8c1Frvun91yLq31aKsLs2IVptkEujUM4
Message-ID: <CAGsJ_4wyByWJqzsDGhx=4=Xs+3uUZt6PZdyVoUCUMAo350cm-g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113913_445386_EC1B1F65 
X-CRM114-Status: GOOD (  24.39  )
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

> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index fb63d9256f09..241d55a92a47 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *folio,=
 struct page *page,
> >
> >   /* We support batch unmapping of PTEs for lazyfree large folios */
> >   static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> > -                     struct folio *folio, pte_t *ptep)
> > +                                           struct folio *folio, pte_t =
*ptep,
> > +                                           struct vm_area_struct *vma)
> >   {
> >       const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRT=
Y;
> > +     unsigned long next_pmd, vma_end, end_addr;
> >       int max_nr =3D folio_nr_pages(folio);
> >       pte_t pte =3D ptep_get(ptep);
> >
> > +     /*
> > +      * Limit the batch scan within a single VMA and within a single
> > +      * page table.
> > +      */
> > +     vma_end =3D vma->vm_end;
> > +     next_pmd =3D ALIGN(addr + 1, PMD_SIZE);
> > +     end_addr =3D addr + (unsigned long)max_nr * PAGE_SIZE;
> > +
> > +     if (end_addr > min(next_pmd, vma_end))
> > +             return false;
>
> May I suggest that we clean all that up as we fix it?
>
> Maybe something like this:
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3b74bb19c11dd..11fbddc6ad8d6 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,38 @@ void folio_remove_rmap_pud(struct folio *folio, s=
truct page *page,
>   #endif
>   }
>
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -                       struct folio *folio, pte_t *ptep)
> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
> +               pte_t pte)
>   {
>          const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIR=
TY;
> -       int max_nr =3D folio_nr_pages(folio);
> -       pte_t pte =3D ptep_get(ptep);
> +       struct vm_area_struct *vma =3D pvmw->vma;
> +       unsigned long end_addr, addr =3D pvmw->address;
> +       unsigned int max_nr;
> +
> +       if (flags & TTU_HWPOISON)
> +               return 1;
> +       if (!folio_test_large(folio))
> +               return 1;
> +
> +       /* We may only batch within a single VMA and a single page table.=
 */
> +       end_addr =3D min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma-=
>vm_end);

Is this pmd_addr_end()?

> +       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
>
> +       /* We only support lazyfree batching for now ... */
>          if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> -               return false;
> +               return 1;
>          if (pte_unused(pte))
> -               return false;
> -       if (pte_pfn(pte) !=3D folio_pfn(folio))
> -               return false;
> +               return 1;
> +       /* ... where we must be able to batch the whole folio. */
> +       if (pte_pfn(pte) !=3D folio_pfn(folio) || max_nr !=3D folio_nr_pa=
ges(folio))
> +               return 1;
> +       max_nr =3D folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, f=
pb_flags,
> +                                NULL, NULL, NULL);
>
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags,=
 NULL,
> -                              NULL, NULL) =3D=3D max_nr;
> +       if (max_nr !=3D folio_nr_pages(folio))
> +               return 1;
> +       return max_nr;
>   }
>
>   /*
> @@ -2024,9 +2039,7 @@ static bool try_to_unmap_one(struct folio *folio, s=
truct vm_area_struct *vma,
>                          if (pte_dirty(pteval))
>                                  folio_mark_dirty(folio);
>                  } else if (likely(pte_present(pteval))) {
> -                       if (folio_test_large(folio) && !(flags & TTU_HWPO=
ISON) &&
> -                           can_batch_unmap_folio_ptes(address, folio, pv=
mw.pte))
> -                               nr_pages =3D folio_nr_pages(folio);
> +                       nr_pages =3D folio_unmap_pte_batch(folio, &pvmw, =
flags, pteval);
>                          end_addr =3D address + nr_pages * PAGE_SIZE;
>                          flush_cache_range(vma, address, end_addr);
>
>
> Note that I don't quite understand why we have to batch the whole thing o=
r fallback to
> individual pages. Why can't we perform other batches that span only some =
PTEs? What's special
> about 1 PTE vs. 2 PTEs vs. all PTEs?
>
>
> Can someone enlighten me why that is required?

It's probably not a strict requirement =E2=80=94 I thought cases where the
count is greater than 1 but less than nr_pages might not provide much
practical benefit, except perhaps in very rare edge cases, since
madv_free() already calls split_folio().

if (folio_test_large(folio)) {
                        bool any_young, any_dirty;
                        nr =3D madvise_folio_pte_batch(addr, end, folio, pt=
e,
                                                     ptent,
&any_young, &any_dirty);


                        if (nr < folio_nr_pages(folio)) {
                                ...
                                err =3D split_folio(folio);
                                ...
                       }
}

Another reason is that when we extend this to non-lazyfree anonymous
folios [1], things get complicated: checking anon_exclusive and updating
folio_try_share_anon_rmap_pte with the number of PTEs becomes tricky if
a folio is partially exclusive and partially shared.

[1] https://lore.kernel.org/linux-mm/20250513084620.58231-1-21cnbao@gmail.c=
om/

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry

