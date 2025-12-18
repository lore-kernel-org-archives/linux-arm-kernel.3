Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AE2D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 17:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=; b=ndf7O7+e/vYKVuxfFfIi7aUv+r
	SC3fSUjmXL89sy68Py7+4yCqaSW7w3TjqBZlKOLFDtejmPJ69ITXmqSoxu+N0OfaQGt1sHP9Ir874
	u+CypCkYTVveVKZEQe4SH4/cJshRNhZopJa0CUvYOH5xeCM5lD/C7ZBDANv0QZtxgY2iwCAVjayQ1
	+I4XAj7To/aT3MAQG+5wKZBFxeoSDIM31vY9SUkQyYdFXr6GX7qPixg/IJrw5h98JeU1F1wJCOGqS
	9ml9syD3GX8DpnVhPx9CWmw4bEgK2Hr2EiHOA8iLoGkRx6SlzWc+VA7+Y3lvNUxUNdkzyL84sIiuo
	Gkzd9klQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI8J-00000008wjT-0xzG;
	Thu, 18 Dec 2025 17:49:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI8H-00000008wjB-2V76
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Dec 2025 17:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=; b=Yo/HYHHV7OpEvzekcwz8iTr73L
	pSJVwzkO9kdBj9j8dYQ7A58MSSGBEePj/XUv6Mf0SI738W3uOM4t5OkeoYCcQ7aCi4tapLa3aEUXO
	o3csEmT/KOFtJcWVOJS24B/s1x1m4s6SmTf+BF5rpFAgQEBwntoxzYdfsJEejt9VRkRx1v0WCIFYp
	sELW2M9Snf0hJCYVbAAaSNNnFU8mSO3ywLg1na/QEPXiZVrRsqqmxqn0a3GpFh1xm7vzJRNmJvI8f
	a4fDoRL7PqK6tY+rFfNc6n3o7fWlWEmJ08SJSALQR2eRbYQx7ZlcZhKSRKSRLYWf+lJ6k2ivMku/9
	BuclLRUA==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHGl-00000009JdZ-3F5O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:54:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso1049962a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 09:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766080180; x=1766684980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=;
        b=dr0MlGYzbRRGs30nBJtXOSq/pCEFrNqO2NZHgRbBwmoEJx5+HH+BEGnGWiKrgo0kFZ
         pQRYySpfoX2B42HzjYtEJry+AFQPZrT5TiZQtuzqUO+Gmgj1r9ivKQey4rLYTMflUOXb
         wxNZoau7l1ymyMC0FxY+JaYsFRnE5QpH20TRO6Z4xzO+kSbIc9kZGs1sMqqW1hwHEtcf
         QXuUCeGlY3BFoPLwjSeUFzRa2YXfOW8IlnByly3l9fl21XUACu8TgGQocm4L7zZl+1F2
         AR5DnhihD4ZY6nXRCPirxzUuVXsbE0y2ETi1KNLzjixliFpECWS61EDenOsu2Dk4FBKQ
         NFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080180; x=1766684980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEGX9NCRxVFvkAo1SyCOWmoT8Y8UVkLNsscKPRE6j7c=;
        b=YK/1JIvWtNNncnEiZQf9cb608BhrHOyMfqqvuJJM4zt8pQh3ZrxDU5JkeqrD/l6WNl
         eW6L+J3xE9EKuc8aKA36eyzvg30twry3yv/JaBmGXsqwZlpv1Vs+howhe0GxQ5wDl2AV
         5AGBvL1yg1WGtaeuA47tot0ndUUxU00ddkrpCZOrFoAAUGvFQMMy8Qq74c4upH2LHv/F
         EqpzFyHKZ5uPufin6sbiH9eBCVjWwsIgDe7h2IiIclVnTaz5fzKipQhwofwxkV4PD7dM
         dgi/zvmwFRTvWWyKHlvX/cNhMaKkGUqpzZgCo5j1vf+oRUGc+/nlCw/8okpzh1d2MwwB
         NHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvmbvqSV/++ore0A0ESb+IupFkNZSW60ejdiQINwXFiTMpKqFEWGKtNHrT0hcBTDW89COUIsrEkn8ghw/lOfFQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxoTNdvk+w9omOe7/85thZVnbJzzsGo4M6rbR5D5iCCx/In604B
	rUvjSTB6KnSzfJ5IaFA/wkZqYv8FQGlS91fm6qYnDSgWdBrkSEc1DNQEpiOZB2NA5lXHXbctTTO
	6pOgPs5Op2msRAflx3Fs4rnpPJu5gEFQFQIyEu/GeHDpHQVbpirYxq64=
