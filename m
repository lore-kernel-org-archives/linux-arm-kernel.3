Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF75606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwutUp+b;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IeYpwhqn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1D2a9ueIcn/1KozkUgYJhguse0u76K/q+NIdrK85fIM=; b=nwutUp+b8oBUOp
	01k4cPxGuB5qUwGcwxBN/zMPCvYR2Dz/N0w1zJB7PGZml5vUzmmw1vlJSvUGvAnJHNy/1ZMH2FOn5
	LMg0zLHF1zThhxKs2hl77frnJ3fQEiYQnGQ71B6sk562IzVaQ76qnCYBheN8K6gQOOKB6ulGV3ZjW
	byBBtDFGXqa4/m7TydzmwfXPVHgRJkYXMfQisIpVSDIXaFnJQ7N8Bmx7+3zlSTIWokbFE35XT4hsy
	Wit9nhISDG6PT+OPH/NeFVegAxlsPyFg3r8tgajpdOQcGgkZSBFOo3mxNhBbJhuChvcjKkIu9UGFY
	Z7mp8jhr8EWL2XqRBbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoJQ-0000000ByBY-1XmI;
	Fri, 30 Oct 2026 15:14:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIo-0000000Bxhd-4AsO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:14:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30AC51BD0;
	Fri, 30 Oct 2026 08:13:54 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 170273F59E;
	Fri, 30 Oct 2026 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373237; bh=QW3Emauw/3585Ti2E2DMVGVF9Y4J58sbh1ibON++zdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IeYpwhqnPR52ZjETXZpv/6kiC7ay70Z20ArPJ2s53IxX0/ko7iV86HMkHc3QETP8d
	 FPH62VgSlX2U04hlzl621oNN5Z2OH1u8Q+QQw9ystwINcGllH85PVd1tSyQzFFFkDZ
	 4y0CBWHJ6FHbx+2NdRVXnmhbTt6ahfzWoy7Bt5E0=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:20 +0000
Subject: [PATCH v3 13/14] perf tests: Check CoreSight abort entry and exit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-13-7629b52ab047@arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=5442;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=QW3Emauw/3585Ti2E2DMVGVF9Y4J58sbh1ibON++zdc=;
 b=oMfv/q3JKC9v0UpCFOmc08kxcZCqBkm8fl2VNXLkIU9rtXAGedWzl9CGIcau9i8z61sqOpiS8
 937k1sIzIGEBeggGiU2olYFOGctepINGoXVX6eGXY1BjzIvNkUxqxPH
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081359_122269_8852F57C 
X-CRM114-Status: GOOD (  18.08  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add page_fault_loop to repeatedly discard an anonymous page with
MADV_DONTNEED and read it again. Each demand fault is resolved without
signal delivery, so the load must be retried at the same PC.

For example, an expected int/iret pair is:

  int            5ccadc => ffff800080010c00 insn: 00 00 40 39
  ...
  iret ffff800080012284 =>           5ccadc insn: e0 03 9f d6

The LDRB W0, [X0] at 0x5ccadc faults before completing. After resolving
the page fault, the kernel returns via ERET to the same PC to retry it.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/tests/builtin-test.c                    |  1 +
 .../perf/tests/shell/coresight/abort_entry_exit.sh | 32 +++++++++++++++++++
 tools/perf/tests/tests.h                           |  1 +
 tools/perf/tests/workloads/Build                   |  2 ++
 tools/perf/tests/workloads/page_fault_loop.c       | 37 ++++++++++++++++++++++
 5 files changed, 73 insertions(+)

diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index 24e095d4d20cee6a6aae7cfda364fb237ef74b30..86698b86657f45b094755583800062c37e16ca8b 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -192,6 +192,7 @@ static struct test_workload *workloads[] = {
 	&workload__landlock,
 	&workload__traploop,
 	&workload__branch_not_taken_loop,
+	&workload__page_fault_loop,
 	&workload__inlineloop,
 	&workload__jitdump,
 	&workload__context_switch_loop,
diff --git a/tools/perf/tests/shell/coresight/abort_entry_exit.sh b/tools/perf/tests/shell/coresight/abort_entry_exit.sh
new file mode 100755
index 0000000000000000000000000000000000000000..98aeb2b1068e9847d87e3b25aeabf6da114c6ae2
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/abort_entry_exit.sh
@@ -0,0 +1,32 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# CoreSight abort entry and exit (exclusive)
+
+. "$(dirname "$0")/../lib/coresight_exception.sh"
+
+test_abort_entry_exit()
+{
+	local attempt result
+
+	# A demand page fault retries the load at the same PC after resolution.
+	for attempt in 1 2 3; do
+		echo "Recording page faults (attempt $attempt/3)"
+		if ! record_trace page_fault_loop; then
+			cat "$tmpdir/record.log"
+			echo "Failed to record the page fault workload"
+			return 1
+		fi
+		decode_trace || return 1
+		check_exception_pairs "int" "iret" 0
+		result=$?
+		if [ "$result" -ne 2 ]; then
+			return "$result"
+		fi
+	done
+
+	echo "FAIL: No complete abort pair after three recordings"
+	return 1
+}
+
+setup_exception_test || exit $?
+test_abort_entry_exit
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 989208fcd417a676d03e2372e8a71ecf2059b9c6..8c399840a735910d4344eba928075e3ec6b1f81c 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -265,6 +265,7 @@ DECLARE_WORKLOAD(datasym);
 DECLARE_WORKLOAD(landlock);
 DECLARE_WORKLOAD(traploop);
 DECLARE_WORKLOAD(branch_not_taken_loop);
+DECLARE_WORKLOAD(page_fault_loop);
 DECLARE_WORKLOAD(inlineloop);
 DECLARE_WORKLOAD(jitdump);
 DECLARE_WORKLOAD(context_switch_loop);
diff --git a/tools/perf/tests/workloads/Build b/tools/perf/tests/workloads/Build
index d3030bd9c0752a5bc8743a4539a0ac365d215719..43cc4da6fb0786de8bb5c52717c2ad5fdbaa639c 100644
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
@@ -28,6 +29,7 @@ CFLAGS_brstack.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
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


