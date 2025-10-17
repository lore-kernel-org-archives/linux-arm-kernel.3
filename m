Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE01CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXi/bvNxPYsQ6mietB1K1V86YbK013ltM66LxFpGvzY=; b=pr0p2jwlfAfne5WT3QhCwkr3PC
	I+8FiBlZtyWGECJrPYQhwl9IXdNHTz7Y2h0VqGi9Wskufk5GzvoLB9F753jGuKJtCbNXm0YAhw2wp
	VMoLQBDSL59wkaO1GHFcugcKGrqzr3dmRHkj1sve2NkhXMH2d+vKAMt7OLrgHicesae+xVtrJ4LAL
	SEcG0AbENW0I6FU1TI5oiwjGJuvbguwZN+u1p5cFrwy7/IDUEwo63aoNVytM6rOVJGWozjRehidRe
	wB1/YMKszm+Rn3EVlMBd6LhmiektNiBwCwxGAATwU++elrBK8EEDwTwR8Nezzd9Z/BaIKrbKFmtFm
	d5j9djrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLd-00000007Qcj-404W;
	Fri, 17 Oct 2025 10:06:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLK-00000007Q9B-29wv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480491596;
	Fri, 17 Oct 2025 03:05:42 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7CFF3F59E;
	Fri, 17 Oct 2025 03:05:48 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:14 +0100
Subject: [PATCH v2 25/25] perf arm_spe: Improve SIMD flags setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-25-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=3476;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=I3uIxfNtm6qBav2bc6bM0+j7YCi2ZuetPUAMBzfx8do=;
 b=/1RKwwGzhCB9gJqUfC3aJZUxFD8VtHcccZKbeFzvvG515mszeQPdcOW20KgOXgiy9P/FrzdP+
 UjYWto/fPeHCSe8APExXpOBX1KvTEEI+m1HKA8WzkfQ9Di4Zgdw9vyv
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030550_709856_C7E4107D 
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

Fill in ASE and SME operations for the SIMD arch field.

Also set the predicate flags for SVE and SME, but differences between
them: SME does not have a predicate flag, so the setting is based on
events. SVE provides a predicate flag to indicate whether the predicate
is disabled, which allows it to be distinguished into four cases: full
predicates, empty predicates, fully predicated, and disabled predicates.

After:

    perf report -s +simd
    ...
    0.06%     0.06%  sve-test  sve-test               [.] setz                                        [p] SVE
    0.06%     0.06%  sve-test  [kernel.kallsyms]      [k] do_raw_spin_lock
    0.06%     0.06%  sve-test  sve-test               [.] getz                                        [p] SVE
    0.06%     0.06%  sve-test  [kernel.kallsyms]      [k] timekeeping_advance
    0.06%     0.06%  sve-test  sve-test               [.] getz                                        [d] SVE
    0.06%     0.06%  sve-test  [kernel.kallsyms]      [k] update_load_avg
    0.06%     0.06%  sve-test  sve-test               [.] getz                                        [e] SVE
    0.05%     0.05%  sve-test  sve-test               [.] setz                                        [e] SVE
    0.05%     0.05%  sve-test  [kernel.kallsyms]      [k] update_curr
    0.05%     0.05%  sve-test  sve-test               [.] setz                                        [d] SVE
    0.05%     0.05%  sve-test  [kernel.kallsyms]      [k] do_raw_spin_unlock
    0.05%     0.05%  sve-test  [kernel.kallsyms]      [k] timekeeping_update_from_shadow.constprop.0
    0.05%     0.05%  sve-test  sve-test               [.] getz                                        [f] SVE
    0.05%     0.05%  sve-test  sve-test               [.] setz                                        [f] SVE

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index e9df50b2cb807185c939f6712e9d65a41aacce87..0ffb6c684f4dc55e6029eff6fdd7bef3ffa36352 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -353,12 +353,26 @@ static struct simd_flags arm_spe__synth_simd_flags(const struct arm_spe_record *
 
 	if (record->op & ARM_SPE_OP_SVE)
 		simd_flags.arch |= SIMD_OP_FLAGS_ARCH_SVE;
-
-	if (record->type & ARM_SPE_SVE_PARTIAL_PRED)
-		simd_flags.pred |= SIMD_OP_FLAGS_PRED_PARTIAL;
-
-	if (record->type & ARM_SPE_SVE_EMPTY_PRED)
-		simd_flags.pred |= SIMD_OP_FLAGS_PRED_EMPTY;
+	else if (record->op & ARM_SPE_OP_SME)
+		simd_flags.arch |= SIMD_OP_FLAGS_ARCH_SME;
+	else if (record->op & (ARM_SPE_OP_ASE | ARM_SPE_OP_SIMD_FP))
+		simd_flags.arch |= SIMD_OP_FLAGS_ARCH_ASE;
+
+	if (record->op & ARM_SPE_OP_SVE) {
+		if (!(record->op & ARM_SPE_OP_PRED))
+			simd_flags.pred = SIMD_OP_FLAGS_PRED_DISABLED;
+		else if (record->type & ARM_SPE_SVE_PARTIAL_PRED)
+			simd_flags.pred = SIMD_OP_FLAGS_PRED_PARTIAL;
+		else if (record->type & ARM_SPE_SVE_EMPTY_PRED)
+			simd_flags.pred = SIMD_OP_FLAGS_PRED_EMPTY;
+		else
+			simd_flags.pred = SIMD_OP_FLAGS_PRED_FULL;
+	} else {
+		if (record->type & ARM_SPE_SVE_PARTIAL_PRED)
+			simd_flags.pred = SIMD_OP_FLAGS_PRED_PARTIAL;
+		else if (record->type & ARM_SPE_SVE_EMPTY_PRED)
+			simd_flags.pred = SIMD_OP_FLAGS_PRED_EMPTY;
+	}
 
 	return simd_flags;
 }

-- 
2.34.1


