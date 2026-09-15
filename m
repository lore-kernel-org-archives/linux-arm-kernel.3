Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93D0C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KeYUluMtzFYSXJTQp9i4TMwQ5Lt1qtWgwKsflWOdFE=; b=cCnXe0Rds6DqtUY2hrD6pYJMPz
	SVAgY32YAPmGcvtiUUw6QPbjQnPEWnRdeCUVZYeK0SDMFcv9cj6ktpzj8s/yIzO9CbvzngGS5Trro
	fgJZFNa4qvZH8T0bNKPLty+tdJPphdim0le1PitLFkk1FhvcWs0wGdcaKanee/VnTncoObH5WB+LK
	4ofPuV3bUWj/WtRrTO7mbW61v7h8PoqWG5Y3DHADL8TnnCXVD8Y4x9XPo0/PRbahnY6NMfsrOPxa6
	5AdEqBfG79XEWuUykj8eMIjm34QhFLVXDRYRDp88aFORj4/4oF1qBb/1UAi3K9dr7aMMZT4iVRRPd
	BadBZt6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPm-00000007HyD-2WnO;
	Tue, 15 Sep 2026 15:49:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPU-00000007HkM-2ux2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E028F15A1;
	Tue, 15 Sep 2026 08:49:23 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 229A83F882;
	Tue, 15 Sep 2026 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487367; bh=rSmwIpwuvnASQCteerBDAoK6QsAT2ln4DSbDM8NGx7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u5/U1E4kC6AOfMVaxUM1Dh4bG3DO2xy3+8RPwPoZH4EorcEjaCYSbEOFe2EVTuDo8
	 0DZl+d4vXE9oePpQBr6Sd1ZgfW9VotmwE5s0dHnjf0ST15tZcRiRWJagUJw6RfylQA
	 8/f/LYek8KOkef2+j/TgCxRHGMyYQs+sRBjSfp44=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:55 +0100
Subject: [PATCH 09/25] coresight: perf: Improve hardware state transitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=6635;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rSmwIpwuvnASQCteerBDAoK6QsAT2ln4DSbDM8NGx7Y=;
 b=vsdmreUTHLDwTaeZP7/Tk39n2e+TAz6DWM3agImbAdzf58+mzWRlwQ/T0gTHPnn9CQ5F7sot2
 HY5nZtwkM/ZDfLIELo/MVzngBKkSmaZRbfojoAwycyRw2nmOCmxr/PA
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084928_876132_86D1E070 
X-CRM114-Status: GOOD (  18.19  )
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

Keep hw.state consistent with event activation and AUX buffer updates.
Initialize events as stopped and up to date, clear both flags after a
successful start, and set UPTODATE after committing an AUX buffer
update. On resume, clear UPTODATE only on success. Preserve state on
resume failure and ignore duplicate stops.

Add helpers for setting and clearing state bits. Use READ_ONCE() and
WRITE_ONCE() to prevent compiler merging or refetching of state
accesses.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 58 ++++++++++++++++--------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index e3c9d3cf84c502f357a430bc3bfa854a776618f1..f66c99b26e1862ab04105704276c901b21728207 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -150,6 +150,20 @@ etm_event_cpu_path(struct etm_event_data *data, int cpu)
 	return *etm_event_cpu_path_ptr(data, cpu);
 }
 
+static inline void etm_event_set_hw_state(struct perf_event *event, int mask)
+{
+	struct hw_perf_event *hwc = &event->hw;
+
+	WRITE_ONCE(hwc->state, READ_ONCE(hwc->state) | mask);
+}
+
+static inline void etm_event_clear_hw_state(struct perf_event *event, int mask)
+{
+	struct hw_perf_event *hwc = &event->hw;
+
+	WRITE_ONCE(hwc->state, READ_ONCE(hwc->state) & ~mask);
+}
+
 static void etm_event_read(struct perf_event *event) {}
 
 static int etm_addr_filters_alloc(struct perf_event *event)
@@ -520,6 +534,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 static int etm_event_resume(struct etm_ctxt *ctxt)
 {
 	struct perf_output_handle *handle = &ctxt->handle;
+	struct perf_event *event = handle->event;
 	struct coresight_device *source;
 	struct coresight_path *path;
 	int ret;
@@ -536,10 +551,13 @@ static int etm_event_resume(struct etm_ctxt *ctxt)
 		return 0;
 
 	ret = coresight_resume_source(source);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(&source->dev, "Failed to resume ETM event.\n");
+		return ret;
+	}
 
