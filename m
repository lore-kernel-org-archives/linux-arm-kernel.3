Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2774FCD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOsHI8V+Syo4bwLVBpLHZJj3a+L+Kv4FC0FFkcNhNz4=; b=2sTXois9suIq/iHjjIwGCDlQFs
	IHvpNNWVc4p0lA6KfUqkEukg04yZ5SGVOo/qlRm2bXtUycJ65Dnyjm1EC2vDhBzWg46F7qZ0wBZJ3
	5OPKsB/6ql6kd53c7RVcH/kFPz+FwLObO8O/zoxbxcjkQssv6ik6WvLSSpzGp7WLnxWKvNzsnyFm1
	FmSMmEc9eOYAy5QV9j7ITpsnjPkKcxpDLPwN64HOF+D394FpYJcpGC9uEkixoN2CWLGn6E2grNdZJ
	CXoXFozkMFn1nkoyweTT/FJL+XYdQ++iE3OGE/UER8QLqW2PBIZEIgwwSWwVlave/ktUc+aPeGxME
	kVx71SWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXo-0000000DEzr-3MHU;
	Mon, 11 May 2026 11:11:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXn-0000000DEvs-0CgF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TOsHI8V+Syo4bwLVBpLHZJj3a+L+Kv4FC0FFkcNhNz4=; b=E9+ZYGuvtpQ7IPtweTIeYWfZap
	2/HWcp8EAWz3GOSMglOzgfLDLFpznLYG2BzDCrtKo4x5j1rZ1hGdDBac3V8+ODQcCGBnHL8tE2ya/
	EfvR798r9jfJGg+WRyxOauiLAuuWXnjvcj+VLbox9k3RAY6wZB1NYJ/EeYat2G3FCeIa2uMTw0WkX
	RtPZq8QQurgLfLZ4b8hvLi2jvjmN6szc7GfxHjnvHi48hzNMh2btH1FbeOu0N0BTEl36gIAyJY8y6
	jiSCwQEWV6K6sld3y4OzB0AH+DGWij7zTel8rwT5PS114dwrjNoGZVMrYgdm3vPXdVwsz0f9E/NJH
	fSdWpS8w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXf-0000000BQeH-3SeX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B6C21713;
	Mon, 11 May 2026 04:11:13 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DB203F85F;
	Mon, 11 May 2026 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497878; bh=al8QzgsdOZ/OwC3tIIVWUIbdhoeNKO0dnaCBuw3C0Q4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PozA30C4dFxSz8Y8HPWP+70rFObzi3nrXjNUam9EQVc3ykHQ4379X5FApVspG8zWc
	 fy+xdlhban03MLXJvsDUTLlIrggr8+S3NxEKJd3Ki4UoHRMOABVllBUL22scOpqFMG
	 zxwrR2l18RY49jJzwt/gdmVas5J/8M33sagPDkPw=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:49 +0100
Subject: [PATCH v12 05/28] coresight: Remove .cpu_id() callback from source
 ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-5-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=7101;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=al8QzgsdOZ/OwC3tIIVWUIbdhoeNKO0dnaCBuw3C0Q4=;
 b=8eGxR2Tm9l4t1ELiuuTNEIHZA42Xlq+GQ09XQX5N843fY7gbeeDA6KeTnIgDGIk/MBOLXiQQt
 621gsfL3tq2ByfZ6szisiuskAmBuc5EF6rg0A2WhLVdLS479aBoDNLy
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121124_215224_40A18C7F 
X-CRM114-Status: GOOD (  19.13  )
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

The CPU ID can be fetched directly from the coresight_device structure,
so the .cpu_id() callback is no longer needed.

