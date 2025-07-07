Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A080DC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUV4EAAuIlaBIxCC/PQJ+h1R5rA4oebT1X3ju9gGp4s=; b=XP8SYP6jw3JzOSTlf+tEjpun56
	PCSKgy93xG1UAgbz2vyB8t1W/UezeMzMn1JxBEEuPiKsK1yYpgFb9Fexstwbdrd56VCazG/AIXycu
	Mk5u274LxXtsIWe5gR38+hF290P1fuPDgIv1VvyIEhxZYskD3hZCF3DKZsqcwat5IXPhAoOh1rV6h
	EQf2nFFNSgmEtDct/cWVWTQRJyPpz9gIEAITS1uPNdld6tpeoyNiS1RUiJumvJYGWGVnY8Pu6qxYy
	2qxP3U3kiaGQZv4CLqx/L0G0XnDjjMrBCKdISYDwt4b9Ksj9Ls0akHkWD+BnOsu/cFE7bPf7MZR1+
	KuY56miQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmIQ-00000002ce3-2ENF;
	Mon, 07 Jul 2025 13:54:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm4h-00000002Zw7-38go
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:40:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D62E168F;
	Mon,  7 Jul 2025 06:39:50 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F04163F6A8;
	Mon,  7 Jul 2025 06:40:00 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 07 Jul 2025 14:39:27 +0100
Subject: [PATCH v3 05/14] perf arm_spe: Directly propagate raw event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-5-33ea82da3280@arm.com>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
In-Reply-To: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 German Gomez <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751895589; l=3995;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=A82OQ2BFXXAxnTr/n1kS9ARBrMRjwjgGM6jtBrrEcd0=;
 b=7KZCnwM07siLzXn7j4jWuJu7gq5jcZgzX6XGgFWFYxWFavF9QHvB1aP2aqdybysTynpniOG3a
 JYCwVQpeSXxCx6j0UbB1gIDf8jZa/wpuKyTnXWEIDfWLMXqjxITkJNk
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_064003_877845_0A88B5A3 
X-CRM114-Status: GOOD (  11.59  )
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

Two sets of event bits are defined: one for generating samples and
another are raw event bits used in the backend decoder. Reduce the
redundancy by using the raw event bits directly in the frontend code.

To avoid overflow issues, change the type of the event variable from
enum to u64.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 37 +----------------------
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 28 ++++++++---------
 2 files changed, 14 insertions(+), 51 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 688fe6d7524416420a7c18d5f8a268492ce7c3b8..96eb7cced6fd1574f5d823e4c67b9051dcf183ed 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -229,42 +229,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 			}
 			break;
 		case ARM_SPE_EVENTS:
-			if (payload & BIT(EV_L1D_REFILL))
-				decoder->record.type |= ARM_SPE_L1D_MISS;
-
-			if (payload & BIT(EV_L1D_ACCESS))
-				decoder->record.type |= ARM_SPE_L1D_ACCESS;
-
-			if (payload & BIT(EV_TLB_WALK))
-				decoder->record.type |= ARM_SPE_TLB_MISS;
-
-			if (payload & BIT(EV_TLB_ACCESS))
-				decoder->record.type |= ARM_SPE_TLB_ACCESS;
-
-			if (payload & BIT(EV_LLC_MISS))
-				decoder->record.type |= ARM_SPE_LLC_MISS;
-
-			if (payload & BIT(EV_LLC_ACCESS))
-				decoder->record.type |= ARM_SPE_LLC_ACCESS;
-
-			if (payload & BIT(EV_REMOTE_ACCESS))
-				decoder->record.type |= ARM_SPE_REMOTE_ACCESS;
-
-			if (payload & BIT(EV_MISPRED))
-				decoder->record.type |= ARM_SPE_BRANCH_MISS;
-
-			if (payload & BIT(EV_NOT_TAKEN))
-				decoder->record.type |= ARM_SPE_BRANCH_NOT_TAKEN;
-
-			if (payload & BIT(EV_TRANSACTIONAL))
-				decoder->record.type |= ARM_SPE_IN_TXN;
-
-			if (payload & BIT(EV_PARTIAL_PREDICATE))
-				decoder->record.type |= ARM_SPE_SVE_PARTIAL_PRED;
-
-			if (payload & BIT(EV_EMPTY_PREDICATE))
-				decoder->record.type |= ARM_SPE_SVE_EMPTY_PRED;
-
+			decoder->record.type = payload;
 			break;
 		case ARM_SPE_DATA_SOURCE:
 			decoder->record.source = payload;
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index 881d9f29c1380b62486f0cd81498750ba06c4b50..03da55453da8fd2e7b9e2dcba3ddcf5243599e1c 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -13,20 +13,18 @@
 
 #include "arm-spe-pkt-decoder.h"
 
-enum arm_spe_sample_type {
-	ARM_SPE_L1D_ACCESS		= 1 << 0,
-	ARM_SPE_L1D_MISS		= 1 << 1,
-	ARM_SPE_LLC_ACCESS		= 1 << 2,
-	ARM_SPE_LLC_MISS		= 1 << 3,
-	ARM_SPE_TLB_ACCESS		= 1 << 4,
-	ARM_SPE_TLB_MISS		= 1 << 5,
-	ARM_SPE_BRANCH_MISS		= 1 << 6,
-	ARM_SPE_REMOTE_ACCESS		= 1 << 7,
-	ARM_SPE_SVE_PARTIAL_PRED	= 1 << 8,
-	ARM_SPE_SVE_EMPTY_PRED		= 1 << 9,
-	ARM_SPE_BRANCH_NOT_TAKEN	= 1 << 10,
-	ARM_SPE_IN_TXN			= 1 << 11,
-};
+#define ARM_SPE_L1D_ACCESS		BIT(EV_L1D_ACCESS)
+#define ARM_SPE_L1D_MISS		BIT(EV_L1D_REFILL)
+#define ARM_SPE_LLC_ACCESS		BIT(EV_LLC_ACCESS)
+#define ARM_SPE_LLC_MISS		BIT(EV_LLC_MISS)
+#define ARM_SPE_TLB_ACCESS		BIT(EV_TLB_ACCESS)
+#define ARM_SPE_TLB_MISS		BIT(EV_TLB_WALK)
+#define ARM_SPE_BRANCH_MISS		BIT(EV_MISPRED)
+#define ARM_SPE_BRANCH_NOT_TAKEN	BIT(EV_NOT_TAKEN)
+#define ARM_SPE_REMOTE_ACCESS		BIT(EV_REMOTE_ACCESS)
+#define ARM_SPE_SVE_PARTIAL_PRED	BIT(EV_PARTIAL_PREDICATE)
+#define ARM_SPE_SVE_EMPTY_PRED		BIT(EV_EMPTY_PREDICATE)
+#define ARM_SPE_IN_TXN			BIT(EV_TRANSACTIONAL)
 
 enum arm_spe_op_type {
 	/* First level operation type */
@@ -100,7 +98,7 @@ enum arm_spe_hisi_hip_data_source {
 };
 
 struct arm_spe_record {
-	enum arm_spe_sample_type type;
+	u64 type;
 	int err;
 	u32 op;
 	u32 latency;

-- 
2.34.1


