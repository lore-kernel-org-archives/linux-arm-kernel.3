Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C62FD5F78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 05:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neJ/GKtjb58QMYECRReU/bO0EFSkBS+um+/wTL9xxDY=; b=QDnKrioxasVdqZR5Xe8xU8tUoW
	2o3tKEzwhFuAUODNwQOIT4/be4bySKPsZ5yne5F820HvOjfcrHlJC6jWQd6R0TKUkDz4bRAVb7fYx
	cdql4Fdv4q43A9zr3RE6Rubg/2jhHahxbAFVY2cl1hMOsaZnqOu9Jo5v3Crnxdb4TgTZpicoJazzu
	FIL6N6KCjuRsB4u3Aoo8hisdn1TPu8uYr1L2PMi8orgNewA4qzdQGUA3SYceeEINcHzmOltcLCtMA
	ml4GjoVKinzpbC2adzY6Wscxiaoqp3Jw8xd/R8ileBASiJm37jT+KL0Jy4zWV5Mqj7o6wuwHpQvAb
	zNPeiRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wALDL-00000008H7B-1VtT;
	Wed, 08 Apr 2026 05:12:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wALDI-00000008H6m-2IyG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 05:12:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBE5043C28
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 05:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB77C19424
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 05:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775625147;
	bh=1bV2vvBKDGGRXH/+AVVCsAGHYI7nCauIoIuB3DkJz7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d/rnlNTV5ffsFHlS4LNJxFqPMV9TQwEZPykdn4L7LRJOox/iXQTuF22gbumZTQZbp
	 jlbXQg52NedRa29SXwO4w6mya8S2qSU+bmyfIkIiZrEs0VXCfR+MWnZ4gk3VvUrrOb
	 pT5/LD+keIec0a7h6eJrmr+vJGNxJlWqMnJ7VOM3qDu2tMK6ZtdRTxtt3NipC14ajZ
	 P6R6Nv+VWhOlAmczPT/rTS2pX2vL9OpzTdg29DFAoG5fItthjFop3HxWshrzqWabQk
	 D10X4RYgiA5ApTaM4tNWVofN+zELyWPJ0bPuqvKihSETCWST5KXTVvGMEiHbOogInu
	 yv+oAEsraQrdA==
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a05c388b27so111807386d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 22:12:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2B6wtfebpU9abR640lhovvaxaOZfijEKymJI/+MiuwLeRlG9bsA7eZMRSTVtV7dMH+ELIiPzOqCtL6lFA1/A7@lists.infradead.org
X-Gm-Message-State: AOJu0YzzX5a8edGqoi578eswlcPOv/4SgU5mfxI+T7xXmBZuq5+S4WyE
	U2KrmrwCoVjARWr6rUNzNRbpqW/vPJZDNYNWO/e/5oWdpUvIu3auEXe07A0Xly8aZRG9KumRuvB
	4DgyTaPGRUKQSPSlvN4J+TkoZxAPkLgs=
X-Received: by 2002:a05:6214:212b:b0:89a:ff2:b8cf with SMTP id
 6a1803df08f44-8a7046df1f0mr323079226d6.44.1775625145985; Tue, 07 Apr 2026
 22:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-6-baohua@kernel.org>
 <b297383a-731c-4efa-95b7-0f198b098d11@arm.com>
In-Reply-To: <b297383a-731c-4efa-95b7-0f198b098d11@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 8 Apr 2026 13:12:14 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xCtFe=5ofj4FW6cqu-fgR+K9BM7FPZRdAWOGP3YKtNzQ@mail.gmail.com>
X-Gm-Features: AQROBzBupWrjwY7intWq5A_SlPJS8N_3bOz8PdEQF8tDX-ZW2xXsYcoJ6gZ70D0
Message-ID: <CAGsJ_4xCtFe=5ofj4FW6cqu-fgR+K9BM7FPZRdAWOGP3YKtNzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org, 
	Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_221228_651097_52D83349 
X-CRM114-Status: GOOD (  37.49  )
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

On Wed, Apr 8, 2026 at 12:20=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> > In many cases, the pages passed to vmap() may include high-order
> > pages allocated with __GFP_COMP flags. For example, the systemheap
> > often allocates pages in descending order: order 8, then 4, then 0.
> > Currently, vmap() iterates over every page individually=E2=80=94even pa=
ges
> > inside a high-order block are handled one by one.
> >
> > This patch detects high-order pages and maps them as a single
> > contiguous block whenever possible.
> >
> > An alternative would be to implement a new API, vmap_sg(), but that
> > change seems to be large in scope.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
>
> Coincidentally, I was working on the same thing :)

Interesting, thanks =E2=80=94 at least I=E2=80=99ve got one good reviewer :=
-)

>
> We have a usecase regarding Arm TRBE and SPE aux buffers.
>
> I'll take a look at your patches later, but my implementation is the

