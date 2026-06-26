Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62F0CDE00C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ya9r+sejhkuGFLbbHO9nWdEzjVEexGgZ9zOkP5ReoPg=; b=JFYXTPlHHFAPyOFyjtOtrmc/Un
	K7Q2e8x7+TbLqbVPkBDVJpd2G3T5ZNtaneDFzv9t0on0bifAzk+qSNesso+O/Q7ll63UbMNThXniz
	YUxovRxCjn1a1iV4MOfXvQ7cBp41S3vauEaX3riEgPqWzmjW5aJeZkjSFFn1irVPFEYy9qWVgRBN2
	XtVYCvQKKfIRe0PztsDSr+IVyWD5wJKbcxhmYYYYkzaA2PH6AFW/VMzCrLoLwPQbzxPbXk32dVCKf
	apKVUCYDZAMv6CoqwlgeWiwX3U7b8apjua9Gba3Ax4kWpabp9Kut0tXPxK+YJkSKrlLSsoPGeuKkb
	RrVO+I5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4RK-0000000BBCU-0mtA;
	Fri, 26 Jun 2026 11:09:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4RJ-0000000BBCJ-0846
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 11:09:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E19A4445A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 11:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6290A1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782472180;
	bh=ya9r+sejhkuGFLbbHO9nWdEzjVEexGgZ9zOkP5ReoPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ad89k8LakY0gQ+ppeRw0AEAUXT7nuF2a+vyTu8iezaBf/YL5EL2PJV4Zt0zqoDZZ3
	 MqF8xaEgQTvhw64+8DwXf+vueRwXX4Ig7OX/HQrtCxteUVGnxv1iKJ096YEOoSY434
	 TIrfzNDs3KRtlxT6vCdEvCGbQiY5a9zyQTSnbfMBlAVicI2xzn5bCba9SdKj3fpnOW
	 KJmDKtVyi1TBAMRr+yV7QC8OhHCfZfUSfOGvT+tfsX5KREBz67QouJjGCF4jTZ4D1x
	 F1imaXpmwlKcGQ0qKs6r6hSgzUnKKRa2JUahB+LwlTCpk9NJZsQk5SALges6gDVhmP
	 xJH48Vw8pE6Rg==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-91562bf6c12so100789885a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 04:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JUowO7kxhH0g5cerdTZEJUySJK+IbSu7y4xpZuSog9YsY+51ExE17Dapug2FGKZdHln9K6fR3rxZ3iO/0IOSw@lists.infradead.org
X-Gm-Message-State: AOJu0YzylTaOua4GqQE4Pi6GPBcmB+ybB3S2dvWUmho2bLlYkaAy0a2V
	qJCnFIDcWoeWlnPL55r1okGK2vJxl5CmMAHgy6UO7mDh0h6+isULoOJdfSQkbo1AsceY0uiWar+
	wwaA82euOPIyJhdMTDnJDLaNYAbDyD/8=
X-Received: by 2002:a05:620a:8396:b0:911:1a2c:f953 with SMTP id
 af79cd13be357-9293aea0081mr965857685a.20.1782472179730; Fri, 26 Jun 2026
 04:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com> <a6e410bd-7413-45f0-9033-a60cd5386512@arm.com>
In-Reply-To: <a6e410bd-7413-45f0-9033-a60cd5386512@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 26 Jun 2026 19:09:28 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w2N3Eo6PABhOvR_DsJUM2NNoNU=gG3O9AO+fv3rBs_1A@mail.gmail.com>
X-Gm-Features: AVVi8CdUISxG9j0fnCP2O4vacBi4CaJhMiEpwawXnrJPak73HEB-fJixal9lNBM
Message-ID: <CAGsJ_4w2N3Eo6PABhOvR_DsJUM2NNoNU=gG3O9AO+fv3rBs_1A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Dev Jain <dev.jain@arm.com>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com, 
	Xueyuan.chen21@gmail.com, rppt@kernel.org, david@kernel.org, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com, 
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 25, 2026 at 2:37=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 18/06/26 2:17 pm, Wen Jiang wrote:
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > is physically fully or partially contiguous. Two techniques are used:
> >
> > 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
> >    segments
> > 2. Use batched mappings wherever possible in both vmalloc and ARM64
> >    layers
> >
> > Besides accelerating the mapping path, this also enables large
> > mappings (PMD and cont-PTE) for vmap, which are currently not
> > supported.
> >
> > Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
> > CONT-PTE regions instead of just one.
> >
> > Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
> > mapping logic between the ioremap and vmalloc/vmap paths, handling both
> > CONT_PTE and regular PTE mappings. This prepares for the next patch.
> >
> > Patch 4 extends the page table walk path to support page shifts other
> > than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
> > mappings. The function is renamed from vmap_small_pages_range_noflush()
> > to vmap_pages_range_noflush_walk().
> >
> > Patches 5-6 add huge vmap support for contiguous pages, including
> > support for non-compound pages with pfn alignment verification.
> >
> > On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> > the performance CPUfreq policy enabled, benchmark results:
> >
> > * ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
> > * vmalloc(1 MB) mapping time (excluding allocation) with
> >   VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
> > * vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)
> >
> > Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.
> >
>
> I am still a little nervous about doing vmap-huge by default.
>
> We can play set_memory_* games on a vmap huge mapping partially, thus
> forcing a pgtable split, and not all arches can handle a kernel pgtable
> split.
>
> For arm64, we can handle that with BBML2_NOABORT, but interestingly, in
> change_memory_common, arch/arm64/mm/pageattr.c:
>
>         area =3D find_vm_area((void *)addr);
>         if (!area ||
>             ((unsigned long)kasan_reset_tag((void *)end) >
>              (unsigned long)kasan_reset_tag(area->addr) + area->size) ||
>             ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) !=3D VM_ALLO=
C))
>                 return -EINVAL;
>
> Even before my change fcf8dda8cc48, we were bailing out on
>
> !(area->flags & VM_ALLOC))
>
> So on arm64 we haven't been supporting set_memory_* for vmap memory at al=
l, because
> it has VM_MAP set and not VM_ALLOC. Although we have a contradictory comm=
ent above
> this code so not sure if this was intentional:
>
> "Let's restrict ourselves to mappings created by vmalloc (or vmap)."
>
>
> So either there is no user in the kernel doing vmap + set_memory_* (looks=
 like it
> by doing an LLM scan), or it is not fatal for set_memory_* to fail.

