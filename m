Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A055DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vzsH/LHbJwPhcS/F03MRPLO6wWkth0B2xmqisYYr6kQ=; b=qDT2+JW16vA1LVqKjyVT+o+ZYy
	B1gCj4E4J/WXiK4iVvZoNfVqAUY7YppjNMZpLalPGrpD2RkYHwRo3BJohiewU2T85586BminrBZ2l
	e6V/zEMIvir5igqc/M+mLkP8xQUt2iuEmtjkHPKPUeqjb8zdO2lVhEuLfO9jED+Tr4zWj7qNyzDmU
	5snMCZrBBNXxU6On41A675V/ZdXuF7bJxq0DDorA5XC5Oz7pFETSnPiEO2GtqjxpNN8JZp044Ckks
	ow3ZRrJl+z//yLxMTvEPxA2KKXWxEJ4EH7lrBGsJBWM8uYmgZUE34YLoqMSff1DusCD20Ii8NL6X3
	JPAnUozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPa-0000000EiJP-0r76;
	Wed, 15 Jul 2026 12:08:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPY-0000000EiIQ-0dlI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:08:25 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cca0c5799eso25589905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784117303; x=1784722103; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vzsH/LHbJwPhcS/F03MRPLO6wWkth0B2xmqisYYr6kQ=;
        b=EH08wEkDhhQbeaf34U959SOx9qEbSdKTRB8uilZbha2mxWMAZtRcSg1phs554HOxSN
         a+RyWl0yCdlsF4CVXTKCmTyWiTIPcnk4JbUwdUAswN0F2ZoSH5SefllSgqwDP5piuNgA
         9+ZSrUycTAxKPcPIJFJH5fBGFaGOSsreghOf+FYNjxpvazTAH24LKLGVlIAFu6KKBn0y
         LS+Lu+4Dh4MMnYFbthR0USqv+8oDb01cB9VYBU6V/6ek9HUgqb/GBKd+GyK8Td7BlqIE
         zpEdFM6VKhAu5TRlQvPKPwm6iKlifA04dco5DezC6s+7CNIY0j6/UBe6ZfaBoi1bkt5Z
         i7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117303; x=1784722103;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vzsH/LHbJwPhcS/F03MRPLO6wWkth0B2xmqisYYr6kQ=;
        b=VYC/mIxsp3PYzaSULUU7ZKoqe0dGcECT5eO5k1wmVI69kDAQrgZ4cc6cQFQKqG21fr
         dLM6AiKr+uuiOi26kLbr5iElTr1LFD7aEmPwGOtWUSHhQ45f7rxC+OtXhJRNWyQhX5Z0
         q1vNIAc58oUjOy9n09axWYKKhgaCabmxxwT20F2PhUkbRqJxjKQNij0wrgK4bomlXRg4
         HMBYEp/6y58sInDRdaSQz8uo9Zjj+5iympE6Zgy4ODg4NPsb1JfBWKUvP4G+PoprQhu4
         niZiUacqm2jLNQMAdNghCPsh5coAlQ6+35gTeOErbd9ubbjSjrIoH+ynckukIw3YqycT
         7McQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtILuOJZwhhGnZYC0xsVSZl0t3aIABAkmKgz5wjqtNQMYf+TJADi3KMX15KPtDzz1Z14P2/+dXTTgX5Zc5J/IG@lists.infradead.org
X-Gm-Message-State: AOJu0YwdcJSYARjnxIA99FalCK+G5OFTHjfa5qA9uYBgCJTdaZKonAbT
	NIAYRcTTwzWApdI0kEhsYPIcA69NGAwwqEuaja5qdvj/A0/5E0waSHes
X-Gm-Gg: AfdE7cmemH+HBcNUjxNSgZg8OBGWgLg+b/Yw2vBKKrYVUEpXpSm3mGmcFWapwfjU5Zw
	JxkxcnOiinKhLr2xf8juQG7uGWS8/NFTImZsIXP0wxdzoiTKjhAz9E2ZiN0lvNfWyBk5B4xXAVG
	hCY7pNzgOagmABnmI+heJAM13OSgZVZ+giybSsjHkvwNWLiPCwyt1WC1SUk90oak3UlLUeGBaOZ
	ZHc5H/lICxkWP5DH8IpiprQ7+Ko934gBhVgkCQkQodj1ZuW8LPhGxpjN8jbey6wfR2heOyGI/+c
	MPSJIXPVZKFcbcOsTgl+4pt7x96oX36p8viW1+aFKIZ8NJDxUCEZT5Kx5ym32uXKpOwtxL0REPq
	fs6bZGn2H18dgd6cNSBTIDoUOWOl9QQTB5SPlBJccEWNk5E22zAom83ZhfmB7NKTLOCaaWtF1ap
	kJoF2hpT9ODreiIqyfWMzRoYunPAFRm2Zq4XI=
X-Received: by 2002:a17:902:d552:b0:2cb:2b53:559f with SMTP id d9443c01a7336-2ce9f3a4910mr175721715ad.35.1784117302761;
        Wed, 15 Jul 2026 05:08:22 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm1216325ad.63.2026.07.15.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:08:22 -0700 (PDT)
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
	baohua@kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: [PATCH v7 0/7] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Wed, 15 Jul 2026 20:08:06 +0800
Message-Id: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050824_209859_36D40E2B 
X-CRM114-Status: GOOD (  16.37  )
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
mapping logic for the ioremap and vmalloc/vmap paths, handling both
CONT_PTE and regular PTE mappings. This prepares for the next patch.

Patch 4 extends the page table walk path to support page shifts other
than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
mappings. The function is renamed from vmap_small_pages_range_noflush()
to vmap_pages_range_noflush_walk().

Patch 5 extracts vm_shift() to consolidate vmalloc mapping shift
selection for reuse in the batching path.

Patches 6-7 add huge vmap support for contiguous pages, including
support for non-compound pages with pfn alignment verification.

On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
the performance CPUfreq policy enabled, benchmark results:

* ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
* vmalloc(1 MB) mapping time (excluding allocation) with
  VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53 us)
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

Changes since v6:
- Add a clarifying comment about the reuse of hugetlb helpers
  by non-hugetlbfs(vmalloc) mm code (patch 1)
- Expand the arm64/vmalloc commit message and comment to clarify that
  multi-CONT_PTE_SIZE values are vmalloc mapping spans, not HugeTLB
  hstate sizes (patch 2)
- Move the local steps variable change in vmap_pte_range() into the
  vmap_set_ptes() extraction patch (patch 3)
- Propagate vmap_pages_pte_range() errors through the upper
  vmap_pages_*() levels instead of returning -ENOMEM for all failures
  (patch 4)
- Add a preparatory vm_shift() helper patch before the batching patch
  (patch 5)
- Guard the PFN alignment clamp in get_vmap_batch_order() against PFN 0
  before calling __ffs() (patch 6)
- Fix kmsan_vmap_pages_range_noflush() indentation in the batching path
  (patch 6)

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

Wen Jiang (2):
  mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic
  mm/vmalloc: Extract vm_shift() to consolidate mapping shift selection

 arch/arm64/include/asm/vmalloc.h |   8 +-
 arch/arm64/mm/hugetlbpage.c      |  15 ++
 mm/vmalloc.c                     | 264 ++++++++++++++++++++++++-------
 3 files changed, 229 insertions(+), 58 deletions(-)

-- 
2.34.1


