Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2E0C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PP9jPPY/n+KW7YJO3hkRrmeaKPaghLkGH1AiZdlqGYc=; b=2llFvjb7RNV/jkwnbfDpxCiR0e
	JwEbGtOMkkEfZFALSaFkfcz8V5fixNoGn+Az0whT1D/UbXGoNWpvQ+d8QvtZ1A3JKaUrOJRufQKwo
	7YuIbVbMFtKUVaoSrzaIoWhrIDDL25tGYm1rObNgk4VHS93BtVuPxdMpBDK2ARq6SwBzn4EtUD82k
	/aUIv7fvX5XXAHV4HYMEuMfd5PtcnQp/mrGYcdL+6ir9Au3eNR7gd+L8UM2f6mk5TGEJX3Jliad10
	TQSoVLQmFMtJmztGE1xQeVnklzHRRQc22l5kecfHNlRiPLa4rS8nK4HiU77vq3c62fAh/6xV21hTV
	fMk26PyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OnR-00000008hpv-2psh;
	Wed, 23 Sep 2026 15:22:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OnJ-00000008hk5-1ncU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC0B21576;
	Wed, 23 Sep 2026 08:21:54 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BA603F86F;
	Wed, 23 Sep 2026 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176918; bh=XRNWbpk0QOOsA2aYa6yH6hal8elpLwnaUnNIt+qhB34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dzbcJJ2GegtV42YfoU4VmSBZCeD3RUeaypFiErM97ILHM+NAxZGFghi0Aq8jtgsXX
	 69Rg6b9xPZ6htruioABbpF/6c373L72NJkHwdc9fdcmn2FQ/jHsrDiFOydTdKpgMeK
	 t9W7SqYcKXUGHVzfVqDKka7mU4xPoqW0B3V9Je58=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:41 +0100
Subject: [PATCH v2 01/14] perf sample: Allow decoders to supply branch
 return addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-1-6ab8c07a5455@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=8195;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=XRNWbpk0QOOsA2aYa6yH6hal8elpLwnaUnNIt+qhB34=;
 b=2732rz0LHJ47CsPp1Ve7ayP1SNvJvY30yLB8A6AEAHpNtmkETQFrujAYDLnKgC6qend9ThXSh
 bzG5i1sTnvUBNEV6oX9zIVdgB0/MZPT5+8V41p858HyAuxErDMlmFH+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082201_565828_4750BFC7 
X-CRM114-Status: GOOD (  24.54  )
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

The thread stack derives return addresses from IP + insn_len. For an
interrupt or fault, the return address can instead be the sample IP even
when instruction bytes at that address are available.

Add ret_addr to perf_sample and prefer it in thread_stack__trace_end()
and thread_stack__process() when supplied. Initialize it to zero so other
samples retain the IP + insn_len calculation.

Add a regression test for explicit exception return addresses and the
ordinary call fallback when the return address is zero.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/tests/Build          |   1 +
 tools/perf/tests/builtin-test.c |   1 +
 tools/perf/tests/tests.h        |   1 +
 tools/perf/tests/thread-stack.c | 106 ++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/sample.c        |   1 +
 tools/perf/util/sample.h        |   5 ++
 tools/perf/util/thread-stack.c  |   5 +-
 7 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 81c311b131b72715f11b6501511a18dce2af07df..d03ae938dd0ad92f78f8de6900ce7161f39fc3bc 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -29,6 +29,7 @@ perf-test-y += task-exit.o
 perf-test-y += sw-clock.o
 perf-test-y += mmap-thread-lookup.o
 perf-test-y += thread-maps-share.o
