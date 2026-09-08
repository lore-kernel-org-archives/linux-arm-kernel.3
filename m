Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E28CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pcGUgU7hjm2rCI4RwQGUwUG/E2R9t5IYhmlvb7rkb0=; b=RQI3VL3bJkWT7v
	SBJ/6X0Vd5MJiiKYkPEc6bl6VsUXgH5yMCYRpeM0s6uW7+nJgQsmpvMVTvwzuHpzw2bI7Wzu/LaeF
	bXiz0djkXYoZyEQ3DFwT/7jGCu4nFd1rOV2OrPrTHBSx6wpwLgbcCT7+zy1tHkdwLQCRXq+qSwWu8
	rhZAZdqAXsSl1CgMigRtbXpOMEeNhOTgLoM/iYlMU2aF5ZeafN+TNZIQFHubtngSoKW0qCHxi39qA
	H+ckRQK/W+tEutTwnIzpoEuhkWt5Nt8lFSGiASwXm33+dyeFV3HLu4spN+MQkI0leq1vESfo7plJ/
	hOSSRTkrJJ1ZCCqIXREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xaB-00000009RRU-1tyl;
	Tue, 08 Sep 2026 15:17:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xa9-00000009RQM-3xmQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+pcGUgU7hjm2rCI4RwQGUwUG/E2R9t5IYhmlvb7rkb0=; b=CDuggcWNSpomeP5CAB+lx3Ysfh
	9hlFuB1XIUtp6234YLp02BOGw7X0FIRHo9vThZ78VZaZ5d9nb3sqPk1ojpNeutFCXUjB63eA/dtix
	8imfDyEn5V90vAfgS9TN/385eGJxvmrwYeEwnONpPd/ZednR2lZ6FSh3JFMCawBqckgsO+YhdIDkg
	6hmmroZT42FB5fjn//A6DdVxjqGMh529b3hqZBu+8peH32IxjNyDY/fhW199haWgGQ/kXr35/zYw+
	qmfS4dgkzwhr7mgObTSKMwY7YJi38BxFRUc+MAonBA/A0vx6KZEei/L0zHMlSDzeJr/XJOYoSHx9G
	x60AoEFA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xa6-000000000OF-0so7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:17:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BE1C1476;
	Tue,  8 Sep 2026 08:17:49 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 25AF93F7B4;
	Tue,  8 Sep 2026 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880672; bh=XfPVvq8e9tGKo018JKnP1xN3ulUHGDRgrdtFYDoHbhQ=;
	h=From:To:Cc:Subject:Date:From;
	b=eC1JwmJXjAGjIR8jtufTmIkRWC9+mz95Z+2YR5MTq9dTvmA3NECireUnkC1iacjsd
	 FLVOJoxem4DY8FJshVvwvNaOM6Yjz4+Tr+4k/HLioTAHN1MC9dfj0yOIjtKcmpvPQI
	 uyBIzAhSeZCKdYV2y4Ibzr5ehUtu5O0lwmD9vzh8=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 00/21] Preemptible this_cpu_*() operations
Date: Tue,  8 Sep 2026 16:17:20 +0100
Message-Id: <20260908151741.394589-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161754_662286_CCEFB315 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series reworks arm64's this_cpu_*() operations such that they do
not need to disable preemption. The scheme is described in detail in patch 13,
and is similar to the approach Heiko Carstens applied to s390 [1], which
inspired this series.

This scheme should build and function in all kernel configurations (e.g.
regardless of KPTI, SW PAN, CNP, VA BITS), and has no dependency on new
architectural features. The fixup logic should "just work" with kprobes,
etc, and I don't expect that this will need to become more complicated.

The patches are organised as follows:

* Patches 1 to 3 are preparatory fixes for latent issues which were
  found by inspection. These will need to be backported to stable, and
  have appropriate Fixes tags.

* Patches 4 to 7 are preparatory improvements to code generation issues
  found by inspection during development. These aren't strictly related
  to the PCPU GPR scheme, and it would make sense to queue these even if
  we don't go ahead with the rest of the series.

