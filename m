Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C593C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CY+rs44ezsoqCf+zSHc3qwuNBN0MX7jIIsAKSmQ5hac=; b=5AmPkxjpXTP0Jiv6uKIhTs4P5L
	laIXGrfgcx9Er76rG1kAJeZXfrvn1/G9xNs/vSZOvexG48QV/ogjPfn0arfzd2Qd02cCqRqYGzXDk
	pGj4sHjJBttUMf/iBIwLrlaPO//WD7jSFnga6mQ9fZOV07hZzdAX8hHUPUik1AjSokVEivUvGpapz
	SNjXOjJgs883cII6wGQZZzg1YXhNnxrZoKWAWWx2qL7ydKbustSwGsK+qx7s7Do0a8oBKN3tNOIHN
	gTvCA/5OEJ8AZ/Wo72SzIF2CIiZunPfp6rkwQ/ET/hhRo3uA/HF9xg6WcC7k+Y9pz70j1j1yLXfY+
	hIry6RGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPn-00000007I1B-3Ctn;
	Tue, 15 Sep 2026 15:49:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPk-00000007Hvk-0MbD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D91EA15A1;
	Tue, 15 Sep 2026 08:49:39 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 101303F882;
	Tue, 15 Sep 2026 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487383; bh=5dh0uFLLLCouP6+OkfA97GnOOv7HsvkRRHLYhRReAf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NPKnQfwwyvGRJkLdxdOuc4DOxZn0cS2zl3Sh37gf6CPZnWQVn7czhkpqTqTfXIIhU
	 JB69zI4H+zsQf4n/MUf8QXe97FeYiUEKeIhccYslYxwQU7bNrv2YPlL6KVTqMJvFcz
	 HZltalMaNQCuhZf4jlVtVXZe8eglNsAlvLmM/sKQ=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:01 +0100
Subject: [PATCH 15/25] coresight: perf: Serialize AUX pause and resume with
 event stops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-15-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=7280;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=5dh0uFLLLCouP6+OkfA97GnOOv7HsvkRRHLYhRReAf8=;
 b=J1K+IWYMMLhzPcADLZNzQcjitD4TM/hnwUjyZeGWvamWNJUNExstCLAeZGNbjXw+P25hWod0G
 tcZpp4WVbX/BxhjEK9GOI09oVf8Z0ykXyeXAaZvljMidgM4vmEkRub3
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084944_220075_F29DBF9A 
X-CRM114-Status: GOOD (  22.10  )
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

A PMU NMI can throttle a group during an AUX pause or resume, stopping
its CoreSight event before the callback finishes. The callback can then
restart tracing or reopen an AUX output handle after teardown.

Use per-CPU atomic STOP and AUX bits to serialize these callbacks. Reject
AUX operations while a stop is pending and defer stops until an active
AUX operation finishes. Complete deferred stops through etm_event_stop()
and set PERF_HES_STOPPED only after disabling the source and path.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 104 ++++++++++++++++++-----
 1 file changed, 84 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 8f803914e9abfb18e080ff68371ad8b32042f180..8020a4d8af18bb669441824cfdb687f4fa299eb4 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -4,6 +4,7 @@
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
 
+#include <linux/atomic.h>
 #include <linux/bitfield.h>
 #include <linux/coresight.h>
 #include <linux/coresight-pmu.h>
@@ -26,6 +27,9 @@
 #include "coresight-syscfg.h"
 #include "coresight-trace-id.h"
 
+#define ETM_PERF_ACT_STOP		BIT(0)
+#define ETM_PERF_ACT_AUX		BIT(1)
+
 static struct pmu etm_pmu;
 static bool etm_perf_up;
 
@@ -46,6 +50,7 @@ static bool etm_perf_up;
 struct etm_ctxt {
 	struct perf_output_handle handle;
 	struct etm_event_data *event_data;
+	atomic_t action;
 };
 
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
@@ -531,33 +536,69 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	goto out;
 }
 
