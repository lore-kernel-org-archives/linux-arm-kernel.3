Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DC4C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PEiTB/8lc/6YgHJzKlRIRpp0zlrro6/WPnLlwBeIvlE=; b=zGLKBx++6jB9t2IKkbzilfEah/
	6923ldmC4BaNdUc3y+c7tD44bNETbo1KvrrCYP6BB9VvAmTfzkoCQ5PmHcr88GMUz5eb+cDw/sFeH
	lbt00KI4qsG6pg4PM3zloXpgHrSZftlay4ASadVUvr1TMcwkB6jd9FKzfgUTE1j2PzFVdh7Ld8Dke
	okNJu/Qm3+Dg1R7JotLQuzm2C3kvXF6Qldg4SrwaUYdenQ4IWbQ/e5GMBcp8TuE6Y/jGn0CbL9Gdo
	P3ZJDYzxTTrv6H+SwsRJ3xDxsMZ3BJfj9QrCpHu7Un6esqfqRVvO5kPlR1fAEcpF6AMVWqwSyXtbw
	TZ1IjpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3LX-00000007t6J-0Tqh;
	Wed, 29 Jul 2026 12:25:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3LT-00000007t47-05s7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 334521688;
	Wed, 29 Jul 2026 05:25:03 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB8913F66F;
	Wed, 29 Jul 2026 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785327907; bh=+wV2iFKlxT1dk8O4Kz2PUZUFQc+SrHcTLxbdDzD5R+c=;
	h=From:To:Cc:Subject:Date:From;
	b=Ela3iW+SNbSty+K3TyEW+oC9SvkSxgSnhYsF1m8pTXvEsZXKthEY/mEZ4xttaDllR
	 FtaI0w5MRrQxDN7tH4luB50hdr2asTTikX69hT9l+tS+EtIY4hx3Z1ePJGkw4YvlhP
	 sAEvY+b3zcKxWQs5RWizzW1HL84GHWoN6ZKTgIoQ=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/17] arm64/mm: Enable 128 bit page table entries
Date: Wed, 29 Jul 2026 17:54:35 +0530
Message-ID: <20260729122452.3797443-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052511_158465_AF0A6D19 
X-CRM114-Status: GOOD (  19.48  )
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

FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
arm64 platforms with FEAT_D128 enabled will now have two different memory
translation systems i.e VMSAv8-64 and VMSAv9-128.

FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
and virtual address range while also expanding available room for more MMU
feature bits for both HW and SW usage.

A new config option ARM64_D128 is being added thus enabling users to chose
between aforementioned memory translations regimes VMSAv8-64 (aka D64) and
VMSAv9-128 (aka D128) during the build time. If the ARM64_D128 built kernel
does not detect FEAT_D128 feature on the hardware, then it gets stuck with
with a new reason code CPU_STUCK_REASON_NO_D128. So ARM64_D128 built kernel
cannot fallback to D64 translation regime on unsupported HW.

READ_ONCE() on page table entries get routed via level specific pxdp_get()
helpers which platforms could then override when required. These accessors
on arm64 platform help in ensuring page table accesses are performed in an
atomic manner while reading 128 bit page table entries.

ARM64_[VA|PA]_BITS combinations for respective CONFIG_ARM64_XXK_PAGES are
now supported both on VMSAv8-64 and VMSAv9-128 memory translation regimes.
Although FEAT_D128 provided 52 bit VA and PA space along with skip levels
features are not supported currently.

Basic page table geometry has also been changed with VMSAv9-128, as there
are fewer entries per level as compared to VMSAv8-64. Please refer to the
following table for various leaf entry sizes including the cont entries.

------------------------------------------------
|           |       D64      |       D128      |
------------------------------------------------
| PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
-----------------------------|-----------------|
|     4K    |    2M  |  1G   |    1M  |  256M  |
|    16K    |   32M  | 64G   |   16M  |   16G  |
|    64K    |  512M  |  4T   |  256M  |    1T  |
------------------------------------------------

--------------------------------------------------------------------
|           |            D64           |             D128          |
--------------------------------------------------------------------
| PAGE_SIZE |   CONT_PTE  |  CONT_PMD  |   CONT_PTE  |   CONT_PMD  |
--------------------------|------------|-------------|--------------
|     4K    |     64K     |     32M    |     64K     |      16M    |
|    16K    |      2M     |      1G    |      1M     |     256M    |
|    64K    |      2M     |     16G    |      1M     |      16G    |
--------------------------------------------------------------------

