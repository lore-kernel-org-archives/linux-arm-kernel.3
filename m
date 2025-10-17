Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACBACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1S/q9KZCk8Hp4WLp82iv5T5iY9D4c/KimWjypxSly0=; b=vvsJ83EpbrptkM1xJeLx6L2Qt3
	n1UoCX5NvRQB2X27tf2If5QtAhaLHgt3QyJpOymehFVELlQ5XJi6spg2RYcvVzQMX5MOvN448IHPG
	VzaHykTSH7DwI5D2ppdFMtjetBI11RKiVk+90BRLwkengDW36A/JAP+hvUGhG8lNXVCFSJhUSvZwd
	WVELT4zo9awfhzluPnIvLty2rnR1B2wGY2vMYZQOeFOIcTKJZuvw8FjE2cZsbDvCfX7uS2wP3RHuD
	D5i75xHCrq8mxJaF3ls3gpjqnm7mZ4iPaUXaLXUN/AJY63CbLVxoaLT5jD871aAjY07o6PFdCw0/K
	8COkKcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hLN-00000007QHO-36qq;
	Fri, 17 Oct 2025 10:05:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hL7-00000007Puo-2MTf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 140A01596;
	Fri, 17 Oct 2025 03:05:29 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 939A43F59E;
	Fri, 17 Oct 2025 03:05:35 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:06 +0100
Subject: [PATCH v2 17/25] perf arm_spe: Synthesize memory samples for SIMD
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-17-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=2159;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=+kFywxGXXe3sEzrQrjNrlVyuU8WPOraAOuMAItIboJ0=;
 b=XfWB7Y/bzhJbqnjkQIJauOgYTs2ZKIANuuYIgcfiK4pjC1ADvS1ugjbEDY2qmqXHQVr5Vk34k
 7VXZRod44wuDplBYaxHZtDqalEHlJqBanvkHijeMWP1RUyi+3l0SquN
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030537_717239_937250D6 
X-CRM114-Status: GOOD (  14.53  )
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

Synthesize memory samples for SIMD operations (including Advanced SIMD,
SVE, and SME). To provide complete information, also generate data
source entries for SIMD operations.

Since memory operations are not limited to load and store, set
PERF_MEM_OP_STORE if the operation does not fall into these cases.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 88f24a8626861393defc89540e4126a124479699..bc233a5007d20e4dec11eeb1554adc1580f43718 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -39,6 +39,11 @@
 
 #define is_ldst_op(op)		(!!((op) & ARM_SPE_OP_LDST))
 
+#define is_simd_op(op)		(!!((op) & (ARM_SPE_OP_SIMD_FP | ARM_SPE_OP_SVE | \
+					    ARM_SPE_OP_SME | ARM_SPE_OP_ASE)))
+
+#define is_mem_op(op)		(is_ldst_op(op) || is_simd_op(op))
+
 #define ARM_SPE_CACHE_EVENT(lvl) \
 	(ARM_SPE_##lvl##_ACCESS | ARM_SPE_##lvl##_MISS)
 
@@ -985,8 +990,7 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
 {
 	union perf_mem_data_src	data_src = {};
 
-	/* Only synthesize data source for LDST operations */
-	if (!is_ldst_op(record->op))
+	if (!is_mem_op(record->op))
 		return data_src;
 
 	if (record->op & ARM_SPE_OP_LD)
@@ -994,7 +998,7 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
 	else if (record->op & ARM_SPE_OP_ST)
 		data_src.mem_op = PERF_MEM_OP_STORE;
 	else
-		return data_src;
+		data_src.mem_op = PERF_MEM_OP_NA;
 
 	arm_spe__synth_ds(speq, record, &data_src);
 	arm_spe__synth_memory_level(speq, record, &data_src);
@@ -1095,11 +1099,7 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
 			return err;
 	}
 
-	/*
-	 * When data_src is zero it means the record is not a memory operation,
-	 * skip to synthesize memory sample for this case.
-	 */
-	if (spe->sample_memory && is_ldst_op(record->op)) {
+	if (spe->sample_memory && is_mem_op(record->op)) {
 		err = arm_spe__synth_mem_sample(speq, spe->memory_id, data_src);
 		if (err)
 			return err;

-- 
2.34.1


