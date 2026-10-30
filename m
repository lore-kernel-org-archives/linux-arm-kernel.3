Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFCF60A261C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JoZ1jWDY;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QCvl31bO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zVQzlbm/axbBWxu0idKA4EVFIq0SJVIOwTqe3aaB750=; b=JoZ1jWDYe9cST6
	T6WxqHWZr/WeacVVkwQhFD5/ZkMdkQcVn+47w6uWx04R3YdsilfrC6zqGF1bUXk04cKpy9VnTEGut
	KpHCaQE96T0LOkhzZ95WczZsg/jyM3j8KUedGl5GPu4fNPqRDbUdoOWaQjfUcDkFxs/EaWeAIf/xx
	yWehtzuGx9YVYJ8bXDTuBGHmm/veda9zkIXWYoxIN51kcbqOR0AtD/mKa117Fkz3td9ePeCHfw9bs
	9GVAHCf2zMef7roibt5W7kKyUN7QLOVsGDgcTC9sC18hkzP/0LJHQQm2MCD3nxMqvOk/kfAzgMdLC
	HDutMjS4KNJMQfRk9/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIj-0000000BxYS-0Clk;
	Fri, 30 Oct 2026 15:13:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIS-0000000BxNL-0aGh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 105181682;
	Fri, 30 Oct 2026 08:13:31 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA8613F59E;
	Fri, 30 Oct 2026 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373214; bh=IZ5g89KjjQVhG8DabVVL8mYXRbldOMIptBm7uGTdIHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QCvl31bO81hsMqCRIG7IvAKtG9EpsG1GTWZDaJju2sKQEVUWfNQHcOKJGazF8StLp
	 BsSdzQEKVFrfDErf+WL2pP/qeryxkkuniz2/SJDCylHAoeydjNMEN17dVIYOcDN9+E
	 I6OpPQDc26AEIi1uHiISyN+Y9BG4+pRuTgLmXEXw=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:11 +0000
Subject: [PATCH v3 04/14] perf cs-etm: Centralize packet ISA initialization
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-4-7629b52ab047@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=6522;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=IZ5g89KjjQVhG8DabVVL8mYXRbldOMIptBm7uGTdIHg=;
 b=FAMayDVqkvtNqud0uLZ4nRZib1P01Wxyoge8/8ClkBKGzleHcFz1M9vMp/tM2iHXzI6B/VyUL
 thxZ2U/H1pKDOVL5c2w1HMaaj9+r0kvHztxJPE9tL1OnU0T6RYrVA/r
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081336_273102_B2C7874A 
X-CRM114-Status: GOOD (  12.56  )
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

Exception packets need their own ISA so the frontend can generate samples
directly from them. Currently, ISA initialization is limited to instruction
range packets.

Move ISA initialization into cs_etm_decoder__buffer_packet() and use a
common helper to obtain it from the OpenCSD element. Populate the ISA for
instruction ranges, context updates and exceptions, leaving it unknown
for other element types.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 69 +++++++++++++++----------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 3fbb3fdf0382705bd4efa732c54ebb816144b2a8..911bb28db2985bc65828ad342ca5b0a8bb903e47 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -368,9 +368,38 @@ cs_etm_decoder__reset_timestamp(struct cs_etm_packet_queue *packet_queue)
 	packet_queue->instr_count = 0;
 }
 
