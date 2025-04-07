Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0CEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uKEsnQRm4iZkdbgqRHGKxOdH3c1QC+bpFfLwfztEk/E=; b=0I/qim0rG4NOdh/llcnSH8+6IK
	Qs9da08meQbh96pvN0cC/SYnWo5s03v4hSTBOpGJmtzmwUDFfo/cRML0Gk8TSMFfbxaRr+LsveWu8
	WL5LMReFkoo5vBtxpEDUsHIghzgqslwESCFnPEfD1uY2R5LIxWDZSzlZ9cxyI9ALR61CCCic/gmW5
	K+wqM46iy+ojpjmtnMTHRMkEpVcw/O7gxnTzj+otwyE+cLrL+kxUE4agLXJJV1EnaKAoaybKPeS/I
	8YQNHomzH93fotLvghrRm9MDL+yvmS8YLx1rWDuETBF6oymrusrDPPfeWa6kx68gUhvZ6JkywLQ5v
	v6PFTy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f9Y-0000000GTBy-2vJB;
	Mon, 07 Apr 2025 05:36:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f4y-0000000GSXG-1mtm;
	Mon, 07 Apr 2025 05:31:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B171F106F;
	Sun,  6 Apr 2025 22:31:26 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.42.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 527C93F6A8;
	Sun,  6 Apr 2025 22:31:18 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: mark.rutland@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH V2 0/3] mm/ptdump: Drop assumption that pxd_val() is u64
Date: Mon,  7 Apr 2025 11:01:10 +0530
Message-Id: <20250407053113.746295-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_223128_549977_475A7319 
X-CRM114-Status: GOOD (  13.89  )
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

Last argument passed down in note_page() is u64 assuming pxd_val() returned
value (all page table levels) is 64 bit - which might not be the case going
ahead when D128 page tables is enabled on arm64 platform. Besides pxd_val()
is very platform specific and its type should not be assumed in generic MM.
A similar problem exists for effective_prot(), although it is restricted to
x86 platform.

This series splits note_page() and effective_prot() into individual page
table level specific callbacks which accepts corresponding pxd_t page table
entry as an argument instead and later on all subscribing platforms could
derive pxd_val() from the table entries as required and proceed as before.

Define ptdesc_t type which describes the basic page table descriptor layout
on arm64 platform. Subsequently all level specific pxxval_t descriptors are
derived from ptdesc_t thus establishing a common original format, which can
also be appropriate for page table entries, masks and protection values etc
which are used at all page table levels.

This series has been tested on arm64 platform but it does build on other
relevant platforms (v6.15-rc1).

Changes in V2:

- Added a patch to split effective_prot() callback per Alexander
- Added a patch to define ptdesc_t data type on arm64 platform per Ryan

Changes in V1:

https://lore.kernel.org/all/20250317061818.16244-1-anshuman.khandual@arm.com/

- Added note_page_flush() callback and implemented the same on all
  subscribing platforms
- Moved note_page() argument change from u64 to pteval_t on arm64 platform
  from second patch to the first patch instead

Changes in RFC:

https://lore.kernel.org/all/20250310095902.390664-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (3):
  mm/ptdump: Split note_page() into level specific callbacks
  mm/ptdump: Split effective_prot() into level specific callbacks
  arm64/mm: Define ptdesc_t

 arch/arm64/include/asm/pgtable-types.h | 20 +++++---
 arch/arm64/include/asm/ptdump.h        | 24 ++++++---
 arch/arm64/kernel/efi.c                |  4 +-
 arch/arm64/kernel/pi/map_kernel.c      |  2 +-
 arch/arm64/kernel/pi/map_range.c       |  4 +-
 arch/arm64/kernel/pi/pi.h              |  2 +-
 arch/arm64/mm/mmap.c                   |  2 +-
 arch/arm64/mm/ptdump.c                 | 50 ++++++++++++++++--
 arch/powerpc/mm/ptdump/ptdump.c        | 46 ++++++++++++++++-
 arch/riscv/mm/ptdump.c                 | 46 ++++++++++++++++-
 arch/s390/mm/dump_pagetables.c         | 46 ++++++++++++++++-
 arch/x86/mm/dump_pagetables.c          | 71 +++++++++++++++++++++++++-
 include/linux/ptdump.h                 | 15 ++++--
 mm/ptdump.c                            | 62 ++++++++++++++--------
 14 files changed, 339 insertions(+), 55 deletions(-)

-- 
2.25.1