X-Gm-Gg: AY/fxX4fEW4niO0WFd9o2TCTr3B1WUPo/hQ728cbpwTZOjzbMarDlPB2C9w9EhEfQne
	yIjFf2Ue/N5kIZMYsyGnoXSAoh+Uz8dxzjQlus1QzHndwyvLwGLky/1yRd2BbtPa8NwvYs+Db8N
	Ty5n9wUxjC+4RbkvRUVoqox80kwtwl/YKJH/GpJi4IxOfF0DhvFrbhnO7A0rdvvrbVJpf1aD0pM
	AugchPWsyqILcUrq4b0Vhw7VomgA17rHLVCd0yFjgwm3uRY9jrv7kWukdyyHILD1X0K942f8bzT
	8duHoBncC4mozfmSEeFSzFVq
X-Google-Smtp-Source: AGHT+IGj1ZcHTui7KBWUYP4FXCtel/5ayalcHtcXFNH9hEXSeqZ0F+Z3lWPo8TWqbx8PXpNtXrjwPKCaynSUAFZ631g=
X-Received: by 2002:a05:6402:1e92:b0:649:8b6f:99c5 with SMTP id
 4fb4d7f45d1cf-64b8eb7194amr231643a12.15.1766080179958; Thu, 18 Dec 2025
 09:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
 <20251219-pgtable_check_v18rebase-v18-1-755bc151a50b@linux.ibm.com>
In-Reply-To: <20251219-pgtable_check_v18rebase-v18-1-755bc151a50b@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 18 Dec 2025 12:49:03 -0500
X-Gm-Features: AQt7F2r7kiXa3gHIKUaDejuDxi7v3d-8CVx2-W_EwfFsV1tLHpl2uarz70Sl-ZA
Message-ID: <CA+CK2bA-3p1iy9ryaQSthV0MhpxzuMVK91F1YF45qw90PUtG3g@mail.gmail.com>
Subject: Re: [PATCH v18 01/12] arm64/mm: Add addr parameter to __set_ptes_anysz()
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>, 
	Christophe Leroy <chleroy@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, 
	Nicholas Miehlbradt <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_165427_977099_F3A59BD4 
X-CRM114-Status: GOOD (  16.08  )
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

On Thu, Dec 18, 2025 at 12:10=E2=80=AFPM Andrew Donnellan <ajd@linux.ibm.co=
m> wrote:
>
> To provide support for page table check on powerpc, we need to reinstate =
the
> address parameter in several functions, including
> page_table_check_{ptes,pmds,puds}_set().
>
> In preparation for this, add the addr parameter to arm64's __set_ptes_any=
sz()
> and change its callsites accordingly.
>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

