Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E096ECD3438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAnWTznm3ew+ojFK5YJwhVgA5IhjIt8i06klEXek97A=; b=ZQU/zJ2loeS4Zjc/UdjBK7iInn
	Y7uMM06V7VPy74F3EGUmussMYjZJrwTUIX5jCKMf657ZQIlpf3IImYpU3kmpbXWz65FkqHvaTJN0B
	vIHmBctaCgVTEyxFpmS8z1QeOQmGwQI82q9O3Bzs0zBqcXvF5fggmB1zqUbHBtKKrdp8Q5/0Gurzy
	n57ZSZ932J9cZJ4SEWDIvANvW8+fux3GV4veX+RgNigMKRgLmjsrWjFAzT+9RU5mYpfwbMaj9a1Be
	qTDkly3pmQ7cVjZE3loAQgPuPpET8LSgCReHNlaAGALh1jBl8PIEb6K+4b35Y2vdFZJYZtn3cejdH
	tPdPIeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFXO-00000009KDA-0Q0X;
	Wed, 12 Nov 2025 18:25:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFX8-00000009JtH-1x4l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:25:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D3FB1595;
	Wed, 12 Nov 2025 10:25:22 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C5BE3F63F;
	Wed, 12 Nov 2025 10:25:27 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 18:24:43 +0000
Subject: [PATCH v3 17/25] perf arm_spe: Synthesize memory samples for SIMD
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-perf_support_arm_spev1-3-v3-17-e63c9829f9d9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971891; l=2159;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=m5idn6J2HzqiTvemjD/FlbMxoaawJdDwbDm+FfrqOfo=;
 b=/1xv3DjLyB0Bpi4qgeS3nVANRIlcwqsg8kopNdZS/PVx6JNXE9xRellaCT6Au8C1SHFH3AZV+
 +RqGgLoDlhdBz0frIw7yCiB/cELTPDAbPMdz7EVF6vfnl1s8sZgn7y/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102530_589507_5C5D5F45 
X-CRM114-Status: GOOD (  14.99  )
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
index 881257d3958705e725f1b7d47b41a93defd231ea..6a9c61d4aeeb2283a426d0a00ff7072eb5049c31 100644
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
 
@@ -986,8 +991,7 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
 {
 	union perf_mem_data_src	data_src = {};
 
-	/* Only synthesize data source for LDST operations */
-	if (!is_ldst_op(record->op))
+	if (!is_mem_op(record->op))
 		return data_src;
 
 	if (record->op & ARM_SPE_OP_LD)
@@ -995,7 +999,7 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
 	else if (record->op & ARM_SPE_OP_ST)
 		data_src.mem_op = PERF_MEM_OP_STORE;
 	else
-		return data_src;
+		data_src.mem_op = PERF_MEM_OP_NA;
 
 	arm_spe__synth_ds(speq, record, &data_src);
 	arm_spe__synth_memory_level(speq, record, &data_src);
@@ -1096,11 +1100,7 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
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


