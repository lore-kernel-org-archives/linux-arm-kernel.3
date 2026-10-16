Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0065DCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BejmUJayYXc+px7VFw82eKlRmA2IpD+Hx93b9PlXnk=; b=rdaDyhQE7TSaM6taKrsKv8/3Wr
	lX9sPd/aKaqrYqKMFXMXoEhNDezRL0uMKiPMul+giwD7/yDGvLfFrTHNqCfkdm1vrg6wLJe1OG79K
	sH5lyk/1n7vSbVqJn35jvpMC7mFdiJYSccaryryeuZ0H4wJyrryTJrnJ0ywkT7lIXfKzpQwrTZqtp
	/zJInCynVacrNwaYIwiG4ycksidgmqUZNR6NbhGBb5qYkiHnbRDFqI4zGRbeBL7WyD71qinT2pb2B
	BQ6iCYaG8U8q1BmCxhJYsrsBVO+3dpKdq/A0YLrPlWRQx+LYJjULad7n2X36ytfncCO1e1iX1KTjb
	z/vL9ttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnt2-00000003vbl-2weI;
	Fri, 16 Oct 2026 19:46:40 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsz-00000003vXk-0kfv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 19:46:39 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-15ea896ddc8so292269c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179996; x=1792784796; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6BejmUJayYXc+px7VFw82eKlRmA2IpD+Hx93b9PlXnk=;
        b=JC9s+WyZWdsdmtOYadwknBhb2U1D9cU5fSnTzzvNrhAc9CNsr5pjEeJ7d2YImBdmC1
         bCZkzNHr9AVSYZbPBL3IrbaQgzNf6GY3iQJJNDDSl0nORlKn4ustjdmFHjkXzeH1vTQa
         HUcFgwPrQW8bGwU5PKJCs+rM2/kHPHX9hz/VrGYokHmvKPp+CFbds8/FlTFCSaBEe6+o
         Y75c18JhyLekITRAY/EBXDKAtNS3cBjLx0zuL/sb+BADAh2wGUuVSC9asIIMTXVLlArp
         +1g5n1S/MqS4Uj1bgputBMMEREKTfKV9ChsETalYzvkgvjtGLy3fx0rKI6Sxusl0VbwP
         0m/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179996; x=1792784796;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BejmUJayYXc+px7VFw82eKlRmA2IpD+Hx93b9PlXnk=;
        b=bzRp2jbutgBnkxygJqQMJvEaQ1AM+eABv+WsD0vu01Ch9gNLi4zXbQy75YYa9XYa60
         eS0eOiwMSy/ihdBXTaaXNNS+xBtv3a0YSk8sRv+MtwYup6byinf3lXXuXN2Rh2rdgi8B
         CZZPo2md2a9Qgbb/X/ozVXPEIcJAoW7A5JHlsmVmzP4+rXCijRyySfavj2OYuQ2sj/WB
         2xYYvkmUE/wjTjpLuRYtgTsjwsxCKGhWYP45VVWZlXnhHWmUWlxUMVJ4dlsY83ltdTNH
         3GsFncp2LP+1SpZdtOGpoosaD7ZUXe4kKso3AqKA9LXBL/14jb0sMYbE1JOXPfVtf7lj
         gTWA==
X-Forwarded-Encrypted: i=1; AKwUvBwoSlVhObMv6ncfNZumfpCjKESuFGIxH11jWAOlEn5TMg/1QhrY5+fntKZrZb2sxxwVNdNEoeqSDlJc779essC2@lists.infradead.org
X-Gm-Message-State: AFq9FYIFPpi8Ww0jev8ndA8550LVh+jS6ZFjr+STFPpcBD+4E9qJ/hOH
	hkz/u3hGusa7BuGGMwVgKMHt1GfI3inywTWP4cZgOVelA0r0nLneen3Z
