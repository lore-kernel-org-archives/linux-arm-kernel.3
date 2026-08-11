Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B83DC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLrtzOE6JfG2/1H41zLGULod6PxsqgJ0B9NXXbgCKQM=; b=KAaXm7b1c8WjP5ek5YaAcFUL6f
	wQZnELHT1jMuznUXmH5Ek9Ysi9kPzOfbF3U0UVNV5vCEbIRZJ96dUfFbDNVSpLY0SCR62UUtNV4gG
	QPH3BdsEampTSp+ll7A1V3DUena66RGaQ7h9ncb0H79yxY5UNCa7e/WjF/SxowzsfXiQd08IwWHAf
	XNcT3Y9UwV+19eh3HkipwPEJI1W5p0UaighepvznCBpVxzsivvhZtL1rEROH3LdQbDDxKbyIGmSTY
	8BVU/hgTasHyiEvvXuntlIqTBdkL561iqF7zCUzV2b7Ch8Who96u3d8OAPbDlYw2ucx7NV9sTn5Lo
	9VgYS2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRa-0000000EKLn-0B8K;
	Tue, 11 Aug 2026 15:31:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRU-0000000EKGR-1fMP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:31:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so29276545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462262; x=1787067062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLrtzOE6JfG2/1H41zLGULod6PxsqgJ0B9NXXbgCKQM=;
        b=XVDW1s2iLUTL6HUSXjJ//9wFLhQP56Y1KQTS252CMt8EOL87ksoqOWrcf6cC6NE3wL
         zeliQPoxL0dnavhjHk7je9R6fo73X4dynvTb4yXXTkst1ftyTIuHTPPs7UodRBRA6WbB
         gtKAx/jIv5LiS7rddOtdR9g3eWiLrZpLbAM/cUw4Rn9bYVvHJbX9Ep8iCANzRb5g8WGy
         0mvWJM8qijPIGaVc9xIid/B1yYTACDpow0kbN1w4gLgsEI9ejyM8c+Sqop4QtCnXdu6T
         c+g0N6vUxJ+w42eEle7iOhNXhYAc9Tal1k+6v4RvCRy+fnc3ImDNx0o6BrlSIjkQeQAn
         m1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462262; x=1787067062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLrtzOE6JfG2/1H41zLGULod6PxsqgJ0B9NXXbgCKQM=;
        b=kukfR3k4jKop776mWE2rar71ChglZ8tDW/id8pa6Sw9nTo9L1JdWVFRZEijfKy7Omc
         e1XQWs2iI8EkOEjiLjx8w9eKDy5wSuPeXojBNhM8IrXZEubEaSbRmwZOOsyi/n7H8i6Q
         IB4h11VSQHgQ27GY0OzFDr+sslFE9rv0C0H+Y2j8A6rTY/4Y7Q7HzESgr1ifs6TkasD7
         gAkn/4ysP5Wuv5m72ncn5XtunktR3nC4/Ve2Pel/XtkSbx/2aViDhDLCcWFd6ipDZ5An
         MncrOBWBMhKsXWk/NP08LxAAktfaNDsqudKr7AX9Jghh4hFAydUtRHOHgoXRhKNiLNGR
         vvmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF2tE6IljG1/cV90at8lozqcCABD0rHg8whts4oo/H1mQU5sCqzxEQRXiXAVEyTxXxezlUa+IKO9ldOqqoYIUA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ECmWHyon13VxGKpsRD39YLsKRTbD/5IFnnBXDs4AT/VrzkqA
	Z+E9sSb0fyYNhFU1cH//jsSUiPP6gLVWi/8YUaJdDinV9OnoLN9yhHiy1hYbYmLm1rk=
X-Gm-Gg: AR+sD105U1kmup6SklbEXEmi/Vs/LIW1H6bkha2T5UuofU1ojD4urEVva1+659Jt9D/
	LQzZkGnWDl1nx+zXrlpU9xvroaUQlGm+qVA/tblBGg3lnhjhpFqFdmppJCgwFybXSX1qy84rcO5
	SXUqxU8E8PjuuPIbF8iAemBFRaTEs0s5J5Ppkf5y4AcusfOD0V2Pf/euyUbZlL4ydegyeHw/v4A
	JGkDdqCwPXJcELklCMPL1N6BnV1KWaUXk6+VJ/HsGUqiGMa0vd5eUxrSy9W7JukGbyEPXOrw64S
	2f8TCloLNlzNCUlSZJvTj56QDnCk5KedfkdlmSUQE0hdG86T8XLf/vb5z+6aa20K63k1BocK4Od
	dPlz9FmXOlMenhyCPOrG+6R9k/HeWRy6YdytwKrREVLeA7pG80Y4NCjlzYv3B+L+vKj9m+jI0OO
	KnAv5r2JU0kIb2X1lP4okVFD/FMUwMbiOUg42t7YO2Lcxgsab8O77nB9/Jd4hka/84
X-Received: by 2002:a05:600c:630e:b0:499:757f:a9ba with SMTP id 5b1f17b1804b1-49978463c2fmr54014135e9.9.1786462262497;
        Tue, 11 Aug 2026 08:31:02 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:31:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:12 +0100
Subject: [PATCH 09/14] perf cs-etm: Queue partial AUX records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-9-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
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
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_083105_613956_D1666280 
X-CRM114-Status: GOOD (  21.57  )
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
index 28f5ce63ba80..5bafee31cf4b 100644
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
@@ -3245,42 +3246,41 @@ static int cs_etm__queue_aux_fragment(struct perf_session *session, off_t file_o
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
-		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
+		file_offset += frag_start - auxtrace_start + auxtrace_event->header.size;
 
 		pr_debug3("CS ETM: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
-			  " tid: %d cpu: %d\n", aux_size, aux_offset, sample->tid, sample->cpu);
+			  " tid: %d cpu: %d\n", frag_size, frag_start, sample->tid, sample->cpu);
 		err = auxtrace_queues__add_event(&etm->queues, session, &auxtrace_fragment,
 						 file_offset, NULL);
 		if (err)
@@ -3320,6 +3320,7 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
+	bool found = false;
 
 	/* Don't care about any other events, we're only queuing buffers for AUX events */
 	if (event->header.type != PERF_RECORD_AUX)
@@ -3353,11 +3354,14 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
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
 
@@ -3365,8 +3369,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
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


