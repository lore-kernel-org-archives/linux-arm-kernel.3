Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BF8CCF2C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/dXBgoz0ituzVPypJqvKFSanJLtBP1uVeLtKCNjUy0=; b=UKnYktY5uZlZIBqGiKFaE6g1Ib
	zK5QwkHTIZGPDIcYhfI+xe70p+jtMXbpCYx2qxfU9jxC8jdIni5mY6B5CiFNNOhtvqmMRB/ACQp30
	srvaHj+KOgn14jQEsDAZyWFIz5hSRtHbfUe2266LQqTW8M1Wly43Os94Q/VTBmhhUlkpZvc9NH8G3
	B8QCt2tFpjSrXMcRerDwGhxUhFNwhjjvnY7LRimKpHCL+Lnb20SdaA2W2JoyB1FrcejnrlP+/YaJ9
	xOPofh/paw6Yal/megPE8MiLTRYp1mP3Dlowh4aSg9UVsTvdLTdbWq7GBtJT5Zlkv04oZ2uTLGse2
	8afxhYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsv-00000003vUy-23YT;
	Fri, 16 Oct 2026 19:46:33 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnst-00000003vSn-1O4n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 19:46:32 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so583818eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179990; x=1792784790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m/dXBgoz0ituzVPypJqvKFSanJLtBP1uVeLtKCNjUy0=;
        b=TKrI/cRBtFLB4+Lb6Aoo05T5nepgC57utv8o9b7jNgGCZYF7eEDP7RZw55ejfn2I6F
         R/xLpvU0MBe9i710iS+SJUk59+Sw/7INDbPUHgEolRBqr/bF78MDglCdzLuwsdrjSlVh
         8AORKP9eNPRHXV0lBft5yobmauuJJFi80NBMaCd0cXNesVbbBRJdG4NSK3lkx9p1ByaO
         flLbBqyxDz+v/bpFYKH4XvDHSVx8HJJXyez9UoDhLyksXRGDoYR4GOdWxuwr/ZtOJbjl
         LPFDSVKF2CvmUZ3V2IE5i+x24neSkzn15upHMKj9Cebl+IDvQoqe4LwSPbLbmsVkTEWg
         3rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179990; x=1792784790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/dXBgoz0ituzVPypJqvKFSanJLtBP1uVeLtKCNjUy0=;
        b=Wzvlv4PpkdhdWNEmGMf+f6nqMQ6nCqeT6UTdyERNOpkiwuIgsf8FpZDkoDWXiYDirz
         LZ0moaGhaTcz45N9XhH/l24I+h+u982Ne0lWsIQ63rAWlco3FXB3uImEclpo9rHcN5xe
         4XrraaSpKynjOyt6bgK6fYDpkorHGuGi+7xDxALcR1ZVEptMyjSGYLAmk6pvBxYgXYkV
         /H8lBotfA2H0N/WzkdcVlx8ZNaiIeHLMyROlsBdRJcd/nMCsMpjJyq95PzdxtFV9DxE7
         JbmL22jZegLogscv0pwCcJhRAHTwl0pT+/xccckRV5UeMHl5TaYPOkk6Tia0jaqnZ3lq
         u0aw==
X-Forwarded-Encrypted: i=1; AKwUvByPY7K1PCYjlB1C0PjT5MCJJoRsTYw0+33gT9bZxwhwuLvbrrbdNiwMBCmYlHMeAxDmVfUtFR2WVfZGa/hnuqPJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIBSd2HdsT9u03z0a1snSR7YwzHntAWg+teggsyl577O43CK87Z
	zAerrg3Pv63pmsG4Izw86x8NteEI5kaV4Rjzaq+7Huai7uXOECgOFovV
X-Gm-Gg: AYBFou1YWyyBaR7wZFGInW7FIMdBCEmCDWda3OHrkU+1efFHwXaZrPfJnyEgiq8xnGA
	BzL+ZBtPNOEwtkQIHNY6uKZmLoPHa74bccqjDryc7kd+9uKZ4awYcvKP5UK+48vQ9TBZlNF0zVJ
	2BTzU+gu2QHeaKSVBDLeMhkxS+awUMrT5E/2lZPALNTqJtjnuD0e6bgv+GaqxOTXkLkBolkLaSd
	G6ONlHf6hvYtdPiaY+ulIvdhqSq1BaicsfaSto25P4RRfPRw3J2ZpeLS0xI950oqe4yzoT11LMY
	KAk2CWY3eIKSJgkE/uZPoy8ck5zWb5322Rgnxu0Cxsz4AICZpnBtASB19y4Caw+jDa2Uj0/u7r5
	WSWYzRzCWdag4jKY/9uGoHTCG+CyA+twKclGPoMWOSdhGHg8nlCCuzRycnP/KUxBRXAfDGtFPIM
	BHDbaZIy9SaVOPXnypeipG9lBAaQIQJ6ZzVhohXkUig7GpiyQWI6eYUF4+5zr3aKMmCslGxetWC
	nM=
