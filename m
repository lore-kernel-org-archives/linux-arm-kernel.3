Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443ABC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3cztdjN0JEKtCrPTfIoxHuxsxmvn0hqo3i0pdmdk4s=; b=0J0AGJ/WkiaUdLQwTTEVPkirsd
	M15b+w+mUYXAU+hBRdAqbpH9p8NeUIKcJc8lBvbezcaeSdH9WyM2jOw3K5avhY2gxtm8/CNRSrybx
	w+gn6g0YlYrDx1hSW0V626T4MQ47PHtPyLVOrqnw26zALBT7H5OZPQ2bwGoDgenPkx+ipwSe+Mutq
	gEY9qqievLVQqYPKR9XG/dIScDtQoVSxbB9lBNn4OY5i3btJSdIgKSeX0kVy9hEpnySR8oyAL1uDL
	yzFEs5F8iNd8pFrKk2RzeSt92mUzIertIcqfv8BSAg26bA2RGSLpnVH0gn7rItlH/+0Rj/CRz4STU
	Xqlfuucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oo7-00000008iJV-0RgX;
	Wed, 23 Sep 2026 15:22:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Onp-00000008i4q-2lQn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=s3cztdjN0JEKtCrPTfIoxHuxsxmvn0hqo3i0pdmdk4s=; b=hkoJFoRNJRsjZfl4QngSED5TE0
	sfz3VGVP+8x/MXHkWhaqYRHIYo95JECjCv0EzYaALx8hCIFZL9nKsr023YN9gEe74HotCGKC7uEjI
	ABFT4RJweSzd1qUMBnQ0xJ70dlLL3uk8fMo9/HLIWzYB70MrNiHC7n0DGgg4dH8w67s+KPjkVwgb0
	t0DgdcNHRcNbyEXTGVsOK9an6s/vIHPhBzBo9U0yPN0LDZzd6GQKo4Ll9Zn0BeX66hsxvdVwFMON4
	Rp2qvDwB/rBkO+hv0vcoQQ1NbTTRKJuX0StA5iq8V5sthMegoFkISe87DthbSQjkffBmOrlr0a7Q3
	ykACNQyw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Onm-0000000Evhl-2N3L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96F751E32;
	Wed, 23 Sep 2026 08:22:25 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAAC53F86F;
	Wed, 23 Sep 2026 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176949; bh=wAWNock21fh69r9WLtcmCQrLPB75x0/Rq0TuxFYrW1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fi7v9wZKt68Wyn8hugJhkzXQR6KS8/k4HG6wXUtfk+gDP0Jg2FyDay/tMmMHq+WlH
	 aYrStO+HiWYnNYQcbBMsYdVaHtHCZc4UE/9aske0GN497M/C7f5qvgk6pMd4dUcwOl
	 Ew/8NmN89urOYHJP6rPSlyujow81zMmBPHI6PSmQ=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:53 +0100
Subject: [PATCH v2 13/14] perf tests: Check CoreSight abort entry and exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-13-6ab8c07a5455@arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=5197;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=wAWNock21fh69r9WLtcmCQrLPB75x0/Rq0TuxFYrW1A=;
 b=m6woXg7xSqJIji2Grdy2XHeSakZASnTf9mr9BEZQczxOuS+ZaMnlSCyV2a24jYP+mPB+nzra5
 j9lydkL0C8rALuOwd07WxkhDhYEzdqyFTfJn8q89j1Gk82OHceQ3M2e
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_162231_103280_44034235 
X-CRM114-Status: GOOD (  18.28  )
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

Add page_fault_loop to repeatedly discard an anonymous page with
MADV_DONTNEED and read it again. Each demand fault is resolved without
signal delivery, so the load must be retried at the same PC.

For example, an expected int/iret pair is:

  int            5ccadc => ffff800080010c00 insn: 00 00 40 39
  ...
  iret ffff800080012284 =>           5ccadc insn: e0 03 9f d6

The LDRB W0, [X0] at 0x5ccadc faults before completing. After resolving
the page fault, the kernel returns via ERET to the same PC to retry it.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/tests/builtin-test.c                    |  1 +
 .../perf/tests/shell/coresight/abort_entry_exit.sh | 21 ++++++++++++
 tools/perf/tests/tests.h                           |  1 +
 tools/perf/tests/workloads/Build                   |  2 ++
 tools/perf/tests/workloads/page_fault_loop.c       | 37 ++++++++++++++++++++++
 5 files changed, 62 insertions(+)

diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 8eab221f115e75a3ef90be975d4ed0558ceb2b16..1af8dfd45d1a2ff5c3206234cd75fb173e122d88 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -172,6 +172,7 @@ static struct test_workload *workloads[] = {
 	&workload__landlock,
 	&workload__traploop,
 	&workload__branch_not_taken_loop,
+	&workload__page_fault_loop,
 	&workload__inlineloop,
 	&workload__jitdump,
 	&workload__context_switch_loop,
diff --git a/tools/perf/tests/shell/coresight/abort_entry_exit.sh b/tools/perf/tests/shell/coresight/abort_entry_exit.sh
new file mode 100755
index 0000000000000000000000000000000000000000..483cf39b3966e89591d4e06d03a3fc6709fc3dc9
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/abort_entry_exit.sh
@@ -0,0 +1,21 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# CoreSight abort entry and exit (exclusive)
+
+# shellcheck source=../lib/coresight_exception.sh
+. "$(dirname "$0")/../lib/coresight_exception.sh"
+
+test_abort_entry_exit()
+{
+	# A demand page fault retries the load at the same PC after resolution.
+	if ! record_trace page_fault_loop; then
+		cat "$tmpdir/record.log"
+		echo "Failed to record the page fault workload"
+		return 1
+	fi
+	decode_trace || return 1
+	check_exception_pairs "int" "iret" 0 || return 1
+}
+
+setup_exception_test || exit $?
+test_abort_entry_exit
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 0a61129b31ab6997616f7d04d29af73961f4f861..0fc02c5b060133ef27b80de5c868d798d65a7c53 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -247,6 +247,7 @@ DECLARE_WORKLOAD(datasym);
 DECLARE_WORKLOAD(landlock);
 DECLARE_WORKLOAD(traploop);
 DECLARE_WORKLOAD(branch_not_taken_loop);
+DECLARE_WORKLOAD(page_fault_loop);
 DECLARE_WORKLOAD(inlineloop);
 DECLARE_WORKLOAD(jitdump);
 DECLARE_WORKLOAD(context_switch_loop);
diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
index ca22a82073ed08de5d4a27d0a3b33ddcba2e3f3e..e18fdaa6fd1927ed406e703a7ecbcc19a111caf3 100644
--- a/tools/perf/tests/workloads/Build
+++ b/tools/perf/tests/workloads/Build
@@ -10,6 +10,7 @@ perf-test-y += datasym.o
 perf-test-y += landlock.o
 perf-test-y += traploop.o
 perf-test-y += branch_not_taken_loop.o
+perf-test-y += page_fault_loop.o
 perf-test-y += inlineloop.o
 perf-test-y += jitdump.o
 perf-test-y += context_switch_loop.o
@@ -27,6 +28,7 @@ CFLAGS_brstack.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_datasym.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_branch_not_taken_loop.o = -g -O0 -fno-inline -U_FORTIFY_SOURCE
+CFLAGS_page_fault_loop.o  = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_inlineloop.o       = -g -O2
 CFLAGS_deterministic.o    = -g -O0 -fno-inline -U_FORTIFY_SOURCE
 CFLAGS_named_threads.o    = -g -O0 -fno-inline -U_FORTIFY_SOURCE
diff --git a/tools/perf/tests/workloads/page_fault_loop.c b/tools/perf/tests/workloads/page_fault_loop.c
new file mode 100644
index 0000000000000000000000000000000000000000..4afbc4ab0a55400360facdc3a99ea5a5a9d52596
--- /dev/null
+++ b/tools/perf/tests/workloads/page_fault_loop.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/compiler.h>
+#include <stdio.h>
+#include <sys/mman.h>
+#include <unistd.h>
+#include "../tests.h"
+
+static int page_fault_loop(int argc __maybe_unused, const char **argv __maybe_unused)
+{
+	size_t size = getpagesize();
+	char *page;
+	int ret = 1;
+
+	page = mmap(NULL, size, PROT_READ, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (page == MAP_FAILED) {
+		perror("mmap");
+		return 1;
+	}
+
+	for (int i = 0; i < 256; i++) {
+		/* Drop the PTE so the kernel must resolve a fault on each read. */
+		if (madvise(page, size, MADV_DONTNEED)) {
+			perror("madvise");
+			goto out;
+		}
+		if (READ_ONCE(*page)) {
+			fprintf(stderr, "Anonymous page is not zero-filled\n");
+			goto out;
+		}
+	}
+	ret = 0;
+out:
+	munmap(page, size);
+	return ret;
+}
+
+DEFINE_WORKLOAD(page_fault_loop);

-- 
2.34.1


