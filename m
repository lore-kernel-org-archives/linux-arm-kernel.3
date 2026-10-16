Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC376CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTf2dyjD3kUgeu76x/83E5vQe2hucK0qQ9DL5CxdIj0=; b=lxYwmLQX5R17PzDudHFKCyEE9r
	d8cC3xMaZPGoFPmCa/mZVoM8cVdORsc8vTEQuJRUqj93OuIuFMxa4H1UJPjxO2JNLKru5hSZGaeka
	2DZsoYwlFNCRi9MQbNBsPiBxVe8uDQSHvNZxaLWu39L/0OSecbxL21KnDx0VMhrGJyAkt0W0ZmOXo
	lzCcRF8tgNpqK0iBFGuqU1Ii25a8V+Qhsw88lkds8r79xyNDB6+6iQ3g5JD1gbqRvyAoWB8nZAgp5
	7IZavXIWtT3djxwlB2TvHRARQblm2fbswx79+Dfeqta/ZUIoZVvNaO221xC73yRqtuJM3XtDzjbWF
	1HNkP9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSi-00000002hl9-2Vkx;
	Fri, 16 Oct 2026 10:46:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSZ-00000002hcW-0LOm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso26808435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147605; x=1792752405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTf2dyjD3kUgeu76x/83E5vQe2hucK0qQ9DL5CxdIj0=;
        b=IaW3YRjzjQ0NDZBAxZdlWRiXrWhjU3MBP78qe0e7MUzzfhjOxAI+m4N3O0PZ0J08My
         JpmJYf/P7DXRYkYw9pMRQ27I8FUb0M6St2A2X+AoG6OMdT0VC7kiA8btZZxcBxBKGCXi
         olxSP3JKDSz17giQM+Ml0JNDRJSZCDjMwAC2sButWD2PsgTBtmAO3ak6fD4HbZxaN2cS
         CnbkvebohWXzxFmR2jZpwoIXdmr6WB++15JXJTCvkdU7iTAmr0ifBYnLL+mEzEEoXWxN
         hHlhu28ohIahidZoSTyDaTjDsmOaOT7cFmmkmLfBR+vaiT+OedUT2cEqdaq0TV3K7tuD
         TUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147605; x=1792752405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTf2dyjD3kUgeu76x/83E5vQe2hucK0qQ9DL5CxdIj0=;
        b=q4bx/0l4PGx9xngUERSV+Trl9OhRlEiGFyb0ukE9ayQdq2jrJ0DCW4Dt3iRKtYdfQr
         fRbWGMQVmBt3mq5AH+KXPGryYKDAExa0itTnbIyqCZ1k7Meofp0xlBSuugzsnhGDLdpC
         IgDpgIIh2KUJGRo+JNlkRRoyyS70Z+eO7NYN8MNIPBXHbvhzjX1PxENHuastGkNl+F4a
         TOGgNzRb4B9H9PMt4vX2EWbDufVPq4gAuXY6BY/wRh9yQ83XTwCdICNdPsl/3X7qBCnQ
         /iP2UbDBK0lIaSi8CPetPtcLs5QurE0uPQwGe47b6l8HnazbOjoTNSiEn+1GhOB5WrSw
         gaqA==
X-Forwarded-Encrypted: i=1; AKwUvBwOQ+ybTdMEPiOjTAmwaXDX0OImcRLbYke3JPHRAirglbEJ5MxQ2o/8zi1y91DfGTCHq1DFZIAOgmMep59+0UPU@lists.infradead.org
X-Gm-Message-State: AFq9FYKgNeCjIDF8r8UqtHo2TcRp5QuNBY3sCySZNxq5EmdIKdrAep0z
	KtsrIOrw1fMDnvPJX0Oi8xIZ0hKFc5x0DRuBzmnssfwO3Xvm47T0As4+m39lU40U/N4=
