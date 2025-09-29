Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3D5CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ma7svIBwp3Tl5z6twROb3PYfD40sAqcIj05u0PggGeY=; b=aE61tJyDf1L5cK644nct4cONXS
	WXTnumAfZJsf825g/ZPPA5Xcr+1qFuwMtZOLVPzHe9oP9Lf7QwJNVQt+R0vRlQ2sg4v37zHD3rKk/
	Kb2r5RzTLNLNP2WKhtvcUm9jfzSm441PvOVAB74KDc9dDed/639ImU9WnKAcu05WVaiF0RXxPBhaN
	qczFGytxCBqScEsmVMPP5pnG1xyl6wgupkP9eUx4Q5jcOzPnz/j8TXc9NX5C//MeoPvju7op65Q+7
	uD4fGNa+orkNEtMngOjcoGIXeG6fnpL1VKwrWlRERGfvRqa+F14d/AJxhbd5iPfggFhYlHPuMtyBF
	VV6sJriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gsz-00000002zM5-3Rl4;
	Mon, 29 Sep 2025 16:38:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gsx-00000002zKg-2iHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2645F1CC4;
	Mon, 29 Sep 2025 09:37:49 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C13973F66E;
	Mon, 29 Sep 2025 09:37:55 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:38 +0100
Subject: [PATCH 02/25] perf arm_spe: Unify operation naming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-2-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=4831;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=G2/h7Cz3kpY9a4X3zZdlt9hLzKN/SrbioEaOWhtErXY=;
 b=IvJDrCFuyZCBwfJ0wVwwp2g+z4EVNbaActptccZeFDVsdTMKIqwPkgu22cCs5JMci/EVZV/Ct
 D3p0WYARxMZBWEBwejFa5FU1L0/sMpPLZB6jG/hX+5gdlfXeS+EANn1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093759_781644_CACE9CD4 
X-CRM114-Status: GOOD (  12.27  )
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

Rename extended subclass and SVE/SME register access subclass, so that
the naming can be consistent cross all sub classes.

Add an log "SVE-SME-REG" for the SVE/SME register access, this is easier
for parsing.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c   |  2 +-
 .../perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 21 ++++++++++-----------
 .../perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h |  4 ++--
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 96eb7cced6fd1574f5d823e4c67b9051dcf183ed..b0fb896abad48de93aa1ed560029f9bc9ae969e9 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -200,7 +200,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 					decoder->record.op |= ARM_SPE_OP_ST;
 				else
 					decoder->record.op |= ARM_SPE_OP_LD;
-				if (SPE_OP_PKT_IS_LDST_SVE(payload))
+				if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload))
 					decoder->record.op |= ARM_SPE_OP_SVE_LDST;
 				break;
 			case SPE_OP_PKT_HDR_CLASS_OTHER:
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 1a1ffe50ee73ab4400fd1163d0e84e54f4d8ab0b..f6e9c58ce62f3ae227a79d91caefaef4bd87d98a 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -362,31 +362,30 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
 		arm_spe_pkt_out_string(&err, &buf, &buf_len,
 				       payload & 0x1 ? "ST" : "LD");
 
-		if (SPE_OP_PKT_IS_LDST_ATOMIC(payload)) {
+		if (SPE_OP_PKT_LDST_SUBCLASS_EXTENDED(payload)) {
 			if (payload & SPE_OP_PKT_AT)
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " AT");
 			if (payload & SPE_OP_PKT_EXCL)
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " EXCL");
 			if (payload & SPE_OP_PKT_AR)
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " AR");
-		}
-
-		if (SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(payload))
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " SIMD-FP");
-		else if (SPE_OP_PKT_LDST_SUBCLASS_GP_REG(payload))
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_GP_REG(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " GP-REG");
-		else if (SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(payload))
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " UNSPEC-REG");
-		else if (SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG(payload))
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " NV-SYSREG");
-		else if (SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG(payload))
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " MTE-TAG");
-		else if (SPE_OP_PKT_LDST_SUBCLASS_MEMCPY(payload))
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_MEMCPY(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " MEMCPY");
-		else if (SPE_OP_PKT_LDST_SUBCLASS_MEMSET(payload))
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_MEMSET(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " MEMSET");
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-SME-REG");
 
-		if (SPE_OP_PKT_IS_LDST_SVE(payload)) {
 			/* SVE effective vector length */
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " EVLEN %d",
 					       SPE_OP_PKG_SVE_EVL(payload));
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index 75e355fe3438cc07704cb61a66ca162bd0904042..cb947e625918922dc1fa25cf8843b09661197782 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -133,14 +133,14 @@ enum arm_spe_events {
 #define SPE_OP_PKT_LDST_SUBCLASS_MEMCPY(v)	(((v) & GENMASK_ULL(7, 1)) == 0x20)
 #define SPE_OP_PKT_LDST_SUBCLASS_MEMSET(v)	(((v) & GENMASK_ULL(7, 0)) == 0x25)
 
-#define SPE_OP_PKT_IS_LDST_ATOMIC(v)		(((v) & (GENMASK_ULL(7, 5) | BIT(1))) == 0x2)
+#define SPE_OP_PKT_LDST_SUBCLASS_EXTENDED(v)	(((v) & (GENMASK_ULL(7, 5) | BIT(1))) == 0x2)
 
 #define SPE_OP_PKT_AR				BIT(4)
 #define SPE_OP_PKT_EXCL				BIT(3)
 #define SPE_OP_PKT_AT				BIT(2)
 #define SPE_OP_PKT_ST				BIT(0)
 
-#define SPE_OP_PKT_IS_LDST_SVE(v)		(((v) & (BIT(3) | BIT(1))) == 0x8)
+#define SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(v)	(((v) & (BIT(3) | BIT(1))) == 0x8)
 
 #define SPE_OP_PKT_SVE_SG			BIT(7)
 /*

-- 
2.34.1


