Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C9C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8UZGeVAAz1hLF8OWGVINkvjBjQCBh6vNwDhvlo5tk90=; b=K+kj+1j/hTC9y7vGT4p55sCkAp
	KNlOrbH+Aaz/yV1gwKFZvKt8GqfrM/Nnek7Zlf2l2AEjUsopHG6DvDp6xmDsdCUUsDz5KvaDUYgtM
	r4NSB8PpypvOxYqhPqnh+lYip/ob430afSYC0yUA7CJfYaVt5g4p4NkFW97ZIOQBzd5T9K3adlLcz
	AayeKRMxQ8eWFgXvbAiciYErQjDtvFAr2POZSvK0N8NIALWq7tbja8MZA87b1HCLQpoXSk3jMY2rz
	+Edq0ljwcATDWDAmD2r/3Hu5OkJ8JQMNpF6heNNT1NDpDFuAq+4tiAg6F47vRxuAFQU7WqUuuU0tx
	eW2BqbxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1sK-00000004ndN-0SSz;
	Mon, 17 Feb 2025 14:13:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1nI-00000004mEk-3aHd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:08:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F03A1E5E;
	Mon, 17 Feb 2025 06:08:39 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E6C53F6A8;
	Mon, 17 Feb 2025 06:08:17 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/14] Perf improvements for hugetlb and vmalloc on arm64
Date: Mon, 17 Feb 2025 14:07:52 +0000
Message-ID: <20250217140809.1702789-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_060820_991219_AADDA865 
X-CRM114-Status: GOOD (  23.59  )
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

Hi All,

This series contains some perf improvements for hugetlb and vmalloc on arm64,
and is split out from v1 of a wider series at [1]. Although some of these
patches are core-mm, advice from Andrew was to go via the arm64 tree. Hopefully
I can get some ACKs from mm folks.

The 2 key performance improvements are 1) enabling the use of contpte-mapped
blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
were already hooks for this (used by powerpc) but they required some tidying and
extending for arm64. And 2) batching up barriers when modifying the vmalloc
address space for upto 30% reduction in time taken in vmalloc().

vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
test was repeated 10 times. (perf results are against v1).

legend:
  - p: nr_pages (pages to allocate)
  - h: use_huge (vmalloc() vs vmalloc_huge())
  - (I): statistically significant improvement (95% CI does not overlap)
  - (R): statistically significant regression (95% CI does not overlap)
  - mearements are times; smaller is better

+--------------------------------------------------+-------------+-------------+
| Benchmark                                        |             |             |
|   Result Class                                   |    Apple M2 | Ampere Alta |
+==================================================+=============+=============+
| micromm/vmalloc                                  |             |             |
|   fix_align_alloc_test: p:1, h:0 (usec)          | (I) -12.93% |  (I) -7.89% |
|   fix_size_alloc_test: p:1, h:0 (usec)           |   (R) 4.00% |       1.40% |
|   fix_size_alloc_test: p:1, h:1 (usec)           |   (R) 5.28% |       1.46% |
|   fix_size_alloc_test: p:2, h:0 (usec)           |  (I) -3.04% |      -1.11% |
|   fix_size_alloc_test: p:2, h:1 (usec)           |      -3.24% |      -2.86% |
|   fix_size_alloc_test: p:4, h:0 (usec)           | (I) -11.77% |  (I) -4.48% |
|   fix_size_alloc_test: p:4, h:1 (usec)           |  (I) -9.19% |  (I) -4.45% |
|   fix_size_alloc_test: p:8, h:0 (usec)           | (I) -19.79% | (I) -11.63% |
|   fix_size_alloc_test: p:8, h:1 (usec)           | (I) -19.40% | (I) -11.11% |
|   fix_size_alloc_test: p:16, h:0 (usec)          | (I) -24.89% | (I) -15.26% |
|   fix_size_alloc_test: p:16, h:1 (usec)          | (I) -11.61% |   (R) 6.00% |
|   fix_size_alloc_test: p:32, h:0 (usec)          | (I) -26.54% | (I) -18.80% |
|   fix_size_alloc_test: p:32, h:1 (usec)          | (I) -15.42% |   (R) 5.82% |
|   fix_size_alloc_test: p:64, h:0 (usec)          | (I) -30.25% | (I) -20.80% |
|   fix_size_alloc_test: p:64, h:1 (usec)          | (I) -16.98% |   (R) 6.54% |
|   fix_size_alloc_test: p:128, h:0 (usec)         | (I) -32.56% | (I) -21.79% |
|   fix_size_alloc_test: p:128, h:1 (usec)         | (I) -18.39% |   (R) 5.91% |
|   fix_size_alloc_test: p:256, h:0 (usec)         | (I) -33.33% | (I) -22.22% |
|   fix_size_alloc_test: p:256, h:1 (usec)         | (I) -18.82% |   (R) 5.79% |
|   fix_size_alloc_test: p:512, h:0 (usec)         | (I) -33.27% | (I) -22.23% |
|   fix_size_alloc_test: p:512, h:1 (usec)         |       0.86% |      -0.71% |
|   full_fit_alloc_test: p:1, h:0 (usec)           |       2.49% |      -0.62% |
|   kvfree_rcu_1_arg_vmalloc_test: p:1, h:0 (usec) |       1.79% |      -1.25% |
|   kvfree_rcu_2_arg_vmalloc_test: p:1, h:0 (usec) |      -0.32% |       0.61% |
|   long_busy_list_alloc_test: p:1, h:0 (usec)     | (I) -31.06% | (I) -19.62% |
|   pcpu_alloc_test: p:1, h:0 (usec)               |       0.06% |       0.47% |
|   random_size_align_alloc_test: p:1, h:0 (usec)  | (I) -14.94% |  (I) -8.68% |
|   random_size_alloc_test: p:1, h:0 (usec)        | (I) -30.22% | (I) -19.59% |
|   vm_map_ram_test: p:1, h:0 (usec)               |       2.65% |   (R) 7.22% |
+--------------------------------------------------+-------------+-------------+