Hi Dev,

The primary purpose of vmap() is to provide the CPU with a
virtual mapping to access memory used by device drivers,
followed by the appropriate cache synchronization with the
device when necessary.

Given that, I think it's technically quite questionable to use
set_memory_xxx() to change the page table attributes of a vmap
area, especially for only part of an existing vmap mapping.

>
> But even if no one does it now, technically the API allows it.

In case we ever run into the rather subtle case where someone
calls set_memory_xxx() on a vmap() mapping, are you
suggesting that VM_ALLOW_HUGE_VMAP should also apply to
vmap(), rather than only vmalloc()?
something like the concept below?
index 14e5a6f6cc76..204770474c60 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3559,13 +3559,15 @@ static inline unsigned int vm_shift(pgprot_t
prot, unsigned long size)
 }

 static inline int get_vmap_batch_order(struct page **pages,
-               pgprot_t prot, unsigned int max_steps, unsigned int idx)
+               unsigned long flags, pgprot_t prot, unsigned int
max_steps, unsigned int idx)
 {
        unsigned int nr_contig;
        int order;

        if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
                return 0;
+       if (!(flags & VM_ALLOW_HUGE_VMAP))
+               return 0;

        nr_contig =3D num_pages_contiguous(&pages[idx], max_steps);
        if (nr_contig < 2)
@@ -3583,7 +3585,7 @@ static inline int get_vmap_batch_order(struct
page **pages,
 }

 static int vmap_batched(unsigned long addr, unsigned long end,
-               pgprot_t prot, struct page **pages)
+               unsigned long flags, pgprot_t prot, struct page **pages)
 {
        unsigned int count =3D (end - addr) >> PAGE_SHIFT;
        unsigned int prev_shift =3D 0, idx =3D 0;
@@ -3597,7 +3599,7 @@ static int vmap_batched(unsigned long addr,
unsigned long end,

        for (unsigned int i =3D 0; i < count; ) {
                unsigned int shift =3D PAGE_SHIFT +
-                       get_vmap_batch_order(pages, prot, count - i, i);
+                       get_vmap_batch_order(pages, flags, prot, count - i,=
 i);

                if (!i)
                        prev_shift =3D shift;
@@ -3711,7 +3713,7 @@ void *vmap(struct page **pages, unsigned int count,
                return NULL;

        addr =3D (unsigned long)area->addr;
-       if (vmap_batched(addr, addr + size, pgprot_nx(prot),
+       if (vmap_batched(addr, addr + size, flags, pgprot_nx(prot),
                                pages) < 0) {
                vunmap(area->addr);
                return NULL;

I feel it's unnecessary, given that kvmalloc() already
always uses VM_ALLOW_HUGE_VMAP which will fail
set_memory_xxx() as you mentioned.
kvmalloc() is already a generic memory allocation API.

        /*
         * kvmalloc() can always use VM_ALLOW_HUGE_VMAP,
         * since the callers already cannot assume anything
         * about the resulting pointer, and cannot play
         * protection games.
         */
        return __vmalloc_node_range_noprof(size, align, VMALLOC_START,
VMALLOC_END,
                        flags, PAGE_KERNEL, allow_block ? VM_ALLOW_HUGE_VMA=
P:0,
                        node, __builtin_return_address(0));

Best Regards
Barry

