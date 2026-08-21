Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C5C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05DUnskBW8qYusWX8ek9jHQJpSgnNnSpmQtWmqnHEBs=; b=SdwUFQhrj+XbOieyuO/X8B5+Ov
	KpkI5GfM4KWUXBDJVqdu7XeBdDwHKKSVebGZv94sJxmE2FKboUKWxAksTkU95OfXkwf9FlH4uuO4N
	zDagUcVLfCi3ajdwx6rrkyjXjbHTvVpCISlL+Wmqh5Yy1GeaGugXL3OyCuOC6EoNo1CAncZANESxE
	TxGsJ5e0ZnNt2Dved8I7OKbyiw0PH1OsVoVLy8tYUWBDFcBOAHygenwsW86LwPKb4iaPr91FRB9+E
	LuJJMNALvh8Eg66lHYgt3vKHMqPqq/+iTN6Mm3u/1+Z1OyLwaOj3mZoRmR5DFTO1W1Bh5RNvRGgyT
	EcDC7Y8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLuS-0000000CyVH-1W0M;
	Fri, 21 Aug 2026 09:51:36 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtj-0000000Cxzy-028Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:51:05 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f904e80eeso679546f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305849; x=1787910649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05DUnskBW8qYusWX8ek9jHQJpSgnNnSpmQtWmqnHEBs=;
        b=obfyZRZF/p25QJwjEb6/gpb8vJCvbeNNIFlNjxZXbfgetjVr6tJtJE0QFrDlcpbTxk
         VBezKZC0pa69jakMDi6XJ5Y3sVbefTHAgGb2dJAhOmu50rDwe+D0vKc7VZ5j6wFD739C
         Zf8GObqHeB4nyAMjBjj0C+KQ24hewwrvdF8Jj5srHEtEiP7tIIGsStj61Oiy2TP/eC+O
         lea4bkDW5zpo13n0tKa5Er7SeaeKSYV21boVK5/kHzIWNBCGuVWqgvZ7907C70qQUv56
         XbCPqYVF3cP3QT/Qq9QBTwH+6dbCTnmi+GPCXY4BREWZhFx9dmcs8bJIU3kZGg4k7trk
         f6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305849; x=1787910649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05DUnskBW8qYusWX8ek9jHQJpSgnNnSpmQtWmqnHEBs=;
        b=my5N0djJLbwQPpwrWX4+FNfi7keND92xDGBNcJkXTfXX17s9LcO3PcrGBJVaSsONqr
         A0WuW2oseKsFQpBktjkpd6rwLEe8ljQuxUiGI0EyN0EJA+XEV8Y20Cz2ctC927YMxE3I
         0M2cOhYHlw+osAPYh2rZ6wjhU2PNKEdsXfzZgxmYFl35s7Wzn11cD1v2pY3uCZhO5I8c
         ab5Wi2KvSx2sGueeXiuGehmPlglUBrxD5Z1BLGz+DYKKMUEBMBTt++NlKViNL1AqpIl0
         R2XUn/PZmE0TGiOr/0C4Vk4r2xnmtO7TyglywVJsGUaIoiSf5/9z8XD3HRqXMS6bUs/x
         HdLw==
X-Forwarded-Encrypted: i=1; AHgh+RpUYgeAZMvfg6a1cRs5VMEvnafWGgk8wREv9jxMNBa78clhWwVw53HAU9cqLb0mWvJy6sT2E2euppwv5x7bXsoL@lists.infradead.org
X-Gm-Message-State: AFuF++mYoYl5rhvzF0cWcc6pMuvB7+xJfBfEoc5FBCacrzKQUun+Cxoo
	Wq8Lhvq91pXCBzer7dmTCo/6ewMeaosbdft8Bo3Gc5WwAvRTPUDV2tEideTnRUcZJDE=
