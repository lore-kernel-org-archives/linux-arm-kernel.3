Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7416C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXYUElJxdksfu7fGmHyChBlCO6NoiaZnSeyXIfR+b50=; b=QOh2n4CksMOm89iR8S/FaZHM5T
	WzwMGVHgPAtYv5lqWF3OJ6qlsKNMTaqCJQS2R8MHQmsPtMVnJrlZFdjMwxK8bPswd39+H2/W39HVh
	6kclqssaimyuIW7CdHuQiC5h3ClUANw2qsQOQ5IbiuMCYc4XcoZuScpnn7JKvJK597hBeSW42AUzs
	xSzO6dEaDx3Uz8dAWjBf3kDTz+rEgh2BQRzwgL/1HYVynO3gayf2/BztJsfA528Hp3zAdlEQH64a5
	/f7ex1j2MpuO637wKNyxJznjDv4uAr2Uc32gi2BzJJda2q4SIHspc6TGXk/jX3fx7e5u7T80kHqx/
	7sL36xYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3MH-00000007kdh-26lf;
	Tue, 10 Jun 2025 18:06:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0UC-00000007DOK-1Kmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:02:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C7B0175A;
	Tue, 10 Jun 2025 08:01:40 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70F4F3F59E;
	Tue, 10 Jun 2025 08:01:57 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 4/6] kselftest/arm64/mte: preparation for mtefar test
Date: Tue, 10 Jun 2025 16:01:42 +0100
Message-Id: <20250610150144.2523945-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610150144.2523945-1-yeoreum.yun@arm.com>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_080200_443456_CE393824 
X-CRM114-Status: GOOD (  19.50  )
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

If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
are preserved in response to synchronous tag check faults (SEGV_MTESERR).

This patch is preparation for testing FEAT_MTE_TAGGED_FAR.
It shouldn't change the test result.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../selftests/arm64/mte/check_buffer_fill.c   |  2 +-
 .../selftests/arm64/mte/check_child_memory.c  |  4 +-
 .../arm64/mte/check_hugetlb_options.c         |  4 +-
 .../selftests/arm64/mte/check_ksm_options.c   |  4 +-
 .../selftests/arm64/mte/check_mmap_options.c  |  4 +-
 .../arm64/mte/check_tags_inclusion.c          |  2 +-
 .../selftests/arm64/mte/check_user_mem.c      |  2 +-
 .../selftests/arm64/mte/mte_common_util.c     | 70 ++++++++++++++++---
 .../selftests/arm64/mte/mte_common_util.h     |  8 ++-
 tools/testing/selftests/arm64/mte/mte_def.h   |  8 +++
 10 files changed, 85 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_buffer_fill.c b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
index 2ee7f114d7fa..5248b5265aa4 100644
--- a/tools/testing/selftests/arm64/mte/check_buffer_fill.c
+++ b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
@@ -415,7 +415,7 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register SIGSEGV handler */
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(20);
diff --git a/tools/testing/selftests/arm64/mte/check_child_memory.c b/tools/testing/selftests/arm64/mte/check_child_memory.c
index 7597fc632cad..b97ea3981c21 100644
--- a/tools/testing/selftests/arm64/mte/check_child_memory.c
+++ b/tools/testing/selftests/arm64/mte/check_child_memory.c
@@ -160,8 +160,8 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register SIGSEGV handler */
-	mte_register_signal(SIGSEGV, mte_default_handler);
-	mte_register_signal(SIGBUS, mte_default_handler);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
+	mte_register_signal(SIGBUS, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(12);
diff --git a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
index 3bfcd3848432..4e644a606394 100644
--- a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
+++ b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
@@ -235,8 +235,8 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register signal handlers */
-	mte_register_signal(SIGBUS, mte_default_handler);
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGBUS, mte_default_handler, false);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	allocate_hugetlb();
 
diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index 88c74bc46d4f..afea4e381862 100644
--- a/tools/testing/selftests/arm64/mte/check_ksm_options.c
+++ b/tools/testing/selftests/arm64/mte/check_ksm_options.c
@@ -141,8 +141,8 @@ int main(int argc, char *argv[])
 		return KSFT_FAIL;
 	}
 	/* Register signal handlers */
-	mte_register_signal(SIGBUS, mte_default_handler);
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGBUS, mte_default_handler, false);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(4);
diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index 17694caaff53..b37bf481c9f9 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -201,8 +201,8 @@ int main(int argc, char *argv[])
 	sizes[item - 1] = page_size + 1;
 
 	/* Register signal handlers */
