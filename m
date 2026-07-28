Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660BAC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToK6gH6N8ajHVP/3orBkGHt3TtXpPlKJJGDHH3mpfGU=; b=2Li46IPsizYqr0cdYVBh0h85JJ
	3pFeefWOZtAsPADDMVJ4sQ3SmEjIRYDaOLHqUUpr9XMxYL/NTWbQaFQHNjFoNrgQf4SKJ+vBhbiqW
	xKH7LIC0ou7YVtVJ8dO0Vjquy6Hpkvpk+kuLSyFJ1c0XQ7fMUsTSBy5LH21d8Seey/Wjc4AEwklyp
	u2K/Py2hxzP7E3RFhbNGiJQOV9PlvcJSKI7RYIYbdUZYf80lX2r4Dr80Pjwei9I+c4cKKfgGQNY3q
	s4KPAXI6Pnm6KyuKX37OeKnppLr11Z2lySRCFrBQGJkjjJdwUtNcERLhEwLoTNtvKG2MGdeS9fqkW
	cdo1RrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXHm-00000004Eau-17sa;
	Tue, 28 Jul 2026 02:11:14 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXHb-00000004EXc-3n6f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:11:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ToK6gH6N8ajHVP/3orBkGHt3TtXpPlKJJGDHH3mpfGU=;
	b=RkzR3zkNfNluWheHtiQPf21ZR3x6Uv7KN5FsnYix2HkYVSS2hxEbS4DGn81q2FaGZHhPzc1TF
	/dT+DJYzqPum8u9J7reebmV9STBjZpOquU0phaYqu7Q3qgXEXrvoWinLi5BRQBwDGO5mFdijvl/
	9Qed8eUIKpeN/aKQ3MCzhBU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4h8Jbw0877zLlXB;
	Tue, 28 Jul 2026 10:01:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B5E64057A;
	Tue, 28 Jul 2026 10:10:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 28 Jul
 2026 10:10:57 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 1/2] kselftest/arm64: Add seccomp ptrace x0 bypass test
Date: Tue, 28 Jul 2026 10:11:21 +0800
Message-ID: <20260728021122.2640104-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728021122.2640104-1-ruanjinjie@huawei.com>
References: <20260728021122.2640104-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_191104_422269_C3096EBD 
X-CRM114-Status: GOOD (  27.16  )
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

As Kees suggested, add a test that verifies that seccomp observes the
correct first argument after a ptracer modifies x0 at a syscall-enter-stop
on arm64.

The first syscall argument and the return value share register x0.
The original value is saved in orig_x0 on entry and used by
syscall_get_arguments(), but ptrace changes to x0 were not
automatically reflected there.  This test checks the kernel re-syncs
orig_x0 after a ptrace stop so that seccomp sees the modified
argument.

A seccomp filter allows write(2,...) and kills the task for any other
fd.  The tracer changes fd from 2 to 1 at entry.  If orig_x0 remains
stale, the child exits normally (bypass, test fails).  If orig_x0 is
correctly updated, the child is killed by SIGSYS (test passes).

Before the fix:
	 ./seccomp_ptrace_x0_bypass
	TAP version 13
	1..1
	not ok 1 seccomp_ptrace_x0_bypass
	# Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

After the fix:
	# ./seccomp_ptrace_x0_bypass
	TAP version 13
	1..1
	[   19.475951] audit: type=1326 audit(1784254846.284:2): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=227 comm="seccomp_ptrace_" exe="/mnt/seccomp0
	[   19.477852] audit: type=1701 audit(1784254846.284:3): auid=4294967295 uid=0 gid=0 ses=4294967295 pid=227 comm="seccomp_ptrace_" exe="/mnt/seccomp1
	ok 1 seccomp_ptrace_x0_bypass
	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Cc: Kees Cook <kees@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://lore.kernel.org/all/20260716120640.6590-1-will@kernel.org/
