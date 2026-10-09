Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DA6CA601C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEBevZt8DA6W+E15e+36sCnrm9+ONPQxDT/m/YIsKHs=; b=Dwtf7ggce14qulCGRqfa5+MFBp
	TC6cpZTFnRYwz2KtQzfMgm4oq+VbwDLyDcoki9hNcIDDkJ0/cUB1SLxQzFFQ5bwqdwZgMBpMrGkdD
	wdFI+PZYEeOQEqY97Y979wkmJslY9CwgNS0Enj8oJSx3LSElpzSJfATNSdWW1AIlZsEQKbELCLjCM
	W+HR37RjaTUt9PEPOz/wuyJn5+p15ZbTAu6KbrUz/edSUKZkT2PEUpnB7EQn/gTzUVwHsE5Um0mpW
	CSbsqjUT4Nebg6fZ4dEg7rq7A8T300ScAXSGdV5fLYlh+4t4YMcnwKKA3uomNtvxEvFb5oQTKom49
	x1UovcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7W1-00000005yo6-0Wee;
	Fri, 09 Oct 2026 10:07:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7W0-00000005yng-1KHO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:07:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 64A496053A;
	Fri,  9 Oct 2026 10:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB45C1F000FF;
	Fri,  9 Oct 2026 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540467;
	bh=GEBevZt8DA6W+E15e+36sCnrm9+ONPQxDT/m/YIsKHs=;
	h=From:To:Cc:Subject:Date;
	b=O+rd38II3NHqSXLeMx05k6vOAK0swCQZvqoTneP1ZH84AJh1o/5CSfJs0VLCiduko
	 TEwYKtNmwvLkxJ94Nbsv6KjfvPgy5LMVZjLOneqy/nRwQcg3vAuyBElmeMb/eNMz8Q
	 nPyvNXyK5y9Ct2dPOwob+HPgSgVuxP2YbETveuRWSnVliw2TwPGh275L+zQvHArWdY
	 AJPRvRacAhnL0q8iuNjajeIeM0Kw54o30tpPAuGzxmsz9Rgv05scJOmBWboxpZUM/0
	 fFnwXLSlIb+VpNQdiSVozDFOv+2VvK+TkrEyNgBmvFGtsfh7POqJ2iAtNkWBpGAh/i
	 XHXX4voXCogow==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 00/23] arm64: Implement parallel CPU onlining with PSCI v0.2+
Date: Fri,  9 Oct 2026 11:07:11 +0100
Message-ID: <20261009100738.31288-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi everyone,

This is version two of the patches I previously posted here:

  https://lore.kernel.org/all/20260907164024.17164-1-will@kernel.org/

There have been quite a few changes since last time, thanks to all the
feedback from humans and robots alike. These include:

  * Added tags (but I didn't carry over Pankaj's T-b, since the series
    has changed a fair bit).

  * Fix secondary entry assembly code to handle timeouts correctly.

  * Fix stashing of MPIDR so that we don't clobber STACK_END_MAGIC.

  * Fix NULL dereference if PSCI fails to initialise.

  * Enable RCU as soon as a secondary CPU is alive.

  * Drop pointless (unreachable) optimisation to
    arch_cpuhp_sync_state_poll().

  * Include cpufeature patches from Fuad so that 'cpu_data' is populated
    with register values taking into account any cmdline overrides. This
    is necessary for correct handling of 'boot_cpu_data' later on, where
    the previous version of this series stashed a stale copy of mpamidr.

As before, the first four patches are small changes to the generic code
to make it a little more "Arm-shaped" but the rest of the series is
largely confined to the arm64 architecture and PSCI driver code.

The series is based on -rc2, as it otherwise conflicts with Fuad's GMID
fix that was recently merged upstream.

Cheers,

Will

Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Ștefania Ion <stefion@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Tarun Sahu <tarunsahu@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>

--->8

Fuad Tabba (4):
  arm64: cpufeature: Check arm64_ftr_regs[] before the first store
  arm64: cpufeature: Add read_cpuid_with_overrides()
  arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()
  arm64: cpufeature: Store every ID register with its overrides applied

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
 arch/arm64/include/asm/cpufeature.h       |  11 +
 arch/arm64/include/asm/smp.h              |  40 ++-
 arch/arm64/include/asm/topology.h         |   2 +
 arch/arm64/kernel/acpi_parking_protocol.c |   3 +-
 arch/arm64/kernel/asm-offsets.c           |   1 +
 arch/arm64/kernel/cpu_ops.c               |  34 +-
 arch/arm64/kernel/cpufeature.c            | 397 +++++++++++-----------
 arch/arm64/kernel/cpuinfo.c               | 122 +++----
 arch/arm64/kernel/head.S                  |  60 +++-
 arch/arm64/kernel/psci.c                  |  14 +-
 arch/arm64/kernel/smp.c                   | 183 +++++-----
 arch/arm64/kernel/smp_spin_table.c        |   2 +-
 arch/arm64/mm/mmu.c                       |   2 +-
 arch/x86/kernel/smpboot.c                 |   4 +-
 drivers/firmware/psci/psci.c              |  27 +-
 include/linux/cpuhotplug.h                |   2 +-
 include/linux/psci.h                      |   3 +-
 include/linux/rcutree.h                   |   2 +-
 kernel/cpu.c                              |  18 +-
 23 files changed, 508 insertions(+), 439 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog


