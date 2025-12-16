Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D626D5C0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQXwmSzMXzp6fc+pmS86by7b0nQIrW28Izqo/HJWjsE=; b=uj+ZkrE4ofI6yd6ei0m3QZC4hO
	lnP9nA10+CUw+2xmEKAifDN1ThMijJYzDL07iI3hNCdYSClLrXkkZOHXEquY5RuJMEkYZV+SDGFWz
	rqhiF8BRb2blGd9UrbhlxNtBXh5ZAiyXuICwAp1LnUj1vVAEKnk53q+yCb4f044B53kIfvazPeSNN
	sT4gZRzV6ZBwKevJL5+mGAm1ogA38gfzpeDpVZmS0xle7jyCjCFCVtErEEJUJcP7fAJEEb3LgzSe6
	N2Rus/F6iDv51pmrv4KuZMDaIszOYDv95BzJ1Se472TV+h965/FTk6UhblZp/E8KBPOmq4r37R8Da
	pqwXNeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJb-00000005MeN-3nsu;
	Tue, 16 Dec 2025 14:46:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWJY-00000005MdP-3xks
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:46:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB90FFEC;
	Tue, 16 Dec 2025 06:46:03 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BEB83F73F;
	Tue, 16 Dec 2025 06:46:09 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/13] arm64: Refactor TLB invalidation API and implementation
Date: Tue, 16 Dec 2025 14:45:45 +0000
Message-ID: <20251216144601.2106412-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064613_114538_EBA2E8DC 
X-CRM114-Status: GOOD (  15.78  )
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

This series refactors the TLB invalidation API to make it more general and
flexible, and refactors the implementation, aiming to make it more robust,
easier to understand and easier to add new features in future.

It is heavily based on the series posted by Will back in July at [1]; I've
attempted to maintain correct authorship and tags - apologies if I got any of
the etiquette wrong.

The first 8 patches reimplement the full scope of Will's series, but fixed up to
use function pointers instead of the enum, as per Linus's suggestion. Patches
9-12 then reformulate the API for the range- and page-based functions to remove
all the "nosync", "nonotify" and "local" function variants and replace with a
set of flags to modify the behaviour instead. This allows having a single
implementation that can rely on constant folding. IMO It's much cleaner and more
flexible. Finally, patch 13 provides a minor theoretical performance improvement
by hinting the TTL for page-based invalidations (the preceeding API improvements
made that pretty simple).

We have a couple of other things in the queue to put on top of this series,
which these changes make simpler:

 - Optimization to only do local TLBI when an mm is single-threaded
 - Introduce TLBIP for use with D128 pgtables

The series applies on top of v6.19-rc1, I've compile tested each patch and run
mm selftests for the end result in a VM on Apple M2; all tests pass. I've run an
earlier version of this code through our performance benchmarking system and no
regressions were found. I've looked at the generated instructions and all the
expected constant folding seems to be happening, and I've checked code size
before and after; there is no significant change.

[1] https://lore.kernel.org/linux-arm-kernel/20250711161732.384-1-will@kernel.org/

Thanks,
Ryan

Ryan Roberts (9):
  arm64: mm: Re-implement the __tlbi_level macro as a C function
  arm64: mm: Introduce a C wrapper for by-range TLB invalidation
  arm64: mm: Implicitly invalidate user ASID based on TLBI operation
  arm64: mm: Re-implement the __flush_tlb_range_op macro in C
  arm64: mm: Refactor flush_tlb_page() to use __tlbi_level_asid()
  arm64: mm: Refactor __flush_tlb_range() to take flags
  arm64: mm: More flags for __flush_tlb_range()
  arm64: mm: Wrap flush_tlb_page() around ___flush_tlb_range()
  arm64: mm: Provide level hint for flush_tlb_page()

Will Deacon (4):
  arm64: mm: Push __TLBI_VADDR() into __tlbi_level()
  arm64: mm: Inline __TLBI_VADDR_RANGE() into __tlbi_range()
  arm64: mm: Simplify __TLBI_RANGE_NUM() macro
  arm64: mm: Simplify __flush_tlb_range_limit_excess()

 arch/arm64/include/asm/hugetlb.h  |  12 +-
 arch/arm64/include/asm/pgtable.h  |  13 +-
 arch/arm64/include/asm/tlb.h      |   6 +-
 arch/arm64/include/asm/tlbflush.h | 461 +++++++++++++++++-------------
 arch/arm64/kernel/sys_compat.c    |   2 +-
 arch/arm64/kvm/hyp/nvhe/mm.c      |   2 +-
 arch/arm64/kvm/hyp/pgtable.c      |   4 +-
 arch/arm64/mm/contpte.c           |  12 +-
 arch/arm64/mm/fault.c             |   2 +-
 arch/arm64/mm/hugetlbpage.c       |   4 +-
 arch/arm64/mm/mmu.c               |   2 +-
 11 files changed, 288 insertions(+), 232 deletions(-)

--
2.43.0


