Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C97C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KTERvoIefDl0KT05uhZ54LHyUPKoxzNP9f91loO17NQ=; b=3Lx3+DXNz959rK/LZqO4uMlU39
	e/ERI2UyPjHwv7bfapoeZRzRzgSUFMqPBm9oy2g4yn+i7mgV+9LMxIthKnV4L2EJeCQJvGY6PiGXQ
	lizYJ8VEW9r5+wvE9H9qEKIT67rb6skxRzQOUBQUDx5ea0ItVv6hlq4OQIlrf6cqttQWgEWODH0SP
	Gow/VIGxXVB6DGduItbilGS3mkm8mPCTRVSAFlcQDFDSg1Szz8nh5QCFCnRv88SqfOkCl2QMWgLKt
	0dJRO9c3fsboNQsqzgC9u75J5Iw26CGtihFX1pds1vg1VIvVQ4pf9LgKSOJOe44SauoSndT7djceL
	l6hIK2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toUIW-0000000EyN5-3jLa;
	Sat, 01 Mar 2025 21:23:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toUGy-0000000Ey8M-48e0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 21:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0EF25C4C27;
	Sat,  1 Mar 2025 21:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6D8C4CEE6;
	Sat,  1 Mar 2025 21:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740864081;
	bh=Er7lTRaEi35ienkDUi7oOPwdYCL796Gg4xtCpcd7D7g=;
	h=Date:From:To:Cc:Subject:From;
	b=BeRktjRsdbEjxlK7vbinucOO3Ieg9/CMfVhjOVX5R9hzuCsRcoEweJol9Gkaphypq
	 3kyWLkNB3jHYCs0tAelo8GJeiLQuQ7j9RLPYa4xSumoAuAU+Q/CJa4d4d/tW4v8I57
	 6WJj868T85KCSTE26r/AnntsM/k2Du//TUvojyPJQJHCiv+uRNJgbAX0Kq0cADU8Ww
	 GCbvKeYZ2E90JiBk5j1zUcTz5lz+HfiG9F6nYVxmX5tEAVjJi2IdqlE14bGva7L3Ec
	 3xj5yMNKrD/fR6kOpYBeNAl+gND2OzQ5cKhybe9L8CrarFuXw4L/tQvlKLRqUEzUQv
	 qMHAv3vuoEOpA==
Date: Sat, 1 Mar 2025 21:21:16 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	ryan.roberts@arm.com, akpm@linux-foundation.org
Subject: [GIT PULL] arm64 fixes for -rc5
Message-ID: <20250301212116.GA29069@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_132125_117645_FD36229B 
X-CRM114-Status: GOOD (  14.79  )
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

Hi Linus,

Ryan's been hard at work finding and fixing mm bugs in the arm64 code,
so here's a small crop of fixes for -rc5. The main changes are to fix
our zapping of non-present PTEs for hugetlb entries created using the
contiguous bit in the page-table rather than a block entry at the level
above. Prior to these fixes, we were pulling the contiguous bit back out
of the PTE in order to determine the size of the hugetlb page but this
is clearly bogus if the thing isn't present and consequently both the
clearing of the PTE(s) and the TLB invalidation were unreliable.

Although the problem was found by code inspection, we really don't want
this sitting around waiting to trigger and the changes are CC'd to stable
accordingly.

Note that the diffstat looks a lot worse than it really is;
huge_ptep_get_and_clear() now takes a size argument from the core code
and so all the arch implementations of that have been updated in a
pretty mechanical fashion. The patches have been in linux-next without
problems and Andrew is aware that they're coming via arm64 [1].

Cheers, and please pull.

Will

[1] https://lore.kernel.org/all/20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org/

--->8

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to eed6bfa8b28230382b797a88569f2c7569a1a419:

  arm64: hugetlb: Fix flush_hugetlb_tlb_range() invalidation level (2025-02-27 17:40:58 +0000)

----------------------------------------------------------------
arm64 fixes for -rc5

- Fix a sporadic boot failure due to incorrect randomization of the
  linear map on systems that support it

- Fix the zapping (both clearing the entries *and* invalidating the TLB)
  of hugetlb PTEs constructed using the contiguous bit

----------------------------------------------------------------
Ryan Roberts (4):
      arm64/mm: Fix Boot panic on Ampere Altra
      mm: hugetlb: Add huge page size param to huge_ptep_get_and_clear()
      arm64: hugetlb: Fix huge_ptep_get_and_clear() for non-present ptes
      arm64: hugetlb: Fix flush_hugetlb_tlb_range() invalidation level

 arch/arm64/include/asm/hugetlb.h     | 26 +++++++++++-----
 arch/arm64/mm/hugetlbpage.c          | 59 +++++++++++++++---------------------
 arch/arm64/mm/init.c                 |  7 +----
 arch/loongarch/include/asm/hugetlb.h |  6 ++--
 arch/mips/include/asm/hugetlb.h      |  6 ++--
 arch/parisc/include/asm/hugetlb.h    |  2 +-
 arch/parisc/mm/hugetlbpage.c         |  2 +-
 arch/powerpc/include/asm/hugetlb.h   |  6 ++--
 arch/riscv/include/asm/hugetlb.h     |  3 +-
 arch/riscv/mm/hugetlbpage.c          |  2 +-
 arch/s390/include/asm/hugetlb.h      | 16 +++++++---
 arch/s390/mm/hugetlbpage.c           |  4 +--
 arch/sparc/include/asm/hugetlb.h     |  2 +-
 arch/sparc/mm/hugetlbpage.c          |  2 +-
 include/asm-generic/hugetlb.h        |  2 +-
 include/linux/hugetlb.h              |  4 ++-
 mm/hugetlb.c                         |  4 +--
 17 files changed, 82 insertions(+), 71 deletions(-)