Link: https://lore.kernel.org/all/202607152004.DEA95D63@keescook/
Suggested-by: Kees Cook <kees@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 tools/testing/selftests/arm64/abi/.gitignore  |   1 +
 tools/testing/selftests/arm64/abi/Makefile    |   2 +-
 .../arm64/abi/seccomp_ptrace_x0_bypass.c      | 195 ++++++++++++++++++
 3 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c

diff --git a/tools/testing/selftests/arm64/abi/.gitignore b/tools/testing/selftests/arm64/abi/.gitignore
index 44f8b80f37e3..39129a9907c7 100644
--- a/tools/testing/selftests/arm64/abi/.gitignore
+++ b/tools/testing/selftests/arm64/abi/.gitignore
@@ -1,4 +1,5 @@
 hwcap
 ptrace
+seccomp_ptrace_x0_bypass
 syscall-abi
 tpidr2
diff --git a/tools/testing/selftests/arm64/abi/Makefile b/tools/testing/selftests/arm64/abi/Makefile
index 483488f8c2ad..5a16db379bd4 100644
--- a/tools/testing/selftests/arm64/abi/Makefile
+++ b/tools/testing/selftests/arm64/abi/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (C) 2021 ARM Limited
 
-TEST_GEN_PROGS := hwcap ptrace syscall-abi tpidr2
+TEST_GEN_PROGS := hwcap ptrace syscall-abi tpidr2 seccomp_ptrace_x0_bypass
 
 include ../../lib.mk
 
