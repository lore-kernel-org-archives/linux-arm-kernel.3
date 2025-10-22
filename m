Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA233CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 04:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URErFMYOLyHpAjEwaEXcwkMOPsj73MCltrwJY2rXne8=; b=DIPyplr8bAdBruo55T/FA25d6D
	zmf3/m49CeAkSRQEGR7vWrsRb85DJIYQS5cBM92JZ8dUVsvH5vCkao7AmAv/KE/smb5gNSRVPk9uk
	z9L/FG0sHvPoemZ2aYtY/PzHm5kfEH5lbsnrVp/8kT3kN97oHPI3p0v7OqP25BnA28sz2aopzJ6F0
	mrdJ2Ekajf2aAAKuhTNxhfxqKBvjDjqVIB4/E38zqDWiAM+VdiL/CEdknQzx2P78eaQnt7HlQ93jF
	sx1jMLiHY72gwPDhVQSNMMUMOMigQKeNr3untX7sI9aDiKfmbQlYTBOxj5V63rC839l/n8woS3aNj
	eUYBAD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQ9m-00000001P1f-2Jnc;
	Wed, 22 Oct 2025 04:09:02 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQ9j-00000001P1C-44sD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 04:09:01 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-88e456972d5so1157258285a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761106138; x=1761710938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URErFMYOLyHpAjEwaEXcwkMOPsj73MCltrwJY2rXne8=;
        b=emLi9Inuji6jZXlgnkKfYuD/aSBXhkCrgN12Kk+r5jE2AUvwoofsq9yPcNRncnBCkJ
         TTTVfWXiZYPeRTDr7yleGMIassK3VjMJndfhGVLq/8rouhfdQOxEQ0KmGiPLQLebcRKr
         qolaIeSR/MhKwnHwly9T1XLR/ti2YV8A9n2pXltYKwEEmZY/EpshGnIheVipaXiXWty0
         DKG+JOhGb/qHWJE9oPWbNNZ339P//9tywJ4dgbRyU3pfwzL6WNjL8n4n2WkdvAlHYFZb
         Er2Zzf0jI7njBwOyvZSHARA4Ef0BwDee+MdPlI2GtCiOIn0oNkGSxxyYZLaF4yZzA1F3
         kXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761106138; x=1761710938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URErFMYOLyHpAjEwaEXcwkMOPsj73MCltrwJY2rXne8=;
        b=XnRTEDGYTzhyraXRcKvJzc5w8C2vvcX9/2pNjTGa5Y+dCLiItsBWrNsFdojW9nXJs+
         l1rmJINhNAqcy3sRlr9F9/1C4gFScGs63hKiAo3bYscJMditePocAfK82bDWsIdOqhrj
         bkDLiqN/5PNgGHqjpH0RtNn2rUazeGhTY10IFAe1UnBZ4kc/WncKhZtW/hExpLatlNKw
         NG8thTDAscXuCWnqfRFfSou5j1mfEZpsqpkyeVMw8NM3DuGD0SDVW1i/Lg8aMy3WHtmo
         rRLqYjXNHPER71DELORFTGXHdpGr44Db2k+pALz3/5x89nfdHXx8hKQ4Ig6nyR9TP2T+
         pd+g==
X-Forwarded-Encrypted: i=1; AJvYcCVHI6nmQJNEs2Au1APs1dAb9QioKOpWk7P9F5h98nyepg3Om0kVrRYQI9OS9TUhWhK+FcD9L+iI/X7S+rcfhofl@lists.infradead.org
X-Gm-Message-State: AOJu0YwJF/CsjX/QN6Immx8EDaUCjbop9AT1UTmaiw0ItvHomAhPJGBO
	pFg6khxamS4d22q4tKhVD1UeAH5bMwOvFPV2yB+PCzXvl/d6OKW5sPEddVC3Y8rH7RSi5eEjGNI
	W/ffWB+K/dm4dzye08J/2vKjIM17hc8o=
X-Gm-Gg: ASbGncuy8FTnpy6V6JidiSN6tEaBZgXgWy8MwnXD3CyQ/6iWoNmYPo6/ZrfraFq4RiX
	9bft8lNGqCCDO+hHLI6FNw+F/zF1N6XQ1EY0syDmQyBtcfmX28F8IDE4dYaPRwHJ8fAbdOC4+tc
	8cGSYAg3FJD1Ifkva/6GI3fLNII6iQiVFVm55TMY9WzANebhDH5prRzI6L+JZ+UllJdr20Vv4tl
	WN5HkW/VQQyLWnULbEnOD7c4kM1hNERKvMbP6m3XP7d+C3fnaKouPjoE/moRwoOUBdPtsE0ioZ7
	OsR1CzOXxyPotk2T
X-Google-Smtp-Source: AGHT+IGH2SZ0WRdKh3j7EkOtPTZS6RKLKqRp7QWRcXCt+UnJ5XXc0fzRoyKcNi/2idgTj+GrP0UQbD3joeBzcCGF8bI=
X-Received: by 2002:a05:620a:394b:b0:85e:5fef:86fa with SMTP id
 af79cd13be357-8906e9a4759mr2627239885a.28.1761106138195; Tue, 21 Oct 2025
 21:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com> <20251013092038.6963-3-ying.huang@linux.alibaba.com>
