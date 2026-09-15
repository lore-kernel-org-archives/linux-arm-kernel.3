Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D149CC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvMtKW8yG4VkbtqmdX0gKYEp4DgU6cTjqC6NKdQTHWw=; b=LXxdOKeYPksqEYWHymVMlxvc20
	hO6Wp8OTM9CVv/iYtrH8mCPLLXqaZKMhueZmpo2fPXllHqr2B53VFM8YGY+qn41RVVv7cOD+uUjeS
	v7fypjxw8gkmUIZXnm854DvBanaJIPsx1YYBfwyYAZkje6jk5tTEZ2AirdQk8lelR66nQTvPhVVwk
	6fpJKwbrwTNkjHhiwshGeGUTXo+hmYeSBZlKo0jY0iJ7tDWsKM1wm6Dmb0q8Lp238DVJjrsDDrjA1
	3nvfQDB5lRgFDckhdbdm2ADGuZHZCuUI12Atr8MtQsSklWfyH0Pn7qn/4VbZg4XqMrijGxtVUpQ4X
	4XG3RWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQd-00000007IlH-3VkW;
	Tue, 15 Sep 2026 15:50:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPx-00000007ICk-1sJk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:50:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DA6115A1;
	Tue, 15 Sep 2026 08:49:53 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 507713F882;
	Tue, 15 Sep 2026 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487396; bh=QSuE0CikkbK3d7jRBR8VtxCr0gWJsEf3ovfSqjudRaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qmU5CpfUedMXo6kozsqjXEMrRQkEgeoK3ehedaoinzbxgbhuQPDUO3EtE5lPS1f3h
	 IyT8miznoGU/dX3fVCk41eoRLNGnqgjimfJKcMF/iNnbIRO7B0cXpTe4EDEcInzi88
	 DImKhXTAnnIDgPmDZEwwBY+lue1wjV67ke+KGSMQ=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:06 +0100
Subject: [PATCH 20/25] perf cs-etm: Drain pending packets before finishing
 trace blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-20-35cf6f297d20@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487341; l=7864;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=QSuE0CikkbK3d7jRBR8VtxCr0gWJsEf3ovfSqjudRaI=;
 b=ZZBCNU6WWj/S5L54s4XqqS2xuzPDvb3N5VEi679N1z4zkevOxcPZ6WHhLr+L2XzJzy7wprDUl
 5s9VOfUPQgrAQ2QXHnAlyRAtj0cDveVBdPue2qRrDvlAd917W37O7f+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_085000_124049_EA27ED84 
X-CRM114-Status: GOOD (  25.24  )
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

OpenCSD can consume the final input byte while returning WAIT with trace
output still pending. Stopping when buf_len reaches zero leaves that
output unprocessed before the next block resets the decoder.

Add cs_etm_decoder__drain_packets() to resume a waiting decoder with
OCSD_OP_FLUSH without supplying more input. Call it from
cs_etm__decode_data_block() after all input has been consumed and keep the
buffer active until draining completes.

Return a positive value while input or pending output remains, zero on
completion, and a negative error on failure. Update timeless decoding,
timestamp seeding and timestamped queue processing to use this contract.
Process queued packets even on the final call. Also drain pending output
before resetting the decoder when dumping raw packets.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 17 +++++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  7 +++
 tools/perf/util/cs-etm.c                        | 59 ++++++++++++++++---------
 3 files changed, 61 insertions(+), 22 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 26940f1f1b0bf44c8671d80020597c672c361c1a..a7a6410481e5c99be14a951493092c145a8512ba 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -793,6 +793,23 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 	return ret;
 }
 
+int cs_etm_decoder__drain_packets(struct cs_etm_decoder *decoder)
+{
+	if (OCSD_DATA_RESP_IS_WAIT(decoder->prev_return))
+		decoder->prev_return = ocsd_dt_process_data(decoder->dcd_tree,
+							    OCSD_OP_FLUSH,
+							    0,
+							    0,
+							    NULL,
+							    NULL);
+
+	if (OCSD_DATA_RESP_IS_WAIT(decoder->prev_return))
+		return 1;
+
+	/* No further WAIT driven flushing is needed */
+	return OCSD_DATA_RESP_IS_CONT(decoder->prev_return) ? 0 : -EINVAL;
+}
+
 void cs_etm_decoder__free(struct cs_etm_decoder *decoder)
 {
 	if (!decoder)
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 12c782fa6db285852f9f901735aa1f0e55b955e8..c187f3809ba0a350ca6ee549d2c0c67ed8e16d1e 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -91,6 +91,13 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 				       u64 indx, const u8 *buf,
 				       size_t len, size_t *consumed);
 
