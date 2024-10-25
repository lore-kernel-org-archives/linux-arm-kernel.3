Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402E3D1039A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbhZe6MgsrlhOerwOxFpcmlM5W55/8Yi/4PZKnBE+GI=; b=affBM+gSMYJSMwzg967JzUk4mY
	L5g2jLJgRcJbyYoVBIEEZrNUJgAh3WEvvIMMkk/7rZuoH1pvX77TosDs564be+oY18FX9v/xosZBo
	pG6xFHO2RqD1fKFTBD74QvVzI8+E/bzjnrt7FVVYY32mtIvVxGIJ2eY+EteuS1YqGJePU6melpFi2
	cXTGWUsni36U9xgQ9DI/fU3Pme1Lhv0LXaZmvSV/gHjQ8xfa/nQYUWWAe7bMkOBo9Uu7rJwv/my5+
	Cdfw12Gg9kID4tXqaKX4PkP+b9qwwDEVAMCHH9vK+iEIZcInSRHNoykwqSHkvLtpD6jnHFa0U8BTN
	NCCpmwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mkc-00000004LA4-1RiU;
	Fri, 25 Oct 2024 16:01:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LL9-000000041PC-3nij
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:31:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 835B9497;
	Fri, 25 Oct 2024 07:31:28 -0700 (PDT)
Received: from VDW30FN91H.arm.com (unknown [10.57.79.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 873E53F73B;
	Fri, 25 Oct 2024 07:30:56 -0700 (PDT)
From: Graham Woodward <graham.woodward@arm.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	irogers@google.com,
	james.clark@linaro.org,
	mike.leach@linaro.org,
	leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	Graham Woodward <graham.woodward@arm.com>
Subject: [PATCH v1 3/4] perf arm-spe: Correctly set sample flags
Date: Fri, 25 Oct 2024 15:30:08 +0100
Message-Id: <20241025143009.25419-4-graham.woodward@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241025143009.25419-1-graham.woodward@arm.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073100_158121_C20171A2 
X-CRM114-Status: GOOD (  10.94  )
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

Set flags on all synthesized instruction and branch samples.

Signed-off-by: Graham Woodward <graham.woodward@arm.com>
---
 tools/perf/builtin-script.c |  1 +
 tools/perf/util/arm-spe.c   | 17 +++++++++++++++++
 tools/perf/util/event.h     |  1 +
 3 files changed, 19 insertions(+)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 8c5d5cecfba4..6b6d4472db6e 100644
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
index e60e21d24735..a291a412f6a1 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -100,6 +100,7 @@ struct arm_spe_queue {
 	u64				timestamp;
 	struct thread			*thread;
 	u64				period_instructions;
+	u32				flags;
 };
 
 static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
@@ -394,6 +395,7 @@ static int arm_spe__synth_branch_sample(struct arm_spe_queue *speq,
 	sample.stream_id = spe_events_id;
 	sample.addr = record->to_ip;
 	sample.weight = record->latency;
+	sample.flags = speq->flags;
 
 	return arm_spe_deliver_synth_event(spe, speq, event, &sample);
 }
@@ -423,6 +425,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 	sample.data_src = data_src;
 	sample.period = spe->instructions_sample_period;
 	sample.weight = record->latency;
+	sample.flags = speq->flags;
 
 	return arm_spe_deliver_synth_event(spe, speq, event, &sample);
 }
@@ -440,6 +443,19 @@ static const struct midr_range common_ds_encoding_cpus[] = {
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
@@ -622,6 +638,7 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
 	u64 data_src;
 	int err;
 
+	arm_spe__sample_flags(speq);
 	data_src = arm_spe__synth_data_source(speq, record);
 
 	if (spe->sample_flc) {
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index f8742e6230a5..2744c54f404e 100644
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
2.40.1


