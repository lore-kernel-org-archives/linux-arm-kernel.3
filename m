Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13CECD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjoK692BK1EAFOpAkJJFiuiAtk3jI1FrFplcL1s3Smw=; b=V7pFm4DUhkUGdbt4uRCapUBwBi
	XsQ97T1Eg+0c4MQm5T1Rv3+dsqOi6xG0CRZtNVmqRSwsAvtxZBVt+0Nkwr0PNKEn+ay8nTsCYyzcq
	l5mwjCkqGpisdbg9F+f/zruJgq6Cm18utmR4LrarYLP0XYJ3Z9cBl9HVzUynzpon2MTtTx4R2HqcG
	oVjyVJHu2Fe3n6Bv9gwS2c6f1jUowYs5AGgLemxe3MdRTxfb0JLodbNmf663WcV06EuH51S7J9jpz
	NoNgeVWC69AutadUax2dI4gBPhrrZ1PX4weSMBTonKly73p6xpKe4ebfAUjkGf2DV/q5V9d+AXhFF
	CGZvsrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdq-000000097uh-1A4W;
	Fri, 15 May 2026 18:52:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdj-000000097o6-1kSi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:52:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA5A22938;
	Fri, 15 May 2026 11:51:57 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1079A3F836;
	Fri, 15 May 2026 11:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871122; bh=GazISm3mjffGBF2Id4EYsThsbtj8Eh0i7Lr3cZD27CI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vqizXiu/knNVq8165C1V44eUEvN/MonxFRQ2l/9g8aeUMKuMzcMaC7DKCUz8uzUdn
	 GMw+GumfVyt4F896I0//C4fU9CmWZVjQtNTiGRKiy8BN3vz8CY1SaXyYsZ1MRH9JsP
	 eFcN+Tw2FV13hSOxnejh79lI5brAFwMMfcfRhQ1w=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:30 +0100
Subject: [PATCH v13 07/28] coresight: perf: Retrieve path and source from
 event data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-7-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=9791;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=GazISm3mjffGBF2Id4EYsThsbtj8Eh0i7Lr3cZD27CI=;
 b=vRyPCRjptpZ+/inHEZYuBYlqrxmTtv1c9ush/alHeC2d8ct005/axzxUGyxy3lyY54w0IrDgZ
 +V2/yquBrILB8YnWHyPdvx5dmigq4Eavm8scNT0TohJaMQ6K1E3k/Cm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115205_105104_4A21DDEF 
X-CRM114-Status: GOOD (  27.66  )
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
retrieve the context's path and its source with READ_ONCE() /
WRITE_ONCE() accessors. Give the comments to explain why this
approach is safe when pause or resume callbacks preempt the disable
callback (e.g. via NMI).

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     |   2 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c | 114 ++++++++++++++---------
 drivers/hwtracing/coresight/coresight-priv.h     |   1 +
 3 files changed, 74 insertions(+), 43 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5c711e5175014d2a7dce1ec544cd6c89f60d3a7a..3fc6a5db778c89acad6ee05fe15ec0b8b8dab6bc 100644
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
index 7434f68d448253ed3de5acae45ded50e68ff2dcf..bab85f7dac4757173912639ea016cdc32e5616fb 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -315,6 +315,35 @@ static bool sinks_compatible(struct coresight_device *a,
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
+	struct etm_event_data *event_data;
+	struct coresight_path *path;
+
+	if (!ctxt)
+		return NULL;
+
+	event_data = READ_ONCE(ctxt->event_data);
+	if (!event_data)
+		return NULL;
+
+	path = etm_event_cpu_path(event_data, smp_processor_id());
+	if (!path)
+		return NULL;
+
+	return path;
+}
+
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
@@ -465,13 +494,23 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
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
@@ -480,23 +519,19 @@ static void etm_event_start(struct perf_event *event, int flags)
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
 
 	/* Have we messed up our tracking ? */
-	if (WARN_ON(ctxt->event_data))
+	if (WARN_ON(READ_ONCE(ctxt->event_data)))
 		goto fail;
 
 	/*
@@ -524,9 +559,10 @@ static void etm_event_start(struct perf_event *event, int flags)
 
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
@@ -534,7 +570,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
+	if (source_ops(source)->enable(source, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
@@ -558,7 +594,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	/* Tell the perf core the event is alive */
 	event->hw.state = 0;
 	/* Save the event_data for this ETM */
-	ctxt->event_data = event_data;
+	WRITE_ONCE(ctxt->event_data, event_data);
 	return;
 
 fail_disable_path:
@@ -578,27 +614,26 @@ static void etm_event_start(struct perf_event *event, int flags)
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
+	struct etm_event_data *event_data;
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
@@ -614,8 +649,9 @@ static void etm_event_pause(struct perf_event *event,
 	if (!sink_ops(sink)->update_buffer)
 		return;
 
+	event_data = READ_ONCE(ctxt->event_data);
 	size = sink_ops(sink)->update_buffer(sink, handle,
-					     ctxt->event_data->snk_config);
+					     event_data->snk_config);
 	if (READ_ONCE(handle->event)) {
 		if (!size)
 			return;
@@ -631,14 +667,14 @@ static void etm_event_stop(struct perf_event *event, int mode)
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
@@ -648,9 +684,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
 		return;
 
-	event_data = ctxt->event_data;
+	event_data = READ_ONCE(ctxt->event_data);
 	/* Clear the event_data as this ETM is stopping the trace. */
-	ctxt->event_data = NULL;
+	WRITE_ONCE(ctxt->event_data, NULL);
 
 	if (event->hw.state == PERF_HES_STOPPED)
 		return;
@@ -672,19 +708,13 @@ static void etm_event_stop(struct perf_event *event, int mode)
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
index 34c7e792adbd9933e48ab710b7b5894f22c72eb8..75029744561f7744225c7b866eee60e0f7cf9e10 100644
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


