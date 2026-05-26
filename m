Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2835CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmiHxi7xR4E9Sqvo046zFIQQqvr26IEvNXnym4b7mmU=; b=tsiXp+V0ORJruGQoGWS2spPiiM
	FAXYUEyE7u/Xtk2ea4fKf8VgA0tdN8YBv0CUonDhz2BL2vAsZKIhS2IbXIbf1dBfshEGwLUEvoHxY
	UJ2/swepyfFgyatQvECe4qpNdDujV1nsom+ykE8gI1C1M70ksctXqkwsXIGL7NoAW8AJPMe40cmMh
	AMjPPyu+fI9jlYI11xWns+fCKDZ2MKpcw/wOL6fwHOmk299UH9/TF1kLMcdnIokYv0+Bb6YOmoJqU
	cWzSTpBaZcwIaBFG3VXuoF8/Ve/0VFt01irKfGdCEzQuSch7UW05+EOSV/WSdBaKL6ff4PUgOvQN0
	oaPC4BGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv94-00000002d4G-2vBN;
	Tue, 26 May 2026 17:00:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv90-00000002d1R-2UkL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:00:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E58E92880;
	Tue, 26 May 2026 10:00:36 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76B213F7B4;
	Tue, 26 May 2026 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779814842; bh=iJvMmKARJMy4PmrKXPgtegb/sYdsOCycAYYwWt8bo1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BvgdASy9R5qvmZtPaeYDsc4NBZJMJWX4wWIQC3TKcCwkSvOZqHmhk982R9iTxFLDX
	 kuicBtm92X69S0ZCWQ+x1b17UIXMnvt4VUEZ/xNBsuTs8nxU/0GbRSIOoRBOTqfyxP
	 WgaT+LuWs+60pCIlcALoFFUwqm179UZBfzjH2KeI=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 26 May 2026 17:59:42 +0100
Subject: [PATCH v6 6/8] perf cs-etm: Filter synthesized branch samples
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-b4-arm_cs_callchain_support_v1-v6-6-f9f49f53c9dd@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779814822; l=6879;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=t6SiGFznzemnVyx48Ji0JHPPhUpMXARu3bTihaUguW8=;
 b=BmIyuCsZ5of2/0jAb9ZJInQnJ+L/c25uQki0orTRTYqpuDvp+nf5LXmrW7O8ZP74baQk51GTi
 OcVkjNEoCTyAL/SewptwU52OKuKwBCJMe7QKc/nk74+ZlHzwDMckpq2
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_100042_719362_EDA4E030 
X-CRM114-Status: GOOD (  11.57  )
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

CS ETM currently emits branch samples for every decoded branch when
branch synthesis is enabled. This delivers redundant info when users
request only call or return branches.

Add a branch filter derived from the itrace "calls" and "returns" options.
When no filter is set, keep the existing behavior and emit all branch
samples. When call or return filtering is requested, only synthesize branch
samples whose flags match the selected branch types, including trace
begin and end markers.

Before:

  perf script -F +callindent

  callchain_test    9187 [002] 599611.826599:          1 branches:             main                                                     ffff83312258 __libc_start_call_main+0x78 (/usr/lib/aarch64-linux-gnu/libc.so.6)
  callchain_test    9187 [002] 599611.826599:          1 branches:                 foo                                                  aaaae3ed07c4 main+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826599:          1 branches:                     print                                            aaaae3ed07ac foo+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826599:          1 branches:                         do_svc                                       aaaae3ed0794 print+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826599:          1 branches:                                                                      aaaae3ed077c do_svc+0x14 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826599:          1 branches:                             vectors                                  aaaae3ed0780 do_svc+0x18 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826599:          1 branches:                                                                  ffff800080010c00 vectors+0x400 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff800080010c24 vectors+0x424 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff8000800114dc el0t_64_sync+0xd4 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff8000800114f8 el0t_64_sync+0xf0 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff800080011528 el0t_64_sync+0x120 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826600:          1 branches:                                                                  ffff800080011538 el0t_64_sync+0x130 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826601:          1 branches:                                                                  ffff800080011568 el0t_64_sync+0x160 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826601:          1 branches:                                 el0t_64_sync_handler             ffff80008001159c el0t_64_sync+0x194 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826601:          1 branches:                                                                  ffff800081829110 el0t_64_sync_handler+0x18 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826601:          1 branches:                                     el0t_64_sync_handler         ffff800081829140 el0t_64_sync_handler+0x48 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826601:          1 branches:                                     el0_svc                      ffff800081829194 el0t_64_sync_handler+0x9c ([kernel.kallsyms])

After:

  callchain_test    9187 [002] 599611.826599:          1 branches:             main                                                     ffff83312258 __libc_start_call_main+0x78 (/usr/lib/aarch64-linux-gnu/libc.so.6)
  callchain_test    9187 [002] 599611.826599:          1 branches:                 foo                                                  aaaae3ed07c4 main+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826599:          1 branches:                     print                                            aaaae3ed07ac foo+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826599:          1 branches:                         do_svc                                       aaaae3ed0794 print+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826599:          1 branches:                             vectors                                  aaaae3ed0780 do_svc+0x18 (/home/kernel/leoy/test_cs_callchain/callchain_test)
  callchain_test    9187 [002] 599611.826601:          1 branches:                                 el0t_64_sync_handler             ffff80008001159c el0t_64_sync+0x194 ([kernel.kallsyms])
  callchain_test    9187 [002] 599611.826601:          1 branches:                                     el0_svc                      ffff800081829194 el0t_64_sync_handler+0x9c ([kernel.kallsyms])

Signed-off-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index b31d0dd46a45dc365edd7c2f9e9b2eb077ca23db..8d98e772ecb307381b5ed1b4bbc4056e8779b261 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -71,6 +71,7 @@ struct cs_etm_auxtrace {
 	int num_cpu;
 	u64 latest_kernel_timestamp;
 	u32 auxtrace_type;
+	u32 branches_filter;
 	u64 branches_sample_type;
 	u64 branches_id;
 	u64 instructions_sample_type;
@@ -1596,6 +1597,10 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
 	} dummy_bs;
 	u64 ip;
 
+	if (etm->branches_filter &&
+		!(etm->branches_filter & tidq->prev_packet->flags))
+		return 0;
+
 	ip = cs_etm__last_executed_instr(tidq->prev_packet);
 
 	event->sample.header.type = PERF_RECORD_SAMPLE;
@@ -3442,6 +3447,16 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 		etm->synth_opts.thread_stack = session->itrace_synth_opts->thread_stack;
 	}
 
+	if (etm->synth_opts.calls)
+		etm->branches_filter |= PERF_IP_FLAG_CALL |
+					PERF_IP_FLAG_TRACE_BEGIN |
+					PERF_IP_FLAG_TRACE_END;
+
+	if (etm->synth_opts.returns)
+		etm->branches_filter |= PERF_IP_FLAG_RETURN |
+					PERF_IP_FLAG_TRACE_BEGIN |
+					PERF_IP_FLAG_TRACE_END;
+
 	etm->session = session;
 
 	etm->num_cpu = num_cpu;

-- 
2.34.1


