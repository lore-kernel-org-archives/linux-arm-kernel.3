Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E05BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enXqWmu85q5vX+ios6ImSnErQSooiiI8vChDkpA0hr4=; b=uANqbRr75p4am+O3ptF0J5jDQA
	oZmQ5cXHGvYWaw7WOxr+SF7oxBW8/EmhnjIeBajD2rZ4j6Vzci65TX1sdtlXHIt+lfuSJyvdoDJrZ
	OX9mIS5W7Vn8fYlrsVdhyaluPGLoJniZjOwMd+/OnwrYsgDVeHFI/acR+/rD62x+tDPt47EM07tVf
	PkS1Mihsui5h8ET1aj85Dodiu8qZ4Z5lU08NxG3Zhhl1YdFObqLqiP4JNBD7uRVcXCYYRuaC3QDhV
	MtZcPTpZCZ8Qasku8IcsaYBCV5aRtxMI1FJ+cIA0UOmjVsUt+9bvOruUt4a7gruayXHMjZWtiMEkh
	R9Fjiyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5vM-0000000AKsW-1935;
	Fri, 12 Sep 2025 15:42:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5vJ-0000000AKnq-0dXN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:42:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66B481515;
	Fri, 12 Sep 2025 08:42:44 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A56803F694;
	Fri, 12 Sep 2025 08:42:50 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 12 Sep 2025 16:42:10 +0100
Subject: [PATCH v5 05/14] perf arm_spe: Use full type for data_src
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-arm_spe_support_hitm_overhead_v1_public-v5-5-0800880da0a7@arm.com>
References: <20250912-arm_spe_support_hitm_overhead_v1_public-v5-0-0800880da0a7@arm.com>
In-Reply-To: <20250912-arm_spe_support_hitm_overhead_v1_public-v5-0-0800880da0a7@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757691759; l=3452;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=B5MnTJqbE8nUXxaPEkMUJDWBL2VBqJdx7w1bQRFcVkQ=;
 b=nJzczTTb3bwmE3jZEJCMh9w2S4RGHG3kY6LrdrEOlCCfUUJ+y0TksJYLG9YUVgiPrEDfHlZ0b
 dFcAYMn3QoiAkFaH07DGulWkER7dXfnBDGsjwjrjyd5uLp5+i66A7iA
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_084253_328066_25B89FF4 
X-CRM114-Status: GOOD (  12.71  )
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

From: James Clark <james.clark@linaro.org>

data_src has an actual type rather than just being a u64. To help
readers, delay decomposing it to a u64 until it's finally assigned to
the sample.

Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 6fb012d89488c1e5d4866ec62a2df2bc895cb6ca..38e6f8331f2790b9cd3bc94d5a18657d7e0f5e42 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -469,7 +469,8 @@ arm_spe_deliver_synth_event(struct arm_spe *spe,
 }
 
 static int arm_spe__synth_mem_sample(struct arm_spe_queue *speq,
-				     u64 spe_events_id, u64 data_src)
+				     u64 spe_events_id,
+				     union perf_mem_data_src data_src)
 {
 	struct arm_spe *spe = speq->spe;
 	struct arm_spe_record *record = &speq->decoder->record;
@@ -484,7 +485,7 @@ static int arm_spe__synth_mem_sample(struct arm_spe_queue *speq,
 	sample.stream_id = spe_events_id;
 	sample.addr = record->virt_addr;
 	sample.phys_addr = record->phys_addr;
-	sample.data_src = data_src;
+	sample.data_src = data_src.val;
 	sample.weight = record->latency;
 
 	ret = arm_spe_deliver_synth_event(spe, speq, event, &sample);
@@ -517,7 +518,8 @@ static int arm_spe__synth_branch_sample(struct arm_spe_queue *speq,
 }
 
 static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
-					     u64 spe_events_id, u64 data_src)
+					     u64 spe_events_id,
+					     union perf_mem_data_src data_src)
 {
 	struct arm_spe *spe = speq->spe;
 	struct arm_spe_record *record = &speq->decoder->record;
@@ -532,7 +534,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 	sample.stream_id = spe_events_id;
 	sample.addr = record->to_ip;
 	sample.phys_addr = record->phys_addr;
-	sample.data_src = data_src;
+	sample.data_src = data_src.val;
 	sample.weight = record->latency;
 	sample.flags = speq->flags;
 	sample.branch_stack = speq->last_branch;
@@ -880,21 +882,22 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 	return false;
 }
 
-static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
-				      const struct arm_spe_record *record)
+static union perf_mem_data_src
+arm_spe__synth_data_source(struct arm_spe_queue *speq,
+			   const struct arm_spe_record *record)
 {
-	union perf_mem_data_src	data_src = { .mem_op = PERF_MEM_OP_NA };
+	union perf_mem_data_src	data_src = {};
 
 	/* Only synthesize data source for LDST operations */
 	if (!is_ldst_op(record->op))
-		return 0;
+		return data_src;
 
 	if (record->op & ARM_SPE_OP_LD)
 		data_src.mem_op = PERF_MEM_OP_LOAD;
 	else if (record->op & ARM_SPE_OP_ST)
 		data_src.mem_op = PERF_MEM_OP_STORE;
 	else
-		return 0;
+		return data_src;
 
 	if (!arm_spe__synth_ds(speq, record, &data_src))
 		arm_spe__synth_memory_level(record, &data_src);
@@ -908,14 +911,14 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
 			data_src.mem_dtlb |= PERF_MEM_TLB_HIT;
 	}
 
-	return data_src.val;
+	return data_src;
 }
 
 static int arm_spe_sample(struct arm_spe_queue *speq)
 {
 	const struct arm_spe_record *record = &speq->decoder->record;
 	struct arm_spe *spe = speq->spe;
-	u64 data_src;
+	union perf_mem_data_src data_src;
 	int err;
 
 	/*

-- 
2.34.1