X-Gm-Gg: AYBFou1vtdjTWBxpwqP395LsdnHCnTy9wsspW0s1xEyTxABncHlMNtipwOX+DhVntqE
	Iaovwn6S7BPgFRy+ZcdHrcaH/W5GloqVEhgGbKlYqNdUtorHFGT3gN4VW+6QwXmiBdNm3P6m51Q
	rIHoe/FcY/hHolWScL+NWu/gf1aoNbPvKyplp4U8I9h0UDWqUcFLrK6s9O3gsw/Nn64v4nML/Ac
	O6DVtVyHbnD7l45mtDGijQTXgKkBFdeOyYRTAnw/LkMwcIIUg2fO179Q0VB01JQ60bWkPc5RDPp
	vIv8w9ug4Da16fXbDVcbGBL/HqhGH3sEkc7BgYLxouWgvyMyeCoXH9tg9+h2UINy6xo4jXpaYyQ
	ps/R/Ku1b7ig2A2BM8ICxegogPnFA+FB5ddnKNEdC7P2A9Jtt1sjHg1PGO/I5N6/kAKmf1YozZC
	XgPyxO0gz+XGlmbxKWtwD9c5w6jExF1oL+k4BVy67a4SwuuKER6I71UnCxwRDXUYO4Dzpi85rp2
	Q==
X-Received: by 2002:a05:600c:a016:b0:4a1:a44d:1d5 with SMTP id 5b1f17b1804b1-4a1a44d0221mr286210265e9.9.1792147605311;
        Fri, 16 Oct 2026 03:46:45 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:14 +0100
Subject: [PATCH v4 04/10] coresight: etm-perf: Reject event if building
 path fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-4-dedf961aca0e@linaro.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_034647_207680_E9390834 
X-CRM114-Status: GOOD (  34.18  )
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

etm_event_build_path() silently skips error cases to support opening
cpu=-1 events on all CPUs when a system might not have reachable sinks
or ETMs for every CPU. In the next commit we want to reject the event
if invalid sharing on any sink is detected, so propagate errors.

This means that things like failed memory allocations when building the
path and invalid aux pause options now reject the event which is
probably an improvement.

Keep the silent skips for things that make sense like missing ETMs and
sinks.

Previously, _coresight_build_path() used -ENODEV both when no route to
the sink existed and when coresight_grab_device() could not acquire a
device or helper on a found route. Return -ENOENT exclusively for the
unreachable case, and retain -ENODEV for device acquisition failures,
such as a missing driver or failure to take a module reference.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 22 ++++++---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 61 +++++++++++++-----------
 2 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c05d657cde73..a635c51c25ac 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -980,6 +980,9 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
  * From there the sink is added to the list along with all the devices that led
  * to that point - the end result is a list from source to sink. In that list
  * the source is the first device and the sink the last one.
