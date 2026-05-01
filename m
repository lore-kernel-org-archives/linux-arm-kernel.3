Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FADCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+FXjnAndZT32rN8txIDTVu5IGtSjxL33FPUuyupijk=; b=bgItyO6RLpWlyJ3TcLFzofexWG
	XfI6pJbwg4qpgsCp2QkSjW04jKzzv6k7QgLoVQ7AOD/7ROCmhY3jNl8zqQZNlFYDw2Lq1AhdUFkiL
	GX9pIwNGMj6jVzXAgea7eB58piQK/y7BsXghMx4mpPJhJz+IbOXpHbXWKI+WIybcBvvxubH5hVTyU
	63+gaODbcBH4jtUwvB/UeZvl+cTXuXcZ8rOjeehAwYaQ1v0JvfkNg7B8BbeY+QgTu6gO5EDvFl9C6
	yfxepqNGHseKKE0+bryLQVVZCZ6mtIMaolxdM67OHygIif2aBOKZjp99IBWFX1ua0yc8iuCGh8CK3
	66J0wHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2T-00000007Qzs-0qs6;
	Fri, 01 May 2026 16:48:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2Q-00000007Qx0-0hrn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42EF81692;
	Fri,  1 May 2026 09:48:20 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34DB93F7B4;
	Fri,  1 May 2026 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654105; bh=rxAyJGWFdlPcr+vWxqWvWTeKRQScnzOMU+HxIi/mip0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YBprTLAZeARgjji+i93oyox1ugt3ad1bfDJSoZmirWOz+0vnHB4PAcP7O5PwvzBrB
	 0UVWBNky5ymSpdJ7+tPjuyMdAXv5HEjM8v3cuBeNi1S20CmQaG14+Pu8/feL/+b8KU
	 J8SYdAu+gHVGPmgPTlI1DQDUWRjxLnb472f8UgHM=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:47 +0100
Subject: [PATCH v11 06/27] coresight: perf: Retrieve path and source from
 event data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-6-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=8161;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rxAyJGWFdlPcr+vWxqWvWTeKRQScnzOMU+HxIi/mip0=;
 b=yahKBWJxWeJBAEssElCNv3ZodXKx3qq2C8M/WuJHr3sbpBWNnvOm+6Gse936egK5mZkZ1U8kM
 fA/ZeaYFffuBD8udZD0Z+fKzieoFdNW+crKFFSPTA7EyBhQFTEizPSB
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094826_296259_D21AF811 
X-CRM114-Status: GOOD (  25.60  )
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

ETM perf callbacks currently use the per-CPU csdev_src pointer, which
can race with updates during device registration and unregistration.

The AUX setup already builds and stores the path in the event data.
Use this path to retrieve the source instead of csdev_src to avoid
the race.

Export coresight_get_source() and add etm_event_get_ctxt_path() to
retrieve the context's path and its source. Give the comments to
explain why this approach is safe when pause or resume callbacks
preempt the disable callback (e.g. via NMI).

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     |  2 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c | 97 +++++++++++++++---------
 drivers/hwtracing/coresight/coresight-priv.h     |  1 +
 3 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 703cc4e349f7703a4b38ba897909e03dc9c617a6..5519d323f21f38d719b9030c7d77a9a61948ba1d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -82,7 +82,7 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
-static struct coresight_device *coresight_get_source(struct coresight_path *path)
+struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index cae6738e9906c35d291e4b0f3feae37306b95c06..ca250d626db8ff89682fcb78e35a246cbd0ae367 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -315,6 +315,30 @@ static bool sinks_compatible(struct coresight_device *a,
 	       (sink_ops(a) == sink_ops(b));
 }
 
+/*
+ * This helper is used for fetching the path pointer via the ctxt.
+ *
+ * Perf event callbacks run on the same CPU in atomic context, but AUX pause
+ * and resume may run in NMI context and preempt other callbacks. Since the
+ * event stop callback clears ctxt->event_data before the data is released,
+ * AUX pause/resume will either observe a NULL pointer and stop fetching the
+ * path pointer, or safely access event_data and the path, as the data has
+ * not yet been freed.
+ */
+static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
+{
+	struct coresight_path *path;
+
+	if (!ctxt || !ctxt->event_data)
+		return NULL;
+
+	path = etm_event_cpu_path(ctxt->event_data, smp_processor_id());
+	if (!path)
+		return NULL;
+
+	return path;
+}
+
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
@@ -464,13 +488,23 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	goto out;
 }
 
