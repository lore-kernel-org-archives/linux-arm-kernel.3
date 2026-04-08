Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8474D1073C8D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICCkp+ssxnVDS7PelgR7/bwxLqKRQM1AQHruCs+Hg8M=; b=gftI6/UZKyoYB1damWG89258gf
	M5XPmRQRHHzmB4Pw5NgFD94CKJ6cH6+DdCkPbqSwQhXS6pY5OZeo68QQA3dzAd+v3AUEV4DoD1oCI
	mZzigSr1wPb6EHakgnRyxl3hU23MjX5NbKCjNvpipaJoY6BtrsTYUlxOxTzcUCy/rdKevMd/GKn9O
	q9Yy7zZDG8lOVTP16iAGJK7nZut+ZA4nTEYdYxmtRfv3dL0xX4TnShKd95NWY53ra3ste8tZYgnv8
	cnB6KnBIheg2D01FT4GskOL8AmTaVwLr5T1hQuTNJFYkxXzZQxOACK/lttJLn9f5gu7c9HS7FO8vk
	vncR9gag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQVF-00000008hu3-1KGE;
	Wed, 08 Apr 2026 10:51:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQVC-00000008hta-3W5w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A887743392
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 10:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814C4C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 10:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775645476;
	bh=QcVIS2KyesCxdmA9sx35zdLvBkk/H6s0DycEBh0eXi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=egaMHIVXJIqqn/x4eQ/1bd8ULWJcXYmRdU+H0NCLohRsrAJEazmKY0nPrlwTIYyxF
	 4yghwkyIG5GbvENTxmlwtaETWj1o/ztEvxok1lw+TstO2VCKR6Kc5KmB94Ndahkx8S
	 i46wvPIWl2USFqMM+5DuTmJ5FHXW2uMeJY7KETUhYFjn/pUDj8kqohTvSsAjPF0nye
	 TtS2A1Uw69O58cEJAKlAckDLmN7rZHap3aarpGA9LRTL9efOmcP8gg8ZWe5BckvSbv
	 TrW0raWt0bdwMlXW0FytWL2LeVustesqPDJeeBARQghRM37ajtaiOZHlzFDWaMuy6D
	 K2c/CrB+izcoA==
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a58057d7baso88632216d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 03:51:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCOmdLKzT2WWxorB/Ti+DO0hgK4mF4ySJEiLzVn/simjn6ZUhsYlXHfDl5dyMTo7RUyzDRlz7+bDoYN8utN2Uq@lists.infradead.org
X-Gm-Message-State: AOJu0YwwpC7jGr3Okdolsk/iJV7Y+vCqdx80pzCzkJSdbNMC9auNbqdl
	qEzKIvtRVKNFMmvmjdLUQEghvErNV/c5Mooe3FMQytnx7Ka1uXvkKzgKUZ5aD1T/U1wzTdlP/G8
	13hATGasz0Uc+D9z6BLGt9esQfRFAMd4=
X-Received: by 2002:a05:6214:21a2:b0:8a5:71c7:9df with SMTP id
 6a1803df08f44-8a704da806fmr347127946d6.50.1775645475735; Wed, 08 Apr 2026
 03:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <1e7427c6-b6e5-4a3a-a600-bef9ac2bf3e0@arm.com>
In-Reply-To: <1e7427c6-b6e5-4a3a-a600-bef9ac2bf3e0@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 8 Apr 2026 18:51:04 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xqxmHWBahN-yX10XcEwaHpvypCkwWDLHMY_1P_SzCeMg@mail.gmail.com>
X-Gm-Features: AQROBzCurKt1V0ceXesm8lVgYpSnbwt2aYbxCH3r48dlXoSU8YdQK1AeC5pWe-c
Message-ID: <CAGsJ_4xqxmHWBahN-yX10XcEwaHpvypCkwWDLHMY_1P_SzCeMg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org, 
	Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_035119_396877_BD90B156 
X-CRM114-Status: GOOD (  24.27  )
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

On Wed, Apr 8, 2026 at 5:14=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory
> > is physically fully or partially contiguous. Two techniques are used:
> >
> > 1. Avoid page table zigzag when setting PTEs/PMDs for multiple memory
> >    segments
> > 2. Use batched mappings wherever possible in both vmalloc and ARM64
> >    layers
> >
> > Patches 1=E2=80=932 extend ARM64 vmalloc CONT-PTE mapping to support mu=
ltiple
> > CONT-PTE regions instead of just one.
> >
> > Patches 3=E2=80=934 extend vmap_small_pages_range_noflush() to support =
page
> > shifts other than PAGE_SHIFT. This allows mapping multiple memory
> > segments for vmalloc() without zigzagging page tables.
> >
> > Patches 5=E2=80=938 add huge vmap support for contiguous pages. This no=
t only
> > improves performance but also enables PMD or CONT-PTE mapping for the
> > vmapped area, reducing TLB pressure.
> >
> > Many thanks to Xueyuan Chen for his substantial testing efforts
> > on RK3588 boards.
> >
> > On the RK3588 8-core ARM64 SoC, with tasks pinned to CPU2 and
> > the performance CPUfreq policy enabled, Xueyuan=E2=80=99s tests report:
> >
> > * ioremap(1 MB): 1.2=C3=97 faster
> > * vmalloc(1 MB) mapping time (excluding allocation) with
> >   VM_ALLOW_HUGE_VMAP: 1.5=C3=97 faster
> > * vmap(): 5.6=C3=97 faster when memory includes some order-8 pages,
> >   with no regression observed for order-0 pages
> >
> > Barry Song (Xiaomi) (8):
> >   arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
> >     setup
> >   arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
> >     CONT_PTE
> >   mm/vmalloc: Extend vmap_small_pages_range_noflush() to support larger
> >     page_shift sizes
> >   mm/vmalloc: Eliminate page table zigzag for huge vmalloc mappings
> >   mm/vmalloc: map contiguous pages in batches for vmap() if possible
> >   mm/vmalloc: align vm_area so vmap() can batch mappings
> >   mm/vmalloc: Coalesce same page_shift mappings in vmap to avoid pgtabl=
e
> >     zigzag
> >   mm/vmalloc: Stop scanning for compound pages after encountering small
> >     pages in vmap
> >
> >  arch/arm64/include/asm/vmalloc.h |   6 +-
> >  arch/arm64/mm/hugetlbpage.c      |  10 ++
> >  mm/vmalloc.c                     | 178 +++++++++++++++++++++++++------
> >  3 files changed, 161 insertions(+), 33 deletions(-)
> >
>
> On Linux VM on Apple M3, running mm-selftests:

