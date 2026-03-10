Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C68EB1054
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uuUPog/sat/7+aZpFjgpyR9bUfWW9xmLj9hpLXqUPz0=; b=jkl/V/fExMCJ2rnhdqfynRF5cF
	dYbtbn/Xk7HDvAfLPbZip0rx6FE/kvmeYXdaJAtgUgc9MOurX1PII+Rhz8HMcu1wX81acREj0Ermq
	uof1EibqgR2Fj7Lbd1gbJ5X7TH+8A9lHtO/HnAF1O19IrGrMvVE6/maCeUHFvExCQ+pDHFddw8B1D
	WNbai58KnQmOtnA6oCiMVoLredZC2sMod7oUthHaTJoukw7jRclGpHs9UiY9pRCxEtYiRAk+2U9sG
	5wbYf1YSTxs2ozclsUCtIzhlTWZ6CrFPyKVZm0nw6fdXmo175xXxsKaaNuBBDsIfVEhiQ6Aznh5zZ
	u4D/wA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyTv-00000009jbO-3NlP;
	Tue, 10 Mar 2026 14:54:47 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyTt-00000009jae-03eN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:54:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773154471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uuUPog/sat/7+aZpFjgpyR9bUfWW9xmLj9hpLXqUPz0=;
	b=NqRwT0FmjKurBS8uijqZStk0R4uXypa5ydCIh60zoT51JmyCam2xRx7RNnUj7Tn7disMZo
	z4+VQpi4Mp7pjrF7uEPmv4kl/BI1ZAjZWNWs+m9wRMcAopWE6LbczsrDmPbOEbqD+/2AHD
	xsGdWVOhi6nRUAa376ydbe0mcaoZJtk=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	ryan.roberts@arm.com,
	david@kernel.org
Cc: ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	jack@suse.cz,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	Liam.Howlett@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	hannes@cmpxchg.org,
	kas@kernel.org,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K pages
Date: Tue, 10 Mar 2026 07:51:13 -0700
Message-ID: <20260310145406.3073394-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_075445_335647_D1F00CAE 
X-CRM114-Status: GOOD (  12.32  )
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

On arm64, the contpte hardware feature coalesces multiple contiguous PTEs
into a single iTLB entry, reducing iTLB pressure for large executable
mappings.

exec_folio_order() was introduced [1] to request readahead at an
arch-preferred folio order for executable memory, enabling contpte
mapping on the fault path.

However, several things prevent this from working optimally on 16K and
64K page configurations:

1. exec_folio_order() returns ilog2(SZ_64K >> PAGE_SHIFT), which only
   produces the optimal contpte order for 4K pages. For 16K pages it
   returns order 2 (64K) instead of order 7 (2M), and for 64K pages it
   returns order 0 (64K) instead of order 5 (2M). Patch 1 fixes this by
   using ilog2(CONT_PTES) which evaluates to the optimal order for all
   page sizes.

2. Even with the optimal order, the mmap_miss heuristic in
   do_sync_mmap_readahead() silently disables exec readahead after 100
   page faults. The mmap_miss counter tracks whether readahead is useful
   for mmap'd file access:

   - Incremented by 1 in do_sync_mmap_readahead() on every page cache
     miss (page needed IO).

   - Decremented by N in filemap_map_pages() for N pages successfully
     mapped via fault-around (pages found in cache without faulting,
     evidence that readahead was useful). Only non-workingset pages
     count and recently evicted and re-read pages don't count as hits.

   - Decremented by 1 in do_async_mmap_readahead() when a PG_readahead
     marker page is found (indicates sequential consumption of readahead
     pages).

   When mmap_miss exceeds MMAP_LOTSAMISS (100), all readahead is
   disabled. On 64K pages, both decrement paths are inactive:

   - filemap_map_pages() is never called because fault_around_pages
     (65536 >> PAGE_SHIFT = 1) disables should_fault_around(), which
     requires fault_around_pages > 1. With only 1 page in the
     fault-around window, there is nothing "around" to map.

   - do_async_mmap_readahead() never fires for exec mappings because
     exec readahead sets async_size = 0, so no PG_readahead markers
     are placed.

   With no decrements, mmap_miss monotonically increases past
   MMAP_LOTSAMISS after 100 faults, disabling exec readahead
   for the remainder of the mapping.
   Patch 2 fixes this by moving the VM_EXEC readahead block
   above the mmap_miss check, since exec readahead is targeted (one
   folio at the fault location, async_size=0) not speculative prefetch.

3. Even with correct folio order and readahead, contpte mapping requires
   the virtual address to be aligned to CONT_PTE_SIZE (2M on 64K pages).
   The readahead path aligns file offsets and the buddy allocator aligns
   physical memory, but the virtual address depends on the VMA start.
   For PIE binaries, ASLR randomizes the load address at PAGE_SIZE (64K)
   granularity, giving only a 1/32 chance of 2M alignment. When
   misaligned, contpte_set_ptes() never sets the contiguous PTE bit for
   any folio in the VMA, resulting in zero iTLB coalescing benefit.

   Patch 3 fixes this for the main binary by bumping the ELF loader's
   alignment to PAGE_SIZE << exec_folio_order() for ET_DYN binaries.

   Patch 4 fixes this for shared libraries by adding a contpte-size
   alignment fallback in thp_get_unmapped_area_vmflags(). The existing
   PMD_SIZE alignment (512M on 64K pages) is too large for typical shared
   libraries, so this smaller fallback (2M) succeeds where PMD fails.

I created a benchmark that mmaps a large executable file and calls
RET-stub functions at PAGE_SIZE offsets across it. "Cold" measures
fault + readahead cost. "Random" first faults in all pages with a
sequential sweep (not measured), then measures time for calling random
offsets, isolating iTLB miss cost for scattered execution.

The benchmark results on Neoverse V2 (Grace), arm64 with 64K base pages,
512MB executable file on ext4, averaged over 3 runs:

  Phase      | Baseline     | Patched      | Improvement
  -----------|--------------|--------------|------------------
  Cold fault | 83.4 ms      | 41.3 ms      | 50% faster
  Random     | 76.0 ms      | 58.3 ms      | 23% faster

[1] https://lore.kernel.org/all/20250430145920.3748738-6-ryan.roberts@arm.com/

Usama Arif (4):
  arm64: request contpte-sized folios for exec memory
  mm: bypass mmap_miss heuristic for VM_EXEC readahead
  elf: align ET_DYN base to exec folio order for contpte mapping
  mm: align file-backed mmap to exec folio order in
    thp_get_unmapped_area

 arch/arm64/include/asm/pgtable.h |  9 ++--
 fs/binfmt_elf.c                  | 15 +++++++
 mm/filemap.c                     | 72 +++++++++++++++++---------------
 mm/huge_memory.c                 | 17 ++++++++
 4 files changed, 75 insertions(+), 38 deletions(-)

-- 
2.47.3


