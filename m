Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C314CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5yhaQQqEAJ8aJBfq/WmeUW13fU1vGPmi2DaVKj5QXE=; b=JVWGkhV69B3/1sm/k6tEG9guo+
	bS5KqfCEQByjO3CLcfCHZiNMsHZJG6M40LgS4N17GeFaK2ytYbzLECqcYI0A9gXMdmrjbdJcLCjhd
	nio5kz515OR+TnVobQSd5agnDDvjAkqrhPKBTdBxKj45LEQwk/MY+FpmEo7w3QPNYbKWrY01GSMV2
	ArOASfPpbbx5TCYa5koc4xOW3TDlCEYw+rl3TFa14CLci8+0Eg0QuJBsqaA6rBS6INU6NZD02yqWy
	vneOG/CDU0j1qh7az6QYuAwIyuFDwAEMBtO7Kd4NZJFhYrY2MUL9z3QRrt4q3pa5SK+s3DZDrN8vN
	5qupufrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gth-00000002zuU-3U5n;
	Mon, 29 Sep 2025 16:38:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gt6-00000002zPQ-3nOV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AB3E1758;
	Mon, 29 Sep 2025 09:37:59 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A59773F66E;
	Mon, 29 Sep 2025 09:38:05 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:44 +0100
Subject: [PATCH 08/25] perf arm_spe: Consolidate operation types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-8-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=2552;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=4fmSaYM1PKsL+dCQbsXwRV5P+jrbcuNm7iLSefb7jjk=;
 b=DaZCp44K50FFnXqT4B8B7gR0EoM8UXb854aZbXFFj/NFbidxZ2amSnnEVxpyfpZ7bZTLIp8nn
 sbx9Hctsl7pB/P5TW/PzifejpKldSwBTnG7Mzo5N7/Lx4R01ZmjxNel
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093809_088360_67D28758 
X-CRM114-Status: UNSURE (   8.51  )
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

(a) The second-level types for memory and SIMD operations are classified
    by modules. E.g., an operation may relate to general register,
    SIMD/FP, SVE, etc.

(b) The associated information tells details. E.g., an operation is
    load or store, whether it is atomic operation, etc.

Start the enum items for the second-level types from 8 to accommodate
more entries within a 32-bit integer.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 1259cbadfdc8098019afcd4cf65e733475310392..8156aa04f82e59ce345fb44223d3d22ecbc149a7 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -37,28 +37,28 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_LDST		= 1 << 1,
 	ARM_SPE_OP_BRANCH_ERET	= 1 << 2,
 
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
+	/* Second level operation type for memory / SIMD */
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
 
 	/* Second level operation type for BRANCH_ERET */
-	ARM_SPE_OP_BR_COND		= 1 << 16,
-	ARM_SPE_OP_BR_INDIRECT		= 1 << 17,
-	ARM_SPE_OP_BR_GCS		= 1 << 18,
-	ARM_SPE_OP_BR_CR_BL		= 1 << 19,
-	ARM_SPE_OP_BR_CR_RET		= 1 << 20,
-	ARM_SPE_OP_BR_CR_NON_BL_RET	= 1 << 21,
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


