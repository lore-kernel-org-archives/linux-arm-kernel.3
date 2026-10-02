Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17F9CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEX84yZ8M+61/ijnKCtVAw4jIEHCAZ6K9y5ENa8GGEM=; b=li0Ua8aPuxvjHmA3aEqXm5+vGs
	KYzCjlK29L8xN52r9WNjpruok4M3st+s+OisYWGPE7Kuq9ziHjxjk7ouqhWr8HXhSsGw3s+14aX/5
	yeLnof/vQO58BQWHZHeVHy1Q0IJfK6xqiX0tmviC1pPbZdUUFaXR1iatK6GsSHLsJBBMb+pfrHRQH
	Z95nOewTtg0ptOa4VP1EpRFnfRkKKCJzwVu0ZZYTwIFukWT9EvyavSVcqmunD7PMSTaV2S7rCDCWj
	q1M7Vl18R4eTjaNDs8mPFHUgsfLx7HDeAZRIbkbsc8NGk10PTN3guLW8ms6nABofriIqb/pHm8rTH
	ZqW9hRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb41-0000000BQQz-01yO;
	Fri, 02 Oct 2026 11:04:29 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb3x-0000000BQNO-2tUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:04:26 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff72474fso36020975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939064; x=1791543864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEX84yZ8M+61/ijnKCtVAw4jIEHCAZ6K9y5ENa8GGEM=;
        b=qJTHqq8FU4iw7VrfVbkT47pfuQSRcTN0OeuNHydfmdwXg+2UaVheknaS4WHbPNoreN
         5oYbGyiuy5ySLUtQn5an2zaGEHZVRcd7ZnagOFPogn+p8Ph0+wFCu0700Nxh91Q0iIjt
         ceG/zbfGF1TfOiwUgxBVzXCn1TDg0g7nuWGn4ssuLBCE+ECqK3eAeLHDmEJc8XIxuqkI
         ezSP0gMjd9Pmlh/syoKvyMuIf8XxKTSdijmGfQbHrdnT/iUuX56pXQBCeaVT+I9o4y5J
         0Jp9VI6XRoH5Q3AzkomjJL7X9jrYASQKa6V6BcUITGa98i1D+GRCU6y+2s7WZZVGm0eG
         0w+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939064; x=1791543864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEX84yZ8M+61/ijnKCtVAw4jIEHCAZ6K9y5ENa8GGEM=;
        b=0Knj4tuUV1uaDgu4A6GAPSoPmkm+He+GI1zmH2RXGk/Ejn9sSqbl1kTEuUyMXJXaa9
         yzVNMIuQ0ka1nuo+F1k4wlg0Rfdnw9ychRhI0WAW7LVsk3OANEAijvlAMUiOHX+ZzIEm
         mHGUvva6XgRhKD/k/C47Zl01xgPfoPlnWdJeW2CBfd474vNnx82jpXSHdu9miAn2UoUx
         6+Gf069a837b2KW8tRIQ0zP/FfXSYRqnjcPdKcj5DHRDZlIZCzX8HglGEcl+phRUsxsn
         gTWLNiVxCJp0qXra2br27/zKdMesmlrNyHIHq+1eoyva8DMGWcNevI0cHo/6i1v92t5R
         Ghsg==
X-Forwarded-Encrypted: i=1; AKwUvBx/SIalk4vk3ywkDtZssHrXe9i2GJcey6r6/qiHFgcD5vdV7+qo+ZoJujAP4eqN4Tob7ttg3EUv0reCnZJSF+q3@lists.infradead.org
X-Gm-Message-State: AFuF++k2ofQIFoGCp31fDa8tkWthAsRlVKB/Mx9DqIKk226wSh7NZ2qW
	VKiA/SSEXBaDmRBAi8NFO9o36FLleC5ra7pimLLMFxpGsgSYPc5mPeeGrEy6Ihp8jv0=
