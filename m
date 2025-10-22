Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F26CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BO9B7XrcsbLTZBYYkoG9n50DYuVN9Mxnkq7TtWPsbFA=; b=ITKT1tQR3zg0K5Rybem1TQU4H+
	QGz9C+9Gdk5hv6K7EjAjRVwlnUBGInnOlyDUhhUYN6Xdxu/JCkEfkqYMSiCxqZyIvqVNGJNvF8Cmb
	Wa9p7kKeC2wEVeDB4oxx2XxZEm29PWVGMILnvyzAd6G6pC/3ImdRw5IG7ZIeNolQGPl+4M7w3w2AU
	tWwN22mFhYIQxvOfUI9Rp/+RBBTEvQcxq8WWHSY9fHjnfvBfLOCixTFJHgbCQ6hHvN2UXyT27chDu
	nOjXXrOL+KEpOKhcW6jEfXm1lwdJlakOcIm+do7Ul8kSKVuOfMd4/Yzm5+PMX9CdGQZup/v7fB4eD
	UhoLMoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZpv-00000003Dt8-28do;
	Wed, 22 Oct 2025 14:29:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZps-00000003DsK-3O04
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:29:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A0511063;
	Wed, 22 Oct 2025 07:28:59 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5BF293F59E;
	Wed, 22 Oct 2025 07:29:05 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] perf cs-etm: Mute enumeration value warning
Date: Wed, 22 Oct 2025 15:28:49 +0100
Message-Id: <20251022142849.1537706-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_072908_972164_485859BC 
X-CRM114-Status: GOOD (  11.05  )
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

When the OpenCSD library introduces a new enumeration value (for example,
in the v1.7.1 release), the perf build fails with an error:

  util/cs-etm-decoder/cs-etm-decoder.c:600:10: error: enumeration value 'OCSD_GEN_TRC_ELEM_ITMTRACE' not explicitly handled in switch [-Werror, -Wswitch-enum]
    600 |         switch (elem->elem_type) {
	|                 ^~~~~~~~~~~~~~~
  1 error generated.

Convert to if-else sentences to mute the enumeration value warning,
which can avoid build failures whenever the lib is updated.

No functional change.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../perf/util/cs-etm-decoder/cs-etm-decoder.c | 44 +++++--------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index b85a8837bddc..3050fe212666 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -588,6 +588,7 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 				const ocsd_generic_trace_elem *elem)
 {
 	ocsd_datapath_resp_t resp = OCSD_RESP_CONT;
+	ocsd_gen_trc_elem_t type;
 	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
 	struct cs_etm_queue *etmq = decoder->data;
 	struct cs_etm_packet_queue *packet_queue;
@@ -597,52 +598,29 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	if (!packet_queue)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-	switch (elem->elem_type) {
-	case OCSD_GEN_TRC_ELEM_UNKNOWN:
-		break;
-	case OCSD_GEN_TRC_ELEM_EO_TRACE:
-	case OCSD_GEN_TRC_ELEM_NO_SYNC:
-	case OCSD_GEN_TRC_ELEM_TRACE_ON:
+	type = elem->elem_type;
+
+	if (type == OCSD_GEN_TRC_ELEM_EO_TRACE ||
+	    type == OCSD_GEN_TRC_ELEM_NO_SYNC ||
+	    type == OCSD_GEN_TRC_ELEM_TRACE_ON)
 		resp = cs_etm_decoder__buffer_discontinuity(etmq, packet_queue,
 							    trace_chan_id);
-		break;
-	case OCSD_GEN_TRC_ELEM_INSTR_RANGE:
+	else if (type == OCSD_GEN_TRC_ELEM_INSTR_RANGE)
 		resp = cs_etm_decoder__buffer_range(etmq, packet_queue, elem,
 						    trace_chan_id);
-		break;
-	case OCSD_GEN_TRC_ELEM_EXCEPTION:
+	else if (type == OCSD_GEN_TRC_ELEM_EXCEPTION)
 		resp = cs_etm_decoder__buffer_exception(etmq, packet_queue, elem,
 							trace_chan_id);
-		break;
-	case OCSD_GEN_TRC_ELEM_EXCEPTION_RET:
+	else if (type == OCSD_GEN_TRC_ELEM_EXCEPTION_RET)
 		resp = cs_etm_decoder__buffer_exception_ret(etmq, packet_queue,
 							    trace_chan_id);
-		break;
-	case OCSD_GEN_TRC_ELEM_TIMESTAMP:
+	else if (type == OCSD_GEN_TRC_ELEM_TIMESTAMP)
 		resp = cs_etm_decoder__do_hard_timestamp(etmq, elem,
 							 trace_chan_id,
 							 indx);
-		break;
-	case OCSD_GEN_TRC_ELEM_PE_CONTEXT:
+	else if (type == OCSD_GEN_TRC_ELEM_PE_CONTEXT)
 		resp = cs_etm_decoder__set_tid(etmq, packet_queue,
 					       elem, trace_chan_id);
-		break;
-	/* Unused packet types */
-	case OCSD_GEN_TRC_ELEM_I_RANGE_NOPATH:
-	case OCSD_GEN_TRC_ELEM_ADDR_NACC:
-	case OCSD_GEN_TRC_ELEM_CYCLE_COUNT:
-	case OCSD_GEN_TRC_ELEM_ADDR_UNKNOWN:
-	case OCSD_GEN_TRC_ELEM_EVENT:
-	case OCSD_GEN_TRC_ELEM_SWTRACE:
-	case OCSD_GEN_TRC_ELEM_CUSTOM:
-	case OCSD_GEN_TRC_ELEM_SYNC_MARKER:
-	case OCSD_GEN_TRC_ELEM_MEMTRANS:
-#if (OCSD_VER_NUM >= 0x010400)
-	case OCSD_GEN_TRC_ELEM_INSTRUMENTATION:
-#endif
-	default:
-		break;
-	}
 
 	return resp;
 }
-- 
2.34.1


