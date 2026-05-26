Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D43CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ5II9BdJZejFan8KejY1h0TeQAor6PT1THOItEsq3Q=; b=RzbJKZeXrTz3ZNE2ykspQPN/65
	F2HhrCkEc1g6itFZLOaU80G0X4iG09Li+Uqk5Dsb+jwetjfuPadKghMSz8sCfatCsVrXdAtjEbRbO
	OThDTqugIetYI3v5BZvoALerenlq/6fq2HXREjfAaWNqbCm6yikKD5jsP+mxd3nn4yIPFT2gX4kRE
	qwnFAs+XH1fJOuW/hpScvw8l7x8H8+dhj5YdklrGFjR4wSVjjaMQveFdnNISWGMvddOqDpQCF3FtO
	bmGsA3/kAtEBC4viIgmje30FG7REoFk/lhdtNUUjEXqvd+2CGuuhn/7GHQaVO0GYUvtkVbJP1FDE5
	JUPgourw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv9T-00000002dKE-079D;
	Tue, 26 May 2026 17:01:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv94-00000002d3d-3SHc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:00:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB60316F2;
	Tue, 26 May 2026 10:00:39 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B0203F7B4;
	Tue, 26 May 2026 10:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779814844; bh=AoBmj6oARPibtpwLxmEEnpUB2eETbTbQmfrNkJRna7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OfCxTzcfCby0PbhPAkdoPCgqSFJNR1LUuHry85tNcStEhrM8YBhKVvlXx44yQA3n4
	 WzlDhXJRZrfPehtJ4J+A+Vvwxd5pCXI1LM0UWOq0HOtBRCX4diXKkaKyucJxrm4aIA
	 cskerURNG7twHa3cOjf61goPrj6l3fZQaEJAqupA=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 26 May 2026 17:59:43 +0100
Subject: [PATCH v6 7/8] perf cs-etm: Synthesize callchains for instruction
 samples
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-b4-arm_cs_callchain_support_v1-v6-7-f9f49f53c9dd@arm.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
In-Reply-To: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>, 
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779814822; l=5883;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zGujfEFKWe0VzZgvSGUYUIWft4UQWCHlLiz2Rwf3q6A=;
 b=quZUYDw8aDi8JRb3RMHLr8NURo6xn3IDC+/CcgmGT3ByUfQJl9os9A5BtpLQS+HOLtp0aMouh
 /ipB5v45emDCIlibfRcHl1hwMSI7YTJpo8dJJBxoylauFYwAqFQannN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_100046_992964_3592B802 
X-CRM114-Status: GOOD (  18.87  )
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

From: Leo Yan <leo.yan@linaro.org>

CS ETM already records branches into the thread stack, but instruction
samples do not carry synthesized callchains. It misses to support the
callchain and no output with the itrace option 'g'.

Allocate a callchain buffer per queue and use thread_stack__sample()
when synthesizing instruction samples. Advertise PERF_SAMPLE_CALLCHAIN
on the synthetic instruction event.

Allocate the callchain stack with one more entry than requested, as the
first entry is reserved for storing context information.

After:

  perf script --itrace=g16l64i100

  callchain_test    9187 [002] 599611.826599:          1 instructions:
              aaaae3ed0774 do_svc+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
              aaaae3ed0798 print+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
              aaaae3ed07b0 foo+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
              aaaae3ed07c8 main+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
              ffff8331225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
              ffff8331233c call_init+0x9c (inlined)
              ffff8331233c __libc_start_main_impl+0x9c (inlined)
              aaaae3ed0670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)

Signed-off-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 8d98e772ecb307381b5ed1b4bbc4056e8779b261..90e0beb910156093d8bd0f320bb0210aca95dd26 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -17,6 +17,7 @@
 #include <stdlib.h>
 
 #include "auxtrace.h"
+#include "callchain.h"
 #include "color.h"
 #include "cs-etm.h"
 #include "cs-etm-decoder/cs-etm-decoder.h"
