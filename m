Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9EACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azgI0MUZZrj4NFos0GIOB9lvrsAMA4cu4gnaFGgIPDw=; b=Vg+lshGBk8oVPC2gcqwUcRBdwY
	7X/g33WZ436JNUi+Y3o8qswjRzC+nP6JDXPsQRJI+X8Qllblu+bsxOZXfcxoQnLLlIO6fKMdm6Y9W
	HG+FAUwyPkBX6JOdv6u37oPs1GSYM4lTW80bapwLmw8Swcua6Yo3Rvx6yzre1A1r53UjHDbBnTDvg
	NeIxLtBRXC8sXwLbjbajGPHQphWmQNvZtxHI2NU6TgsLKHPoeb5xLX7X36m5vkplNSN7gqVvADdS5
	Vw1xNfc7a6BMs8MYjW11UwOUR7GPYlQV1k/12u6tQF2LTxvQmPO6UD/nxA44MEGqIr02to7xOdTqf
	7qCLNmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKm-00000007PVd-2nDg;
	Fri, 17 Oct 2025 10:05:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKi-00000007PRb-0LZf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D7341596;
	Fri, 17 Oct 2025 03:05:02 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28E8D3F59E;
	Fri, 17 Oct 2025 03:05:09 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:04:50 +0100
Subject: [PATCH v2 01/25] perf arm_spe: Fix memset subclass in operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-1-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=4136;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=911J1yGhIzG59kvCUApAkrk5zeOIijIY/YAoFzkTeCI=;
 b=13UdyN8VrL+C49kNsupfZkr5K1TCc98bzOGKg4YSVTFfOv9e3dkzZ1kWF3lyk4p6AiJrASpdy
 Scxfb2i8jOeBw2r2gdcxO1lZHBnfa3LwZhWH6uqkkKQYOoFVHDkV8Ie
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030512_204730_50A62605 
X-CRM114-Status: GOOD (  10.49  )
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


