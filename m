Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07F0CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDiCsNiASZRs1sKdsqhg3S3zKatA5gJu2ktHoc9OyZw=; b=ggR5lYxhpvV8IPKLy/tyTFYdOa
	RV3mwnI/hqfER6SN2gbbtDjb2OjReN/KH2SWmDVAoCYF+bPH2OPwXDMjSfceZGjP9IYxBKdSYLQCV
	P7fL0CH3L6BKK3uKFx4ARzTJuR35alJUbn4ubNGL4ldM4H+LhKoaj0UiaFbI0ZNTVqw7QZwvqiJ0s
	RsS1vxAJeaKQfRHZ8e+4OdpmdmfheXHe4XFrGL/htRc9YUcWrmlsbPj8YX99IChKBiLWnVBQDbGin
	b8Wrf9dB3h9lyM4DheaSbneAJBeGFIr2wjSEO4naTARUi8Yn/AQ9AccfBRnInZi839oKphHDrv6iq
	PhEeParw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLV-000000010Q9-2tDi;
	Mon, 08 Sep 2025 17:08:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvahn-0000000GvAQ-2aE1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:10:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3dae49b117bso3769992f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 05:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333442; x=1757938242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDiCsNiASZRs1sKdsqhg3S3zKatA5gJu2ktHoc9OyZw=;
        b=CdE6hedu1T7QT0haOtzsW25w/y5Lp+DZ/iP4ONzRHArQ/LbFCR9LJfacuLn91skPn8
         2N6C3607u8VnmwyzZl2JBfzwy3SlZ3qF3HM7smCK6BOYyGxj0aiFk58EeLFK+6CcSCd4
         9TBFUgJrWic8wxiIEJHsp9EEe94GXK1aavSEPMmAJqM9bQPs9s6x4T5KMc8DJXkCEQin
         IGdg4ggNsLbm34hUJJVdUHpb5megnDCLy8d7P76lHbEVum5DBZWhQlhcGhJf1prwhA/S
         Tvg+1vMqqucrGe6VyA962r0JKWPHcc7VQC6oHgFuJG7eqfzBHdduzV6zO5X2SDd1MGtm
         ECeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333442; x=1757938242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDiCsNiASZRs1sKdsqhg3S3zKatA5gJu2ktHoc9OyZw=;
        b=UYz9NMDy5HtgPx/h41VFsk1q+PEnyEgoWlOl4XHWps6Whcxh7gQKAr1h678cyrEz2I
         wIrTGcD9ai4yuVo2hGHl6AbBHK383YNy2VKcryCSGA/76dAWhGBUJBv5HoT5DF/ZtZwm
         fxovgvHwAws6apsTvmD3NV92A/zFfCikHAKud6plZ8NHTPU+16QMmo+ToQQn+4wPx8kp
         0Bh/aaBEPpThqramekLHk51LXObqS1a+tauZfS4/2MbhvVqNJtbgLdeg15lgXwVGnDF1
         RKWjvT9kz8YnaacCbKyXZxjooCMH+XGF4AjslsshTjh9XWqJDOm28B8JiIfzCqDo9z/W
         a7+Q==
X-Gm-Message-State: AOJu0YyxvQsLYJWcLcm/w6XHlznBY3MVLAVAJ2uwhfSzzDOWiTrCmxCq
	hQytfBCBHeNYQbEVA4Yv2XxGZhVje9qFZyn9uJOG3jf9RCQf0mrF4WCc0dyIgJC0qAc=
X-Gm-Gg: ASbGncvV9oV7UzJ2ze1nhD/EkqD9w1Of4wlqmB7sRRJZHsIG33vTlEoLHMJbbHwl6GE
	S9MKNe0ptV+syxuYlVZYxobPqLBJuN5nHhAJ81Lhe3LNNptuufbGOR4V7JChyhXi59+Ub1dGLSm
	vf3ysJ7TjYDzrURjTGPVQE0i5MBgcLWNAPD/UoiozvAf9ys0Ai/+jKCd+PcRZdViJU5mD5oVq62
	6qvv0uFGHT25CWx9em8TPhAxW1hDfKBkK4cxokiyiY8marRAzuwutlsddS291TXOaut1LEa/UNb
	f0X81NlOQq+sPdZ9B3pfP/BTlacbexmh+lOlmx04JNquYUpJXgWKCa4pArF7hZ3yLLEdVKxre6U
	u72FqGvEX2pDcrWWsiunHmx7/JjMKwuDV3QbDSACIQA==
X-Google-Smtp-Source: AGHT+IGup4M0n2CrqLFC4Hs6XW/mujDw6sj7WjnSz4nJ6/Xw6zsOjT1bf160w3/O739Ldk3nE+fTew==
X-Received: by 2002:a05:6000:178e:b0:3ca:4b59:2715 with SMTP id ffacd0b85a97d-3e642da55b8mr5784667f8f.20.1757333441854;
        Mon, 08 Sep 2025 05:10:41 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fba9fbsm41397825f8f.50.2025.09.08.05.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:10:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Sep 2025 13:10:19 +0100