X-Received: by 2002:a05:7023:a4d:20b0:144:fb42:52 with SMTP id a92af1059eb24-18512f1ed6amr977259c88.28.1792179989988;
        Fri, 16 Oct 2026 12:46:29 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:28 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH 3/4] selftests/arm64: GCS must not leak on a failed clone3
Date: Fri, 16 Oct 2026 16:46:02 -0300
Message-ID: <ed22ebf64ed00a56d5e1eff31ac639fef00dcae6.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_124631_404973_42C855E8 
X-CRM114-Status: GOOD (  32.70  )
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

clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer fails
in put_user() after copy_thread() has mapped a GCS. copy_process()
then calls exit_thread(). Without HAVE_EXIT_THREAD that free is a
no-op and the VMA stays in the parent's mm.

Enable GCS, reject 16 such clones, and require the shadow-stack VMA
count to stay unchanged. The original mapping must remain, and a
call/return on that stack must succeed, so the cleanup cannot be
unmapping the parent's GCS.

A clone3 with the same flags and a valid pidfd has to succeed first
and write a pidfd. That child exits normally, so deactivate_mm()
and exit_thread() both run. ENOSYS, EINVAL, and EPERM skip; any
other error from that clone, or a success that leaves pidfd unset,
fails the test. The rejected child's empty GCS is left with a raw
exit syscall.

Skip when HWCAP has no GCS, or when the kernel returns EOPNOTSUPP,
EINVAL, or EBUSY. Any other PR_SET_SHADOW_STACK_STATUS error fails
the test. The test expects /proc already mounted, as in a normal
kselftest run.

The prctl wrapper matches gcs-locking.c. The recursive call goes
through an indirect call; a visible recursive body is optimized
into a closed form and does not execute a BL/RET.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 355 ++++++++++++++++++
 2 files changed, 357 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c

diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/selftests/arm64/gcs/Makefile
index 1fbbf0ca1f02..f1365eea31c9 100644
--- a/tools/testing/selftests/arm64/gcs/Makefile
+++ b/tools/testing/selftests/arm64/gcs/Makefile
@@ -6,7 +6,8 @@
 # nolibc.
 #
 
-TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking gcs-stress gcspushm gcsstr
+TEST_GEN_PROGS := basic-gcs libc-gcs gcs-locking gcs-stress gcspushm gcsstr \
+		  gcs-clone-pidfd
 TEST_GEN_PROGS_EXTENDED := gcs-stress-thread
 
 LDLIBS+=-lpthread
