Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6E3CD4F46
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5IEXEJw+o+POQ07javYLcI9waqb03MCL6lIGgLwips=; b=K9fHlFl1PAAKUnGOzHYrIlfNMn
	i0kZkgz/qcaU2zS+laphJRRXtV1Goc2n6y6l9m6jEHVyW+Eyv2g8sWIVF82L65ipofPQN1DK3Hi7s
	QoHk8AHZUz9qnrZRxvKaHAGQWYtMebCnq/1c7d2uuo1/lpK12W6s1R3+DyIUNRFbEaf8b62HUbdqI
	COmSFLjK0yZp1zgU0wuTCvs7dN9U1VxXinill5pMPT1qSRqjx5zdR9lV+ThCuHzCfz80xkchAd1cl
	altovJDOBcQnnU+YBy0AFKCwGMEX56mQdGHGuosX3142NTNaWjqEobxq2LaetWokXxQv5eZxEM3ki
	xiaXfFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqO-00000009J3M-2utw;
	Fri, 15 May 2026 20:09:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyq9-00000009Is2-0A3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D9E535E8;
	Fri, 15 May 2026 13:08:50 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFC863F836;
	Fri, 15 May 2026 13:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875735; bh=OgeGCnfnaNRuO+iqc6/o1RM0gMnV2kTJ14AYacfGTwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IIYGnJNotPTHDp9NTKczENyfEmUQ/TGx9/6VW7/iE6Ep8WYPFjL+WtA7MPityn3SE
	 j6u0p5xq836DWj2mtjI3JFf4tk+jwTihGp+7qFurp9KgU4o9RfuiloAhzA6huu8x9b
	 3B/I2+jCrnI9VrIzvtx/3zr4C1sdpTqh2Jn5zdZk=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:17 +0100
Subject: [PATCH v14 10/28] coresight: Take per-CPU source reference during
 AUX setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-10-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=10731;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=OgeGCnfnaNRuO+iqc6/o1RM0gMnV2kTJ14AYacfGTwI=;
 b=H1dfs4c4dTRHgIeB+xTX93r8f5QzEY1dzdxaVbzbgL2QqLYGNKsd+M9XGdtdQElOaml54Ujhd
 xULJMFrgq8KDBrb9xqlP70i6iGcf1e8DmkWza91c1ibTMXEqJAGPc04
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130857_221812_969E143A 
X-CRM114-Status: GOOD (  34.93  )
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

etm_setup_aux() fetches the per-CPU source pointer while preparing perf
AUX trace paths. This can race with CoreSight device unregistration, the
ETM device may has been released while the AUX setup still use it,
leading to use-after-free.

Move per-CPU path construction into etm_event_build_path() and use
the coresight_{get|put}_percpu_source_ref() pairs to take and drop
the device references, this ensures the device is safe to access during
path construction.

Update comments accordingly. Document a PREEMPT_RT corner case: the
put_device() may release resources while coresight_dev_lock (a raw
spinlock) is held, and the release may attempt to acquire a spinlock
that becomes sleepable under PREEMPT_RT. This will be fixed in the
future.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     |  38 +++++-
 drivers/hwtracing/coresight/coresight-etm-perf.c | 160 +++++++++++++----------
 drivers/hwtracing/coresight/coresight-priv.h     |   3 +-
 3 files changed, 130 insertions(+), 71 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 995a4a1bab3d983141237f453b6f630e73e69e5e..fc4855c3dfaafe04b3bdc2dd607128353f38e984 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -109,13 +109,47 @@ static void coresight_clear_percpu_source(struct coresight_device *csdev)
 	per_cpu(csdev_source, csdev->cpu) = NULL;
 }
 
