Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BD2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SthZuMYqzgxFbuz/PH580asC5x4xlzHqbNRrxIN/bO0=; b=JQo11DwC49scHt79nKx5WtS6xi
	Js5ufBm704Sw3I7+3sRMFNkM2ye+MoW/eskJtrAWr4PuMS7Ktq5xwVGEfyR4xRX5vnHkujKLz0GLN
	518xpgPMgxxkY9DmCkoaFOmvkOqZE/oQ+Tp+zLtBz+PPlEMeVI//QlEt9hBsHQSI4hooarQWdMU8T
	lSysr6UzhJ1P5hDk8Ptm3V/uVoZKO4lJ9YLxO0sG4WZyPnpGkGYWKc+QwjkHxwirkO6TJcHO1cuMf
	b5ZaV8D7koQopWsF6MelaJLxif+NnQ4FW8AoEtcVtC33LwUPsXu9GQriVD915dUAqkdNtGfkzaGaK
	efMZQsHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeTd-00000003C9a-28oe;
	Wed, 05 Feb 2025 12:25:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeKR-00000003A0N-3eoL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:16:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04E9B1007;
	Wed,  5 Feb 2025 04:16:50 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F12123F63F;
	Wed,  5 Feb 2025 04:16:23 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Graham Woodward <graham.woodward@arm.com>
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 06/11] perf arm-spe: Extend branch operations
Date: Wed,  5 Feb 2025 12:15:50 +0000
Message-Id: <20250205121555.180606-7-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205121555.180606-1-leo.yan@arm.com>
References: <20250205121555.180606-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_041628_012593_68EE4B38 
X-CRM114-Status: GOOD (  11.54  )
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


