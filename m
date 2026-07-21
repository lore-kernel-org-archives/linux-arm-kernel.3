Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4618C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqZBAMqGdvMYXC5CvSnJkck852YucWC1p1Gjno/LRjQ=; b=3Y4c9ScaqtnHwPeKWLNianzNPM
	3926rXa63L4sfsZqHcKGdi56xa7Al+6HhWgc+74xgt9qY94WHgy3my1DnI408W3Wv+3/7szBlhMDl
	GkP6u1ne3gKlGL/8umNmh6+U1hvrSNyiMFg+LOzAq3lnK8ADl4QPVLXIpgoI/Q/UEuEFrbw5UGMCT
	AU0FOi5yRy+v9PKPmhIWo4auWo/kia5TgQGhB6raLMx6dw64xv3w4UN+KmbnQXEmzxWveUwaYWHGV
	wcFpm/1V9U9pFMjf6F8/X+OJ+mnwLjLKzQwaq77EWHnHyyJR4oT6eY3KOKJ84CxqbRW/16ugWUfZm
	x3GA6mfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGDe-0000000AIIv-47Sy;
	Tue, 21 Jul 2026 19:33:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGDa-0000000AIHZ-2Sra
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:33:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BE8560A5E;
	Tue, 21 Jul 2026 19:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485571F000E9;
	Tue, 21 Jul 2026 19:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784662409;
	bh=WqZBAMqGdvMYXC5CvSnJkck852YucWC1p1Gjno/LRjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=x698D6SDsNesfslBPkGhF4kRYFtb+mNThpM8Hl7rGELlG1OmpWh1lR5MX1vHo2ooK
	 zX2Z206N2JBMTADX2SUqzeUt8xKPKNsPz1ewWLenScgw3DpjQmqml6Vai/KY1K6/pY
	 pccUvBJ+skTmGIhoOPGk+pRDmI+N/xDaO5uSKT7E=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Graham Woodward <graham.woodward@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	nd@arm.com,
	mike.leach@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Namhyung Kim <namhyung@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12 0434/1276] perf arm-spe: Correctly set sample flags
Date: Tue, 21 Jul 2026 17:14:37 +0200
Message-ID: <20260721152455.815215900@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721152446.065700225@linuxfoundation.org>
References: <20260721152446.065700225@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Graham Woodward <graham.woodward@arm.com>

[ Upstream commit edff8dad3f9a483259140fb814586b39da430a38 ]

Set flags on all synthesized instruction and branch samples.

Signed-off-by: Graham Woodward <graham.woodward@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Cc: nd@arm.com
Cc: mike.leach@linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Link: https://lore.kernel.org/r/20241025143009.25419-4-graham.woodward@arm.com
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Stable-dep-of: 059e9100d82a ("perf event: Fix size of synthesized sample with branch stacks")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/builtin-script.c |  1 +
 tools/perf/util/arm-spe.c   | 17 +++++++++++++++++
 tools/perf/util/event.h     |  1 +
 3 files changed, 19 insertions(+)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index a644787fa9e1dc..6f3db073786f96 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -1728,6 +1728,7 @@ static struct {
 	{PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_TRACE_END, "tr end"},
 	{PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_CALL | PERF_IP_FLAG_VMENTRY, "vmentry"},
 	{PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_CALL | PERF_IP_FLAG_VMEXIT, "vmexit"},
+	{PERF_IP_FLAG_BRANCH | PERF_IP_FLAG_BRANCH_MISS, "br miss"},
 	{0, NULL}
 };
 
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index ce34cc5a2e7163..a004e1721a1ff1 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -98,6 +98,7 @@ struct arm_spe_queue {
 	u64				timestamp;
 	struct thread			*thread;
 	u64				period_instructions;
+	u32				flags;
 };
 
 static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
@@ -392,6 +393,7 @@ static int arm_spe__synth_branch_sample(struct arm_spe_queue *speq,
 	sample.stream_id = spe_events_id;
 	sample.addr = record->to_ip;
 	sample.weight = record->latency;
+	sample.flags = speq->flags;
 
 	return arm_spe_deliver_synth_event(spe, speq, event, &sample);
 }
@@ -421,6 +423,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 	sample.data_src = data_src;
 	sample.period = spe->instructions_sample_period;
 	sample.weight = record->latency;
+	sample.flags = speq->flags;
 
 	return arm_spe_deliver_synth_event(spe, speq, event, &sample);
 }
@@ -432,6 +435,19 @@ static const struct midr_range common_ds_encoding_cpus[] = {
 	{},
 };
 
+static void arm_spe__sample_flags(struct arm_spe_queue *speq)
+{
+	const struct arm_spe_record *record = &speq->decoder->record;
+
+	speq->flags = 0;
+	if (record->op & ARM_SPE_OP_BRANCH_ERET) {
+		speq->flags = PERF_IP_FLAG_BRANCH;
+
+		if (record->type & ARM_SPE_BRANCH_MISS)
+			speq->flags |= PERF_IP_FLAG_BRANCH_MISS;
+	}
+}
+
 static void arm_spe__synth_data_source_common(const struct arm_spe_record *record,
 					      union perf_mem_data_src *data_src)
 {
@@ -618,6 +634,7 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
 	u64 data_src;
 	int err;
 
+	arm_spe__sample_flags(speq);
 	data_src = arm_spe__synth_data_source(speq, record);
 
 	if (spe->sample_flc) {
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index f8742e6230a5ab..2744c54f404e7b 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -66,6 +66,7 @@ enum {
 	PERF_IP_FLAG_VMEXIT		= 1ULL << 12,
 	PERF_IP_FLAG_INTR_DISABLE	= 1ULL << 13,
 	PERF_IP_FLAG_INTR_TOGGLE	= 1ULL << 14,
+	PERF_IP_FLAG_BRANCH_MISS	= 1ULL << 15,
 };
 
 #define PERF_IP_FLAG_CHARS "bcrosyiABExghDt"
-- 
2.53.0




