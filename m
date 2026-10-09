Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED446CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yHX7TM9fLxZS6eG0EC3z+89LNYfj0REHh1L/xbrn9U=; b=eFmFKJQ1C3TduNUciREsl2aHzw
	wjr+jqSp1a2gXj4jszQI4r6H8oimDPBsNDEM9BG+nzJwACO/ugLe/Hq8C5Wf1lGpt7B1do2kjXjFc
	akyoE8f9JoVslYp1vOE9mhnwpn6FNKunpKcQ5QXAcl+YyPNl6L4dleSECkEYtbaEOrLLDf6G8N0nL
	fGmaujj7WDMfjmrmgOOBFmS+r8yZ0RJfJldxRtttVvNVKkoiLLlaIXu6+Hj+4Q3ZrxHIqtl9oziPo
	Mgul7v59+/29TrLLA1JkoLJ0GVdEyxFcmgPkuGT4F3CQgFlJVdhsjffO6c2M0rSU3eRZLHNidXphg
	w10VhIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Gg-00000005MhI-1uha;
	Fri, 09 Oct 2026 03:27:34 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Gb-00000005MeD-1CzP;
	Fri, 09 Oct 2026 03:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791516446; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=5yHX7TM9fLxZS6eG0EC3z+89LNYfj0REHh1L/xbrn9U=;
	b=NIrgbHCwkheJd3fZPEX2HTm2qwApWnx6A+AMHGo7zlsWd7TCPRwb5tPk8I+2lfIXgsoFs8UJopt2erS/8lKm2tA1FIgKCvr5un101DKB6CIZ66imIJmjJVoPiOgGB9SlrUi1BQb060Ip+Z1nMfIOt93C6Ihc7UJ6tiR/GbgSFjw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0XCS-sL3_1791516442;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCS-sL3_1791516442 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 11:27:23 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: acme@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	john.g.garry@oracle.com,
	will@kernel.org,
	mike.leach@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	guoren@kernel.org,
	anup@brainfault.org,
	david.laight.linux@gmail.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 2/2] perf tsc: Declare TSC support from the build system
Date: Fri,  9 Oct 2026 11:27:15 +0800
Message-ID: <20261009032715.2841-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009032715.2841-1-cp0613@linux.alibaba.com>
References: <20261009032715.2841-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_202729_653459_06D996C3 
X-CRM114-Status: GOOD (  11.84  )
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

The "TSC support" subtest of the "Convert perf time to TSC" test decides
whether the architecture is covered by matching compiler macros for
x86_64, i386 and arm64.  That list has to be edited for every new
architecture and can drift apart from the set of architectures that really
provide a counter.

Declare the capability where the implementation is, following the
PERF_HAVE_JITDUMP pattern: an architecture with a usable counter sets
PERF_HAVE_RDTSC in its arch Makefile, Makefile.config turns it into
-DHAVE_RDTSC, and the test keys off that.

x86 and arm64 keep the same behaviour, riscv starts running the subtest
where the previous patch defines rdtsc().

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Paul Walmsley <pjw@kernel.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
Changes in v3:
- Key off IS_BUILTIN(HAVE_RDTSC), with <tools/config.h> included, instead of
  an #ifndef block.

Changes in v2:
- Declare the capability through the build system instead of a weak
  arch__rdtsc_supported() hook.

 tools/perf/Makefile.config          |  4 ++++
 tools/perf/arch/arm64/Makefile      |  1 +
 tools/perf/arch/riscv/Makefile      |  1 +
 tools/perf/arch/x86/Makefile        |  1 +
 tools/perf/tests/perf-time-to-tsc.c | 14 ++------------
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 4d5993da9f94..f1b3bf208231 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -618,6 +618,10 @@ ifdef PERF_HAVE_JITDUMP
   endif
 endif
 
+ifeq ($(PERF_HAVE_RDTSC),1)
+  CFLAGS += -DHAVE_RDTSC
+endif
+
 ifeq ($(SRCARCH),powerpc)
   ifndef NO_LIBDW
     CFLAGS += -DHAVE_SKIP_CALLCHAIN_IDX
diff --git a/tools/perf/arch/arm64/Makefile b/tools/perf/arch/arm64/Makefile
index 44cc3f023318..b9cd559065d6 100644
--- a/tools/perf/arch/arm64/Makefile
+++ b/tools/perf/arch/arm64/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 PERF_HAVE_JITDUMP := 1
+PERF_HAVE_RDTSC := 1
diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
index 44cc3f023318..8036bf55da8e 100644
--- a/tools/perf/arch/riscv/Makefile
+++ b/tools/perf/arch/riscv/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 PERF_HAVE_JITDUMP := 1
+PERF_HAVE_RDTSC := $(IS_64_BIT)
diff --git a/tools/perf/arch/x86/Makefile b/tools/perf/arch/x86/Makefile
index 44cc3f023318..b9cd559065d6 100644
--- a/tools/perf/arch/x86/Makefile
+++ b/tools/perf/arch/x86/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 PERF_HAVE_JITDUMP := 1
+PERF_HAVE_RDTSC := 1
diff --git a/tools/perf/tests/perf-time-to-tsc.c b/tools/perf/tests/perf-time-to-tsc.c
index f8f71fdd32b1..fb1a3f0774ef 100644
--- a/tools/perf/tests/perf-time-to-tsc.c
+++ b/tools/perf/tests/perf-time-to-tsc.c
@@ -10,6 +10,7 @@
 #include <perf/cpumap.h>
 #include <perf/evlist.h>
 #include <perf/mmap.h>
+#include <tools/config.h>
 
 #include "debug.h"
 #include "parse-events.h"
@@ -22,16 +23,6 @@
 #include "tests.h"
 #include "util/sample.h"
 
-/*
- * Except x86_64/i386 and Arm64, other archs don't support TSC in perf.  Just
- * enable the test for x86_64/i386 and Arm64 archs.
- */
-#if defined(__x86_64__) || defined(__i386__) || defined(__aarch64__)
-#define TSC_IS_SUPPORTED 1
-#else
-#define TSC_IS_SUPPORTED 0
-#endif
-
 #define CHECK__(x) {				\
 	while ((x) < 0) {			\
 		pr_debug(#x " failed!\n");	\
@@ -49,11 +40,10 @@
 static int test__tsc_is_supported(struct test_suite *test __maybe_unused,
 				  int subtest __maybe_unused)
 {
-	if (!TSC_IS_SUPPORTED) {
+	if (!IS_BUILTIN(HAVE_RDTSC)) {
 		pr_debug("Test not supported on this architecture\n");
 		return TEST_SKIP;
 	}
-
 	return TEST_OK;
 }
 
-- 
2.50.1


