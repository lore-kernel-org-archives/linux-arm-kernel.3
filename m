Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC3EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ikxvul1YEZ1JZMqMyeWN6QrFnKi6/EKYx8Mcx81qqDY=; b=qVDWd14LTJ31cl0m22b/SaJN2W
	I9GsDY++7Hl/nJDeDS7Dah8YvdqMXaCcxDNwdTr8GuHiIZHBw2/oqCfbWK3pvwJIA3wt3N/H2eKUY
	oODGzPwJV32EwXhu9X/+IcxQ+N1vX1aQA1bv3fVmwZCK9b7kfqWsueBNF5lZXP50/yZeTvexXULk/
	Oi0kzCDvrP2u32MZJeVJQRkulZ1+BepLk+shV3lUIKjtGh0I5ExRMp2erAZwE60V0t9uGv326F1Qx
	Kv2yK42TTTxyCr9PanQxvMg1h/umBh12T6BtK4+BSHU1wmNJbIjpJv8CpmFHZZ3b3zTsTNS0AGv2+
	4VRH1T4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKagm-00000007DfY-4AKW;
	Mon, 09 Dec 2024 10:08:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPw-000000079Wd-3vvF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:51:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A82F6143D;
	Mon,  9 Dec 2024 01:51:32 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E7263F720;
	Mon,  9 Dec 2024 01:51:02 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 11/14] selftests/mm: Use sys_pkey helpers consistently
Date: Mon,  9 Dec 2024 09:50:16 +0000
Message-ID: <20241209095019.1732120-12-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015105_058023_DFB58EBD 
X-CRM114-Status: GOOD (  18.12  )
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

sys_pkey_alloc, sys_pkey_free and sys_mprotect_pkey are currently
used in protections_keys.c, while pkey_sighandler_tests.c calls the
libc wrappers directly (e.g. pkey_mprotect()). This is probably ok
when using glibc (those symbols appeared a while ago), but Musl does
not currently provide them. The logging in the helpers from
pkey-helpers.h can also come in handy.

Make things more consistent by using the sys_pkey helpers in
pkey_sighandler_tests.c too. To that end their implementation is
moved to a common .c file (pkey_util.c). This also enables calling
is_pkeys_supported() outside of protections_keys.c, since it relies
on sys_pkey_{alloc,free}.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/Makefile           |  4 +-
 tools/testing/selftests/mm/pkey-helpers.h     |  2 +
 .../selftests/mm/pkey_sighandler_tests.c      |  8 ++--
 tools/testing/selftests/mm/pkey_util.c        | 40 +++++++++++++++++++
 tools/testing/selftests/mm/protection_keys.c  | 35 ----------------
 5 files changed, 48 insertions(+), 41 deletions(-)
 create mode 100644 tools/testing/selftests/mm/pkey_util.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 814b17a43385..1f0743d9459d 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -147,8 +147,8 @@ TEST_FILES += write_hugetlb_memory.sh
 
 include ../lib.mk
 
-$(TEST_GEN_PROGS): vm_util.c thp_settings.c
-$(TEST_GEN_FILES): vm_util.c thp_settings.c
+$(TEST_GEN_PROGS): vm_util.c thp_settings.c pkey_util.c
+$(TEST_GEN_FILES): vm_util.c thp_settings.c pkey_util.c
 
 $(OUTPUT)/uffd-stress: uffd-common.c
 $(OUTPUT)/uffd-unit-tests: uffd-common.c
diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 6f0ab7b42738..f080e97b39be 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -89,6 +89,8 @@ extern void abort_hooks(void);
 
 int sys_pkey_alloc(unsigned long flags, unsigned long init_val);
 int sys_pkey_free(unsigned long pkey);
+int sys_mprotect_pkey(void *ptr, size_t size, unsigned long orig_prot,
+		unsigned long pkey);
 
 /* For functions called from protection_keys.c only */
 noinline int read_ptr(int *ptr);
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index e1aaeb65cfae..c73cee192b88 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -311,8 +311,8 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	__write_pkey_reg(pkey_reg);
 
 	/* Protect the new stack with MPK 1 */