diff --git a/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
new file mode 100644
index 000000000000..a00621a8949c
--- /dev/null
+++ b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test that seccomp, tracepoints and audit observe the correct syscall
+ * arguments after a ptracer has modified them at syscall-enter-stop.
+ *
+ * On arm64, both the first argument and the return value of a syscall
+ * are passed in register x0.  The original x0 is saved in
+ * pt_regs::orig_x0 during syscall entry and returned as the first
+ * argument by syscall_get_arguments().  Because ptrace modifications
+ * to x0 are not automatically reflected in orig_x0, seccomp, tracepoints
+ * and audit may see a stale value unless orig_x0 is explicitly
+ * re-synchronised after a ptrace stop.
+ *
+ * This test sets up a seccomp filter that allows write(2, ...) but kills
+ * the task for any other fd.  A ptracer changes the fd argument from 2
+ * to 1 at the syscall-enter stop.  If the orig_x0 re-sync works, seccomp
+ * sees the modified argument (fd=1) and kills the child with SIGSYS
+ * (test passes).  If orig_x0 is not re-synced, seccomp sees the original
+ * fd=2, the write succeeds and the child exits normally (test fails,
+ * vulnerability present).
+ */
+#include <errno.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/prctl.h>
+#include <sys/ptrace.h>
+#include <sys/uio.h>
+#include <sys/wait.h>
+#include <asm/ptrace.h>
+#include <linux/elf.h>
+#include <linux/filter.h>
+#include <linux/seccomp.h>
+
+#include "kselftest.h"
+
+#ifndef __NR_write
+#define __NR_write 64
+#endif
+
+#define EXPECTED_TESTS 1
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+#define ARG0_OFFSET	(offsetof(struct seccomp_data, args))
+#else
+#define ARG0_OFFSET	(offsetof(struct seccomp_data, args) + 4)
+#endif
+
+static int do_child(void)
+{
+	if (ptrace(PTRACE_TRACEME, 0, NULL, NULL))
+		ksft_exit_fail_perror("PTRACE_TRACEME");
+
+	if (raise(SIGSTOP))
+		ksft_exit_fail_perror("raise(SIGSTOP)");
+
+	/*
+	 * Seccomp filter:
+	 *    If syscall is not write -> ALLOW
+	 *    If syscall is write:
+	 *	- If args[0] (fd) == 2 -> ALLOW
+	 *	- Otherwise -> KILL
+	 */
+	struct sock_filter filter[] = {
+		BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, nr)),	/* nr */
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, 3),
+		BPF_STMT(BPF_LD | BPF_W | BPF_ABS, ARG0_OFFSET),	/* args[0] */
+		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 2, 1, 0),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
+		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
+	};
+	struct sock_fprog prog = {
+		.len = ARRAY_SIZE(filter),
+		.filter = filter,
+	};
+
+	if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0))
+		ksft_exit_fail_perror("prctl NO_NEW_PRIVS");
+
+	if (prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog))
+		ksft_exit_fail_perror("prctl SECCOMP");
+
+	/*
+	 * Invoke write(2, ...) while the tracer will change the first
+	 * argument (fd) from 2 to 1 at syscall entry.
+	 */
+	syscall(__NR_write, 2, NULL, 0);
+	_exit(0);
+}
+
+static int do_parent(pid_t child)
+{
+	bool bypass = false;
+	int status;
+
+	/* Wait for the initial SIGSTOP */
+	if (waitpid(child, &status, 0) != child)
+		ksft_exit_fail_msg("waitpid failed");
+
+	if (!WIFSTOPPED(status) || WSTOPSIG(status) != SIGSTOP)
+		ksft_exit_fail_msg("unexpected stop status");
+
+	if (ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_TRACESYSGOOD | PTRACE_O_EXITKILL))
+		ksft_exit_fail_perror("PTRACE_SETOPTIONS");
+
+	if (ptrace(PTRACE_SYSCALL, child, 0, 0))
+		ksft_exit_fail_perror("PTRACE_SYSCALL");
+
+	while (1) {
+		int sig;
+
+		if (waitpid(child, &status, 0) != child)
+			ksft_exit_fail_msg("waitpid lost child");
+
+		if (WIFEXITED(status)) {
+			/* Child exited normally – bypass succeeded */
+			bypass = true;
+			break;
+		}
+
+		if (WIFSIGNALED(status)) {
+			sig = WTERMSIG(status);
+			if (sig == SIGSYS)
+				break;
+			ksft_exit_fail_msg("child died unexpectedly from signal %d (%s)",
+					   sig, strsignal(sig));
+		}
+
+		if (!WIFSTOPPED(status))
+			ksft_exit_fail_msg("unexpected wait status");
+
+		sig = WSTOPSIG(status);
+
+		if (sig == (SIGTRAP | 0x80)) {
+			struct user_regs_struct regs;
+			struct iovec iov = {
+				.iov_base = &regs,
+				.iov_len = sizeof(regs),
+			};
+
+			if (ptrace(PTRACE_GETREGSET, child, NT_PRSTATUS, &iov))
+				ksft_exit_fail_perror("PTRACE_GETREGSET");
+
+			unsigned long syscall_nr = regs.regs[8];
+			unsigned long x0 = regs.regs[0];
+
+			/* Modify fd from 2 to 1 at write entry */
+			if (syscall_nr == __NR_write && x0 == 2) {
+				regs.regs[0] = 1;
+				if (ptrace(PTRACE_SETREGSET, child, NT_PRSTATUS, &iov))
+					ksft_exit_fail_perror("PTRACE_SETREGSET");
+			}
+
+			if (ptrace(PTRACE_SYSCALL, child, 0, 0))
+				ksft_exit_fail_perror("PTRACE_SYSCALL");
+		} else {
+			/* Forward other signals */
+			if (ptrace(PTRACE_SYSCALL, child, 0, sig))
+				ksft_exit_fail_perror("PTRACE_SYSCALL");
+		}
+	}
+
+	/* bypass == true means vulnerability exists -> test fails */
+	return bypass ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+int main(void)
+{
+	pid_t child;
+
+	ksft_print_header();
+	ksft_set_plan(EXPECTED_TESTS);
+
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_msg("fork failed: %s", strerror(errno));
+
+	if (!child)
+		return do_child();
+
+	/*
+	 * do_parent() returns EXIT_SUCCESS if the child was killed by
+	 * SIGSYS (i.e. seccomp correctly saw the modified argument),
+	 * and EXIT_FAILURE if the child exited normally (bypass).
+	 */
+	int result = do_parent(child);
+
+	ksft_test_result(result == EXIT_SUCCESS, "seccomp_ptrace_x0_bypass\n");
+
+	ksft_print_cnts();
+	return result;
+}
-- 
2.34.1


