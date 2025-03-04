Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA619C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE6Mu3XOJE/PxSbWz/HzcyjF3qEICyzJgiWkgnl5vtw=; b=YVkTq5CO4vjwlC0L5BHVcyyY2N
	jN10/6RJbIay/5OU74+dOQJijmamIHndBCyeDkAIIfnE3nJpi6Wne4Vy5xh/tASJqmr7UaHMwtL7T
	udTfQLu4DSRsHzH2f/5OTNf1hWg4eS6+gNH+8wCtn3shavqbMlhG6n+RoRVh/3t/XGSNw8Ny8Ojhd
	5Pz4UgnHhFv9FZjTrufeVqdCHprdP80GKLjCTJk28wQ1C6HZKjZYAhsh/3VNX1c6Yd9mRq51AOTuu
	N/e8I0EDGVnAALYPs3DILZP5EFuTRHB5WhteMgX3fEF6YMfpiYwOR29xc/cQGp2okfDPlJrPLSUEY
	ZufmXmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5Q-00000004Xg5-1kcx;
	Tue, 04 Mar 2025 12:09:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQCx-00000004M0f-48uq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:13:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16B3DFEC;
	Tue,  4 Mar 2025 03:13:21 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B72E3F5A1;
	Tue,  4 Mar 2025 03:13:04 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>,
	Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 07/12] perf arm-spe: Extend branch operations
Date: Tue,  4 Mar 2025 11:12:35 +0000
Message-Id: <20250304111240.3378214-8-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304111240.3378214-1-leo.yan@arm.com>
References: <20250304111240.3378214-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031308_159277_B7C34558 
X-CRM114-Status: GOOD (  11.53  )
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

In Arm ARM (ARM DDI 0487, L.a), the section "D18.2.7 Operation Type
packet", the branch subclass is extended for Call Return (CR), Guarded
control stack data access (GCS).

This commit adds support CR and GCS operations.  The IND (indirect)
operation is defined only in bit [1], its macro is updated accordingly.

Move the COND (Conditional) macro into the same group with other
operations for better maintenance.

Reviewed-by: Ian Rogers <irogers@google.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c  | 12 +++++++++---
 .../perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h  | 11 ++++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 4cef10a83962..625834da7e20 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -397,10 +397,16 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
 
 		if (payload & SPE_OP_PKT_COND)
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " COND");
-
-		if (SPE_OP_PKT_IS_INDIRECT_BRANCH(payload))
+		if (payload & SPE_OP_PKT_INDIRECT_BRANCH)
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " IND");
-
+		if (payload & SPE_OP_PKT_GCS)
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, " GCS");
+		if (SPE_OP_PKT_CR_BL(payload))
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, " CR-BL");
+		if (SPE_OP_PKT_CR_RET(payload))
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, " CR-RET");
+		if (SPE_OP_PKT_CR_NON_BL_RET(payload))
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, " CR-NON-BL-RET");
 		break;
 	default:
 		/* Unknown index */
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index 464a912b221c..32d760ede701 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -7,6 +7,7 @@
 #ifndef INCLUDE__ARM_SPE_PKT_DECODER_H__
 #define INCLUDE__ARM_SPE_PKT_DECODER_H__
 
+#include <linux/bitfield.h>
 #include <stddef.h>
 #include <stdint.h>
 
@@ -116,8 +117,6 @@ enum arm_spe_events {
 
 #define SPE_OP_PKT_IS_OTHER_SVE_OP(v)		(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
 
-#define SPE_OP_PKT_COND				BIT(0)
-
 #define SPE_OP_PKT_LDST_SUBCLASS_GET(v)		((v) & GENMASK_ULL(7, 1))
 #define SPE_OP_PKT_LDST_SUBCLASS_GP_REG		0x0
 #define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP	0x4
@@ -148,7 +147,13 @@ enum arm_spe_events {
 #define SPE_OP_PKT_SVE_PRED			BIT(2)
 #define SPE_OP_PKT_SVE_FP			BIT(1)
 
-#define SPE_OP_PKT_IS_INDIRECT_BRANCH(v)	(((v) & GENMASK_ULL(7, 1)) == 0x2)
+#define SPE_OP_PKT_CR_MASK			GENMASK_ULL(4, 3)
+#define SPE_OP_PKT_CR_BL(v)			(FIELD_GET(SPE_OP_PKT_CR_MASK, (v)) == 1)
+#define SPE_OP_PKT_CR_RET(v)			(FIELD_GET(SPE_OP_PKT_CR_MASK, (v)) == 2)
+#define SPE_OP_PKT_CR_NON_BL_RET(v)		(FIELD_GET(SPE_OP_PKT_CR_MASK, (v)) == 3)
+#define SPE_OP_PKT_GCS				BIT(2)
+#define SPE_OP_PKT_INDIRECT_BRANCH		BIT(1)
+#define SPE_OP_PKT_COND				BIT(0)
 
 const char *arm_spe_pkt_name(enum arm_spe_pkt_type);
 
-- 
2.34.1


