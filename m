Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09852C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WJEuhJQQjtPEDFIJ6KkQ1nRw/3CfAPqg/FF00vE0CM=; b=q4YpQSx7xdq/1uAwj9zGhw3wfy
	cBQ8lWPAwinbOO6qb82LrC0Y6iJZAC6nSQUPUSY84WcA5JdONOH4GrdQ+3EliDVZcQrLt2Nr1xa22
	V/n4KV0Ic5NV5Gl2/SqLpzfsTBst48vl+HSumTu+ul6qLisKp7qSM0iL7HlJyRR8jKv4MYVIzOnaq
	vsqc+C6LcTfeDDNVvBIoKSQaqSo7ppXb2DKH7H8ZuSmZsGrxBRG1jvXkr60MqD+dUCP7Ns4pq5bVJ
	hnUlQ/WZQoupfi9yFoUVBI4Q0pjiHaw3JbuZO7IAwRufkTWLzFzKXg4a4aYqHb0ftFvXUIHKQV87W
	DPIyTXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xU-0000000HG90-48rG;
	Fri, 13 Jun 2025 18:16:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6ji-0000000Gy6G-0rpH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:54:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B11922C7;
	Fri, 13 Jun 2025 08:54:13 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07E773F59E;
	Fri, 13 Jun 2025 08:54:31 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 13 Jun 2025 16:53:42 +0100
Subject: [PATCH 09/12] perf arm_spe: Fill memory levels for FEAT_SPEv1p4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-9-6faecf0a8775@arm.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749830053; l=3693;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=A4Y1D9P2h2IKUt45rfjvpeEd4ZKkwCM4tB9te3GaKkQ=;
 b=oZEGivW3mTIO+c7e2lMjkS5yI+J2Hp7FhY4vseJu0PCF0MhIw7X06DnNCTlQPVtRMRnytwCAW
 Fwdg4IgtNzFAOAa+6NCA/xDgM8EMhpwEGvWusowCBc86qMMhGwvjwMc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085434_333303_5D2A8DB6 
X-CRM114-Status: GOOD (  11.42  )
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

Starting with FEAT_SPEv1p4, Arm SPE provides information on Level 2 data
cache and recently fetched events. This patch fills in the memory levels
for these new events.

The recently fetched events are matched to line-fill buffer (LFB). In
general, the latency for accessing LFB is higher than accessing L1 cache
but lower than accessing L2 cache. Thus, it locates in the memory
hierarchy information between L1 cache and L2 cache.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h |  3 +++
 tools/perf/util/arm-spe.c                         | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 03da55453da8fd2e7b9e2dcba3ddcf5243599e1c..90c76928c7bf1b35cec538abdb0e88d6083fe81b 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -25,6 +25,9 @@
 #define ARM_SPE_SVE_PARTIAL_PRED	BIT(EV_PARTIAL_PREDICATE)
 #define ARM_SPE_SVE_EMPTY_PRED		BIT(EV_EMPTY_PREDICATE)
 #define ARM_SPE_IN_TXN			BIT(EV_TRANSACTIONAL)
+#define ARM_SPE_L2D_ACCESS		BIT(EV_L2D_ACCESS)
+#define ARM_SPE_L2D_MISS		BIT(EV_L2D_MISS)
+#define ARM_SPE_RECENTLY_FETCH		BIT(EV_RECENTLY_FETCHED)
 
 enum arm_spe_op_type {
 	/* First level operation type */
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 8f18af7336db53b00b450eb4299feee350d0ecb9..2ab38d21d52f73617451a6a79f9d5ae931a34f49 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -842,6 +842,12 @@ static void arm_spe__synth_ld_memory_level(const struct arm_spe_record *record,
 	if (arm_spe_is_cache_hit(record->type, L1D)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
+	} else if (record->type & ARM_SPE_RECENTLY_FETCH) {
+		data_src->mem_lvl = PERF_MEM_LVL_LFB | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_LFB;
+	} else if (arm_spe_is_cache_hit(record->type, L2D)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
 	} else if (arm_spe_is_cache_hit(record->type, LLC)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
@@ -853,6 +859,9 @@ static void arm_spe__synth_ld_memory_level(const struct arm_spe_record *record,
 	} else if (arm_spe_is_cache_miss(record->type, LLC)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_MISS;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
+	} else if (arm_spe_is_cache_miss(record->type, L2D)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_MISS;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
 	} else if (arm_spe_is_cache_miss(record->type, L1D)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_MISS;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
@@ -868,6 +877,11 @@ static void arm_spe__synth_st_memory_level(const struct arm_spe_record *record,
 		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, LLC) ?
 				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
+	} else if (arm_spe_is_cache_level(record->type, L2D)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L2;
+		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, L2D) ?
+				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
 	} else if (arm_spe_is_cache_level(record->type, L1D)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L1;
 		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, L1D) ?

-- 
2.34.1