-struct coresight_device *coresight_get_percpu_source(int cpu)
+struct coresight_device *coresight_get_percpu_source_ref(int cpu)
 {
+	struct coresight_device *csdev;
+
 	if (WARN_ON(cpu < 0))
 		return NULL;
 
 	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
-	return per_cpu(csdev_source, cpu);
+
+	csdev = per_cpu(csdev_source, cpu);
+	if (!csdev)
+		return NULL;
+
+	/*
+	 * Holding a reference to the csdev->dev ensures that the
+	 * coresight_device is live for the caller. The path building
+	 * logic can safely either build a path to the sink or fail
+	 * if the device is being unregistered (if there was a race).
+	 * The caller can skip the "source" device, if no path could
+	 * be built.
+	 */
+	get_device(&csdev->dev);
+
+	return csdev;
+}
+
+void coresight_put_percpu_source_ref(struct coresight_device *csdev)
+{
+	if (!csdev || !coresight_is_percpu_source(csdev))
+		return;
+
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+
+	/*
+	 * TODO: coresight_device_release() is invoked to release resources when
+	 * the device's refcount reaches zero. It then calls free_percpu(),
+	 * which acquires pcpu_lock — a sleepable lock when PREEMPT_RT is
+	 * enabled. Since the raw spinlock coresight_dev_lock is held, this can
+	 * lead to a potential "scheduling while atomic" issue.
+	 */
+	put_device(&csdev->dev);
 }
 
 struct coresight_device *coresight_get_source(struct coresight_path *path)
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index b9e556818c3c6873ed53e5a1b8052443dd7740d0..89b99c3caedbc34da57f406797701425d36a1333 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -343,6 +343,86 @@ static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
 	return path;
 }
 
+static struct coresight_path *
+etm_event_build_path(struct perf_event *event, int cpu,
+		     struct coresight_device *user_sink,
+		     struct coresight_device *match_sink)
+{
+	struct coresight_path *path = NULL;
+	struct coresight_device *source, *sink;
+	int ret;
+
+	source = coresight_get_percpu_source_ref(cpu);
+
+	/*
+	 * If there is no ETM associated with this CPU or ever we try to trace
+	 * on this CPU, we handle it accordingly.
+	 */
+	if (!source)
+		return NULL;
+
+	/*
+	 * If AUX pause feature is enabled but the ETM driver does not
+	 * support the operations, skip for this source.
+	 */
+	if (event->attr.aux_start_paused &&
+	    (!source_ops(source)->pause_perf ||
+	     !source_ops(source)->resume_perf)) {
+		dev_err_once(&source->dev, "AUX pause is not supported.\n");
+		goto out;
+	}
+
+	/* If sink has been specified by user, directly use it */
+	if (user_sink) {
+		sink = user_sink;
+	} else {
+		/*
+		 * No sink provided - look for a default sink for all the ETMs,
+		 * where this event can be scheduled.
+		 *
+		 * We allocate the sink specific buffers only once for this
+		 * event. If the ETMs have different default sink devices, we
+		 * can only use a single "type" of sink as the event can carry
+		 * only one sink specific buffer. Thus we have to make sure
+		 * that the sinks are of the same type and driven by the same
+		 * driver, as the one we allocate the buffer for. We don't
+		 * trace on a CPU if the sink is not compatible.
+		 */
+
+		/* Find the default sink for this ETM */
+		sink = coresight_find_default_sink(source);
+		if (!sink)
+			goto out;
+
+		/* Check if this sink compatible with the last sink */
+		if (match_sink && !sinks_compatible(match_sink, sink))
+			goto out;
+	}
+
+	/*
+	 * Building a path doesn't enable it, it simply builds a
+	 * list of devices from source to sink that can be
+	 * referenced later when the path is actually needed.
+	 */
+	path = coresight_build_path(source, sink);
+	if (IS_ERR(path))
+		goto out;
+
+	/* ensure we can allocate a trace ID for this CPU */
+	ret = coresight_path_assign_trace_id(path, CS_MODE_PERF);
+	if (ret) {
+		coresight_release_path(path);
+		path = NULL;
+		goto out;
+	}
+
+	coresight_trace_id_perf_start(&sink->perf_sink_id_map);
+
+out:
+	coresight_put_percpu_source_ref(source);
+	return IS_ERR_OR_NULL(path) ? NULL : path;
+}
+
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
@@ -350,9 +430,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
-	struct coresight_device *user_sink = NULL, *last_sink = NULL;
+	struct coresight_device *user_sink = NULL;
 	struct etm_event_data *event_data = NULL;