+perf-test-y += thread-stack.o
 perf-test-$(CONFIG_LIBTRACEEVENT) += switch-tracking.o
 perf-test-y += keep-tracking.o
 perf-test-y += code-reading.o
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index d2f594921e25bda9fc662e7ba82464bfef1b752b..6259ed805c5f75799d52ac742b77cf278f98bd9d 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -112,6 +112,7 @@ static struct test_suite *generic_tests[] = {
 	&suite__hists_filter,
 	&suite__mmap_thread_lookup,
 	&suite__thread_maps_share,
+	&suite__thread_stack,
 	&suite__hists_output,
 	&suite__hists_cumulate,
 #ifdef HAVE_LIBTRACEEVENT
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 9c96f33483d1435644da6068c3802f7a914a9de0..b2520a564417b61718f1dcb23da1f8cc0f601906 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -138,6 +138,7 @@ DECLARE_SUITE(expr);
 DECLARE_SUITE(hists_filter);
 DECLARE_SUITE(mmap_thread_lookup);
 DECLARE_SUITE(thread_maps_share);
+DECLARE_SUITE(thread_stack);
 DECLARE_SUITE(hists_output);
 DECLARE_SUITE(hists_cumulate);
 DECLARE_SUITE(switch_tracking);
diff --git a/tools/perf/tests/thread-stack.c b/tools/perf/tests/thread-stack.c
new file mode 100644
index 0000000000000000000000000000000000000000..0239e3bee34faf8fd4ddc7b723cf479609760064
--- /dev/null
+++ b/tools/perf/tests/thread-stack.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/kernel.h>
+#include <unistd.h>
+#include "tests.h"
+#include "util/addr_location.h"
+#include "util/event.h"
+#include "util/sample.h"
+#include "util/thread.h"
+#include "util/thread-stack.h"
+
+#define CALL_REF		1234UL
+#define RET_REF			5678UL
+
+struct return_check {
+	unsigned int matched;
+	unsigned int unmatched;
+};
+
+static int check_call_return(struct call_return *cr,
+			     u64 *parent_db_id __maybe_unused, void *data)
+{
+	struct return_check *check = data;
+
+	if (cr->call_ref == CALL_REF && cr->return_ref == RET_REF && !cr->flags)
+		check->matched++;
+	else
+		check->unmatched++;
+
+	return 0;
+}
+
+/* A zero expected_ret_addr asks the stack to use ip + insn_len. */
+static int check_return_address(u64 expected_ret_addr, u64 actual_ret_addr,
+				u32 flags)
+{
+	struct call_return_processor *crp;
+	struct return_check check = { };
+	struct thread *thread;
+	struct addr_location from = { }, to = { };
+	struct perf_sample sample = { };
+	int ret = TEST_FAIL;
+
+	thread = thread__new(getpid(), getpid());
+	if (!thread)
+		return TEST_FAIL;
+
+	crp = call_return_processor__new(check_call_return, &check);
+	if (!crp)
+		goto out;
+
+	sample.ip = 0x1000;		/* Call or exception source addr */
+	sample.addr = 0x2000;		/* Callee or exception handler addr */
+	sample.ret_addr = expected_ret_addr;
+	sample.flags = PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_CALL | flags;
+	sample.time = 1;
+	/* Model the opcode length after an instruction fetch. */
+	sample.insn_len = 4;
+	if (thread_stack__process(thread, thread__comm(thread), &sample,
+				  &from, &to, CALL_REF, crp))
+		goto out;
+
+	sample.ip = 0x2000;		/* Return instruction addr */
+	sample.addr = actual_ret_addr;	/* Return branch target addr */
+	sample.ret_addr = 0;
+	sample.flags = PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_RETURN |
+		       (flags & (PERF_IP_FLAG_INTERRUPT | PERF_IP_FLAG_SYSCALLRET));
+	sample.time = 2;
+	if (thread_stack__process(thread, thread__comm(thread), &sample,
+				  &to, &from, RET_REF, crp))
+		goto out;
+
+	if (check.matched == 1 && !check.unmatched)
+		ret = TEST_OK;
+
+out:
+	thread__put(thread);
+	call_return_processor__free(crp);
+	return ret;
+}
+
+static int test__thread_stack(struct test_suite *test __maybe_unused,
+			      int subtest __maybe_unused)
+{
+	static const struct {
+		const char *name;
+		u64 expected_ret_addr;
+		u64 actual_ret_addr;
+		u32 flags;
+	} cases[] = {
+		{ "ordinary call", 0, 0x1004, 0 },
+		{ "interrupt", 0x1000, 0x1000, PERF_IP_FLAG_ASYNC | PERF_IP_FLAG_INTERRUPT },
+		{ "fault or trap", 0x1000, 0x1000, PERF_IP_FLAG_INTERRUPT },
+		{ "SVC", 0x1004, 0x1004, PERF_IP_FLAG_SYSCALLRET },
+	};
+
+	for (size_t i = 0; i < ARRAY_SIZE(cases); i++) {
+		if (check_return_address(cases[i].expected_ret_addr,
+					 cases[i].actual_ret_addr, cases[i].flags)) {
+			pr_debug("Incorrect return address for %s\n", cases[i].name);
+			return TEST_FAIL;
+		}
+	}
+	return TEST_OK;
+}
+
+DEFINE_SUITE("Thread stack return addresses after instruction fetching", thread_stack);
diff --git a/tools/perf/util/sample.c b/tools/perf/util/sample.c
index bccc19e2aaf25118a8ecde88473aa6cb16fa561a..4abb689132bc27d0f2318eeafca20f7e57621837 100644
--- a/tools/perf/util/sample.c
+++ b/tools/perf/util/sample.c
@@ -29,6 +29,7 @@ void perf_sample__init(struct perf_sample *sample, bool all)
 		sample->intr_regs = NULL;
 		sample->merged_callchain = false;
 		sample->callchain = NULL;
+		sample->ret_addr = 0;
 	}
 }
 