-	mte_register_signal(SIGBUS, mte_default_handler);
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGBUS, mte_default_handler, false);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(22);
diff --git a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
index a3d1e23fe02a..b96296ab9870 100644
--- a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
+++ b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
@@ -180,7 +180,7 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register SIGSEGV handler */
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(4);
diff --git a/tools/testing/selftests/arm64/mte/check_user_mem.c b/tools/testing/selftests/arm64/mte/check_user_mem.c
index f4ae5f87a3b7..d1d14aaaba16 100644
--- a/tools/testing/selftests/arm64/mte/check_user_mem.c
+++ b/tools/testing/selftests/arm64/mte/check_user_mem.c
@@ -211,7 +211,7 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register signal handlers */
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(64);
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index a1dc2fe5285b..47e5f940b804 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -6,6 +6,7 @@
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <time.h>
 #include <unistd.h>
 
 #include <linux/auxvec.h>
@@ -19,20 +20,38 @@
 #include "mte_common_util.h"
 #include "mte_def.h"
 
+#ifndef SA_EXPOSE_TAGBITS
+#define SA_EXPOSE_TAGBITS 0x00000800
+#endif
+
 #define INIT_BUFFER_SIZE       256
 
 struct mte_fault_cxt cur_mte_cxt;
+bool mtefar_support;
 static unsigned int mte_cur_mode;
 static unsigned int mte_cur_pstate_tco;
 
 void mte_default_handler(int signum, siginfo_t *si, void *uc)
 {
+	struct sigaction sa;
 	unsigned long addr = (unsigned long)si->si_addr;
+	unsigned char si_tag, si_atag;
+
+	sigaction(signum, NULL, &sa);
+
+	if (sa.sa_flags & SA_EXPOSE_TAGBITS) {
+		si_tag = MT_FETCH_TAG(addr);
+		si_atag = MT_FETCH_ATAG(addr);
+		addr = MT_CLEAR_TAGS(addr);
+	} else {
+		si_tag = 0;
+		si_atag = 0;
+	}
 
 	if (signum == SIGSEGV) {
 #ifdef DEBUG
-		ksft_print_msg("INFO: SIGSEGV signal at pc=%lx, fault addr=%lx, si_code=%lx\n",
-				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code);
+		ksft_print_msg("INFO: SIGSEGV signal at pc=%lx, fault addr=%lx, si_code=%lx, si_tag=%x, si_atag=%x\n",
+				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code, si_tag, si_atag);
 #endif
 		if (si->si_code == SEGV_MTEAERR) {
 			if (cur_mte_cxt.trig_si_code == si->si_code)
@@ -45,13 +64,18 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 		}
 		/* Compare the context for precise error */
 		else if (si->si_code == SEGV_MTESERR) {
+		 	if ((!mtefar_support && si_atag) || (si_atag != MT_FETCH_ATAG(cur_mte_cxt.trig_addr))) {
+			  ksft_print_msg("Invalid MTE synchronous exception caught for address tag! si_tag=%x, si_atag: %x\n", si_tag, si_atag);
+			  exit(1);
+			}
+
 			if (cur_mte_cxt.trig_si_code == si->si_code &&
 			    ((cur_mte_cxt.trig_range >= 0 &&
-			      addr >= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-			      addr <= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
+			      addr >= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+			      addr <= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
 			     (cur_mte_cxt.trig_range < 0 &&
-			      addr <= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-			      addr >= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)))) {
+			      addr <= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+			      addr >= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)))) {
 				cur_mte_cxt.fault_valid = true;
 				/* Adjust the pc by 4 */
 				((ucontext_t *)uc)->uc_mcontext.pc += 4;
@@ -67,11 +91,11 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 		ksft_print_msg("INFO: SIGBUS signal at pc=%llx, fault addr=%lx, si_code=%x\n",
 				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code);
 		if ((cur_mte_cxt.trig_range >= 0 &&
-		     addr >= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-		     addr <= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
+		     addr >= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+		     addr <= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
 		    (cur_mte_cxt.trig_range < 0 &&
-		     addr <= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-		     addr >= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range))) {
+		     addr <= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+		     addr >= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range))) {
 			cur_mte_cxt.fault_valid = true;
 			/* Adjust the pc by 4 */
 			((ucontext_t *)uc)->uc_mcontext.pc += 4;
@@ -79,12 +103,17 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 	}
 }
 
-void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *))
+void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *),
+			 bool export_tags)
 {
 	struct sigaction sa;
 
 	sa.sa_sigaction = handler;
 	sa.sa_flags = SA_SIGINFO;
+
+	if (export_tags && signal == SIGSEGV)
+		sa.sa_flags |= SA_EXPOSE_TAGBITS;
+
 	sigemptyset(&sa.sa_mask);
 	sigaction(signal, &sa, NULL);
 }
@@ -120,6 +149,20 @@ void mte_clear_tags(void *ptr, size_t size)
 	mte_clear_tag_address_range(ptr, size);
 }
 