X-Gm-Gg: AR+sD11u/JvZkWW4reg+VN+99X5nXOkenqNNAmd9YEV0DYdxnzxqUHYdN/QWCEQqbeg
	jbHvJNeMk7jPVBH2E5Hhp/ssB4+v0hKQEt04dVbsVOuEjy+DJ7SxZnBLPmxzxHp2EKi0Yl/cFW7
	Vt8JI5RX/kY/D9zxatfkpOo7lWcSpwItJpMG2bmHCsR09w96d13S1wIPo2Qb6D69y94sCYneImd
	hVLrlyPFt5OaRhsAzTgmJvFJDgI6h/yRQYjY3XkV4ttthQdkZvWqri2vEjyjIFRypNCCJeSEVwV
	h5XTYMn8GB0YeCXOf0SBN428gu/OtUmbHycDx0k0cSXv2XhElWk0I/d2kpdBtVDQBHh5Q6/t3MI
	769qDvhXMasOGlgDaIFMGwsfS5NXNF5KPYDkuJbX0A4gM6fWtzCnRGTH5IlJIbrWZIiwIjHYQ1m
	G5YLRoiDywfGNREIKNHptVDOX9nwSqZ/MDGZAK9Y23fYK3sW1nm9BUEH9if8qDngKK
X-Received: by 2002:a05:6000:4811:b0:47f:6f9e:1e82 with SMTP id ffacd0b85a97d-482c0b4ef34mr8274865f8f.9.1787305848760;
        Fri, 21 Aug 2026 02:50:48 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm14474284f8f.26.2026.08.21.02.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:50:48 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:50:34 +0100
Subject: [PATCH 6/6] coresight: perf: Retry failed HW_ID writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-hw_id-output-failure-v1-6-9d532ddabcc3@linaro.org>
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
X-CRM114-CacheID: sfid-20260821_025051_085253_E8E3A2CF 
X-CRM114-Status: GOOD (  19.05  )
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

Don't set the aux_hwid_done bit when writes fail so that it can be
retried later if the ring buffer was full.

Add a second attempt on stop in case this session only has one call
to start. Otherwise there is no chance to retry and it isn't fixed by
not setting aux_hwid_done.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 52 +++++++++++++++---------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..0ffc5cd9c88f 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -536,6 +536,31 @@ static int etm_event_resume(struct coresight_path *path)
 	return ret;
 }
 
+static void etm_output_hw_id(struct perf_event *event,
+			     struct etm_event_data *event_data,
+			     struct coresight_path *path,
+			     struct coresight_device *sink)
+{
+	int cpu = smp_processor_id();
+	u64 hw_id;
+
+	/*
+	 * output cpu / trace ID in perf record, once for the lifetime
+	 * of the event.
+	 */
+	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
+		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
+				CS_AUX_HW_ID_MAJOR_VERSION);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
+				CS_AUX_HW_ID_MINOR_VERSION);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
+
+		if (!perf_report_aux_output_id(event, hw_id))
+			cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
+	}
+}
+
 static void etm_event_start(struct perf_event *event, int flags)
 {
 	int cpu = smp_processor_id();
@@ -544,7 +569,6 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *source, *sink;
 	struct coresight_path *path;
-	u64 hw_id;
 
 	if (flags & PERF_EF_RESUME) {
 		path = etm_event_get_ctxt_path(ctxt);
@@ -596,22 +620,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (coresight_enable_source(source, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
-	/*
-	 * output cpu / trace ID in perf record, once for the lifetime
-	 * of the event.
-	 */
-	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
-		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
-
-		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
-				CS_AUX_HW_ID_MAJOR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
-				CS_AUX_HW_ID_MINOR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
-
-		perf_report_aux_output_id(event, hw_id);
-	}
+	etm_output_hw_id(event, event_data, path, sink);
 
 out:
 	/* Tell the perf core the event is alive */
@@ -630,7 +639,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	 */
 	if (READ_ONCE(handle->event)) {
 		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
-		perf_aux_output_end(handle, 0);
+		perf_aux_output_end(path->handle, 0);
 	}
 fail:
 	event->hw.state = PERF_HES_STOPPED;
@@ -679,6 +688,7 @@ static void etm_event_pause(struct coresight_path *path,
 		if (!size)
 			return;
 
+		etm_output_hw_id(event, event_data, path, sink);
 		perf_aux_output_end(handle, size);
 		perf_aux_output_begin(handle, event);
 	} else {
@@ -769,10 +779,12 @@ static void etm_event_stop(struct perf_event *event, int mode)
 		 * But we should never get a non-zero size with
 		 * an invalid handle.
 		 */
-		if (READ_ONCE(handle->event))
+		if (READ_ONCE(handle->event)) {
+			etm_output_hw_id(event, event_data, path, sink);
 			perf_aux_output_end(handle, size);
-		else
+		} else {
 			WARN_ON(size);
+		}
 	}
 
 	/* Disabling the path make its elements available to other sessions */

-- 
2.43.0


