Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C242BC83036
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVFWdcxoZFXAqbfvjhH9FmRdRKnU9M1g333pPp3VvMU=; b=tscd4YM6z/vPk/5vlI1YwTremD
	TDcJFMJaA0ckQZV763nuKaGmq4hN8/5moDaRD6uvZvFtepIUEUQkzEePCbk/juNEDiofwHIhOgOVk
	KvFhnOjC2zcAWXxP2AToqctf7ZjkPGrWEV/vy8dHMvl+ZDy9qXjFb00IwB9mRwAtdg6lT29YQfYs2
	rDKKXruq1TlIc2dK8xhFHlb37U/8m4M+32rT3JUuoFvdKQ1z3aJOCELiTXvKWfUzS3NtAydBUIhYz
	UoHY3/kgHRDMYAYem9eSsPzRokp3tDbKeGjurvrMRiIh2risr2DhDZ2yhJ1+VwxhPXwsuK12aVFdS
	Qc9B/bBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHAQ-00000002rKV-26oz;
	Mon, 30 Jun 2025 16:15:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGMx-00000002k5F-0OLs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 15:24:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC25A1D34;
	Mon, 30 Jun 2025 08:24:14 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7543F6A8;
	Mon, 30 Jun 2025 08:24:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 30 Jun 2025 16:23:41 +0100
Subject: [PATCH v2 09/13] perf arm_spe: Separate setting of memory levels
 for loads and stores
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-9-2e1afab313b9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751297044; l=3566;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=XqqUZP7LTMl9UHCkLOBhIsiFA5xAVL26fIWUhaF2lXk=;
 b=BHfW7bp85nkxBsHwBZNQSsD8tTt4+RYCDzuJhx/zpsMx2d48nMNW+zV5umW/vitK+Juw0KNKi
 H4F37apjqHUAJHl58eyDiWQQkh9l1aZxxx+3tY5GgnLUI29yuvEUhly
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_082431_214465_3A2F0289 
X-CRM114-Status: GOOD (  15.59  )
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

For a load hit, the lowest-level cache reflects the latency of fetching
a data. Otherwise, the highest-level cache involved in refilling
indicates the overhead caused by a load.

Store operations remain unchanged to keep the descending order when
iterating through cache levels.

Split into two functions: one is for setting memory levels for loads and
another for stores.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index eddd554c49bcd873f6095bb262090786b1db5355..688f6cd0f739e2b5f23a7776a7f2ebc97c12a2dd 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -45,6 +45,9 @@
 #define arm_spe_is_cache_level(type, lvl) \
 	((type) & ARM_SPE_CACHE_EVENT(lvl))
 
+#define arm_spe_is_cache_hit(type, lvl) \
+	(((type) & ARM_SPE_CACHE_EVENT(lvl)) == ARM_SPE_##lvl##_ACCESS)
+
 #define arm_spe_is_cache_miss(type, lvl) \
 	((type) & ARM_SPE_##lvl##_MISS)
 
@@ -830,9 +833,38 @@ static const struct data_source_handle data_source_handles[] = {
 	DS(hisi_hip_ds_encoding_cpus, data_source_hisi_hip),
 };
 
-static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
-					union perf_mem_data_src *data_src)
+static void arm_spe__synth_ld_memory_level(const struct arm_spe_record *record,
+					   union perf_mem_data_src *data_src)
+{
+	/*
+	 * To find a cache hit, search in ascending order from the lower level
+	 * caches to the higher level caches. This reflects the best scenario
+	 * for a cache hit.
+	 */
+	if (arm_spe_is_cache_hit(record->type, L1D)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
+	} else if (arm_spe_is_cache_hit(record->type, LLC)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
+	/*
+	 * To find a cache miss, search in descending order from the higher
+	 * level cache to the lower level cache. This represents the worst
+	 * scenario for a cache miss.
+	 */
+	} else if (arm_spe_is_cache_miss(record->type, LLC)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_MISS;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
+	} else if (arm_spe_is_cache_miss(record->type, L1D)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_MISS;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
+	}
+}
+
+static void arm_spe__synth_st_memory_level(const struct arm_spe_record *record,
+					   union perf_mem_data_src *data_src)
 {
+	/* Record the greatest level info for a store operation. */
 	if (arm_spe_is_cache_level(record->type, LLC)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L3;
 		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, LLC) ?
@@ -844,6 +876,15 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
 				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
 	}
+}
+
+static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
+					union perf_mem_data_src *data_src)
+{
+	if (data_src->mem_op == PERF_MEM_OP_LOAD)
+		arm_spe__synth_ld_memory_level(record, data_src);
+	if (data_src->mem_op == PERF_MEM_OP_STORE)
+		arm_spe__synth_st_memory_level(record, data_src);
 
 	if (!data_src->mem_lvl) {
 		data_src->mem_lvl = PERF_MEM_LVL_NA;

-- 
2.34.1