X-Gm-Gg: AYBFou3TB79iffUZjmi86wc9elTgiROSAGED8In3slMAUaxwwaHopHF144MWs4zmjl8
	glMx+RhM4DzLjGrYX4Gy1hqVe/s90n6KSDO4+D9n/8czEK2nBeazsjNCduz0f0hjMM7jDpJTaAv
	crLVABraHVM3S2Ls4MPBop1xPSEQHVz+phLAfohTqc8ww93LMt+QMEPqeOQTxHeptHlxjuD8RJ7
	N2xRHMTXSGusu/nLxJjFQ+94KoxbUleqB+Me4/dokDw7ZMKCa/Q1rS/uM5RhPMi9VzUdtkZw6px
	P7JMlM2Yo7avX3TodOFA7+L6U7Hafmq3/y4rQQhIpKBJtCakVUH+QuEXSloDTI2Q3zkQufwmuVK
	KzXa8pHSPDEVvCLNhPRdizeCqwe6P64ulAuH47Ike2hhrv5+RbCrCUFAE+IjxS0hxF5lZR5R3bZ
	nWIZ7NC3CaqSAbrYzbUysIBX6OE1KDVo3OzHKN9foY0irs4YjNbHuG+sBXudo+J9M2
X-Received: by 2002:a05:7022:fe0a:b0:169:bef5:f445 with SMTP id a92af1059eb24-1850c5f77b4mr1596666c88.4.1792179995901;
        Fri, 16 Oct 2026 12:46:35 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:34 -0700 (PDT)
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
Subject: [PATCH 4/4] selftests/riscv: shadow stack must not leak on a failed clone3
Date: Fri, 16 Oct 2026 16:46:03 -0300
Message-ID: <71829fed122c74000a2ac8b7de89aca811d40b0a.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792179433.git.ivanrwcm25@gmail.com>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_124637_264950_0CEDFD47 
X-CRM114-Status: GOOD (  28.06  )
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
in put_user() after copy_thread() has mapped a shadow stack.
copy_process() then calls exit_thread(). Without HAVE_EXIT_THREAD
that free is a no-op and the VMA stays in the parent's mm.

Enable user shadow stack, reject 16 such clones, and require the
shadow-stack VMA count to stay unchanged. The original mapping must
remain, and a call/return on that stack must succeed, so the cleanup
cannot be unmapping the parent's shadow stack.

A clone3 with the same flags and a valid pidfd has to succeed first
and write a pidfd. That child exits normally, so deactivate_mm()
and exit_thread() both run. ENOSYS, EINVAL, and EPERM skip; any
other error from that clone, or a success that leaves pidfd unset,
fails the test. The rejected child's empty shadow stack is left
with a raw exit syscall.

Skip when the kernel returns EOPNOTSUPP or EINVAL, or when the
feature is locked. The test expects /proc already mounted, as in a
normal kselftest run. The toolchain CFLAGS already request
zicfiss/zicfilp; the Makefile skips this binary when the compiler
cannot target them.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 317 ++++++++++++++++++
 2 files changed, 321 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 418b4b5325a5..dbecb1fd3b82 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -13,10 +13,13 @@ endif
 
 
 ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2>&1; echo $$?),0)
-TEST_GEN_PROGS := cfitests
+TEST_GEN_PROGS := cfitests shstk-clone-pidfd
 
 $(OUTPUT)/cfitests: cfitests.c shadowstack.c
 	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/shstk-clone-pidfd: shstk-clone-pidfd.c
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
 else
 
 $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