Subject: [PATCH 2/4] perf arm-spe: Downsample all sample types equally
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-james-perf-spe-period-v1-2-7ccd805af461@linaro.org>
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
In-Reply-To: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, George Wort <George.Wort@arm.com>, 
 Graham Woodward <Graham.Woodward@arm.com>, Ben Gainey <Ben.Gainey@arm.com>, 
 Michael Williams <Michael.Williams@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_051043_661180_B1B3B751 
X-CRM114-Status: GOOD (  22.86  )
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

The various sample types that are generated are based on the same SPE
sample, just placed into different sample type bins. The same sample can
be in multiple bins if it has flags set that cause it to be.

Currently we're only applying the --itrace interval downsampling to the
instruction bin, which means that the sample would appear in one bin but
not another if it was skipped due to downsampling. I don't thing anyone
would want or expect this, so make this behave consistently by applying
the downsampling before generating any sample.

You might argue that the "instructions" interval type doesn't make sense
to apply to "memory" sample types because it would be skipping every n
memory samples, rather than every n instructions. But the downsampling
was already not an instruction interval even for the instruction
samples. SPE has a hardware based sampling interval, and the instruction
interval was just a convenient way to specify further downsampling. This
is hinted at in the warning message shown for intervals greater than 1.

This makes SPE diverge from trace technologies like Intel PT and Arm
Coresight. In those cases instruction samples can be reduced but all
branches are still emitted. This makes sense there, because branches
form a complete execution history, and asking to skip branches every n
instructions doesn't really make sense. But for SPE, as mentioned above,
downsampling the instruction samples already wasn't consistent with
trace technologies so we ended up with some middle ground that had no
benefit. Now it's possible to reduce the volume of samples in all groups
and samples won't be missing from one group but present in another.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index b33a0a170ef8..4c81518a033a 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -62,7 +62,6 @@ struct arm_spe {
 	u8				sample_remote_access;
 	u8				sample_memory;
 	u8				sample_instructions;
-	u64				instructions_sample_period;
 
 	u64				l1d_miss_id;
 	u64				l1d_access_id;
@@ -101,7 +100,7 @@ struct arm_spe_queue {
 	u64				time;
 	u64				timestamp;
 	struct thread			*thread;
-	u64				period_instructions;
+	u64				sample_count;
 	u32				flags;
 	struct branch_stack		*last_branch;
 };
@@ -228,7 +227,6 @@ static struct arm_spe_queue *arm_spe__alloc_queue(struct arm_spe *spe,
 	speq->pid = -1;
 	speq->tid = -1;
 	speq->cpu = -1;
-	speq->period_instructions = 0;
 
 	/* params set */
 	params.get_trace = arm_spe_get_trace;
@@ -352,7 +350,7 @@ static void arm_spe_prep_sample(struct arm_spe *spe,
 	sample->cpumode = arm_spe_cpumode(spe, sample->ip);
 	sample->pid = speq->pid;
 	sample->tid = speq->tid;
-	sample->period = 1;
+	sample->period = spe->synth_opts.period;
 	sample->cpu = speq->cpu;
 	sample->simd_flags = arm_spe__synth_simd_flags(record);
 
@@ -527,14 +525,6 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 	struct perf_sample sample;
 	int ret;
 
-	/*
-	 * Handles perf instruction sampling period.
-	 */
-	speq->period_instructions++;
-	if (speq->period_instructions < spe->instructions_sample_period)
-		return 0;
-	speq->period_instructions = 0;
-
 	perf_sample__init(&sample, /*all=*/true);
 	arm_spe_prep_sample(spe, speq, event, &sample);
 
@@ -543,7 +533,6 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 	sample.addr = record->to_ip;
 	sample.phys_addr = record->phys_addr;
 	sample.data_src = data_src;
-	sample.period = spe->instructions_sample_period;
 	sample.weight = record->latency;
 	sample.flags = speq->flags;
 	sample.branch_stack = speq->last_branch;
@@ -929,6 +918,14 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
 	u64 data_src;
 	int err;
 
+	/*
+	 * Discard all samples until period is reached
+	 */
+	speq->sample_count++;
+	if (speq->sample_count < spe->synth_opts.period)
+		return 0;
+	speq->sample_count = 0;
+
 	arm_spe__sample_flags(speq);
 	data_src = arm_spe__synth_data_source(speq, record);
 
@@ -1628,6 +1625,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
 	attr.exclude_guest = evsel->core.attr.exclude_guest;
 	attr.sample_id_all = evsel->core.attr.sample_id_all;
 	attr.read_format = evsel->core.attr.read_format;
+	attr.sample_period = spe->synth_opts.period;
 
 	/* create new id val to be a fixed offset from evsel id */
 	id = evsel->core.id[0] + 1000000000;
@@ -1754,8 +1752,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
 
 		spe->sample_instructions = true;
 		attr.config = PERF_COUNT_HW_INSTRUCTIONS;
-		attr.sample_period = spe->synth_opts.period;
-		spe->instructions_sample_period = attr.sample_period;
+
 		err = perf_session__deliver_synth_attr_event(session, &attr, id);
 		if (err)
 			return err;

-- 
2.34.1