X-Gm-Gg: AYBFou1OAfAnomFFsOCOBPDy6KASvVsE1KismJNVsJ2aFiQ8kixfkUBSwi4ek6IgRp8
	3yS8/HahHGGuzsB0quXWFzc3C2/MyHnCgYbk0rlqpwDn/02QLxTCcDg8CTFpZYgYDDxKyj4Sq/A
	VqgJvRy2NsgRUfb44ePCv3MH8CpLlSA+Cl0sooVmI51DBM7Clmoe/Lge34QYdz7Fu4gyRt4TY/z
	PfQrXEIe74PupfxOC8+JSAH4ZxUecDv9wYlQyOs4jAlUX8BujKbNsvlU6t+vY7hSiQLscDDvVaQ
	+rqzb2s/xh8XtMuTPAhz3S2dAu3gKjS4oP3YmZHWMoUl7BxIqikvaA7McJy+42CKcwo1828Cmpn
	LFbbzRmtSxLfjQ0q95IDXuQHHKNhhAMpjgfzWzpfM3Vc6KxYKu5eKbIDmp2cCIUHvJJEJkKorPn
	VxbbakhEI91gYvzj8KYFGih7y1mzwnN7qcQMz8+Mub+1ImMQjQ4Qc8M3S0mSrRC4LUqr/LIVjUU
	g==
X-Received: by 2002:a05:600c:4ecf:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a02769ceefmr45508665e9.24.1790939063651;
        Fri, 02 Oct 2026 04:04:23 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm75669465e9.9.2026.10.02.04.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:04:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 02 Oct 2026 12:03:55 +0100
Subject: [PATCH v2 3/4] perf cs-etm: Synthesize missing HW_ID mappings for
 raw trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-james-cs-hw_id-output-failure-v2-3-7a194aa61173@linaro.org>
References: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
In-Reply-To: <20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_040425_787469_2FC1E3C7 
X-CRM114-Status: GOOD (  25.24  )
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

From: Leo Yan <leo.yan@arm.com>

The CoreSight driver emits PERF_RECORD_AUX_OUTPUT_HW_ID via
perf_report_aux_output_id(). If the perf ring buffer is full,
perf_report_aux_output_id() can fail to emit the record and return
silently.

When at least one HW_ID record is present in the file, perf skips the
legacy metadata-only trace ID mapping path. Therefore any raw AUX queue
whose HW_ID record was dropped can be left with an empty traceid_list,
and cs_etm__create_queue_decoders() will not create a decoder for that
queue.

Fix it by ignoring all HW_IDs for unformatted queues and always create
one decoder per queue unconditionally. Trace ID is unused so we can hard
code it to 1 (0 is a special value used in
'pending_timestamp_chan_id' to indicate not pending). We also need put
the same trace ID in the CPU metadata because the relationship between
CPU metadata and traceid_list is bidirectional. Moving
cs_etm__metadata_set_trace_id() into the mapping function solves this
and simplifies existing code. cs_etm__insert_trace_id_node() now does
two things, so rename it to a more generic cs_etm__map_trace_id().

Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 85 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 27 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 78ae8443ac96..c0152549e3e2 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -243,8 +243,12 @@ enum cs_etm_pid_fmt cs_etm__get_pid_fmt(struct cs_etm_queue *etmq)
 	return etmq->etm->pid_fmt;
 }
 