-static int etm_event_resume(struct etm_ctxt *ctxt)
+static void etm_event_stop(struct perf_event *event, int mode);
+
+static bool etm_event_aux_begin(struct perf_event *event, struct etm_ctxt *ctxt)
+{
+	int action;
+
+	/* Claim exclusive access for the AUX operation */
+	action = atomic_fetch_or(ETM_PERF_ACT_AUX, &ctxt->action);
+	if (action & ETM_PERF_ACT_AUX)
+		return false;
+
+	/* Leave an existing stop to finish its own work */
+	if ((action & ETM_PERF_ACT_STOP) ||
+	    (READ_ONCE(event->hw.state) & PERF_HES_STOPPED)) {
+		atomic_fetch_andnot(ETM_PERF_ACT_AUX, &ctxt->action);
+		return false;
+	}
+
+	return true;
+}
+
+static void etm_event_aux_end(struct perf_event *event, struct etm_ctxt *ctxt)
+{
+	int action;
+
+	/* Complete any stop deferred while the AUX operation was active */
+	action = atomic_fetch_andnot(ETM_PERF_ACT_AUX, &ctxt->action);
+	if (action & ETM_PERF_ACT_STOP)
+		etm_event_stop(event, PERF_EF_UPDATE);
+}
+
+static int etm_event_resume(struct perf_event *event, struct etm_ctxt *ctxt)
 {
 	struct perf_output_handle *handle = &ctxt->handle;
-	struct perf_event *event = handle->event;
 	struct coresight_device *source;
 	struct coresight_path *path;
-	int ret;
+	int ret = 0;
 
-	if (!perf_get_aux(handle))
+	if (!etm_event_aux_begin(event, ctxt))
 		return 0;
 
+	if (!perf_get_aux(handle))
+		goto out;
+
 	path = etm_event_get_ctxt_path(ctxt);
 	if (!path)
-		return 0;
+		goto out;
 
 	source = coresight_get_source(path);
 	if (!source)
-		return 0;
+		goto out;
 
 	ret = coresight_resume_source(source);
 	if (ret < 0) {
 		dev_err(&source->dev, "Failed to resume ETM event.\n");
-		return ret;
+		goto out;
 	}
 
 	etm_event_clear_hw_state(event, PERF_HES_UPTODATE);
-	return 0;
+
+out:
+	etm_event_aux_end(event, ctxt);
+	return ret;
 }
 
 static void etm_event_start(struct perf_event *event, int flags)
@@ -571,7 +612,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	u64 hw_id;
 
 	if (flags & PERF_EF_RESUME) {
-		WARN_ON_ONCE(etm_event_resume(ctxt));
+		WARN_ON_ONCE(etm_event_resume(event, ctxt));
 		return;
 	}
 
@@ -697,18 +738,22 @@ static void etm_event_update_buffer(struct perf_event *event,
 static void etm_event_pause(struct perf_event *event,
 			    struct etm_ctxt *ctxt)
 {
-	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
+	struct coresight_path *path;
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *source, *sink;
 	struct etm_event_data *event_data;
 
-	if (!path)
+	if (!etm_event_aux_begin(event, ctxt))
 		return;
 
+	path = etm_event_get_ctxt_path(ctxt);
+	if (!path)
+		goto out;
+
 	source = coresight_get_source(path);
 	sink = coresight_get_sink(path);
 	if (WARN_ON_ONCE(!source || !sink))
-		return;
+		goto out;
 
 	/* Stop tracer */
 	coresight_pause_source(source);
@@ -720,7 +765,7 @@ static void etm_event_pause(struct perf_event *event,
 	 * disallows updating buffer for the per CPU sink case.
 	 */
 	if (coresight_is_percpu_sink(sink))
-		return;
+		goto out;
 
 	event_data = READ_ONCE(ctxt->event_data);
 	etm_event_update_buffer(event, handle, event_data, sink,
@@ -728,6 +773,9 @@ static void etm_event_pause(struct perf_event *event,
 
 	/* Prepare the handle for resuming trace */
 	perf_aux_output_begin(handle, event);
+
+out:
+	etm_event_aux_end(event, ctxt);
 }
 
 static void etm_event_stop(struct perf_event *event, int mode)
@@ -738,13 +786,28 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct coresight_path *path;
 	struct hw_perf_event *hwc = &event->hw;
 	struct etm_event_data *event_data;
+	int action;
+
+	if (mode & PERF_EF_PAUSE) {
+		etm_event_pause(event, ctxt);
+		return;
+	}
 
 	/* If we're already stopped, then nothing to do */
 	if (READ_ONCE(hwc->state) & PERF_HES_STOPPED)
 		return;
 
-	if (mode & PERF_EF_PAUSE)
-		return etm_event_pause(event, ctxt);
+	/* Leave STOP pending until the AUX operation releases its action bit */
+	action = atomic_fetch_or(ETM_PERF_ACT_STOP, &ctxt->action);
+	if (action & ETM_PERF_ACT_AUX)
+		return;
+
+	/*
+	 * A repeated throttling stop must not interrupt an active teardown.
+	 * PERF_EF_UPDATE lets the AUX callback complete a deferred stop.
+	 */
+	if ((action & ETM_PERF_ACT_STOP) && !(mode & PERF_EF_UPDATE))
+		return;
 
 	path = etm_event_get_ctxt_path(ctxt);
 
@@ -754,7 +817,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	 */
 	if (!path) {
 		etm_event_set_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
-		return;
+		goto out;
 	}
 
 	event_data = READ_ONCE(ctxt->event_data);
@@ -764,18 +827,19 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	source = coresight_get_source(path);
 	sink = coresight_get_sink(path);
 	if (!source || !sink)
-		return;
+		goto out;
 
 	/* stop tracer */
 	coresight_disable_source(source, event);
 
-	/* tell the core */
-	etm_event_set_hw_state(event, PERF_HES_STOPPED);
-
 	etm_event_update_buffer(event, handle, event_data, sink, mode);
 
 	/* Disabling the path make its elements available to other sessions */
 	coresight_disable_path(path);
+	etm_event_set_hw_state(event, PERF_HES_STOPPED);
+
+out:
+	atomic_fetch_andnot(ETM_PERF_ACT_STOP, &ctxt->action);
 }
 
 static int etm_event_add(struct perf_event *event, int mode)

-- 
2.34.1


