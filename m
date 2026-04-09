Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238A2E98FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 06:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lM2wX+A1lqqXcq8lHlQSUpK7m/9grA9ifZlCpJhSsc=; b=eUHcTxfnMNTXnexFk3aOcHVsUi
	0i0oq6/3pCe4ESQBRgVQ/NLFMWvAjt4ESwO52YP93L+8oDx2b9GYxEbQw0+sA0N5H1MOj7u/jGmZm
	M5DYc5IzMhedhUkwGc2I/7zc84YJT1GMM+fb8cmuvtESMK0g4SQtAMnwA1Dlqq2L9wwdMk9OWn+R9
	dcPQo+/peZVxIUp1ZuVLT48vH0+cXsbgUxJ2J6VbJeNBNK2bMngNLtqBAjP/Llooo1DlcgBP+3pUR
	drpfdmW2qbtDi3CHgRii+/w3/k2/aZsb/z84zkoh0rDQqgT639Rl2/1/9ZC6KupifKqjVOSfycUxv
	Uzy2q7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAitG-00000009lvF-3AZq;
	Thu, 09 Apr 2026 06:29:22 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAitD-00000009lu8-1e9G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 06:29:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0lM2wX+A1lqqXcq8lHlQSUpK7m/9grA9ifZlCpJhSsc=;
	b=g/htZDA8ib7ndWvKnGLoy963NwfI026dvlJ9qDXaNBTusgLF9yqtAe/FB0YkN6H1canGjtmPF
	pxr4z+n1IY03FKdB/1bMbIGIoCEYqSIk6+PeuD9EtJzHqgtrjRJ5untM4M3azhfW8o0rVSGcRid
	e6H0fYd7ggO//Macqz1nqRQ=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4frqcK1hnJzLlYX;
	Thu,  9 Apr 2026 14:22:57 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 15E1240539;
	Thu,  9 Apr 2026 14:29:11 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Apr 2026 14:29:09 +0800
Message-ID: <174e6d08-4922-f42f-2899-4c5b0df13469@huawei.com>
Date: Thu, 9 Apr 2026 14:29:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v14 00/10] arm64: entry: Convert to Generic Entry
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <linusw@kernel.org>,
	<kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>, <ldv@strace.io>,
	<song@kernel.org>, <thuth@redhat.com>, <ryan.roberts@arm.com>,
	<mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <mathieu.desnoyers@efficios.com>, <mingo@kernel.org>,
	<edumazet@google.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260320102620.1336796-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260320102620.1336796-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_232920_103433_41B8C571 
X-CRM114-Status: GOOD (  31.08  )
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



On 2026/3/20 18:26, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
> maintainers' work easier and codes more elegant. arm64 has already
> successfully switched to the Generic IRQ Entry in commit
> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
> time to completely convert arm64 to Generic Entry.
> 
> The goal is to bring arm64 in line with other architectures that already
> use the generic entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths, such as
> "Syscall User Dispatch" and RSEQ optimizations.

Hi,

Just a quick ping to see if this series is good to go. Do I need to
provide a new version rebased on the latest arm64 for-next/generic-entry
branches, or is the current version acceptable?

