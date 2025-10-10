Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24628CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 01:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA9Pel75fLqSTRw8Eo2gsDw6Gknb1AfqAzovfD12K1w=; b=UfkbMEWK+yJuWCUUkcLmWBlCiQ
	Qc3EpBM2W9eFb353Pc+OCNPQSay+HPghLqUFnf/5GvWRBmuDD8ywmhKjUnNUKf9usVM5B1ZoNjzPJ
	YeXwBHv2Kx25VhYiJbMwhWEiIDOEd1ylXtpY8mdghxnrREVgy/EoPg+0j123tFoxxEXnsPmTssmb5
	I+LfPHyNW9Igzyc09Yt/BYcxOYLvsF69argSl+UQYyZPwYDMOyQqMSMDD60eoMKptJ7sdEANj4ZhE
	FA9WTBO9n2gRWoocCOEQB3ENjxrSvE8OyBMhNYu4zD+gqloSMi92W9mYL0P95vGtjttti85qyv46i
	mbgKSJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v71U9-00000007P6D-13w4;
	Fri, 10 Oct 2025 00:59:53 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v71U5-00000007P5P-3VgT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 00:59:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WA9Pel75fLqSTRw8Eo2gsDw6Gknb1AfqAzovfD12K1w=;
	b=qJz2Fp6gn3nQw2UvxxRThm3qNI/ZNTiTG58N0RC2sb2ZLqs0PzxynoeKTqKGNYl2u1omOn0Hv
	yA/wR8gZB+Qws43VF7GH8JSlsc1tx7+R/4VNB3SknLYChShHbgZDJ+Lb/aMfglX88EfB/zol5Pe
	x4oR++GsflQGfuUGf0WGWNU=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4cjT0b0DKGzLlTj;
	Fri, 10 Oct 2025 08:59:27 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 11331180043;
	Fri, 10 Oct 2025 08:59:44 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Oct 2025 08:59:43 +0800
Message-ID: <35491951-3833-8055-bf3c-f0bf3a239409@huawei.com>
Date: Fri, 10 Oct 2025 08:59:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v6 00/10] arm64: entry: Convert to generic entry
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <charlie@rivosinc.com>,
	<macro@orcam.me.uk>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250916082611.2972008-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250916082611.2972008-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_175950_524489_2F7EBEED 
X-CRM114-Status: GOOD (  21.34  )
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



On 2025/9/16 16:26, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry which makes
> maintainers' work easier and codes more elegant. In the previous patchset,
> arm64 has already successfully switched to the generic IRQ entry, it is
> time to completely convert arm64 to generic entry.

Gentle ping.


