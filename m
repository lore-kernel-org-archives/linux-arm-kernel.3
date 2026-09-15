Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3473C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNVt/6k15eEgUOyXCGERWU2sn/+2Dmf2OfO5NTjce5c=; b=b5LwGwEUmgG1tmPv47Ngb3wbgW
	Nt/1XbutugFyUKYuIwTkCvaEQJs68lyIZyBM+TIqPqG5Mtcuoi8oCuDQkWhtrpTYgMXjTGW1yAYqP
	qyyAY9+GFlVJuHzMJ7pW12ZcW8CtMXRQKP+P/Qt4yI/SHOCCoxoyIlC38XzHkvSbiHg1BuaVCwMN7
	cJtGoPcraTY1eJVt15dz/jtrxhIZZ2FW1fENBKzusRiZHOeflz1f1T8MyRQvgoYLR20tA9S+Qe2WV
	SafAcKM7S9jbQqHmxpJcHAPut0WDWeq2x+epm9xnK2iM512Nn2qa1pWmUCLfQ1xsDQm8bESMUrUN/
	0r0DFAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQd-00000007Ikd-2GFj;
	Tue, 15 Sep 2026 15:50:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPr-00000007I7A-3sH7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43081BF3;
	Tue, 15 Sep 2026 08:49:47 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 061ED3F882;
	Tue, 15 Sep 2026 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487391; bh=gphGBW/pfYc0+60Lt5giBEwB4ytrBqfB1hnk2C3sI3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZJSZAPzr2jM5zW1l9HDakxHBwkBdOZKjeVv4MdAdu11/dEbTi4vFGjKGaL+PWbvJG
	 KVxkdCLfNxVGO/qN9bQjyol0B/Ts3EozXmsxHJRivv4EvTpYnq/o0SUc4YkYCkhhWt
	 6Cja+CM4epKq0yOrDMpNrkPSh/a4a4qG8E/dzDgc=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:04 +0100
Subject: [PATCH 18/25] perf cs-etm: Unify timeless buffer decoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-18-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=4213;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=gphGBW/pfYc0+60Lt5giBEwB4ytrBqfB1hnk2C3sI3A=;
 b=Z8fLFHV3iIRtUuX2kypLyPdTfdHlUP1B9PUzCtr/QBREGYcOjT45zxXAOtr3kLC7UDKo3MdeF
 FzUq5nWOx3vBpn+x8a821QVXxu35zElQhml+NNKX1b2XwqMeTQn5dpk
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084952_061877_AF2678C3 
X-CRM114-Status: GOOD (  18.14  )
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

Per-thread and per-CPU timeless decoding use separate loops for the same
buffer processing. Per-thread mode already collects packets in a single
trace ID queue, so both modes can share the queue iteration.

Use cs_etm__run_timeless_decoder() for both modes, keeping the thread
selection in the caller. Propagate packet processing and end-of-block
errors through the common decoding path.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 68 ++++++++++++------------------------------------
 1 file changed, 16 insertions(+), 52 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index baa962085dba5226d9729a0ee8039374d5fcb1a0..1a53431161e995ba6b3cfdc86e338ed26e675774 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2681,47 +2681,9 @@ static void cs_etm__clear_all_traceid_queues(struct cs_etm_queue *etmq)
 	}
 }
 
-static int cs_etm__run_per_thread_timeless_decoder(struct cs_etm_queue *etmq)
+static int cs_etm__run_timeless_decoder(struct cs_etm_queue *etmq)
 {
-	int err = 0;
-	struct cs_etm_traceid_queue *tidq;
-
-	tidq = cs_etm__etmq_get_traceid_queue(etmq, CS_ETM_PER_THREAD_TRACEID);
-	if (!tidq)
-		return -EINVAL;
-
-	/* Go through each buffer in the queue and decode them one by one */
-	while (1) {
-		err = cs_etm__get_data_block(etmq);
-		if (err <= 0)
-			return err;
-
-		/* Run trace decoder until buffer consumed or end of trace */
-		do {
-			err = cs_etm__decode_data_block(etmq);
-			if (err)
-				return err;
-
-			/*
-			 * Process each packet in this chunk, nothing to do if
-			 * an error occurs other than hoping the next one will
-			 * be better.
-			 */
-			err = cs_etm__process_traceid_queue(etmq, tidq);
-
-		} while (etmq->buf_len);
-
-		if (err == 0)
-			/* Flush any remaining branch stack entries */
-			err = cs_etm__end_block(etmq, tidq);
-	}
-
-	return err;
-}
-
-static int cs_etm__run_per_cpu_timeless_decoder(struct cs_etm_queue *etmq)
-{
-	int idx, err = 0;
+	int idx, err;
 	struct cs_etm_traceid_queue *tidq;
 	struct int_node *inode;
 
@@ -2731,23 +2693,23 @@ static int cs_etm__run_per_cpu_timeless_decoder(struct cs_etm_queue *etmq)
 		if (err <= 0)
 			return err;
 
-		/* Run trace decoder until buffer consumed or end of trace */
+		/* Run trace decoder until the input buffer is consumed. */
 		do {
 			err = cs_etm__decode_data_block(etmq);
 			if (err)
 				return err;
 
 			/*
-			 * cs_etm__run_per_thread_timeless_decoder() runs on a
-			 * single traceID queue because each TID has a separate
-			 * buffer. But here in per-cpu mode we need to iterate
-			 * over each channel instead.
+			 * Per-thread decoding uses a single traceID queue;
+			 * formatted per-CPU buffers can contain several.
 			 */
 			intlist__for_each_entry(inode,
 						etmq->traceid_queues_list) {
 				idx = (int)(intptr_t)inode->priv;
 				tidq = etmq->traceid_queues[idx];
-				cs_etm__process_traceid_queue(etmq, tidq);
+				err = cs_etm__process_traceid_queue(etmq, tidq);
+				if (err)
+					return err;
 			}
 		} while (etmq->buf_len);
 
@@ -2760,8 +2722,6 @@ static int cs_etm__run_per_cpu_timeless_decoder(struct cs_etm_queue *etmq)
 				return err;
 		}
 	}
-
-	return err;
 }
 
 static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
@@ -2774,6 +2734,7 @@ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
 		struct auxtrace_queue *queue = &etm->queues.queue_array[i];
 		struct cs_etm_queue *etmq = queue->priv;
 		struct cs_etm_traceid_queue *tidq;
+		int err;
 
 		if (!etmq)
 			continue;
@@ -2785,10 +2746,13 @@ static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
 			if (!tidq)
 				continue;
 
-			if (tid == -1 || thread__tid(tidq->frontend_thread) == tid)
-				cs_etm__run_per_thread_timeless_decoder(etmq);
-		} else
-			cs_etm__run_per_cpu_timeless_decoder(etmq);
+			if (tid != -1 && thread__tid(tidq->frontend_thread) != tid)
+				continue;
+		}
+
+		err = cs_etm__run_timeless_decoder(etmq);
+		if (err)
+			return err;
 	}
 
 	return 0;

-- 
2.34.1