-static int etm_event_resume(struct coresight_device *csdev,
-			     struct etm_ctxt *ctxt)
+static int etm_event_resume(struct coresight_path *path)
 {
-	if (!ctxt->event_data)
+	struct coresight_device *source;
+	int ret;
+
+	if (!path)
 		return 0;
 
-	return coresight_resume_source(csdev);
+	source = coresight_get_source(path);
+	if (!source)
+		return 0;
+
+	ret = coresight_resume_source(source);
+	if (ret < 0)
+		dev_err(&source->dev, "Failed to resume ETM event.\n");
+
+	return ret;
 }
 
 static void etm_event_start(struct perf_event *event, int flags)
@@ -479,18 +513,14 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct etm_event_data *event_data;
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
-	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
+	struct coresight_device *source, *sink;
 	struct coresight_path *path;
 	u64 hw_id;
 
-	if (!csdev)
-		goto fail;
-
 	if (flags & PERF_EF_RESUME) {
-		if (etm_event_resume(csdev, ctxt) < 0) {
-			dev_err(&csdev->dev, "Failed to resume ETM event.\n");
+		path = etm_event_get_ctxt_path(ctxt);
+		if (etm_event_resume(path) < 0)
 			goto fail;
-		}
 		return;
 	}
 
@@ -523,9 +553,10 @@ static void etm_event_start(struct perf_event *event, int flags)
 
 	path = etm_event_cpu_path(event_data, cpu);
 	path->handle = handle;
-	/* We need a sink, no need to continue without one */
+	/* We need source and sink, no need to continue if any is not set */
+	source = coresight_get_source(path);
 	sink = coresight_get_sink(path);
-	if (WARN_ON_ONCE(!sink))
+	if (WARN_ON_ONCE(!source || !sink))
 		goto fail_end_stop;
 
 	/* Nothing will happen without a path */
@@ -533,7 +564,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
+	if (source_ops(source)->enable(source, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
@@ -577,27 +608,25 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 }
 
-static void etm_event_pause(struct perf_event *event,
-			    struct coresight_device *csdev,
+static void etm_event_pause(struct coresight_path *path,
+			    struct perf_event *event,
 			    struct etm_ctxt *ctxt)
 {
-	int cpu = smp_processor_id();
-	struct coresight_device *sink;
 	struct perf_output_handle *handle = &ctxt->handle;
-	struct coresight_path *path;
+	struct coresight_device *source, *sink;
 	unsigned long size;
 
-	if (!ctxt->event_data)
+	if (!path)
 		return;
 
-	/* Stop tracer */
-	coresight_pause_source(csdev);
-
-	path = etm_event_cpu_path(ctxt->event_data, cpu);
+	source = coresight_get_source(path);
 	sink = coresight_get_sink(path);
-	if (WARN_ON_ONCE(!sink))
+	if (WARN_ON_ONCE(!source || !sink))
 		return;
 
+	/* Stop tracer */
+	coresight_pause_source(source);
+
 	/*
 	 * The per CPU sink has own interrupt handling, it might have
 	 * race condition with updating buffer on AUX trace pause if
@@ -630,14 +659,14 @@ static void etm_event_stop(struct perf_event *event, int mode)
 {
 	int cpu = smp_processor_id();
 	unsigned long size;
-	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
+	struct coresight_device *source, *sink;
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
+	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
 	struct etm_event_data *event_data;
-	struct coresight_path *path;
 
 	if (mode & PERF_EF_PAUSE)
-		return etm_event_pause(event, csdev, ctxt);
+		return etm_event_pause(path, event, ctxt);
 
 	/*
 	 * If we still have access to the event_data via handle,
@@ -671,19 +700,13 @@ static void etm_event_stop(struct perf_event *event, int mode)
 		return;
 	}
 
-	if (!csdev)
-		return;
-
-	path = etm_event_cpu_path(event_data, cpu);
-	if (!path)
-		return;
-
+	source = coresight_get_source(path);
 	sink = coresight_get_sink(path);
-	if (!sink)
+	if (!source || !sink)
 		return;
 
 	/* stop tracer */
-	coresight_disable_source(csdev, event);
+	coresight_disable_source(source, event);
 
 	/* tell the core */
 	event->hw.state = PERF_HES_STOPPED;
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd703b2873e41b4ce0c2564d2ce9bbad..a0cd1a0ad2a182f762cc9721fd93725f2d4ef688 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -248,6 +248,7 @@ void coresight_add_helper(struct coresight_device *csdev,
 
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
+struct coresight_device *coresight_get_source(struct coresight_path *path);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);

-- 
2.34.1


