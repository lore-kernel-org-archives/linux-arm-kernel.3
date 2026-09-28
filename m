Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D5C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyH6phtw/20Drzo7M6upmH19BdCV6VhIq7/dFxDdeMk=; b=lRF/YoWIfV+bP263c42FOoFc0d
	kIgyW75FQoHOl4l1oAJyJnVeZqilTeQ05pYRcE+qoto2M2f2NzT8YUgx6DQ9kwbjpRvvQVyNxA/zK
	CAE9/0VWzR0nGLjihtNMEV9qItO/SRpP35LzRpkRkduCx5Jd9C7rAWUptK5pPG7iLl3jPkulugOrY
	EbKiJNPYNUeZRHxQlSt3POEu5Rdtdg2So/kFqCuM61RyvQAEVwTuuvWnnWEqcquOPa21SOhxJ4QUD
	pdZVyga7pmrw9cpAGQNasC+txO5i6unN4R4EHJbuRC9MjjfMFxlGgZGxriH7U80d75Cea1I7S07b9
	gjfUeL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7xf-00000000Gh3-3ebk;
	Mon, 28 Sep 2026 09:47:51 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7xd-00000000Gg1-2RHN;
	Mon, 28 Sep 2026 09:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790588867; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=YyH6phtw/20Drzo7M6upmH19BdCV6VhIq7/dFxDdeMk=;
	b=Fy4k2j7GMwphUzq6q9tynGC+s8f9H5ItEHk2CjTdg13bEjFjdIaZDBiQlzeexPslZi9vqhxk0WhC5dMnqv5XTFWThFh23LYdyrLZR0sT2z7JdE6axC1beoq8IyrM36eVpHWdXtabCT0BUfubAespsATQ7CxEE2edCIJNC+b7vuw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBlsENs_1790588865;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBlsENs_1790588865 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 17:47:46 +0800
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
Subject: [PATCH 2/2] perf tsc: Replace the compile-time TSC support check with a weak hook
Date: Mon, 28 Sep 2026 17:47:39 +0800
Message-ID: <20260928094739.2605-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928094739.2605-1-cp0613@linux.alibaba.com>
References: <20260928094739.2605-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_024749_902757_8E956569 
X-CRM114-Status: GOOD (  15.45  )
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
architecture, and it can drift apart from the set of architectures that
really provide a counter: util/tsc.c already ships a weak rdtsc() which
an architecture overrides with a strong definition when it has one.

Add a weak arch__rdtsc_supported() next to the weak rdtsc(), let the
test query it instead of the macros, and have x86, arm64 and riscv
override it in the file where they implement rdtsc().  Support is then
declared next to the counter it describes, and a caller can tell a stub
apart from a real counter without keeping its own copy of the macro
list.  This follows the pattern of the other optional per-architecture
hooks in util/ such as get_cpuid_str().

x86 and arm64 keep the same behaviour, and riscv starts running the
subtest because it gained rdtsc() in the previous patch.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 tools/perf/arch/arm64/util/tsc.c    |  5 +++++
 tools/perf/arch/riscv/util/tsc.c    |  5 +++++
 tools/perf/arch/x86/util/tsc.c      |  5 +++++
 tools/perf/tests/perf-time-to-tsc.c | 12 +-----------
 tools/perf/util/tsc.c               |  9 +++++++++
 tools/perf/util/tsc.h               |  1 +
 6 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/tools/perf/arch/arm64/util/tsc.c b/tools/perf/arch/arm64/util/tsc.c
index cc85bd9e73f1..fd7fba50d0a6 100644
--- a/tools/perf/arch/arm64/util/tsc.c
+++ b/tools/perf/arch/arm64/util/tsc.c
@@ -19,3 +19,8 @@ u64 rdtsc(void)
 
 	return val;
 }
+
+bool arch__rdtsc_supported(void)
+{
+	return true;
+}
diff --git a/tools/perf/arch/riscv/util/tsc.c b/tools/perf/arch/riscv/util/tsc.c
index 7cc4710ac38c..312b0c755439 100644
--- a/tools/perf/arch/riscv/util/tsc.c
+++ b/tools/perf/arch/riscv/util/tsc.c
@@ -17,3 +17,8 @@ u64 rdtsc(void)
 
 	return val;
 }
+
+bool arch__rdtsc_supported(void)
+{
+	return true;
+}
diff --git a/tools/perf/arch/x86/util/tsc.c b/tools/perf/arch/x86/util/tsc.c
index 3a439e4b12d2..6c01e96b5c2e 100644
--- a/tools/perf/arch/x86/util/tsc.c
+++ b/tools/perf/arch/x86/util/tsc.c
@@ -17,6 +17,11 @@ u64 rdtsc(void)
 	return low | ((u64)high) << 32;
 }
 
+bool arch__rdtsc_supported(void)
+{
+	return true;
+}
+
 /*
  * Derive the TSC frequency in Hz from the /proc/cpuinfo, for example:
  * ...
diff --git a/tools/perf/tests/perf-time-to-tsc.c b/tools/perf/tests/perf-time-to-tsc.c
index f8f71fdd32b1..c91e22d93b53 100644
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
@@ -49,7 +39,7 @@
 static int test__tsc_is_supported(struct test_suite *test __maybe_unused,
 				  int subtest __maybe_unused)
 {
-	if (!TSC_IS_SUPPORTED) {
+	if (!arch__rdtsc_supported()) {
 		pr_debug("Test not supported on this architecture\n");
 		return TEST_SKIP;
 	}
diff --git a/tools/perf/util/tsc.c b/tools/perf/util/tsc.c
index ebf289bf6b9d..815621b1d112 100644
--- a/tools/perf/util/tsc.c
+++ b/tools/perf/util/tsc.c
@@ -113,6 +113,15 @@ u64 __weak rdtsc(void)
 	return 0;
 }
 
+/*
+ * An architecture that implements rdtsc() with a real counter should override
+ * this, so that users of the counter can tell a stub apart from support.
+ */
+bool __weak arch__rdtsc_supported(void)
+{
+	return false;
+}
+
 size_t perf_event__fprintf_time_conv(union perf_event *event, FILE *fp)
 {
 	struct perf_record_time_conv *tc = (struct perf_record_time_conv *)event;
diff --git a/tools/perf/util/tsc.h b/tools/perf/util/tsc.h
index 57ce8449647f..83e76b207365 100644
--- a/tools/perf/util/tsc.h
+++ b/tools/perf/util/tsc.h
@@ -25,6 +25,7 @@ int perf_read_tsc_conversion(const struct perf_event_mmap_page *pc,
 u64 perf_time_to_tsc(u64 ns, struct perf_tsc_conversion *tc);
 u64 tsc_to_perf_time(u64 cyc, struct perf_tsc_conversion *tc);
 u64 rdtsc(void);
+bool arch__rdtsc_supported(void);
 u64 arch_get_tsc_freq(void);
 
 size_t perf_event__fprintf_time_conv(union perf_event *event, FILE *fp);
-- 
2.50.1


