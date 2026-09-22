Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD32C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LWf2P5Ys75rAjXmSpn/rwIwvU1jkRlLw5TSKsGJpoII=; b=MwfyI8CQ1CMKQO
	JedZd1N3fDEtXTbgxxDwRJvMcUdUXFmotehyjqodsvLg3D7Jr78g1vNn5XLtnal9phETEw9NINiaf
	OoX+ZXfJXFWGIrJSNO4OSiY8dAiSzK1UvHesAJ3dEJT46k7VQpotEdZevToRXBEKisyHrv3heUKa+
	o7atF5C3Q1XrGErK6b+FEbMKSUp1BNiZq0xkZIAbmL6mt6svK6PIwTe+WSUML2jetVBA4MRZLOxW1
	at5YscNenHHcWiezNy3/zvnnelpCXiC73WubBcvoy8jW8adOq9jfq186kRbsRaiUkLBFot3OjX0Q8
	uniQrtaCB/MEYRHvntpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96cW-00000006TCZ-09sJ;
	Tue, 22 Sep 2026 19:57:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96cU-00000006TCH-2JKw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:57:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09DC5434D4;
	Tue, 22 Sep 2026 19:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FC81F000FF;
	Tue, 22 Sep 2026 19:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107057;
	bh=LWf2P5Ys75rAjXmSpn/rwIwvU1jkRlLw5TSKsGJpoII=;
	h=From:To:Cc:Subject:Date;
	b=i5p5eaOEomxZ5KRbEZIx4y6EMe4Ky0fZ1ze7lLcIncPOv+AjkI9a6pPfrbzo+Gv7P
	 pCHoatm/4wvaJSqLP4iqnnz2af6VOrxTyrf+pJ88C0vF3/XTwFGpCMrUVywKVGJQgH
	 K61uLSN6nBP/mY97/cENdKrzU2KZc3/hP+A10q8J16kth7bGHgZD8kHhjdiAWrnGcO
	 OCR65VAfLSITl3ffbY3k70vAFW23QqjYOHMVJCTURhYy9Yrkm+wGl43uZ1n6wvf4UH
	 mVKtaCKZrpGgKgMi4HOttUeL4gJdKoIC/Q/I30ACWKutDKXw2MdNDMMfmTdV2hRo+x
	 Y6jsi5cuGGD2Q==
From: Kees Cook <kees@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [PATCH] selftests/ptrace: Add PTRACE_SYSEMU_SINGLESTEP syscall-exit-stop test
Date: Tue, 22 Sep 2026 12:57:20 -0700
Message-Id: <20260922195719.i.211-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9515; i=kees@kernel.org; h=from:subject:message-id; bh=ZZ3/lvXFNs1lg2dDopy2fkY4jeWNeezpAZTvbUBNIwE=; b=owGbwMvMwCVmps19z/KJym7G02pJDFmb7s5/uSQyNuOKZH7YrKpLahc4+i/U7Gp6ZZVWWSfkO 1nKf8nKjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgImsv8jwz/wex/rrvV3/y88v bpPa4RNwm4P/iwKv1dU9LGsnB66U3Mrwv8JceMUxw8M7PvokFvoreFfZf9dt8ZJPWyvA5yXON8+ XBQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: mark.rutland@arm.com, Kees Cook <kees@kernel.org>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org, will@kernel.org, Shuah Khan <shuah@kernel.org>, peterz@infradead.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, kmehltretter@gmail.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linusw@kernel.org, oleg@redhat.com, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

ptrace(2) states that no syscall-exit-stop occurs when a tracee is
continued with PTRACE_SYSEMU or PTRACE_SYSEMU_SINGLESTEP. arm64 gated
its syscall-exit report on

	flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP)

and ptrace_resume() clears SYSCALL_TRACE for both SYSEMU requests while
PTRACE_SYSEMU_SINGLESTEP additionally sets TIF_SINGLESTEP, so the
single-step bit alone produced a stop that must not exist. Nothing in
tools/testing/selftests covered this.

Detecting the extra stop is less direct than it looks. The report is
emitted with step=1, so ptrace_report_syscall_exit() dispatches to
user_single_step_report() rather than ptrace_report_syscall(), and it
arrives as a plain SIGTRAP indistinguishable by signal from the
legitimate single-step trap: neither PTRACE_O_TRACESYSGOOD nor
PTRACE_GET_SYSCALL_INFO separates the two. What does separate them is
the PC. The redundant report fires before the tracee has moved past the
syscall instruction, so it lands on the PC of the syscall-entry stop:

	[0] sig=133 SYSCALL-STOP  pc=0x41ec28
	[1] sig=5   trap          pc=0x41ec28   <-- must not exist
	[2] sig=5   trap          pc=0x41ec2c

A fixed kernel reports pc=0x41ec2c already at stop [1]. The test
therefore asserts that the first stop after the syscall-entry stop is at
a different PC, which tests the consequence rather than the mechanism
and does not depend on how many pseudo-step traps follow.