diff --git a/tools/perf/util/sample.h b/tools/perf/util/sample.h
index cb4b16654876e9a5c3bfd66be3e0235ac15795e0..865ed18200f1339f5949ef3f185ed57a34aace72 100644
--- a/tools/perf/util/sample.h
+++ b/tools/perf/util/sample.h
@@ -131,6 +131,11 @@ struct perf_sample {
 	u64 time;
 	/** @addr: The sample event PERF_SAMPLE_ADDR value. */
 	u64 addr;
+	/**
+	 * @ret_addr: Return address supplied by the decoder for a branch sample.
+	 *            Zero means use ip + insn_len.
+	 */
+	u64 ret_addr;
 	/** @id: The sample event PERF_SAMPLE_ID or PERF_SAMPLE_IDENTIFIER value. */
 	u64 id;
 	/** @stream_id: The sample event PERF_SAMPLE_STREAM_ID value. */
diff --git a/tools/perf/util/thread-stack.c b/tools/perf/util/thread-stack.c
index 1360f44421ef8bb80fe5cfdba59be7e6029b0240..d452d1a7eabb16f040ca3dada23e6fdec8fb1088 100644
--- a/tools/perf/util/thread-stack.c
+++ b/tools/perf/util/thread-stack.c
@@ -1030,7 +1030,7 @@ static int thread_stack__trace_end(struct thread_stack *ts,
 	cp = call_path__findnew(cpr, ts->stack[ts->cnt - 1].cp, NULL, 0,
 				ts->kernel_start);
 
-	ret_addr = sample->ip + sample->insn_len;
+	ret_addr = sample->ret_addr ? sample->ret_addr : sample->ip + sample->insn_len;
 
 	return thread_stack__push_cp(ts, ret_addr, sample->time, ref, cp,
 				     false, true);
@@ -1154,7 +1154,8 @@ int thread_stack__process(struct thread *thread, struct comm *comm,
 		if (!sample->ip || !sample->addr)
 			return 0;
 
-		ret_addr = sample->ip + sample->insn_len;
+		/* Opcode fetching must not change a decoder-supplied return address. */
+		ret_addr = sample->ret_addr ? sample->ret_addr : sample->ip + sample->insn_len;
 		if (ret_addr == sample->addr)
 			return 0; /* Zero-length calls are excluded */
 

-- 
2.34.1


