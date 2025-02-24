Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13BCC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPK2zF8A/QoLIlZ7H4rce8LDxvSgapo6R5EV/XU26lw=; b=ulFeDl6TMUdl+IuqbNFOmmzouW
	34ebpevUwgOYQW5JNw5EEoi7ega+j/hyuisIIAzXvX6mRe35XxWFh/pHPJogY97lboBAQKLAd6BaE
	JD2XTOWPdydRZO78tMJMoE1g5oUP/ZrV4JiCJMR3iOu7ia1IGEzPW6mmx7IrJQG91kdHNXH2+Gen7
	DGs5wmMlr+1BPw/gop7S1nJdxAjbSnoQ0ue/MRcNah5gY54Bh7vqqHm+8DryS20UyaB3CJZgIPLYg
	9+ogpuLoIp8mvNxEuk05Zpk7DcgnLsmhV2iVfrzti8bGeQI/DhRjjdnrN4sy2TsF5OQa1HVNDGi7o
	F11CuG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmX91-0000000Da1l-1U4R;
	Mon, 24 Feb 2025 12:01:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWcI-0000000DNQH-1o4y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 11:27:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso5821712a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 03:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740396437; x=1741001237; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPK2zF8A/QoLIlZ7H4rce8LDxvSgapo6R5EV/XU26lw=;
        b=ZkgaMLrl2/vt6lZIT6VSYcHdBC2+8T1vT6i4EhrvrDKJqyDy4vIfKzw8OG6XLWkh5+
         60Mx2/LmZLR05lT5OH9sz29yonkh1c7qRyBrIbvwNNFIKY0iDq+NI9sUYRdtgHoJvOih
         qVsrTmWvJpmg+BSI2vOGqcfVZhAizuX9uY4StBSPh78YUcGt9CojPCswzPCm08Aey2qb
         4vo8aLkjB5s7z+EU1BW9SdniF0FyEU06ywU/g0X91TCmPJ/K8LVQt951Cxi15BV0QbQ+
         P4a+H86jBp4pDN1afP067y+L4g6JABpxK5AVPPogz/74drNMbe2Q1ydcY0cvcDLFw3de
         TY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740396437; x=1741001237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPK2zF8A/QoLIlZ7H4rce8LDxvSgapo6R5EV/XU26lw=;
        b=nU1hzb5MBDHDi1jQGN0HuqIhets8JHpTq6QDAs3c57I3X3yRh7GVGWdioJralwHXC3
         L1CSWv4gI06GRrFrCJJn7MVv0FgnA9IMqgrokzbNbhUZ7nFIe9owryF0Hdkyk+pb4haV
         071NvfiHU4eN0tv9IdrHlU3oi1OPJzTalxW8lJu7lmu9pcbDiaN3rHUZQVHYKTrU3vPc
         pwQ2cWPUYN/gdAVNJ9fsBXELCUpyEROWjZxR8wompPiQ6uYqT3qaF8k+ObYW/xnqKcO4
         hQEuAq9hQKxiJ9xctQjAdWxlJqhmKK8DQOcGs+YXMJ2ggWBazle3aKZDUPRpTCbQahab
         7PfA==
X-Forwarded-Encrypted: i=1; AJvYcCWgNOUequw11KwHHptpHlMXPrp+DO1JJLNdXjLW5y1IXXPgddLwpH2TiGQkCfDlUcnAAkzqqM0TANnaqLd4lRac@lists.infradead.org
X-Gm-Message-State: AOJu0YzxS9n4y96k6Xybs2jdT5fGtnu1dQM2QLXyxVB3mW67r8Lzxthw
	VCPjfC/1n5qIWdp8TSkS2JA6igc7iT5AfOA0geB03IfXpT5wW43TO35sOYyPriOkuba09UhpUE3
	RZ+PmZBu9CWP+Vxg1hDv6V8qiS32IGY6kq/DndQ==
X-Gm-Gg: ASbGncsYFeAvPtpEe13GTporG+wkiBEQiqfpTRUBg0CEsfl9MzSwTD8FcLbYYSOQqwR
	Kmi9ry1t/fuCfSCTFpleHvpM6X5apyqKouYBeV7khvcMweUG24b/dCeZou/p5ps4Kq1Rq9IJZlp
	P8/Pjyfus=
X-Google-Smtp-Source: AGHT+IFzHPiP7HgEi1iLeAsUfPrgcPiwkLzFkdvMUmpitpPx5I5iW5pGV+bPYBd/LufmeWzu4SPrwChI7bwpkBQUkUA=
X-Received: by 2002:a05:6402:274b:b0:5dc:db28:6afc with SMTP id
 4fb4d7f45d1cf-5e0b6fdf732mr13463545a12.0.1740396436756; Mon, 24 Feb 2025
 03:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20250217140419.1702389-1-ryan.roberts@arm.com> <20250217140419.1702389-3-ryan.roberts@arm.com>
