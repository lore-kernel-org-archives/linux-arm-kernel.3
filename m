Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A5C109C022
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssOfH9ojQq0B/L2uc5qIs00FMt0UeO1HNIrh4IaqKXA=; b=KpZ9cAsUpou/W1OZJ/03g5U+sG
	RAHUeofHrXrB6h2NxlfQwRYCqfNGj1i6QnGF2Bpk4bedfgCSlB6PH+K/gCpbjNlI7C0Se/nHXxx5Y
	7Pv6tv76u+xj1GdY+gdXcCJwRW0/xbo2kok41GbNxZeD81Jt7mK7CoSLmUJyWyKgTsZDOy5sEcDxk
	xPotbJmB848Sg++qP2eAC/RSfP8ZQyiIUAtQURf7xP06C1mxpYCSKfYa1vKHi53fQFtl28pNCh6qN
	N5eTVDExUUHZMHlvl/EuKsE8vmyd6hrUiv0kqPLtjxD6ZlrXgIzPXxTALfKxtMdFkLZcGs4Twy1ce
	2X7Tt1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCo-00000003Zth-0XIX;
	Wed, 25 Mar 2026 14:27:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCR-00000003ZbZ-0x8M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CF851F91;
	Wed, 25 Mar 2026 07:27:04 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BCCE3F836;
	Wed, 25 Mar 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448830; bh=awBdENP0j8XNzEsS0ZwVSC1EmummRDa8T6mu+jrDEkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q+hxrqBZxeEYu224b5vGlM15J1P77vRxtfZNwUKjSkUU9V+5yn3PJtWogxhgfJgRF
	 XpGp68wIxWoKOBex1EWJ+TqehJQ/0Sev9JPjx6JD3O+AyHI33PdZuVOphMdnezP7zV
	 QU+Kx4t/5yVvq++s1NRkYzyGRIzrTNZ8EIZlU+FY=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:42 +0000
Subject: [PATCH v8 05/23] coresight: Move per-CPU source pointer to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-5-7b1902e18041@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448816; l=6252;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=awBdENP0j8XNzEsS0ZwVSC1EmummRDa8T6mu+jrDEkg=;
 b=Bqigv3L5RTcKy664kxYJ923NMSD9ybwZuPLbiBxJL9yfIE2saFJ52vkrzNruxxCcA1ZA6khbX
 AcP2g4xapSKDM3WsDaKLGAn3yNLpO+ZXIybz47r2SRI8R2SFutKSXs+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072711_358739_A977E004 
X-CRM114-Status: GOOD (  20.17  )
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
index 6907da35ed02fa58f8d30f5576627a6ce3b88362..93acbd36c9c0efcc311c5374463b2ae9a4e6e49b 100644
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
@@ -1422,6 +1452,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	if (ret)
 		goto out_unlock;
 
+	coresight_set_percpu_source(csdev);
 	mutex_unlock(&coresight_mutex);
 
 	if (cti_assoc_ops && cti_assoc_ops->add)
@@ -1451,6 +1482,7 @@ void coresight_unregister(struct coresight_device *csdev)
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