-	int ret;
 
 	event_data = alloc_event_data(cpu);
 	if (!event_data)
@@ -383,80 +462,25 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	 */
 	for_each_cpu(cpu, mask) {
 		struct coresight_path *path;
-		struct coresight_device *csdev;
 
-		csdev = coresight_get_percpu_source(cpu);
-		/*
-		 * If there is no ETM associated with this CPU clear it from
-		 * the mask and continue with the rest. If ever we try to trace
-		 * on this CPU, we handle it accordingly.
-		 */
-		if (!csdev) {
+		path = etm_event_build_path(event, cpu, user_sink, sink);
+		if (!path) {
+			/*
+			 * Failed to create a path for the CPU, clear it from
+			 * the mask and continue to next one.
+			 */
 			cpumask_clear_cpu(cpu, mask);
 			continue;
 		}
 
 		/*
-		 * If AUX pause feature is enabled but the ETM driver does not
-		 * support the operations, clear this CPU from the mask and
-		 * continue to next one.
+		 * The first found sink is saved here and passed to
+		 * etm_event_build_path() to check whether the remaining ETMs
+		 * have a compatible default sink.
 		 */
-		if (event->attr.aux_start_paused &&
-		    (!source_ops(csdev)->pause_perf || !source_ops(csdev)->resume_perf)) {
-			dev_err_once(&csdev->dev, "AUX pause is not supported.\n");
-			cpumask_clear_cpu(cpu, mask);
-			continue;
-		}
-
-		/*
-		 * No sink provided - look for a default sink for all the ETMs,
-		 * where this event can be scheduled.
-		 * We allocate the sink specific buffers only once for this
-		 * event. If the ETMs have different default sink devices, we
-		 * can only use a single "type" of sink as the event can carry
-		 * only one sink specific buffer. Thus we have to make sure
-		 * that the sinks are of the same type and driven by the same
-		 * driver, as the one we allocate the buffer for. As such
-		 * we choose the first sink and check if the remaining ETMs
-		 * have a compatible default sink. We don't trace on a CPU
-		 * if the sink is not compatible.
-		 */
-		if (!user_sink) {
-			/* Find the default sink for this ETM */
-			sink = coresight_find_default_sink(csdev);
-			if (!sink) {
-				cpumask_clear_cpu(cpu, mask);
-				continue;
-			}
-
-			/* Check if this sink compatible with the last sink */
-			if (last_sink && !sinks_compatible(last_sink, sink)) {
-				cpumask_clear_cpu(cpu, mask);
-				continue;
-			}
-			last_sink = sink;
-		}
-
-		/*
-		 * Building a path doesn't enable it, it simply builds a
-		 * list of devices from source to sink that can be
-		 * referenced later when the path is actually needed.
-		 */
-		path = coresight_build_path(csdev, sink);
-		if (IS_ERR(path)) {
-			cpumask_clear_cpu(cpu, mask);
-			continue;
-		}
-
-		/* ensure we can allocate a trace ID for this CPU */
-		ret = coresight_path_assign_trace_id(path, CS_MODE_PERF);
-		if (ret) {
-			cpumask_clear_cpu(cpu, mask);
-			coresight_release_path(path);
-			continue;
-		}
+		if (!user_sink && !sink)
+			sink = coresight_get_sink(path);
 
-		coresight_trace_id_perf_start(&sink->perf_sink_id_map);
 		*etm_event_cpu_path_ptr(event_data, cpu) = path;
 	}
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 4d6f5bc1df9cc5dfd974a8b27820328e7916f169..808d1546f568278d62fe72d871b6af82eb830074 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -249,7 +249,8 @@ void coresight_add_helper(struct coresight_device *csdev,
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
 struct coresight_device *coresight_get_source(struct coresight_path *path);
-struct coresight_device *coresight_get_percpu_source(int cpu);
+struct coresight_device *coresight_get_percpu_source_ref(int cpu);
+void coresight_put_percpu_source_ref(struct coresight_device *csdev);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);

-- 
2.34.1


