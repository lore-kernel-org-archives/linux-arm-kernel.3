Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800C0CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AshuMgjzKNtTEHe5GG+DsW28W+DLp587NdZboMQG2W4=; b=iYMrYwphDEsHoze9CPIEOSlbpT
	NwtCciszDQ6+S5EPLn5lt4XdfTjuw09r1MvuYDAK33Er4Qq/nC3xxgjq25lgZlKdVelQ6gYxfNNnU
	tk7BJCi4PSg/aW5PyrUx6knN3cJNzKBgqg1Q+uwmbSI8f9oUGNnvzVN/2AU6oUODZm7ab9zgHXvuH
	61i9Xr4XUBoBzEyNqveS2zKQVNeyMy0wMZk9zK5tlbLQpHgo4TTyQ1XAHFjw83QDTKhbF5As2p1ql
	qDWD9tEYnCts7jpxH/u3NRwoIL+AKjhBV37jkWl3FuMmSCj+dNWW29YAkWXFiJe3Lz94Z4OW3A1yJ
	vG5DX95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq0-0000000Csyu-3u5c;
	Mon, 11 May 2026 09:22:09 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpq-0000000CstE-0nc0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:22:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AshuMgjzKNtTEHe5GG+DsW28W+DLp587NdZboMQG2W4=;
	b=BH1acKMHIXstRmqQr0A/OFpD+8rBnDI8p6ZfvJOA50FoCQGY6hPyY+QlIq3PlufvvR2/Iv/jB
	q2d0oDHAQD7qek04inVLWr0wSfDKFzvuE8yWM/70UjowMEuecpSLXkXt3jMGHGGCTcFZJ+LXWGu
	43/9g5BK3t1XwpqWtbZDngU=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gDYvx20QYzpStn;
	Mon, 11 May 2026 17:14:53 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A04E4056D;
	Mon, 11 May 2026 17:21:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 17:21:49 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<mark.rutland@arm.com>, <yeoreum.yun@arm.com>, <linusw@kernel.org>,
	<kevin.brodsky@arm.com>, <ldv@strace.io>, <thuth@redhat.com>,
	<james.morse@arm.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 00/11] arm64: entry: Convert to Generic Entry
Date: Mon, 11 May 2026 17:20:52 +0800
Message-ID: <20260511092103.1974980-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022158_730333_683A54FF 
X-CRM114-Status: GOOD (  17.50  )
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
"Syscall User Dispatch" and RSEQ optimizations.

This patch set is rebased on arm64 v7.1-rc1 and [1]. This series contains
foundational updates for arm64. As suggested by Linus Walleij, these 11
patches are being submitted separately for inclusion in the arm64 tree.

And the performance benchmarks results on qemu-kvm are below:

perf bench syscall usec/op (-ve is improvement)

	| Syscall | Base        | Generic Entry | change % |
	| ------- | ----------- | ------------- | -------- |
	| basic   | 0.12551     | 0.12452       | -0.79    |
	| execve  | 560.8269    | 567.9967      | 1.28     |
	| fork    | 132.4888    | 134.8206      | 1.76     |
	| getpgid | 0.123818    | 0.121692      | -1.72    |

perf bench syscall ops/sec (+ve is improvement)

	| Syscall | Base     | Generic Entry| change % |
	| ------- | -------- | ------------ | -------- |
	| basic   | 7967632  | 8030784      | 0.79     |
	| execve  | 1783     | 1760         | -1.27    |
	| fork    | 7552     | 7422         | -1.72    |
	| getpgid | 8076393  | 8217469      | 1.75     |

Therefore, the syscall performance variation ranges from a 1.7% regression
to a 1.75% improvement.

It was tested ok with following test cases on QEMU virt platform:
 - Stress-ng CPU stress test.
 - Hackbench stress test.
 - "sud" selftest testcase.
 - get_set_sud, get_syscall_info, set_syscall_info, peeksiginfo
   in tools/testing/selftests/ptrace.
 - breakpoint_test_arm64 in selftests/breakpoints.
 - syscall-abi and ptrace in tools/testing/selftests/arm64/abi
 - fp-ptrace, sve-ptrace, za-ptrace in selftests/arm64/fp.
 - vdso_test_getrandom in tools/testing/selftests/vDSO
 - Strace tests.

The test QEMU configuration is as follows:

	qemu-system-aarch64 \
		-M virt \
		-enable-kvm \
		-cpu host \
		-kernel Image \
		-smp 8 \
		-m 512m \
		-nographic \
		-no-reboot \
		-device virtio-rng-pci \
		-append "root=/dev/vda rw console=ttyAMA0 kgdboc=ttyAMA0,115200 \
			earlycon irqchip.gicv3_pseudo_nmi=1" \
		-drive if=none,file=images/rootfs.ext4,format=raw,id=hd0 \
		-device virtio-blk-device,drive=hd0 \

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?h=arm64/rseq&id=05bce437d4f2fd14a7be4706c684a618e2fcc82f

Changes in v15:
- Rebased on v7.1-rc1 and Mark's fix patch in [1].
- Solve issues Sashiko AI pointed out, "Fix potential syscall truncation
  in syscall_trace_enter()".
- Make syscall_exit_to_user_mode_work() __always_inline to keep the fast-path
  performance as Sashiko pointed out.

Changes in v14:
- Initialize ret = 0 in syscall_trace_enter().
- Split into two patch sets as Linus Walleij suggested, so this patch set
  can be applied separately to the arm64 tree.
