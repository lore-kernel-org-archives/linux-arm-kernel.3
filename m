Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A401FCEFD11
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3zjahn8T3WCja+qS1GjQYcEO/PlU6X91htTMP5EirE=; b=vIDdYN5Q5enXtgBoVgMKdcvhwv
	ntEERusByk7ekUzIY3UqGfwmB5WApGZqrVw0Gdn4dhn27rtpbjvllz4D0uJRskpHExCatvq6yMcFr
	F9AwkDG/A4Twl7ZhOL8A+k0zb6FHjAb2vzuvlv4/l0HqnlfJvOP+sTVVX/BHjTKwwVJoTjgTLf3k1
	qQf38dW9KcRiPPt3p0lv4wEfOTs1DoWtlUY5zozZh/Q/KiY8zdHSnurp03N9nARt27eysv97E3KLm
	jQJGbxrQtuMtfMI2+hlJEqcyMUgOMCkEvsHFxgGSPM+EZK2BxKneiR3o7WomiLitkHdwMbEsl7wSw
	J7Dy70Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEcY-0000000Drvq-0MsJ;
	Tue, 06 Jan 2026 21:29:42 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEcV-0000000DrvP-46kv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 21:29:41 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-88a2d21427dso13972446d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 13:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767734978; x=1768339778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3zjahn8T3WCja+qS1GjQYcEO/PlU6X91htTMP5EirE=;
        b=GCnqIPU2DcCxX1n9l+HEzjC1nrVRUA9SH4d2nEuvcOiyEmL6KA/WtDQkT9Z0zEDElo
         9D9RLlW6/3hGdqugCVUO8edWAU5PhGtWP09FpuG2Qf/AlPF0k021QIUrsJG5B39sJ4bH
         mpOftyAF7WiroSyEVuNTfaZXiyseaX2HSXT62DjzFDrf+1NfZIX/BBxV2KKT5J4gcwVy
         858jUmxXWNb5dPNoRq7n8u5LdnZrbOokS5V5xQR/x7aHYhw32CWAYsk+ZwweDrct9XW2
         NjpbY/ueg5nMC1241sxO+ST+2O1RTbZ/zTo9lwY1cOYb6wGwnXFYRZn+mLHFNh3f5B15
         teYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767734978; x=1768339778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3zjahn8T3WCja+qS1GjQYcEO/PlU6X91htTMP5EirE=;
        b=nRrXzpbfGrshlDr8ITg2q3jP1C2wuRfuyD2PPsLITUD4/wWSMA2S8ijhloTSzkEiaN
         +ALtY7KgamA8tou5qbBSJkx2orkTdVYej9rIIwN+qHfqT6sHz42k2vgwa4eE+1KmY8b5
         /pQkEaoOA4kETVpsGCMHDHH86Dqu6b/2OmqTfKTvrBjzEQFGTNB4rSOseX/M9v0jMpY2
         k+lZdY83vNKonXQZEbYCMbZ3XYhX41j0yRAQUNv7F17hVDj5Fx+IsFgmqJsK6IIa7Kkr
         7tJJgSxzvF7m0VTs3JNh/KKJz8RhGMjKOF/GdDeSxsxeqbZSDQUv0ds30nenFXLOwdQj
         sABQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsTTc8FTkXwO6m5XVn7vvHm5N0elxkd5ZfQJ9Mb/TnrfYsj/myBll00uDod6UUN6Ai26bcQ7NanyI5NbeXKTb6@lists.infradead.org
X-Gm-Message-State: AOJu0YzAmZTF/fyLOro0cG5wB4VMC6URh8/SDIE1YTYKj3MdTEnyMpxE
	DAN1gzm+0UezJgCn74hs8Q5YY6ZecbOFCnzByM3p2wUgMx3IhEe/iwgczYrPQkEDfr8lShtKNth
	MqKxPEtLZZU71RxJxZ97nRRub7zJU95I=
X-Gm-Gg: AY/fxX7asJYlz67AFPO+EvWPipkO8ANtLGSo6HgCjnixXEEmkdhy5tF+w2/osuAdYJR
	h0236SrjFkiPs+FvSkI9DwEI4Hf1EDfGWh+7upijWViLzUrRR0uDS9GrPx8ZbIbQzstOXozsPwU
	lQJGTtga1prftgV7Bvy/TdMCJxhmOwoYh0KOBW2lSiKCtShksWPClkb6+u1iUQv0Kmw2cFSdxKe
	98t+uJhDYCi3ue9dw/Umsa3vj36Bzff/rSFryJXR73rI+MdXNKm3yPuVfDL0DuSlBuk5nnZih4t
	Rkx+
X-Google-Smtp-Source: AGHT+IFBFTBjIk61F+k7sjdbtEFqa+eDK3RQZsJs/Vz+F3rPSMTDJenxsaZritdQ4eQpFloBiKlHyEaZpqgbbWzDq9M=
X-Received: by 2002:a05:6214:5a0a:b0:88a:2b12:f746 with SMTP id
 6a1803df08f44-890842a452fmr6151926d6.56.1767734978076; Tue, 06 Jan 2026
 13:29:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master>