PTRACE_SYSEMU is used to reach the syscall-entry stop, as single-
stepping there costs one stop per instruction and takes roughly 200000
stops. Architectures without a PC accessor here, or without SYSEMU
support, skip rather than fail.

Build tested ARCH=arm64 with GCC aarch64-linux-gnu 16.1.0, ARCH=arm
with GCC arm-linux-gnueabihf 16.1.0, and ARCH=x86_64 with GCC 16.2.0.

Tests passing on ARCH=arm64 under qemu-system-aarch64, and the same
test fails as expected on v7.3-rc2 without the fix[1]:

	# entry stop pc=0x41ec28, next stop sig=5 pc=0x41ec28
	# Expected next_pc (4320296) != entry_pc (4320296)
	not ok 1 sysemu.no_syscall_exit_stop

An AArch32 build of the same test on an arm64 kernel reproduces the
failure identically, covering the is_compat_task() path. It also passes
on x86_64, which already uses generic entry, so the test does not report
a false positive against a correct implementation.

Link: https://lore.kernel.org/all/20260922035510.1090299-2-ruanjinjie@huawei.com/ [1]
Assisted-by: LLM
Signed-off-by: Kees Cook <kees@kernel.org>
---
 tools/testing/selftests/ptrace/Makefile       |   3 +-
 .../selftests/ptrace/sysemu_singlestep.c      | 176 ++++++++++++++++++
 tools/testing/selftests/ptrace/.gitignore     |   1 +
 3 files changed, 179 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/ptrace/sysemu_singlestep.c

diff --git a/tools/testing/selftests/ptrace/Makefile b/tools/testing/selftests/ptrace/Makefile
index c5e0b76ba6ac..5284d79e9b71 100644
--- a/tools/testing/selftests/ptrace/Makefile
+++ b/tools/testing/selftests/ptrace/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 CFLAGS += -std=c99 -pthread -Wall $(KHDR_INCLUDES)
 
-TEST_GEN_PROGS := get_syscall_info set_syscall_info peeksiginfo vmaccess get_set_sud
+TEST_GEN_PROGS := get_syscall_info set_syscall_info peeksiginfo vmaccess get_set_sud \
+		  sysemu_singlestep
 
 include ../lib.mk
