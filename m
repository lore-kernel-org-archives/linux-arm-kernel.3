Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DE0CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iPGcvAVp1oXIxzJFbEZ86u/y+qLs8C8zfcDLjjZ5AQo=; b=EJ+2jZ4zAj7D2uFNuu9J59XcuN
	CtF7VJI0QXn/dIOWv0mItPyMWJad0/i2RjE8QIeM1hQdn19Aa4OWjtLZmWPBzH2gM59npMYfP0scA
	TcmMFheFql19BGV/XDgdNFdvzxXzPQzlwoTKnH/ypfwo/p7xmCkx6WotK/vqDtjACmWSd45jqgFwz
	nj++VgW9acjeBe0d7V16K8HhIZEz+RNxC2qqlHb1fJwjXurZZ8QqZfevrkW+u94u0oNRnrMRtc9C0
	amxvFqQGGNYukKzAybW2nLKgLaFneWUQKUWlgm9GYHcKDtArTcoMXm5oV9DEgf2H02oV9tSdXEUOC
	kRPe5A7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uml6h-00000001IKc-0pyI;
	Fri, 15 Aug 2025 03:27:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkmc-00000001Fh5-2rjS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 03:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iPGcvAVp1oXIxzJFbEZ86u/y+qLs8C8zfcDLjjZ5AQo=; b=l7N4hO9nmFFwxCluRfXyWPWKMt
	SYS3zh03Vfm1fiF/3eI9L0FE9VZbhHoW2Yf0gjFKY2g6h0c9R8/XpTYm7cWF5TUMpzu+6PiEWR1d6
	MlG7YsjtORjxWTsoN+w+AHO7394CAzrMSmi8/PWShzGjElqFi6pXWD7vk/baUCdJ85l/iIp849JHl
	89xtaGgLPrgNddyLvuJHCsX2KKzo9rmBnnpqKkuvsJc84DycPTsJW7fmopgLVV+3HnwUfPvzpvD14
	1FKrj1zVgW2q9h7/Dm/cu9Fw0zPBN92ihwja8ZBwC00OBgPTTC3Ho0LLmjw6+O4x+Lt1FQLJyg4Et
	v9wAMlNg==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkmY-0000000GbS5-1gmv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:07:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c36TM0rqDzvX7F;
	Fri, 15 Aug 2025 11:06:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B5B50180B71;
	Fri, 15 Aug 2025 11:06:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 15 Aug
 2025 11:06:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<mbenes@suse.cz>, <broonie@kernel.org>, <anshuman.khandual@arm.com>,
	<ryan.roberts@arm.com>, <chenl311@chinatelecom.cn>, <liaochang1@huawei.com>,
	<kristina.martsenko@arm.com>, <leitao@debian.org>, <ardb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8 0/8] arm64: entry: Convert to generic irq entry
Date: Fri, 15 Aug 2025 11:06:25 +0800
Message-ID: <20250815030633.448613-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_040707_480942_761301D0 
X-CRM114-Status: GOOD (  23.05  )
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

