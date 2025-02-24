Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56077C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbr4sCthiHghLZFUGrTZdA0WJ+e/O3nVoV4Mae1CwPw=; b=VJsEl/kMNg9ScbMfwqxeWh+Guq
	XuvlyLbMtyDWh9P/mE2w/lQaZEqbbvRcU2AiyKspITtDyHzjQl4UUVPxE3c0JmsRgdKj7gZRQO+j7
	ZrCQKF984FoLEsGrqN/gykR7Xefbz7UVgJya6ZpX1BCxZnMDIm5mZ4/2fBpTVOK8jhD32/z7NT2rQ
	MR1meYo2LTdtmC0iyrB/1J//CXubUjXzux2EqEwioRcaLX7ZHeKDkfI/mjJ2HY+qjAxRLcDDQxyA2
	zBA32alGM0O9iqzCVqGX7YqDfNIVU8Q1pc7jnvQ+1St5If5u8vMXlZdH0fYQKJPs4jCLspD2VsO1n
	EXK3v88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaM6-0000000EHW0-2dhE;
	Mon, 24 Feb 2025 15:26:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaAW-0000000EFCw-3Wuy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:14:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DBEC2661;
	Mon, 24 Feb 2025 07:15:08 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E8683F6A8;
	Mon, 24 Feb 2025 07:14:49 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 4/8] coresight: perf: Support AUX trace pause and resume
Date: Mon, 24 Feb 2025 15:14:19 +0000
Message-Id: <20250224151423.1630639-5-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224151423.1630639-1-leo.yan@arm.com>
References: <20250224151423.1630639-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_071452_970062_1C1DFB90 
X-CRM114-Status: GOOD (  18.30  )
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

This commit supports AUX trace pause and resume in a perf session for
Arm CoreSight.

First, we need to decide which flag can indicate the CoreSight PMU event
has started.  The 'event->hw.state' cannot be used for this purpose
because its initial value and the value after hardware trace enabling
are both 0.

On the other hand, the context value 'ctxt->event_data' stores the ETM
private info.  This pointer is valid only when the PMU event has been
enabled. It is safe to permit AUX trace pause and resume operations only
when it is not a NULL pointer.

To achieve fine-grained control of the pause and resume, only the tracer
is disabled and enabled.  This avoids the unnecessary complexity and
latency caused by manipulating the entire link path.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../hwtracing/coresight/coresight-etm-perf.c  | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index ad6a8f4b70b6..29d52386ffbb 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -366,6 +366,18 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 			continue;
 		}
 
+		/*
+		 * If AUX pause feature is enabled but the ETM driver does not
+		 * support the operations, clear this CPU from the mask and
+		 * continue to next one.
+		 */
+		if (event->attr.aux_start_paused &&
+		    (!source_ops(csdev)->pause || !source_ops(csdev)->resume)) {
+			dev_err_once(&csdev->dev, "AUX pause is not supported.\n");
+			cpumask_clear_cpu(cpu, mask);
+			continue;
+		}
+
 		/*
 		 * No sink provided - look for a default sink for all the ETMs,
 		 * where this event can be scheduled.
@@ -451,6 +463,15 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	goto out;
 }
 
+static void etm_event_resume(struct coresight_device *csdev,
+			     struct etm_ctxt *ctxt)
+{
+	if (!ctxt->event_data)
+		return;
+
+	coresight_resume_source(csdev);
+}
+
 static void etm_event_start(struct perf_event *event, int flags)
 {
 	int cpu = smp_processor_id();
@@ -465,6 +486,9 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (!csdev)
 		goto fail;
 
+	if (flags & PERF_EF_RESUME)
+		return etm_event_resume(csdev, ctxt);
+
 	/* Have we messed up our tracking ? */
 	if (WARN_ON(ctxt->event_data))
 		goto fail;
@@ -550,6 +574,16 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 }
 
+static void etm_event_pause(struct coresight_device *csdev,
+			    struct etm_ctxt *ctxt)
+{
+	if (!ctxt->event_data)
+		return;
+
+	/* Stop tracer */
+	coresight_pause_source(csdev);
+}
+
 static void etm_event_stop(struct perf_event *event, int mode)
 {
 	int cpu = smp_processor_id();
@@ -560,6 +594,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct etm_event_data *event_data;
 	struct list_head *path;
 
+	if (mode & PERF_EF_PAUSE)
+		return etm_event_pause(csdev, ctxt);
+
 	/*
 	 * If we still have access to the event_data via handle,
 	 * confirm that we haven't messed up the tracking.
@@ -904,7 +941,8 @@ int __init etm_perf_init(void)
 	int ret;
 
 	etm_pmu.capabilities		= (PERF_PMU_CAP_EXCLUSIVE |
-					   PERF_PMU_CAP_ITRACE);
+					   PERF_PMU_CAP_ITRACE |
+					   PERF_PMU_CAP_AUX_PAUSE);
 
 	etm_pmu.attr_groups		= etm_pmu_attr_groups;
 	etm_pmu.task_ctx_nr		= perf_sw_context;
-- 
2.34.1


