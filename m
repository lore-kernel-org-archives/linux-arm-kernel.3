Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C43CFA44C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeQrvYvovRHEiIjUv6IKT1+dJM328NVzcqaPYM/mJCw=; b=PsFKf219ZMDx2razGGP98obE9p
	13VNQDbV+SntTadxjN7rQeu33qdhOroZg7puZBfWFLvfiKgBL6ku7j92Tf0Fgu2M2B1AuEVx3EGsi
	Y3cuP7abBAp4InA69/HNqbvWpCt49gTLFVVAeve7N+j3OaaAdisS6tsdFRQzNeQ+HbLd01Bai5Bb3
	fvngiGePd3e7Yp2PWGO4UuQF0NmA05bBcN/0/sr0wAwHPvaezV2Wg/BhTW11ILS5Wy4dcmCsF7ZC6
	k2YyZoOMLwfiTU7K95/eixR0z75fnEnCkV75lVKdr19YAnocoykR+DV9wid5YgJ07jMcs83Qxrabo
	Fr2fwXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3do2-0000000F4JK-2wNO;
	Wed, 23 Oct 2024 16:01:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cvY-0000000Esdu-1ANW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:05:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E8C2497;
	Wed, 23 Oct 2024 08:06:05 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3D8D3F528;
	Wed, 23 Oct 2024 08:05:33 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	dave.martin@arm.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	pierre.langlois@arm.com,
	shuah@kernel.org,
	sroettger@google.com,
	will@kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 4/5] selftests/mm: Use generic pkey register manipulation
Date: Wed, 23 Oct 2024 16:05:10 +0100
Message-ID: <20241023150511.3923558-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023150511.3923558-1-kevin.brodsky@arm.com>
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_080536_457537_5162170B 
X-CRM114-Status: GOOD (  21.99  )
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

pkey_sighandler_tests.c currently hardcodes x86 PKRU encodings. The
first step towards running those tests on arm64 is to abstract away
the pkey register values.

Since those tests want to deny access to all keys except a few,
we have each arch define PKEY_ALLOW_NONE, the pkey register value
denying access to all keys. We then use the existing set_pkey_bits()
helper to grant access to specific keys.

Because pkeys may also remove the execute permission on arm64, we
need to be a little careful: all code is mapped with pkey 0, and we
need it to remain executable. pkey_reg_no_access is introduced for
that purpose: this value prevents RW access to all pkeys, but
retains X permission for pkey 0.

test_pkru_preserved_after_sigusr1() only checks that the pkey
register value remains unchanged after a signal is delivered, so the
particular value is irrelevant. We enable pkey 0 and a few more
arbitrary keys in the smallest range available on all architectures
(8 keys on arm64).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey-arm64.h       |  1 +
 tools/testing/selftests/mm/pkey-x86.h         |  2 +
 .../selftests/mm/pkey_sighandler_tests.c      | 39 ++++++++++++++-----
 3 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-arm64.h b/tools/testing/selftests/mm/pkey-arm64.h
index 580e1b0bb38e..5ec53d67dfc7 100644
--- a/tools/testing/selftests/mm/pkey-arm64.h
+++ b/tools/testing/selftests/mm/pkey-arm64.h
@@ -31,6 +31,7 @@
 #define NR_RESERVED_PKEYS	1 /* pkey-0 */
 
 #define PKEY_ALLOW_ALL		0x77777777
+#define PKEY_ALLOW_NONE		0
 
 #define PKEY_BITS_PER_PKEY	4
 #define PAGE_SIZE		sysconf(_SC_PAGESIZE)
diff --git a/tools/testing/selftests/mm/pkey-x86.h b/tools/testing/selftests/mm/pkey-x86.h
index 5f28e26a2511..53ed9a336ffe 100644
--- a/tools/testing/selftests/mm/pkey-x86.h
+++ b/tools/testing/selftests/mm/pkey-x86.h
@@ -34,6 +34,8 @@
 #define PAGE_SIZE		4096
 #define MB			(1<<20)
 
