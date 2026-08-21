Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8872EC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VQqnhce33GsylOL+ZatKl0byJTqhAxHVQiF8A3WGaU=; b=mXJnrMu43MzoyYVukFD977U9OU
	KmRXeMjPSCbljd4ZY3pzyVWpref7EdWMCKulpHtBai3o4usxF4RcOl/kp357FzUVJXqF2Ss6xZtEe
	YYOpi+YXQCDjuQzypT6sPGy5BuYO6W88NOiKTwIQRL857SyUa1OKConb/zIp9KsufxhkHb6dJtafm
	3FLR2m+qYzuT23XnNKeotVyUHVu/YSmroIPQVgTiYGcz+ROpxVWKQ67mHezv0P2yMz3s8EpNlkQdX
	zCLTj/2IhJ8lr2l80DTUiOfeyMOT8kTNChAmUxYjjPxi71k+hFkI+3FyfyVTfZ3ORs2HfaBuPwjV9
	O1NQrgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLuP-0000000CyU7-35r7;
	Fri, 21 Aug 2026 09:51:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLte-0000000Cxwg-1O2Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:51:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47fd4531020so473567f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305845; x=1787910645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VQqnhce33GsylOL+ZatKl0byJTqhAxHVQiF8A3WGaU=;
        b=ituFeTQF8CWHihZMkcTE2lRxKO+Ro0PsfWG2Ruic8JTWi+2aRF57H9l1YV3j2m3l5u
         B3sc0L81Dp7KG0Y0/+eEWOMXAjbbRQSfC1gvDtNU7M9ekFENtKUgDRlHCqIrzd1BBxPW
         EhVQm8ORZUacjorvWF8ioziV0tdRqrbDhe9Ms0+/++gaXNo+zVyoT4VFvf7FE4GZnlmP
         fVqm2WEEhfNcRxx6cA+zp6eq+Fr+ixrtooUlTNfrWvNhGyLy51A5sBfhwkICk6lp1vML
         +xtvgvg7aVOxOefepOntbEKVSnUncGgOYf9IwwnIK8kPTvEXd2OFngfYnTZnYIqGdZI1
         yhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305845; x=1787910645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VQqnhce33GsylOL+ZatKl0byJTqhAxHVQiF8A3WGaU=;
        b=qQLQ3SLExr9WStUIO5WoCeCpp44nm2PNWl3pjRAnT/8hN/jrhO20porRsBOCi2cxE+
         xpnREldzK08fXqexQbW4WuZhczlEI0j62xa4Uqx14GYRh9aV74oxblAaZGWosAQrtylW
         OPknIvB1aupCrGfw+Rh1tHZeP63EawwKTColTbNkbXejiOwhqfdGPN+qaiQtKurJWWGi
         9czLofS6IPttctyIcQ41m9+GwgKt4NOz1Fym+lNwQcooFEKFL5GQM96fVt716BPhts22
         o3PgXEcJxKTZHI60FMM4oF+rhUEIwEI5OEPnrPndWJf+1TQNmRI8TnTEC2OowfiyVJJO
         prHQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5LZJDhbLfDubQbCCgDZn3nn7ctbpAc+dLeDkLpCMJtJCH27ryNFjI6INBIq0OYyvb9l2MYQFQKWDYA1reuhCr@lists.infradead.org
X-Gm-Message-State: AFuF++lCWKzNlb38wqqF/kGdbtl6e/WVSofXm9N0WSANkAMhnG/rCxAQ
	Zxs0nB37QMFyhLYQuB4JDszbyUsZ8s29ZhlaxpD7NNt7OO9yeY3MnOVgik7B3LtHwu8=
