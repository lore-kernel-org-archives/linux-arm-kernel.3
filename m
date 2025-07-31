Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19586C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8Hm21Ve0j9cuqIhNjnSBIePed0RBmPTHK3Yu5UkVX4=; b=bronx2oC6GbCw9uHZRucSk3wvl
	QiCVy0oGAE0+8WEi0kbO9Gxh9FZ3bAi0SLTQy2Vw6XRAUgwH+QWHqXPKe6fjT5KVtrToBUDEWuV0y
	oGGBbmwkMEwLqACozoYiLPDD8tHdqHoe2Dci32N3Lsp+QLtXF15x0ovG24kP38COIc5e1TK7spXQ9
	FgE+Pvn02fXvrFekKw3878TfS7J8IR7b40Q/KBHfFW4i4zwr/rV19V5GwkeSMmMpDSSe7xMhqjyXj
	RN0Ke61Ct9grQtH+VbRVJHNz75+OZZY4+DnICSNcU/W1DR0lHmM/6P8BmLuoxh11jcmelQ8NvB1yi
	yQuo/f9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTqk-00000003led-1i91;
	Thu, 31 Jul 2025 14:01:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTJi-00000003gtt-0izy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:27:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C21B92C41;
	Thu, 31 Jul 2025 06:27:21 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C03243F66E;
	Thu, 31 Jul 2025 06:27:27 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 31 Jul 2025 14:25:46 +0100
Subject: [PATCH v4 11/15] perf arm_spe: Fill memory levels for FEAT_SPEv1p4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-11-58e5677a412b@arm.com>
References: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
In-Reply-To: <20250731-arm_spe_support_hitm_overhead_v1_public-v4-0-58e5677a412b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753968422; l=3747;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uhiFWn8YboD7ejikQthjlkwnVhMZqZ84NW+08jqHUX4=;
 b=QHXXyTgRdVh/Mg13FHUuLPUyXSixyLnBIXBMSRmHqDRnzthwPqe/g9msQPJ+ubTLh0x/6bvPF
 3kucUb4mb+xBljXOcDPMtD33qu1uXa6U6WSg1DH8X0oz8L8HAJ0Ql6l
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_062730_305682_AC2054C6 
X-CRM114-Status: GOOD (  11.37  )
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

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h |  3 +++
 tools/perf/util/arm-spe.c                         | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 03da55453da8fd2e7b9e2dcba3ddcf5243599e1c..3afa8703b21db9d231eef93fe981e0c20d562e83 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -25,6 +25,9 @@
 #define ARM_SPE_SVE_PARTIAL_PRED	BIT(EV_PARTIAL_PREDICATE)
 #define ARM_SPE_SVE_EMPTY_PRED		BIT(EV_EMPTY_PREDICATE)
 #define ARM_SPE_IN_TXN			BIT(EV_TRANSACTIONAL)
+#define ARM_SPE_L2D_ACCESS		BIT(EV_L2D_ACCESS)
+#define ARM_SPE_L2D_MISS		BIT(EV_L2D_MISS)
+#define ARM_SPE_RECENTLY_FETCHED	BIT(EV_RECENTLY_FETCHED)
 
 enum arm_spe_op_type {
 	/* First level operation type */
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 635e87e10a38c27127091c244d3ec145d43d7aa7..db681dd2aed205655e77f3dfcd7eb3c33f20277a 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -844,6 +844,12 @@ static void arm_spe__synth_ld_memory_level(const struct arm_spe_record *record,
 	if (arm_spe_is_cache_hit(record->type, L1D)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_HIT;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
+	} else if (record->type & ARM_SPE_RECENTLY_FETCHED) {
+		data_src->mem_lvl = PERF_MEM_LVL_LFB | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_LFB;
+	} else if (arm_spe_is_cache_hit(record->type, L2D)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
 	} else if (arm_spe_is_cache_hit(record->type, LLC)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_HIT;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
@@ -855,6 +861,9 @@ static void arm_spe__synth_ld_memory_level(const struct arm_spe_record *record,
 	} else if (arm_spe_is_cache_miss(record->type, LLC)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L3 | PERF_MEM_LVL_MISS;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
+	} else if (arm_spe_is_cache_miss(record->type, L2D)) {
+		data_src->mem_lvl = PERF_MEM_LVL_L2 | PERF_MEM_LVL_MISS;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L2;
 	} else if (arm_spe_is_cache_miss(record->type, L1D)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L1 | PERF_MEM_LVL_MISS;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
@@ -870,6 +879,11 @@ static void arm_spe__synth_st_memory_level(const struct arm_spe_record *record,
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


