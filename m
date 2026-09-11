Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3B4C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=havEPaGH4/OYRTVbqVbTdiNDE6u32PQIwhkT9Ejxbf8=; b=OUB73uLoOQw+AZFaxOB3OaQ5dt
	04E4fIvn7jrAmrQ7NSqZf0iEH1CfEZvT7Grl+PvWGwz6GFLB8ZT/hoWrkMI7ZHkEeYk/N+qTfJCqV
	B5dA25n/S0g3I/GZr2WxxGzNgxMyuT0F6TZuf/irPLfTG+o3VoKPlODOvq4ermOH9xNSvVTSjgrzm
	n5c6Rw+vhx1ost8roEPjII9jrqOwAmuwxz1r0K8MyclslbfD6igktISV8gHfzfsmM2sBzb97lhMSQ
	0fzM6tBjy2r6o2yricOpcaU7Q06OaDL+KBrhUomX2mZecXO38uJ2j6eLjqYmQr/A5zPvML8n3duB1
	hoPLrHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yvm-0000000GRDe-2KU6;
	Fri, 11 Sep 2026 10:56:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yvc-0000000GRBd-34ps
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:56:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA28F28AC;
	Fri, 11 Sep 2026 03:56:15 -0700 (PDT)
Received: from e129823.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80C933F7B4;
	Fri, 11 Sep 2026 03:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789124179; bh=rRIT6zmtgZwucLM8/e/CtdRGekQ15MLHArZlKbZBagY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T9wTmNuq0oxjxR66y3LipcbkZOJSppGWKkiqAq4bVVeGS9SkL0BKv114ORbaE5goj
	 1pdNB+RzPr0WrC0YWYWQ99N7VAy2JRcNsV95zZ/UItDtPS5b/f6nP9koksPveG20kB
	 K2nozZU3pwWG3gUCSPriFqronnqroAr+7693MvRw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 11 Sep 2026 11:56:01 +0100
Subject: [PATCH v10 2/8] coresight: etm3x: fix inconsistencies with sysfs
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-separate_etm_cfg_v2-v10-2-1b715d95927a@arm.com>
References: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
In-Reply-To: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6021; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=rRIT6zmtgZwucLM8/e/CtdRGekQ15MLHArZlKbZBagY=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqo95IkzrUaBVguZ0wFAvfZAwQJKVi3uJoEqeB3
 16rKSzHwhiJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqPeSAAKCRBt1cPRWsUx
 M2haDACZlBn9dBHIz5dgqPoJQ4j6q4yOr7CERdjsEhl/iiKRUCzNK75EU/OJEdV39DPFZUp4wJ+
 aoemNGXNFuMR+OezWscKp/BrJCc1t5tJ4PXWPMzzMnEBw1EXgitbppClsYNiaKnQGqp5wwVw1VI
 Dt6033F22t3qoMpMiBlzoETVQ5Jd6Ib/VZ98wBZnNudHDctIgrFM9jd7cViYAtUAQT37Y3xK2bm
 5c1UZbqCXfapv1w5KIQNuof+wIbxq2bLE2pK7tDb+LqMRFCt36/F8mNs9IKJbR0ooxy5Q6/+pxi
 ZvEB1RUUtuQc171vw/Yi+fDxWtDJIXJTm4fG/kW/265c8wGa824Vtk52qrGT8MFPZpQdtOvEDQd
 vKHp1lOMdHWtZSIWbq+dGd8nmwoLJ8jonZ9S/8kzp+x3LKGJOWH+RntUqSm7j8C23SDtP7bO62K
 VbH9YQI/DbUxUJbGwFKiR5/siQp8p8qzyZgcyJlL+4PL1QHhqd5RXm2Ng5AqVcPX+YY4k=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_035620_901206_4FCDBC4E 
X-CRM114-Status: GOOD (  20.04  )
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

The current ETM3x configuration via sysfs can lead to the following
inconsistencies:

  - If a configuration is modified via sysfs while a perf session is
    active, the running configuration may differ between before
    a sched-out and after a subsequent sched-in.

