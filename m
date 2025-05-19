Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93284C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbOOM9CP485wFKiPk1vruZ8eJxSfyRZCjvhRHL5kUIE=; b=4gyzqZBXl/kDNa1pn6BQn6vyw5
	WR7wzvH2DHbB3p9tG7jcYbSu2exCFYU7dvKTYwHqlmQLmTjgh857zD0kpVMOE2pk7NKA1Rt5tnB21
	Tn8ln0XoLhsGDd8GxwSjwEI0tpV0ZPmZ7Lm3mhOVkRAQnGjkaC0+OE8sCNkPFjKlIr+WwKFAkY3y2
	ZICynBmzoSlKNYgo4whLugMCpQXhQ5eAeYHK2igSaPVyiRGELhgAfzu06gt8MaEmSFrO7FL2g/P/9
	R6VFBY0c7wdbTDZRdj7Bl6aftz1VJb9LanRbX+uk1tG1AafG7BmmISMhA09QAyw8dv1XaXdLCQPcO
	9HjN9yyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvld-00000008L9N-2uAS;
	Mon, 19 May 2025 08:22:37 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvhQ-00000008KU0-0RKR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 08:18:17 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so2980652241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747642695; x=1748247495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbOOM9CP485wFKiPk1vruZ8eJxSfyRZCjvhRHL5kUIE=;
        b=lv4IXr4Gnb4iq5h4vIM1coBEmKvh+XdppEyPEp8jBfA08/Y0FcXp/8Sx+lpNzd0tzm
         YrTI6TgRfLlYZzo8Ry/MbUm/Rlg+SwuSDwyex67aaLW/UrrXmKBjFDf4GoDEgR56UHe4
         vZ/HZqQZnOgCVGIXqmkqGtotnbxWeQlPNyHtnTSIwO5eZMYS5//96ut5JNaJpmA4Yysv
         2ycpw60yiqe4NrA2yjLmD1JTNLFmhygpDwx+HMppsUj2GWX3iuFAJ1tFUm9ofMfwMcg3
         1HEp+8crzwvN3EgPW1sRaECXkIKs2Wk+QvGc2WQ8FqYKkckyBgdLiguZJtpatr4igUGK
         M//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642695; x=1748247495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbOOM9CP485wFKiPk1vruZ8eJxSfyRZCjvhRHL5kUIE=;
        b=gM8y3vB5kVtRiZOJp8gNSekoy/USj1zdRkfmf4yA2XN6Z/TBqBJMenrVqpIl/ubrD7
         fNBK9c/rbJm1bZiwHJX/RFbuK6rc2gAUnKkBYhqbxXX7K6A71NXWD5hnETGgREluxiXC
         RzkH59W39deS2+QxWgLYdrmjUgee7Zwy97f448sOfqAn7PV3MFBp9OVkCmQipE8buefZ
         WlsZ5NmownIKHYUD3Ndzh5Gb06gvlXYCVmOcJFxsrxMe3SK7VC2xZ+8WkCdlgwh5cxp/
         VNWMQ+zlJHEa4Z4Ya2Pz+eNCUj/AfMC1V+iakdEVtu85QA7LGS5Ar0NAlTN4VDew0O8U
         Gcmw==
X-Forwarded-Encrypted: i=1; AJvYcCVcmwYMIfWCju2/SX7h4bF4n6rk3nTizk92ebSmpcqg8UK6Hh/oM/JIxicjZvNKUYCuRU4QNhBBoHh449pBePc0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3UuUjhbzXzMHGPDr/aZW71uKz6pGa5qyL7Ns8yBN9eav67biQ
	iPw7IVvwp990nent+hyFRsdTrSrUsFAQrnahklHVTYElCcB6kUZvVw//DM2j8GYGlKZ8uE9e9lz
	yUW3gTqfQegCG0wHy2wZw6ovwDhfkZ/I=
X-Gm-Gg: ASbGncuqRjzO8IW+LRbw3OGDI1C+6Xfqu/yQi9ukzer/ks4ztJMs/pJQHNRE/idVIzy
	OQG2ZxEbqDeHWokyfGumNmTfghi2T9N7Y97bMSRqNGB6AgUGrhCTYiSbpcFr68OMCjqvfkmK8er
	piEVpYVz1IhBd2J0mqWdRelhqdcF5bTmPbmA==