In-Reply-To: <20250217140419.1702389-3-ryan.roberts@arm.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 24 Feb 2025 12:27:03 +0100
X-Gm-Features: AWEUYZkGhzPlXZwydhM9MLmyrXrPvhtmhDQdRWEVf0EDYo_eOVstS6UzcJ92dwo
Message-ID: <CAHVXubiBS-m91bpx-NbKdkcSk3HdStTxY8QLVTKxxozL2Od8Qw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: hugetlb: Fix huge_ptep_get_and_clear() for
 non-present ptes
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	David Hildenbrand <david@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032718_482508_141DD121 
X-CRM114-Status: GOOD (  38.00  )
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

Hi Ryan,

On Mon, Feb 17, 2025 at 3:04=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> arm64 supports multiple huge_pte sizes. Some of the sizes are covered by
> a single pte entry at a particular level (PMD_SIZE, PUD_SIZE), and some
> are covered by multiple ptes at a particular level (CONT_PTE_SIZE,
> CONT_PMD_SIZE). So the function has to figure out the size from the
> huge_pte pointer. This was previously done by walking the pgtable to
> determine the level and by using the PTE_CONT bit to determine the
> number of ptes at the level.
>
> But the PTE_CONT bit is only valid when the pte is present. For
> non-present pte values (e.g. markers, migration entries), the previous
> implementation was therefore erroniously determining the size. There is
> at least one known caller in core-mm, move_huge_pte(), which may call
> huge_ptep_get_and_clear() for a non-present pte. So we must be robust to
> this case. Additionally the "regular" ptep_get_and_clear() is robust to
> being called for non-present ptes so it makes sense to follow the
> behaviour.
>
> Fix this by using the new sz parameter which is now provided to the
> function. Additionally when clearing each pte in a contig range, don't
> gather the access and dirty bits if the pte is not present.
>
> An alternative approach that would not require API changes would be to
> store the PTE_CONT bit in a spare bit in the swap entry pte for the
> non-present case. But it felt cleaner to follow other APIs' lead and
> just pass in the size.
>
> As an aside, PTE_CONT is bit 52, which corresponds to bit 40 in the swap
> entry offset field (layout of non-present pte). Since hugetlb is never
> swapped to disk, this field will only be populated for markers, which
> always set this bit to 0 and hwpoison swap entries, which set the offset
> field to a PFN; So it would only ever be 1 for a 52-bit PVA system where
> memory in that high half was poisoned (I think!). So in practice, this
> bit would almost always be zero for non-present ptes and we would only
> clear the first entry if it was actually a contiguous block. That's
> probably a less severe symptom than if it was always interpretted as 1
> and cleared out potentially-present neighboring PTEs.
>
> Cc: stable@vger.kernel.org
> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit"=
)
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 40 ++++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 06db4649af91..614b2feddba2 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -163,24 +163,23 @@ static pte_t get_clear_contig(struct mm_struct *mm,
>                              unsigned long pgsize,
>                              unsigned long ncontig)
>  {
> -       pte_t orig_pte =3D __ptep_get(ptep);
> -       unsigned long i;
> -
> -       for (i =3D 0; i < ncontig; i++, addr +=3D pgsize, ptep++) {
> -               pte_t pte =3D __ptep_get_and_clear(mm, addr, ptep);
> -
> -               /*
> -                * If HW_AFDBM is enabled, then the HW could turn on
> -                * the dirty or accessed bit for any page in the set,
> -                * so check them all.
> -                */
> -               if (pte_dirty(pte))
> -                       orig_pte =3D pte_mkdirty(orig_pte);
> -
> -               if (pte_young(pte))
> -                       orig_pte =3D pte_mkyoung(orig_pte);
> +       pte_t pte, tmp_pte;
> +       bool present;
> +
> +       pte =3D __ptep_get_and_clear(mm, addr, ptep);
> +       present =3D pte_present(pte);
> +       while (--ncontig) {
> +               ptep++;
> +               addr +=3D pgsize;
> +               tmp_pte =3D __ptep_get_and_clear(mm, addr, ptep);
> +               if (present) {
> +                       if (pte_dirty(tmp_pte))
> +                               pte =3D pte_mkdirty(pte);
> +                       if (pte_young(tmp_pte))
> +                               pte =3D pte_mkyoung(pte);
> +               }
>         }
> -       return orig_pte;
> +       return pte;
>  }
>
>  static pte_t get_clear_contig_flush(struct mm_struct *mm,
> @@ -401,13 +400,8 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, =
unsigned long addr,
>  {
>         int ncontig;
>         size_t pgsize;
> -       pte_t orig_pte =3D __ptep_get(ptep);
> -
> -       if (!pte_cont(orig_pte))
> -               return __ptep_get_and_clear(mm, addr, ptep);
> -
> -       ncontig =3D find_num_contig(mm, addr, ptep, &pgsize);
>
> +       ncontig =3D num_contig_ptes(sz, &pgsize);
>         return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
>  }
>
> --
> 2.43.0
>

Thanks for ccing me on this fix, we have the same issue (in
huge_pte_clear() too) in riscv. I'll come up with a fix and wait for
you guys to merge this.

That only comforts my idea to merge both riscv and arm64 implementations :)

Thanks again,

Alex