Similarly arm64 kernel features such as KVM, KASAN and UNMAP_KERNEL_AT_EL0
are currently not supported as well.

This series applies on v7.2-rc5 but after applying the following patch that
standardized printing pgtable entries. There are no apparent problems while
running MM kselftests with and without CONFIG_ARM64_D128.

https://lore.kernel.org/all/20260709044334.1741263-1-anshuman.khandual@arm.com/

Changes in V1:

- Rebased on v7.2-rc5
- Pulled in new standardized pgtable entry print patch
- Added standardized pgtable entry print on arm64 platform
- Added KASAN related pgdp_get() changes missing earlier
- Renamed pxxval_get/set() as ptval_get/set()
- Renamed ptval_cmpxchg_relaxed() and ptval_xchg_relaxed()
- Renamed tlbi_args_t as tlbi_arg_t per Ryan
- Split final D128 enablement patch into four separate ones
- Updated all commit messages as required

Changes in RFC V2:

https://lore.kernel.org/all/20260513044547.4128549-1-anshuman.khandual@arm.com/

- Dropped some patches that were merged upstream and rebased on v7.1-rc3
- Updated commit message for the 5-level fixmap change per David
- Moved pxdval_t definition inside generic page table header
- Dropped _once from pgprot_read/write() per Mike
- Updated ARM64_CONT_[PTE|PMD]_SHIFT both for 16K and 64K base pages
- Renamed __PRIpte as __PRIpxx per David
- Added abstraction for tlbi_op
- Adopted TLBIP implementation to recent TLB flush changes
- Moved back all helpers back from arch/arm64/mm/mmu.c into the header
- Moved arm64 pgtable header READ_ONCE() replacements later in the series
- Renamed all ptdesc_ instances as pxxval_ instead
- Updated all commit messages as required and suggested
- Restored print format in __print_bad_page_map_pgtable() per Usama

Changes in RFC V1:

https://lore.kernel.org/linux-arm-kernel/20260224051153.3150613-2-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (15):
  mm: Add read-write accessors for vm_page_prot
  arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
  arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
  arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
  arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
  arm64/mm: Route all pgtable reads via ptval_get()
  arm64/mm: Route all pgtable writes via ptval_set()
  arm64/mm: Route all pgtable atomics to central helpers
  arm64/mm: Override read-write accessors for vm_page_prot
  arm64/mm: Standardize printing for pgtable entries
  arm64/mm: Enable fixmap with 5 level page table
  arm64/mm: Enable pgtable geometry for FEAT_D128
  arm64/mm: Enable pgtable descriptor for FEAT_D128
  arm64/mm: Enable 128 bit translation
  arm64/mm: Make ARM64_D128 selectable

Linu Cherian (2):
  arm64/mm: Add an abstraction level for tlbi_op
  arm64/mm: Enable TLBIP instruction based TLB flush

 arch/arm64/Kconfig                     |  51 ++++++-
 arch/arm64/Makefile                    |   4 +
 arch/arm64/include/asm/assembler.h     |   4 +-
 arch/arm64/include/asm/el2_setup.h     |   9 ++
 arch/arm64/include/asm/pgtable-hwdef.h | 137 ++++++++++++++++++
 arch/arm64/include/asm/pgtable-prot.h  |  18 ++-
 arch/arm64/include/asm/pgtable-types.h |   4 +
 arch/arm64/include/asm/pgtable.h       | 188 +++++++++++++++++++------
 arch/arm64/include/asm/smp.h           |   1 +
 arch/arm64/include/asm/tlbflush.h      | 138 ++++++++++++------
 arch/arm64/kernel/head.S               |  12 ++
 arch/arm64/mm/fault.c                  |  31 ++--
 arch/arm64/mm/fixmap.c                 |  24 +++-
 arch/arm64/mm/hugetlbpage.c            |  10 +-
 arch/arm64/mm/kasan_init.c             |  18 +--
 arch/arm64/mm/mmu.c                    |  81 ++++++-----
 arch/arm64/mm/pageattr.c               |   8 +-
 arch/arm64/mm/proc.S                   |  25 +++-
 arch/arm64/mm/trans_pgd.c              |  14 +-
 include/linux/mm_types.h               |  40 ++++++
 include/linux/pgtable.h                |  14 ++
 mm/huge_memory.c                       |   4 +-
 mm/memory.c                            |  42 +-----
 mm/migrate.c                           |   2 +-
 mm/mmap.c                              |   2 +-
 25 files changed, 668 insertions(+), 213 deletions(-)

-- 
2.43.0


