Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85456109C024
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnNhe502TE0T03qmDQrWaqYUPQM8N8g85P7RweGQlqU=; b=zxkjU//LCwfol+swb1WQ2WERDT
	Q5DoQYDNF0No6EcpvNZT13KzpRwm4nszJ2AisItm1AVt4FoNV0KBNm1PZSbjo1mlpd48EOeETT/iX
	RAEilw/ecxYHujgK9a2qMstjNRv2LzgOFfI0VeuyEzS8iVUdWMR1pJkIRMSQPhA9/OobW2sc5nePb
	5WqtjqP8038NT9PfPuMB0tFM+DDl9p7xBr7iF/ytic1zHRMvK7RX59Z30fjhuA+nDTKu1TNRKuOKn
	NPhiiJ3BrwF0/r2uY1AG38jkCb6qqOYdpEqUEgjxkUz1RzOA1z6ua1zx894PbP4IWlAf7STtbDTxp
	NeADELIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCT-00000003Ze7-2Pf4;
	Wed, 25 Mar 2026 14:27:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCM-00000003ZaI-2w77
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C25431F02;
	Wed, 25 Mar 2026 07:26:59 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D43B43F836;
	Wed, 25 Mar 2026 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448825; bh=6dW2nINMnxwnqn8IshqXII1z+o03FUVaJQoB4sv6jjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nS+3pEu611mSxCwOBmA6oey+QEnKKNZ9Ke+0r4oRkYw+P4beZgkEzd4r+zTRrJVfI
	 Qz9OIZA+y8rBvD4AmuMS5PvZ6N/ctAhwQamA65CvZQn+PHRv8Yp89n8rKtoDhXPRJt
	 UnDcXv2q6yXflj1ExfMoR3RRgTlnsmUxzGVTNNDo=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:40 +0000
Subject: [PATCH v8 03/23] coresight: Remove .cpu_id() callback from source
 ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-3-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448816; l=6906;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6dW2nINMnxwnqn8IshqXII1z+o03FUVaJQoB4sv6jjc=;
 b=9xzzXtCsEtJE0qf3XW0JvCQJgDRdnFiUoRJ7niFMJBmw/5mMuBfDglUC34jSkXbCnomZJv7fy
 ueEOXmEmnAOCCzacigNoqnauYx4rRRHGSJQvrPZRTVjnznXYRL5KkAw
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072706_822041_0BB68F4F 
X-CRM114-Status: GOOD (  19.33  )
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
index 89911fc27128b2bb78c8ba704f2af5a5d4efe83c..6907da35ed02fa58f8d30f5576627a6ce3b88362 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -787,7 +787,7 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		goto out;
 
 	if (coresight_is_percpu_source(csdev) && coresight_is_percpu_sink(sink) &&
-	    sink == per_cpu(csdev_sink, source_ops(csdev)->cpu_id(csdev))) {
+	    sink == per_cpu(csdev_sink, csdev->cpu)) {
 		if (_coresight_build_path(sink, source, sink, path) == 0) {
 			found = true;
 			goto out;
@@ -1014,7 +1014,7 @@ coresight_find_default_sink(struct coresight_device *csdev)
 	/* look for a default sink if we have not found for this device */
 	if (!csdev->def_sink) {
 		if (coresight_is_percpu_source(csdev))
-			csdev->def_sink = per_cpu(csdev_sink, source_ops(csdev)->cpu_id(csdev));
+			csdev->def_sink = per_cpu(csdev_sink, csdev->cpu);
 		if (!csdev->def_sink)
 			csdev->def_sink = coresight_find_sink(csdev, &depth);
 	}
@@ -1752,10 +1752,10 @@ int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode
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
index b1e0254a534027d7ede8591e56be28745d0b9974..66a8058098376264d3f8c5815763a75ebffb352e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -227,13 +227,6 @@ static void etm4_cs_unlock(struct etmv4_drvdata *drvdata,
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
@@ -1201,7 +1194,6 @@ static void etm4_pause_perf(struct coresight_device *csdev)
 }
 
 static const struct coresight_ops_source etm4_source_ops = {
-	.cpu_id		= etm4_cpu_id,
 	.enable		= etm4_enable,
 	.disable	= etm4_disable,
 	.resume_perf	= etm4_resume_perf,
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index d2a6ed8bcc74d64dccc735463f14790b4e80d101..3b1e7152dd108408d837c404ce607ba511ca14a6 100644
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
@@ -282,7 +282,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 
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


