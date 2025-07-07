Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3252C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sdjrs/3jsZPTrcT5OG3EIMAV+BqCmSZ4SmrZQOT0HKU=; b=zL0BrzTdCP5zT6KOIhb/cQSQH9
	OdnSTD72OqYiuVaFlXxD+T2hY9vofD8qfvU09pbjDaERZ6s1sKz1+xJTIf4a1QP8tgMUXUpa3/0ck
	y+hmn1B4J02zazh+qkpJmklkrowVSq9al759kkgh9Xc+UGGpMspXeKKmpBRs+jyWP581x8MG01fII
	LFPwNEl8ACDOrGarFPLruOn7A6kuw5Ic7qywaVlYidGGTzJ3rPVQ6lf1VgQasJmuGt1Y8rhrVSP9c
	tDFxy6bq98NQ2FhSnN6462lLoAWQuR8D/hqB/7L9Ob5VKW086n375imBwiKezb6MPOkXfJtPysQCF
	h3oGOMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmG8-00000002cEU-3Rqo;
	Mon, 07 Jul 2025 13:51:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm4f-00000002Zva-1i3D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:40:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A3CC1BF7;
	Mon,  7 Jul 2025 06:39:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AACCD3F6A8;
	Mon,  7 Jul 2025 06:39:58 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 07 Jul 2025 14:39:26 +0100
Subject: [PATCH v3 04/14] perf arm_spe: Use full type for data_src
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-4-33ea82da3280@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751895589; l=3486;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3Wlv/TrIGUxYMz+ToB38HhhMfIfhIHq0nj0nUIDiOEk=;
 b=p8sp5jG7oAvNwphf+7dNR0fXhoC2GB4hHjgYdhTTIqbjfdXBgzOlQPKuOLSe6luySBmPSMfhV
 1FYLyLKUJivA5bWGAYmBv+2I5evwOYFV0qi7aLQMceTS6Eao+2mtRjn
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_064001_584891_02FF796A 
X-CRM114-Status: GOOD (  13.03  )
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
index 182e2c604ea49790a2f5341304ef1cd8217ea6a3..fec11322690ec156500335c86812f55b1bcfb4bb 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -471,7 +471,8 @@ arm_spe_deliver_synth_event(struct arm_spe *spe,
 }
 
 static int arm_spe__synth_mem_sample(struct arm_spe_queue *speq,
-				     u64 spe_events_id, u64 data_src)
+				     u64 spe_events_id,
+				     union perf_mem_data_src data_src)
 {
 	struct arm_spe *spe = speq->spe;
 	struct arm_spe_record *record = &speq->decoder->record;
@@ -486,7 +487,7 @@ static int arm_spe__synth_mem_sample(struct arm_spe_queue *speq,
 	sample.stream_id = spe_events_id;
 	sample.addr = record->virt_addr;
 	sample.phys_addr = record->phys_addr;
-	sample.data_src = data_src;
+	sample.data_src = data_src.val;
 	sample.weight = record->latency;
 
 	ret = arm_spe_deliver_synth_event(spe, speq, event, &sample);
@@ -519,7 +520,8 @@ static int arm_spe__synth_branch_sample(struct arm_spe_queue *speq,
 }
 
 static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
-					     u64 spe_events_id, u64 data_src)
+					     u64 spe_events_id,
+					     union perf_mem_data_src data_src)
 {
 	struct arm_spe *spe = speq->spe;
 	struct arm_spe_record *record = &speq->decoder->record;
@@ -542,7 +544,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 	sample.stream_id = spe_events_id;
 	sample.addr = record->to_ip;
 	sample.phys_addr = record->phys_addr;
-	sample.data_src = data_src;
+	sample.data_src = data_src.val;
 	sample.period = spe->instructions_sample_period;
 	sample.weight = record->latency;
 	sample.flags = speq->flags;
@@ -891,21 +893,22 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
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
@@ -919,14 +922,14 @@ static u64 arm_spe__synth_data_source(struct arm_spe_queue *speq,
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
 
 	arm_spe__sample_flags(speq);

-- 
2.34.1


