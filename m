Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0904CC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLPGCt4Z2rnGiWCr3RwF/7TLVu4WTyiGBE7+q4fWYws=; b=aXwbf70nQE3pNo3IIUpe9youfq
	AwWto2DL+BxmfEq+EmWepBgTyM+8aoTP6BDzWj3RrbR6iIEJHJANToXNIh3bwSiJjqgM7fzh45ey7
	kE2oha+noi2CHM7Ads2fnGo0JiZABBjmSBV29/GPOeJnaT5QG4qZegpfhZN8B9LHtC37VoEWweGc0
	wd+JT3WQLaudQU8CzCigR6F4Is0OGpHJhPNta/yX1/9bBmWKWr7ASmkqZp3U5X3Nz48GS8LPmPv5C
	j8Hnjnfwu9TQjoc16Aaif7P3iDZ0M543bYOs7ZNpSJc0V6zGXZGN2sGGpi5l7ivSEhVZfvk2BsmRN
	j1Mz8okA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtD-0000000CxcF-2G0T;
	Fri, 21 Aug 2026 09:50:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsb-0000000Cx1r-1ewl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f6609c657so375041f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305779; x=1787910579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLPGCt4Z2rnGiWCr3RwF/7TLVu4WTyiGBE7+q4fWYws=;
        b=ZMxO4ONTcfDD6o5qJIQv/3aAVWtdo9bx6KDgjBinbj/ezQ1jtIkjmVoctRe+c4BLed
         EsxNitxts9o0y5Bk0HglBgNokoJUQdRexEx1uFeMgbOWkeqlOm8OPOCIaq1W4/tkJ6bu
         StotX4eM4/vtghCBv9TzYJAWVp/E7QPkoevQveRfbonQiTRpKNCPx0dhfucW8OacgKYd
         XkOfZHVQCeiXVACdP2j7KAo+bAOdfJUz+RTykanfFUgGEI1tcC+5Y7m9xAVyk/K7XB7y
         qOnqmrQxM2EuTsMGf14Y+fP5fjTv4R1xt9h8wdg3V5jbuvpAN6owBdSJb2S4JelE2B2o
         9WIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305779; x=1787910579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLPGCt4Z2rnGiWCr3RwF/7TLVu4WTyiGBE7+q4fWYws=;
        b=ifXKV7Au7guWEdquHNmPqeAauoRjuag6AVUmuqgoXFrKdGaMYxDa2nr6NWHERJrrEs
         HiMbSwTDcnBaaG1+g3py1PaP8MN2S1Gyfjry/OrWKRxXyTFkh45EZ27NYmT1rb02CCvv
         D27FmFEm41vtmLEvC5wHaJ8rJGzI2S71BpvXZjnOLfisIjej091SmwncRpwfu284u7A3
         gYYNKm7GykEga7aj9IJDIsvvpgiFz/LRLrsnwrxf2PFuhJG7YzQ1CdDtrdiEY3CDXd6M
         sJOXq4SItk0U5ZSqJMnGA+eR4NOh/UzoFgj5HnX7UTUGLapguV0+FmuidcN/1Wd04bXZ
         bXBA==
X-Forwarded-Encrypted: i=1; AHgh+RrENWzE3WXJvY3WtQDbTdrZ7PElN39pe7AlmTEVCJgfgzVssR064Ml6ipyjVVG/sNYDgxcRid0ZdjwK8M17CPks@lists.infradead.org
X-Gm-Message-State: AFuF++kiCrmLJRBF7HGtnOOAF9lHUP3M4RJEJXA1FnpEU+jx4CfmWT4q
	mXIxgfAqPLa8v9V1KMuzNmqzT64SGi8Ccc9D5TSkLFTfmRr5Q0NUHa+MyjiVIvAu6rI=
X-Gm-Gg: AR+sD11rc/zeivUZCciESdZtgl4gYXZRyrc41noRdednX4GXWtnUjMbkDaqaOjrgPwF
	0UEKvwNsVYUf4WlsEvpYuV3H5QLcr5TzLRb42tRUi1NzaHXEfLXfiohLjl4a5eaiu/jkcMRQFR9
	dtVSQTo6wF7Ahv4JmIgjsD5iggWpoXrC4SnfWwmwvRNyPzNK/UbMYoawqGCB+pnQ+KeCsVIhdac
	QEqxPuelmlyiUb5Xo7e8idJWvGeNBntr0poP10z8H57e6jxtLs6qSg8W7vaFM/RIBqfqOWXoOhA
	eS0TZOxey5FOM2vjDFSOaC7h0cK2lvBi8E1Rq0tdpdIygQ2pYUOIyUemT9/4Prcp+Cg7D1l8Le5
	88R+JHIFgKbw7XYGgezbsvbNyK2cg1MQ8WDRA2Y+ip0+OkonkpudaJek7TDB3d1Taqk1WGn0kah
	GAPw34F12zBbQeQAKljKw3Lp2h47r4WF4vIOcsqQ/WiDZYA0n3MZoipU0oWfBr2orx