Dev, thanks for your report. Sorry for the silly typo=E2=80=94
Xueyuan=E2=80=99s vmalloc/vmap tests don=E2=80=99t trigger that case yet.

it should be fixed by:

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index bf31c11ebd3b..25b9fce1ec6a 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -110,7 +110,7 @@ static inline int num_contig_ptes(unsigned long
size, size_t *pgsize)
                contig_ptes =3D CONT_PTES;
                break;
        default:
-               if (size < CONT_PMD_SIZE && size > 0 &&
+               if (size < PMD_SIZE && size > 0 &&
                                IS_ALIGNED(size, CONT_PTE_SIZE)) {
                        contig_ptes =3D size >> PAGE_SHIFT;
                        *pgsize =3D PAGE_SIZE;
@@ -365,7 +365,7 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int
shift, vm_flags_t flags)
        case CONT_PTE_SIZE:
                return pte_mkcont(entry);
        default:
-               if (pagesize < CONT_PMD_SIZE && pagesize > 0 &&
+               if (pagesize < PMD_SIZE && pagesize > 0 &&
                                IS_ALIGNED(pagesize, CONT_PTE_SIZE))
                        return pte_mkcont(entry);

>
>  ./run_vmtests.sh -t "hugetlb"
>
> TAP version 13
> # -----------------------
> # running ./hugepage-mmap
> # -----------------------
> # TAP version 13
> # 1..1
> # # Returned address is 0xffffe7c00000
>
>
>
> [   30.884630] kernel BUG at mm/page_table_check.c:86!
> [   30.884701] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
> [   30.886803] Modules linked in:
> [   30.887217] CPU: 3 UID: 0 PID: 1869 Comm: hugepage-mmap Not tainted 7.=
0.0-rc5+ #86 PREEMPT
> [   30.888218] Hardware name: linux,dummy-virt (DT)
> [   30.889413] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYP=
E=3D--)
> [   30.889901] pc : page_table_check_clear.part.0+0x128/0x1a0
> [   30.890337] lr : page_table_check_clear.part.0+0x7c/0x1a0
> [   30.890714] sp : ffff800084da3ad0
> [   30.890946] x29: ffff800084da3ad0 x28: 0000000000000001 x27: 001000000=
0000001
> [   30.891434] x26: 0040000000000040 x25: ffffa06bb8fb9000 x24: 00000000f=
fffffff
> [   30.891932] x23: 0000000000000001 x22: 0000000000000000 x21: ffffa06bb=
8997810
> [   30.892514] x20: 0000000000113e39 x19: 0000000000113e38 x18: 000000000=
0000000
> [   30.893007] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000=
0000000
> [   30.893500] x14: ffffa06bb7013780 x13: 0000fffff7f90fff x12: 000000000=
0000000
> [   30.893990] x11: 1fffe0001a1282c1 x10: ffff0000d094160c x9 : ffffa06bb=
568a858
> [   30.894479] x8 : ffff5f95c8474000 x7 : 0000000000000000 x6 : ffff00017=
fffc500
> [   30.894973] x5 : ffff000191208fc0 x4 : 0000000000000000 x3 : 000000000=
0004000
> [   30.895449] x2 : 0000000000000000 x1 : 00000000ffffffff x0 : ffff0000c=
071f1b8
> [   30.895875] Call trace:
> [   30.896027]  page_table_check_clear.part.0+0x128/0x1a0 (P)
> [   30.896369]  page_table_check_clear+0xc8/0x138
> [   30.896776]  __page_table_check_ptes_set+0xe4/0x1e8
> [   30.897073]  __set_ptes_anysz+0x2e4/0x308
> [   30.897327]  set_huge_pte_at+0xec/0x210
> [   30.897561]  hugetlb_no_page+0x1ec/0x8e0
> [   30.897807]  hugetlb_fault+0x188/0x740
> [   30.898036]  handle_mm_fault+0x294/0x2c0
> [   30.898283]  do_page_fault+0x120/0x748
> [   30.898539]  do_translation_fault+0x68/0x90
> [   30.898796]  do_mem_abort+0x4c/0xa8
> [   30.899011]  el0_da+0x2c/0x90
> [   30.899205]  el0t_64_sync_handler+0xd0/0xe8
> [   30.899461]  el0t_64_sync+0x198/0x1a0
> [   30.899688] Code: 91001021 b8f80022 51000441 36fffd41 (d4210000)
> [   30.900053] ---[ end trace 0000000000000000 ]---
>
>
>
> The bug is at
>
> BUG_ON(atomic_dec_return(&ptc->file_map_count) < 0);
>
> My tree is mm-unstable, commit 3fa44141e0bb.
>

Thanks
Barry