X-Google-Smtp-Source: AGHT+IH7iQQzVbWRey+QVYxMnupo0p0BVOmLHugayup+weA+w9NRvWE805nPWIhB2+xWOnSRHFrHqkxwxCGevdgKWDU=
X-Received: by 2002:a05:6102:739:b0:4e1:441d:be9f with SMTP id
 ada2fe7eead31-4e1441dc0c2mr5642964137.2.1747642694691; Mon, 19 May 2025
 01:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250519074824.42909-1-dev.jain@arm.com> <20250519074824.42909-4-dev.jain@arm.com>
In-Reply-To: <20250519074824.42909-4-dev.jain@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 19 May 2025 20:18:03 +1200
X-Gm-Features: AX0GCFvtQEnIeYLu9V7MLy8rbigOz441xQQIk4cZgyQblXwGOW5lgY58IQJJ0lQ
Message-ID: <CAGsJ_4yY7OXm68vLvWL1Oh=315jR5bX4BDKsaKrqKhEfxVdibg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm: Optimize mprotect() by PTE batching
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, 
	anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com, 
	ioworker0@gmail.com, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, 
	christophe.leroy@csgroup.eu, yangyicong@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, hughd@google.com, 
	yang@os.amperecomputing.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_011816_150612_B390688F 
X-CRM114-Status: GOOD (  38.07  )
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

