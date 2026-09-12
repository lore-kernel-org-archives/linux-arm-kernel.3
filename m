Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96730C88E59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rp3acZ3uh0BzcQGVp4ZNc8nO3x4J+FpIvKKPnlERbdc=; b=Ew24lKAy6OBNCo5LayHkyK+MOW
	rvks/Lik2Ehgij4Of9eaPqy+GXcEhcFseIexf2QBMpXHL7cFpj2hAyBQHaRi45KgHnMgpq8kzTKZF
	Oi7/A73iqfXOhWhA5lIyNYjk1GGmdfe0BwYda5zYTm8pcDXS3kW+a0Ye6KSxn9Bu3V0w3FHAH4cXK
	Xb5ydkStsW9EJcyva5izS7be4YeDG8QCJ306P6LT1NDCwvRqDe2Hu8ZdvKryE7TXvqSSPkv0gfgcG
	PLAC2LBqKom5AvPe2XbefAVu6aA8UupgaLn/hI26fgl3pY+6iqb5wA4+VNKE9on6UJhmXI0F2Ktyk
	eCJrLrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Oa9-00000000w2p-3jKn;
	Sat, 12 Sep 2026 14:19:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Oa8-00000000w2e-3ibx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 14:19:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9A0A60232;
	Sat, 12 Sep 2026 14:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86FE1F000FF;
	Sat, 12 Sep 2026 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789222791;
	bh=Rp3acZ3uh0BzcQGVp4ZNc8nO3x4J+FpIvKKPnlERbdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fNAbsxHwcTA9WpX8gp5TmN0mm30AYSYiCXlmS7GHWCOZ6psdr4iJSJgagQNHK9QQe
	 gWJouYWDBJYT49Xxap+2dKQkDebktlMCX3SNdYyaWK/Nogz2fyRRCGFSBrBZvcQcJJ
	 xzKEx5jkGqJwYBhiT3ziWxAaP+JyrmrmAHDrhaZM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	James Clark <james.clark@arm.com>,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	jonathanh@nvidia.com,
	rwiley@nvidia.com,
	treding@nvidia.com,
	vsethi@nvidia.com,
	ywan@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-tegra@vger.kernel.org,
	Namhyung Kim <namhyung@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 0631/1424] perf cs-etm: Fix incorrect or missing decoder for raw trace
Date: Sat, 12 Sep 2026 08:51:03 +0200
Message-ID: <20260912065621.419338749@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912065607.279695368@linuxfoundation.org>
References: <20260912065607.279695368@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Besar Wicaksono <bwicaksono@nvidia.com>

[ Upstream commit a16afcc58a8c5ebc65c852faf001f8f61f05e4ef ]

The decoder creation for raw trace uses metadata from the first CPU.
On per-cpu mode, this metadata is incorrectly used for every decoder.
On per-process/per-thread traces, the first CPU is CPU0. If CPU0 trace
is not enabled, its metadata will be marked unused and the decoder is
not created. Perf report dump skips the decoding part because the
decoder is missing.

To fix this, use metadata of the CPU associated with sample object.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
Reviewed-by: James Clark <james.clark@arm.com>
Cc: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org
Cc: jonathanh@nvidia.com
Cc: rwiley@nvidia.com
Cc: treding@nvidia.com
Cc: vsethi@nvidia.com
Cc: ywan@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: coresight@lists.linaro.org
Cc: linux-tegra@vger.kernel.org
Link: https://lore.kernel.org/r/20231010234803.5419-1-bwicaksono@nvidia.com
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Stable-dep-of: 50cd0d54f1f6 ("perf cs-etm: Fix thread leaks on trace queue init failure")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/cs-etm.c | 106 ++++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 41 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 799c104901b4f..1fb104357eebb 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -283,22 +283,31 @@ static int cs_etm__metadata_set_trace_id(u8 trace_chan_id, u64 *cpu_metadata)
 }
 
 /*
- * Get a metadata for a specific cpu from an array.
+ * Get a metadata index for a specific cpu from an array.
  *
  */
