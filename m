Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C355C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3a3ccXEs1tYwLSsqytfCea8137GAuqTDiezoriF88k=; b=Xs2VQn68BawcgIi2r5ZkYoVa8t
	EuUZC446qqtTqqGxtNzdhSN6edyaeoMMd084CwXjj3mGyYylF8TAnB4NWMtcuwbZdMV1bw1tSf1PD
	6vrF92sQqE6FCq7PCOrQAwiCmb7Nagb5Wml0e6BHhCMKAb2fDC13cuwpzUGc2hNEjTaB3ghxV2T2m
	OGcMZXzByKleyTo6VJ4W9gcBCSyYIC5MHFUD8Gw5PwDq6WFto3bWLw92lZDdzXA0nt14Uw8NQuU+S
	qyLeREgIH2yvCoE8d9jiiW/zZkmhYTSTeKpDFkDinR8iparWvmDqOI9SBwrQ0/xQSEj6/Drrclfg+
	XKE9JKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAS-00000002rMg-2gqG;
	Mon, 30 Jun 2025 16:15:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGN7-00000002k7y-2VPo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 15:24:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76FF41FCD;
	Mon, 30 Jun 2025 08:24:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C96383F6A8;
	Mon, 30 Jun 2025 08:24:38 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 30 Jun 2025 16:23:45 +0100
Subject: [PATCH v2 13/13] perf arm_spe: Allow parsing both data source and
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-13-2e1afab313b9@arm.com>
References: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-0-2e1afab313b9@arm.com>
In-Reply-To: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-0-2e1afab313b9@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 German Gomez <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751297044; l=4721;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/lhqWMzE/TAiHG6ZuSZ5lG/pd+jRuhQsAL1614Yu/fI=;
 b=XYmL7/wvXBcTzcMOe8AJqBIZon1l38vYwcjMjFbpMtuSuNLnLo8Dxd9q9sNc3u56FSOODblf3
 1/rymHMQjziB8Q57KAP0nkDC1gfZbcioz+ylk7LzOsqy0bl/Yy8bg13
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_082441_716854_A46FA13E 
X-CRM114-Status: GOOD (  18.16  )
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

Current code skips to parse events after generating data source. The
reason is the data source packets have cache and snooping related info,
the afterwards event packets might contain duplicate info.

This commit changes to continue parsing the events after data source
analysis. If data source does not give out memory level and snooping
types, then the event info is used to synthesize the related fields.

As a result, both the peer snoop option ('-d peer') and hitm options
('-d tot/lcl/rmt') are supported by Arm SPE in the perf c2c.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 75 ++++++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 240d17a974881d3d9b1654e0cf6256228fae11a7..1eb7bc8adf803ce59c0c2d7f457cbab570a0e0b4 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -911,40 +911,56 @@ static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
 {
 	struct arm_spe *spe = speq->spe;
 
-	if (data_src->mem_op == PERF_MEM_OP_LOAD)
-		arm_spe__synth_ld_memory_level(record, data_src);
-	if (data_src->mem_op == PERF_MEM_OP_STORE)
-		arm_spe__synth_st_memory_level(record, data_src);
+	/*
+	 * The data source packet contains more info for cache levels for
+	 * peer snooping. So respect the memory level if has been set by
+	 * data source parsing.
+	 */
+	if (!data_src->mem_lvl) {
+		if (data_src->mem_op == PERF_MEM_OP_LOAD)
+			arm_spe__synth_ld_memory_level(record, data_src);
+		if (data_src->mem_op == PERF_MEM_OP_STORE)
+			arm_spe__synth_st_memory_level(record, data_src);
+	}
 
 	if (!data_src->mem_lvl) {
 		data_src->mem_lvl = PERF_MEM_LVL_NA;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
 	}
 
-	if (record->type & ARM_SPE_DATA_SNOOPED) {
-		if (record->type & ARM_SPE_HITM)
-			data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
-		else
-			data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
-	} else {
-		u64 *metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
-
-		/*
-		 * Set NA ("Not available") mode if no meta data or the
-		 * SNOOPED event is not supported.
-		 */
-		if (!metadata ||
-		    !(metadata[ARM_SPE_CAP_EVENT_FILTER] & ARM_SPE_DATA_SNOOPED))
-			data_src->mem_snoop = PERF_MEM_SNOOP_NA;
-		else
-			data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+	/*
+	 * If 'mem_snoop' has been set by data source packet, skip to set
+	 * it at here.
+	 */
+	if (!data_src->mem_snoop) {
+		if (record->type & ARM_SPE_DATA_SNOOPED) {
+			if (record->type & ARM_SPE_HITM)
+				data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
+			else
+				data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
+		} else {
+			u64 *metadata =
+				arm_spe__get_metadata_by_cpu(spe, speq->cpu);
+
+			/*
+			 * Set NA ("Not available") mode if no meta data or the
+			 * SNOOPED event is not supported.
+			 */
+			if (!metadata ||
+			    !(metadata[ARM_SPE_CAP_EVENT_FILTER] & ARM_SPE_DATA_SNOOPED))
+				data_src->mem_snoop = PERF_MEM_SNOOP_NA;
+			else
+				data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+		}
 	}
 
-	if (record->type & ARM_SPE_REMOTE_ACCESS)
-		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
+	if (!data_src->mem_remote) {
+		if (record->type & ARM_SPE_REMOTE_ACCESS)
+			data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
+	}
 }
 
-static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
+static void arm_spe__synth_ds(struct arm_spe_queue *speq,
 			      const struct arm_spe_record *record,
 			      union perf_mem_data_src *data_src)
 {
@@ -963,19 +979,18 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 	} else {
 		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
 		if (!metadata)
-			return false;
+			return;
 
 		midr = metadata[ARM_SPE_CPU_MIDR];
 	}
 
 	for (i = 0; i < ARRAY_SIZE(data_source_handles); i++) {
 		if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
-			data_source_handles[i].ds_synth(record, data_src);
-			return true;
+			return data_source_handles[i].ds_synth(record, data_src);
 		}
 	}
 
-	return false;
+	return;
 }
 
 static union perf_mem_data_src
@@ -995,8 +1010,8 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
 	else
 		return data_src;
 
-	if (!arm_spe__synth_ds(speq, record, &data_src))
-		arm_spe__synth_memory_level(speq, record, &data_src);
+	arm_spe__synth_ds(speq, record, &data_src);
+	arm_spe__synth_memory_level(speq, record, &data_src);
 
 	if (record->type & (ARM_SPE_TLB_ACCESS | ARM_SPE_TLB_MISS)) {
 		data_src.mem_dtlb = PERF_MEM_TLB_WK;

-- 
2.34.1


