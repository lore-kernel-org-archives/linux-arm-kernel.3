Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBCA1099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guWA+xSgLcVXSfBBMV0rI2d8UV58WuZeVT0KUhgD6Io=; b=VgCiec9uJHiHrMOLAh4y5t6FZa
	PeEDyKf2QOFtwVLFkK7XdFePLDO/MJj5w+vIixy8STc0k/eZFK7icrA8InvpvMQkv47eDewGlWkzT
	qfawworEcEXPrsDerHuWFNM27jBf75X3ky/PodvjvwHJk/5VgXaFEiykYC3azK34QPxnZP07mV5Dg
	MCbKLrjq+lR9he2Trf0qu1qWCEKs50r2f+KDCpiPH9RIFLrP1QPj1P55dwmxcv8qZyjdEeNjYBdpH
	m2D2AQU6cFFz52/mH+j+VeUftp0wFJiobbd1NchKAzje0LaWxJnVoxcV2KhBXGAeJBowHZGgxVDnh
	EkRWZtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dse-0000000DHx5-3VLw;
	Fri, 20 Mar 2026 17:43:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsR-0000000DHna-1bwF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C1C7165C;
	Fri, 20 Mar 2026 10:43:08 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 445313FA1F;
	Fri, 20 Mar 2026 10:43:12 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:42:46 +0000
Subject: [PATCH v7 04/20] coresight: Move per-CPU source pointer to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-4-327ddd36b58b@arm.com>
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=6252;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Q1XmRMOiibfz7ZBnkMXcAOF156IOJ/fQlqSm+q1vvtw=;
 b=z0icuA6UsLmuFB8IrYL8FOTO2fr9i3bNG7bxgScW5gslj+vySDOMcJJbOh5u2pDHqtWa64vUP
 SX51gRvdMtkAkJEP23osK5Ku+/ZFwK7oX3tXOpwAmv10RaLID86efqI
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104315_555236_CBBB35C2 
X-CRM114-Status: GOOD (  18.95  )
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

Move the per-CPU source pointer from ETM perf to the core layer, as this
will be used for not only perf session and also for CPU PM notifiers.

Provides coresight_{set|clear|get}_percpu_source() helpers to access the
per-CPU source pointer. Add a raw spinlock to protect exclusive access.

Device registration and unregistration call the set and clear helpers
for init and teardown the pointers.

Update callers to invoke coresight_get_percpu_source() for retrieving
the pointer.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 32 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm-perf.c | 21 +++++++---------
 drivers/hwtracing/coresight/coresight-priv.h     |  1 +
 3 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5639c8a2124d97148525c3267dacd86510da7a20..df1ea642df7204aeb41c56c2751d0f3a00bbf7a4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -35,6 +35,9 @@
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
 
+static DEFINE_RAW_SPINLOCK(coresight_dev_lock);
+static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
+
 /**
  * struct coresight_node - elements of a path, from source to sink
  * @csdev:	Address of an element.
@@ -82,6 +85,33 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
+static void coresight_set_percpu_source(struct coresight_device *csdev)
+{
+	if (!csdev || !coresight_is_percpu_source(csdev))
+		return;
+
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+	per_cpu(csdev_source, csdev->cpu) = csdev;
+}
+
+static void coresight_clear_percpu_source(struct coresight_device *csdev)
+{
+	if (!csdev || !coresight_is_percpu_source(csdev))
+		return;
+
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+	per_cpu(csdev_source, csdev->cpu) = NULL;
+}
+
+struct coresight_device *coresight_get_percpu_source(int cpu)
+{
+	if (WARN_ON(cpu < 0))
+		return NULL;
+
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+	return per_cpu(csdev_source, cpu);
+}
+
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
@@ -1403,6 +1433,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	if (ret)
 		goto out_unlock;
 
+	coresight_set_percpu_source(csdev);
 	mutex_unlock(&coresight_mutex);
 
 	if (cti_assoc_ops && cti_assoc_ops->add)
@@ -1432,6 +1463,7 @@ void coresight_unregister(struct coresight_device *csdev)
 		cti_assoc_ops->remove(csdev);
 
 	mutex_lock(&coresight_mutex);
+	coresight_clear_percpu_source(csdev);
 	etm_perf_del_symlink_sink(csdev);
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index cae6738e9906c35d291e4b0f3feae37306b95c06..a2c1c876099d1f5dacf039d733b78827296d9c2e 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -49,7 +49,6 @@ struct etm_ctxt {
 };
 
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
-static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
 GEN_PMU_FORMAT_ATTR(cycacc);
 GEN_PMU_FORMAT_ATTR(timestamp);
@@ -356,7 +355,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		struct coresight_path *path;
 		struct coresight_device *csdev;
 
-		csdev = per_cpu(csdev_src, cpu);
+		csdev = coresight_get_percpu_source(cpu);
 		/*
 		 * If there is no ETM associated with this CPU clear it from
 		 * the mask and continue with the rest. If ever we try to trace
@@ -479,10 +478,11 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct etm_event_data *event_data;
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
-	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
+	struct coresight_device *sink, *csdev;
 	struct coresight_path *path;
 	u64 hw_id;
 
+	csdev = coresight_get_percpu_source(cpu);
 	if (!csdev)
 		goto fail;
 
@@ -630,12 +630,14 @@ static void etm_event_stop(struct perf_event *event, int mode)
 {
 	int cpu = smp_processor_id();
 	unsigned long size;
-	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
+	struct coresight_device *sink, *csdev;
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct etm_event_data *event_data;
 	struct coresight_path *path;
 
+	csdev = coresight_get_percpu_source(cpu);
+
 	if (mode & PERF_EF_PAUSE)
 		return etm_event_pause(event, csdev, ctxt);
 
@@ -833,17 +835,12 @@ int etm_perf_symlink(struct coresight_device *csdev, bool link)
 	if (!etm_perf_up)
 		return -EPROBE_DEFER;
 
-	if (link) {
+	if (link)
 		ret = sysfs_create_link(&pmu_dev->kobj, &cs_dev->kobj, entry);
-		if (ret)
-			return ret;
-		per_cpu(csdev_src, cpu) = csdev;
-	} else {
+	else
 		sysfs_remove_link(&pmu_dev->kobj, entry);
-		per_cpu(csdev_src, cpu) = NULL;
-	}
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(etm_perf_symlink);
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd703b2873e41b4ce0c2564d2ce9bbad..c96d63657f9334be890cca2320abbb8cbd807802 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -248,6 +248,7 @@ void coresight_add_helper(struct coresight_device *csdev,
 
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
+struct coresight_device *coresight_get_percpu_source(int cpu);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);

-- 
2.34.1