Remove the .cpu_id() callback from source ops and update callers
accordingly.

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       | 8 ++++----
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 2 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 8 --------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 8 --------
 drivers/hwtracing/coresight/coresight-sysfs.c      | 4 ++--
 include/linux/coresight.h                          | 3 ---
 6 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f8c0c2b05888403318372dc76278910c8a5c7e15..703cc4e349f7703a4b38ba897909e03dc9c617a6 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -796,7 +796,7 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		goto out;
 
 	if (coresight_is_percpu_source(csdev) && coresight_is_percpu_sink(sink) &&
-	    sink == per_cpu(csdev_sink, source_ops(csdev)->cpu_id(csdev))) {
+	    sink == per_cpu(csdev_sink, csdev->cpu)) {
 		if (_coresight_build_path(sink, source, sink, path) == 0) {
 			found = true;
 			goto out;
@@ -1023,7 +1023,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
 	/* look for a default sink if we have not found for this device */
 	if (!csdev->def_sink) {
 		if (coresight_is_percpu_source(csdev))
-			csdev->def_sink = per_cpu(csdev_sink, source_ops(csdev)->cpu_id(csdev));
+			csdev->def_sink = per_cpu(csdev_sink, csdev->cpu);
 		if (!csdev->def_sink)
 			csdev->def_sink = coresight_find_sink(csdev, &depth);
 	}
@@ -1761,10 +1761,10 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
 {
 	int cpu, trace_id;
 
-	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE || !source_ops(csdev)->cpu_id)
+	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE)
 		return -EINVAL;
 
-	cpu = source_ops(csdev)->cpu_id(csdev);
+	cpu = csdev->cpu;
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		trace_id = coresight_trace_id_get_cpu_id(cpu);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f85dedf89a3f9e85d568ca4c320fa6fa6d9059ff..cae6738e9906c35d291e4b0f3feae37306b95c06 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -824,7 +824,7 @@ static void etm_addr_filters_sync(struct perf_event *event)
 int etm_perf_symlink(struct coresight_device *csdev, bool link)
 {
 	char entry[sizeof("cpu9999999")];
-	int ret = 0, cpu = source_ops(csdev)->cpu_id(csdev);
+	int ret = 0, cpu = csdev->cpu;
 	struct device *pmu_dev = etm_pmu.dev;
 	struct device *cs_dev = &csdev->dev;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index eb665db1a37d9970f7f55395c0aa23b98a7f3118..ab47f69e923fb191b48b82367dce465c79b3a93d 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -466,13 +466,6 @@ static void etm_enable_sysfs_smp_call(void *info)
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
-static int etm_cpu_id(struct coresight_device *csdev)
-{
-	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	return drvdata->cpu;
-}
-
 void etm_release_trace_id(struct etm_drvdata *drvdata)
 {
 	coresight_trace_id_put_cpu_id(drvdata->cpu);
@@ -684,7 +677,6 @@ static void etm_disable(struct coresight_device *csdev,
 }
 
 static const struct coresight_ops_source etm_source_ops = {
-	.cpu_id		= etm_cpu_id,
 	.enable		= etm_enable,
 	.disable	= etm_disable,
 };
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 8f270bfc74723f1fc1cead2da1725ab6b50f910e..b7312570a7ae1f0355c01b6f7a54ea2dd8891097 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -231,13 +231,6 @@ static void etm4_cs_unlock(struct etmv4_drvdata *drvdata,
 		CS_UNLOCK(csa->base);
 }
 
-static int etm4_cpu_id(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	return drvdata->cpu;
-}
-
 void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 {
 	coresight_trace_id_put_cpu_id(drvdata->cpu);
@@ -1205,7 +1198,6 @@ static void etm4_pause_perf(struct coresight_device *csdev)
 }
 
 static const struct coresight_ops_source etm4_source_ops = {
-	.cpu_id		= etm4_cpu_id,
 	.enable		= etm4_enable,
 	.disable	= etm4_disable,
 	.resume_perf	= etm4_resume_perf,
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index a5c08fab97a1b5d14d961e9b8ec6ef2d67b85944..3087de9e1c12a66ea15a73f92564d623d75d68ec 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -232,7 +232,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		 * be a single session per tracer (when working from sysFS)
 		 * a per-cpu variable will do just fine.
 		 */
-		cpu = source_ops(csdev)->cpu_id(csdev);
+		cpu = csdev->cpu;
 		per_cpu(tracer_path, cpu) = path;
 		break;
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
@@ -284,7 +284,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 
 	switch (csdev->subtype.source_subtype) {
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
-		cpu = source_ops(csdev)->cpu_id(csdev);
+		cpu = csdev->cpu;
 		path = per_cpu(tracer_path, cpu);
 		per_cpu(tracer_path, cpu) = NULL;
 		break;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 687190ca11ddeaa83193caa3903a480bac3060d1..e9c20ceb9016fa3db256b8c1147c1fd2027b7b0d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -395,15 +395,12 @@ struct coresight_ops_link {
 /**
  * struct coresight_ops_source - basic operations for a source
  * Operations available for sources.
- * @cpu_id:	returns the value of the CPU number this component
- *		is associated to.
  * @enable:	enables tracing for a source.
  * @disable:	disables tracing for a source.
  * @resume_perf: resumes tracing for a source in perf session.
  * @pause_perf:	pauses tracing for a source in perf session.
  */
 struct coresight_ops_source {
-	int (*cpu_id)(struct coresight_device *csdev);
 	int (*enable)(struct coresight_device *csdev, struct perf_event *event,
 		      enum cs_mode mode, struct coresight_path *path);
 	void (*disable)(struct coresight_device *csdev,

-- 
2.34.1


