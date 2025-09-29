Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F105CCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MngMUwzZUKSl/oa2Yc+oUZ0gcbg7uEo0jmQbvLImupk=; b=NFYmGE0QTDoOfqjItQHdOI/lAn
	L2ccYnwAjL1ee0UzQsn30q2Be5d8Vya/17/mRcBwbntlMEqbWtLkh6VD9OEqDB+6ZNmz4c6e99w06
	pSKqoSPe8B3SOtDoUlBJkjrb8rkd3nAvuscFFRCfvZ8clb6Z900Gl6E9A71hb3Z/o53+yeHJprVsj
	RG1al6QFNodc63ROp8bsYDbzWLIsXxQwYQGZ+DFwYXVtLKkGuL6hEL/EPihG8+80Us/OANK5xaORP
	p/m8YqjbGH04FOsvZyr8R5+Ab62w5NOxmh/BCHj29Dgbp3leChJ0gmCrhyHn5JM80wFdczhoOgqef
	S+O06zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gti-00000002zuq-0WBW;
	Mon, 29 Sep 2025 16:38:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gt7-00000002zPo-0wxD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C341CC4;
	Mon, 29 Sep 2025 09:38:00 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FCB13F66E;
	Mon, 29 Sep 2025 09:38:07 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:45 +0100
Subject: [PATCH 09/25] perf arm_spe: Introduce data processing macro for
 SVE operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-9-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=3177;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BDvNWzvAemz4zeXitbhL3OSHHvaF961tMe2hrc+3uqY=;
 b=OngcnRo3BtVkZ4ZjfIHnCd7sfuUZ0WNuzwY2YwTo1D0L2YE+JRpOI4p9Wxyqun0+L6jKszTV1
 YRqR4sHU/sjBq+C723p3up1fcrILP4i9wA7C8GY0+o5GwWBY/6Qjihl
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093809_424664_A8385543 
X-CRM114-Status: GOOD (  12.23  )
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
index 8156aa04f82e59ce345fb44223d3d22ecbc149a7..08ef83cb8bf00be75459c78b9ee8a6cbf1971986 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -42,8 +42,7 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_UNSPEC_REG		= 1 << 9,
 	ARM_SPE_OP_NV_SYSREG		= 1 << 10,
 	ARM_SPE_OP_SIMD_FP		= 1 << 11,
-	ARM_SPE_OP_SVE_OTHER		= 1 << 12,
-	ARM_SPE_OP_SVE_LDST		= 1 << 13,
+	ARM_SPE_OP_SVE			= 1 << 12,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,
@@ -51,6 +50,7 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_ATOMIC		= 1 << 22,
 	ARM_SPE_OP_EXCL			= 1 << 23,
 	ARM_SPE_OP_AR			= 1 << 24,
+	ARM_SPE_OP_DP			= 1 << 25,	/* Data processing */
 
 	/* Second level operation type for BRANCH_ERET */
 	ARM_SPE_OP_BR_COND		= 1 << 8,
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 71be979f507718caadc091714c40bcee073c1d60..88f24a8626861393defc89540e4126a124479699 100644
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