diff --git a/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c b/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
new file mode 100644
index 000000000000..c8515e65c947
--- /dev/null
+++ b/tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a GCS VMA. copy_thread() maps one, then put_user() fails
+ * and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * Pass: shadow-stack VMA count is unchanged, the original mapping is
+ * still there, and a call/return on this thread still works.
+ * Fail: one new shadow-stack VMA per rejected clone.
+ *
+ * Enable GCS with an inlined prctl. A libc return across that point
+ * has no address on the GCS, so main() must not return after enable.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <linux/sched.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/auxv.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include <asm/hwcap.h>
+
+#include "gcs-util.h"
+
+#ifndef HWCAP_GCS
+#define HWCAP_GCS		(1UL << 32)
+#endif
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
+#endif
+
+/* Same value as KSFT_SKIP in kselftest.h. */
+#define KSFT_SKIP		4
+
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
+
+/* Same wrapper as gcs-locking.c: extra prctl args must be zero. */
+#define my_syscall2(num, arg1, arg2)					\
+({									\
+	register long _num  __asm__ ("x8") = (num);			\
+	register long _arg1 __asm__ ("x0") = (long)(arg1);		\
+	register long _arg2 __asm__ ("x1") = (long)(arg2);		\
+	register long _arg3 __asm__ ("x2") = 0;				\
+	register long _arg4 __asm__ ("x3") = 0;				\
+	register long _arg5 __asm__ ("x4") = 0;				\
+									\
+	__asm__ volatile (						\
+		"svc #0\n"						\
+		: "=r"(_arg1)						\
+		: "r"(_arg1), "r"(_arg2),				\
+		  "r"(_arg3), "r"(_arg4),				\
+		  "r"(_arg5), "r"(_num)					\
+		: "memory", "cc"					\
+	);								\
+	_arg1;								\
+})
+
+static void on_fault(int sig)
+{
+	static const char msg[] = "[FAIL]\tparent guarded control stack faulted\n";
+
+	(void)sig;
+	if (write(2, msg, sizeof(msg) - 1) < 0)
+		_exit(2);
+	_exit(2);
+}
+
+struct ss_span {
+	unsigned long start;
+	unsigned long end;
+};
+
+static void ss_scan(int *vmas, int *kb, unsigned long addr, struct ss_span *hit,
+		    const struct ss_span *want, int *kept)
+{
+	FILE *f;
+	char line[256];
+	unsigned long start = 0, end = 0;
+	int size = 0;
+	int saw_size = 0;
+
+	*vmas = 0;
+	*kb = 0;
+	if (hit) {
+		hit->start = 0;
+		hit->end = 0;
+	}
+	if (kept)
+		*kept = 0;
+	f = fopen("/proc/self/smaps", "r");
+	if (!f) {
+		perror("smaps");
+		_exit(1);
+	}
+	while (fgets(line, sizeof(line), f)) {
+		unsigned long a, b;
+
+		if (sscanf(line, "%lx-%lx", &a, &b) == 2) {
+			start = a;
+			end = b;
+			saw_size = 0;
+			continue;
+		}
+		if (sscanf(line, "Size: %d kB", &size) == 1) {
+			saw_size = 1;
+			continue;
+		}
+		if (strncmp(line, "VmFlags:", 8) || !saw_size)
+			continue;
+		if (!strstr(line, " ss")) {
+			saw_size = 0;
+			continue;
+		}
+		(*vmas)++;
+		*kb += size;
+		/*
+		 * An empty GCS leaves GCSPR at the exclusive end. If
+		 * the next VMA is contiguous that address is also the
+		 * start of the next range; prefer the mapping that
+		 * ends here.
+		 */
+		if (hit && addr == end) {
+			hit->start = start;
+			hit->end = end;
+		} else if (hit && !hit->start && addr >= start && addr < end) {
+			hit->start = start;
+			hit->end = end;
+		}
+		if (kept && want && start == want->start && end == want->end)
+			*kept = 1;
+		saw_size = 0;
+	}
+	fclose(f);
+}
+
+/*
+ * CLONE_VM maps a new GCS. CLONE_PIDFD lets put_user() fail after that.
+ * No CLONE_THREAD: a created child is a separate process. The child
+ * resumes on an empty GCS, so it must not return into libc.
+ */
+static int clone_pidfd(void *stack, size_t stack_size, int *pidfd_ptr)
+{
+	struct clone_args args = {
+		.flags = CLONE_VM | CLONE_PIDFD,
+		.pidfd = (uint64_t)(uintptr_t)pidfd_ptr,
+		.exit_signal = SIGCHLD,
+		.stack = (uint64_t)(uintptr_t)stack,
+		.stack_size = stack_size,
+	};
+	register long num __asm__("x8") = __NR_clone3;
+	register long ret __asm__("x0") = (long)&args;
+	register long sz __asm__("x1") = sizeof(args);
+	int st;
+
+	asm volatile("svc #0"
+		     : "+r"(ret)
+		     : "r"(num), "r"(sz)
+		     : "memory", "cc");
+	if (ret == 0) {
+		register long n __asm__("x8") = __NR_exit;
+		register long e __asm__("x0") = 0;
+
+		asm volatile("svc #0" : : "r"(n), "r"(e) : "memory");
+		__builtin_unreachable();
+	}
+	if (ret < 0)
+		return ret;
+	if (waitpid((pid_t)ret, &st, 0) < 0)
+		return -errno;
+	if (!WIFEXITED(st) || WEXITSTATUS(st) != 0)
+		return 1;
+	return 0;
+}
+
+/*
+ * GCC can fold a visible recursive body. Hide the callee in an asm
+ * output so each level stays a real BL/RET that uses the GCS.
+ */
+static int depth(int n);
+static int (*depth_fn)(int) = depth;
+
+static int depth(int n)
+{
+	int (*go)(int n);
+
+	if (n <= 0)
+		return 1;
+	asm volatile("" : "=r"(go) : "0"(depth_fn) : "memory");
+	return go(n - 1) + 1;
+}
+
+static int skip_enable(long rc)
+{
+	if (rc == -EOPNOTSUPP) {
+		printf("[SKIP]\tkernel has no GCS\n");
+	} else if (rc == -EINVAL) {
+		printf("[SKIP]\tkernel built without GCS\n");
+	} else if (rc == -EBUSY) {
+		printf("[SKIP]\tGCS is locked\n");
+	} else {
+		printf("[FAIL]\tPR_SET_SHADOW_STACK_STATUS returned %ld\n", rc);
+		return 1;
+	}
+	return KSFT_SKIP;
+}
+
+int main(void)
+{
+	struct sigaction sa;
+	struct ss_span parent;
+	void *stack;
+	void *bad_pidfd;
+	unsigned long gcspr, gcspr_mid;
+	unsigned long gcs_mode;
+	long rc;
+	int pidfd;
+	int vmas0, kb0, vmas1, kb1;
+	int i, kept, d, cret;
+
+	setbuf(stdout, NULL);
+
+	if (!(getauxval(AT_HWCAP) & HWCAP_GCS)) {
+		printf("[SKIP]\tHWCAP has no GCS\n");
+		return KSFT_SKIP;
+	}
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED) {
+		perror("mmap stack");
+		return 1;
+	}
+	bad_pidfd = mmap(NULL, 4096, PROT_NONE,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (bad_pidfd == MAP_FAILED) {
+		perror("mmap pidfd");
+		return 1;
+	}
+
+	rc = my_syscall2(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &gcs_mode);
+	if (rc) {
+		printf("[FAIL]\tPR_GET_SHADOW_STACK_STATUS returned %ld\n", rc);
+		return 1;
+	}
+	if (!(gcs_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE);
+		if (rc)
+			return skip_enable(rc);
+	}
+
+	gcspr = (unsigned long)get_gcspr();
+	if (!gcspr) {
+		printf("[FAIL]\tenable left GCSPR_EL0 at 0\n");
+		_exit(1);
+	}
+
+	pidfd = -1;
+	cret = clone_pidfd(stack, STACK_SIZE, &pidfd);
+	if (cret == -ENOSYS || cret == -EINVAL || cret == -EPERM) {
+		printf("[SKIP]\tclone3 with a valid pidfd failed: %s\n",
+		       strerror(-cret));
+		_exit(KSFT_SKIP);
+	}
+	if (cret < 0) {
+		printf("[FAIL]\tclone3 with a valid pidfd failed: %s\n",
+		       strerror(-cret));
+		_exit(1);
+	}
+	if (cret) {
+		printf("[FAIL]\tclone3 with a valid pidfd did not exit 0\n");
+		_exit(1);
+	}
+	if (pidfd < 0) {
+		printf("[FAIL]\tclone3 succeeded but did not write a pidfd\n");
+		_exit(1);
+	}
+	close(pidfd);
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = on_fault;
+	if (sigaction(SIGSEGV, &sa, NULL) || sigaction(SIGBUS, &sa, NULL)) {
+		perror("sigaction");
+		_exit(1);
+	}
+
+	gcspr = (unsigned long)get_gcspr();
+	ss_scan(&vmas0, &kb0, gcspr, &parent, NULL, NULL);
+	if (!parent.start) {
+		printf("[FAIL]\tGCSPR %lx matches no shadow-stack VMA\n", gcspr);
+		_exit(1);
+	}
+
+	for (i = 0; i < NCLONE; i++) {
+		cret = clone_pidfd(stack, STACK_SIZE, bad_pidfd);
+		if (cret == -EFAULT)
+			continue;
+		if (cret < 0)
+			printf("[FAIL]\tbad pidfd errno %d, want EFAULT\n",
+			       -cret);
+		else
+			printf("[FAIL]\tbad pidfd was accepted\n");
+		_exit(1);
+	}
+
+	ss_scan(&vmas1, &kb1, 0, NULL, &parent, &kept);
+	gcspr_mid = (unsigned long)get_gcspr();
+	d = -1;
+	if (kept && gcspr_mid)
+		d = depth(16);
+	gcspr = (unsigned long)get_gcspr();
+
+	printf("ss_vmas=%d->%d delta=%d ss_kb=%d->%d\n",
+	       vmas0, vmas1, vmas1 - vmas0, kb0, kb1);
+	printf("parent=%lx-%lx kept=%d gcspr_before_depth=%lx depth=%d gcspr=%lx\n",
+	       parent.start, parent.end, kept, gcspr_mid, d, gcspr);
+
+	if (vmas1 != vmas0 || kb1 != kb0) {
+		printf("[FAIL]\tleaked %d shadow-stack VMA(s), %d kB\n",
+		       vmas1 - vmas0, kb1 - kb0);
+		_exit(1);
+	}
+	if (!kept) {
+		printf("[FAIL]\tparent GCS %lx-%lx was unmapped\n",
+		       parent.start, parent.end);
+		_exit(2);
+	}
+	if (!gcspr_mid) {
+		printf("[FAIL]\tparent GCSPR was 0 before call/return\n");
+		_exit(2);
+	}
+	if (d != 17) {
+		printf("[FAIL]\tparent call/return returned %d, want 17\n", d);
+		_exit(2);
+	}
+	if (!gcspr) {
+		printf("[FAIL]\tparent GCSPR is 0 after call/return\n");
+		_exit(2);
+	}
+
+	printf("[OK]\tno GCS VMA leak; parent stack still works\n");
+	_exit(0);
+}
-- 
2.43.0