-	pkey = pkey_alloc(0, 0);
-	pkey_mprotect(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
+	pkey = sys_pkey_alloc(0, 0);
+	sys_mprotect_pkey(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
 	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE | PROT_EXEC,
@@ -484,8 +484,8 @@ static void test_pkru_sigreturn(void)
 	__write_pkey_reg(pkey_reg);
 
 	/* Protect the stack with MPK 2 */
-	pkey = pkey_alloc(0, 0);
-	pkey_mprotect(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
+	pkey = sys_pkey_alloc(0, 0);
+	sys_mprotect_pkey(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
 	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE | PROT_EXEC,
diff --git a/tools/testing/selftests/mm/pkey_util.c b/tools/testing/selftests/mm/pkey_util.c
new file mode 100644
index 000000000000..ca4ad0d44ab2
--- /dev/null
+++ b/tools/testing/selftests/mm/pkey_util.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <sys/syscall.h>
+#include <unistd.h>
+
+#include "pkey-helpers.h"
+
+int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
+{
+	int ret = syscall(SYS_pkey_alloc, flags, init_val);
+	dprintf1("%s(flags=%lx, init_val=%lx) syscall ret: %d errno: %d\n",
+			__func__, flags, init_val, ret, errno);
+	return ret;
+}
+
+int sys_pkey_free(unsigned long pkey)
+{
+	int ret = syscall(SYS_pkey_free, pkey);
+	dprintf1("%s(pkey=%ld) syscall ret: %d\n", __func__, pkey, ret);
+	return ret;
+}
+
+int sys_mprotect_pkey(void *ptr, size_t size, unsigned long orig_prot,
+		unsigned long pkey)
+{
+	int sret;
+
+	dprintf2("%s(0x%p, %zx, prot=%lx, pkey=%lx)\n", __func__,
+			ptr, size, orig_prot, pkey);
+
+	errno = 0;
+	sret = syscall(__NR_pkey_mprotect, ptr, size, orig_prot, pkey);
+	if (errno) {
+		dprintf2("SYS_mprotect_key sret: %d\n", sret);
+		dprintf2("SYS_mprotect_key prot: 0x%lx\n", orig_prot);
+		dprintf2("SYS_mprotect_key failed, errno: %d\n", errno);
+		if (DEBUG_LEVEL >= 2)
+			perror("SYS_mprotect_pkey");
+	}
+	return sret;
+}
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index f43cf3b75d8e..3688571e6b39 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -460,34 +460,6 @@ static pid_t fork_lazy_child(void)
 	return forkret;
 }
 
-int sys_mprotect_pkey(void *ptr, size_t size, unsigned long orig_prot,
-		unsigned long pkey)
-{
-	int sret;
-
-	dprintf2("%s(0x%p, %zx, prot=%lx, pkey=%lx)\n", __func__,
-			ptr, size, orig_prot, pkey);
-
-	errno = 0;
-	sret = syscall(__NR_pkey_mprotect, ptr, size, orig_prot, pkey);
-	if (errno) {
-		dprintf2("SYS_mprotect_key sret: %d\n", sret);
-		dprintf2("SYS_mprotect_key prot: 0x%lx\n", orig_prot);
-		dprintf2("SYS_mprotect_key failed, errno: %d\n", errno);
-		if (DEBUG_LEVEL >= 2)
-			perror("SYS_mprotect_pkey");
-	}
-	return sret;
-}
-
-int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
-{
-	int ret = syscall(SYS_pkey_alloc, flags, init_val);
-	dprintf1("%s(flags=%lx, init_val=%lx) syscall ret: %d errno: %d\n",
-			__func__, flags, init_val, ret, errno);
-	return ret;
-}
-
 static int alloc_pkey(void)
 {
 	int ret;
@@ -534,13 +506,6 @@ static int alloc_pkey(void)
 	return ret;
 }
 
-int sys_pkey_free(unsigned long pkey)
-{
-	int ret = syscall(SYS_pkey_free, pkey);
-	dprintf1("%s(pkey=%ld) syscall ret: %d\n", __func__, pkey, ret);
-	return ret;
-}
-
 /*
  * I had a bug where pkey bits could be set by mprotect() but
  * not cleared.  This ensures we get lots of random bit sets
-- 
2.47.0