+ *
+ * Return: 0 on success, -ENOENT if the sink is unreachable, or another error
+ * if path construction fails.
  */
 static int _coresight_build_path(struct coresight_device *csdev,
 				 struct coresight_device *source,
@@ -996,10 +999,10 @@ static int _coresight_build_path(struct coresight_device *csdev,
 
 	if (coresight_is_percpu_source(csdev) && coresight_is_percpu_sink(sink) &&
 	    sink == per_cpu(csdev_sink, csdev->cpu)) {
-		if (_coresight_build_path(sink, source, sink, path) == 0) {
-			found = true;
-			goto out;
-		}
+		ret = _coresight_build_path(sink, source, sink, path);
+		if (ret)
+			return ret;
+		goto out;
 	}
 
 	/* Not a sink - recursively explore each port found on this element */
@@ -1011,15 +1014,20 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		if (coresight_blocks_source(source, csdev->pdata->out_conns[i]))
 			continue;
 
-		if (child_dev &&
-		    _coresight_build_path(child_dev, source, sink, path) == 0) {
+		if (!child_dev)
+			continue;
+
+		ret = _coresight_build_path(child_dev, source, sink, path);
+		if (!ret) {
 			found = true;
 			break;
 		}
+		if (ret != -ENOENT)
+			return ret;
 	}
 
 	if (!found)
-		return -ENODEV;
+		return -ENOENT;
 
 out:
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index faec4c7bb83d..a9adf1cca7a8 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -334,32 +334,30 @@ static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
 	return path;
 }
 
-static struct coresight_path *
-etm_event_build_path(struct perf_event *event, int cpu,
-		     struct coresight_device *user_sink,
-		     struct coresight_device *match_sink)
+static int etm_event_build_path(struct perf_event *event, int cpu,
+				struct coresight_device *user_sink,
+				struct coresight_device *match_sink,
+				struct coresight_path **path)
 {
-	struct coresight_path *path = NULL;
 	struct coresight_device *source, *sink;
-	int ret;
+	int ret = 0;
 
+	*path = NULL;
 	source = coresight_get_percpu_source_ref(cpu);
 
-	/*
-	 * If there is no ETM associated with this CPU or ever we try to trace
-	 * on this CPU, we handle it accordingly.
-	 */
+	/* Silently skip CPUs without a loaded ETM. */
 	if (!source)
-		return NULL;
+		return 0;
 
 	/*
 	 * If AUX pause feature is enabled but the ETM driver does not
-	 * support the operations, skip for this source.
+	 * support the operations, reject the whole event.
 	 */
 	if (event->attr.aux_start_paused &&
 	    (!source_ops(source)->pause_perf ||
 	     !source_ops(source)->resume_perf)) {
 		dev_err_once(&source->dev, "AUX pause is not supported.\n");
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -380,30 +378,34 @@ etm_event_build_path(struct perf_event *event, int cpu,
 		 * trace on a CPU if the sink is not compatible.
 		 */
 
-		/* Find the default sink for this ETM */
+		/* Silently skip ETMs with no reachable sink loaded */
 		sink = coresight_find_default_sink(source);
 		if (!sink)
 			goto out;
 
-		/* Check if this sink compatible with the last sink */
+		/* Silently skip sinks incompatible with the last sink. */
 		if (match_sink && !sinks_compatible(match_sink, sink))
 			goto out;
 	}
 
 	/*
-	 * Building a path doesn't enable it, it simply builds a
-	 * list of devices from source to sink that can be
-	 * referenced later when the path is actually needed.
+	 * Build path, but don't enable. Skip CPUs that cannot reach the sink.
+	 * Reject the whole event on other path construction errors.
 	 */
-	path = coresight_build_path(source, sink);
-	if (IS_ERR(path))
+	*path = coresight_build_path(source, sink);
+	if (IS_ERR(*path)) {
+		ret = PTR_ERR(*path);
+		if (ret == -ENOENT)
+			ret = 0;
+		*path = NULL;
 		goto out;
+	}
 
-	/* ensure we can allocate a trace ID for this CPU */
-	ret = coresight_path_assign_trace_id(path, CS_MODE_PERF);
+	/* Reject whole event if we can't allocate a trace ID for this CPU */
+	ret = coresight_path_assign_trace_id(*path, CS_MODE_PERF);
 	if (ret) {
-		coresight_release_path_locked(path);
-		path = NULL;
+		coresight_release_path_locked(*path);
+		*path = NULL;
 		goto out;
 	}
 
@@ -411,7 +413,7 @@ etm_event_build_path(struct perf_event *event, int cpu,
 
 out:
 	coresight_put_percpu_source_ref(source);
-	return IS_ERR_OR_NULL(path) ? NULL : path;
+	return ret;
 }
 
 static void *etm_setup_aux(struct perf_event *event, void **pages,
@@ -448,15 +450,16 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 
 	/*
 	 * Setup the path for each CPU in a trace session. We try to build
-	 * trace path for each CPU in the mask. If we don't find an ETM
-	 * for the CPU or fail to build a path, we clear the CPU from the
-	 * mask and continue with the rest. If ever we try to trace on those
-	 * CPUs, we can handle it and fail the session.
+	 * trace path for each CPU in the mask. Skip CPUs without an ETM, without
+	 * a compatible default sink, or unable to reach the selected sink by
+	 * clearing them from the mask. Other errors reject the whole event.
 	 */
 	for_each_cpu(cpu, mask) {
 		struct coresight_path *path;
 
-		path = etm_event_build_path(event, cpu, user_sink, sink);
+		if (etm_event_build_path(event, cpu, user_sink, sink, &path))
+			goto err;
+
 		if (!path) {
 			/*
 			 * Failed to create a path for the CPU, clear it from

-- 
2.43.0


