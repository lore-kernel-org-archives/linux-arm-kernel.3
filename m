Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D54C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=860Nc6VgaqMy9r3Lux8leT4R6XBkLQIHX5lzUNdrEy8=; b=WLv8IAPx6c/AZ4EpyDh49ZGxfN
	3nHZxHGX2rl1oi3iIUAq+VOb5HhouN+b4cGfjasRx7Mis1wRIs/AIiAy3BW658Oh9l5PWrStqRZ0B
	pTf1PWyKZjO4dPejRj/m3lOnk5bzLVkB4pzmVVwIrfloldzKLnN/xwrpfvuIq5nO2U9HqoBCdy3ze
	oOhJO4BpkPixXM0QHtzl8dZ4Z1C8qT0hF248ZFFon7x7ym8YSuFWhQUGZQ5/ElVnTrgxQlRdkKf8B
	g7Wn636+PuW8dkV2h+ZzId5Qleif7GBQyLKtml9HMIDe8YPjeOlEq/OGknHFqWH3lzCBgDn63ZV4l
	9T53AkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7A3I-00000006a9w-0zCy;
	Tue, 22 Apr 2025 09:36:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78q4-00000006Ge1-0ZE0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:18:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1D47152B;
	Tue, 22 Apr 2025 01:18:36 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17CCD3F66E;
	Tue, 22 Apr 2025 01:18:38 -0700 (PDT)
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
Subject: [PATCH v4 00/11] Perf improvements for hugetlb and vmalloc on arm64
Date: Tue, 22 Apr 2025 09:18:08 +0100
Message-ID: <20250422081822.1836315-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_011844_264207_4D3E9BA1 
X-CRM114-Status: GOOD (  21.12  )
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

This is v4 of a series to improve performance for hugetlb and vmalloc on arm64.
Although some of these patches are core-mm, advice from Andrew was to go via the
arm64 tree. All patches are now acked/reviewed by relevant maintainers so I
believe this should be good-to-go.

The 2 key performance improvements are 1) enabling the use of contpte-mapped
blocks in the vmalloc space when appropriate (which reduces TLB pressure). There
were already hooks for this (used by powerpc) but they required some tidying and
extending for arm64. And 2) batching up barriers when modifying the vmalloc
address space for upto 30% reduction in time taken in vmalloc().

vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
test was repeated 10 times.

legend:
  - p: nr_pages (pages to allocate)
  - h: use_huge (vmalloc() vs vmalloc_huge())
  - (I): statistically significant improvement (95% CI does not overlap)
  - (R): statistically significant regression (95% CI does not overlap)
  - measurements are times; smaller is better

+--------------------------------------------------+-------------+-------------+
| Benchmark                                        |             |             |
|   Result Class                                   |    Apple M2 | Ampere Alta |
+==================================================+=============+=============+
| micromm/vmalloc                                  |             |             |
|   fix_align_alloc_test: p:1, h:0 (usec)          | (I) -11.53% |      -2.57% |
|   fix_size_alloc_test: p:1, h:0 (usec)           |       2.14% |       1.79% |
|   fix_size_alloc_test: p:4, h:0 (usec)           |  (I) -9.93% |  (I) -4.80% |
|   fix_size_alloc_test: p:16, h:0 (usec)          | (I) -25.07% | (I) -14.24% |
|   fix_size_alloc_test: p:16, h:1 (usec)          | (I) -14.07% |   (R) 7.93% |
|   fix_size_alloc_test: p:64, h:0 (usec)          | (I) -29.43% | (I) -19.30% |
|   fix_size_alloc_test: p:64, h:1 (usec)          | (I) -16.39% |   (R) 6.71% |
|   fix_size_alloc_test: p:256, h:0 (usec)         | (I) -31.46% | (I) -20.60% |
|   fix_size_alloc_test: p:256, h:1 (usec)         | (I) -16.58% |   (R) 6.70% |
|   fix_size_alloc_test: p:512, h:0 (usec)         | (I) -31.96% | (I) -20.04% |
|   fix_size_alloc_test: p:512, h:1 (usec)         |       2.30% |       0.71% |
|   full_fit_alloc_test: p:1, h:0 (usec)           |      -2.94% |       1.77% |
|   kvfree_rcu_1_arg_vmalloc_test: p:1, h:0 (usec) |      -7.75% |       1.71% |
|   kvfree_rcu_2_arg_vmalloc_test: p:1, h:0 (usec) |      -9.07% |   (R) 2.34% |
|   long_busy_list_alloc_test: p:1, h:0 (usec)     | (I) -29.18% | (I) -17.91% |
|   pcpu_alloc_test: p:1, h:0 (usec)               |     -14.71% |      -3.14% |
|   random_size_align_alloc_test: p:1, h:0 (usec)  | (I) -11.08% |  (I) -4.62% |
|   random_size_alloc_test: p:1, h:0 (usec)        | (I) -30.25% | (I) -17.95% |
|   vm_map_ram_test: p:1, h:0 (usec)               |       5.06% |   (R) 6.63% |
+--------------------------------------------------+-------------+-------------+