In-Reply-To: <20251013092038.6963-3-ying.huang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 22 Oct 2025 17:08:47 +1300
X-Gm-Features: AS18NWC2SmOG0fXr6JtdNTOm9s8laV21PFicKhXafLS2YkktGrTmfAKkyqEoEAM
Message-ID: <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
Subject: Re: [PATCH -v2 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
To: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Yin Fengwei <fengwei_yin@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_210900_067351_9C6C78EC 
X-CRM114-Status: GOOD (  23.72  )
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

> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index aa89c2e67ebc..35bae2e4bcfe 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -130,12 +130,16 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>
>  /*
> - * Outside of a few very special situations (e.g. hibernation), we alway=
s
> - * use broadcast TLB invalidation instructions, therefore a spurious pag=
e
> - * fault on one CPU which has been handled concurrently by another CPU
> - * does not need to perform additional invalidation.
> + * We use local TLB invalidation instruction when reusing page in
> + * write protection fault handler to avoid TLBI broadcast in the hot
> + * path.  This will cause spurious page faults if stall read-only TLB
> + * entries exist.
>   */
> -#define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (0=
)
> +#define flush_tlb_fix_spurious_fault(vma, address, ptep)       \
> +       local_flush_tlb_page_nonotify(vma, address)
> +
> +#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)   \
> +       local_flush_tlb_page_nonotify(vma, address)
>
>  /*
>   * ZERO_PAGE is a global shared page that is always zero: used
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/t=
lbflush.h
> index 18a5dc0c9a54..651b31fd18bb 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -249,6 +249,18 @@ static inline unsigned long get_trans_granule(void)
>   *             cannot be easily determined, the value TLBI_TTL_UNKNOWN w=
ill
>   *             perform a non-hinted invalidation.
>   *
> + *     local_flush_tlb_page(vma, addr)
> + *             Local variant of flush_tlb_page().  Stale TLB entries may
> + *             remain in remote CPUs.
> + *
> + *     local_flush_tlb_page_nonotify(vma, addr)
> + *             Same as local_flush_tlb_page() except MMU notifier will n=
ot be
> + *             called.
> + *
> + *     local_flush_tlb_contpte_range(vma, start, end)
> + *             Invalidate the virtual-address range '[start, end)' mappe=
d with
> + *             contpte on local CPU for the user address space correspon=
ding
> + *             to 'vma->mm'.  Stale TLB entries may remain in remote CPU=
s.
>   *
>   *     Finally, take a look at asm/tlb.h to see how tlb_flush() is imple=
mented
>   *     on top of these routines, since that is our interface to the mmu_=
gather
> @@ -282,6 +294,33 @@ static inline void flush_tlb_mm(struct mm_struct *mm=
)
>         mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>  }
>
> +static inline void __local_flush_tlb_page_nonotify_nosync(
> +       struct mm_struct *mm, unsigned long uaddr)
> +{
> +       unsigned long addr;
> +
> +       dsb(nshst);

We were issuing dsb(ishst) even for the nosync case, likely to ensure
PTE visibility across cores. However, since set_ptes already includes a
dsb(ishst) in __set_pte_complete(), does this mean we=E2=80=99re being over=
ly
cautious in __flush_tlb_page_nosync() in many cases?

static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
                                           unsigned long uaddr)
{
        unsigned long addr;

        dsb(ishst);
        addr =3D __TLBI_VADDR(uaddr, ASID(mm));
        __tlbi(vale1is, addr);
        __tlbi_user(vale1is, addr);
        mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MASK,
                                                (uaddr & PAGE_MASK) +
PAGE_SIZE);
}

On the other hand, __ptep_set_access_flags() doesn=E2=80=99t seem to use
set_ptes(), so there=E2=80=99s no guarantee the updated PTEs are visible to=
 all
cores. If a remote CPU later encounters a page fault and performs a TLB
invalidation, will it still see a stable PTE?

> +       addr =3D __TLBI_VADDR(uaddr, ASID(mm));
> +       __tlbi(vale1, addr);
> +       __tlbi_user(vale1, addr);
> +}
> +
> +static inline void local_flush_tlb_page_nonotify(
> +       struct vm_area_struct *vma, unsigned long uaddr)
> +{
> +       __local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
> +       dsb(nsh);
> +}
> +
> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
> +                                       unsigned long uaddr)
> +{
> +       __local_flush_tlb_page_nonotify_nosync(vma->vm_mm, uaddr);
> +       mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & P=
AGE_MASK,
> +                                               (uaddr & PAGE_MASK) + PAG=
E_SIZE);
> +       dsb(nsh);
> +}
> +
>  static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>                                            unsigned long uaddr)
>  {
> @@ -472,6 +511,23 @@ static inline void __flush_tlb_range(struct vm_area_=
struct *vma,
>         dsb(ish);
>  }
>

We already have functions like
__flush_tlb_page_nosync() and __flush_tlb_range_nosync().
Is there a way to factor out or extract their common parts?

Is it because of the differences in barriers that this extraction of
common code isn=E2=80=99t feasible?

Thanks
Barry