-static u64 *get_cpu_data(struct cs_etm_auxtrace *etm, int cpu)
+static int get_cpu_data_idx(struct cs_etm_auxtrace *etm, int cpu)
 {
 	int i;
-	u64 *metadata = NULL;
 
 	for (i = 0; i < etm->num_cpu; i++) {
 		if (etm->metadata[i][CS_ETM_CPU] == (u64)cpu) {
-			metadata = etm->metadata[i];
-			break;
+			return i;
 		}
 	}
 
-	return metadata;
+	return -1;
+}
+
+/*
+ * Get a metadata for a specific cpu from an array.
+ *
+ */
+static u64 *get_cpu_data(struct cs_etm_auxtrace *etm, int cpu)
+{
+	int idx = get_cpu_data_idx(etm, cpu);
+
+	return (idx != -1) ? etm->metadata[idx] : NULL;
 }
 
 /*
@@ -641,66 +650,80 @@ static void cs_etm__packet_dump(const char *pkt_string)
 }
 
 static void cs_etm__set_trace_param_etmv3(struct cs_etm_trace_params *t_params,
-					  struct cs_etm_auxtrace *etm, int idx,
-					  u32 etmidr)
+					  struct cs_etm_auxtrace *etm, int t_idx,
+					  int m_idx, u32 etmidr)
 {
 	u64 **metadata = etm->metadata;
 
-	t_params[idx].protocol = cs_etm__get_v7_protocol_version(etmidr);
-	t_params[idx].etmv3.reg_ctrl = metadata[idx][CS_ETM_ETMCR];
-	t_params[idx].etmv3.reg_trc_id = metadata[idx][CS_ETM_ETMTRACEIDR];
+	t_params[t_idx].protocol = cs_etm__get_v7_protocol_version(etmidr);
+	t_params[t_idx].etmv3.reg_ctrl = metadata[m_idx][CS_ETM_ETMCR];
+	t_params[t_idx].etmv3.reg_trc_id = metadata[m_idx][CS_ETM_ETMTRACEIDR];
 }
 
 static void cs_etm__set_trace_param_etmv4(struct cs_etm_trace_params *t_params,
-					  struct cs_etm_auxtrace *etm, int idx)
+					  struct cs_etm_auxtrace *etm, int t_idx,
+					  int m_idx)
 {
 	u64 **metadata = etm->metadata;
 
-	t_params[idx].protocol = CS_ETM_PROTO_ETMV4i;
-	t_params[idx].etmv4.reg_idr0 = metadata[idx][CS_ETMV4_TRCIDR0];
-	t_params[idx].etmv4.reg_idr1 = metadata[idx][CS_ETMV4_TRCIDR1];
-	t_params[idx].etmv4.reg_idr2 = metadata[idx][CS_ETMV4_TRCIDR2];
-	t_params[idx].etmv4.reg_idr8 = metadata[idx][CS_ETMV4_TRCIDR8];
-	t_params[idx].etmv4.reg_configr = metadata[idx][CS_ETMV4_TRCCONFIGR];
-	t_params[idx].etmv4.reg_traceidr = metadata[idx][CS_ETMV4_TRCTRACEIDR];
+	t_params[t_idx].protocol = CS_ETM_PROTO_ETMV4i;
+	t_params[t_idx].etmv4.reg_idr0 = metadata[m_idx][CS_ETMV4_TRCIDR0];
+	t_params[t_idx].etmv4.reg_idr1 = metadata[m_idx][CS_ETMV4_TRCIDR1];
+	t_params[t_idx].etmv4.reg_idr2 = metadata[m_idx][CS_ETMV4_TRCIDR2];
+	t_params[t_idx].etmv4.reg_idr8 = metadata[m_idx][CS_ETMV4_TRCIDR8];
+	t_params[t_idx].etmv4.reg_configr = metadata[m_idx][CS_ETMV4_TRCCONFIGR];
+	t_params[t_idx].etmv4.reg_traceidr = metadata[m_idx][CS_ETMV4_TRCTRACEIDR];
 }
 
 static void cs_etm__set_trace_param_ete(struct cs_etm_trace_params *t_params,
-					  struct cs_etm_auxtrace *etm, int idx)
+					  struct cs_etm_auxtrace *etm, int t_idx,
+					  int m_idx)
 {
 	u64 **metadata = etm->metadata;
 
-	t_params[idx].protocol = CS_ETM_PROTO_ETE;
-	t_params[idx].ete.reg_idr0 = metadata[idx][CS_ETE_TRCIDR0];
-	t_params[idx].ete.reg_idr1 = metadata[idx][CS_ETE_TRCIDR1];
-	t_params[idx].ete.reg_idr2 = metadata[idx][CS_ETE_TRCIDR2];
-	t_params[idx].ete.reg_idr8 = metadata[idx][CS_ETE_TRCIDR8];
-	t_params[idx].ete.reg_configr = metadata[idx][CS_ETE_TRCCONFIGR];
-	t_params[idx].ete.reg_traceidr = metadata[idx][CS_ETE_TRCTRACEIDR];
-	t_params[idx].ete.reg_devarch = metadata[idx][CS_ETE_TRCDEVARCH];
+	t_params[t_idx].protocol = CS_ETM_PROTO_ETE;
+	t_params[t_idx].ete.reg_idr0 = metadata[m_idx][CS_ETE_TRCIDR0];
+	t_params[t_idx].ete.reg_idr1 = metadata[m_idx][CS_ETE_TRCIDR1];
+	t_params[t_idx].ete.reg_idr2 = metadata[m_idx][CS_ETE_TRCIDR2];
+	t_params[t_idx].ete.reg_idr8 = metadata[m_idx][CS_ETE_TRCIDR8];
+	t_params[t_idx].ete.reg_configr = metadata[m_idx][CS_ETE_TRCCONFIGR];
+	t_params[t_idx].ete.reg_traceidr = metadata[m_idx][CS_ETE_TRCTRACEIDR];
+	t_params[t_idx].ete.reg_devarch = metadata[m_idx][CS_ETE_TRCDEVARCH];
 }
 
 static int cs_etm__init_trace_params(struct cs_etm_trace_params *t_params,
 				     struct cs_etm_auxtrace *etm,
+				     bool formatted,
+				     int sample_cpu,
 				     int decoders)
 {
-	int i;
+	int t_idx, m_idx;
 	u32 etmidr;
 	u64 architecture;
 
-	for (i = 0; i < decoders; i++) {
-		architecture = etm->metadata[i][CS_ETM_MAGIC];
+	for (t_idx = 0; t_idx < decoders; t_idx++) {
+		if (formatted)
+			m_idx = t_idx;
+		else {
+			m_idx = get_cpu_data_idx(etm, sample_cpu);
+			if (m_idx == -1) {
+				pr_warning("CS_ETM: unknown CPU, falling back to first metadata\n");
+				m_idx = 0;
+			}
+		}
+
+		architecture = etm->metadata[m_idx][CS_ETM_MAGIC];
 
 		switch (architecture) {
 		case __perf_cs_etmv3_magic:
-			etmidr = etm->metadata[i][CS_ETM_ETMIDR];
-			cs_etm__set_trace_param_etmv3(t_params, etm, i, etmidr);
+			etmidr = etm->metadata[m_idx][CS_ETM_ETMIDR];
+			cs_etm__set_trace_param_etmv3(t_params, etm, t_idx, m_idx, etmidr);
 			break;
 		case __perf_cs_etmv4_magic:
-			cs_etm__set_trace_param_etmv4(t_params, etm, i);
+			cs_etm__set_trace_param_etmv4(t_params, etm, t_idx, m_idx);
 			break;
 		case __perf_cs_ete_magic:
-			cs_etm__set_trace_param_ete(t_params, etm, i);
+			cs_etm__set_trace_param_ete(t_params, etm, t_idx, m_idx);
 			break;
 		default:
 			return -EINVAL;
@@ -1016,7 +1039,7 @@ static u32 cs_etm__mem_access(struct cs_etm_queue *etmq, u8 trace_chan_id,
 }
 
 static struct cs_etm_queue *cs_etm__alloc_queue(struct cs_etm_auxtrace *etm,
-						bool formatted)
+						bool formatted, int sample_cpu)
 {
 	struct cs_etm_decoder_params d_params;
 	struct cs_etm_trace_params  *t_params = NULL;
@@ -1041,7 +1064,7 @@ static struct cs_etm_queue *cs_etm__alloc_queue(struct cs_etm_auxtrace *etm,
 	if (!t_params)
 		goto out_free;
 
-	if (cs_etm__init_trace_params(t_params, etm, decoders))
+	if (cs_etm__init_trace_params(t_params, etm, formatted, sample_cpu, decoders))
 		goto out_free;
 
 	/* Set decoder parameters to decode trace packets */
