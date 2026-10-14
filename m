Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9377ECC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cYhJsFY6GItBPWieM4stDAK2l4sudXXbycAkGrr3pY=; b=F2PMxqgtQ3YJ67QEgiWAF1JbzU
	SnGXvqsG3/Plvb7oHZ0K1BSYJ2ah2V186cHQrefXGn8i7jNvpRbyw+fDiW1+sMk+ABurEnFH1wVe6
	dBAU1DdcsIjuv0WiCg9XO7ZuZ7x36LjBRON5QhXOiHpmHeIpYoiMl8bA4g7sHTTDiDmMr5YfROGCs
	PzuddfwlGbGEiUvP322SVqSk4Rcn9qE/jvve+d6SfyCK03sKTXYj+1TZG7sT01TAWrwZtgQPvZURg
	08ibpUZyZn6x72TWNLB8zrEETfsMXmnFDIdP3c9E3bhnyRCYnADJ9MFb5Qs0+awmH3pRyDQvsN1GD
	Y58hjBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGudm-0000000EwEA-2JOQ;
	Wed, 14 Oct 2026 08:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGudl-0000000EwE4-05lw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0cYhJsFY6GItBPWieM4stDAK2l4sudXXbycAkGrr3pY=; b=qhC6v6cbn/6doOyrdWm7PGqW+j
	8d4GD1/D/yZwqj2WwBqIGLeitAWXj2Ajzw9SZcoAj/b4LYzO7Bh9HZNfNMkq850nIPxPBf6CLNglq
	8pgQFantpOrF4n6GdJ8U2m7OoZk/cF5V9UWzCGgDK9SalbobEKITgPdzvitbZr/0/pvxamDC726EY
	065FOLz0gyR25Y33l2GEnNV7D7D/GcCGNViRdGCax+99aqe7ModafYJZez+luwNLVLg2QM9LPw6w1
	QvP6bWBbaVoOGqHw2qzRh6APNOdyh3uHvQ4c1u1j3DK/HyqHnXkIwVDg0pXEn+wUch43dg8DqkYSQ
	bYRmk6xQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGudi-0000000GWOn-0DbW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:47:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a17baef589so6085305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 01:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791967628; cv=none;
        d=google.com; s=arc-20260327;
        b=ZnUi7kChKOdh4pdlFITkhLRC+x1shKe8LWFui/aaNryduteZYAA2hkNstNkA3plzEH
         It3EIRQZ9e2uHUucA/MThn+K4trS8zMcn9K6LZO3XvC8wQCt5Aih5a3SqUP2XPGN+9Qq
         A9JeuwEUG1X1SWqnSkaIMbTVKqIrYqxRig1D/POQyzNJx5FrR9zuKJy5FICmaHHl15P3
         plsE4whpJGGUXyvd1UgB9bvE1eVwYd7XAvYy4onFJ+ATDyXnmyv8eeauFwMC7CC2Eglw
         NSE4FJ6Pdi77S7Y9W2MiZ6STstrQMce/VFKAyJNbdhr0MJ4heFqlcpJrSvXAtDoVMVEd
         Nd0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0cYhJsFY6GItBPWieM4stDAK2l4sudXXbycAkGrr3pY=;
        fh=MkL4x0gC0EcTJukeNrvIPN1gaiV6F9/+hAgzBf24auY=;
        b=MxAWOwaxQ+MW23GLv/ledAzWmUZocPw6Ub8yYSjgPoWU5ly7fnu2Y1XdsTJvGYaGvi
         kmIrncU+mAoUM5A2aZJ4FIyf6m9KoXzEiUlCnsS+WfrG+sfKVhNSWC+6cGiLyCliWyRL
         1UdkAMw6VmF3Q9Sg/IyLsfCB1ufo3DU8uMTYZJEZgp/cyiBUk3UZhqGbDsXyeYhk1eeY
         t5Vr2cjgTEDVfjk2+J+gC4e8LBLApPgJ5H/SlGt23i6B6AM7BI6uDILwaizhh4EBmGE9
         Nuu3GzBlGGzKWU2nUiBe4fGIIVIQQDh+nqdeX6HtHFxQOIhhGp6fsGlw3/PPrd3P5RKp
         nTVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791967628; x=1792572428; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cYhJsFY6GItBPWieM4stDAK2l4sudXXbycAkGrr3pY=;
        b=U4KGsLrGZzNQr4Cc1AaDVqL23+kBpBNYhj8hcDmuhjXziv4M1dJ3bAzGtfSqjSml/C
         FwgFG+ph1aae4eOS6Djj18R75vdF8Wa52Y/MK/eRd19v+H6OOb6AtFgltSIyqiLQ3/t6
         5arxCbCOkDwYavCzZ6AYptjD4z1A2+/b+3rgsDTjZ34BkvNn8yuFLFAcpPyAt1SM6HQL
         Gsi837nywHEYBVVPB0yNqhvwWxFOJd/6jPvmsOkOQi98/9XsxtKjuY8uEZB1WoD4dRhw
         1+i6YHHj5bfTAiYqxRc7JSXX9qYlIYpUrIiUGgqRltJMllywm+hYE5ho8s+Y8WulvyHZ
         K61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967628; x=1792572428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0cYhJsFY6GItBPWieM4stDAK2l4sudXXbycAkGrr3pY=;
        b=y7KotivJHMFsL6RLjZHNn36yUslF5ovm/VAxdBdCTchEbkOH2HPQABJfEVfx7l+LRi
         2lBzLajVh87wK+d1BTIqEMXqyJxLywjz2M2NAs56d7gDmnxQ5mWR1/PVN8c9N9oK1M6I
         Q60moBdXwc7DroPtRPcMWfeqia2l83JkgAbx0vb7E74jH/edGFtp27XYUTskwDQ4mjYh
         bkywVm82psnEWjjv7a6b+uP1AUZ9+xJBWON2dN5ys9eZywLRQ9KFfM30JMlFFuLyuZiO
         13yherlCqNwrZnSZSvlbJe0WN5A11BNHeiDMrw0BNXa0EYDP/vNNsSOa/9Q6XxO9bGvx
         MovQ==
