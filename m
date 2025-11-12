Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFF6CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtOND+vyBjEfoFrskKgUrSjlzfpWGa9ilBKPqYiAu5o=; b=VsApvtsp9yVVmpb1oOExUV2Hux
	7dfKHFldkZKc2JUITa9GX3TYU97cw2j5vHr5+lbQuM+U/UXia7gR9Hv113MWffUqFW+KGjQxZGWo+
	L4KspSzaLF4jAmuuS7OBVAgnosRrH3RUWz7uSBSKSkX+eMy+O1B3115EbIEK11WE6JcqNc/CN8DI3
	ya3L8sFqChAHq7nWC4O39SeMDDdo3cDSvPf5iDqdkpevm9oh4D8N/E8UeEGIlvQlXNTCmIP0IGweQ
	7DBRqLtfWa8bna2u4AHewPD2hwI0C6jb6KMBAzBCZ3px7reTng2YtEsm7McWG0mJKisq1jBF+pUyY
	eK/kIeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWz-00000009JhC-3Blk;
	Wed, 12 Nov 2025 18:25:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWr-00000009JYo-0avz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A4281595;
	Wed, 12 Nov 2025 10:25:05 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC1683F63F;
	Wed, 12 Nov 2025 10:25:10 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 18:24:35 +0000
Subject: [PATCH v3 09/25] perf arm_spe: Introduce data processing macro for
 SVE operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-perf_support_arm_spev1-3-v3-9-e63c9829f9d9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971891; l=3135;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=pOn+OweUnZMaNTqqQtY3ZTLc4P+MyZzHAa72JWfU/kw=;
 b=Uj09w5o4mpLmc/OH6B3x0sC437+uDPHL1CFpYDrOFCfgmY1V2Z1tLwkNnyTvjnOuJV8Q2Z7To
 xo7tTj7vSySDwbLV1PyCVLqwfRbwMschUG8I2vFXgnMo+qfp+/+/JUp
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102513_313041_9A41558C 
X-CRM114-Status: GOOD (  12.08  )
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

Introduce the ARM_SPE_OP_DP (data processing) macro as associated
information for SVE operations. For SVE register access, only
ARM_SPE_OP_SVE is set; for SVE data processing, both ARM_SPE_OP_SVE and
ARM_SPE_OP_DP are set together.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 4 ++--
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 4 ++--
 tools/perf/util/arm-spe.c                         | 5 +----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 847c29385bea8618e14b2eb21a08896041890d89..6974f594f37c9916fff591ced1e9c2d60cf84f14 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -201,12 +201,12 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 				else
 					decoder->record.op |= ARM_SPE_OP_LD;
 				if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload))
-					decoder->record.op |= ARM_SPE_OP_SVE_LDST;
+					decoder->record.op |= ARM_SPE_OP_SVE;
 				break;
 			case SPE_OP_PKT_HDR_CLASS_OTHER:
 				decoder->record.op |= ARM_SPE_OP_OTHER;
 				if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload))
-					decoder->record.op |= ARM_SPE_OP_SVE_OTHER;
+					decoder->record.op |= ARM_SPE_OP_SVE | ARM_SPE_OP_DP;
 				break;
 			case SPE_OP_PKT_HDR_CLASS_BR_ERET:
 				decoder->record.op |= ARM_SPE_OP_BRANCH_ERET;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index b555e2cc1dc36f209c23b0d84378da0ee65c1ab3..acab6d11096b19b1d31a553c83cba9732ecf5ddb 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -43,8 +43,7 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_UNSPEC_REG		= 1 << 9,
 	ARM_SPE_OP_NV_SYSREG		= 1 << 10,
 	ARM_SPE_OP_SIMD_FP		= 1 << 11,
-	ARM_SPE_OP_SVE_OTHER		= 1 << 12,
-	ARM_SPE_OP_SVE_LDST		= 1 << 13,
+	ARM_SPE_OP_SVE			= 1 << 12,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,
@@ -52,6 +51,7 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_ATOMIC		= 1 << 22,
 	ARM_SPE_OP_EXCL			= 1 << 23,
 	ARM_SPE_OP_AR			= 1 << 24,
+	ARM_SPE_OP_DP			= 1 << 25,	/* Data processing */
 };
 
 enum arm_spe_2nd_op_branch {
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 614ce032f87e46d1f3754258f51bb1693ec128b7..881257d3958705e725f1b7d47b41a93defd231ea 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -346,10 +346,7 @@ static struct simd_flags arm_spe__synth_simd_flags(const struct arm_spe_record *
 {
 	struct simd_flags simd_flags = {};
 
-	if ((record->op & ARM_SPE_OP_LDST) && (record->op & ARM_SPE_OP_SVE_LDST))
-		simd_flags.arch |= SIMD_OP_FLAGS_ARCH_SVE;
-
-	if ((record->op & ARM_SPE_OP_OTHER) && (record->op & ARM_SPE_OP_SVE_OTHER))
+	if (record->op & ARM_SPE_OP_SVE)
 		simd_flags.arch |= SIMD_OP_FLAGS_ARCH_SVE;
 
 	if (record->type & ARM_SPE_SVE_PARTIAL_PRED)

-- 
2.34.1


