Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC1ACD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCJzWD9WIeIQdceu8l0zvS0RcOiop8M2n9Y+mDkcfAQ=; b=MuRls1Wi0dwzLcuxz0pAydaNwj
	q3RRUOyJ4sFFE5zNPja4rzy7HRXvYtigri6fXYJWO2XVlvbY/DjKD4JwJZn3Ir+lsEXBacQ+LmIss
	fN9OeWh9WNPWHPlx+CdND6MLD7fdfRLoglwI4GUekRaP5PhRUFK2xndx74K74M3XwbWjEJOJFODKZ
	Ia/ZZ+eWM01r2wtvgSAFmyammfpqAF8/SmUCSKZ1vtoNUOECmbqoRCA6J27xMWZiksfsTSmTWpCKe
	H6YDNpTOf5xjCzsie8OobDz5Q/S2FQNjHFTeqYlSMmw8Fqk9x+BSMKM1vZHW9NGiAV3IqeDtIgoJP
	gawDCtdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2N-00000007QuX-1yEl;
	Fri, 01 May 2026 16:48:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2L-00000007Qsk-1cro
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EB401692;
	Fri,  1 May 2026 09:48:14 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BC853F7B4;
	Fri,  1 May 2026 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654100; bh=sS/yvXLFMr/lGZUsxRqQ2NW+lPx6NB+Do+UKyd3oHK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HxYwXkL4eX5NACbq5wNC4RrM4cLm3CkvVU5GAqOjGJMvXr9aDQGqippukPAnbgJ0l
	 0dfqI3nQ1LqPuaSPFhZNjsZO1jT5K4SXgJkDT5/6xPktTeKPVJJQN0UrHbinQJYNf7
	 Ijl4TgWmMKy36e5z5b5HSO38SQNMVC0+Ld0LFqLc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:45 +0100
Subject: [PATCH v11 04/27] coresight: Remove .cpu_id() callback from source
 ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-4-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=7101;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sS/yvXLFMr/lGZUsxRqQ2NW+lPx6NB+Do+UKyd3oHK8=;
 b=TM4R/6ale8INYxdMQxh/nzp4teq88DWKYfSM7AZEqBaFwO4Vh5WkEwuu0mdEgXzDU032ew3z+
 /yIuEgoWXPiBJgt0MoRfsvavtLIBybkuWlCMjou9UUmSmnuGBde941c
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094821_511206_CC7E1A4C 
X-CRM114-Status: GOOD (  19.42  )
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