X-Forwarded-Encrypted: i=1; AKwUvBxw83Ym1P7j3Kiy03nIV87hZWA8r83V9IyAfydHz+32z4SgKvKzJEsYJl4KbiGsLg5R6KW9jfehg43vYqDo1Xvx@lists.infradead.org
X-Gm-Message-State: AFq9FYI0/ICunjv0pd8IHZcwXdtzEHdkPsowErYpTZyoepHH7zHGBnfR
	5LyW3whLJUAXlNI6QlU3lGSvGxobdn8aTrc1wdXGCRY19AJ76+m6Rf/TrGOfNpsWayGUfy5NuL0
	oWLdV+K/0oC8R9DuooPHUbKTppO97j7Q=
X-Gm-Gg: AYBFou3JcHWVnXae0Y3hkMiOXx/pPANyEPXSTq2JxA0UZhUtK6nqjfNaUwCkGTR+Xmr
	0QhqHKNixCwqVTcN37wVST7Zv4WkJaFLoHk1RsA+5emyRMHqhSb+61KoXfOQItWDhtVvXQpaRew
	kHDv44NvrTzmbf5pFeDND0q/zlNfcylnX9uIWkL/ux4L/wtAq5BoprmoMcQpY37phC7etghkGmh
	IPuLfhpIbpeE9ohMOrnAHoz2WDFIOLF9XqS9Nu2NSjK8MA6oWcQ9+B7mNQO8Iqhi7xstEGwBksr
	jQdQx91C1u2ZFqyL6m2fOhvStGeCqDM91udPT4QB/ZMjQu6PviB5Jex9mw==
X-Received: by 2002:a05:600c:83c4:b0:4a1:7367:5395 with SMTP id
 5b1f17b1804b1-4a18e446f4amr296569785e9.2.1791967627867; Wed, 14 Oct 2026
 01:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20261002090947.869220-1-jiangwen6@xiaomi.com> <20261002090947.869220-2-jiangwen6@xiaomi.com>
 <7b3c3a39-4cf3-430d-9fd3-ba83e5175e72@arm.com>
