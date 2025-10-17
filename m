Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4B3CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NW7KYOE4J2IaxEu+E0zKPJyrxv6YO6sdwPjyR0nqBmg=; b=c0LiLDD0vpog5bJLsV4OOeQHB3
	lNaFEQ8o2ZwR8Xo5lYgSytFmhL1akzm0vSxGuQTjCZTTHrO7e5Ak0kx0j7JzmJFXKxTcPK+J7kAt9
	QDZIRhRHi0mXTOweJIwh88bcz843G3yfHyU8pe6ucllYD6NZirdA95fJkwriDpEIVO17sOiSL2Y2S
	sZtwN1XikbMdh02YAPZiwAZkIfr7vFuMezgB3vdNGeyLf5V31xXzs2QINkrOkzT/RMMwb8KevrHGx
	SclSsSG1hbjmJbUCVwOVCD5CrXsSFL25iJFV8Zz9ksz6yRXMh5UYyPHyK2MuO5Id8iCuJwETUSd9m
	usUDTatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lsn-00000008AZj-3l7V;
	Fri, 17 Oct 2025 14:56:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lsm-00000008AZ2-2P7m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA7A6643C3;
	Fri, 17 Oct 2025 14:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0934CC4CEE7;
	Fri, 17 Oct 2025 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760712999;
	bh=ieT8OusigDlh5XfTvEABKWMyRdC0NcYMvTVGU9bVJDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhtmlQXvT/6UcIDiSQ2iui3YOhXQn/7LgeFr6bPciPhlMITqSQY3dqAIymbEXKtzS
	 5SHeS6BA438LD6jfSMalPIAhMu7SgJJxCasLVBE/9WEdTQ9ihavv9DmRnfai+QMIDV
	 weuiFO5q4qCjVq8uAaIcqCjD7BASx7v24luPQto0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Leo Yan <leo.yan@linaro.org>,
	German Gomez <german.gomez@arm.com>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman.Khandual@arm.com,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	James Clark <james.clark@arm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1 013/168] perf arm-spe: Refactor arm-spe to support operation packet type
Date: Fri, 17 Oct 2025 16:51:32 +0200
Message-ID: <20251017145129.503944696@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017145129.000176255@linuxfoundation.org>
References: <20251017145129.000176255@linuxfoundation.org>
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

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: German Gomez <german.gomez@arm.com>

[ Upstream commit 0066015a3d8f9c01a17eb04579edba7dac9510af ]

Extend the decoder of Arm SPE records to support more fields from the
operation packet type.

Not all fields are being decoded by this commit. Only those needed to
support the use-case SVE load/store/other operations.

Suggested-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: German Gomez <german.gomez@arm.com>
Acked-by: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Anshuman.Khandual@arm.com
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Link: https://lore.kernel.org/r/20230320151509.1137462-2-james.clark@arm.com
Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Stable-dep-of: cb300e351505 ("perf arm_spe: Correct memory level for remote access")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../util/arm-spe-decoder/arm-spe-decoder.c    | 30 ++++++++++--
 .../util/arm-spe-decoder/arm-spe-decoder.h    | 47 +++++++++++++++----
 tools/perf/util/arm-spe.c                     |  8 ++--
 3 files changed, 67 insertions(+), 18 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 091987dd39668..709d3f6b58c68 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -186,11 +186,27 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 			decoder->record.context_id = payload;
 			break;
 		case ARM_SPE_OP_TYPE:
-			if (idx == SPE_OP_PKT_HDR_CLASS_LD_ST_ATOMIC) {
-				if (payload & 0x1)
-					decoder->record.op = ARM_SPE_ST;
+			switch (idx) {
+			case SPE_OP_PKT_HDR_CLASS_LD_ST_ATOMIC:
+				decoder->record.op |= ARM_SPE_OP_LDST;
+				if (payload & SPE_OP_PKT_ST)
+					decoder->record.op |= ARM_SPE_OP_ST;
 				else
-					decoder->record.op = ARM_SPE_LD;
+					decoder->record.op |= ARM_SPE_OP_LD;
+				if (SPE_OP_PKT_IS_LDST_SVE(payload))
+					decoder->record.op |= ARM_SPE_OP_SVE_LDST;
+				break;
+			case SPE_OP_PKT_HDR_CLASS_OTHER:
+				decoder->record.op |= ARM_SPE_OP_OTHER;
+				if (SPE_OP_PKT_IS_OTHER_SVE_OP(payload))
+					decoder->record.op |= ARM_SPE_OP_SVE_OTHER;
+				break;
+			case SPE_OP_PKT_HDR_CLASS_BR_ERET:
+				decoder->record.op |= ARM_SPE_OP_BRANCH_ERET;
+				break;
+			default:
+				pr_err("Get packet error!\n");
+				return -1;
 			}
 			break;
 		case ARM_SPE_EVENTS:
@@ -218,6 +234,12 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 			if (payload & BIT(EV_MISPRED))
 				decoder->record.type |= ARM_SPE_BRANCH_MISS;
 
+			if (payload & BIT(EV_PARTIAL_PREDICATE))
+				decoder->record.type |= ARM_SPE_SVE_PARTIAL_PRED;
+
+			if (payload & BIT(EV_EMPTY_PREDICATE))
+				decoder->record.type |= ARM_SPE_SVE_EMPTY_PRED;
+
 			break;
 		case ARM_SPE_DATA_SOURCE:
 			decoder->record.source = payload;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 46a61df1145b6..1443c28545a94 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -14,19 +14,46 @@
 #include "arm-spe-pkt-decoder.h"
 
 enum arm_spe_sample_type {
-	ARM_SPE_L1D_ACCESS	= 1 << 0,
-	ARM_SPE_L1D_MISS	= 1 << 1,
-	ARM_SPE_LLC_ACCESS	= 1 << 2,
-	ARM_SPE_LLC_MISS	= 1 << 3,
-	ARM_SPE_TLB_ACCESS	= 1 << 4,
-	ARM_SPE_TLB_MISS	= 1 << 5,
-	ARM_SPE_BRANCH_MISS	= 1 << 6,
-	ARM_SPE_REMOTE_ACCESS	= 1 << 7,
+	ARM_SPE_L1D_ACCESS		= 1 << 0,
+	ARM_SPE_L1D_MISS		= 1 << 1,
+	ARM_SPE_LLC_ACCESS		= 1 << 2,
+	ARM_SPE_LLC_MISS		= 1 << 3,
+	ARM_SPE_TLB_ACCESS		= 1 << 4,
+	ARM_SPE_TLB_MISS		= 1 << 5,
+	ARM_SPE_BRANCH_MISS		= 1 << 6,
+	ARM_SPE_REMOTE_ACCESS		= 1 << 7,
+	ARM_SPE_SVE_PARTIAL_PRED	= 1 << 8,
+	ARM_SPE_SVE_EMPTY_PRED		= 1 << 9,
 };
 
 enum arm_spe_op_type {
-	ARM_SPE_LD		= 1 << 0,
-	ARM_SPE_ST		= 1 << 1,
+	/* First level operation type */
+	ARM_SPE_OP_OTHER	= 1 << 0,
+	ARM_SPE_OP_LDST		= 1 << 1,
+	ARM_SPE_OP_BRANCH_ERET	= 1 << 2,
+
+	/* Second level operation type for OTHER */
+	ARM_SPE_OP_SVE_OTHER		= 1 << 16,
+	ARM_SPE_OP_SVE_FP		= 1 << 17,
+	ARM_SPE_OP_SVE_PRED_OTHER	= 1 << 18,
+
+	/* Second level operation type for LDST */
+	ARM_SPE_OP_LD			= 1 << 16,
+	ARM_SPE_OP_ST			= 1 << 17,
+	ARM_SPE_OP_ATOMIC		= 1 << 18,
+	ARM_SPE_OP_EXCL			= 1 << 19,
+	ARM_SPE_OP_AR			= 1 << 20,
+	ARM_SPE_OP_SIMD_FP		= 1 << 21,
+	ARM_SPE_OP_GP_REG		= 1 << 22,
+	ARM_SPE_OP_UNSPEC_REG		= 1 << 23,
+	ARM_SPE_OP_NV_SYSREG		= 1 << 24,
+	ARM_SPE_OP_SVE_LDST		= 1 << 25,
+	ARM_SPE_OP_SVE_PRED_LDST	= 1 << 26,
+	ARM_SPE_OP_SVE_SG		= 1 << 27,
+
+	/* Second level operation type for BRANCH_ERET */
+	ARM_SPE_OP_BR_COND	= 1 << 16,
+	ARM_SPE_OP_BR_INDIRECT	= 1 << 17,
 };
 
 enum arm_spe_neoverse_data_source {
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 98e3c3fce05a2..9f0c4565bc5be 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -411,7 +411,7 @@ static void arm_spe__synth_data_source_neoverse(const struct arm_spe_record *rec
 	 * We have no data on the hit level or data source for stores in the
 	 * Neoverse SPE records.
 	 */
-	if (record->op & ARM_SPE_ST) {
+	if (record->op & ARM_SPE_OP_ST) {
 		data_src->mem_lvl = PERF_MEM_LVL_NA;
 		data_src->mem_lvl_num = PERF_MEM_LVLNUM_NA;
 		data_src->mem_snoop = PERF_MEM_SNOOP_NA;
@@ -497,12 +497,12 @@ static void arm_spe__synth_data_source_generic(const struct arm_spe_record *reco
 
 static u64 arm_spe__synth_data_source(const struct arm_spe_record *record, u64 midr)
 {
-	union perf_mem_data_src	data_src = { 0 };
+	union perf_mem_data_src	data_src = { .mem_op = PERF_MEM_OP_NA };
 	bool is_neoverse = is_midr_in_range_list(midr, neoverse_spe);
 
-	if (record->op == ARM_SPE_LD)
+	if (record->op & ARM_SPE_OP_LD)
 		data_src.mem_op = PERF_MEM_OP_LOAD;
-	else if (record->op == ARM_SPE_ST)
+	else if (record->op & ARM_SPE_OP_ST)
 		data_src.mem_op = PERF_MEM_OP_STORE;
 	else
 		return 0;
-- 
2.51.0




