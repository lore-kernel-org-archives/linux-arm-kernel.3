Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC11CD3441
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7ln0toHq/0MQOc65uIhyCoHwUIQS5KRyuTK6cMzOkY=; b=DVZgE070KRmbT1+N1oVc4Oijpk
	IsIZBmgiPatgi/JfFO0+Mnmb7q3Q+kS2BPXkFJV/R9+WtANX2LT/M9FNpE+88Iwj+OC0ht4QzGzNK
	iCmTFXWwMoaGevqgE5p/KMkuTPJQPWGic29fszSLEDbGH3F/dnCZaOpWYY3NU1SQkXq0lL0oa100H
	qmWc7aBRlnIC72q8X7UziGN01c4g4FteeKQSYujk4ukEAlsTC9rPXyQ8t8y86ltIwMLnWdoLmzipM
	N+X8H7vvi+KneJzFDQY0ENf4yA2ELE/mNx+h3hZkne4mgEMnuKbxG57bzNZHmNZLXXk3W8/xU2X57
	gxq1J9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWt-00000009JbK-1h6d;
	Wed, 12 Nov 2025 18:25:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWp-00000009JYB-2AUE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:25:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D96221515;
	Wed, 12 Nov 2025 10:25:02 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A42BC3F63F;
	Wed, 12 Nov 2025 10:25:08 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 18:24:34 +0000
Subject: [PATCH v3 08/25] perf arm_spe: Consolidate operation types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-perf_support_arm_spev1-3-v3-8-e63c9829f9d9@arm.com>
References: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
In-Reply-To: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971891; l=2655;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qKx9lN2m9B2LaNp9/BsuTsz4PMHucWRf4+sxupt4WJ8=;
 b=fgY3metDPsIJLUysLmv9P8Ko2c2ueKyZmcpqCJZwANpHcASyl8Ddv3fzJBegrpFNbfc14C+wZ
 vFEHiMJCYkDA63bMayyKDfv6c+wM/8GXcSZcYFJS9Z07qVHlMceTCLg
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102511_680113_B03BD7BF 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

Consolidate operation types in a way:

(a) Extract the second-level types into separate enums.
(b) The second-level types for memory and SIMD operations are classified
    by modules. E.g., an operation may relate to general register,
    SIMD/FP, SVE, etc.
(c) The associated information tells details. E.g., an operation is
    load or store, whether it is atomic operation, etc.

Start the enum items for the second-level types from 8 to accommodate
more entries within a 32-bit integer.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 46 ++++++++++++-----------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 1259cbadfdc8098019afcd4cf65e733475310392..b555e2cc1dc36f209c23b0d84378da0ee65c1ab3 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -36,29 +36,31 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_OTHER	= 1 << 0,
 	ARM_SPE_OP_LDST		= 1 << 1,
 	ARM_SPE_OP_BRANCH_ERET	= 1 << 2,
+};
+
+enum arm_spe_2nd_op_ldst {
+	ARM_SPE_OP_GP_REG		= 1 << 8,
+	ARM_SPE_OP_UNSPEC_REG		= 1 << 9,
+	ARM_SPE_OP_NV_SYSREG		= 1 << 10,
+	ARM_SPE_OP_SIMD_FP		= 1 << 11,
+	ARM_SPE_OP_SVE_OTHER		= 1 << 12,
+	ARM_SPE_OP_SVE_LDST		= 1 << 13,
+
+	/* Assisted information for memory / SIMD */
+	ARM_SPE_OP_LD			= 1 << 20,
+	ARM_SPE_OP_ST			= 1 << 21,
+	ARM_SPE_OP_ATOMIC		= 1 << 22,
+	ARM_SPE_OP_EXCL			= 1 << 23,
+	ARM_SPE_OP_AR			= 1 << 24,
+};
 
-	/* Second level operation type for OTHER */
-	ARM_SPE_OP_SVE_OTHER		= 1 << 16,
-
-	/* Second level operation type for LDST */
-	ARM_SPE_OP_LD			= 1 << 16,
-	ARM_SPE_OP_ST			= 1 << 17,
-	ARM_SPE_OP_ATOMIC		= 1 << 18,
-	ARM_SPE_OP_EXCL			= 1 << 19,
-	ARM_SPE_OP_AR			= 1 << 20,
-	ARM_SPE_OP_SIMD_FP		= 1 << 21,
-	ARM_SPE_OP_GP_REG		= 1 << 22,
-	ARM_SPE_OP_UNSPEC_REG		= 1 << 23,
-	ARM_SPE_OP_NV_SYSREG		= 1 << 24,
-	ARM_SPE_OP_SVE_LDST		= 1 << 25,
-
-	/* Second level operation type for BRANCH_ERET */
-	ARM_SPE_OP_BR_COND		= 1 << 16,
-	ARM_SPE_OP_BR_INDIRECT		= 1 << 17,
-	ARM_SPE_OP_BR_GCS		= 1 << 18,
-	ARM_SPE_OP_BR_CR_BL		= 1 << 19,
-	ARM_SPE_OP_BR_CR_RET		= 1 << 20,
-	ARM_SPE_OP_BR_CR_NON_BL_RET	= 1 << 21,
+enum arm_spe_2nd_op_branch {
+	ARM_SPE_OP_BR_COND		= 1 << 8,
+	ARM_SPE_OP_BR_INDIRECT		= 1 << 9,
+	ARM_SPE_OP_BR_GCS		= 1 << 10,
+	ARM_SPE_OP_BR_CR_BL		= 1 << 11,
+	ARM_SPE_OP_BR_CR_RET		= 1 << 12,
+	ARM_SPE_OP_BR_CR_NON_BL_RET	= 1 << 13,
 };
 
 enum arm_spe_common_data_source {

-- 
2.34.1