+/*
+ * Drain pending packets after consuming a data block.
+ * Process queued packets after each call, including the final call.
+ * Returns 1 for WAIT, 0 when done, or a negative error.
+ */
+int cs_etm_decoder__drain_packets(struct cs_etm_decoder *decoder);
+
 struct cs_etm_decoder *
 cs_etm_decoder__new(int num_cpu,
 		    struct cs_etm_decoder_params *d_params,
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 8340b8a16fed363795fc78ffbc419661a61442a3..e78c8e089f38eae34faa12bbd2f899f1f72acce4 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -129,6 +129,7 @@ struct cs_etm_queue {
 	u8 pending_timestamp_chan_id;
 	enum cs_etm_format format;
 	u64 offset;
+	/* Cleared once the current block is fully decoded and drained */
 	const unsigned char *buf;
 	size_t buf_len, buf_used;
 	/* Conversion between traceID and index in traceid_queues array */
@@ -943,6 +944,12 @@ static void cs_etm__dump_event(struct cs_etm_queue *etmq,
 		buffer_used += consumed;
 	} while (buffer_used < buffer->size);
 
+	if (!ret) {
+		do {
+			ret = cs_etm_decoder__drain_packets(etmq->decoder);
+		} while (ret > 0);
+	}
+
 	cs_etm_decoder__reset(etmq->decoder);
 }
 
@@ -1319,7 +1326,7 @@ static int cs_etm__queue_first_cs_timestamp(struct cs_etm_auxtrace *etm,
 		 * trace for that block.
 		 */
 		ret = cs_etm__decode_data_block(etmq);
-		if (ret)
+		if (ret < 0)
 			goto out;
 
 		/*
@@ -2171,14 +2178,17 @@ static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
  *			   if need be.
  * Returns:	< 0	if error
  *		= 0	if no more auxtrace_buffer to read
- *		> 0	if the current buffer isn't empty yet
+ *		> 0	if input or decoder output remains in the current block
  */
 static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 {
 	int ret;
 
-	/* The current block is not finished */
-	if (etmq->buf_len)
+	/*
+	 * A non-NULL buf indicates that packets are still pending.
+	 * Drain them before resetting for a new block.
+	 */
+	if (etmq->buf)
 		return 1;
 
 	ret = cs_etm__get_trace(etmq);
@@ -2555,11 +2565,22 @@ static int cs_etm__set_sample_flags(struct cs_etm_queue *etmq,
 	return 0;
 }
 
+/*
+ * Return 0 when decoding and draining are complete, 1 if another call is
+ * needed, or a negative error. Process queued packets even on return 0.
+ */
 static int cs_etm__decode_data_block(struct cs_etm_queue *etmq)
 {
-	int ret = 0;
+	int ret;
 	size_t processed = 0;
 
+	if (!etmq->buf_len) {
+		ret = cs_etm_decoder__drain_packets(etmq->decoder);
+		if (!ret)
+			etmq->buf = NULL;
+		return ret;
+	}
+
 	/*
 	 * Packets are decoded and added to the decoder's packet queue
 	 * until the decoder packet processing callback has requested that
@@ -2573,14 +2594,13 @@ static int cs_etm__decode_data_block(struct cs_etm_queue *etmq)
 						 etmq->buf_len,
 						 &processed);
 	if (ret)
-		goto out;
+		return ret;
 
 	etmq->offset += processed;
 	etmq->buf_used += processed;
 	etmq->buf_len -= processed;
 
-out:
-	return ret;
+	return 1;
 }
 
 static int cs_etm__process_traceid_queue(struct cs_etm_queue *etmq,
@@ -2689,7 +2709,7 @@ static int cs_etm__clear_all_traceid_queues(struct cs_etm_queue *etmq)
 
 static int cs_etm__run_timeless_decoder(struct cs_etm_queue *etmq)
 {
-	int idx, err;
+	int idx, err, pending;
 	struct cs_etm_traceid_queue *tidq;
 	struct int_node *inode;
 
@@ -2701,9 +2721,9 @@ static int cs_etm__run_timeless_decoder(struct cs_etm_queue *etmq)
 
 		/* Run trace decoder until the input buffer is consumed. */
 		do {
-			err = cs_etm__decode_data_block(etmq);
-			if (err)
-				return err;
+			pending = cs_etm__decode_data_block(etmq);
+			if (pending < 0)
+				return pending;
 
 			/*
 			 * Per-thread decoding uses a single traceID queue;
@@ -2717,7 +2737,7 @@ static int cs_etm__run_timeless_decoder(struct cs_etm_queue *etmq)
 				if (err)
 					return err;
 			}
-		} while (etmq->buf_len);
+		} while (pending);
 
 		intlist__for_each_entry(inode, etmq->traceid_queues_list) {
 			idx = (int)(intptr_t)inode->priv;
@@ -2884,26 +2904,21 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm,
 		}
 
 		ret = cs_etm__decode_data_block(etmq);
-		if (ret)
+		if (ret < 0)
 			goto out;
 
 		cs_timestamp = cs_etm__etmq_get_timestamp(etmq, &trace_chan_id);
 
 		if (!cs_timestamp) {
 			/*
-			 * Function cs_etm__decode_data_block() returns when
-			 * there is no more traces to decode in the current
-			 * auxtrace_buffer OR when a timestamp has been
-			 * encountered on any of the traceID queues.  Since we
-			 * did not get a timestamp, there is no more traces to
-			 * process in this auxtrace_buffer.  As such empty and
-			 * flush all traceID queues.
+			 * No timestamp is available yet. Process the queued packets
+			 * before resuming input or draining the current block.
 			 */
 			ret = cs_etm__clear_all_traceid_queues(etmq);
 			if (ret)
 				goto out;
 
-			/* Fetch another auxtrace_buffer for this etmq */
+			/* Draining and fetch another auxtrace_buffer for this etmq */
 			goto refetch;
 		}
 

-- 
2.34.1


