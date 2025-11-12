Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40151CD3441
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD7SZJqqKp4j5kPTA2fkZyWmNiytmh4fqK6FoM89i0I=; b=wm0hXZQ4XMvN8nn4IXLcSBugre
	PQmCSXLfo2ABLcVz1/sATLwLSg/mlHD3SGT8aaWZg8maSf78GHOW8QKdcU7m+7CmWviAdrDlzLGm0
	Cv5lFPs2w1KaHQIRcy4KHE6jxhyMBf0GJIwtyt2GdahST6hfRSUjKf/tkGmp9e5QBT6zmQPqKVa6J
	GhqTQGMWgDQY/hmhKkV0FgFyo7RGag0OSUQv3DXpsOpEJZ+tP3DnbY3FWyuJrR7f5oJVssd0i3nqS
	Caz3b/Xm3buaktqdFybHyaMmVzLN2TUp+ZlqzntmsprlbsUs1GOdqNpazVuiD6bJuKbw6zmGcW2tw
	pyrZdk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFX0-00000009JiX-1v1D;
	Wed, 12 Nov 2025 18:25:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWv-00000009JdU-267k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:25:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CE551595;
	Wed, 12 Nov 2025 10:25:09 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 297F33F63F;
	Wed, 12 Nov 2025 10:25:15 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 18:24:37 +0000
Subject: [PATCH v3 11/25] perf arm_spe: Report MTE allocation tag in record
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-perf_support_arm_spev1-3-v3-11-e63c9829f9d9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971891; l=1653;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9xyqlRibKdfIEBA60SZCFaRYBKwargJv8y6O2L3jq+o=;
 b=99TwPDXTKmYflRVDq+1GgjET/RclfTmwE1ao/7lF1CBjBHvBuqemkbSOCGQ8nhmD8fp1uVMOt
 6lg2T3fwVVnCj+njyvKHJMZ0Ur3OpFtCujMvHyqse1dDcILKswe/ZjS
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102518_000213_3B4DA826 
X-CRM114-Status: GOOD (  10.01  )
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

Save MTE tag info in memory record.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 2 ++
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 804dce129121b9d2600be01af7f1f2780a9d0fc9..6696448bdf4f347e2032a1b4da46fcdd4016f9fc 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -209,6 +209,8 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 					decoder->record.op |= ARM_SPE_OP_UNSPEC_REG;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_NV_SYSREG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_NV_SYSREG;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG(payload)) {
+					decoder->record.op |= ARM_SPE_OP_MTE_TAG;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SVE;
 				}
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index acab6d11096b19b1d31a553c83cba9732ecf5ddb..7b4d26f2ebfe17a9187f959e5ec0b2479f70cc2f 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -44,6 +44,7 @@ enum arm_spe_2nd_op_ldst {
 	ARM_SPE_OP_NV_SYSREG		= 1 << 10,
 	ARM_SPE_OP_SIMD_FP		= 1 << 11,
 	ARM_SPE_OP_SVE			= 1 << 12,
+	ARM_SPE_OP_MTE_TAG		= 1 << 13,
 
 	/* Assisted information for memory / SIMD */
 	ARM_SPE_OP_LD			= 1 << 20,

-- 
2.34.1


