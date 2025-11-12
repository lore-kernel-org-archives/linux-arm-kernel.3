Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32472CD3440
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azgI0MUZZrj4NFos0GIOB9lvrsAMA4cu4gnaFGgIPDw=; b=w5cjOPHTmVsBNWGTK1y9xXB137
	5pBubTE8ZqFx3f90luWVZ/2RfSGz8CtVv0bBC2mBKLsBwotXhIqgNONCkRfK06SyHNXDLMmOrovPr
	cuiJtdLnJqrjZ9SiWl4S+mqlYn77SedZ6ek21YgrCaELH71s05rbgWavnSm76FKwK+6erhColsM3C
	IPllMFVD50KkrTbP66iyjMIuks0U9IstL9QH6kfSpPLMNom5e1lIl0BKLgufJabqa5hoIuaU9so4o
	WIL/mfm9WoM+ngSaZgseIYCSu10yeCs5uo9tgCD1ApEjsYJTF3V3xo/LNYbTK/Fr9nrwUpAdXMARn
	gr7XlOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWf-00000009JSk-2CrC;
	Wed, 12 Nov 2025 18:25:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWa-00000009JQw-1Md7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:24:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92271691;
	Wed, 12 Nov 2025 10:24:47 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 731F63F63F;
	Wed, 12 Nov 2025 10:24:53 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 18:24:27 +0000
Subject: [PATCH v3 01/25] perf arm_spe: Fix memset subclass in operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-perf_support_arm_spev1-3-v3-1-e63c9829f9d9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971890; l=4136;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=911J1yGhIzG59kvCUApAkrk5zeOIijIY/YAoFzkTeCI=;
 b=oV+oeTQnvlkmSPbhxfyc0Ha9q2cY8921i0eRNcuu6YcbgQ1ES7LUu1jeNKwdZUVK2MYzday7i
 0bYpWfDz5oUD8wnPLyQE93gis6a0nwpjshHOXowBaN7BSC/mJS9SyE/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102456_456620_B74B77AB 
X-CRM114-Status: GOOD (  11.05  )
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

The operation subclass is extracted from bits [7..1] of the payload.
Since bit [0] is not parsed, there is no chance to match the memset type
(0x25). As a result, the memset payload is never parsed successfully.

Instead of extracting a unified bit field, change to extract the
specific bits for each operation subclass.

Fixes: 34fb60400e32 ("perf arm-spe: Add raw decoding for SPEv1.3 MTE and MOPS load/store")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 25 ++++++----------------
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     | 15 ++++++-------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 80561630253dd5c46f7e99b24fc13b99f346459f..1a1ffe50ee73ab4400fd1163d0e84e54f4d8ab0b 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -371,31 +371,20 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " AR");
 		}
 
-		switch (SPE_OP_PKT_LDST_SUBCLASS_GET(payload)) {
-		case SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP:
+		if (SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(payload))
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " SIMD-FP");
-			break;
-		case SPE_OP_PKT_LDST_SUBCLASS_GP_REG:
+		else if (SPE_OP_PKT_LDST_SUBCLASS_GP_REG(payload))
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " GP-REG");
-			break;
-		case SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG:
+		else if (SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(payload))
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " UNSPEC-REG");
-			break;
-		case SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG:
+		else if (SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG(payload))
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " NV-SYSREG");
-			break;
-		case SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG:
+		else if (SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG(payload))
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " MTE-TAG");
-			break;
-		case SPE_OP_PKT_LDST_SUBCLASS_MEMCPY:
+		else if (SPE_OP_PKT_LDST_SUBCLASS_MEMCPY(payload))
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " MEMCPY");
-			break;
-		case SPE_OP_PKT_LDST_SUBCLASS_MEMSET:
+		else if (SPE_OP_PKT_LDST_SUBCLASS_MEMSET(payload))
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " MEMSET");
-			break;
-		default:
-			break;
-		}
 
 		if (SPE_OP_PKT_IS_LDST_SVE(payload)) {
 			/* SVE effective vector length */
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index d00c2481712dcc457eab2f5e9848ffc3150e6236..75e355fe3438cc07704cb61a66ca162bd0904042 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -125,14 +125,13 @@ enum arm_spe_events {
 
 #define SPE_OP_PKT_IS_OTHER_SVE_OP(v)		(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
 
-#define SPE_OP_PKT_LDST_SUBCLASS_GET(v)		((v) & GENMASK_ULL(7, 1))
-#define SPE_OP_PKT_LDST_SUBCLASS_GP_REG		0x0
-#define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP	0x4
-#define SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG	0x10
-#define SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG	0x30
-#define SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG	0x14
-#define SPE_OP_PKT_LDST_SUBCLASS_MEMCPY		0x20
-#define SPE_OP_PKT_LDST_SUBCLASS_MEMSET		0x25
+#define SPE_OP_PKT_LDST_SUBCLASS_GP_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x0)
+#define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(v)	(((v) & GENMASK_ULL(7, 1)) == 0x4)
+#define SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x10)
+#define SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x30)
+#define SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x14)
+#define SPE_OP_PKT_LDST_SUBCLASS_MEMCPY(v)	(((v) & GENMASK_ULL(7, 1)) == 0x20)
+#define SPE_OP_PKT_LDST_SUBCLASS_MEMSET(v)	(((v) & GENMASK_ULL(7, 0)) == 0x25)
 
 #define SPE_OP_PKT_IS_LDST_ATOMIC(v)		(((v) & (GENMASK_ULL(7, 5) | BIT(1))) == 0x2)
 

-- 
2.34.1