+static enum cs_etm_isa
+cs_etm_decoder__get_isa(const ocsd_generic_trace_elem *elem)
+{
+	/*
+	 * OpenCSD preserves ISA and context between output elements, including
+	 * exceptions after a context change with no intervening range.
+	 */
+	if (elem->elem_type != OCSD_GEN_TRC_ELEM_PE_CONTEXT &&
+	    elem->elem_type != OCSD_GEN_TRC_ELEM_INSTR_RANGE &&
+	    elem->elem_type != OCSD_GEN_TRC_ELEM_EXCEPTION)
+		return CS_ETM_ISA_UNKNOWN;
+
+	switch (elem->isa) {
+	case ocsd_isa_aarch64:
+		return CS_ETM_ISA_A64;
+	case ocsd_isa_arm:
+		return CS_ETM_ISA_A32;
+	case ocsd_isa_thumb2:
+		return CS_ETM_ISA_T32;
+	case ocsd_isa_tee:
+	case ocsd_isa_jazelle:
+	case ocsd_isa_custom:
+	case ocsd_isa_unknown:
+	default:
+		return CS_ETM_ISA_UNKNOWN;
+	}
+}
+
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 			      struct cs_etm_packet_queue *packet_queue,
+			      const ocsd_generic_trace_elem *elem,
 			      const u8 trace_chan_id,
 			      enum cs_etm_sample_type sample_type)
 {
@@ -389,7 +418,7 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 	packet_queue->packet_count++;
 
 	packet_queue->packet_buffer[et].sample_type = sample_type;
-	packet_queue->packet_buffer[et].isa = CS_ETM_ISA_UNKNOWN;
+	packet_queue->packet_buffer[et].isa = cs_etm_decoder__get_isa(elem);
 	packet_queue->packet_buffer[et].cpu = cpu;
 	packet_queue->packet_buffer[et].start_addr = CS_ETM_INVAL_ADDR;
 	packet_queue->packet_buffer[et].end_addr = CS_ETM_INVAL_ADDR;
@@ -420,31 +449,13 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 	int ret = 0;
 	struct cs_etm_packet *packet;
 
-	ret = cs_etm_decoder__buffer_packet(etmq, packet_queue, trace_chan_id,
-					    CS_ETM_RANGE);
+	ret = cs_etm_decoder__buffer_packet(etmq, packet_queue, elem,
+					    trace_chan_id, CS_ETM_RANGE);
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
 	packet = &packet_queue->packet_buffer[packet_queue->tail];
 
-	switch (elem->isa) {
-	case ocsd_isa_aarch64:
-		packet->isa = CS_ETM_ISA_A64;
-		break;
-	case ocsd_isa_arm:
-		packet->isa = CS_ETM_ISA_A32;
-		break;
-	case ocsd_isa_thumb2:
-		packet->isa = CS_ETM_ISA_T32;
-		break;
-	case ocsd_isa_tee:
-	case ocsd_isa_jazelle:
-	case ocsd_isa_custom:
-	case ocsd_isa_unknown:
-	default:
-		packet->isa = CS_ETM_ISA_UNKNOWN;
-	}
-
 	packet->start_addr = elem->st_addr;
 	packet->end_addr = elem->en_addr;
 	packet->instr_count = elem->num_instr_range;
@@ -483,6 +494,7 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_discontinuity(struct cs_etm_queue *etmq,
 				     struct cs_etm_packet_queue *queue,
+				     const ocsd_generic_trace_elem *elem,
 				     const uint8_t trace_chan_id)
 {
 	/*
@@ -490,7 +502,7 @@ cs_etm_decoder__buffer_discontinuity(struct cs_etm_queue *etmq,
 	 * reset time statistics.
 	 */
 	cs_etm_decoder__reset_timestamp(queue);
-	return cs_etm_decoder__buffer_packet(etmq, queue, trace_chan_id,
+	return cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_chan_id,
 					     CS_ETM_DISCONTINUITY);
 }
 
@@ -502,7 +514,7 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 {	int ret = 0;
 	struct cs_etm_packet *packet;
 
-	ret = cs_etm_decoder__buffer_packet(etmq, queue, trace_chan_id,
+	ret = cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_chan_id,
 					    CS_ETM_EXCEPTION);
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
@@ -516,9 +528,10 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 static ocsd_datapath_resp_t
 cs_etm_decoder__buffer_exception_ret(struct cs_etm_queue *etmq,
 				     struct cs_etm_packet_queue *queue,
+				     const ocsd_generic_trace_elem *elem,
 				     const uint8_t trace_chan_id)
 {
-	return cs_etm_decoder__buffer_packet(etmq, queue, trace_chan_id,
+	return cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_chan_id,
 					     CS_ETM_EXCEPTION_RET);
 }
 
@@ -555,8 +568,8 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 				elem->context.exception_level, tid))
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-	ret = cs_etm_decoder__buffer_packet(etmq, packet_queue, trace_chan_id,
-					    CS_ETM_CONTEXT);
+	ret = cs_etm_decoder__buffer_packet(etmq, packet_queue, elem,
+					    trace_chan_id, CS_ETM_CONTEXT);
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
@@ -597,7 +610,7 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	    type == OCSD_GEN_TRC_ELEM_TRACE_ON ||
 	    type == OCSD_GEN_TRC_ELEM_ADDR_NACC)
 		resp = cs_etm_decoder__buffer_discontinuity(etmq, packet_queue,
-							    trace_chan_id);
+							    elem, trace_chan_id);
 	else if (type == OCSD_GEN_TRC_ELEM_INSTR_RANGE)
 		resp = cs_etm_decoder__buffer_range(etmq, packet_queue, elem,
 						    trace_chan_id);
@@ -606,7 +619,7 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 							trace_chan_id);
 	else if (type == OCSD_GEN_TRC_ELEM_EXCEPTION_RET)
 		resp = cs_etm_decoder__buffer_exception_ret(etmq, packet_queue,
-							    trace_chan_id);
+							    elem, trace_chan_id);
 	else if (type == OCSD_GEN_TRC_ELEM_TIMESTAMP)
 		resp = cs_etm_decoder__do_hard_timestamp(etmq, elem,
 							 trace_chan_id,

-- 
2.34.1