So there are some nice improvements but also some regressions to explain:

First fix_size_alloc_test with h:1 and p:16,32,64,128,256 regress by ~6% on
Altra. The regression is actually introduced by enabling contpte-mapped 64K
blocks in these tests, and that regression is reduced (from about 8% if memory
serves) by doing the barrier batching. I don't have a definite conclusion on the
root cause, but I've ruled out the differences in the mapping paths in vmalloc.
I strongly believe this is likely due to the difference in the allocation path;
64K blocks are not cached per-cpu so we have to go all the way to the buddy. I'm
not sure why this doesn't show up on M2 though. Regardless, I'm going to assert
that it's better to choose 16x reduction in TLB pressure vs 6% on the vmalloc
allocation call duration.

Next we have ~4% regression on M2 when vmalloc'ing a single page. (h is
irrelevant because a single page is too small for contpte). I assume this is
because there is some minor overhead in the barrier deferral mechanism and we
are not getting to amortize it over multiple pages here. But I would assume
vmalloc'ing 1 page is uncommon because it doesn't buy you anything over
kmalloc?

Changes since v1 [1]
====================
- Split out the fixes into their own series
- Added Rbs from Anshuman - Thanks!
- Added patch to clean up the methods by which huge_pte size is determined
- Added "#ifndef __PAGETABLE_PMD_FOLDED" around PUD_SIZE in
  flush_hugetlb_tlb_range()
- Renamed ___set_ptes() -> set_ptes_anysz()
- Renamed ___ptep_get_and_clear() -> ptep_get_and_clear_anysz()
- Fixed typos in commit logs
- Refactored pXd_valid_not_user() for better reuse
- Removed TIF_KMAP_UPDATE_PENDING after concluding that single flag is sufficent
- Concluded the extra isb() in __switch_to() is not required
- Only call arch_update_kernel_mappings_[begin|end]() for kernel mappings

Thanks to Anshuman for the review!

Applies on top of my fixes series at [2], which applies on top of v6.14-rc3. All
mm selftests run and pass.

[1] https://lore.kernel.org/all/20250205151003.88959-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20250217140419.1702389-1-ryan.roberts@arm.com/

Thanks,
Ryan

Ryan Roberts (14):
  arm64: hugetlb: Cleanup huge_pte size discovery mechanisms
  arm64: hugetlb: Refine tlb maintenance scope
  mm/page_table_check: Batch-check pmds/puds just like ptes
  arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
  arm64: hugetlb: Use set_ptes_anysz() and ptep_get_and_clear_anysz()
  arm64/mm: Hoist barriers out of set_ptes_anysz() loop
  arm64/mm: Avoid barriers for invalid or userspace mappings
  mm/vmalloc: Warn on improper use of vunmap_range()
  mm/vmalloc: Gracefully unmap huge ptes
  arm64/mm: Support huge pte-mapped pages in vmap
  mm/vmalloc: Batch arch_sync_kernel_mappings() more efficiently
  mm: Generalize arch_sync_kernel_mappings()
  mm: Only call arch_update_kernel_mappings_[begin|end]() for kernel
    mappings
  arm64/mm: Batch barriers when updating kernel mappings

 arch/arm64/include/asm/hugetlb.h     |  29 ++--
 arch/arm64/include/asm/pgtable.h     | 207 +++++++++++++++++++--------
 arch/arm64/include/asm/thread_info.h |   1 +
 arch/arm64/include/asm/vmalloc.h     |  46 ++++++
 arch/arm64/kernel/process.c          |   9 +-
 arch/arm64/mm/hugetlbpage.c          |  72 ++++------
 include/linux/page_table_check.h     |  30 ++--
 include/linux/pgtable.h              |  24 +---
 include/linux/pgtable_modmask.h      |  32 +++++
 include/linux/vmalloc.h              |  55 +++++++
 mm/memory.c                          |   7 +-
 mm/page_table_check.c                |  34 +++--
 mm/vmalloc.c                         |  93 +++++++-----
 13 files changed, 434 insertions(+), 205 deletions(-)
 create mode 100644 include/linux/pgtable_modmask.h

--
2.43.0


