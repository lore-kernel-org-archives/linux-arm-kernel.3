Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74CBC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gBGuo6KnqXqsFfn3QCTJl5hI5ySulmyEQsyzQJEAmYs=; b=YM16+XEWztLWWXkzGNoR6Wvj6k
	RrmhMQ0veHJ5KNiw3Gvi/L6nJzKoYTAjMzMvtNTr9xgOBaXE50maYFCJoFXtYZQ5/j93S/b7UbMmt
	JmzmWxTGV4ouJvtZxRtu3dliY2xeN8W0hQegBtxn2gF47vDoRQ/vka/AmTLeKcRZTuyJ0wSA8GLz9
	mtVcM9lbEsmEzmB0yo0LmxYvZvBAVrFC/hr5h4N5SrxaRzSLW/JvBENMC28QKkSNII6htFyk0dzqV
	ZJdaEictUV7zLF+3Hltc0WnHdFOJ2CGOziI8CXl/oxcPPyKpwq+Qf107VhPV8pI4kJc+bW24+026k
	S3o2Wr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOb-00000007LEK-1xF4;
	Mon, 07 Sep 2026 16:40:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOa-00000007LE4-0B77
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:40:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C6AA601DB;
	Mon,  7 Sep 2026 16:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AF91F00A3A;
	Mon,  7 Sep 2026 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799235;
	bh=gBGuo6KnqXqsFfn3QCTJl5hI5ySulmyEQsyzQJEAmYs=;
	h=From:To:Cc:Subject:Date;
	b=KDV4y1v8guFhAijX8XKlKOXbsu1jybXCUHGgjBgiNH8zzx4oNNxD/reUghf/Rh7Ql
	 Qwvl/TYEg+xQSemO0RNjr4VvwuXfQmTjW2fwMVVZc30ngiA2qi1/jyBX9hrNLzFnDf
	 NDWSsHmJ+WrdgGyxeM0qjJsQIMIMP9KYZdyaY/3HhTnLYLuMFkCkhGIHDeZEIO+Jrl
	 ozHo8YbAM6/qacHrG5BZgJBPe2dXvMRXHu/22cacd/NgMf2OUrBzoRj6Wvj/peVhVH
	 h80Rv4zn1dilRK7+8EXrE1A16ktp0WHILM+ne4+Fez6n5alu5Z3Gie1Nz10IIr4+g4
	 n6vyabo0CDGeA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 00/19] arm64: Implement parallel CPU onlining with PSCI v0.2+
Date: Mon,  7 Sep 2026 17:40:03 +0100
Message-ID: <20260907164024.17164-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi folks,

This series implements CONFIG_HOTPLUG_PARALLEL for arm64 by utilising
the argument to CPU_ON introduced in PSCI v0.2. This supersedes the
previous series from Jinjie [1], and I'm grateful to him for his support
getting this alternative version in shape for posting.

I previously spoke at KVM forum about this work last year:

  https://www.youtube.com/watch?v=Q6kOshnnQuE

There are three major benefits realised by these changes:

1. We ditch our home-brew secondary CPU synchronisation in favour of
   constructs in the core code.

2. They offer a performance advantage on some platforms, where getting a
   CPU into the kernel can take time. I'm hoping Jinjie can provide
   numbers in this case.

3. When used inside a confidential guest, they provide protection
   against a malicious VMM that puts secondary CPUs into the guest
   kernel after the onlining operation has timed out.

The first four patches are small changes to the generic code to make it
a little more "Arm-shaped" but the rest of the series is largely
confined to the arm64 architecture and PSCI driver code.

The series is based on -rc2, as it otherwise conflicts with Fuad's GMID
fix that was recently merged upstream.

All feedback welcome,

Will

[1] https://lore.kernel.org/all/20260624092537.2916971-1-ruanjinjie@huawei.com/

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>

--->8

Will Deacon (19):
  cpu/hotplug: Clean up cmpxchg() logic in cpuhp_can_boot_ap()
  cpu/hotplug: Avoid trying to bring up CPUs that are already online
  cpu/hotplug: Avoid busy-polling on archs where cpu_relax() is a no-op
  cpu/hotplug: Propagate bring-up status to
    arch_cpuhp_cleanup_kick_cpu()
  arm64: smp: Tidy up smp_prepare_cpus()
  arm64: smp: Tidy up cpuinfo init and cpufeature updates
  arm64: smp: Defer update of secondary CPU capabilities
  arm64: smp: Don't bother printing the I-cache policy for each CPU
  arm64: smp: Defer RCU registration during secondary CPU bringup
  arm64: smp: Use generic HOTPLUG_CORE_SYNC_FULL machinery for CPU
    onlining
  arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP machinery for CPU
    onlining
  arm64: cpu_ops: Make 'cpu_operations' pointer global instead of
    per-cpu
  arm64: cpu_ops: Introduce get_secondary_cpu_ops()
  firmware/psci: Cache PSCI v0.2+ version number to avoid redundant SMCs
  firmware/psci: Extend ->cpu_on() callback to take an additional
    argument
  arm64: cpu_ops: Expose optional argument to target cpu in ->cpu_boot()
  arm64: smp: Pass secondary CPU boot parameters via firmware if
    possible
  arm64: smp: Use generic HOTPLUG_PARALLEL machinery for CPU onlining
  arm64: smp: Harden parallel CPU bringup against broken PSCI firmware

 arch/arm/kernel/psci_smp.c                |   4 +-
 arch/arm64/Kconfig                        |   2 +-
 arch/arm64/include/asm/cpu.h              |   7 +-
 arch/arm64/include/asm/cpu_ops.h          |   7 +-
 arch/arm64/include/asm/smp.h              |  40 +--
 arch/arm64/include/asm/topology.h         |   2 +
 arch/arm64/kernel/acpi_parking_protocol.c |   3 +-
 arch/arm64/kernel/asm-offsets.c           |   1 +
 arch/arm64/kernel/cpu_ops.c               |  34 ++-
 arch/arm64/kernel/cpufeature.c            | 322 ++++++++++++----------
 arch/arm64/kernel/cpuinfo.c               |  27 --
 arch/arm64/kernel/head.S                  |  64 ++++-
 arch/arm64/kernel/psci.c                  |  13 +-
 arch/arm64/kernel/smp.c                   | 179 ++++++------
 arch/arm64/kernel/smp_spin_table.c        |   2 +-
 arch/arm64/mm/mmu.c                       |   2 +-
 arch/x86/kernel/smpboot.c                 |   6 +-
 drivers/firmware/psci/psci.c              |  27 +-
 include/linux/cpuhotplug.h                |   4 +-
 include/linux/psci.h                      |   3 +-
 include/linux/rcutree.h                   |   2 +-
 kernel/cpu.c                              |  28 +-
 22 files changed, 429 insertions(+), 350 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog


