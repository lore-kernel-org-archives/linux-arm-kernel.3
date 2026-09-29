Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC801C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxgSoOlX1qoO+V9gQu3kRbObk1n3POX5OUlcjG8xVss=; b=PnWoVGrooX9E+XLBoYKJ+KnPJC
	Lme74g4CvY5OgDbIQ+QUES8RuWvUOMoX+IiDNlzIbfy0L0rF10jAy7ku7WeRmRtloHBkDNbnL8i7m
	AmTMmwOqHDIhDQURm0R0VGX7AASmhlQD92mwhGQImKhWXcoMHolbnGDiKSW9T7Rb2mCUJjlSF1NQr
	lHI0ZdMkFj6llFrHUclAVTWmIG14M8Uns+RB4dPoT2DBdEmfhzIgxDJUXK33JnkeiQrr6QywXenn2
	tSQrVBe5kK89WKyeHeclUEXAV+LEtD0AW8rssQK+ANtPF8yjlFKp5+c1hxzFBPvaumxPqRuGnXDJX
	ZHI/k4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOjH-00000002FBA-47kU;
	Tue, 29 Sep 2026 03:42:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOjG-00000002FAS-3m8L;
	Tue, 29 Sep 2026 03:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cxgSoOlX1qoO+V9gQu3kRbObk1n3POX5OUlcjG8xVss=; b=FdidwHdWE+FZBA46FCTow1fUHS
	YOPsBaEj6g4w6D2AcQ8OZ+lmjx92rfDd2dxrGgE8Kvn5m1DMwJaEBMRwUtlYXnDWdLtHkROdXj5l9
	GlqunOyK/QBV9hL/x9BQLrL2QGQUhmeLmLyZlrGafE83KmszMb7odM4z4zYdY8yhD0gbq3MRCVj5N
	c+5MoinjhXXiHTUW+a6IuWrkJdKVq/aJ0GdobWwjH4Sby3/d5kJFsWL2g7lIEHpWdhj4IhQLjVju1
	yHP66uR1bvVuE6F5QFZEdkWTHLY8SEP2iTtnm9Oh6xHYYUJk5SHHYLz0uH0553bk3cza48lDj6KDd
	mbyhULLQ==;
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOjC-0000000AXdp-0YEj;
	Tue, 29 Sep 2026 03:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790653302; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=cxgSoOlX1qoO+V9gQu3kRbObk1n3POX5OUlcjG8xVss=;
	b=FucF6+HYzwBRvjkN5wHoRPp+2MZ4CEGRvWmSM4vQH81PTE8SL3LV9rvroWu1ZnHYwTHEFr3kVzObXS8WPMdSA7RcQHRzL+lUQaYbafYGvtr/I4lmnWH5CCcK+q8D2hvzlU+nTozbKqkziF+0iKjuP7iCrnEBJ8Di4flQPITgUKA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBrsVAL_1790653299;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBrsVAL_1790653299 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 11:41:40 +0800
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
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] perf tsc: Declare TSC support from the build system
Date: Tue, 29 Sep 2026 11:41:33 +0800
Message-ID: <20260929034133.2153-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929034133.2153-1-cp0613@linux.alibaba.com>
References: <20260929034133.2153-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_044202_485169_232082BC 
X-CRM114-Status: GOOD (  10.67  )
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

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
Changes in v2:
- Declare the capability through the build system instead of a weak
  arch__rdtsc_supported() hook.

 tools/perf/Makefile.config          |  4 ++++
 tools/perf/arch/arm64/Makefile      |  1 +
 tools/perf/arch/riscv/Makefile      |  1 +
 tools/perf/arch/x86/Makefile        |  1 +
 tools/perf/tests/perf-time-to-tsc.c | 19 ++++---------------
 5 files changed, 11 insertions(+), 15 deletions(-)

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
index f8f71fdd32b1..feb8063f8b59 100644
--- a/tools/perf/tests/perf-time-to-tsc.c
+++ b/tools/perf/tests/perf-time-to-tsc.c
@@ -22,16 +22,6 @@
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
@@ -49,11 +39,10 @@
 static int test__tsc_is_supported(struct test_suite *test __maybe_unused,
 				  int subtest __maybe_unused)
 {
-	if (!TSC_IS_SUPPORTED) {
-		pr_debug("Test not supported on this architecture\n");
-		return TEST_SKIP;
-	}
-
+#ifndef HAVE_RDTSC
+	pr_debug("Test not supported on this architecture\n");
+	return TEST_SKIP;
+#endif
 	return TEST_OK;
 }
 
-- 
2.50.1