In-Reply-To: <20260106132203.kdxfvootlkxzex2l@master>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 Jan 2026 10:29:25 +1300
X-Gm-Features: AQt7F2rL-Zf8YqKEcucnaMZPmDexQolmxiwZjT9Pk0GgPcf0w9YhWyyrqBnVLII
Message-ID: <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260106_132940_055523_9AE88815 
X-CRM114-Status: GOOD (  27.24  )
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

On Wed, Jan 7, 2026 at 2:22=E2=80=AFAM Wei Yang <richard.weiyang@gmail.com>=
 wrote:
>
> On Fri, Dec 26, 2025 at 02:07:59PM +0800, Baolin Wang wrote:
> >Similar to folio_referenced_one(), we can apply batched unmapping for fi=
le
> >large folios to optimize the performance of file folios reclamation.
> >
> >Barry previously implemented batched unmapping for lazyfree anonymous la=
rge
> >folios[1] and did not further optimize anonymous large folios or file-ba=
cked
> >large folios at that stage. As for file-backed large folios, the batched
> >unmapping support is relatively straightforward, as we only need to clea=
r
> >the consecutive (present) PTE entries for file-backed large folios.
> >
> >Performance testing:
> >Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and =
try to
> >reclaim 8G file-backed folios via the memory.reclaim interface. I can ob=
serve
> >75% performance improvement on my Arm64 32-core server (and 50%+ improve=
ment
> >on my X86 machine) with this patch.
> >
> >W/o patch:
> >real    0m1.018s
> >user    0m0.000s
> >sys     0m1.018s
> >
> >W/ patch:
> >real   0m0.249s
> >user   0m0.000s
> >sys    0m0.249s
> >
> >[1] https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com=
/T/#u
> >Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >Acked-by: Barry Song <baohua@kernel.org>
> >Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >---
> > mm/rmap.c | 7 ++++---
> > 1 file changed, 4 insertions(+), 3 deletions(-)
> >
> >diff --git a/mm/rmap.c b/mm/rmap.c
> >index 985ab0b085ba..e1d16003c514 100644
> >--- a/mm/rmap.c
> >+++ b/mm/rmap.c
> >@@ -1863,9 +1863,10 @@ static inline unsigned int folio_unmap_pte_batch(=
struct folio *folio,
> >       end_addr =3D pmd_addr_end(addr, vma->vm_end);
> >       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
> >
> >-      /* We only support lazyfree batching for now ... */
> >-      if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> >+      /* We only support lazyfree or file folios batching for now ... *=
/
> >+      if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> >               return 1;
> >+
> >       if (pte_unused(pte))
> >               return 1;
> >
> >@@ -2231,7 +2232,7 @@ static bool try_to_unmap_one(struct folio *folio, =
struct vm_area_struct *vma,
> >                        *
> >                        * See Documentation/mm/mmu_notifier.rst
> >                        */
> >-                      dec_mm_counter(mm, mm_counter_file(folio));
> >+                      add_mm_counter(mm, mm_counter_file(folio), -nr_pa=
ges);
> >               }
> > discard:
> >               if (unlikely(folio_test_hugetlb(folio))) {
> >--
> >2.47.3
> >
>
> Hi, Baolin
>
> When reading your patch, I come up one small question.
>
> Current try_to_unmap_one() has following structure:
>
>     try_to_unmap_one()
>         while (page_vma_mapped_walk(&pvmw)) {
>             nr_pages =3D folio_unmap_pte_batch()
>
>             if (nr_pages =3D folio_nr_pages(folio))
>                 goto walk_done;
>         }
>
> I am thinking what if nr_pages > 1 but nr_pages !=3D folio_nr_pages().
>
> If my understanding is correct, page_vma_mapped_walk() would start from
> (pvmw->address + PAGE_SIZE) in next iteration, but we have already cleare=
d to
> (pvmw->address + nr_pages * PAGE_SIZE), right?
>
> Not sure my understanding is correct, if so do we have some reason not to
> skip the cleared range?

I don=E2=80=99t quite understand your question. For nr_pages > 1 but not eq=
ual
to nr_pages, page_vma_mapped_walk will skip the nr_pages - 1 PTEs inside.

take a look:

next_pte:
                do {
                        pvmw->address +=3D PAGE_SIZE;
                        if (pvmw->address >=3D end)
                                return not_found(pvmw);
                        /* Did we cross page table boundary? */
                        if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) =3D=3D=
 0) {
                                if (pvmw->ptl) {
                                        spin_unlock(pvmw->ptl);
                                        pvmw->ptl =3D NULL;
                                }
                                pte_unmap(pvmw->pte);
                                pvmw->pte =3D NULL;
                                pvmw->flags |=3D PVMW_PGTABLE_CROSSED;
                                goto restart;
                        }
                        pvmw->pte++;
                } while (pte_none(ptep_get(pvmw->pte)));


>
> --
> Wei Yang
> Help you, Help me

Thanks
Barry

