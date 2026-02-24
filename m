Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A67EFB7FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7gNEbc28FnhE+qvo3ZUlRepOk3rzAuT09rgN9l47M/4=; b=zOpzziNYdLSJ5EGalPVlArPsZa
	1dVb6iClP3ODT5xfbWi6AtgXBGtLXSZLp0KQiWV2MeO1PFk/4pK4j/QIqnoqFP1hw0aQ91z20zCQ/
	05VigGlMyHep8TqP4KGNXxGaSTPg6zxxPrXa5y848sx8/iLiR/Vze8m4uIZ4DlggdNVhrujcZD1im
	VsQEuee/Hz1zrl+SiyOypRf+NwzY66v7ajMOg1wAwGDi41Y4PBRuV5jP2PGY8+6t/6ifXkFlM0q1d
	rHxh/lxXV4sAnQrUKMR+IO6++PLYV61T4rtiTf1OIiaQu8zCFBFduTD4TIXT8Hw3FXZckLRi+uV6Y
	Ll7Uun/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukim-00000001SNE-2FAk;
	Tue, 24 Feb 2026 05:12:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukij-00000001SMY-2IDY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:12:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C37E339;
	Mon, 23 Feb 2026 21:12:19 -0800 (PST)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 380143F7BD;
	Mon, 23 Feb 2026 21:12:20 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC V1 00/16] arm64/mm: Enable 128 bit page table entries
Date: Tue, 24 Feb 2026 10:41:37 +0530
Message-ID: <20260224051153.3150613-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_211229_695143_16FC2CAD 
X-CRM114-Status: GOOD (  14.53  )
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
So with this feature arm64 platforms could have two different translation
systems, VMSAv8-64 and VMSAv9-128 could selectively be enabled.

FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
and virtual address range while also expanding available room for more MMU
management feature bits both for HW and SW.

This series has been split into two parts. Generic MM changes followed by
arm64 platform changes, finally enabling D128 with a new config ARM64_D128.

READ_ONCE() on page table entries get routed via level specific pxdp_get()
helpers which platforms could then override when required. These accessors
on arm64 platform help in ensuring page table accesses are performed in an
atomic manner while reading 128 bit page table entries.

All ARM64_VA_BITS and ARM64_PA_BITS combinations for all page sizes are now
supported both on D64 and D128 translation regimes. Although new 56 bits VA
space is not yet supported. Similarly FEAT_D128 skip level is not supported
currently.

Basic page table geometry has been changed with D128 as there are now fewer
entries per level. Please refer to the following table for leaf entry sizes

                    D64              D128
------------------------------------------------
| PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
-----------------------------|-----------------|
|     4K    |    2M  |  1G   |    1M  |  256M  |
|    16K    |   32M  | 64G   |   16M  |   16G  |
|    64K    |  512M  |  4T   |  256M  |    1T  |
------------------------------------------------

From arm64 kernel features perspective KVM, KASAN and UNMAP_KERNEL_AT_EL0
are currently not supported as well.

Open Questions:

- Do we need to support UNMAP_KERNEL_AT_EL0 with D128
- Do we need to emulate traditional D64 sizes at PUD, PMD level with D128

This series applies on upstream kernel v7.0-rc1.

There are no apparent problems while running MM kselftests with and without
CONFIG_ARM64_D128. Besides the series has been built on other platform such
as x86, powerpc, riscv, arm and s390 etc.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (15):
  mm: Abstract printing of pxd_val()
  mm: Add read-write accessors for vm_page_prot
  mm: Replace READ_ONCE() in pud_trans_unstable()
  perf/events: Replace READ_ONCE() with standard pgtable accessors
  arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
  arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
  arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
  arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
  arm64/mm: Route all pgtable reads via ptdesc_get()
  arm64/mm: Route all pgtable writes via ptdesc_set()
  arm64/mm: Route all pgtable atomics to central helpers
  arm64/mm: Abstract printing of pxd_val()
  arm64/mm: Override read-write accessors for vm_page_prot
  arm64/mm: Enable fixmap with 5 level page table
  arm64/mm: Add initial support for FEAT_D128 page tables

Linu Cherian (1):
  arm64/mm: Add macros __tlb_asid_level and __tlb_range

 arch/arm64/Kconfig                     |  39 ++++-
 arch/arm64/Makefile                    |   4 +
 arch/arm64/include/asm/assembler.h     |   4 +-
 arch/arm64/include/asm/el2_setup.h     |   9 ++
 arch/arm64/include/asm/pgtable-hwdef.h | 137 ++++++++++++++++++
 arch/arm64/include/asm/pgtable-prot.h  |  18 ++-
 arch/arm64/include/asm/pgtable-types.h |  12 ++
 arch/arm64/include/asm/pgtable.h       | 193 ++++++++++++++++++-------
 arch/arm64/include/asm/smp.h           |   1 +
 arch/arm64/include/asm/tlbflush.h      | 112 ++++++++++++--
 arch/arm64/kernel/head.S               |  12 ++
 arch/arm64/mm/fault.c                  |  20 +--
 arch/arm64/mm/fixmap.c                 |  24 ++-
 arch/arm64/mm/hugetlbpage.c            |  10 +-
 arch/arm64/mm/kasan_init.c             |  14 +-
 arch/arm64/mm/mmu.c                    | 113 +++++++++++----
 arch/arm64/mm/pageattr.c               |   8 +-
 arch/arm64/mm/proc.S                   |  25 +++-
 arch/arm64/mm/trans_pgd.c              |  14 +-
 include/linux/pgtable.h                |  21 ++-
 kernel/events/core.c                   |   6 +-
 mm/debug_vm_pgtable.c                  |   4 +-
 mm/huge_memory.c                       |   4 +-
 mm/memory.c                            |  31 ++--
 mm/migrate.c                           |   2 +-
 mm/mmap.c                              |   2 +-
 26 files changed, 674 insertions(+), 165 deletions(-)

-- 
2.43.0


