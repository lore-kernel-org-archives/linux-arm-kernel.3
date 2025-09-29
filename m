Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB802CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qrhVqeHf6fqxEOD5Qqq0ok4gDvzJsVnqdabHmih6mc=; b=TApGVpPU/lclPgu+xkKBo4zr/g
	93fbV4gT3tehpaV4iXpEfDYPX1wNAJyzlDlnuUmziu6A/gA+uTtbs9N0GZuyc7/DQrJ1Jwxp/oDS9
	MlC/Y2Y83eLjF3h8ySNZAMYdk/uk6QTb5AbDqNrQMxs4rUKEMniWNowgoQ0b2X+/PcQ5ZWE4hKsC2
	2kBJndGr5Ks3Wz5a9zPekvWEIE6jrOVUOEzI0iPcnHR5X5RDt2dI/wzjAaAREunGIq4wg4iB3D3jn
	FUeLLuvX80zVAhGmhkWDsn0Y6lkp2AxUKPF++lD3u7ZKBla+vaarNwZkOd5hptIaTfTxOsVB4ZizP
	vfmnh0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gt7-00000002zQk-1l80;
	Mon, 29 Sep 2025 16:38:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gsz-00000002zLR-0Ge4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E98A25E0;
	Mon, 29 Sep 2025 09:37:52 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 151763F66E;
	Mon, 29 Sep 2025 09:37:58 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:40 +0100
Subject: [PATCH 04/25] perf arm_spe: Rename SPE_OP_PKT_IS_OTHER_SVE_OP
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-4-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=2605;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zixE5i3+mSZRJrxDBxY30q3IwlWCPYbQatyMldJsYEw=;
 b=1VDlwAP4l9cxhYBNT+74BUKuWw7t3pVAT5QP9U7aRt5N82p4ujg5SZDVhG7rVDxIwMCndYb9q
 kZMxCV6XkmzCUvSQE/sAd89NGGuAEM2eTR43EcOm98/BmhaixlRgCfz
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093801_239242_0B1FE1CC 
X-CRM114-Status: GOOD (  11.55  )
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

Rename the macro to SPE_OP_PKT_OTHER_SUBCLASS_SVE to unify naming.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c     | 2 +-
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 2 +-
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index b0fb896abad48de93aa1ed560029f9bc9ae969e9..847c29385bea8618e14b2eb21a08896041890d89 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -205,7 +205,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 				break;
 			case SPE_OP_PKT_HDR_CLASS_OTHER:
 				decoder->record.op |= ARM_SPE_OP_OTHER;
-				if (SPE_OP_PKT_IS_OTHER_SVE_OP(payload))
+				if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload))
 					decoder->record.op |= ARM_SPE_OP_SVE_OTHER;
 				break;
 			case SPE_OP_PKT_HDR_CLASS_BR_ERET:
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 0046079edaccdd4d0c093f73395d1ecdc0007621..533920b738cbcb39136d1ba3d88e99f9d8009e74 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -340,7 +340,7 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
 
 	switch (packet->index) {
 	case SPE_OP_PKT_HDR_CLASS_OTHER:
-		if (SPE_OP_PKT_IS_OTHER_SVE_OP(payload)) {
+		if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, "SVE-OTHER");
 
 			/* SVE effective vector length */
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index 94333e7bc382deef119414e4f1de7c2878620035..48bd9e9ef132b11b79ffe2e2fbc7cfe4c340ff92 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -123,7 +123,7 @@ enum arm_spe_events {
 #define SPE_OP_PKT_HDR_CLASS_LD_ST_ATOMIC	0x1
 #define SPE_OP_PKT_HDR_CLASS_BR_ERET		0x2
 
-#define SPE_OP_PKT_IS_OTHER_SVE_OP(v)		(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
+#define SPE_OP_PKT_OTHER_SUBCLASS_SVE(v)	(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
 
 #define SPE_OP_PKT_LDST_SUBCLASS_GP_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x0)
 #define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(v)	(((v) & GENMASK_ULL(7, 1)) == 0x4)

-- 
2.34.1


