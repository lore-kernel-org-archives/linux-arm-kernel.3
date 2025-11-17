Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1473ACEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yfb31dMONbaywXFaOoW6pTDnX2BiBdF8XhLIsRZ9Sas=; b=Kt2XdXwaGRb1hKmbDt3095zGS+
	yByk4NzsGrHwspDNzzm6YtO9WV0tPGm6rBUqQ/BJcq9TEGdjTNsKAepB/GodWZCWk87Kvr7v7nxOi
	Y/XtGmFdwK3YspN/5WIlbEwjWUXf/4OXg4PX6TdD/i+0CvOmkeN6aAAY4rvK9vWNIvblfL1gcc5i5
	9FTib66K9GDtYkOaQXFGpas5cUd47+VHvG06MqGSBqunX+V6zBCTbU4ZxviiXjzRdFPZFCZcY8jAw
	YqnTzLnDzi8PlyfMNb1nBFV518KpHLob8iLPMT0s3C/JGdHQFHom3nsKJdeZwzzAAmedgS+AsCrCJ
	0bSltmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzKH-0000000GB9t-3lm1;
	Mon, 17 Nov 2025 13:31:25 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzK7-0000000GB39-0P6S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:31:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Yfb31dMONbaywXFaOoW6pTDnX2BiBdF8XhLIsRZ9Sas=;
	b=1pDygRjjuX+Lyw2evxjsjZV9+mweSjoS419Q1YDrVjgO7uDvUrGP489oAIKAJrnTcvdlsGTcA
	5yxdg2OltwvISIqLE/IY7JVUsUjWE2/5RbV66TlysXDNJFUJSy8BAqzjmzbaZzurSF2jM6raR0w
	53Cy8N/skEj7z/g28YGrkE4=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4d97r95d9czpSyw;
	Mon, 17 Nov 2025 21:29:13 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AF1CC180477;
	Mon, 17 Nov 2025 21:31:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 17 Nov
 2025 21:31:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <ldv@strace.io>, <macro@orcam.me.uk>,
	<deller@gmx.de>, <mark.rutland@arm.com>, <song@kernel.org>, <mbenes@suse.cz>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<pengcan@kylinos.cn>, <dvyukov@google.com>, <kmal@cock.li>,
	<lihongbo22@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 00/11] arm64: entry: Convert to Generic Entry
Date: Mon, 17 Nov 2025 21:30:37 +0800
Message-ID: <20251117133048.53182-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_053115_733880_BE4DB069 
X-CRM114-Status: GOOD (  17.18  )
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

Currently, x86, Riscv, Loongarch use the Generic Entry which makes
maintainers' work easier and codes more elegant. arm64 has already
successfully switched to the Generic IRQ Entry in commit
b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
time to completely convert arm64 to Generic Entry.

The goal is to bring arm64 in line with other architectures that already
use the generic entry infrastructure, reducing duplicated code and
making it easier to share future changes in entry/exit paths, such as
"Syscall User Dispatch".

This patch set is rebased on v6.18-rc6.

The performance benchmarks from perf bench basic syscall on
real hardware are below:

| Metric     | W/O Generic Framework | With Generic Framework | Change |
| ---------- | --------------------- | ---------------------- | ------ |
| Total time | 2.813 [sec]           | 2.930 [sec]            |  ↑4%   |
| usecs/op   | 0.281349              | 0.293006               |  ↑4%   |
| ops/sec    | 3,554,299             | 3,412,894              |  ↓4%   |

Compared to earlier with arch specific handling, the performance decreased
by approximately 4%.

It was tested ok with following test cases on QEMU virt platform:
 - Perf tests.
 - Different `dynamic preempt` mode switch.
 - Pseudo NMI tests.
 - Stress-ng CPU stress test.
 - MTE test case in Documentation/arch/arm64/memory-tagging-extension.rst
   and all test cases in tools/testing/selftests/arm64/mte/*.
 - "sud" selftest testcase.
 - get_syscall_info, peeksiginfo in tools/testing/selftests/ptrace.

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

Chanegs in v7:
- Support "Syscall User Dispatch" by implementing
  arch_syscall_is_vdso_sigreturn() as kemal suggested.
- Add aarch64 support for "sud" selftest testcase, which tested ok with
  the patch series.
- Fix the kernel test robot warning for arch_ptrace_report_syscall_entry()
  and arch_ptrace_report_syscall_exit() in asm/entry-common.h.
- Add perf syscall performance test.
- Link to v6: https://lore.kernel.org/all/20250916082611.2972008-1-ruanjinjie@huawei.com/

Changes in v6:
- Rebased on v6.17-rc5-next as arm64 generic irq entry has merged.
- Update the commit message.
- Link to v5: https://lore.kernel.org/all/20241206101744.4161990-1-ruanjinjie@huawei.com/

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
- Link to v4: https://lore.kernel.org/all/20241025100700.3714552-1-ruanjinjie@huawei.com/

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
- Link to v3: https://lore.kernel.org/all/20240629085601.470241-1-ruanjinjie@huawei.com/

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

Jinjie Ruan (10):
  arm64/ptrace: Split report_syscall()
  arm64/ptrace: Refactor syscall_trace_enter/exit()
  arm64/ptrace: Refator el0_svc_common()
  entry: Add syscall_exit_to_user_mode_prepare() helper
  arm64/ptrace: Handle ptrace_report_syscall_entry() error
  arm64/ptrace: Expand secure_computing() in place
  arm64/ptrace: Use syscall_get_arguments() heleper
  entry: Add arch_ptrace_report_syscall_entry/exit()
  entry: Add has_syscall_work() helper
  arm64: entry: Convert to generic entry

kemal (1):
  selftests: sud_test: Support aarch64

 arch/arm64/Kconfig                            |  2 +-
 arch/arm64/include/asm/entry-common.h         | 69 ++++++++++++++
 arch/arm64/include/asm/syscall.h              | 29 +++++-
 arch/arm64/include/asm/thread_info.h          | 22 +----
 arch/arm64/kernel/debug-monitors.c            |  7 ++
 arch/arm64/kernel/ptrace.c                    | 90 -------------------
 arch/arm64/kernel/signal.c                    |  2 +-
 arch/arm64/kernel/syscall.c                   | 31 ++-----
 include/linux/entry-common.h                  | 42 ++++++---
 kernel/entry/syscall-common.c                 | 43 ++++++++-
 .../syscall_user_dispatch/sud_test.c          |  4 +
 11 files changed, 188 insertions(+), 153 deletions(-)

-- 
2.34.1


