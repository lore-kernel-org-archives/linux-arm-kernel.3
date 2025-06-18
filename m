Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF951C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4RKM/yBl/d7ztyW2itLjj6SP+MjnpsKQWbbMiAvJkY=; b=CPlCQa+yn8SxRIcbeNumQy9bhw
	RKoPRhKM9g/ucqsaAJsli+KY6BO6KzIiEuRvSRQVlTSDAL4c1Qut0mNzkw2JoHLeySirdP+HSIjva
	WiV3HSNTftMK5Aoccxtbfa3acOrfsHQPp//ZZQgtcw4bu8aJcMCn0Qluo+YVR5sLVRMO0k3WDCGSL
	5/7VJtvfqZ21/6yFE9WKK4nUoAr6L4n1p71liAVcnlhtMKcvkrx5rm9N5OViSgqYoePqEszd9zMzV
	gL6xI0FvSfugam7F/ubL0s5veiXje1NbE27zBRRDTzJaG/4fYU3aRqkjxCvQf3XSW0bCRbQvkmDao
	NMq6NAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouA-00000009Vaw-0xgT;
	Wed, 18 Jun 2025 09:16:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoQE-00000009SIe-4ApF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 08:45:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1601C14BF;
	Wed, 18 Jun 2025 01:45:10 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 708403F66E;
	Wed, 18 Jun 2025 01:45:28 -0700 (PDT)
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
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 05/10] kselftest/arm64/mte: register mte signal handler with SA_EXPOSE_TAGBITS
Date: Wed, 18 Jun 2025 09:45:08 +0100
Message-Id: <20250618084513.1761345-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618084513.1761345-1-yeoreum.yun@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_014531_137696_2411DF84 
X-CRM114-Status: GOOD (  10.69  )
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

To test address tag[63:60] and memory tag[59:56] is preserved
when memory tag fault happen, Let mte_register_signal() to register
signal handler with SA_EXPOSE_TAGBITS.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/mte/check_buffer_fill.c |  2 +-
 .../testing/selftests/arm64/mte/check_child_memory.c  |  4 ++--
 .../selftests/arm64/mte/check_hugetlb_options.c       |  4 ++--
 tools/testing/selftests/arm64/mte/check_ksm_options.c |  4 ++--
 .../testing/selftests/arm64/mte/check_mmap_options.c  |  4 ++--
 .../selftests/arm64/mte/check_tags_inclusion.c        |  2 +-
 tools/testing/selftests/arm64/mte/check_user_mem.c    |  2 +-
 tools/testing/selftests/arm64/mte/mte_common_util.c   | 11 ++++++++++-
 tools/testing/selftests/arm64/mte/mte_common_util.h   |  3 ++-
 9 files changed, 23 insertions(+), 13 deletions(-)

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
index a1dc2fe5285b..83240b980f9c 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -19,6 +19,10 @@
 #include "mte_common_util.h"
 #include "mte_def.h"
 
+#ifndef SA_EXPOSE_TAGBITS
+#define SA_EXPOSE_TAGBITS 0x00000800
+#endif
+
 #define INIT_BUFFER_SIZE       256
 
 struct mte_fault_cxt cur_mte_cxt;
@@ -79,12 +83,17 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
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
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index a0017a303beb..6b109e84fa39 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -40,7 +40,8 @@ extern struct mte_fault_cxt cur_mte_cxt;
 
 /* MTE utility functions */
 void mte_default_handler(int signum, siginfo_t *si, void *uc);
-void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *));
+void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *),
+			 bool export_tags);
 void mte_wait_after_trig(void);
 void *mte_allocate_memory(size_t size, int mem_type, int mapping, bool tags);
 void *mte_allocate_memory_tag_range(size_t size, int mem_type, int mapping,
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


