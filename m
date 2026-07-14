Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BC2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMjKvPGSVEuyGr8NStFYG6M23nRoJtMCIfdH5YFSiIY=; b=BqE+Wqt+t70++nl0nAtKZYKzGm
	9Ds0Zh27Mf4HOkto11CPqO3ikA6NH1f1plREIjLLe3/UtNcnNSsALd/g5F/oSJQhO9/+Ubnut0EMF
	ohu5qIvgjjH5oSL3YR6VLZC2v34A7nA1/a7BEb2naj6UPeZGLCBuNbpLwPNHIEZ9pvJsEWjZW21ux
	cvB5TgudfviqDYf+BIUktW+4zi+nDzO7AvcUJJs/wSh3vtnY35sghTXGXMJr95yR29DyuDGErVwtB
	pedmFmZvK6X0qV1ZkwcCFfsEDJBOd6vx2pmdqOGWQC1nP+z6OzfrzVKAfhwcoqIo9vfTHdehW2S6u
	rckU/L4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYeB-0000000BKcJ-2oGG;
	Tue, 14 Jul 2026 08:37:48 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYe6-0000000BKZw-0JEa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:37:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LMjKvPGSVEuyGr8NStFYG6M23nRoJtMCIfdH5YFSiIY=;
	b=o4/s1Qq954BXhSPk9qj1Gt+qYneYOecwLO6SHlQPyTmKmAGOUtMhJqU0Z1W74yGFRifl/L7Qf
	/zn+pfCTDhJ3r8vYlbA0aMuAl30tJ/Sk2bjwc96xDTsGTtzmg5gb81Nm1Rh+RxqbZQ7mTK9Kost
	EDUy/L+mISBGfPYt8tIkLA4=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gzsrT5TnvzKm6r;
	Tue, 14 Jul 2026 16:28:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F375540580;
	Tue, 14 Jul 2026 16:37:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 16:37:29 +0800
Message-ID: <375ee9ac-f715-47bf-8f0d-7ec8dc35c7f2@huawei.com>
Date: Tue, 14 Jul 2026 16:37:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/36] arm64: Add support for FEAT_NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_013742_765855_FA690AEA 
X-CRM114-Status: GOOD (  32.58  )
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

Hi, Vladimir,

On QEMU, if the CPU supports FEAT_NMI but gic-version=2, the kernel
panic as following:

[    0.000000] CPU features: detected: HCRX_EL2 register
[    0.000000] CPU features: detected: Non-maskable Interrupts
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: root=/dev/vda rw console=ttyAMA0
kgdboc=ttyAMA0,115200 earlycon preempt=full irqchip.gicv3_pseudo_nmi=0 0
[    0.000000] Unknown kernel command line parameters "preempt=full",
will be passed to user space.
[    0.000000] printk: log buffer data + meta data: 131072 + 458752 =
589824 bytes
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11,
8388608 bytes, linear)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10,
4194304 bytes, linear)
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: mapped [mem
0x00000000e4000000-0x00000000e8000000] (64MB)
[    0.000000] Fallback order for Node 0: 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
3145728
[    0.000000] Policy zone: Normal
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] Running RCU self tests
[    0.000000] Running RCU synchronous self tests
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU lockdep checking is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=512 to
nr_cpu_ids=8.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] Running RCU synchronous self tests
[    0.000000] RCU Tasks: Setting shift to 3 and lim to 1
rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] ------------[ cut here ]------------
[    0.000000] Could not request IRQ 4 as NMI, err=-22
[    0.000000] WARNING: arch/arm64/kernel/smp.c:1103 at
set_smp_ipi_range_percpu+0x2c0/0x31c, CPU#0: swapper/0/0
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.2.0-rc1-00036-g6fbe132d3a74-dirty #353 PREEMPT
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -ALLINT -PAN -UAO -TCO -DIT
-SSBS BTYPE=--)
[    0.000000] pc : set_smp_ipi_range_percpu+0x2c0/0x31c
[    0.000000] lr : set_smp_ipi_range_percpu+0x2c0/0x31c
[    0.000000] sp : ffffffdadd5d3b90
[    0.000000] x29: ffffffdadd5d3b90 x28: 0000000000102200 x27:
ffffffdadc1e49a0
[    0.000000] x26: ffffff82fe7a7008 x25: 0000000000000008 x24:
0000000000000004
[    0.000000] x23: ffffffdadd5e4078 x22: ffffffdadc9340c8 x21:
ffffffdadc92c470
[    0.000000] x20: 0000000000000003 x19: ffffffdadd5e02b0 x18:
00000000ffffffff
[    0.000000] x17: 20313d7473756a64 x16: 615f62635f6b7361 x15:
ffffffdb5d5d37b7
[    0.000000] x14: 0000000000000000 x13: ffffffdadd60aaa8 x12:
0000000000000041
[    0.000000] x11: 00000000000000c3 x10: ffffffdadd67aa90 x9 :
ffffffdadd60aaa8
[    0.000000] x8 : 3ffffffffffff000 x7 : 0000000000000001 x6 :
0000000000000001
[    0.000000] x5 : ffffffdadd662aa8 x4 : 0000000000000000 x3 :
0000000000000000
[    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
ffffffdadd5eb780
[    0.000000] Call trace:
[    0.000000]  set_smp_ipi_range_percpu+0x2c0/0x31c (P)
[    0.000000]  __gic_init_bases+0x138/0x148
[    0.000000]  gic_of_init+0x88/0x3ec
[    0.000000]  of_irq_init+0x1bc/0x458
[    0.000000]  irqchip_init+0x18/0x40
[    0.000000]  init_IRQ+0xa8/0x218
[    0.000000]  start_kernel+0x550/0xa98
[    0.000000]  __primary_switched+0x88/0x90
[    0.000000] Kernel panic - not syncing: kernel: panic_on_warn set ...
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.2.0-rc1-00036-g6fbe132d3a74-dirty #353 PREEMPT
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] Call trace:
[    0.000000]  show_stack+0x18/0x24 (C)
[    0.000000]  dump_stack_lvl+0x18c/0x1d4
[    0.000000]  dump_stack+0x18/0x24
[    0.000000]  vpanic+0x590/0x594
[    0.000000]  do_panic_on_target_cpu+0x0/0x1c
[    0.000000]  check_panic_on_warn+0x8c/0x9c
[    0.000000]  __warn+0xa0/0x2cc
[    0.000000]  __report_bug+0xe0/0x19c
[    0.000000]  report_bug+0x50/0x10c
[    0.000000]  bug_brk_handler+0x24/0x70
[    0.000000]  call_el1_break_hook+0x6c/0xc8
[    0.000000]  do_el1_brk64+0x24/0x4c
[    0.000000]  el1_brk64+0x38/0x64
[    0.000000]  el1h_64_sync_handler+0xa8/0x134
[    0.000000]  el1h_64_sync+0x80/0x84
[    0.000000]  set_smp_ipi_range_percpu+0x2c0/0x31c (P)
[    0.000000]  __gic_init_bases+0x138/0x148
[    0.000000]  gic_of_init+0x88/0x3ec
[    0.000000]  of_irq_init+0x1bc/0x458
[    0.000000]  irqchip_init+0x18/0x40
[    0.000000]  init_IRQ+0xa8/0x218
[    0.000000]  start_kernel+0x550/0xa98
[    0.000000]  __primary_switched+0x88/0x90
[    0.000000] ---[ end Kernel panic - not syncing: kernel:
panic_on_warn set ... ]---


