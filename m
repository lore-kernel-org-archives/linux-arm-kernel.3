Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D889D3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfUygAy9nh51QZckgGNXpejnnKhJD7wqm16KtekAINI=; b=s08UfWaxiR2/bF/2jiSQIt/sxH
	ghIrrxyIMvZZVSQIuRskhpBqHAR1ShTto9Ln3xnrbC9MLWAoUG7VeW2MV8Ao/ild1ad/PBwE1podS
	bTo0Kfu9xjgIEMhRmukcZYlBk4Xr4IuNGnXhUyRGZIOxb1FxfXZY88Wdca8JrW/DPdelCKBOeTTUf
	LHniz8QiDCGBu/Kx/TLdwl6T7a0ebbCItOvh7JYjSJAEj3qRY3HVrISBIl/1MkWUL3e4XZutRTPLS
	bzHyfGnZUE3Sp4C4/94pjPCS4BRoIxX4wH8yJIA7PbCZwakt6inP4vVYAXN2Fa0pZ7wq7JZ0VuCbY
	VtrFGsvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nnC-0000000EoiX-3aEC;
	Tue, 29 Oct 2024 15:05:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nUA-0000000EltT-0Itc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 14:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kfUygAy9nh51QZckgGNXpejnnKhJD7wqm16KtekAINI=; b=ciwAz2kE5A4NSRBAp+Yg2xl9cx
	pvZvo42cnmBNms6OXDoCZtie5Jx9oYE7IFsyc8qg9E6LkIH8QbMab6RA62KJhKW6Y7XVl35jrb65l
	NngMk7bvg4m9J6ML7baJ/wxPpxzhYmwLWynk+6hIbMXNrMuXgx2pMbuyK6mR3dDADHDAIQXm5hkvb
	1R5GuDRimLKgXTR7BKvH7K3XWLOxdlQs03sjgQFX6H6Ez1d0owhXRn3rQy6bHFVnWGy0/4u43HLcG
	J8FUy8eXtUP+Jd17Cr1FR6v73iA3oQbRpKDJDDldLe7lc0vdXAqQUQxGQxqGTIoe687nDjh3GAVO7
	1QkcYlug==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nU5-00000009upm-1qwg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:46:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00E161713;
	Tue, 29 Oct 2024 07:46:42 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 780B43F528;
	Tue, 29 Oct 2024 07:46:09 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	pierre.langlois@arm.com,
	shuah@kernel.org,
	sroettger@google.com,
	tglx@linutronix.de,
	will@kernel.org,
	yury.khrustalev@arm.com,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v3 5/5] selftests/mm: Enable pkey_sighandler_tests on arm64
Date: Tue, 29 Oct 2024 14:45:39 +0000
Message-ID: <20241029144539.111155-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029144539.111155-1-kevin.brodsky@arm.com>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_144613_868608_FEAB0605 
X-CRM114-Status: GOOD (  14.56  )
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

pkey_sighandler_tests.c makes raw syscalls using its own helper,
syscall_raw(). One of those syscalls is clone, which is problematic
as every architecture has a different opinion on the order of its
arguments.

To complete arm64 support, we therefore add an appropriate
implementation in syscall_raw(), and introduce a clone_raw() helper
that shuffles arguments as needed for each arch.

Having done this, we enable building pkey_sighandler_tests for arm64
in the Makefile.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/Makefile           |  8 +--
 .../selftests/mm/pkey_sighandler_tests.c      | 62 ++++++++++++++-----
 2 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 02e1204971b0..0f8c110e0805 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -105,12 +105,12 @@ endif
 ifeq ($(CAN_BUILD_X86_64),1)
 TEST_GEN_FILES += $(BINARIES_64)
 endif
-else
 
-ifneq (,$(filter $(ARCH),arm64 powerpc))
+else ifeq ($(ARCH),arm64)
+TEST_GEN_FILES += protection_keys
+TEST_GEN_FILES += pkey_sighandler_tests
+else ifeq ($(ARCH),powerpc)
 TEST_GEN_FILES += protection_keys
-endif
-
 endif
 
 ifneq (,$(filter $(ARCH),arm64 mips64 parisc64 powerpc riscv64 s390x sparc64 x86_64 s390))
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index 501880dbdc37..c593a426341c 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -60,12 +60,44 @@ long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
 		      : "=a"(ret)
 		      : "a"(n), "b"(a1), "c"(a2), "d"(a3), "S"(a4), "D"(a5)
 		      : "memory");
+#elif defined __aarch64__
+	register long x0 asm("x0") = a1;
+	register long x1 asm("x1") = a2;
+	register long x2 asm("x2") = a3;
+	register long x3 asm("x3") = a4;
+	register long x4 asm("x4") = a5;
+	register long x5 asm("x5") = a6;
+	register long x8 asm("x8") = n;
+	asm volatile ("svc #0"
+		      : "=r"(x0)
+		      : "r"(x0), "r"(x1), "r"(x2), "r"(x3), "r"(x4), "r"(x5), "r"(x8)
+		      : "memory");
+	ret = x0;
 #else
 # error syscall_raw() not implemented
 #endif
 	return ret;
 }
 
+static inline long clone_raw(unsigned long flags, void *stack,
+			     int *parent_tid, int *child_tid)
+{
+	long a1 = flags;
+	long a2 = (long)stack;
+	long a3 = (long)parent_tid;
+#if defined(__x86_64__) || defined(__i386)
+	long a4 = (long)child_tid;
+	long a5 = 0;
+#elif defined(__aarch64__)
+	long a4 = 0;
+	long a5 = (long)child_tid;
+#else
+# error clone_raw() not implemented
+#endif
+
+	return syscall_raw(SYS_clone, a1, a2, a3, a4, a5, 0);
+}
+
 /*
  * Returns the most restrictive pkey register value that can be used by the
  * tests.
@@ -294,14 +326,13 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	memset(&siginfo, 0, sizeof(siginfo));
 
 	/* Use clone to avoid newer glibcs using rseq on new threads */
-	long ret = syscall_raw(SYS_clone,
-			       CLONE_VM | CLONE_FS | CLONE_FILES |
-			       CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
-			       CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
-			       CLONE_DETACHED,
-			       (long) ((char *)(stack) + STACK_SIZE),
-			       (long) &parent_pid,
-			       (long) &child_pid, 0, 0);
+	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
+			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
+			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
+			     CLONE_DETACHED,
+			     stack + STACK_SIZE,
+			     &parent_pid,
+			     &child_pid);
 
 	if (ret < 0) {
 		errno = -ret;
@@ -466,14 +497,13 @@ static void test_pkru_sigreturn(void)
 	sigstack.ss_size = STACK_SIZE;
 
 	/* Use clone to avoid newer glibcs using rseq on new threads */
-	long ret = syscall_raw(SYS_clone,
-			       CLONE_VM | CLONE_FS | CLONE_FILES |
-			       CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
-			       CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
-			       CLONE_DETACHED,
-			       (long) ((char *)(stack) + STACK_SIZE),
-			       (long) &parent_pid,
-			       (long) &child_pid, 0, 0);
+	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
+			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
+			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
+			     CLONE_DETACHED,
+			     stack + STACK_SIZE,
+			     &parent_pid,
+			     &child_pid);
 
 	if (ret < 0) {
 		errno = -ret;
-- 
2.43.0