-static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
-					u8 trace_chan_id, u64 *cpu_metadata)
+/*
+ * Add a traceid_list entry that maps a trace ID to a CPU metadata for this etmq
+ * and update the trace ID in the cpu_metadata.
+ */
+static int cs_etm__map_trace_id(struct cs_etm_queue *etmq, u8 trace_chan_id,
+				u64 *cpu_metadata)
 {
 	/* Get an RB node for this CPU */
 	struct int_node *inode = intlist__findnew(etmq->traceid_list, trace_chan_id);
@@ -289,8 +293,7 @@ static int cs_etm__insert_trace_id_node(struct cs_etm_queue *etmq,
 
 	/* Not one we've seen before, associate the traceID with the metadata pointer */
 	inode->priv = cpu_metadata;
-
-	return 0;
+	return cs_etm__metadata_set_trace_id(trace_chan_id, cpu_metadata);
 }
 
 static struct cs_etm_queue *cs_etm__get_queue(struct cs_etm_auxtrace *etm, int cpu)
@@ -314,12 +317,11 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 		return -EINVAL;
 
 	/*
-	 * If the queue is unformatted then only save one mapping in the
-	 * queue associated with that CPU so only one decoder is made.
+	 * Ignore HW_IDs for unformatted, a decoder will be made
+	 * unconditionally later.
 	 */
 	if (etmq->format == UNFORMATTED)
-		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
-						    cpu_metadata);
+		return 0;
 
 	/*
 	 * Otherwise, version 0 trace IDs are global so save them into every
@@ -332,8 +334,7 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 		if (!etmq || etmq->format == UNFORMATTED)
 			continue;
 
-		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id,
-						   cpu_metadata);
+		ret = cs_etm__map_trace_id(etmq, trace_chan_id, cpu_metadata);
 		if (ret)
 			return ret;
 	}
@@ -344,7 +345,6 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 static int cs_etm__process_trace_id_v0(struct cs_etm_auxtrace *etm, int cpu,
 				       u64 hw_id)
 {
-	int err;
 	u64 *cpu_data;
 	u8 trace_chan_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
 
@@ -352,22 +352,13 @@ static int cs_etm__process_trace_id_v0(struct cs_etm_auxtrace *etm, int cpu,
 	if (cpu_data == NULL)
 		return -EINVAL;
 
-	err = cs_etm__map_trace_id_v0(etm, trace_chan_id, cpu_data);
-	if (err)
-		return err;
-
-	/*
-	 * if we are picking up the association from the packet, need to plug
-	 * the correct trace ID into the metadata for setting up decoders later.
-	 */
-	return cs_etm__metadata_set_trace_id(trace_chan_id, cpu_data);
+	return cs_etm__map_trace_id_v0(etm, trace_chan_id, cpu_data);
 }
 
 static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int cpu,
 					 u64 hw_id)
 {
 	struct cs_etm_queue *etmq = cs_etm__get_queue(etm, cpu);
-	int ret;
 	u64 *cpu_data;
 	u32 sink_id = FIELD_GET(CS_AUX_HW_ID_SINK_ID_MASK, hw_id);
 	u8 trace_id = FIELD_GET(CS_AUX_HW_ID_TRACE_ID_MASK, hw_id);
@@ -375,6 +366,13 @@ static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int cpu,
 	if (!etmq)
 		return -EINVAL;
 
+	/*
+	 * Ignore HW_IDs for unformatted, a decoder will be made
+	 * unconditionally later.
+	 */
+	if (etmq->format == UNFORMATTED)
+		return 0;
+
 	/*
 	 * Check sink id hasn't changed in per-cpu mode. In per-thread mode,
 	 * let it pass for now until an actual overlapping trace ID is hit. In
@@ -419,13 +417,41 @@ static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int cpu,
 	if (!cpu_data)
 		return -EINVAL;
 
-	ret = cs_etm__insert_trace_id_node(etmq, trace_id, cpu_data);
-	if (ret)
-		return ret;
+	return cs_etm__map_trace_id(etmq, trace_id, cpu_data);
+}
 
-	ret = cs_etm__metadata_set_trace_id(trace_id, cpu_data);
-	if (ret)
-		return ret;
+static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
+{
+	struct auxtrace_queues *queues = &etm->queues;
+
+	for (unsigned int i = 0; i < queues->nr_queues; i++) {
+		struct auxtrace_queue *queue = &queues->queue_array[i];
+		struct cs_etm_queue *etmq = queue->priv;
+		u64 *cpu_data;
+		int ret;
+
+		if (list_empty(&queue->head) || !etmq || etmq->format != UNFORMATTED)
+			continue;
+
+		if (!intlist__empty(etmq->traceid_list)) {
+			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
+			return -EINVAL;
+		}
+
+		if (etm->per_thread_decoding)
+			cpu_data = etm->metadata[0];
+		else
+			cpu_data = get_cpu_data(etm, queue->cpu);
+
+		if (!cpu_data) {
+			pr_err("CS_ETM: Unformatted queue missing CPU metadata\n");
+			return -EINVAL;
+		}
+
+		ret = cs_etm__map_trace_id(etmq, 1, cpu_data);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -3757,6 +3783,11 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 			goto err_free_queues;
 	}
 
+	/* Create IDs for TRBE sinks so that a decoder is made for each one. */
+	err = cs_etm__map_unformatted_trace_ids(etm);
+	if (err)
+		goto err_free_queues;
+
 	err = cs_etm__create_decoders(etm);
 	if (err)
 		goto err_free_queues;

-- 
2.43.0


