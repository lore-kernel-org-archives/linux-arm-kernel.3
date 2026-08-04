Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF833C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fxGf4N20ENAHXc20vgPpSRT53N0WrRSizYa53VOaEhg=; b=i/6oxEelOohZzo
	C42pXSXGfK5pagPgpiyrFVFosNFXSTTqkPXdskZ+lSHJwv0xudiaDChs/eCUXqZ0qgNlFTxSqnFuN
	4v47ULD934S8NrUI63hYzCao0xZsriVLD93byw3d7h7yTLz5dCsPXp+itvEaluGk2++HjmwEAE5Gc
	S2YO1C/7otcZEBqPUMG03vbMBZ65shW7XjhYtqU6xnPttAB42rTT5prINzad9pbswlS9mHGhKqOun
	L2W6FV5/upM/RW1m/kKY+X4rDE1wVlPd+lZd+uHi/IBnCO1ihLj2JvykoNEoayYbdDp2HOOjfUu8H
	+Z1qAP0tS4+x6CtHjpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIZu-00000002Pku-1JXC;
	Tue, 04 Aug 2026 17:05:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIZr-00000002PkJ-2wQv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:05:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73FD91476;
	Tue,  4 Aug 2026 10:05:13 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1C533F632;
	Tue,  4 Aug 2026 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785863117; bh=gZNGC6ruDaoDqQPhAYuD/YBgVLMFoTaq8v5A+IfgFbw=;
	h=From:To:Cc:Subject:Date:From;
	b=V8eYBIcikEYhavoeAUKznir8BZ2mPwPFbWmYql5O2CiYB6RWXs1WWMi8dksm7Q8I9
	 FpvlYFPAtc+/hB1Tdd6vdkBtiwDBc5gYSK86vLWs1wcBS6nFbM8tj+vqqb5zQESxew
	 auRH5BOfSgle63SeG5ixyx7JYDDPfdYfz509RO/w=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/20] arm64: Preemptible this_cpu_*() operations
Date: Tue,  4 Aug 2026 18:04:43 +0100
Message-Id: <20260804170503.3513916-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100519_905301_A9E860E8 
X-CRM114-Status: GOOD (  21.49  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series reworks arm64's this_cpu_*() operations such that they do
not need to disable preemption, avoiding related overhead in the fast
paths. Instead, the ops begin/end a "PCPU GPR" critical section using
unconditional/posted stores, which should be very cheap on any
reasonable micro-architecture. During a critical section, should a
(preemptible) exception be taken, the entry code will apply a fixup to
the GPRs containing the percpu offset and the generated percpu address.

The scheme is described in detail in patch 13, and is similar to the
approach Heiko Carstens applied to s390 [1], which inspired this series.

Please note that the fixup IS NOT a restart. The GPR fixup in the
exception entry code DOES NOT alter the PC, and there are no necessary
branches within the PCPU GPR critical sections.

This scheme should build and function in all kernel configurations (e.g.
regardless of KPTI, SW PAN, CNP, VA BITS), and has no dependency on new
architectural features. The fixup logic should "just work" with kprobes,
etc, and I don't expect that this will need to become more complicated.

The patches are organised as follows:

* Patches 1 to 2 are preparatory fixes for latent issues which were
  found by inspection. These will need to be backported to stable, and
  have appropriate Fixes tags.

* Patches 3 to 6 are preparatory improvements to code generation issues
  found by inspection during development. These aren't strictly related
  to the PCPU GPR scheme, and it would make sense to queue these even if
  we don't go ahead with the rest of the series.

* Patches 7 to 12 are preparatory work for the PCPU GPR scheme.

* Patch 13 implements the core of the PCPU GPR scheme, with all the
  necessary exception handling logic, and the addition of helpers to
  begin/end a PCPU GPR critical section.

* Patches 14 to 19 convert this_cpu_*() operations over to the PCPU GPR
  scheme. These changes have been made over several patches to aid
  review and bisection (if necessary).

* Patch 20 removes code made redundant by earlier patches.

I've given this build-testing (with GCC and clang) and some light boot
testing, but this hasn't seen significant functional testing or
benchmarking. From inspection of the generated code I expect this to
have reasonable positive impact to performance where this_cpu*() ops are
used heavily. I would be grateful if anyone could take this for a spin.

From looking at the generated code, there are some additional savings we
could make with further changes, notably:

* Patching the read of TPIDR_ELx using a callback. This would remove the
  need for replacement instructions, saving ~12K for defconfig, and
  meaning real instructions in .text would be packed more densely.
  There's work underway to apply similar patching for
  ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE.

* Allowing {relocation,veneer}-free replacement sequences to be placed
  in .altinstr_replacement again. This would allow real instructions in
  .text to be packed more densely, with ~80K of .text moving into
  .altinstr_replacement where it would be freed after init.

  I've thrown together a prototype [2].

Since v1 [3]
* Implement necessary SDEI entry logic.
* Drop RFC tag, as I believe this is now functionally complete.
* Add patches to fix latent bugs and poor codegen (per David, and myself)
* Make gpr-num handling consistent with asm-extable.h
* Assert PCPU GPRs are distinct at compile time (per Vladimir)
* Add comments to document PCPU GPR helpers.
* Improve commit messages.
* Add tags from v1.

Thanks,
Mark.

[1] https://lore.kernel.org/linux-s390/20260526055702.1429061-1-hca@linux.ibm.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/alternatives/cleanup
[3] https://lore.kernel.org/linux-arm-kernel/20260728123859.2911495-1-mark.rutland@arm.com/

Mark Rutland (20):
  arm64: percpu: Fix this_cpu_write() casting
  arm64: percpu: Fix this_cpu_and() mask generation
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
 arch/arm64/kernel/entry.S             |  38 ++-
 11 files changed, 494 insertions(+), 144 deletions(-)
 create mode 100644 arch/arm64/include/asm/xwreg.h

-- 
2.30.2