diff --git a/tools/testing/selftests/ptrace/sysemu_singlestep.c b/tools/testing/selftests/ptrace/sysemu_singlestep.c
new file mode 100644
index 000000000000..f9b16445b3d5
--- /dev/null
+++ b/tools/testing/selftests/ptrace/sysemu_singlestep.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Check that PTRACE_SYSEMU_SINGLESTEP does not report a syscall-exit-stop.
+ *
+ * ptrace(2), "Syscall-stops":
+ *
+ *	If the tracee is continued using any other method (including
+ *	PTRACE_SYSEMU), no syscall-exit-stop occurs. Note that all mentions of
+ *	PTRACE_SYSEMU apply equally to PTRACE_SYSEMU_SINGLESTEP.
+ *
+ * PTRACE_SYSEMU_SINGLESTEP sets SYSCALL_EMU and enables single-stepping, and
+ * ptrace_resume() clears SYSCALL_TRACE for it. An architecture that gates its
+ * syscall-exit report on "single-stepping is enabled" rather than on "the
+ * tracer asked for syscall stops" reports an extra stop here.
+ *
+ * Detecting that extra stop takes some care. The report is emitted with
+ * step=1, and ptrace_report_syscall_exit() then calls
+ * user_single_step_report() rather than ptrace_report_syscall(), so it arrives
+ * as a plain SIGTRAP: PTRACE_O_TRACESYSGOOD and PTRACE_GET_SYSCALL_INFO cannot
+ * tell it from the legitimate single-step trap. What distinguishes it is the
+ * PC, which has not yet moved past the syscall instruction. So this asserts
+ * that the first stop after the syscall-entry stop is at a different PC.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/ptrace.h>
+#include <sys/uio.h>
+#include <sys/wait.h>
+#include <sys/syscall.h>
+#include <linux/elf.h>
+#include <linux/ptrace.h>
+#include "../kselftest_harness.h"
+
+/*
+ * Not every libc declares these, even where the kernel implements them (an
+ * AArch32 tracer on an arm64 kernel, for instance). The values are ABI.
+ */
+#ifndef PTRACE_SYSEMU
+#define PTRACE_SYSEMU			31
+#endif
+#ifndef PTRACE_SYSEMU_SINGLESTEP
+#define PTRACE_SYSEMU_SINGLESTEP	32
+#endif
+
+/*
+ * Reading the PC portably would need one regset layout per architecture. Cover
+ * the ones that implement PTRACE_SYSEMU_SINGLESTEP and can be checked here;
+ * elsewhere the test skips rather than failing the build or the run.
+ */
+#if defined(__aarch64__)
+#include <asm/ptrace.h>
+static int tracee_pc(pid_t pid, unsigned long long *pc)
+{
+	struct user_pt_regs regs;
+	struct iovec iov = { &regs, sizeof(regs) };
+
+	if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov))
+		return -1;
+	*pc = regs.pc;
+	return 0;
+}
+#elif defined(__arm__)
+static int tracee_pc(pid_t pid, unsigned long long *pc)
+{
+	unsigned long uregs[18];	/* struct user_regs; uregs[15] is PC */
+	struct iovec iov = { uregs, sizeof(uregs) };
+
+	if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov))
+		return -1;
+	*pc = uregs[15];
+	return 0;
+}
+#elif defined(__x86_64__) || defined(__i386__)
+#include <sys/user.h>
+static int tracee_pc(pid_t pid, unsigned long long *pc)
+{
+	struct user_regs_struct regs;
+	struct iovec iov = { &regs, sizeof(regs) };
+
+	if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov))
+		return -1;
+#if defined(__x86_64__)
+	*pc = regs.rip;
+#else
+	*pc = regs.eip;
+#endif
+	return 0;
+}
+#else
+static int tracee_pc(pid_t pid, unsigned long long *pc)
+{
+	return -1;
+}
+#define NO_PC_ACCESSOR	1
+#endif
+
+FIXTURE(sysemu)
+{
+	pid_t tracee;
+};
+
+FIXTURE_SETUP(sysemu)
+{
+	self->tracee = -1;
+}
+
+FIXTURE_TEARDOWN(sysemu)
+{
+	/* Reap the tracee however the test ended, including on assert. */
+	if (self->tracee > 0) {
+		kill(self->tracee, SIGKILL);
+		waitpid(self->tracee, NULL, 0);
+	}
+}
+
+TEST_F(sysemu, no_syscall_exit_stop)
+{
+	unsigned long long entry_pc = 0, next_pc = 0;
+	int status;
+
+#ifdef NO_PC_ACCESSOR
+	SKIP(return, "no PC accessor for this architecture");
+#endif
+
+	self->tracee = fork();
+	ASSERT_GE(self->tracee, 0);
+	if (self->tracee == 0) {
+		if (ptrace(PTRACE_TRACEME, 0, 0, 0))
+			_exit(1);
+		raise(SIGSTOP);
+		/* A raw syscall: a libc wrapper may not issue one. */
+		syscall(__NR_getpid);
+		_exit(0);
+	}
+
+	ASSERT_EQ(waitpid(self->tracee, &status, 0), self->tracee);
+	ASSERT_TRUE(WIFSTOPPED(status));
+	ASSERT_EQ(ptrace(PTRACE_SETOPTIONS, self->tracee, 0,
+			 (void *)PTRACE_O_TRACESYSGOOD), 0);
+
+	/*
+	 * PTRACE_SYSEMU reaches the syscall-entry stop in one resume. Getting
+	 * there by single-stepping would cost one stop per instruction.
+	 */
+	if (ptrace(PTRACE_SYSEMU, self->tracee, 0, 0)) {
+		if (errno == EIO || errno == EINVAL)
+			SKIP(return, "PTRACE_SYSEMU not supported");
+		ASSERT_EQ(errno, 0) TH_LOG("PTRACE_SYSEMU: %m");
+	}
+	ASSERT_EQ(waitpid(self->tracee, &status, 0), self->tracee);
+	ASSERT_TRUE(WIFSTOPPED(status));
+	ASSERT_TRUE(WSTOPSIG(status) & 0x80)
+		TH_LOG("expected a syscall-entry stop, got signal %d",
+		       WSTOPSIG(status));
+	ASSERT_EQ(tracee_pc(self->tracee, &entry_pc), 0);
+
+	/* The resume under test. */
+	if (ptrace(PTRACE_SYSEMU_SINGLESTEP, self->tracee, 0, 0)) {
+		if (errno == EIO || errno == EINVAL)
+			SKIP(return, "PTRACE_SYSEMU_SINGLESTEP not supported");
+		ASSERT_EQ(errno, 0) TH_LOG("PTRACE_SYSEMU_SINGLESTEP: %m");
+	}
+	ASSERT_EQ(waitpid(self->tracee, &status, 0), self->tracee);
+	ASSERT_TRUE(WIFSTOPPED(status));
+	ASSERT_EQ(tracee_pc(self->tracee, &next_pc), 0);
+
+	TH_LOG("entry stop pc=%#llx, next stop sig=%d pc=%#llx",
+	       entry_pc, WSTOPSIG(status), next_pc);
+
+	EXPECT_NE(next_pc, entry_pc)
+		TH_LOG("redundant syscall-exit-stop reported at the syscall PC");
+}
+
+TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/ptrace/.gitignore b/tools/testing/selftests/ptrace/.gitignore
index f6be8efd57ea..792c81f804c0 100644
--- a/tools/testing/selftests/ptrace/.gitignore
+++ b/tools/testing/selftests/ptrace/.gitignore
@@ -4,3 +4,4 @@ get_set_sud
 peeksiginfo
 vmaccess
 set_syscall_info
+sysemu_singlestep
-- 
2.34.1