So there are some nice improvements but also some regressions to explain:

fix_size_alloc_test with h:1 and p:16,64,256 regress by ~6% on Altra. The
regression is actually introduced by enabling contpte-mapped 64K blocks in these
tests, and that regression is reduced (from about 8% if memory serves) by doing
the barrier batching. I don't have a definite conclusion on the root cause, but
I've ruled out the differences in the mapping paths in vmalloc. I strongly
believe this is likely due to the difference in the allocation path; 64K blocks
are not cached per-cpu so we have to go all the way to the buddy. I'm not sure
why this doesn't show up on M2 though. Regardless, I'm going to assert that it's
better to choose 16x reduction in TLB pressure vs 6% on the vmalloc allocation
call duration.

Changes since v3 [3]
====================
- Applied R-bs (thanks all!)
- Renamed set_ptes_anysz() -> __set_ptes_anysz() (Catalin)
- Renamed ptep_get_and_clear_anysz() -> __ptep_get_and_clear_anysz() (Catalin)
- Only set TIF_LAZY_MMU_PENDING if not already set to avoid atomic ops (Catalin)
- Fix commet typos (Anshuman)
- Fix build warnings when PMD is folded (buildbot)
- Reverse xmas tree for variables in __page_table_check_p[mu]ds_set() (Pasha)

Changes since v2 [2]
====================
- Removed the new arch_update_kernel_mappings_[begin|end]() API
- Switches to arch_[enter|leave]_lazy_mmu_mode() instead for barrier batching
- Removed clean up to avoid barriers for invalid or user mappings

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

Applies on top of v6.15-rc3. All mm selftests run and no regressions observed.

[1] https://lore.kernel.org/all/20250205151003.88959-1-ryan.roberts@arm.com/
[2] https://lore.kernel.org/all/20250217140809.1702789-1-ryan.roberts@arm.com/
[3] https://lore.kernel.org/all/20250304150444.3788920-1-ryan.roberts@arm.com/

Thanks,
Ryan

Ryan Roberts (11):
  arm64: hugetlb: Cleanup huge_pte size discovery mechanisms
  arm64: hugetlb: Refine tlb maintenance scope
  mm/page_table_check: Batch-check pmds/puds just like ptes
  arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
  arm64: hugetlb: Use __set_ptes_anysz() and
    __ptep_get_and_clear_anysz()
  arm64/mm: Hoist barriers out of set_ptes_anysz() loop
  mm/vmalloc: Warn on improper use of vunmap_range()
  mm/vmalloc: Gracefully unmap huge ptes
  arm64/mm: Support huge pte-mapped pages in vmap
  mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes
  arm64/mm: Batch barriers when updating kernel mappings

 arch/arm64/include/asm/hugetlb.h     |  29 ++--
 arch/arm64/include/asm/pgtable.h     | 209 +++++++++++++++++++--------
 arch/arm64/include/asm/thread_info.h |   2 +
 arch/arm64/include/asm/vmalloc.h     |  45 ++++++
 arch/arm64/kernel/process.c          |   9 +-
 arch/arm64/mm/hugetlbpage.c          |  73 ++++------
 include/linux/page_table_check.h     |  30 ++--
 include/linux/vmalloc.h              |   8 +
 mm/page_table_check.c                |  34 +++--
 mm/vmalloc.c                         |  40 ++++-
 10 files changed, 329 insertions(+), 150 deletions(-)

--
2.43.0


