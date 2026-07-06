Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A52C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=itR8BbvSOUPvqHuUaLoncjOsPFlKikq0KEUNB8ftVG8=; b=1eaB84XD+0jzxSakKwgDtO7+35
	XlXc/NkTmWa121k9OINf1npFrE0XWS0vD+hs6DLdPGhZkLz7NmFbUMESARm8oQJTDwF0NkIw7Mc3E
	AvWICku3t3+GGvM+nm7j7FX4cGbIj38sGv2UQDMafX6dXyG9KphTXpjXJvlXxYblTTLNzfZwZ15kX
	BQSlChNrslRPdc+NnC9rbioYWIlrB4e/R/RL2XbMAP0L1IN+/GSGBn+iWL0uWyGe1Fgt6jjo8By6t
	m3ZTDjrK2jlZt7LXJ016tHd5RIF11H4K5lLOcIz9WWpzI9Cub6XKRIkv2OJWlPoiAqoCFeI7HpTxt
	PVmoE7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgevi-0000000Brwv-44jZ;
	Mon, 06 Jul 2026 08:43:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgevf-0000000Brw8-48Ei
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:43:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-384c94c9414so983606a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327431; x=1783932231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itR8BbvSOUPvqHuUaLoncjOsPFlKikq0KEUNB8ftVG8=;
        b=Q4Zrqrfg+t4YQsGg+2OcDWenQezSraRYKcWn8qegtAiEMUUmLbElB51GlP5IDjhNJ/
         FnpkXbtdjHGZiMcC3L4TZFLUQ7lv4V49EcaCg35F91CK7VxnbkeczphdwA56gNKiRT3O
         jyEw8fLK4CwUo6WhycQp4pppptYzmZqZkYlIfdPCM/k0d3vGuG8KNp0B1Ck7smCGDdeT
         h1M4NNdIQEz6jkX8F2+zDkG/WWRLYCrYJgE8637Mfxk7ZMgLVcSdTQtfyMWy3EtErffv
         YKPqATPs2qtlizrE5gh3wIU8JF1waslpViPx3T6j4P5MBuvVMNgiICjy/VNjPQvKWefs
         Dz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327431; x=1783932231;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itR8BbvSOUPvqHuUaLoncjOsPFlKikq0KEUNB8ftVG8=;
        b=ofcl2pVIcaXGkqb+b76Xqjns0Dw9mZRvt2X/BzGhbkYf7mWtHb/Qr6RAgqDE1r+c4p
         RqrDcvwpwS69zltBR0UyQLtDM68+Fd2lai2wOKV07Jo6zZhhAzDpvubU+FBvKFhSqgrQ
         3kWKReCw1RpjJpUgulPNyCNpSoDYW1C5LMqkaKj5/4Ua6rddiPVq6g3DYDoA4hD7xJMh
         6XYuGjMMNJZv7LnzH7OjOUi9ehmpxcdrZB6nahwJdtx3tQqTw9U6JdDl/rnNe+B3uezA
         5fkRqbhPhmMCaOD0Q/+Sv9ONwyo+z/hatUZC6oMgFI5GpyeYLwbSj69vJ2uG4dd8cRmz
         vQMA==
X-Forwarded-Encrypted: i=1; AHgh+RpM8oSZlvZsnlzZ6/4gsvUx+hjOOV9I2qj4mIZJKeRHOqotnRwr05YVeq5ztvwZ+E1845Bn4zrZQjSiKuesr9Fs@lists.infradead.org
X-Gm-Message-State: AOJu0YxhnPy5fnSW4KfEJja8/IhnTZtQ07bloXJBQd1pETS15Q6BoNWp
	kDDeYVy1B8th2cEbMTv+mHrtjLY7z4Mk1vPbrZyfzcOVkpFOoOG91eMZ
X-Gm-Gg: AfdE7ckgEmRpXB6LRfp1wbm7BZCaeXyzHm1NfCWRVsXvRylCeifPpRg+lK18heDFw8B
	PbWOW+U0ToaH7QYM4oy+V0hxvdlTwQh0sejDtL3W5WKQ/ZNBMKLSz8K+gAVdj2zlItEGxvqC4IG
	Kq9Fmlr5Q36t+er66PCv4x9SZ1gCPmE6hfYfRM5ImjX2Y3OZxxjJkIF2CXde0hhxdbUQBIGmf4Z
	SOwkZnQNlvE/gpXioMwTt7AAq2eybcDx9xNnaiaMs/SGBNM33U54zyZ7aMHh5F7WYL6Khv06Q9K
	7O/5chTX/QxHsanC2AlKOXHDKSNfEt0R3ss8TS7wVdPbb/w7ijw01NjHXLc+N2nIiSUWdmShH/9
	fZ46rf8aUmgDtXQ1Wtk8VFZhddNyalL93EWSdhBK9WZFZryWCzNJBfbnHpbsnZeNgLknPFWAnka
	HUn31hgELP1q+PyBRRwIk1+N6M4DxmqZhul0M=
X-Received: by 2002:a17:90b:4e8c:b0:37f:eaf9:4682 with SMTP id 98e67ed59e1d1-38280d9a4d4mr9682881a91.14.1783327429729;
        Mon, 06 Jul 2026 01:43:49 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815c10fsm4524635a91.13.2026.07.06.01.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:43:49 -0700 (PDT)
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
	shanghaoqiang@xiaomi.com,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: [PATCH v5 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Mon,  6 Jul 2026 16:42:26 +0800
Message-Id: <20260706084232.177786-1-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014352_032729_54815FF0 
X-CRM114-Status: GOOD (  12.42  )
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