> 
> The main convert steps are as follows:
> - Make arm64 closer to generic syscall entry code.
> - Switch to generic entry.
> 
> This patch set is rebased on v6.17-rc5-next.
> 
> It was tested ok with following test cases on QEMU virt platform:
>  - Perf tests.
>  - Different `dynamic preempt` mode switch.
>  - Pseudo NMI tests.
>  - Stress-ng CPU stress test.
>  - MTE test case in Documentation/arch/arm64/memory-tagging-extension.rst
>    and all test cases in tools/testing/selftests/arm64/mte/*.
> 
> The test QEMU configuration is as follows:
> 
> 	qemu-system-aarch64 \
> 		-M virt,gic-version=3,virtualization=on,mte=on \
> 		-cpu max,pauth-impdef=on \
> 		-kernel Image \
> 		-smp 8,sockets=1,cores=4,threads=2 \
> 		-m 512m \
> 		-nographic \
> 		-no-reboot \
> 		-device virtio-rng-pci \
> 		-append "root=/dev/vda rw console=ttyAMA0 kgdboc=ttyAMA0,115200 \
> 			earlycon preempt=voluntary irqchip.gicv3_pseudo_nmi=1" \
> 		-drive if=none,file=images/rootfs.ext4,format=raw,id=hd0 \
> 		-device virtio-blk-device,drive=hd0 \
> 
> Changes in v6:
> - Rebased on v6.17-rc5-next as arm64 generic irq entry has merged.
> - Update the commit message.
> - Link to v5: https://lore.kernel.org/all/20241206101744.4161990-1-ruanjinjie@huawei.com/
> 
> Changes in v5:
> - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
> - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
> - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
> - Update "irqentry_state_t ret/irq_state" to "state"
>   to keep it consistently.
> - Use generic irq entry header for PREEMPT_DYNAMIC after split
>   the generic entry.
> - Also refactor the ARM64 syscall code.
> - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
>   arch_pre/post_report_syscall_entry/exit() to simplify code.
> - Make the syscall patches clear separation.
> - Update the commit message.
> - Link to v4: https://lore.kernel.org/all/20241025100700.3714552-1-ruanjinjie@huawei.com/
> 
> Changes in v4:
> - Rework/cleanup split into a few patches as Mark suggested.
> - Replace interrupts_enabled() macro with regs_irqs_disabled(), instead
>   of left it here.
> - Remove rcu and lockdep state in pt_regs by using temporary
>   irqentry_state_t as Mark suggested.
> - Remove some unnecessary intermediate functions to make it clear.
> - Rework preempt irq and PREEMPT_DYNAMIC code
>   to make the switch more clear.
> - arch_prepare_*_entry/exit() -> arch_pre_*_entry/exit().
> - Expand the arch functions comment.
> - Make arch functions closer to its caller.
> - Declare saved_reg in for block.
> - Remove arch_exit_to_kernel_mode_prepare(), arch_enter_from_kernel_mode().
> - Adjust "Add few arch functions to use generic entry" patch to be
>   the penultimate.
> - Update the commit message.
> - Add suggested-by.
> - Link to v3: https://lore.kernel.org/all/20240629085601.470241-1-ruanjinjie@huawei.com/
> 
> Changes in v3:
> - Test the MTE test cases.
> - Handle forget_syscall() in arch_post_report_syscall_entry()
> - Make the arch funcs not use __weak as Thomas suggested, so move
>   the arch funcs to entry-common.h, and make arch_forget_syscall() folded
>   in arch_post_report_syscall_entry() as suggested.
> - Move report_single_step() to thread_info.h for arm64
> - Change __always_inline() to inline, add inline for the other arch funcs.
> - Remove unused signal.h for entry-common.h.
> - Add Suggested-by.
> - Update the commit message.
> 
> Changes in v2:
> - Add tested-by.
> - Fix a bug that not call arch_post_report_syscall_entry() in
>   syscall_trace_enter() if ptrace_report_syscall_entry() return not zero.
> - Refactor report_syscall().
> - Add comment for arch_prepare_report_syscall_exit().
> - Adjust entry-common.h header file inclusion to alphabetical order.
> - Update the commit message.
> 
> Jinjie Ruan (10):
>   arm64/ptrace: Split report_syscall() into report_syscall_enter/exit()
>   arm64/ptrace: Refactor syscall_trace_enter/exit()
>   arm64/ptrace: Refator el0_svc_common()
>   entry: Extract syscall_exit_to_user_mode_prepare() helper
>   arm64/ptrace: Handle ptrace_report_syscall_entry() error
>   arm64/ptrace: Rework secure_computing() in syscall_trace_enter()
>   arm64/ptrace: Use syscall_get_arguments() heleper
>   entry: Add arch_ptrace_report_syscall_entry/exit()
>   entry: Add has_syscall_work() helper
>   arm64: entry: Convert to generic entry
> 
>  arch/arm64/Kconfig                    |  2 +-
>  arch/arm64/include/asm/entry-common.h | 69 ++++++++++++++++++++
>  arch/arm64/include/asm/syscall.h      |  6 +-
>  arch/arm64/include/asm/thread_info.h  | 22 +------
>  arch/arm64/kernel/debug-monitors.c    |  7 +++
>  arch/arm64/kernel/ptrace.c            | 90 ---------------------------
>  arch/arm64/kernel/signal.c            |  2 +-
>  arch/arm64/kernel/syscall.c           | 31 +++------
>  include/linux/entry-common.h          | 42 ++++++++-----
>  kernel/entry/syscall-common.c         | 43 ++++++++++++-
>  10 files changed, 161 insertions(+), 153 deletions(-)
> 

