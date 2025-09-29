Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F04CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+mJV4X1KHCyhMGYnPGwJvhfOaSBSGSS0g0FrmlQ1dQ=; b=XlD96XvGSp1zc5kplcWXE0QG8m
	pWSKA2MWa1pT8Nbg3EMOXGGVOHrD6zGUCIed3gEfZ5UaVCfVhGJylcrGhmmekxyJPD+BSbnKQQ0Yd
	r/3MVFNEcT/SR0S48NxtZ26sqa/A5MnT1oF18AvhTIqJc53PsGdytZjiTuQhaDqbu8BDoqKdtHYf4
	JeYS2ela51ciiBXn28+FCWrhBiB+GSIloQE1CKIeiuewXcfPh3C1KGH/11UM0TxQCn9oiyz+XvFiD
	E8CRFUwf+Ef0kiy2HByCLTET+32ZGa4CWLXnifA9BesM+moTIWLMYI7gXFipObGEhEz720dvZjAXj
	DD628q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtl-00000002zzW-1CeL;
	Mon, 29 Sep 2025 16:38:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtI-00000002zep-468m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 353E3150C;
	Mon, 29 Sep 2025 09:38:12 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D01CC3F66E;
	Mon, 29 Sep 2025 09:38:18 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:52 +0100
Subject: [PATCH 16/25] perf arm_spe: Expose SIMD information in other
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-16-1150b3c83857@arm.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=2851;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Y3L/VF392QVL9CtDTEmkUKeUviRM6ntIKs+hRMb7LcU=;
 b=0GCLgKg5pWYkSo2WO9eu4QGlur6KItjUaMu4WgJjuWLBZw0rx4khjvkuOdAuQYDMZqHLl2Syp
 YpxepF/6EdWAPNS6OXtq+5EaLYpZjNI16trIu40JdL0Y0MIR+E1ajSl
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093821_210634_806631EF 
X-CRM114-Status: GOOD (  12.11  )
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

The other operations contain SME data processing, ASE (Advanced SIMD)
and floating-point operations. Expose these info in the records.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 18 +++++++++++++++++-
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h |  4 ++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 649471abef6a4386e1b250a19cda4f4caeb0a2ff..9e02b2bdd1177193996d071dd88f969e25b1ad86 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -237,8 +237,24 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 				break;
 			case SPE_OP_PKT_HDR_CLASS_OTHER:
 				decoder->record.op |= ARM_SPE_OP_OTHER;
-				if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload))
+				if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SVE | ARM_SPE_OP_DP;
+					if (payload & SPE_OP_PKT_OTHER_FP)
+						decoder->record.op |= ARM_SPE_OP_FP;
+					if (payload & SPE_OP_PKT_SVE_PRED)
+						decoder->record.op |= ARM_SPE_OP_PRED;
+				} else if (SPE_OP_PKT_OTHER_SUBCLASS_SME(payload)) {
+					decoder->record.op |= ARM_SPE_OP_SME;
+					if (payload & SPE_OP_PKT_OTHER_FP)
+						decoder->record.op |= ARM_SPE_OP_FP;
+				} else if (SPE_OP_PKT_OTHER_SUBCLASS_OTHER(payload)) {
+					if (payload & SPE_OP_PKT_OTHER_ASE)
+						decoder->record.op |= ARM_SPE_OP_ASE;
+					if (payload & SPE_OP_PKT_OTHER_FP)
+						decoder->record.op |= ARM_SPE_OP_FP;
+					if (payload & SPE_OP_PKT_COND)
+						decoder->record.op |= ARM_SPE_OP_COND;
+				}
 				break;
 			case SPE_OP_PKT_HDR_CLASS_BR_ERET:
 				decoder->record.op |= ARM_SPE_OP_BRANCH_ERET;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 40d734f284eb8d742de9c53e55a9a541d6d462b2..d4574268cf793efe154f252b3e2af9c721bada97 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -47,6 +47,8 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_MEMSET		= 1 << 14,
 	ARM_SPE_OP_GCS			= 1 << 15,
 	ARM_SPE_OP_SVE			= 1 << 16,
+	ARM_SPE_OP_SME			= 1 << 17,
+	ARM_SPE_OP_ASE			= 1 << 18,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,
@@ -58,6 +60,8 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_PRED			= 1 << 26,	/* Predicated */
 	ARM_SPE_OP_SG			= 1 << 27,	/* Gather/Scatter */
 	ARM_SPE_OP_COMM			= 1 << 28,	/* Common */
+	ARM_SPE_OP_FP			= 1 << 29,	/* Floating-point */
+	ARM_SPE_OP_COND			= 1 << 30,	/* Conditional */
 
 	/* Second level operation type for BRANCH_ERET */
 	ARM_SPE_OP_BR_COND		= 1 << 8,

-- 
2.34.1