- Rebased on arm64 for-next/core branch.
- Collect Reviewed-by and Acked-by.
- Link to v13 resend: https://lore.kernel.org/all/20260317082020.737779-15-ruanjinjie@huawei.com/

Changes in v13 resend:
- Fix exit_to_user_mode_prepare_legacy() issues.
- Also move TIF_SINGLESTEP to generic TIF infrastructure for loongarch.
- Use generic TIF bits for arm64 and moving TIF_SINGLESTEP to
  generic TIF for related architectures separately.
- Refactor syscall_trace_enter/exit() to accept flags and Use
  syscall_get_nr() helper separately.
- Tested with slice_test for rseq optimizations.
- Add acked-by.
- Link to v13: https://lore.kernel.org/all/20260313094738.3985794-1-ruanjinjie@huawei.com/

Changes in v13:
- Rebased on v7.0-rc3, so drop the firt applied arm64 patch.
- Use generic TIF bits to enables RSEQ optimization.
- Update most of the commit message to make it more clear.
- Link to v12: https://lore.kernel.org/all/20260203133728.848283-1-ruanjinjie@huawei.com/

Changes in v12:
- Rebased on "sched/core", so remove the four generic entry patches.
- Move "Expand secure_computing() in place" and
  "Use syscall_get_arguments() helper" patch forward, which will group all
  non-functional cleanups at the front.
- Adjust the explanation for moving rseq_syscall() before
  audit_syscall_exit().
- Link to v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/

Changes in v11:
- Remove unused syscall in syscall_trace_enter().
- Update and provide a detailed explanation of the differences after
  moving rseq_syscall() before audit_syscall_exit().
- Rebased on arm64 (for-next/entry), and remove the first applied 3 patchs.
- syscall_exit_to_user_mode_work() for arch reuse instead of adding
  new syscall_exit_to_user_mode_work_prepare() helper.
- Link to v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/

Changes in v10:
- Rebased on v6.19-rc1, rename syscall_exit_to_user_mode_prepare() to
  syscall_exit_to_user_mode_work_prepare() to avoid conflict.
- Also inline syscall_trace_enter().
- Support aarch64 for sud_benchmark.
- Update and correct the commit message.
- Add Reviewed-by.
- Link to v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/

Changes in v9:
- Move "Return early for ptrace_report_syscall_entry() error" patch ahead
  to make it not introduce a regression.
- Not check _TIF_SECCOMP/SYSCALL_EMU for syscall_exit_work() in
  a separate patch.
- Do not report_syscall_exit() for PTRACE_SYSEMU_SINGLESTEP in a separate
  patch.
- Add two performance patch to improve the arm64 performance.
- Add Reviewed-by.
- Link to v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/

Changes in v8:
- Rename "report_syscall_enter()" to "report_syscall_entry()".
- Add ptrace_save_reg() to avoid duplication.
- Remove unused _TIF_WORK_MASK in a standalone patch.
- Align syscall_trace_enter() return value with the generic version.
- Use "scno" instead of regs->syscallno in el0_svc_common().
- Move rseq_syscall() ahead in a standalone patch to clarify it clearly.
- Rename "syscall_trace_exit()" to "syscall_exit_work()".
- Keep the goto in el0_svc_common().
- No argument was passed to __secure_computing() and check -1 not -1L.
- Remove "Add has_syscall_work() helper" patch.
- Move "Add syscall_exit_to_user_mode_prepare() helper" patch later.
- Add miss header for asm/entry-common.h.
- Update the implementation of arch_syscall_is_vdso_sigreturn().
- Add "ARCH_SYSCALL_WORK_EXIT" to be defined as "SECCOMP | SYSCALL_EMU"
  to keep the behaviour unchanged.
- Add more testcases test.
- Add Reviewed-by.
- Update the commit message.
- Link to v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/

Jinjie Ruan (11):
  entry: Fix potential syscall truncation in syscall_trace_enter()
  arm64/ptrace: Refactor syscall_trace_enter/exit() to accept flags
    parameter
  arm64/ptrace: Use syscall_get_nr() helper for syscall_trace_enter()
  arm64/ptrace: Expand secure_computing() in place
  arm64/ptrace: Use syscall_get_arguments() helper for audit
  arm64: ptrace: Move rseq_syscall() before audit_syscall_exit()
  arm64: syscall: Introduce syscall_exit_to_user_mode_work()
  arm64/ptrace: Define and use _TIF_SYSCALL_EXIT_WORK
  arm64/ptrace: Skip syscall exit reporting for PTRACE_SYSEMU_SINGLESTEP
  arm64: entry: Convert to generic entry
  arm64: Inline el0_svc_common()

 arch/arm64/Kconfig                    |   2 +-
 arch/arm64/include/asm/entry-common.h |  76 +++++++++++++++++
 arch/arm64/include/asm/syscall.h      |  20 ++++-
 arch/arm64/include/asm/thread_info.h  |  16 +---
 arch/arm64/kernel/debug-monitors.c    |   7 ++
 arch/arm64/kernel/ptrace.c            | 115 --------------------------
 arch/arm64/kernel/signal.c            |   2 +-
 arch/arm64/kernel/syscall.c           |  29 ++-----
 include/linux/entry-common.h          |   2 +-
 9 files changed, 112 insertions(+), 157 deletions(-)

-- 
2.34.1


