Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78511CCF2CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZOCrJukz5I9fgZNccOyeVfaQmdelsT52M0B1L0OD4Q=; b=RB+yb2A30/oXoRfVxttmoywgE/
	Eb9K9VGFLG52Gvk/tFFs/dbWVOyuSx3/jCJ7AIRMXnYAaSS6KoxBRhN9yfoLkBw8ZibtkcVd+rKHD
	UXNvFC2l19NwId18Xj5Mf3rLkbwaunZxqS02AIeXQVoesUgbCXKSZLB+ScoYi4RRYpR/fJEsOG2Iq
	yMYP+/ued1mv2QCtGsG7Qi8pswCH650LGJPbIs4bbAja/P+lW6ivKnaXtWLP+YmHniXfWvnuLTq4B
	dP0+SG/SGhVb0vEOm/5L/zR/XzCYxDjNpu/Te7zO9JBQMEnf0b+iZZr9WMlZz9iquJY4coaKpwVE9
	uC1GYp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpE7-000000044Fz-2l7G;
	Fri, 16 Oct 2026 21:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDt-0000000446l-3VIs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 21:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XZOCrJukz5I9fgZNccOyeVfaQmdelsT52M0B1L0OD4Q=; b=cg/TksoS4tLszOsTGZkHNrdXDS
	v/+D8KbP9tHjSJ8gZYvrCwCmG9QG11I5hCjmWdTdSV4KEnyr/M8sPg6TKIR2sr8NyC0LWpQRZUeYb
	7euh5rg8Xy6kA9kdQoD3R3sMNH7LCHVeGIHS0lakaJ1D6xIFRR6I2dDsLA4+JT66cn2zCTl/MIQW0
	ABWXl2X2TNEj23RA2nw0Lz/B3k1kaqYEToCAA/DHF11S4R+OPJmxwLxOR1++qrgE5ddeReG3Yl/s6
	1186af5R/V4IKEQiNp5CkeLiQRxa+ZS+MRfmxACyjT8wHSsgfhz7NQmWT4EnkGRBG8dynopFBCI+I
	6zpmMhOg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHpDn-00000001xTa-3fqM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:12:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EC6C16F3;
	Fri, 16 Oct 2026 14:12:05 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B7513F673;
	Fri, 16 Oct 2026 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185128; bh=v1LAhb2I0+3CyA4TRLYHmPRAnmRqKBFBaITXlBKMXvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f2CPc+79kObMka5QjflCmP5zLp/Dr97mFK+PaWOgXTI/BfTKn9YTvt3yMaMYyV1za
	 ziuXLBNtwselu6D1xTK+TpR4Osn2gF93KOTg6Y2cVuE/o++tUSabtA4lbWkR4F030d
	 2dih7R59FpqaMyC+G+peFwjPMif363881cMRDNM4=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:46 +0100
Subject: [PATCH v2 08/11] perf cs-etm: Reset decoder on COLLISION flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-8-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=6438;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=v1LAhb2I0+3CyA4TRLYHmPRAnmRqKBFBaITXlBKMXvw=;
 b=cBXrjgRyUeaptbN5lHxtB6Gf0hoWBYLOasi+72DzbPpb2NAzzI28CLV6AM6u5JiKkQYBMWUbt
 +1wV5GhkezaBUaE+LZDFjCcpOK1s2Xwqn7+A0KKzEpXbm6Xf2ptw5aq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_221212_182356_2FE79BAB 
X-CRM114-Status: GOOD (  20.31  )
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

Resetting the decoder at every AUX fragment boundary can discard pending
decode state even when the trace stream is continuous.

Store AUX flags when queuing indexed fragments. Preserve decoder state
across their boundaries and request an explicit reset for the next block
when the current fragment reports PERF_AUX_FLAG_COLLISION. Source restarts
with in-band synchronization are handled by the decoder. Keep resetting
between blocks queued without AUX records, where the flags are unavailable.

Keep setting and clearing the queue reset flag in cs_etm__get_trace(),
where the preceding fragment is available. Clear a request after its
nonempty block has been consumed and derive collision resets from that
fragment. Preserve deferred requests through empty buffers.
cs_etm__get_data_block() only performs the requested reset before
processing the fetched block.

Keep flushing retained context-ID thread stacks at every data block
boundary. AUX records do not distinguish buffer maintenance from normal
event disable/re-enable. In-band restart packets synchronize the decoder,
but only the current thread's stack is flushed when processing a
discontinuity. Another thread may have changed its stack while tracing was
disabled, and its first instruction sample after restart can otherwise
contain stale return addresses before branch bookkeeping clears the stack.