> 
> This patch set is rebased on arm64 for-next/core. This series contains
> foundational updates for arm64. As suggested by Linus Walleij, these 10
> patches are being submitted separately for inclusion in the arm64 tree.
> 
> And the performance benchmarks results on qemu-kvm are below:
> 
> perf bench syscall usec/op (-ve is improvement)
> 
> | Syscall | Base        | Generic Entry | change % |
> | ------- | ----------- | ------------- | -------- |
> | basic   | 0.123997    | 0.120872      | -2.57    |
> | execve  | 512.1173    | 504.9966      | -1.52    |
> | fork    | 114.1144    | 113.2301      | -1.06    |
> | getpgid | 0.120182    | 0.121245      | +0.9     |
> 
> perf bench syscall ops/sec (+ve is improvement)
> 
> | Syscall | Base     | Generic Entry| change % |
> | ------- | -------- | ------------ | -------- |
> | basic   | 8064712  | 8273212      | +2.48    |
> | execve  | 1952     | 1980         | +1.52    |
> | fork    | 8763     | 8832         | +1.06    |
> | getpgid | 8320704  | 8247810      | -0.9     |
> 
> Therefore, the syscall performance variation ranges from a 1% regression
> to a 2.5% improvement.
> 
> It was tested ok with following test cases on QEMU virt platform:
>  - Stress-ng CPU stress test.
>  - Hackbench stress test.
>  - "sud" selftest testcase.
>  - get_set_sud, get_syscall_info, set_syscall_info, peeksiginfo
>    in tools/testing/selftests/ptrace.
>  - breakpoint_test_arm64 in selftests/breakpoints.
>  - syscall-abi and ptrace in tools/testing/selftests/arm64/abi
>  - fp-ptrace, sve-ptrace, za-ptrace in selftests/arm64/fp.
>  - vdso_test_getrandom in tools/testing/selftests/vDSO
>  - Strace tests.
>  - slice_test for rseq optimizations.
> 
> The test QEMU configuration is as follows:
> 
> 	qemu-system-aarch64 \
> 		-M virt \
> 		-enable-kvm \
> 		-cpu host \
> 		-kernel Image \
> 		-smp 8 \
> 		-m 512m \
> 		-nographic \
> 		-no-reboot \
> 		-device virtio-rng-pci \
> 		-append "root=/dev/vda rw console=ttyAMA0 kgdboc=ttyAMA0,115200 \
> 			earlycon preempt=voluntary irqchip.gicv3_pseudo_nmi=1 audit=1" \
> 		-drive if=none,file=images/rootfs.ext4,format=raw,id=hd0 \
> 		-device virtio-blk-device,drive=hd0 \
> 
> Changes in v14:
> - Initialize ret = 0 in syscall_trace_enter().
> - Split into two patch sets as Linus Walleij suggested, so this patch set
>   can be applied separately to the arm64 tree.
> - Rebased on arm64 for-next/core branch.
> - Collect Reviewed-by and Acked-by.
> - Link to v13 resend: https://lore.kernel.org/all/20260317082020.737779-15-ruanjinjie@huawei.com/
> 
> Changes in v13 resend:
> - Fix exit_to_user_mode_prepare_legacy() issues.
> - Also move TIF_SINGLESTEP to generic TIF infrastructure for loongarch.
> - Use generic TIF bits for arm64 and moving TIF_SINGLESTEP to
>   generic TIF for related architectures separately.
> - Refactor syscall_trace_enter/exit() to accept flags and Use
>   syscall_get_nr() helper separately.
> - Tested with slice_test for rseq optimizations.
> - Add acked-by.
> - Link to v13: https://lore.kernel.org/all/20260313094738.3985794-1-ruanjinjie@huawei.com/
> 
> Changes in v13:
> - Rebased on v7.0-rc3, so drop the firt applied arm64 patch.
> - Use generic TIF bits to enables RSEQ optimization.
> - Update most of the commit message to make it more clear.
> - Link to v12: https://lore.kernel.org/all/20260203133728.848283-1-ruanjinjie@huawei.com/
> 
> Changes in v12:
> - Rebased on "sched/core", so remove the four generic entry patches.
> - Move "Expand secure_computing() in place" and
>   "Use syscall_get_arguments() helper" patch forward, which will group all
>   non-functional cleanups at the front.
> - Adjust the explanation for moving rseq_syscall() before
>   audit_syscall_exit().
> - Link to v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/
> 
> Changes in v11:
> - Remove unused syscall in syscall_trace_enter().
> - Update and provide a detailed explanation of the differences after
>   moving rseq_syscall() before audit_syscall_exit().
> - Rebased on arm64 (for-next/entry), and remove the first applied 3 patchs.
> - syscall_exit_to_user_mode_work() for arch reuse instead of adding
>   new syscall_exit_to_user_mode_work_prepare() helper.
> - Link to v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/
> 
> Changes in v10:
> - Rebased on v6.19-rc1, rename syscall_exit_to_user_mode_prepare() to
>   syscall_exit_to_user_mode_work_prepare() to avoid conflict.
> - Also inline syscall_trace_enter().
> - Support aarch64 for sud_benchmark.
> - Update and correct the commit message.
> - Add Reviewed-by.
> - Link to v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/
> 
> Changes in v9:
> - Move "Return early for ptrace_report_syscall_entry() error" patch ahead
>   to make it not introduce a regression.
> - Not check _TIF_SECCOMP/SYSCALL_EMU for syscall_exit_work() in
>   a separate patch.
> - Do not report_syscall_exit() for PTRACE_SYSEMU_SINGLESTEP in a separate
>   patch.
> - Add two performance patch to improve the arm64 performance.
> - Add Reviewed-by.
> - Link to v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
> 
> Changes in v8:
> - Rename "report_syscall_enter()" to "report_syscall_entry()".
> - Add ptrace_save_reg() to avoid duplication.
> - Remove unused _TIF_WORK_MASK in a standalone patch.
> - Align syscall_trace_enter() return value with the generic version.
> - Use "scno" instead of regs->syscallno in el0_svc_common().
> - Move rseq_syscall() ahead in a standalone patch to clarify it clearly.
> - Rename "syscall_trace_exit()" to "syscall_exit_work()".
> - Keep the goto in el0_svc_common().
> - No argument was passed to __secure_computing() and check -1 not -1L.
> - Remove "Add has_syscall_work() helper" patch.
> - Move "Add syscall_exit_to_user_mode_prepare() helper" patch later.
> - Add miss header for asm/entry-common.h.
> - Update the implementation of arch_syscall_is_vdso_sigreturn().
> - Add "ARCH_SYSCALL_WORK_EXIT" to be defined as "SECCOMP | SYSCALL_EMU"
>   to keep the behaviour unchanged.
> - Add more testcases test.
> - Add Reviewed-by.
> - Update the commit message.
> - Link to v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/
> 
> Jinjie Ruan (10):
>   arm64/ptrace: Refactor syscall_trace_enter/exit() to accept flags
>     parameter
>   arm64/ptrace: Use syscall_get_nr() helper for syscall_trace_enter()
>   arm64/ptrace: Expand secure_computing() in place
>   arm64/ptrace: Use syscall_get_arguments() helper for audit
>   arm64: ptrace: Move rseq_syscall() before audit_syscall_exit()
>   arm64: syscall: Introduce syscall_exit_to_user_mode_work()
>   arm64/ptrace: Define and use _TIF_SYSCALL_EXIT_WORK
>   arm64/ptrace: Skip syscall exit reporting for PTRACE_SYSEMU_SINGLESTEP
>   arm64: entry: Convert to generic entry
>   arm64: Inline el0_svc_common()
> 
>  arch/arm64/Kconfig                    |   2 +-
>  arch/arm64/include/asm/entry-common.h |  76 +++++++++++++++++
>  arch/arm64/include/asm/syscall.h      |  19 ++++-
>  arch/arm64/include/asm/thread_info.h  |  16 +---
>  arch/arm64/kernel/debug-monitors.c    |   7 ++
>  arch/arm64/kernel/entry-common.c      |  25 ++++--
>  arch/arm64/kernel/ptrace.c            | 115 --------------------------
>  arch/arm64/kernel/signal.c            |   2 +-
>  arch/arm64/kernel/syscall.c           |  29 ++-----
>  include/linux/irq-entry-common.h      |   8 --
>  include/linux/rseq_entry.h            |  18 ----
>  11 files changed, 130 insertions(+), 187 deletions(-)
> 

