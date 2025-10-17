Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2428CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wN/GYo8Lsgvb3qMqmkz0ahgJSSrDIna51lxh/cdQMc8=; b=MhQRu5Xb6fEff2j3x+kqFxnkQ5
	KtESbNt0Dr8ZasC465wN8VKPUFsIUbsN9jEx4EPHP1j4LfqyiaunauyAsWpg+Wwm3wATzWpMUr2sZ
	VwbLUodlrsKjgd67MsHEueDbh+c7V1YYPQoQPuU3atRuOBl1i39D9hCGSOkcGUtkEaZsokCMd08ZE
	NbUcGOkDCRxGcJcCF+ttWPII6oc+iGDQC2JzETurIvkP5JzLAgY9q5DOeRcDXBk/L/BFWu6I70q7y
	3Bs1tTF3G0ARefTQ2k0c8UfCeo+/P8HOtz/ecJIwzihJEIY5dGOC1QjKTJy/HyqnjL9yhJ2QULvrH
	eKT4/GYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLN-00000007QGo-1CiT;
	Fri, 17 Oct 2025 10:05:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hL5-00000007PsK-3VX1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68C301595;
	Fri, 17 Oct 2025 03:05:27 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E88BB3F59E;
	Fri, 17 Oct 2025 03:05:33 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:05 +0100
Subject: [PATCH v2 16/25] perf arm_spe: Expose SIMD information in other
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-16-2d41e4746e1b@arm.com>
References: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
In-Reply-To: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=2811;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=0Rj939NM3iG/pLeQmRL25+gYfRynCaxeME2R2V47qeU=;
 b=Lwkt+bfItWqpZRIhurBiueRZmXET+c8DqGXtURUImgnuLPxvnEj8WcRs7b3WegTfTwm482ORb
 GI8YeRmXdrnBHAvT9uuSrSVGLYLJ1bLGXTKD3Ati4Vptl8f6OXveRCm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030536_063205_4CC52B43 
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
index b838e9c6168c6b7c20bb63b8e7c9d27c35f416dc..3310e05122f02e8ef32f79f8ed3c6932cc43eecc 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -48,6 +48,8 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_MEMCPY		= 1 << 14,
 	ARM_SPE_OP_MEMSET		= 1 << 15,
 	ARM_SPE_OP_GCS			= 1 << 16,
+	ARM_SPE_OP_SME			= 1 << 17,
+	ARM_SPE_OP_ASE			= 1 << 18,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,
@@ -59,6 +61,8 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_PRED			= 1 << 26,	/* Predicated */
 	ARM_SPE_OP_SG			= 1 << 27,	/* Gather/Scatter */
 	ARM_SPE_OP_COMM			= 1 << 28,	/* Common */
+	ARM_SPE_OP_FP			= 1 << 29,	/* Floating-point */
+	ARM_SPE_OP_COND			= 1 << 30,	/* Conditional */
 };
 
 enum arm_spe_2nd_op_branch {

-- 
2.34.1


