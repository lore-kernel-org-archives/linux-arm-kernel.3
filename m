Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D62C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3jsvYVzwglzJMfEkbvRTmSIJAXcUa+wxxqNcA1GNkcI=; b=X8HV9eJ20kxFfXmJAcA/N8r5Cn
	pghmDtQIIayi3/yNjrZ0ZiuQkNYeiSX0mZXfG5pKDry4zzO27T4MsrUqWd/22biuToOv+aCsJoH4Y
	9xaNDLh/UwZDbO3/UT/g5AZgEBfE7LEZEYwFF58ZpCcW4artD9gbLybV/keqmzBlpIpV0Af+Mfng9
	IE/Kw43vCHf5EOT7djGgfZtCZosw8z4wUUKdji8O53Op7gaUn8xy9CXBoEVyZhVqbxTxRqj8R/123
	1FdMjn4G3ZAy195bRE5aDNaSxsymTML2Cv47JLGDtsRqlV+epTz9QXcLUbwyuXehpWjLqw0p9D+O+
	76uIg7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLC-00000001K0Y-1oQS;
	Thu, 09 Jul 2026 07:38:38 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLA-00000001Jzk-2HWJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:38:37 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84864086bfeso87814b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783582715; x=1784187515; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jsvYVzwglzJMfEkbvRTmSIJAXcUa+wxxqNcA1GNkcI=;
        b=CWfgW3NPf8gF++YunMuJuwyKRXlQKIxcl68bnD06gEwnUNLbK/3f+KHAOmAvz82kXD
         gPkFHcITaKWETw4CdvDCE01Lu3SqZe30tFBEfV+yO6T3sXLr6P/dInzCyWGnVnzA69P7
         y3ReMiIwvjSQu0ICM6ggPS+XRgN495Sv4vwMnNcR5WXJWZNLKST5h4o1KyR4uu6Pn6r5
         jCi9w52bvPEAeRqf0fPozYeidPV2Ov727foGmZls58lLMFKlVdNXXS1mIeOfrENT7W8X
         zNYz640dPkg6TbLkCrP0HaGogoi5U3p73xErd9nYPH9L0HSBrhJDrjN+5PIR7PxrsLa0
         Au7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582715; x=1784187515;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jsvYVzwglzJMfEkbvRTmSIJAXcUa+wxxqNcA1GNkcI=;
        b=r9oSDjhx/7IvzSQrO+mwJH0MJZmZZWLJ4D9eG90DZ4rnWduiXASutcvQ70r8ie0pR0
         pvj1SkT/SmLfhEsRif3v+FIZLfQ0cqxjGgfXP699ntYuid73lHBlgMUEi7WUB0qIUg9h
         iOUABK5UvSwasjDQWXXN+okABIsvz0px/0pLl0UBpeY7K+VAfOH0vQymwogrC9nZVHTx
         esFSokUAFNPYKEE+h6An7xQgeFDVC6W80ZPKfPe1YW1faF4c7jNymwdnSK8P/KRJZ32y
         wqUenzx92jUI5ehOFcjsRw3ta9FZLMwsgeSSPcMpDSCgFyG0AGIav5IUdVqlW/iJV0X0
         J3lw==
X-Forwarded-Encrypted: i=1; AHgh+RpDihAS0JYIFiOvkHtnM7N2BSNipJifTorcSDhSLNbQvEw4zhSGpZEt3pF+e9RkGv44VWYx0LZQlQ4ltR91AtY6@lists.infradead.org
X-Gm-Message-State: AOJu0YwVcNsBPnEFksgNyJAZP9puqvSq0DI2AlAkMVp4WpeLuwliMbMJ
	R41L8Td9r77P21CNOzy5EJFXGhuofdnpKQdBrbjjLy7R913hB9w1DotA
X-Gm-Gg: AfdE7clNL/+qBPhNtTQudcQ6zuM8/46wMAhW7G4SvZTY8nPf7qFIeSFOMSKRcJ1RwSb
	j5RQ9ukyHDGOxQ8W6pzY1F6F4PiFJ4DNkzbhYrjQfA8xnHtbe3y+eqc6OmAyTAIEk/P/r7MBum8
	DDC571z1udE5Yjhzo8I6DxOAieWsgD363O/F7NlQ0LB4lZ2wZR4ZmSjU27jV9LRuaU294TVHuGU
	Npk4LfFVsN7xyqjR9xvVkyJ2XhIr85TZ/L7eMsyXhqoZLw8iTkuplJAScAbT2fR0rXupqo+7L6V
	gfaVRqGvP8FejpEj/6kqzc7ffRwU9cJxd9dYTc2cv/G3LtzZgWShImOSuV/o0HrVht8QuUqaE+B
	BtZoezMlSiJIdM/DcnIX2h15c4wJLYshWW2IUp+fA6jakRiVbhJbdyje1EqT9I8TN4eWH7ToS6D
	ASXXrZmE2h+PyR9VTrvlze7ksfJVXddOIKFy0=
X-Received: by 2002:a05:6a00:a228:b0:847:904c:8452 with SMTP id d2e1a72fcca58-84842fd47edmr5989663b3a.38.1783582715184;
        Thu, 09 Jul 2026 00:38:35 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm3334902a12.15.2026.07.09.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:38:34 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Thu,  9 Jul 2026 15:38:17 +0800
Message-Id: <20260709073823.6643-1-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003836_599663_95122C46 
X-CRM114-Status: GOOD (  14.32  )
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

This patchset accelerates ioremap, vmalloc, and vmap when the memory
is physically fully or partially contiguous. Two techniques are used:

1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
   segments
2. Use batched mappings wherever possible in both vmalloc and ARM64
   layers