Flush those stacks before decoding the new block. This conservatively
limits callchains and branch history to each chunk while preserving decoder
continuity. Improving stack continuity can be handled separately.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/auxtrace.h |  2 ++
 tools/perf/util/cs-etm.c   | 46 +++++++++++++++++++++++++++++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 6947f3f284c029286837e4e1dd9f535a5f0b6334..6ea212802e418ebd6536e3ea5456bab7530eeb26 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -243,6 +243,7 @@ struct auxtrace {
  * @buffer_nr: used to number each buffer
  * @use_size: implementation actually only uses this number of bytes
  * @use_data: implementation actually only uses data starting at this address
+ * @aux_flags: AUX event flags
  */
 struct auxtrace_buffer {
 	struct list_head	list;
@@ -261,6 +262,7 @@ struct auxtrace_buffer {
 	u64			buffer_nr;
 	size_t			use_size;
 	void			*use_data;
+	u64			aux_flags;
 };
 
 /**
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 114b3cd2da495e54e78df8fbd707898312f95079..6f95730fe3b94ae3f534eee505132a2efbc4ff96 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -136,6 +136,9 @@ struct cs_etm_queue {
 	 */
 	struct intlist *own_traceid_list;
 	u32 sink_id;
+
+	/* Reset decoder before processing the fetched data block. */
+	bool reset_decoder;
 };
 
 static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm);
@@ -1436,6 +1439,13 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
 	struct auxtrace_buffer *old_buffer = aux_buffer;
 	struct auxtrace_queue *queue;
 
+	/*
+	 * Clear the reset request for the consumed block. Empty buffers have
+	 * no decoded bytes, so preserve requests deferred through them.
+	 */
+	if (etmq->buf_used)
+		etmq->reset_decoder = false;
+
 	queue = &etmq->etm->queues.queue_array[etmq->queue_nr];
 
 	aux_buffer = auxtrace_buffer__next(queue, aux_buffer);
@@ -1467,6 +1477,15 @@ cs_etm__get_trace(struct cs_etm_queue *etmq)
 	etmq->buf_used = 0;
 	etmq->buf_len = aux_buffer->size;
 	etmq->buf = aux_buffer->data;
+
+	/*
+	 * A collision requires a reset after its fragment. Without AUX flags,
+	 * reset between all blocks.
+	 */
+	if (old_buffer && (!etmq->etm->data_queued ||
+			   (old_buffer->aux_flags & PERF_AUX_FLAG_COLLISION)))
+		etmq->reset_decoder = true;
+
 	return 0;
 }
 
@@ -2162,17 +2181,15 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	if (!etmq->buf_len)
 		return 0;
 
-	/*
-	 * We cannot assume consecutive blocks in the data file
-	 * are contiguous, reset the decoder to force re-sync.
-	 */
-	ret = cs_etm_decoder__reset(etmq->decoder);
-	if (ret)
-		return ret;
+	if (etmq->reset_decoder) {
+		ret = cs_etm_decoder__reset(etmq->decoder);
+		if (ret)
+			return ret;
+	}
 
 	/*
-	 * Since the decoder is reset, this causes a global trace
-	 * discontinuity. Flush all thread stacks.
+	 * AUX records do not distinguish buffer maintenance from a source
+	 * restart. Flush all thread stacks before sampling the new block.
 	 */
 	cs_etm__flush_all_stack(etmq);
 
@@ -3154,9 +3171,8 @@ static u64 *cs_etm__create_meta_blk(u64 *buff_in, int *buff_in_offset,
  * file_offset.
  *
  * Normally, whole auxtrace buffers would be added to the queue. But we
- * want to reset the decoder for every PERF_RECORD_AUX event, and the decoder
- * is reset across each buffer, so splitting the buffers up in advance has
- * the same effect.
+ * want to check every PERF_RECORD_AUX event to decide if need to reset
+ * decoder across each buffer, so splitting the buffers up in advance.
  */
 static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_offset, size_t sz,
 				      struct perf_record_aux *aux_event, struct perf_sample *sample)
@@ -3168,6 +3184,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	union perf_event auxtrace_fragment;
 	__u64 aux_offset, aux_size;
 	enum cs_etm_format format;
+	struct auxtrace_buffer *buffer = NULL;
 
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
@@ -3251,10 +3268,13 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
 			  " tid: %d cpu: %d\n", aux_size, aux_offset, sample->tid, sample->cpu);
 		err = auxtrace_queues__add_event(&etm->queues, session, &auxtrace_fragment,
-						 file_offset, NULL);
+						 file_offset, &buffer);
 		if (err)
 			return err;
 
+		if (buffer)
+			buffer->aux_flags = aux_event->flags;
+
 		format = (aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW) ?
 				UNFORMATTED : FORMATTED;
 		if (etmq->format != UNSET && format != etmq->format) {

-- 
2.34.1