> ---
> v15: new patch
> v16: rebase
> ---
>  arch/arm64/include/asm/pgtable.h | 19 ++++++++-----------
>  arch/arm64/mm/hugetlbpage.c      | 10 +++++-----
>  2 files changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 445e18e92221c98eef717888aeac71d1d6b1da06..52f3ea07427cef399e68bea0d=
bab39d03ea83060 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -673,8 +673,8 @@ static inline pgprot_t pud_pgprot(pud_t pud)
>         return __pgprot(pud_val(pfn_pud(pfn, __pgprot(0))) ^ pud_val(pud)=
);
>  }
>
> -static inline void __set_ptes_anysz(struct mm_struct *mm, pte_t *ptep,
> -                                   pte_t pte, unsigned int nr,
> +static inline void __set_ptes_anysz(struct mm_struct *mm, unsigned long =
addr,
> +                                   pte_t *ptep, pte_t pte, unsigned int =
nr,
>                                     unsigned long pgsize)
>  {
>         unsigned long stride =3D pgsize >> PAGE_SHIFT;
> @@ -709,26 +709,23 @@ static inline void __set_ptes_anysz(struct mm_struc=
t *mm, pte_t *ptep,
>         __set_pte_complete(pte);
>  }
>
> -static inline void __set_ptes(struct mm_struct *mm,
> -                             unsigned long __always_unused addr,
> +static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
>                               pte_t *ptep, pte_t pte, unsigned int nr)
>  {
> -       __set_ptes_anysz(mm, ptep, pte, nr, PAGE_SIZE);
> +       __set_ptes_anysz(mm, addr, ptep, pte, nr, PAGE_SIZE);
>  }
>
> -static inline void __set_pmds(struct mm_struct *mm,
> -                             unsigned long __always_unused addr,
> +static inline void __set_pmds(struct mm_struct *mm, unsigned long addr,
>                               pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>  {
> -       __set_ptes_anysz(mm, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_SIZE);
> +       __set_ptes_anysz(mm, addr, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_S=
IZE);
>  }
>  #define set_pmd_at(mm, addr, pmdp, pmd) __set_pmds(mm, addr, pmdp, pmd, =
1)
>
> -static inline void __set_puds(struct mm_struct *mm,
> -                             unsigned long __always_unused addr,
> +static inline void __set_puds(struct mm_struct *mm, unsigned long addr,
>                               pud_t *pudp, pud_t pud, unsigned int nr)
>  {
> -       __set_ptes_anysz(mm, (pte_t *)pudp, pud_pte(pud), nr, PUD_SIZE);
> +       __set_ptes_anysz(mm, addr, (pte_t *)pudp, pud_pte(pud), nr, PUD_S=
IZE);
>  }
>  #define set_pud_at(mm, addr, pudp, pud) __set_puds(mm, addr, pudp, pud, =
1)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 1d90a7e753336d86314fee0f753e8779d6a6bc12..1003b502075208d4252c27ffd=
acb1aaf4928639b 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -225,8 +225,8 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned l=
ong addr,
>         ncontig =3D num_contig_ptes(sz, &pgsize);
>
>         if (!pte_present(pte)) {
> -               for (i =3D 0; i < ncontig; i++, ptep++)
> -                       __set_ptes_anysz(mm, ptep, pte, 1, pgsize);
> +               for (i =3D 0; i < ncontig; i++, ptep++, addr +=3D pgsize)
> +                       __set_ptes_anysz(mm, addr, ptep, pte, 1, pgsize);
>                 return;
>         }
>
> @@ -234,7 +234,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned l=
ong addr,
>         if (pte_cont(pte) && pte_valid(__ptep_get(ptep)))
>                 clear_flush(mm, addr, ptep, pgsize, ncontig);
>
> -       __set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
> +       __set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
>  }
>
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -449,7 +449,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct =
*vma,
>         if (pte_young(orig_pte))
>                 pte =3D pte_mkyoung(pte);
>
> -       __set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
> +       __set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
>         return 1;
>  }
>
> @@ -473,7 +473,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>         pte =3D get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
>         pte =3D pte_wrprotect(pte);
>
> -       __set_ptes_anysz(mm, ptep, pte, ncontig, pgsize);
> +       __set_ptes_anysz(mm, addr, ptep, pte, ncontig, pgsize);
>  }
>
>  pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>
> --
> 2.52.0
>
>

