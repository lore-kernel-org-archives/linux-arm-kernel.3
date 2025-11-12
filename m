Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48542CD3438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rchVwRSKpH4vG7Rx4MV1/98mUv+Kh1mHvqM09g6B7R8=; b=Fz6jcrxpJwQkHpaPZzffYZzM9R
	5p03mVFPspXLjunDZW7lv2rdBTtJF8sMO1BpPzKBPCX4P+Bo9sWKdg22uOhok0NEL+4IOt8+P1tqu
	O1G1787qWbYtP5kMUZjU0cT32ZGVoMz2Rwz1nQb9Hk/YFblo9lUfgApKoSVIBBOtrBsxNepAlAR8d
	JdICcqdkYFq5mQq7WMyr1qcojl75yjtI2yMTK8aVkTZZDE9hr+3l3lVdRIAB3Zmpyrd7k7KbvRJfY
	uewsfwoLA1pSiyl5W9fjabNoqin4cGn02EJ7MM8xp6C0qYBZQJqf1/yDdA4XVmyRuXcF4hNxy0R3R
	09nVE1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFX0-00000009Jhx-0Q3h;
	Wed, 12 Nov 2025 18:25:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWt-00000009Jau-1Ez1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:25:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33BCC1515;
	Wed, 12 Nov 2025 10:25:07 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002D03F63F;
	Wed, 12 Nov 2025 10:25:12 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 18:24:36 +0000
Subject: [PATCH v3 10/25] perf arm_spe: Report register access in record
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-perf_support_arm_spev1-3-v3-10-e63c9829f9d9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971891; l=1481;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=HHOOdkzKuLKsg1t2wcgtmBC8Ve28pWlydemgtJS2c20=;
 b=4hsUP2OvotNhNXauUj1DDopPhAkHT0c80GQjf1KX5l3MAenuWz+S6/CbSJxXqzBHccWZpoAjt
 VMzPPGGredbBLdyEc8m4XbwipDOm9yfnm2sO2dIdhB/TxOCILSGCg9p
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102515_395184_96862937 
X-CRM114-Status: GOOD (  10.73  )
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

Record register access info for load / store operations.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 6974f594f37c9916fff591ced1e9c2d60cf84f14..804dce129121b9d2600be01af7f1f2780a9d0fc9 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -200,8 +200,19 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 					decoder->record.op |= ARM_SPE_OP_ST;
 				else
 					decoder->record.op |= ARM_SPE_OP_LD;
-				if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload))
+
+				if (SPE_OP_PKT_LDST_SUBCLASS_GP_REG(payload)) {
+					decoder->record.op |= ARM_SPE_OP_GP_REG;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(payload)) {
+					decoder->record.op |= ARM_SPE_OP_SIMD_FP;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(payload)) {
+					decoder->record.op |= ARM_SPE_OP_UNSPEC_REG;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG(payload)) {
+					decoder->record.op |= ARM_SPE_OP_NV_SYSREG;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SVE;
+				}
+
 				break;
 			case SPE_OP_PKT_HDR_CLASS_OTHER:
 				decoder->record.op |= ARM_SPE_OP_OTHER;

-- 
2.34.1


