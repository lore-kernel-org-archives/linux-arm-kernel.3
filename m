Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE69C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbFn19kKOaMBvs2KIA6iY2LFipwOtawqNTUX6/+a1Mk=; b=1zveCLFwm5du0B15k4yORWvXbY
	+4MNXbaFTs0k2YfCSub0Ob929Qbh0CXyFJAmAezxYmIpEa/ssQ6nwvE/2UhiFeppW/7S3NZC+scBA
	Ha5iJZwoG2n5QHUDPAOqFxJj3z5q+Ow9Xv9Wx7NqVA/P2hUADx1HKlvFeZRKF10xzO6o4f6mULnmH
	s7/5U2vTKL/chfNdeRWf8BFxFec6IHDrJwN5i09PhgF5Zo0rUoV8O7PHwYGSBrBhtsaTFUvMAXGeO
	bJ1DyC7KqZE2TNX20iWHwHJLDbYBjpQGzqeeiN1ua9gU/fI93Ec0Onu6pUzg19DVYbKIseAUZ3ndd
	JIdw7Mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmTt-00000002e1C-0wVp;
	Mon, 07 Jul 2025 14:06:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm4s-00000002Zye-3IcX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:40:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6771168F;
	Mon,  7 Jul 2025 06:40:01 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 642873F6A8;
	Mon,  7 Jul 2025 06:40:12 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 07 Jul 2025 14:39:32 +0100
Subject: [PATCH v3 10/14] perf arm_spe: Fill memory levels for FEAT_SPEv1p4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-10-33ea82da3280@arm.com>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
In-Reply-To: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751895589; l=3747;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/rBTPEEjSMTKfZXh44B/N7IEPmeqGhWCK9qoF52zWCI=;
 b=lagJGbothySTZbD5b03wnwXhp+p9lxb7cu7KQR5fGI4+PAwTK5ekm669NifWCpKAtY5LfxydG
 ApcGQVvK2pFAl7Nk7IJ6tGnaqfDLm4q5LQeQ+8HOFtnGirv5YCIP+Zf
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_064014_914638_6CE212DA 
X-CRM114-Status: GOOD (  11.79  )
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
index 688f6cd0f739e2b5f23a7776a7f2ebc97c12a2dd..3715afbe1e4713b5eebb00afbcb3eaa56ff1c49c 100644
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