On 7/9/2026 8:12 PM, Vladimir Murzin wrote:
> FEAT_NMI provides an architected mechanism for supporting non-maskable
> interrupts (NMIs) and less-masked interrupts (LMIs).
> 
> Since we already support pseudo-NMIs via priority masking, introducing
> another flavour of NMI on top of the existing infrastructure could
> easily become messy, making the code harder to follow and reason
> about.
> 
> To avoid that, this series first makes room for the new NMI "tenant"
> by restructuring the existing exception masking logic.
> 
> The main idea is to separate the logical view of exception state from
> its hardware representation. To achieve this, we introduce logical
> exception contexts that can be mapped onto the corresponding hardware
> state. This naturally consolidates the hardware-specific handling into
> a small number of places, while allowing the rest of the code to
> operate purely in terms of logical exception contexts.
> 
> Since this restructuring is non-trivial and carries a risk of subtle
> behavioural changes, the series adds extensive debug checks to verify
> that the hardware state always matches the expected logical state.
> 
> With this restructuring in place, wiring FEAT_NMI into the new
> framework becomes much more manageable.
> 
> This work would not have been possible without the contributions of
> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
> them for everything that works well. Any remaining bugs or issues are
> entirely my own.
> 
> I'd especially appreciate feedback on the overall approach. Please
> don't hesitate to bikeshed the naming or other details - improving
> clarity is one of the main goals of this series. Of course, technical
> review is more than welcome as well.
> 
> The series would also benefit from extensive testing on real hardware
> (without NMI, with pseudo-NMI, and with FEAT_NMI), as most of the
> testing so far has been done on QEMU and FVP.
> 
> P.S.
> I'm aware that Jinjie Ruan has a similar series on the mailing
> list. I'm very open to collaborating and aligning our efforts if that
> makes sense.
> 
> Thanks
> Vladimir
> 
> Ada Couprie Diaz (19):
>   arm64: debug: don't mask DAIF for mdscr_write()
>   arm64: hibernate: mask DAIF before restoring hibernated kernel
>   arm64: suspend: rely on daif helpers to handle PMR
>   arm64: irq: introduce a helper for GIC priority initialization
>   arm64: entry: mask DAIF before returning from C EL1 handlers
>   irqchip/gic-v3: make the unmasking of pseudo-NMIs explicit when
>     handling IRQs
>   arm64: irqflags: introduce arm64-specific irqflags type
>   arm64: irqflags: save and use both DAIF and PMR
>   arm64: interrupts: introduce interrupt masking helpers for entry code
>   arm64: entry: replace DAIF helpers with entry helpers
>   arm64: interrupts: introduce generic interrupt masking helpers
>   arm64: replace local_daif helpers
>   arm64: cpuidle: use new helpers to bypass interrupt priority masking
>   arm64: remove daifflags.h
>   arm64: gicv3: remove GIC_PRIO_PSR_I_SET
>   arm64: ptrace: Add PSR_ALLINT_BIT
>   arm64: cpufeature: Detect PE support for FEAT_NMI
>   arm64: nmi: Manage masking for superpriority interrupts
>   arm64: irq: Report FEAT_NMI masking local IRQs
> 
> Lorenzo Pieralisi (1):
>   irqchip/gic-v3: Implement FEAT_GICv3_NMI support
> 
> Mark Brown (5):
>   arm64: booting: Document boot requirements for FEAT_NMI
>   arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
>   arm64: idreg: Add an override for FEAT_NMI
>   arm64: nmi: Add handling of superpriority interrupts as NMIs
>   arm64: nmi: Add Kconfig for NMI
> 
> Vladimir Murzin (11):
>   arm64: ptrace: Remove INIT_PSTATE_EL2
>   arm64: suspend: Initialize PMR on resume
>   arm64: process: Use helper to check exception state
>   arm64: cpufeature: Remove system_has_prio_mask_debugging()
>   arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
>   arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
>   efi/runtime-wrappers: Permit architectures to override IRQ flags
>     checks
>   arm64/efi: Implement override for IRQ flags checks
>   arm64: suspend: Always initialise PSTATE.ALLINT
>   arm64/efi: Add ALLINT to IRQ flags checks
>   arm64: kprobes: Disable NMIs
> 
>  Documentation/arch/arm64/booting.rst          |   6 +
>  arch/arm/include/asm/arch_gicv3.h             |   6 +-
>  arch/arm64/Kconfig                            |  29 +-
>  arch/arm64/include/asm/arch_gicv3.h           |   7 +-
>  arch/arm64/include/asm/assembler.h            |  24 +-
>  arch/arm64/include/asm/cpucaps.h              |   2 +
>  arch/arm64/include/asm/cpufeature.h           |  14 +-
>  arch/arm64/include/asm/cpuidle.h              |  14 +-
>  arch/arm64/include/asm/daifflags.h            | 144 --------
>  arch/arm64/include/asm/efi.h                  |  42 ++-
>  arch/arm64/include/asm/entry-common.h         |  10 +-
>  .../include/asm/interrupts/common_flags.h     | 248 ++++++++++++++
>  arch/arm64/include/asm/interrupts/entry.h     | 116 +++++++
>  arch/arm64/include/asm/interrupts/masking.h   | 176 ++++++++++
>  arch/arm64/include/asm/irqflags.h             | 148 ++++-----
>  arch/arm64/include/asm/kvm_host.h             |   1 -
>  arch/arm64/include/asm/mmu_context.h          |   1 -
>  arch/arm64/include/asm/ptrace.h               |  17 +-
>  arch/arm64/include/asm/sysreg.h               |   2 +
>  arch/arm64/include/uapi/asm/ptrace.h          |   1 +
>  arch/arm64/kernel/acpi.c                      |  15 +-
>  arch/arm64/kernel/cpufeature.c                |  68 +++-
>  arch/arm64/kernel/debug-monitors.c            |   4 -
>  arch/arm64/kernel/entry-common.c              | 311 ++++++++++++------
>  arch/arm64/kernel/entry.S                     |  18 +-
>  arch/arm64/kernel/hibernate.c                 |  23 +-
>  arch/arm64/kernel/irq.c                       |   9 +-
>  arch/arm64/kernel/machine_kexec.c             |   4 +-
>  arch/arm64/kernel/pi/idreg-override.c         |   1 +
>  arch/arm64/kernel/probes/kprobes.c            |  24 +-
>  arch/arm64/kernel/process.c                   |  24 +-
>  arch/arm64/kernel/setup.c                     |   4 +-
>  arch/arm64/kernel/signal.c                    |   1 -
>  arch/arm64/kernel/smp.c                       |  18 +-
>  arch/arm64/kernel/suspend.c                   |  26 +-
>  arch/arm64/kernel/traps.c                     |   1 -
>  arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
>  arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
>  arch/arm64/kvm/hyp/vhe/switch.c               |  12 +-
>  arch/arm64/mm/fault.c                         |   1 -
>  arch/arm64/mm/mmu.c                           |   7 +-
>  arch/arm64/mm/proc.S                          |   7 +
>  arch/arm64/tools/cpucaps                      |   2 +
>  drivers/firmware/efi/runtime-wrappers.c       |  32 +-
>  drivers/irqchip/irq-gic-v3.c                  | 127 +++++--
>  include/linux/irqchip/arm-gic-v3-prio.h       |   8 -
>  include/linux/irqchip/arm-gic-v3.h            |   4 +
>  47 files changed, 1247 insertions(+), 521 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/daifflags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
> 