+#define PKEY_ALLOW_NONE		0x55555555
+
 static inline void __page_o_noops(void)
 {
 	/* 8-bytes of instruction * 512 bytes = 1 page */
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index a8088b645ad6..b5e1767ee5d9 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -37,6 +37,8 @@ pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
 pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
 siginfo_t siginfo = {0};
 
+static u64 pkey_reg_no_access;
+
 /*
  * We need to use inline assembly instead of glibc's syscall because glibc's
  * syscall will attempt to access the PLT in order to call a library function
@@ -113,7 +115,7 @@ static void raise_sigusr2(void)
 static void *thread_segv_with_pkey0_disabled(void *ptr)
 {
 	/* Disable MPK 0 (and all others too) */
-	__write_pkey_reg(0x55555555);
+	__write_pkey_reg(pkey_reg_no_access);
 
 	/* Segfault (with SEGV_MAPERR) */
 	*(int *) (0x1) = 1;
@@ -123,7 +125,7 @@ static void *thread_segv_with_pkey0_disabled(void *ptr)
 static void *thread_segv_pkuerr_stack(void *ptr)
 {
 	/* Disable MPK 0 (and all others too) */
-	__write_pkey_reg(0x55555555);
+	__write_pkey_reg(pkey_reg_no_access);
 
 	/* After we disable MPK 0, we can't access the stack to return */
 	return NULL;
@@ -133,6 +135,7 @@ static void *thread_segv_maperr_ptr(void *ptr)
 {
 	stack_t *stack = ptr;
 	int *bad = (int *)1;
+	u64 pkey_reg;
 
 	/*
 	 * Setup alternate signal stack, which should be pkey_mprotect()ed by
@@ -142,7 +145,8 @@ static void *thread_segv_maperr_ptr(void *ptr)
 	syscall_raw(SYS_sigaltstack, (long)stack, 0, 0, 0, 0, 0);
 
 	/* Disable MPK 0.  Only MPK 1 is enabled. */
-	__write_pkey_reg(0x55555551);
+	pkey_reg = set_pkey_bits(pkey_reg_no_access, 1, 0);
+	__write_pkey_reg(pkey_reg);
 
 	/* Segfault */
 	*bad = 1;
@@ -240,6 +244,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	int pkey;
 	int parent_pid = 0;
 	int child_pid = 0;
+	u64 pkey_reg;
 
 	sa.sa_flags = SA_SIGINFO | SA_ONSTACK;
 
@@ -257,7 +262,9 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	assert(stack != MAP_FAILED);
 
 	/* Allow access to MPK 0 and MPK 1 */
-	__write_pkey_reg(0x55555550);
+	pkey_reg = set_pkey_bits(pkey_reg_no_access, 0, 0);
+	pkey_reg = set_pkey_bits(pkey_reg, 1, 0);
+	__write_pkey_reg(pkey_reg);
 
 	/* Protect the new stack with MPK 1 */
 	pkey = pkey_alloc(0, 0);
@@ -307,7 +314,12 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 static void test_pkru_preserved_after_sigusr1(void)
 {
 	struct sigaction sa;
-	unsigned long pkru = 0x45454544;
+	u64 pkey_reg;
+
+	/* Allow access to MPK 0 and an arbitrary set of keys */
+	pkey_reg = set_pkey_bits(pkey_reg_no_access, 0, 0);
+	pkey_reg = set_pkey_bits(pkey_reg, 3, 0);
+	pkey_reg = set_pkey_bits(pkey_reg, 7, 0);
 
 	sa.sa_flags = SA_SIGINFO;
 
@@ -320,7 +332,7 @@ static void test_pkru_preserved_after_sigusr1(void)
 
 	memset(&siginfo, 0, sizeof(siginfo));
 
-	__write_pkey_reg(pkru);
+	__write_pkey_reg(pkey_reg);
 
 	raise(SIGUSR1);
 
@@ -330,7 +342,7 @@ static void test_pkru_preserved_after_sigusr1(void)
 	pthread_mutex_unlock(&mutex);
 
 	/* Ensure the pkru value is the same after returning from signal. */
-	ksft_test_result(pkru == __read_pkey_reg() &&
+	ksft_test_result(pkey_reg == __read_pkey_reg() &&
 			 siginfo.si_signo == SIGUSR1,
 			 "%s\n", __func__);
 }
@@ -347,6 +359,7 @@ static noinline void *thread_sigusr2_self(void *ptr)
 		'S', 'I', 'G', 'U', 'S', 'R', '2',
 		'.', '.', '.', '\n', '\0'};
 	stack_t *stack = ptr;
+	u64 pkey_reg;
 
 	/*
 	 * Setup alternate signal stack, which should be pkey_mprotect()ed by
@@ -356,7 +369,8 @@ static noinline void *thread_sigusr2_self(void *ptr)
 	syscall(SYS_sigaltstack, (long)stack, 0, 0, 0, 0, 0);
 
 	/* Disable MPK 0.  Only MPK 2 is enabled. */
-	__write_pkey_reg(0x55555545);
+	pkey_reg = set_pkey_bits(pkey_reg_no_access, 2, 0);
+	__write_pkey_reg(pkey_reg);
 
 	raise_sigusr2();
 
@@ -384,6 +398,7 @@ static void test_pkru_sigreturn(void)
 	int pkey;
 	int parent_pid = 0;
 	int child_pid = 0;
+	u64 pkey_reg;
 
 	sa.sa_handler = SIG_DFL;
 	sa.sa_flags = 0;
@@ -418,7 +433,9 @@ static void test_pkru_sigreturn(void)
 	 * the current thread's stack is protected by the default MPK 0. Hence
 	 * both need to be enabled.
 	 */
-	__write_pkey_reg(0x55555544);
+	pkey_reg = set_pkey_bits(pkey_reg_no_access, 0, 0);
+	pkey_reg = set_pkey_bits(pkey_reg, 2, 0);
+	__write_pkey_reg(pkey_reg);
 
 	/* Protect the stack with MPK 2 */
 	pkey = pkey_alloc(0, 0);
@@ -473,6 +490,10 @@ int main(int argc, char *argv[])
 	ksft_print_header();
 	ksft_set_plan(ARRAY_SIZE(pkey_tests));
 
+	/* Only allow X for MPK 0 and nothing for other keys */
+	pkey_reg_no_access = set_pkey_bits(PKEY_ALLOW_NONE, 0,
+					   PKEY_DISABLE_ACCESS);
+
 	for (i = 0; i < ARRAY_SIZE(pkey_tests); i++)
 		(*pkey_tests[i])();
 
-- 
2.43.0


