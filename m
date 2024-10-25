Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F15D0C5FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFSMPYGbSk2+KX6VqwFkuHR0wQmgZgIFXlkicBYRgxE=; b=WJVEO4MkZsHVjII2zDmsKlb7QJ
	suhNjGgzQzsDZyV34m+1+V9IpV3rtZOi4g0XJXlcdmmMFMDU3HNrbzwrU0QsLAEQMFKX8sjAVuvW+
	O2b5DnI/CWx25kTZJxOqd0zpEtNYKTCjrlRaKAaQCtozUYk07qlQao04kFcYFLidSVu8sSIZ7Oe6M
	DRk5tzATBSAj0Gb/2zRyG5nXTxPWaFeoY52TRgq0EYiRFeCRs0RV55gFsix/GVpIOjr1aHO3ZFxr1
	+Uqg9OXBw4EHrTrK2b5PCfnTVrgEgfdeNcXqJQWHylVXBYxJNzEhw8Ok7OQmYqFIya+Bk4ZcVvZed
	AJpNRCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I8s-00000003SQd-33K1;
	Fri, 25 Oct 2024 11:06:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hvj-00000003Pue-3dnz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:52:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36979165C;
	Fri, 25 Oct 2024 03:53:01 -0700 (PDT)
Received: from VDW30FN91H.arm.com (unknown [10.57.79.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41D993F73B;
	Fri, 25 Oct 2024 03:52:29 -0700 (PDT)
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
Subject: [PATCH v10 3/4] perf arm-spe: Correctly set sample flags
Date: Fri, 25 Oct 2024 11:52:11 +0100
Message-Id: <20241025105212.51779-4-graham.woodward@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241025105212.51779-1-graham.woodward@arm.com>
References: <20241025105212.51779-1-graham.woodward@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_035232_067620_462C03F2 
X-CRM114-Status: GOOD (  10.44  )
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
index a644787fa..6f3db0737 100644
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
index d27500c53..830ab653f 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -96,6 +96,7 @@ struct arm_spe_queue {
 	u64				timestamp;
 	struct thread			*thread;
 	u64				period_instructions;
+	u32				flags;
 };
 
 static void arm_spe_dump(struct arm_spe *spe __maybe_unused,
@@ -376,6 +377,7 @@ static int arm_spe__synth_branch_sample(struct arm_spe_queue *speq,
 	sample.stream_id = spe_events_id;
 	sample.addr = record->to_ip;
 	sample.weight = record->latency;
+	sample.flags = speq->flags;
 
 	return arm_spe_deliver_synth_event(spe, speq, event, &sample);
 }
@@ -405,10 +407,24 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 	sample.data_src = data_src;
 	sample.period = spe->instructions_sample_period;
 	sample.weight = record->latency;
+	sample.flags = speq->flags;
 
 	return arm_spe_deliver_synth_event(spe, speq, event, &sample);
 }
 
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
 static const struct midr_range neoverse_spe[] = {
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
@@ -551,6 +567,7 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
 	u64 data_src;
 	int err;
 
+	arm_spe__sample_flags(speq);
 	data_src = arm_spe__synth_data_source(record, spe->midr);
 
 	if (spe->sample_flc) {
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index f8742e623..2744c54f4 100644
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