* Patches 8 to 13 are preparatory work for the PCPU GPR scheme.

* Patch 14 implements the core of the PCPU GPR scheme, with all the
  necessary exception handling logic, and the addition of helpers to
  begin/end a PCPU GPR critical section.

* Patches 15 to 20 convert this_cpu_*() operations over to the PCPU GPR
  scheme. These changes have been made over several patches to aid
  review and bisection (if necessary).

* Patch 21 removes code made redundant by earlier patches.

I've given this build-testing (with GCC and clang) and some light boot
testing.

Since v1 [2]:
* Implement necessary SDEI entry logic.
* Drop RFC tag, as I believe this is now functionally complete.
* Add patches to fix latent bugs and poor codegen (per David, and myself)
* Make gpr-num handling consistent with asm-extable.h
* Assert PCPU GPRs are distinct at compile time (per Vladimir)
* Add comments to document PCPU GPR helpers.
* Improve commit messages.
* Add tags from v1.

Since v2 [3]:
* Rebase to v7.3-rc1.
* Fix SDEI register restoration.
* Avoid -Woverflow warnings.
* Add preparatory fix for {8,16}-bit types.
* Add tags from v2.

Since v3 [4]:
* (hopefully) correct CC list and send this out without issues.
* Add Jinjie's Reviewed-by tag on patch 3.
* No other changes.

Thanks,
Mark.

[1] https://lore.kernel.org/linux-s390/20260526055702.1429061-1-hca@linux.ibm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20260728123859.2911495-1-mark.rutland@arm.com/
[3] https://lore.kernel.org/linux-arm-kernel/20260804170503.3513916-1-mark.rutland@arm.com/
[4] https://lore.kernel.org/linux-arm-kernel/20260904161758.376504-1-mark.rutland@arm.com/

Mark Rutland (21):
  arm64: percpu: Fix this_cpu_write() casting
  arm64: percpu: Fix this_cpu_and() mask generation
  arm64: percpu: Fix LSE operations on {8,16}-bit types
  arm64: cmpxchg: LL/SC: Avoid redundant extension
  arm64: cmpxchg128: LSE: Remove redundant operands
  arm64: preempt: Simplify and optimize __preempt_count_dec_and_test()
  arm64: preempt: Treat should_resched() as unlikely
  arm64: ptrace: Always inline pt_regs_[read,write}_reg()
  arm64: percpu: Factor out percpu offset asm
  arm64: gpr-num: Add wxN aliases for wN registers
  arm64: gpr-num: add __GPR_NUM() helper
  arm64: entry: sdei: Restore all clobberable GPRs
  arm64: entry: sdei: Make 'tsk' available
  arm64: percpu: Add infrastructure for preemptible this_cpu_*() ops
  arm64: percpu: Implement preemptible read/write ops
  arm64: percpu: Implement preemptible void RMW ops
  arm64: percpu: Implement preemptible return RMW ops
  arm64: percpu: Implement preemptible XCHG ops
  arm64: percpu: Implement preemptible CMPXCHG ops
  arm64: percpu: Implement preemptible CMPXCHG128 ops
  arm64: percpu: Remove _pcp_protect*() wrappers

 arch/arm64/include/asm/atomic_ll_sc.h |  27 +-
 arch/arm64/include/asm/atomic_lse.h   |   4 +-
 arch/arm64/include/asm/gpr-num.h      |   9 +
 arch/arm64/include/asm/percpu.h       | 462 ++++++++++++++++++++------
 arch/arm64/include/asm/preempt.h      |  29 +-
 arch/arm64/include/asm/ptrace.h       |  12 +-
 arch/arm64/include/asm/thread_info.h  |   1 +
 arch/arm64/include/asm/xwreg.h        |  16 +
 arch/arm64/kernel/asm-offsets.c       |   2 +
 arch/arm64/kernel/entry-common.c      |  38 +++
 arch/arm64/kernel/entry.S             |  41 ++-
 11 files changed, 497 insertions(+), 144 deletions(-)
 create mode 100644 arch/arm64/include/asm/xwreg.h

-- 
2.30.2