-	return ret;
+	etm_event_clear_hw_state(event, PERF_HES_UPTODATE);
+	return 0;
 }
 
 static void etm_event_start(struct perf_event *event, int flags)
@@ -553,8 +571,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	u64 hw_id;
 
 	if (flags & PERF_EF_RESUME) {
-		if (etm_event_resume(ctxt) < 0)
-			goto fail;
+		WARN_ON_ONCE(etm_event_resume(ctxt));
 		return;
 	}
 
@@ -583,7 +600,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	 */
 	if (!cpumask_test_cpu(cpu, &event_data->mask)) {
 		perf_aux_output_end(handle, 0);
-		event->hw.state = 0;
+		etm_event_clear_hw_state(event, PERF_HES_STOPPED);
 		return;
 	}
 
@@ -621,7 +638,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	}
 
 	/* Tell the perf core the event is alive */
-	event->hw.state = 0;
+	etm_event_clear_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
 	/* Save the event_data for this ETM */
 	WRITE_ONCE(ctxt->event_data, event_data);
 	return;
@@ -639,11 +656,12 @@ static void etm_event_start(struct perf_event *event, int flags)
 		perf_aux_output_end(handle, 0);
 	}
 fail:
-	event->hw.state = PERF_HES_STOPPED;
+	etm_event_set_hw_state(event, PERF_HES_STOPPED);
 	return;
 }
 
-static void etm_event_update_buffer(struct perf_output_handle *handle,
+static void etm_event_update_buffer(struct perf_event *event,
+				    struct perf_output_handle *handle,
 				    struct etm_event_data *event_data,
 				    struct coresight_device *sink,
 				    int mode)
@@ -668,6 +686,7 @@ static void etm_event_update_buffer(struct perf_output_handle *handle,
 		size = sink_ops(sink)->update_buffer(sink, handle,
 						     event_data->snk_config);
 		perf_aux_output_end(handle, size);
+		etm_event_set_hw_state(event, PERF_HES_UPTODATE);
 		return;
 	}
 
@@ -704,7 +723,8 @@ static void etm_event_pause(struct coresight_path *path,
 		return;
 
 	event_data = READ_ONCE(ctxt->event_data);
-	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
+	etm_event_update_buffer(event, handle, event_data, sink,
+				PERF_EF_UPDATE);
 
 	/* Prepare the handle for resuming trace */
 	perf_aux_output_begin(handle, event);
@@ -716,8 +736,13 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
+	struct hw_perf_event *hwc = &event->hw;
 	struct etm_event_data *event_data;
 
+	/* If we're already stopped, then nothing to do */
+	if (READ_ONCE(hwc->state) & PERF_HES_STOPPED)
+		return;
+
 	if (mode & PERF_EF_PAUSE)
 		return etm_event_pause(path, event, ctxt);
 
@@ -726,7 +751,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	 * to synchronize. Mark the event stopped and up to date.
 	 */
 	if (!path) {
-		event->hw.state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
+		etm_event_set_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
 		return;
 	}
 
@@ -734,9 +759,6 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	/* Clear the event_data as this ETM is stopping the trace. */
 	WRITE_ONCE(ctxt->event_data, NULL);
 
-	if (event->hw.state == PERF_HES_STOPPED)
-		return;
-
 	source = coresight_get_source(path);
 	sink = coresight_get_sink(path);
 	if (!source || !sink)
@@ -746,9 +768,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	coresight_disable_source(source, event);
 
 	/* tell the core */
-	event->hw.state = PERF_HES_STOPPED;
+	etm_event_set_hw_state(event, PERF_HES_STOPPED);
 
-	etm_event_update_buffer(handle, event_data, sink, mode);
+	etm_event_update_buffer(event, handle, event_data, sink, mode);
 
 	/* Disabling the path make its elements available to other sessions */
 	coresight_disable_path(path);
@@ -759,12 +781,12 @@ static int etm_event_add(struct perf_event *event, int mode)
 	int ret = 0;
 	struct hw_perf_event *hwc = &event->hw;
 
+	etm_event_set_hw_state(event, PERF_HES_STOPPED | PERF_HES_UPTODATE);
+
 	if (mode & PERF_EF_START) {
 		etm_event_start(event, 0);
-		if (hwc->state & PERF_HES_STOPPED)
+		if (READ_ONCE(hwc->state) & PERF_HES_STOPPED)
 			ret = -EINVAL;
-	} else {
-		hwc->state = PERF_HES_STOPPED;
 	}
 
 	return ret;

-- 
2.34.1


