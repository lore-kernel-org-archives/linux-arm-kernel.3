Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24D4C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6GbWhsav7NoquWg3KmsmwkYAaFNgF7RkcT8OHBV+no=; b=I41s29KbHXY98EvC9zid3rTLDn
	3eHtXchM4yYsDXQnUB8eXBtuJoN/+mjsXccUIrSOm7ZACS6oqgim9Et+LfHEdkKZf8lEKjdQkvNu7
	TeXzhC267p/xRKer9N0vPeQKNn7YZxFGN+EgLEkIvdRVGxOL9h0MiQCsxysjd2nuF1BWpF2tV8mWb
	fPGyFlTUkzCK61Axb5XuxsWcL6I+VYhdJhdarUnoSriJEFj6F1MIJFpnboO7FRZQmRnaJCmehHfDr
	iEtueSKQwtBrJqbOx5VnIKfd6tY6zLiPcuYHmQqAQY3IfrBWzElQbGPTpZ/fScTAWZ1swYv0LJAh8
	Cb8QY3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmPI-00000002dYL-32rN;
	Mon, 07 Jul 2025 14:01:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm4o-00000002Zx9-0nKK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:40:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 598BE168F;
	Mon,  7 Jul 2025 06:39:57 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9343F6A8;
	Mon,  7 Jul 2025 06:40:07 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 07 Jul 2025 14:39:30 +0100
Subject: [PATCH v3 08/14] perf arm_spe: Refine memory level filling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-8-33ea82da3280@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751895589; l=2481;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=GQnOoKfHsL2ava217EKiLCsHp3t3ONrCYY2oR9EO2Bw=;
 b=MfOMcG7EP09OtFPQ+EGbjvSq1M4yWpwEueKp1eRwZZkTVao/7iAWUnwSDv1JzSkhjjgndFbB5
 xRICNwx6M1yBrBWIgj6rV2yPYvHYzQoqYwG6s2VKzzCTy5tsaCsNP9B
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_064010_361508_9EFB851B 
X-CRM114-Status: GOOD (  12.80  )
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

This commit introduces macros for detecting cache level and cache miss.

Populates the 'mem_lvl_num' field which is a later added attribute for
representing memory level. Set NA ("not available") to memory levels if
memory hierarchy info is absent.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index ec6a81a497c54d2418b885008685f0f74e00500e..eddd554c49bcd873f6095bb262090786b1db5355 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -39,6 +39,15 @@
 
 #define is_ldst_op(op)		(!!((op) & ARM_SPE_OP_LDST))
 
+#define ARM_SPE_CACHE_EVENT(lvl) \
+	(ARM_SPE_##lvl##_ACCESS | ARM_SPE_##lvl##_MISS)
+
+#define arm_spe_is_cache_level(type, lvl) \
+	((type) & ARM_SPE_CACHE_EVENT(lvl))
+
+#define arm_spe_is_cache_miss(type, lvl) \
+	((type) & ARM_SPE_##lvl##_MISS)
+
 struct arm_spe {
 	struct auxtrace			auxtrace;
 	struct auxtrace_queues		queues;
@@ -824,20 +833,21 @@ static const struct data_source_handle data_source_handles[] = {
 static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
 					union perf_mem_data_src *data_src)
 {
-	if (record->type & (ARM_SPE_LLC_ACCESS | ARM_SPE_LLC_MISS)) {
+	if (arm_spe_is_cache_level(record->type, LLC)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L3;
-
-		if (record->type & ARM_SPE_LLC_MISS)
-			data_src->mem_lvl |= PERF_MEM_LVL_MISS;
-		else
-			data_src->mem_lvl |= PERF_MEM_LVL_HIT;
-	} else if (record->type & (ARM_SPE_L1D_ACCESS | ARM_SPE_L1D_MISS)) {
+		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, LLC) ?
+				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
+	} else if (arm_spe_is_cache_level(record->type, L1D)) {
 		data_src->mem_lvl = PERF_MEM_LVL_L1;
+		data_src->mem_lvl |= arm_spe_is_cache_miss(record->type, L1D) ?
+				     PERF_MEM_LVL_MISS : PERF_MEM_LVL_HIT;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L1;
+	}
 
-		if (record->type & ARM_SPE_L1D_MISS)
-			data_src->mem_lvl |= PERF_MEM_LVL_MISS;
-		else
-			data_src->mem_lvl |= PERF_MEM_LVL_HIT;
+	if (!data_src->mem_lvl) {
+		data_src->mem_lvl = PERF_MEM_LVL_NA;
+		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
 	}
 
 	if (record->type & ARM_SPE_REMOTE_ACCESS)

-- 
2.34.1