In-Reply-To: <7b3c3a39-4cf3-430d-9fd3-ba83e5175e72@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Wed, 14 Oct 2026 16:46:55 +0800
X-Gm-Features: AclHuK-bFuc3dEYGYwD4zSgb8fq4NoGf2OiM-E1K3hrsnLGY-8dDIYkDzN8S8fw
Message-ID: <CAHKocdFOoDhjcuWXJatQ-AbSXyXuV+Q=sA1-iGiGrp7vhHZMBQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	chleroy@kernel.org, david@kernel.org, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_094710_214263_094737AB 
X-CRM114-Status: GOOD (  33.51  )
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

On Wed, 14 Oct 2026 at 14:03, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 02/10/26 2:39 pm, Wen Jiang wrote:
> > vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> > set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> > helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> > unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
> > HugeTLB internals it does not otherwise need.
> >
> > Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> > pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> > __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> > depend on CONFIG_HUGETLB_PAGE.
> >
> > There is no caller yet: mm/vmalloc.c is converted later in this series,
> > once the generic fallbacks are in place.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Reviewed-by: Barry Song <baohua@kernel.org>
> > ---
> >  arch/arm64/include/asm/pgtable.h |  6 ++++++
> >  arch/arm64/mm/mmu.c              | 23 +++++++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 6000905a2e865..9b762eb68cff0 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -1978,6 +1978,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
> >
> >  #endif /* CONFIG_ARM64_CONTPTE */
> >
> > +#define __HAVE_ARCH_PTE_SET_HUGE
> > +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> > +               pgprot_t prot, unsigned long size);
> > +#define __HAVE_ARCH_PTE_CLEAR_HUGE
> > +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
> > +
> >  #endif /* !__ASSEMBLER__ */
> >
> >  #endif /* __ASM_PGTABLE_H */
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 79d90226fd5dc..ae2f15618c97d 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -1912,6 +1912,29 @@ int pmd_clear_huge(pmd_t *pmdp)
> >       return 1;
> >  }
> >
> > +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> > +               pgprot_t prot, unsigned long size)
> > +{
> > +     unsigned long pfn = __phys_to_pfn(phys);
> > +     pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
> > +     unsigned int nr = size >> PAGE_SHIFT;
> > +
> > +     VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> > +     VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> > +     VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> > +
> > +     /* For vmap, there is no valid -> valid transition */
> > +     VM_WARN_ON(pte_valid(__ptep_get(ptep)));
> > +
> > +     __set_ptes(&init_mm, addr, ptep, pte, nr);
> > +}
> > +
> > +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
> > +{
> > +     return __get_and_clear_full_ptes(&init_mm, addr, ptep,
> > +                                      size >> PAGE_SHIFT, 0);
> > +}
>
> I think we should have the same VM_WARN_ON() checks here, as for
> pte_clear_huge(), in addition to also warning for
> current->mm != &init_mm.
>
> We should make it clear that pte_clear_huge() gets called only for
> kernel mappings, and the range we operate on is definitely an aligned
> CONT range - which is why we do not go through get_and_clear_full_ptes ->
> contpte_get_and_clear_full_ptes, and possibly contpte_try_unfold(), but
> directly use __get_and_clear_full_ptes.
>

Hi Dev,

I'll add the alignment VM_WARN_ON() checks to pte_clear_huge() to
match pte_set_huge().

Regarding the current->mm != &init_mm check: these functions don't take
an mm parameter -- &init_mm is hardcoded in the function body.
current->mm would never equal &init_mm in practice: for user processes it
points to the process's own mm, and for kernel threads it is NULL.
So VM_WARN_ON(current->mm != &init_mm) would always fire.

The existing hugetlb helpers that vmalloc used before this decoupling
(huge_ptep_get_and_clear -> get_clear_contig) also take mm as a
parameter
and don't check current->mm either -- the caller simply passes &init_mm.

How about adding a comment to make the "kernel mapping only" intent
more explicit?
Something like:

 pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
 {
+       /* Kernel mappings only */
+
+       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+       VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+
        return __get_and_clear_full_ptes(&init_mm, addr, ptep,
                                         size >> PAGE_SHIFT, 0);
 }

Thanks,
Wen