To resolve these issues, separate the configuration into:

  - active_config: the configuration applied to the current session
  - config: the configuration set via sysfs

Additionally:

  - Since active_config and related fields are accessed only by the local CPU
    in etm_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
    remove the lock/unlock from the sysfs enable/disable path and
    starting/dying_cpu path except when to access config fields only.

Fixes: 1925a470ce69 ("coresight: etm3x: splitting struct etm_drvdata")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm.h        |  4 ++-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 38 +++++++++++-----------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index 1d753cca2943..f3796162168d 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -226,7 +226,8 @@ struct etm_config {
  * @etmccr:	value of register ETMCCR.
  * @etmccer:	value of register ETMCCER.
  * @traceid:	value of the current ID for this component.
- * @config:	structure holding configuration parameters.
+ * @active_config:	structure holding current running configuration.
+ * @config:	structure holding sysfs mode configuration.
  */
 struct etm_drvdata {
 	struct csdev_access		csa;
@@ -248,6 +249,7 @@ struct etm_drvdata {
 	u32				etmccr;
 	u32				etmccer;
 	u32				traceid;
+	struct etm_config		active_config;
 	struct etm_config		config;
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 862ad0786699..93dc98145b66 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -308,7 +308,7 @@ void etm_config_trace_mode(struct etm_config *config)
 static int etm_parse_event_config(struct etm_drvdata *drvdata,
 				  struct perf_event *event)
 {
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct perf_event_attr *attr = &event->attr;
 	u8 ts_level;
 
@@ -367,7 +367,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 {
 	int i, rc;
 	u32 etmcr;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -442,24 +442,30 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 struct etm_enable_arg {
 	struct etm_drvdata *drvdata;
 	struct coresight_path *path;
+	struct etm_config config;
 	int rc;
 };
 
 static void etm_enable_sysfs_smp_call(void *info)
 {
 	struct etm_enable_arg *arg = info;
+	struct etm_drvdata *drvdata;
 	struct coresight_device *csdev;
 
 	if (WARN_ON(!arg))
 		return;
 
-	csdev = arg->drvdata->csdev;
+	drvdata = arg->drvdata;
+	csdev = drvdata->csdev;
 	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
 		/* Someone is already using the tracer */
 		arg->rc = -EBUSY;
 		return;
 	}
 
+	drvdata->active_config = arg->config;
+	drvdata->traceid = arg->path->trace_id;
+
 	arg->rc = etm_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
@@ -468,6 +474,7 @@ static void etm_enable_sysfs_smp_call(void *info)
 		return;
 	}
 
+	drvdata->sticky_enable = true;
 	csdev->path = arg->path;
 }
 
@@ -512,10 +519,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
-	spin_lock(&drvdata->spinlock);
-
-	drvdata->traceid = path->trace_id;
-
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
 	 * hw configuration will take place on the local CPU during bring up.
@@ -523,23 +526,24 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	if (cpu_online(drvdata->cpu)) {
 		arg.drvdata = drvdata;
 		arg.path = path;
+
+		raw_spin_lock(&drvdata->spinlock);
+		arg.config = drvdata->config;
+		raw_spin_unlock(&drvdata->spinlock);
+
 		ret = smp_call_function_single(drvdata->cpu,
 					       etm_enable_sysfs_smp_call, &arg, 1);
 		if (!ret)
 			ret = arg.rc;
-		if (!ret)
-			drvdata->sticky_enable = true;
 	} else {
 		ret = -ENODEV;
 	}
 
-	if (ret)
-		etm_release_trace_id(drvdata);
-
-	spin_unlock(&drvdata->spinlock);
-
 	if (!ret)
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
+	else
+		etm_release_trace_id(drvdata);
+
 	return ret;
 }
 
@@ -565,7 +569,7 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -631,8 +635,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	spin_lock(&drvdata->spinlock);
-
 	/*
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
@@ -640,8 +642,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	spin_unlock(&drvdata->spinlock);
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace

-- 
2.43.0