@@ -1081,14 +1104,15 @@ static struct cs_etm_queue *cs_etm__alloc_queue(struct cs_etm_auxtrace *etm,
 static int cs_etm__setup_queue(struct cs_etm_auxtrace *etm,
 			       struct auxtrace_queue *queue,
 			       unsigned int queue_nr,
-			       bool formatted)
+			       bool formatted,
+			       int sample_cpu)
 {
 	struct cs_etm_queue *etmq = queue->priv;
 
 	if (list_empty(&queue->head) || etmq)
 		return 0;
 
-	etmq = cs_etm__alloc_queue(etm, formatted);
+	etmq = cs_etm__alloc_queue(etm, formatted, sample_cpu);
 
 	if (!etmq)
 		return -ENOMEM;
@@ -2827,7 +2851,7 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
 		 * formatted in piped mode (true).
 		 */
 		err = cs_etm__setup_queue(etm, &etm->queues.queue_array[idx],
-					  idx, true);
+					  idx, true, -1);
 		if (err)
 			return err;
 
@@ -3033,7 +3057,7 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 		idx = auxtrace_event->idx;
 		formatted = !(aux_event->flags & PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
 		return cs_etm__setup_queue(etm, &etm->queues.queue_array[idx],
-					   idx, formatted);
+					   idx, formatted, sample->cpu);
 	}
 
 	/* Wasn't inside this buffer, but there were no parse errors. 1 == 'not found' */
-- 
2.53.0




