Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F19C83035
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFCddi/59t5DZzmfA5+GQhvMvc+hsPNOkwhzCn0kV0o=; b=Wu4rgd1xMQTAUAuAk4YKukqrMG
	hlAtmToT5nV9ROsikPt4VVu1w8+pfxyQaUJx2BnLuCLdrGwVpFVGw6Y/ehUn1mktZsmPSo0OWfVqc
	sqmgQp4/Dc9GmTiW+sCLASsTrGMiQWdaOns+tyh02EmAhjT3zeNeJOepRmY9Ss6cvCLU7rYsyefJP
	VHF46k/mBIjBAnVBUfWezuFWpGC7udBiGvsuIdpO4R/R8XK+vmAJpNkZHrcQHcpOz+UlaZpffcGiY
	8QDX2aTspV7YN4mLvhWza3W/06Gak1iB9GsN1m7odGIy/UA/crY+BpjlObI754M17McioGUt/eGpQ
	QkxvzWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAS-00000002rME-01lX;
	Mon, 30 Jun 2025 16:15:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGN5-00000002k6w-0C2W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 15:24:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD44F1AC1;
	Mon, 30 Jun 2025 08:24:22 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5EC3F6A8;
	Mon, 30 Jun 2025 08:24:36 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 30 Jun 2025 16:23:44 +0100
Subject: [PATCH v2 12/13] perf arm_spe: Set HITM flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-12-2e1afab313b9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751297044; l=3698;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kCA07rmok/a2Nipqsdbjcg5sMbPokpu5RSoi9V3yPo4=;
 b=NVTf9NCyUslHVFfND4Ok6GCsVN+b8axTYZ404yFL+kk7Z0YjDmu7PxP8Qxpo3lxaxT75fJAnP
 VQVXgIGs0ltAxHNcnU8XXDFmZjVmNpvdJEr5PgWOMQYFohwgBbA2q78
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_082439_166200_1E3BC1C0 
X-CRM114-Status: GOOD (  17.60  )
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

Since FEAT_SPEv1p4, Arm SPE provides extra two events "Cache data
modified" and "Data snooped".

Set the snoop mode as:

- If both the "Cache data modified" event and the "Data snooped" event
  are set, which indicates a load operation that snooped from a outside
  cache and hit a modified copy, set the HITM flag to inspect false
  sharing.
- If the snooped event bit is not set, and the snooped event has been
  supported by the hardware, set as NONE mode (no snoop operation).
- If the snooped event bit is not set, and the event is not supported or
  absent the events info in the meta data, set as NA mode (not
  available).

Don't set any mode for only "Cache data modified" event, as it hits a
local modified copy.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h |  2 ++
 tools/perf/util/arm-spe.c                         | 26 +++++++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 3afa8703b21db9d231eef93fe981e0c20d562e83..fbb57f8052371e51d562d9dd6098e97fc099461c 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -28,6 +28,8 @@
 #define ARM_SPE_L2D_ACCESS		BIT(EV_L2D_ACCESS)
 #define ARM_SPE_L2D_MISS		BIT(EV_L2D_MISS)
 #define ARM_SPE_RECENTLY_FETCHED	BIT(EV_RECENTLY_FETCHED)
+#define ARM_SPE_DATA_SNOOPED		BIT(EV_DATA_SNOOPED)
+#define ARM_SPE_HITM			BIT(EV_CACHE_DATA_MODIFIED)
 
 enum arm_spe_op_type {
 	/* First level operation type */
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 5b6699f192e5e58bab6b0d8e2e8df80fdf404a36..240d17a974881d3d9b1654e0cf6256228fae11a7 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -905,9 +905,12 @@ static void arm_spe__synth_st_memory_level(const struct arm_spe_record *record,
 	}
 }
 
-static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
+static void arm_spe__synth_memory_level(struct arm_spe_queue *speq,
+					const struct arm_spe_record *record,
 					union perf_mem_data_src *data_src)
 {
+	struct arm_spe *spe = speq->spe;
+
 	if (data_src->mem_op == PERF_MEM_OP_LOAD)
 		arm_spe__synth_ld_memory_level(record, data_src);
 	if (data_src->mem_op == PERF_MEM_OP_STORE)
@@ -918,6 +921,25 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
 	}
 
+	if (record->type & ARM_SPE_DATA_SNOOPED) {
+		if (record->type & ARM_SPE_HITM)
+			data_src->mem_snoop = PERF_MEM_SNOOP_HITM;
+		else
+			data_src->mem_snoop = PERF_MEM_SNOOP_HIT;
+	} else {
+		u64 *metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
+
+		/*
+		 * Set NA ("Not available") mode if no meta data or the
+		 * SNOOPED event is not supported.
+		 */
+		if (!metadata ||
+		    !(metadata[ARM_SPE_CAP_EVENT_FILTER] & ARM_SPE_DATA_SNOOPED))
+			data_src->mem_snoop = PERF_MEM_SNOOP_NA;
+		else
+			data_src->mem_snoop = PERF_MEM_SNOOP_NONE;
+	}
+
 	if (record->type & ARM_SPE_REMOTE_ACCESS)
 		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
 }
@@ -974,7 +996,7 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
 		return data_src;
 
 	if (!arm_spe__synth_ds(speq, record, &data_src))
-		arm_spe__synth_memory_level(record, &data_src);
+		arm_spe__synth_memory_level(speq, record, &data_src);
 
 	if (record->type & (ARM_SPE_TLB_ACCESS | ARM_SPE_TLB_MISS)) {
 		data_src.mem_dtlb = PERF_MEM_TLB_WK;

-- 
2.34.1