diff --git a/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
new file mode 100644
index 000000000000..3f9f6827bd4d
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a shadow-stack VMA. copy_thread() maps one, then put_user()
+ * fails and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * Enable shadow stack with an inlined prctl. A libc return across that
+ * point has no address on the shadow stack, so main() must not return
+ * after enable.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <linux/prctl.h>
+#include <linux/sched.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "cfi_rv_test.h"
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
+#endif
+
+#ifndef PR_GET_SHADOW_STACK_STATUS
+#define PR_GET_SHADOW_STACK_STATUS	74
+#endif
+#ifndef PR_SET_SHADOW_STACK_STATUS
+#define PR_SET_SHADOW_STACK_STATUS	75
+#endif
+#ifndef PR_SHADOW_STACK_ENABLE
+#define PR_SHADOW_STACK_ENABLE		(1UL << 0)
+#endif
+
+#define KSFT_SKIP		4
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
+
+static void on_fault(int sig)
+{
+	static const char msg[] = "[FAIL]\tparent shadow stack faulted\n";
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
+static int clone_pidfd(void *stack, size_t stack_size, int *pidfd_ptr)
+{
+	struct clone_args args = {
+		.flags = CLONE_VM | CLONE_PIDFD,
+		.pidfd = (uint64_t)(uintptr_t)pidfd_ptr,
+		.exit_signal = SIGCHLD,
+		.stack = (uint64_t)(uintptr_t)stack,
+		.stack_size = stack_size,
+	};
+	register long num __asm__("a7") = __NR_clone3;
+	register long ret __asm__("a0") = (long)&args;
+	register long sz __asm__("a1") = sizeof(args);
+	int st;
+
+	asm volatile("ecall"
+		     : "+r"(ret)
+		     : "r"(num), "r"(sz)
+		     : "memory", "cc");
+	if (ret == 0) {
+		register long n __asm__("a7") = __NR_exit;
+		register long e __asm__("a0") = 0;
+
+		asm volatile("ecall" : : "r"(n), "r"(e) : "memory");
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
+	if (rc == -EOPNOTSUPP || rc == -EINVAL) {
+		printf("[SKIP]\tkernel has no user shadow stack\n");
+		return KSFT_SKIP;
+	}
+	if (rc == -EBUSY) {
+		printf("[SKIP]\tshadow stack is locked\n");
+		return KSFT_SKIP;
+	}
+	printf("[FAIL]\tPR_SET_SHADOW_STACK_STATUS returned %ld\n", rc);
+	return 1;
+}
+
+int main(void)
+{
+	struct sigaction sa;
+	struct ss_span parent;
+	void *stack;
+	void *bad_pidfd;
+	unsigned long ssp, ssp_mid;
+	unsigned long ss_mode;
+	long rc;
+	int pidfd;
+	int vmas0, kb0, vmas1, kb1;
+	int i, kept, d, cret;
+
+	setbuf(stdout, NULL);
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
+	rc = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
+			 (long)&ss_mode, 0, 0, 0);
+	if (rc) {
+		if (rc == -EOPNOTSUPP || rc == -EINVAL) {
+			printf("[SKIP]\tkernel has no user shadow stack\n");
+			return KSFT_SKIP;
+		}
+		printf("[FAIL]\tPR_GET_SHADOW_STACK_STATUS returned %ld\n", rc);
+		return 1;
+	}
+	if (!(ss_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE, 0, 0, 0);
+		if (rc)
+			return skip_enable(rc);
+	}
+
+	ssp = csr_read(CSR_SSP);
+	if (!ssp) {
+		printf("[FAIL]\tenable left SSP at 0\n");
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
+	ssp = csr_read(CSR_SSP);
+	ss_scan(&vmas0, &kb0, ssp, &parent, NULL, NULL);
+	if (!parent.start) {
+		printf("[FAIL]\tSSP %lx matches no shadow-stack VMA\n", ssp);
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
+	ssp_mid = csr_read(CSR_SSP);
+	d = -1;
+	if (kept && ssp_mid)
+		d = depth(16);
+	ssp = csr_read(CSR_SSP);
+
+	printf("ss_vmas=%d->%d delta=%d ss_kb=%d->%d\n",
+	       vmas0, vmas1, vmas1 - vmas0, kb0, kb1);
+	printf("parent=%lx-%lx kept=%d ssp_before_depth=%lx depth=%d ssp=%lx\n",
+	       parent.start, parent.end, kept, ssp_mid, d, ssp);
+
+	if (vmas1 != vmas0 || kb1 != kb0) {
+		printf("[FAIL]\tleaked %d shadow-stack VMA(s), %d kB\n",
+		       vmas1 - vmas0, kb1 - kb0);
+		_exit(1);
+	}
+	if (!kept) {
+		printf("[FAIL]\tparent shadow stack %lx-%lx was unmapped\n",
+		       parent.start, parent.end);
+		_exit(2);
+	}
+	if (!ssp_mid) {
+		printf("[FAIL]\tparent SSP was 0 before call/return\n");
+		_exit(2);
+	}
+	if (d != 17) {
+		printf("[FAIL]\tparent call/return returned %d, want 17\n", d);
+		_exit(2);
+	}
+	if (!ssp) {
+		printf("[FAIL]\tparent SSP is 0 after call/return\n");
+		_exit(2);
+	}
+
+	printf("[OK]\tno shadow-stack VMA leak; parent stack still works\n");
+	_exit(0);
+}
-- 
2.43.0