X-Gm-Gg: AR+sD10yq7RDw642WDI6yI6wBrB6IOd8aIuzMoO8VcWi7SLNE95fiBf+OwoEY408K+6
	D4Eme6wMXkFMCH95pRxmkb52F3xGYuHX6mLF46S1N2vZWVS/vHbKMaGZWcsii2+lnpE3tR+pBSZ
	rMXcjcNWYsV4UdY0YfVdzYb0QOluPvninNseZk/P+hEhbM7PFnSiBaNfDS1ozd+K1q1SLi1RGw9
	i9VoQakx8+RQV8Ne60hNsMnKVInx9M46YCbJajhDi4HtSZXRSOO7DQt7q/zW2LC4DUKy/LLZEFz
	BoPzVnxr5Dgdp3chg+Ggr3CgUnCMPZGUxI7ZaQEVvgF4isqYVWyxqbvs7ah6pBztLV2fzTAwC0d
	nbEOWZz/ZyV3TsZEkZHG9leNYiF1pMOLyu2J6N96SLjjNJYuzeTGArxVuGkMuz8O3d90q7nzchO
	AprE8+w2JE4t0TfEj9pctGYmxDXB3mOFHEVa+6EpGGHB7jBNhw7R34ylpMHHFKQu67
X-Received: by 2002:a05:6000:420c:b0:47f:eb5c:9b25 with SMTP id ffacd0b85a97d-482c0b83b3fmr6279797f8f.10.1787305844266;
        Fri, 21 Aug 2026 02:50:44 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm14474284f8f.26.2026.08.21.02.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:50:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:50:31 +0100
Subject: [PATCH 3/6] perf cs-etm: Synthesize missing HW_ID mappings for raw
 trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-hw_id-output-failure-v1-3-9d532ddabcc3@linaro.org>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
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
X-CRM114-CacheID: sfid-20260821_025049_251615_7553F19C 
X-CRM114-Status: GOOD (  16.98  )
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

Backfill missing mappings for non-empty UNFORMATTED queues whose trace
ID map is still empty after the HW_ID record scan. Real HW_ID mappings
remain preferred and are not overwritten in case someone is trying to
link what the kernel outputs to the raw trace dump.

Signed-off-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 44e20067da1f..dd15e91b7b38 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -427,6 +427,39 @@ static int cs_etm__process_trace_id_v0_1(struct cs_etm_auxtrace *etm, int cpu,
 	return 0;
 }
 
+static int cs_etm__synth_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
+{
+	struct auxtrace_queues *queues = &etm->queues;
+
+	for (unsigned int i = 0; i < queues->nr_queues; i++) {
+		struct auxtrace_queue *queue = &queues->queue_array[i];
+		struct cs_etm_queue *etmq = queue->priv;
+		u64 *cpu_data;
+		u8 trace_id;
+		int ret;
+
+		if (list_empty(&queue->head) || !etmq || etmq->format != UNFORMATTED)
+			continue;
+
+		if (!intlist__empty(etmq->traceid_list))
+			continue;
+
+		cpu_data = get_cpu_data(etm, queue->cpu);
+		if (!cpu_data)
+			return -EINVAL;
+
+		ret = cs_etm__metadata_get_trace_id(&trace_id, cpu_data);
+		if (ret)
+			return ret;
+
+		ret = cs_etm__insert_trace_id_node(etmq, trace_id, cpu_data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int cs_etm__metadata_get_trace_id(u8 *trace_chan_id, u64 *cpu_metadata)
 {
 	u64 cs_etm_magic = cpu_metadata[CS_ETM_MAGIC];
@@ -3801,6 +3834,16 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 			goto err_free_queues;
 	}
 
+	/*
+	 * Add fake IDs for any unformatted queues missing them. The IDs
+	 * themselves are only cosmetic in unformatted mode (raw dump output),
+	 * but a decoder won't be created if one was dropped and Perf can be
+	 * resilient to this.
+	 */
+	err = cs_etm__synth_unformatted_trace_ids(etm);
+	if (err)
+		goto err_free_queues;
+
 	err = cs_etm__create_decoders(etm);
 	if (err)
 		goto err_free_queues;

-- 
2.43.0


