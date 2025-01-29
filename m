Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6F9C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 23:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKPH1ZCp5oYZHJkO29c+lc4W7mzocOtl3hUddCWj21Y=; b=Tm4mPfolV4m6GBMCs90/787IJp
	awppZ+a4Lkse3lvCngzvt+CMo44IjPAXAfcJjolIDAmp6f/RCNZOnsqzPUHE57hqUXFnHZGoUvaB9
	m/ZQ1oDv4hLQdX7R4IYkG67HPtnqsIoTSFlDi0kLD9QYkvCIangQzGY8Ys82sw7eTPucA0KiRHxJX
	XF5mnEYog9oCGBxyGzgVAj/9nh+WL4/QnFEjz0mE2mzS5r/3N2Pi6vzmlk3xYAdp1n6WcMnod7V4w
	UAZRaNzW1qdQkJ/BzHy5lCnEsiX5oqJ2a1vnx/SRdEMA8lgVv1tUU9C3own585tvd1Tui/K90LW/C
	8rrJGMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHYQ-00000007xra-29gd;
	Wed, 29 Jan 2025 23:33:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHVq-00000007xce-2nqg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 23:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7C895C6214;
	Wed, 29 Jan 2025 23:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C781C4CED3;
	Wed, 29 Jan 2025 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738193425;
	bh=0tXoxL2mW+4lVtn3q6KdWULDU6u828xfzxaAEmywKLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiSaKyd9q/yYLD7+iv+cXeYDYhPF45pWLYTpFUkwXbucW3n1XjF5bR25PjMzluXA5
	 DNHgkEozHLs3BnLE2OTK1u5KfAzXRe7rJsQlg1q00nrHqZ4lNIr9y2BQ9A4Jqpew7v
	 11APKHCxXulXGbIvUqxmDS4fA99cLEtSlISXamWaFGsNn+h0dhBMIobtfIqxGmlnUn
	 ssD6SL2Qt/aKnzhsOcRBc9dGRvbHCNi/RLxBbZTpVQpTVI4Egu18D/onfrYIac6tFD
	 rdx0DhEVYa2Xj72EW+8O/tnRn6YgvlnHCUXQOPJCaKFG8Lv0nydzR2iQ9JFbZWz90P
	 EkFbZFOZ9fl1A==
From: Song Liu <song@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	surajjs@amazon.com,
	duwe@suse.de,
	song@kernel.org,
	kernel-team@meta.com
Subject: [RFC 2/2] arm64: Implement HAVE_LIVEPATCH
Date: Wed, 29 Jan 2025 15:29:36 -0800
Message-ID: <20250129232936.1795412-2-song@kernel.org>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250129232936.1795412-1-song@kernel.org>
References: <20250129232936.1795412-1-song@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_153026_808676_A1CAC6DE 
X-CRM114-Status: GOOD (  13.60  )
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

This is largely based on [1] by Suraj Jitindar Singh.

Test coverage:

- Passed manual tests with samples/livepatch.
- Passed all but test-kprobe.sh in selftests/livepatch.
  test-kprobe.sh is expected to fail, because arm64 doesn't have
  KPROBES_ON_FTRACE.
- Passed tests with kpatch-build [2]. (This version includes commits that
  are not merged to upstream kpatch yet).

[1] https://lore.kernel.org/all/20210604235930.603-1-surajjs@amazon.com/
[2] https://github.com/liu-song-6/kpatch/tree/fb-6.13
Cc: Suraj Jitindar Singh <surajjs@amazon.com>
Cc: Torsten Duwe <duwe@suse.de>
Signed-off-by: Song Liu <song@kernel.org>
---
 arch/arm64/Kconfig                   | 3 +++
 arch/arm64/include/asm/thread_info.h | 4 +++-
 arch/arm64/kernel/entry-common.c     | 4 ++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f5af6faf9e2b..475caa57c94a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -272,6 +272,7 @@ config ARM64
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
 	select HAVE_RELIABLE_STACKTRACE
+	select HAVE_LIVEPATCH
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -2496,3 +2497,5 @@ endmenu # "CPU Power Management"
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
+
+source "kernel/livepatch/Kconfig"
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 1114c1c3300a..01623c471beb 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -69,6 +69,7 @@ void arch_setup_new_exec(void);
 #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
 #define TIF_SECCOMP		11	/* syscall secure computing */
 #define TIF_SYSCALL_EMU		12	/* syscall emulation active */
+#define TIF_PATCH_PENDING	13	/* pending live patching update */
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
 #define TIF_FREEZE		19
 #define TIF_RESTORE_SIGMASK	20
@@ -92,6 +93,7 @@ void arch_setup_new_exec(void);
 #define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
 #define _TIF_SECCOMP		(1 << TIF_SECCOMP)
 #define _TIF_SYSCALL_EMU	(1 << TIF_SYSCALL_EMU)
+#define _TIF_PATCH_PENDING	(1 << TIF_PATCH_PENDING)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_SINGLESTEP		(1 << TIF_SINGLESTEP)
 #define _TIF_32BIT		(1 << TIF_32BIT)
@@ -103,7 +105,7 @@ void arch_setup_new_exec(void);
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
 				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
 				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
-				 _TIF_NOTIFY_SIGNAL)
+				 _TIF_NOTIFY_SIGNAL | _TIF_PATCH_PENDING)
 
 #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index b260ddc4d3e9..b537af333b42 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -8,6 +8,7 @@
 #include <linux/context_tracking.h>
 #include <linux/kasan.h>
 #include <linux/linkage.h>
+#include <linux/livepatch.h>
 #include <linux/lockdep.h>
 #include <linux/ptrace.h>
 #include <linux/resume_user_mode.h>
@@ -144,6 +145,9 @@ static void do_notify_resume(struct pt_regs *regs, unsigned long thread_flags)
 				       (void __user *)NULL, current);
 		}
 
+		if (thread_flags & _TIF_PATCH_PENDING)
+			klp_update_patch_state(current);
+
 		if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 			do_signal(regs);
 
-- 
2.43.5