@@ -85,6 +86,7 @@ struct cs_etm_auxtrace {
 struct cs_etm_traceid_queue {
 	u8 trace_chan_id;
 	u64 period_instructions;
+	u64 kernel_start;
 	union perf_event *event_buf;
 	struct thread *thread;
 	struct thread *prev_packet_thread;
@@ -92,6 +94,7 @@ struct cs_etm_traceid_queue {
 	ocsd_ex_level el;
 	unsigned int br_stack_sz;
 	struct branch_stack *last_branch;
+	struct ip_callchain *callchain;
 	struct cs_etm_packet *prev_packet;
 	struct cs_etm_packet *packet;
 	struct cs_etm_packet_queue packet_queue;
@@ -640,6 +643,16 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 		tidq->br_stack_sz = etm->synth_opts.last_branch_sz;
 	}
 
+	if (etm->synth_opts.callchain) {
+		size_t sz = sizeof(struct ip_callchain);
+
+		/* Add 1 to callchain_sz for callchain context */
+		sz += (etm->synth_opts.callchain_sz + 1) * sizeof(u64);
+		tidq->callchain = zalloc(sz);
+		if (!tidq->callchain)
+			goto out_free;
+	}
+
 	tidq->event_buf = malloc(PERF_SAMPLE_MAX_SIZE);
 	if (!tidq->event_buf)
 		goto out_free;
@@ -647,6 +660,7 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 	return 0;
 
 out_free:
+	zfree(&tidq->callchain);
 	zfree(&tidq->last_branch);
 	zfree(&tidq->prev_packet);
 	zfree(&tidq->packet);
@@ -939,6 +953,7 @@ static void cs_etm__free_traceid_queues(struct cs_etm_queue *etmq)
 		thread__zput(tidq->thread);
 		thread__zput(tidq->prev_packet_thread);
 		zfree(&tidq->event_buf);
+		zfree(&tidq->callchain);
 		zfree(&tidq->last_branch);
 		zfree(&tidq->prev_packet);
 		zfree(&tidq->packet);
@@ -1431,6 +1446,7 @@ static void cs_etm__set_thread(struct cs_etm_queue *etmq,
 		tidq->thread = machine__idle_thread(machine);
 
 	tidq->el = el;
+	tidq->kernel_start = machine__kernel_start(machine);
 }
 
 int cs_etm__etmq_set_tid_el(struct cs_etm_queue *etmq, pid_t tid,
@@ -1561,6 +1577,25 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
 		sample.branch_stack = tidq->last_branch;
 	}
 
+	if (etm->synth_opts.callchain) {
+		if (tidq->kernel_start)
+			thread_stack__sample(tidq->thread, tidq->packet->cpu,
+					     tidq->callchain,
+					     etm->synth_opts.callchain_sz + 1,
+					     sample.ip, tidq->kernel_start);
+		else
+			/*
+			 * Clear the callchain when the kernel start address is
+			 * not available yet. The empty callchain can then be
+			 * consumed by cs_etm__inject_event().
+			 */
+			memset(tidq->callchain, 0,
+			       sizeof(struct ip_callchain) +
+			       (etm->synth_opts.callchain_sz + 1) * sizeof(u64));
+
+		sample.callchain = tidq->callchain;
+	}
+
 	if (etm->synth_opts.inject) {
 		ret = cs_etm__inject_event(etm, event, &sample,
 					   etm->instructions_sample_type);
@@ -1724,6 +1759,9 @@ static int cs_etm__synth_events(struct cs_etm_auxtrace *etm,
 		attr.branch_sample_type |= PERF_SAMPLE_BRANCH_HW_INDEX;
 	}
 
+	if (etm->synth_opts.callchain)
+		attr.sample_type |= PERF_SAMPLE_CALLCHAIN;
+
 	if (etm->synth_opts.instructions) {
 		attr.config = PERF_COUNT_HW_INSTRUCTIONS;
 		attr.sample_period = etm->synth_opts.period;
@@ -3457,6 +3495,14 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 					PERF_IP_FLAG_TRACE_BEGIN |
 					PERF_IP_FLAG_TRACE_END;
 
+	if (etm->synth_opts.callchain && !symbol_conf.use_callchain) {
+		symbol_conf.use_callchain = true;
+		if (callchain_register_param(&callchain_param) < 0) {
+			symbol_conf.use_callchain = false;
+			etm->synth_opts.callchain = false;
+		}
+	}
+
 	etm->session = session;
 
 	etm->num_cpu = num_cpu;
@@ -3508,7 +3554,8 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	}
 
 	etm->use_thread_stack = etm->synth_opts.thread_stack ||
-				etm->synth_opts.last_branch;
+				etm->synth_opts.last_branch ||
+				etm->synth_opts.callchain;
 
 	err = cs_etm__synth_events(etm, session);
 	if (err)

-- 
2.34.1