X-Received: by 2002:a05:6000:4b1b:b0:482:bb55:8bda with SMTP id ffacd0b85a97d-482c0b5bf64mr7702886f8f.5.1787305778190;
        Fri, 21 Aug 2026 02:49:38 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:07 +0100
Subject: [PATCH v2 09/14] perf cs-etm: Queue partial AUX records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-9-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024941_474858_CC0BF6BF 
X-CRM114-Status: GOOD (  21.65  )
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

In snapshot mode AUX records may straddle the boundary of multiple trace
buffers. Currently we only queue AUX records whose range is contained
wholly within a single buffer.

Fix it by queuing any partial AUX range that overlaps any buffer.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 54 +++++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index ccf886efff95..d1eb4ec17bbd 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3197,7 +3197,8 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	union perf_event *auxtrace_event_union;
 	struct perf_record_auxtrace *auxtrace_event;
 	union perf_event auxtrace_fragment;
-	__u64 aux_offset, aux_size;
+	__u64 aux_start, aux_end, auxtrace_start, auxtrace_end;
+	__u64 frag_start, frag_end, frag_size;
 	enum cs_etm_format format;
 
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
@@ -3245,43 +3246,42 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
 	}
 
 	if (aux_event->flags & PERF_AUX_FLAG_OVERWRITE) {
-		/*
-		 * Clamp size in snapshot mode. The buffer size is clamped in
-		 * __auxtrace_mmap__read() for snapshots, so the aux record size doesn't reflect
-		 * the buffer size.
-		 */
-		aux_size = min(aux_event->aux_size, auxtrace_event->size);
-
 		/*
 		 * In this mode, the head also points to the end of the buffer so aux_offset
 		 * needs to have the size subtracted so it points to the beginning as in normal mode
 		 */
-		aux_offset = aux_event->aux_offset - aux_size;
+		aux_start = aux_event->aux_offset - aux_event->aux_size;
+		aux_end = aux_event->aux_offset;
 	} else {
-		aux_size = aux_event->aux_size;
-		aux_offset = aux_event->aux_offset;
+		aux_start = aux_event->aux_offset;
+		aux_end = aux_event->aux_offset + aux_event->aux_size;
 	}
 
-	if (aux_offset >= auxtrace_event->offset &&
-	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
+	auxtrace_start = auxtrace_event->offset;
+	auxtrace_end = auxtrace_start + auxtrace_event->size;
+	frag_start = max(aux_start, auxtrace_start);
+	frag_end = min(aux_end, auxtrace_end);
+
+	if (frag_start < frag_end) {
 		struct cs_etm_queue *etmq = cs_etm__get_queue(etm, sample->cpu);
 
 		if (!etmq)
 			return -EINVAL;
 
 		/*
-		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
-		 * based on the sizes of the aux event, and queue that fragment.
+		 * If this AUX event overlaps this buffer, create a new auxtrace event
+		 * for the overlapping range and queue that fragment.
 		 */
+		frag_size = frag_end - frag_start;
 		auxtrace_fragment.auxtrace = *auxtrace_event;
-		auxtrace_fragment.auxtrace.size = aux_size;
-		auxtrace_fragment.auxtrace.offset = aux_offset;
+		auxtrace_fragment.auxtrace.size = frag_size;
+		auxtrace_fragment.auxtrace.offset = frag_start;
 		auxtrace_fragment.auxtrace.idx = etmq->queue_nr;
 		auxtrace_fragment.auxtrace.cpu = etmq->queue_nr;
-		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
+		file_offset += frag_start - auxtrace_start + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
-			  " tid: %d cpu: %d\n", aux_size, aux_offset, sample->tid, sample->cpu);
+			  " tid: %d cpu: %d\n", frag_size, frag_start, sample->tid, sample->cpu);
 		err = auxtrace_queues__add_event(&etm->queues, session, &auxtrace_fragment,
 						 file_offset, NULL);
 		if (err)
@@ -3321,6 +3321,7 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
+	bool found = false;
 
 	/* Don't care about any other events, we're only queuing buffers for AUX events */
 	if (event->header.type != PERF_RECORD_AUX)
@@ -3354,11 +3355,14 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 			ret = cs_etm__queue_aux_fragment(session, ent->file_offset,
 							 ent->sz, &event->aux, &sample);
 			/*
-			 * Stop search on error or successful values. Continue search on
-			 * 1 ('not found')
+			 * Stop search on error values. Continue search on
+			 * 1 ('not found') or 0 ('queued')
 			 */
-			if (ret != 1)
+			if (ret < 0)
 				goto out;
+
+			if (!ret)
+				found = true;
 		}
 	}
 
@@ -3366,8 +3370,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * Couldn't find the buffer corresponding to this aux record, something went wrong. Warn but
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
-	pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-	       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+	if (!found) {
+		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+	}
 	ret = 0;
 out:
 	perf_sample__exit(&sample);

-- 
2.43.0