Besides accelerating the mapping path, this also enables large
mappings (PMD and cont-PTE) for vmap, which are currently not
supported.

Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
CONT-PTE regions instead of just one.

Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
mapping logic between the ioremap and vmalloc/vmap paths, handling both
CONT_PTE and regular PTE mappings. This prepares for the next patch.

Patch 4 extends the page table walk path to support page shifts other
than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
mappings. The function is renamed from vmap_small_pages_range_noflush()
to vmap_pages_range_noflush_walk().

Patches 5-6 add huge vmap support for contiguous pages, including
support for non-compound pages with pfn alignment verification.

On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
the performance CPUfreq policy enabled, benchmark results:

* ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
* vmalloc(1 MB) mapping time (excluding allocation) with
  VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
* vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)

Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.

Large vmap() mappings were also tested by Leo Yan with ARM trace buffer
units, including TRBE and SPE. These units use the CPU page tables for
address translation when writing trace data to DRAM, so using larger
vmap() mapping granules can reduce TLB pressure on the trace writer.

The TRBE test used a 1G CoreSight ETM AUX buffer. Across five runs on an
isolated CPU, the average results were:

* dtlb_walk:       68.4 -> 59.4 (-13.16%)
* l1d_tlb_refill: 155.8 -> 119.6 (-23.23%)
* l2d_tlb_refill: 161435.8 -> 495.0 (-99.69%)

The SPE test used a 512M ARM SPE AUX buffer. Across five runs on an
isolated CPU, the average results were:

* dtlb_walk:       1710.4 -> 1315.6 (-23.08%)
* l1d_tlb_refill: 16000.0 -> 15950.2 (-0.31%)
* l2d_tlb_refill: 4796.0 -> 2931.2 (-38.88%)

These results show that enabling larger vmap() mappings can materially
reduce page table walks and TLB refills for large trace buffers.

Many thanks to Leo Yan for his testing efforts on ARM trace buffers.

Changes since v5:
- No code changes.
- Pick up Reviewed-by and Tested-by tags from Dev, Leo and Uladzislau.
  Many thanks!
- Add TRBE/SPE large vmap() test results from Leo Yan to the cover
  letter.

Changes since v4:
- Move pgsize update before contig_ptes check (patch 1)
- Use rounddown_pow_of_two instead of __fls in
  arch_vmap_pte_range_map_size (patch 2)
- Reword comment to avoid mentioning cont_pte and remove if in
  vmap_set_ptes (patch 3)
- Rename vmap_batched() to vmap_pages_range_batched() (patch 5)
- Use batch_end as the batching cursor to avoid an unused start variable
  (patch 5)
- Check arch_vmap_pmd_supported before PMD mapping (patch 6)

Changes since v3:
- Squash vmap_pte_range() loop variable fix into patch 4 (patch 3, 4)
- Use shift >= PMD_SHIFT and fix *nr increment in
  vmap_pages_pmd_range() (patch 4)
- Pass page_shift directly without capping at PMD_SHIFT (patch 4, 5)
- Add vm_shift() helper and pass pgprot_t to get_vmap_batch_order()
  (patch 5)
- Use min(order, __ffs(pfn)) for graceful pfn alignment degradation,
  replacing IS_ALIGNED check (patch 5)
- Remove irrelevant ioremap_max_page_shift early-exit (patch 5)
- Add __get_vm_area_node_aligned_caller() wrapper, rename to
  vmap_get_aligned_vm_area() (patch 6)

Changes since v2:
- Use __fls instead of fls in arch_vmap_pte_range_map_size (patch 2)
- Add WARN_ON checks in vmap_pages_pmd_range (patch 4)
- Fix flush_cache_vmap to use saved start address instead of the
  already-advanced addr (patch 5)
- Rename __vmap_huge() to vmap_batched() (patch 5)
- Add caller parameter and unroll while(1) loop (patch 5)
- Squash patch 7 into patch 5 (stop scanning for compound pages after
  encountering small pages)

Changes since v1:
- Fix condition order and use PMD_SIZE instead of CONT_PMD_SIZE in
  patch 1 (Dev Jain)
- Squash patch 3+4 and patch 5+7 (Dev Jain)
- Replace "zigzag" with "page table rewalk" in commit messages
  (Dev Jain)
- Rename vmap_small_pages_range_noflush() to
  vmap_pages_range_noflush_walk() (Dev Jain)
- Extract vmap_set_ptes() as a new patch to consolidate PTE mapping
  logic between vmap_pte_range() and vmap_pages_pte_range(), handling
  both CONT_PTE and regular mappings (Mike Rapoport)
- Support non-compound pages in get_vmap_batch_order() by falling
  back to physical contiguity scanning with pfn alignment check
  (Dev Jain, Uladzislau Rezki)
- In get_vmap_batch_order(), filter out orders that the architecture
  cannot batch by checking arch_vmap_pte_supported_shift() directly.
  This avoids overhead for orders 1-3 on ARM64 CONT_PTE with 4K
  pages. (patch 5)

Barry Song (Xiaomi) (5):
  arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
    setup
  arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
    CONT_PTE
  mm/vmalloc: Extend page table walk to support larger page_shift sizes
    and eliminate page table rewalk
  mm/vmalloc: map contiguous pages in batches for vmap() if possible
  mm/vmalloc: align vm_area so vmap() can batch mappings

Wen Jiang (1):
  mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic

 arch/arm64/include/asm/vmalloc.h |   6 +-
 arch/arm64/mm/hugetlbpage.c      |  10 ++
 mm/vmalloc.c                     | 243 ++++++++++++++++++++++++-------
 3 files changed, 209 insertions(+), 50 deletions(-)

-- 
2.34.1