Yes. Please.


> following, if you have any comments. I have squashed the patches into
> a single diff.

Thanks very much, Dev. What you=E2=80=99ve done is quite similar to
patches 5/8 and 6/8, although the code differs somewhat.

>
>
>
> From ccb9670a52b7f50b1f1e07b579a1316f76b84811 Mon Sep 17 00:00:00 2001
> From: Dev Jain <dev.jain@arm.com>
> Date: Thu, 26 Feb 2026 16:21:29 +0530
> Subject: [PATCH] arm64/perf: map AUX buffer with large pages
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  .../hwtracing/coresight/coresight-etm-perf.c  |  3 +-
>  drivers/hwtracing/coresight/coresight-trbe.c  |  3 +-
>  drivers/perf/arm_spe_pmu.c                    |  5 +-
>  mm/vmalloc.c                                  | 86 ++++++++++++++++---
>  4 files changed, 79 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/h=
wtracing/coresight/coresight-etm-perf.c
> index 72017dcc3b7f1..e90a430af86bb 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -984,7 +984,8 @@ int __init etm_perf_init(void)
>
>         etm_pmu.capabilities            =3D (PERF_PMU_CAP_EXCLUSIVE |
>                                            PERF_PMU_CAP_ITRACE |
> -                                          PERF_PMU_CAP_AUX_PAUSE);
> +                                          PERF_PMU_CAP_AUX_PAUSE |
> +                                          PERF_PMU_CAP_AUX_PREFER_LARGE)=
;
>
>         etm_pmu.attr_groups             =3D etm_pmu_attr_groups;
>         etm_pmu.task_ctx_nr             =3D perf_sw_context;
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtra=
cing/coresight/coresight-trbe.c
> index 1511f8eb95afb..74e6ad891e236 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -760,7 +760,8 @@ static void *arm_trbe_alloc_buffer(struct coresight_d=
evice *csdev,
>         for (i =3D 0; i < nr_pages; i++)
>                 pglist[i] =3D virt_to_page(pages[i]);
>
> -       buf->trbe_base =3D (unsigned long)vmap(pglist, nr_pages, VM_MAP, =
PAGE_KERNEL);
> +       buf->trbe_base =3D (unsigned long)vmap(pglist, nr_pages,
> +                        VM_MAP | VM_ALLOW_HUGE_VMAP, PAGE_KERNEL);
>         if (!buf->trbe_base) {
>                 kfree(pglist);
>                 kfree(buf);
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index dbd0da1116390..90c349fd66b2c 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -1027,7 +1027,7 @@ static void *arm_spe_pmu_setup_aux(struct perf_even=
t *event, void **pages,
>         for (i =3D 0; i < nr_pages; ++i)
>                 pglist[i] =3D virt_to_page(pages[i]);
>
> -       buf->base =3D vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
> +       buf->base =3D vmap(pglist, nr_pages, VM_MAP | VM_ALLOW_HUGE_VMAP,=
 PAGE_KERNEL);
>         if (!buf->base)
>                 goto out_free_pglist;
>
> @@ -1064,7 +1064,8 @@ static int arm_spe_pmu_perf_init(struct arm_spe_pmu=
 *spe_pmu)
>         spe_pmu->pmu =3D (struct pmu) {
>                 .module =3D THIS_MODULE,
>                 .parent         =3D &spe_pmu->pdev->dev,
> -               .capabilities   =3D PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP=
_ITRACE,
> +               .capabilities   =3D PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP=
_ITRACE |
> +                                 PERF_PMU_CAP_AUX_PREFER_LARGE,
>                 .attr_groups    =3D arm_spe_pmu_attr_groups,
>                 /*
>                  * We hitch a ride on the software context here, so that
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 61caa55a44027..8482463d41203 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -660,14 +660,14 @@ int __vmap_pages_range_noflush(unsigned long addr, =
unsigned long end,
>                 pgprot_t prot, struct page **pages, unsigned int page_shi=
ft)
>  {
>         unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
> -
> +       unsigned long step =3D 1UL << (page_shift - PAGE_SHIFT);
>         WARN_ON(page_shift < PAGE_SHIFT);
>
>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
>                         page_shift =3D=3D PAGE_SHIFT)
>                 return vmap_small_pages_range_noflush(addr, end, prot, pa=
ges);
>
> -       for (i =3D 0; i < nr; i +=3D 1U << (page_shift - PAGE_SHIFT)) {
> +       for (i =3D 0; i < ALIGN_DOWN(nr, step); i +=3D step) {
>                 int err;
>
>                 err =3D vmap_range_noflush(addr, addr + (1UL << page_shif=
t),
> @@ -678,8 +678,9 @@ int __vmap_pages_range_noflush(unsigned long addr, un=
signed long end,
>
>                 addr +=3D 1UL << page_shift;
>         }
> -
> -       return 0;
> +       if (IS_ALIGNED(nr, step))
> +               return 0;
> +       return vmap_small_pages_range_noflush(addr, end, prot, pages + i)=
;
>  }
>
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> @@ -3514,6 +3515,50 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>
> +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> +{
> +       if (arch_vmap_pmd_supported(prot) && size >=3D PMD_SIZE)
> +               return PMD_SHIFT;
> +
> +       return arch_vmap_pte_supported_shift(size);
> +}
> +
> +static inline int __vmap_huge(struct page **pages, pgprot_t prot,
> +               unsigned long addr, unsigned int count)
> +{
> +       unsigned int i =3D 0;
> +       unsigned int shift;
> +       unsigned long nr;
> +
> +       while (i < count) {
> +               nr =3D num_pages_contiguous(pages + i, count - i);
> +               shift =3D vm_shift(prot, nr << PAGE_SHIFT);
> +               if (vmap_pages_range(addr, addr + (nr << PAGE_SHIFT),
> +                                    pgprot_nx(prot), pages + i, shift) <=
 0) {
> +                       return 1;
> +               }

One observation on my side is that the performance gain is somewhat
offset by page table zigzagging caused by what you are doing here -
iterating each mem segment by vmap_pages_range() .

In patch 3/8, I enhanced vmap_small_pages_range_noflush() to
avoid repeated pgd =E2=86=92 p4d =E2=86=92 pud =E2=86=92 pmd =E2=86=92 pte =
traversals for page
shifts other than PAGE_SHIFT. This improves performance for
vmalloc as well as vmap(). Then, in patch 7/8, I adopt the new
vmap_small_pages_range_noflush() and eliminate the iteration.

> +               i +=3D nr;
> +               addr +=3D (nr << PAGE_SHIFT);
> +       }
> +       return 0;
> +}
> +
> +static unsigned long max_contiguous_stride_order(struct page **pages,
> +               pgprot_t prot, unsigned int count)
> +{
> +       unsigned long max_shift =3D PAGE_SHIFT;
> +       unsigned int i =3D 0;
> +
> +       while (i < count) {
> +               unsigned long nr =3D num_pages_contiguous(pages + i, coun=
t - i);
> +               unsigned long shift =3D vm_shift(prot, nr << PAGE_SHIFT);
> +
> +               max_shift =3D max(max_shift, shift);
> +               i +=3D nr;
> +       }
> +       return max_shift;
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3552,15 +3597,32 @@ void *vmap(struct page **pages, unsigned int coun=
t,
>                 return NULL;
>
>         size =3D (unsigned long)count << PAGE_SHIFT;
> -       area =3D get_vm_area_caller(size, flags, __builtin_return_address=
(0));
> +       if (flags & VM_ALLOW_HUGE_VMAP) {
> +               /* determine from page array, the max alignment */
> +               unsigned long max_shift =3D max_contiguous_stride_order(p=
ages, prot, count);
> +
> +               area =3D __get_vm_area_node(size, 1 << max_shift, max_shi=
ft, flags,
> +                                         VMALLOC_START, VMALLOC_END, NUM=
A_NO_NODE,
> +                                         GFP_KERNEL, __builtin_return_ad=
dress(0));
> +       } else {
> +               area =3D get_vm_area_caller(size, flags, __builtin_return=
_address(0));
> +       }
>         if (!area)
>                 return NULL;
>
>         addr =3D (unsigned long)area->addr;
> -       if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> -                               pages, PAGE_SHIFT) < 0) {
> -               vunmap(area->addr);
> -               return NULL;
> +
> +       if (flags & VM_ALLOW_HUGE_VMAP) {
> +               if (__vmap_huge(pages, prot, addr, count)) {
> +                       vunmap(area->addr);
> +                       return NULL;
> +               }
> +       } else {
> +               if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> +                                       pages, PAGE_SHIFT) < 0) {
> +                       vunmap(area->addr);
> +                       return NULL;
> +               }
>         }
>
>         if (flags & VM_MAP_PUT_PAGES) {
> @@ -4011,11 +4073,7 @@ void *__vmalloc_node_range_noprof(unsigned long si=
ze, unsigned long align,
>                  * their allocations due to apply_to_page_range not
>                  * supporting them.
>                  */
> -
> -               if (arch_vmap_pmd_supported(prot) && size >=3D PMD_SIZE)
> -                       shift =3D PMD_SHIFT;
> -               else
> -                       shift =3D arch_vmap_pte_supported_shift(size);
> +               shift =3D vm_shift(prot, size);

What I actually did is different. In patches 1/8 and 2/8, I
extended the arm64 levels to support N * CONT_PTE, and let the
final PTE mapping use the maximum possible batch after avoiding
zigzag. This further improves all orders greater than CONT_PTE.

Thanks
Barry