On Mon, May 19, 2025 at 7:49=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Use folio_pte_batch to batch process a large folio. Reuse the folio from =
prot_numa
> case if possible. Since modify_prot_start_ptes() gathers access/dirty bit=
s,
> it lets us batch around pte_needs_flush() (for parisc, the definition inc=
ludes
> the access bit).
> For all cases other than the PageAnonExclusive case, if the case holds tr=
ue
> for one pte in the batch, one can confirm that that case will hold true f=
or
> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pas=
s
> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty and ac=
cess bits
> across the batch, therefore batching across pte_dirty(): this is correct =
since
> the dirty bit on the PTE really is just an indication that the folio got =
written
> to, so even if the PTE is not actually dirty (but one of the PTEs in the =
batch is),
> the wp-fault optimization can be made.
> The crux now is how to batch around the PageAnonExclusive case; we must c=
heck
> the corresponding condition for every single page. Therefore, from the la=
rge
> folio batch, we process sub batches of ptes mapping pages with the same P=
ageAnonExclusive
> condition, and process that sub batch, then determine and process the nex=
t sub batch,
> and so on. Note that this does not cause any extra overhead; if suppose t=
he size of
> the folio batch is 512, then the sub batch processing in total will take =
512 iterations,
> which is the same as what we would have done before.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/mm.h |   7 ++-
>  mm/mprotect.c      | 126 +++++++++++++++++++++++++++++++++++----------
>  2 files changed, 104 insertions(+), 29 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 43748c8f3454..7d5b96f005dc 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2542,8 +2542,11 @@ int get_cmdline(struct task_struct *task, char *bu=
ffer, int buflen);
>  #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>                                             MM_CP_UFFD_WP_RESOLVE)
>
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long a=
ddr,
> -                            pte_t pte);
> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long =
addr,
> +                            pte_t pte, int max_len, int *len);
> +#define can_change_pte_writable(vma, addr, pte)        \
> +       can_change_ptes_writable(vma, addr, pte, 1, NULL)
> +
>  extern long change_protection(struct mmu_gather *tlb,
>                               struct vm_area_struct *vma, unsigned long s=
tart,
>                               unsigned long end, unsigned long cp_flags);
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 124612ce3d24..6cd8cdc168fa 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -40,25 +40,36 @@
>
>  #include "internal.h"
>
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long a=
ddr,
> -                            pte_t pte)
> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long =
addr,
> +                            pte_t pte, int max_len, int *len)
>  {
>         struct page *page;
> +       bool temp_ret;
> +       bool ret;
> +       int i;
>
> -       if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
> -               return false;
> +       if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE))) {
> +               ret =3D false;
> +               goto out;
> +       }
>
>         /* Don't touch entries that are not even readable. */
> -       if (pte_protnone(pte))
> -               return false;
> +       if (pte_protnone(pte)) {
> +               ret =3D false;
> +               goto out;
> +       }
>
>         /* Do we need write faults for softdirty tracking? */
> -       if (pte_needs_soft_dirty_wp(vma, pte))
> -               return false;
> +       if (pte_needs_soft_dirty_wp(vma, pte)) {
> +               ret =3D false;
> +               goto out;
> +       }
>
>         /* Do we need write faults for uffd-wp tracking? */
> -       if (userfaultfd_pte_wp(vma, pte))
> -               return false;
> +       if (userfaultfd_pte_wp(vma, pte)) {
> +               ret =3D false;
> +               goto out;
> +       }
>
>         if (!(vma->vm_flags & VM_SHARED)) {
>                 /*
> @@ -68,7 +79,19 @@ bool can_change_pte_writable(struct vm_area_struct *vm=
a, unsigned long addr,
>                  * any additional checks while holding the PT lock.
>                  */
>                 page =3D vm_normal_page(vma, addr, pte);
> -               return page && PageAnon(page) && PageAnonExclusive(page);
> +               ret =3D (page && PageAnon(page) && PageAnonExclusive(page=
));
> +               if (!len)
> +                       return ret;
> +
> +               /* Check how many consecutive pages are AnonExclusive or =
not */
> +               for (i =3D 1; i < max_len; ++i) {
> +                       ++page;
> +                       temp_ret =3D (page && PageAnon(page) && PageAnonE=
xclusive(page));
> +                       if (temp_ret !=3D ret)

Do we really need to do PageAnon for each subpage which is:
folio_test_anon(page_folio(page))

since we have checked subpage[0] ?

> +                               break;
> +               }
> +               *len =3D i;
> +               return ret;
>         }
>
>         VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
> @@ -80,21 +103,55 @@ bool can_change_pte_writable(struct vm_area_struct *=
vma, unsigned long addr,
>          * FS was already notified and we can simply mark the PTE writabl=
e
>          * just like the write-fault handler would do.
>          */
> -       return pte_dirty(pte);
> +       ret =3D pte_dirty(pte);
> +
> +out:
> +       /* The entire batch is guaranteed to have the same return value *=
/
> +       if (len)
> +               *len =3D max_len;
> +       return ret;
>  }
>
>  static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t=
 *ptep,
> -               pte_t pte, int max_nr_ptes)
> +               pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)
>  {
> -       const fpb_t flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +       fpb_t flags =3D FPB_IGNORE_DIRTY;
>
> -       if (!folio_test_large(folio) || (max_nr_ptes =3D=3D 1))
> +       if (ignore_soft_dirty)
> +               flags |=3D FPB_IGNORE_SOFT_DIRTY;
> +
> +       if (!folio || !folio_test_large(folio) || (max_nr_ptes =3D=3D 1))
>                 return 1;
>
>         return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags=
,
>                                NULL, NULL, NULL);
>  }
>
> +/**
> + * modify_sub_batch - Identifies a sub-batch which has the same return v=
alue
> + * of can_change_pte_writable(), from within a folio batch. max_len is t=
he
> + * max length of the possible sub-batch. sub_batch_idx is the offset fro=
m
> + * the start of the original folio batch.
> + */
> +static int modify_sub_batch(struct vm_area_struct *vma, struct mmu_gathe=
r *tlb,
> +               unsigned long addr, pte_t *ptep, pte_t oldpte, pte_t pten=
t,
> +               int max_len, int sub_batch_idx)
> +{
> +       unsigned long new_addr =3D addr + sub_batch_idx * PAGE_SIZE;
> +       pte_t new_oldpte =3D pte_advance_pfn(oldpte, sub_batch_idx);
> +       pte_t new_ptent =3D pte_advance_pfn(ptent, sub_batch_idx);
> +       pte_t *new_ptep =3D ptep + sub_batch_idx;
> +       int len =3D 1;
> +
> +       if (can_change_ptes_writable(vma, new_addr, new_ptent, max_len, &=
len))
> +               new_ptent =3D pte_mkwrite(new_ptent, vma);
> +
> +       modify_prot_commit_ptes(vma, new_addr, new_ptep, new_oldpte, new_=
ptent, len);
> +       if (pte_needs_flush(new_oldpte, new_ptent))
> +               tlb_flush_pte_range(tlb, new_addr, len * PAGE_SIZE);
> +       return len;
> +}
> +
>  static long change_pte_range(struct mmu_gather *tlb,
>                 struct vm_area_struct *vma, pmd_t *pmd, unsigned long add=
r,
>                 unsigned long end, pgprot_t newprot, unsigned long cp_fla=
gs)
> @@ -106,7 +163,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>         bool prot_numa =3D cp_flags & MM_CP_PROT_NUMA;
>         bool uffd_wp =3D cp_flags & MM_CP_UFFD_WP;
>         bool uffd_wp_resolve =3D cp_flags & MM_CP_UFFD_WP_RESOLVE;
> -       int nr_ptes;
> +       int sub_batch_idx, max_len, len, nr_ptes;
>
>         tlb_change_page_size(tlb, PAGE_SIZE);
>         pte =3D pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
> @@ -121,10 +178,12 @@ static long change_pte_range(struct mmu_gather *tlb=
,
>         flush_tlb_batched_pending(vma->vm_mm);
>         arch_enter_lazy_mmu_mode();
>         do {
> +               sub_batch_idx =3D 0;
>                 nr_ptes =3D 1;
>                 oldpte =3D ptep_get(pte);
>                 if (pte_present(oldpte)) {
>                         int max_nr_ptes =3D (end - addr) >> PAGE_SHIFT;
> +                       struct folio *folio =3D NULL;
>                         pte_t ptent;
>
>                         /*
> @@ -132,7 +191,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>                          * pages. See similar comment in change_huge_pmd.
>                          */
>                         if (prot_numa) {
> -                               struct folio *folio;
>                                 int nid;
>                                 bool toptier;
>
> @@ -180,7 +238,8 @@ static long change_pte_range(struct mmu_gather *tlb,
>                                     toptier) {
>  skip_batch:
>                                         nr_ptes =3D mprotect_batch(folio,=
 addr, pte,
> -                                                                oldpte, =
max_nr_ptes);
> +                                                                oldpte, =
max_nr_ptes,
> +                                                                true);
>                                         continue;
>                                 }
>                                 if (folio_use_access_time(folio))
> @@ -188,6 +247,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>                                                 jiffies_to_msecs(jiffies)=
);
>                         }
>
> +                       if (!folio)
> +                               folio =3D vm_normal_folio(vma, addr, oldp=
te);
> +
> +                       nr_ptes =3D mprotect_batch(folio, addr, pte, oldp=
te,
> +                                                max_nr_ptes, false);
>                         oldpte =3D modify_prot_start_ptes(vma, addr, pte,=
 nr_ptes);
>                         ptent =3D pte_modify(oldpte, newprot);
>
> @@ -209,15 +273,23 @@ static long change_pte_range(struct mmu_gather *tlb=
,
>                          * example, if a PTE is already dirty and no othe=
r
>                          * COW or special handling is required.
>                          */
> -                       if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> -                           !pte_write(ptent) &&
> -                           can_change_pte_writable(vma, addr, ptent))
> -                               ptent =3D pte_mkwrite(ptent, vma);
> -
> -                       modify_prot_commit_ptes(vma, addr, pte, oldpte, p=
tent, nr_ptes);
> -                       if (pte_needs_flush(oldpte, ptent))
> -                               tlb_flush_pte_range(tlb, addr, PAGE_SIZE)=
;
> -                       pages++;
> +                       if (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) {
> +                               max_len =3D nr_ptes;
> +                               while (sub_batch_idx < nr_ptes) {
> +
> +                                       /* Get length of sub batch */
> +                                       len =3D modify_sub_batch(vma, tlb=
, addr, pte,
> +                                                              oldpte, pt=
ent, max_len,
> +                                                              sub_batch_=
idx);
> +                                       sub_batch_idx +=3D len;
> +                                       max_len -=3D len;
> +                               }
> +                       } else {
> +                               modify_prot_commit_ptes(vma, addr, pte, o=
ldpte, ptent, nr_ptes);
> +                               if (pte_needs_flush(oldpte, ptent))
> +                                       tlb_flush_pte_range(tlb, addr, nr=
_ptes * PAGE_SIZE);
> +                       }
> +                       pages +=3D nr_ptes;
>                 } else if (is_swap_pte(oldpte)) {
>                         swp_entry_t entry =3D pte_to_swp_entry(oldpte);
>                         pte_t newpte;
> --
> 2.30.2
>

Thanks
barry