Currently, x86, Riscv, Loongarch use the generic entry which makes
maintainers' work easier and codes more elegant. So also convert arm64
to use the generic entry infrastructure from kernel/entry/* by
switching it to generic IRQ entry first, which will make PREEMPT_DYNAMIC
and PREEMPT_LAZY use the generic entry common code and remove a lot of
duplicate code.

Since commit a70e9f647f50 ("entry: Split generic entry into generic
exception and syscall entry") split the generic entry into generic irq
entry and generic syscall entry, it is time to convert arm64 to use
the generic irq entry. And ARM64 will be completely converted to generic
entry in the upcoming patch series.

The main convert steps are as follows:
- Split generic entry into generic irq entry and generic syscall to
  make the single patch more concentrated in switching to one thing.
- Make arm64 easier to use irqentry_enter/exit().
- Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
- Switch to generic irq entry.

This patch set is rebased on v6.17-rc1.

It was tested ok with following test cases on QEMU virt platform:
 - Perf tests.
 - Different `dynamic preempt` mode switch.
 - Pseudo NMI tests.
 - Stress-ng CPU stress test.
 - MTE test case in Documentation/arch/arm64/memory-tagging-extension.rst
   and all test cases in tools/testing/selftests/arm64/mte/*.

The test QEMU configuration is as follows:

	qemu-system-aarch64 \
		-M virt,gic-version=3,virtualization=on,mte=on \
		-cpu max,pauth-impdef=on \
		-kernel Image \
		-smp 8,sockets=1,cores=4,threads=2 \
		-m 512m \
		-nographic \
		-no-reboot \
		-device virtio-rng-pci \
		-append "root=/dev/vda rw console=ttyAMA0 kgdboc=ttyAMA0,115200 \
			earlycon preempt=voluntary irqchip.gicv3_pseudo_nmi=1" \
		-drive if=none,file=images/rootfs.ext4,format=raw,id=hd0 \
		-device virtio-blk-device,drive=hd0 \

Changes in v8:
- Update the comment.
- Fix a typo, inerrupts_enabled(regs) -> interrupts_enabled(regs).
- Consistently defined 'state' on a separate line, before the main block.
- Split the "arch_irqentry_exit_need_resched()" patch.
- Fix CONFIG_PREEMPTION not set build issue.
- Remove do_signal() declaration in exception.h as there remains
  no users of `do_signal().
- Add asm/cpufeature.h header for entry-common.h
- Add Reviewed-by, Acked-by and Tested-by.
- Update the commit message.
- Link to v7: https://lore.kernel.org/all/20250729015456.3411143-1-ruanjinjie@huawei.com/

Changes in v7:
- Rebased on v6.16-rc7 and remove the merged first patch.
- Update the commit message.
- Link to v6: https://lore.kernel.org/all/20250213130007.1418890-1-ruanjinjie@huawei.com/

Changes in v6:
- Rebased on 6.14 rc2 next.
- Put the syscall bits aside and split it out.
- Have the split patch before the arm64 changes.
- Merge some tightly coupled patches.
- Adjust the order of some patches to make them more reasonable.
- Define regs_irqs_disabled() by inline function.
- Define interrupts_enabled() in terms of regs_irqs_disabled().
- Delete the fast_interrupts_enabled() macro.
- irqentry_state_t -> arm64_irqentry_state_t.
- Remove arch_exit_to_user_mode_prepare() and pull local_daif_mask() later
  in the arm64 exit sequence
- Update the commit message.
- Link to v5: https://lkml.org/lkml/2024/12/6/609

Changes in v5:
- Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
- Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
- Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
- Update "irqentry_state_t ret/irq_state" to "state"
  to keep it consistently.
- Use generic irq entry header for PREEMPT_DYNAMIC after split
  the generic entry.
- Also refactor the ARM64 syscall code.
- Introduce arch_ptrace_report_syscall_entry/exit(), instead of
  arch_pre/post_report_syscall_entry/exit() to simplify code.
- Make the syscall patches clear separation.
- Update the commit message.
- Link to v4: https://lkml.indiana.edu/2410.3/02309.html

Changes in v4:
- Rework/cleanup split into a few patches as Mark suggested.
- Replace interrupts_enabled() macro with regs_irqs_disabled(), instead
  of left it here.
- Remove rcu and lockdep state in pt_regs by using temporary
  irqentry_state_t as Mark suggested.
- Remove some unnecessary intermediate functions to make it clear.
- Rework preempt irq and PREEMPT_DYNAMIC code
  to make the switch more clear.
- arch_prepare_*_entry/exit() -> arch_pre_*_entry/exit().
- Expand the arch functions comment.
- Make arch functions closer to its caller.
- Declare saved_reg in for block.
- Remove arch_exit_to_kernel_mode_prepare(), arch_enter_from_kernel_mode().
- Adjust "Add few arch functions to use generic entry" patch to be
  the penultimate.
- Update the commit message.
- Add suggested-by.

Changes in v3:
- Test the MTE test cases.
- Handle forget_syscall() in arch_post_report_syscall_entry()
- Make the arch funcs not use __weak as Thomas suggested, so move
  the arch funcs to entry-common.h, and make arch_forget_syscall() folded
  in arch_post_report_syscall_entry() as suggested.
- Move report_single_step() to thread_info.h for arm64
- Change __always_inline() to inline, add inline for the other arch funcs.
- Remove unused signal.h for entry-common.h.
- Add Suggested-by.
- Update the commit message.

Changes in v2:
- Add tested-by.
- Fix a bug that not call arch_post_report_syscall_entry() in
  syscall_trace_enter() if ptrace_report_syscall_entry() return not zero.
- Refactor report_syscall().
- Add comment for arch_prepare_report_syscall_exit().
- Adjust entry-common.h header file inclusion to alphabetical order.
- Update the commit message.

Jinjie Ruan (8):
  arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
  arm64: entry: Refactor the entry and exit for exceptions from EL1
  arm64: entry: Rework arm64_preempt_schedule_irq()
  arm64: entry: Use preempt_count() and need_resched() helper
  entry: Add arch_irqentry_exit_need_resched() for arm64
  arm64: entry: Refactor preempt_schedule_irq() check code
  arm64: entry: Move arm64_preempt_schedule_irq() into
    __exit_to_kernel_mode()
  arm64: entry: Switch to generic IRQ entry

 arch/arm64/Kconfig                    |   1 +
 arch/arm64/include/asm/daifflags.h    |   2 +-
 arch/arm64/include/asm/entry-common.h |  57 ++++
 arch/arm64/include/asm/exception.h    |   1 -
 arch/arm64/include/asm/preempt.h      |   2 -
 arch/arm64/include/asm/ptrace.h       |  13 +-
 arch/arm64/include/asm/xen/events.h   |   2 +-
 arch/arm64/kernel/acpi.c              |   2 +-
 arch/arm64/kernel/debug-monitors.c    |   2 +-
 arch/arm64/kernel/entry-common.c      | 423 +++++++++-----------------
 arch/arm64/kernel/sdei.c              |   2 +-
 arch/arm64/kernel/signal.c            |   3 +-
 kernel/entry/common.c                 |  16 +-
 13 files changed, 230 insertions(+), 296 deletions(-)
 create mode 100644 arch/arm64/include/asm/entry-common.h

-- 
2.34.1