+void *mte_insert_atag(void *ptr)
+{
+	unsigned char atag;
+
+	srandom(time(NULL));
+	atag =  mtefar_support ? (random() % MT_ATAG_MASK) + 1 : 0;
+	return (void *)MT_SET_ATAG((unsigned long)ptr, atag);
+}
+
+void *mte_clear_atag(void *ptr)
+{
+	return (void *)MT_CLEAR_ATAG((unsigned long)ptr);
+}
+
 static void *__mte_allocate_memory_range(size_t size, int mem_type, int mapping,
 					 size_t range_before, size_t range_after,
 					 bool tags, int fd)
@@ -264,6 +307,7 @@ void mte_initialize_current_context(int mode, uintptr_t ptr, ssize_t range)
 	cur_mte_cxt.fault_valid = false;
 	cur_mte_cxt.trig_addr = ptr;
 	cur_mte_cxt.trig_range = range;
+
 	if (mode == MTE_SYNC_ERR)
 		cur_mte_cxt.trig_si_code = SEGV_MTESERR;
 	else if (mode == MTE_ASYNC_ERR)
@@ -316,12 +360,16 @@ int mte_switch_mode(int mte_option, unsigned long incl_mask)
 int mte_default_setup(void)
 {
 	unsigned long hwcaps2 = getauxval(AT_HWCAP2);
+	unsigned long hwcaps3 = getauxval(AT_HWCAP3);
 	unsigned long en = 0;
 	int ret;
 
 	if (!(hwcaps2 & HWCAP2_MTE))
 		ksft_exit_skip("MTE features unavailable\n");
 
+	if (hwcaps3 & HWCAP3_MTE_FAR)
+		mtefar_support = true;
+
 	/* Get current mte mode */
 	ret = prctl(PR_GET_TAGGED_ADDR_CTRL, en, 0, 0, 0);
 	if (ret < 0) {
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index a0017a303beb..7dbb5e1046ae 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -34,13 +34,17 @@ struct mte_fault_cxt {
 	unsigned long trig_si_code;
 	/* Flag to denote if correct fault caught */
 	bool fault_valid;
+	/* Expected address tag when mte tag fault triggered */
+	unsigned char address_tag;
 };
 
 extern struct mte_fault_cxt cur_mte_cxt;
+extern bool mtefar_support;
 
 /* MTE utility functions */
 void mte_default_handler(int signum, siginfo_t *si, void *uc);
-void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *));
+void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *),
+			 bool export_tags);
 void mte_wait_after_trig(void);
 void *mte_allocate_memory(size_t size, int mem_type, int mapping, bool tags);
 void *mte_allocate_memory_tag_range(size_t size, int mem_type, int mapping,
@@ -54,6 +58,8 @@ void mte_free_memory_tag_range(void *ptr, size_t size, int mem_type,
 			       size_t range_before, size_t range_after);
 void *mte_insert_tags(void *ptr, size_t size);
 void mte_clear_tags(void *ptr, size_t size);
+void *mte_insert_atag(void *ptr);
+void *mte_clear_atag(void *ptr);
 int mte_default_setup(void);
 void mte_restore_setup(void);
 int mte_switch_mode(int mte_option, unsigned long incl_mask);
diff --git a/tools/testing/selftests/arm64/mte/mte_def.h b/tools/testing/selftests/arm64/mte/mte_def.h
index 9b188254b61a..6ad22f07c9b8 100644
--- a/tools/testing/selftests/arm64/mte/mte_def.h
+++ b/tools/testing/selftests/arm64/mte/mte_def.h
@@ -42,6 +42,8 @@
 #define MT_TAG_COUNT		16
 #define MT_INCLUDE_TAG_MASK	0xFFFF
 #define MT_EXCLUDE_TAG_MASK	0x0
+#define MT_ATAG_SHIFT		60
+#define MT_ATAG_MASK		0xFUL
 
 #define MT_ALIGN_GRANULE	(MT_GRANULE_SIZE - 1)
 #define MT_CLEAR_TAG(x)		((x) & ~(MT_TAG_MASK << MT_TAG_SHIFT))
@@ -49,6 +51,12 @@
 #define MT_FETCH_TAG(x)		((x >> MT_TAG_SHIFT) & (MT_TAG_MASK))
 #define MT_ALIGN_UP(x)		((x + MT_ALIGN_GRANULE) & ~(MT_ALIGN_GRANULE))
 
+#define MT_CLEAR_ATAG(x)	((x) & ~(MT_TAG_MASK << MT_ATAG_SHIFT))
+#define MT_SET_ATAG(x, y)	((x) | (((y) & MT_ATAG_MASK) << MT_ATAG_SHIFT))
+#define MT_FETCH_ATAG(x)	((x >> MT_ATAG_SHIFT) & (MT_ATAG_MASK))
+
+#define MT_CLEAR_TAGS(x) 	(MT_CLEAR_ATAG(MT_CLEAR_TAG(x)))
+
 #define MT_PSTATE_TCO_SHIFT	25
 #define MT_PSTATE_TCO_MASK	~(0x1 << MT_PSTATE_TCO_SHIFT)
 #define MT_PSTATE_TCO_EN	1
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


