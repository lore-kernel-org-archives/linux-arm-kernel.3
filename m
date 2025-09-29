Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE80CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjOzip+ZIZeqwE00GOnyRJ91psLZnwmFBVD8auwzSPU=; b=xHgWhjsBQIvDmHPjgFP+3Qc2Yw
	U78Enw/uZv5Ut4sWoWKKvfaJub0v4NF7HC5Imfv7n4lpoB3T8yRppPzi/xYxL5APc3hQ7iaoU/ySw
	16HY2G6Qr++j1dUL7WznWR5Q4AO6Ib/odwur4DxQG5pfTh+RY0lKHDdlvcAXb/R+L6g1r8S0PPUFZ
	6WEUj2vor5h6rOJL0sBAEC3QZP0OMMYXxoK9mZ7tiQpWzk3Df98L3Fvym0lGg8Mg8fhDE0LeEiz7x
	LnJmCUIaKpm/I1p4WMW+sgJyy9RZ77OJIiiTstYQrpJalPz2hLXbiBLaHrqvu4GcjZO5avSJBEBfD
	D0vh0GkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtl-0000000300q-3cRc;
	Mon, 29 Sep 2025 16:38:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtK-00000002zep-2dxu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D26311758;
	Mon, 29 Sep 2025 09:38:13 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A01B3F66E;
	Mon, 29 Sep 2025 09:38:20 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:53 +0100
Subject: [PATCH 17/25] perf arm_spe: Expose length for SVE and SME
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-17-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=2303;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=CGpOuSW1XrnSNd6YlOb/GhLSEOQawzm0r4F/0VX1FFY=;
 b=JDJuGWAKneSPQfR5GUwZ3eZ2hijxK6fK96fPfHXa3hRzIUqdmgdR6a1gABwLUiqGVB9V7xQV/
 Sr05vRs2on0BSyi1ntwvglSAtnMpFkXqhakhtNRqfdK40EACJBWmmob
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093822_740268_3FC09C4A 
X-CRM114-Status: GOOD (  10.50  )
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

Record length for SVE and SME operations into records.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 3 +++
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 9e02b2bdd1177193996d071dd88f969e25b1ad86..82e3053131db62603553bd092388879ce9a9bcd4 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -220,6 +220,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 						decoder->record.op |= ARM_SPE_OP_ATOMIC;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SVE;
+					decoder->record.length = SPE_OP_PKG_SVE_EVL(payload);
 					if (payload & SPE_OP_PKT_SVE_PRED)
 						decoder->record.op |= ARM_SPE_OP_PRED;
 					if (payload & SPE_OP_PKT_SVE_SG)
@@ -239,12 +240,14 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 				decoder->record.op |= ARM_SPE_OP_OTHER;
 				if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SVE | ARM_SPE_OP_DP;
+					decoder->record.length = SPE_OP_PKG_SVE_EVL(payload);
 					if (payload & SPE_OP_PKT_OTHER_FP)
 						decoder->record.op |= ARM_SPE_OP_FP;
 					if (payload & SPE_OP_PKT_SVE_PRED)
 						decoder->record.op |= ARM_SPE_OP_PRED;
 				} else if (SPE_OP_PKT_OTHER_SUBCLASS_SME(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SME;
+					decoder->record.length = SPE_OP_PKG_SME_ETS(payload);
 					if (payload & SPE_OP_PKT_OTHER_FP)
 						decoder->record.op |= ARM_SPE_OP_FP;
 				} else if (SPE_OP_PKT_OTHER_SUBCLASS_OTHER(payload)) {
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index d4574268cf793efe154f252b3e2af9c721bada97..b9288cd774bea2534d9991213c942dcbaf2a7232 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -122,6 +122,7 @@ struct arm_spe_record {
 	u64 phys_addr;
 	u64 context_id;
 	u16 source;
+	u32 length;
 };
 
 struct arm_spe_insn;

-- 
2.34.1


