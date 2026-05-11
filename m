Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40C1CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9021ImeG5AVbXs6+rm7r5Qpf+Mtj7EGSHAWOnus9Muk=; b=hqe9X/suajrOjO3YJ6w9yl5tif
	SEUjmKdT/8b4+mp8Pp+XcWW4hJXujBtIs1KM/V8plw/NSM8d7/Dbhl4FiOTOcIBrmxL8kz8M9Rc2x
	7HgdkM8k7bryu7dunon6OPVE8na4tw4kpU95RO+ml2ZUsa1YJE4/HudAMpe8yYujnJykiEjogQdeg
	mqYDocCWpPQ/fZ7Oi95OcOTXI/ZQcKgUude2c7ulNhv7CSz7an92wpJy7W4h3AripdfHlg5rtFueQ
	FhAd5OqaDoPws+sEBk+dDNpBsF3i4evuWG5yPCiKvJIJfm5EqoXk9LVwMqmsdnFdFafZpGCnyAEjP
	QK1MYoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY9-0000000DFU2-3Nf3;
	Mon, 11 May 2026 11:11:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY4-0000000DFLn-1fOw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9021ImeG5AVbXs6+rm7r5Qpf+Mtj7EGSHAWOnus9Muk=; b=Qkn5P6CrUb0QfjPvBxeVm8WFNg
	THx6OTB7qEqhdxN1SLqJfPlP+e1wmrZ2U9f9zLQcPIKV6F/Fwx+KbhvSYxkNDwxx1aKuoFjItIDP+
	A2++EZ4N/TLzEsNYVNb9HAzNih5a7qTHcDWZ/G3rG1nsFIVyRqmP8gF+4idJmERHaQBPHvcibipsK
	g/Ue4MjEr5KM0GVxxI5enVRe+7ntqy+u8vbb9GOZZ2srvNtQ7XN310xi5nnsd49mz1M7orbXOA5c7
	MR/YaG+wPJ5DY7PDW2bYYucEVQyxq5APZJ5aDZTGTCVe78hchw4y+eGh6JVLAW7f4Dpd53/uny6po
	qoXEAijw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXs-0000000BQia-0AbH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF39316F8;
	Mon, 11 May 2026 04:11:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76C9A3F99C;
	Mon, 11 May 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497890; bh=fw87GmI+02vLDRqH7oYAmdhgf3+b08sK6EGH0qpJ19w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gwXe4Is8Kx+DgqqQCUr22YeLeSN0lH5A/3MoFlU6cBsUA7OJC8JwUdwnb66t9Sj6u
	 VhBKHSU0eVqBH3WBPn66fH+UtkHurZpvVIU0aMNkf2TElcTq1ZnJ1JovlEgeLCRdeC
	 XWnoZEPAumpoC/t9bNez+vexPGiGSfM0bHIiMro4=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:53 +0100
Subject: [PATCH v12 09/28] coresight: Move per-CPU source pointer to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-9-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=5684;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=fw87GmI+02vLDRqH7oYAmdhgf3+b08sK6EGH0qpJ19w=;
 b=dmdusOnqZpqfrSH5XGPgi/PdBTFFyE4jfEfuT7M6R10cTd3SVqJifXrp6xL49bOwDVU3dgyLr
 PXUUzdRVvqjCFig9id2JK801dsjCUAgEHpSMhysmZIgsRb5xYykARnX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121133_021088_A7E1196B 
X-CRM114-Status: GOOD (  18.40  )
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

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 38 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm-perf.c | 14 +++------
 drivers/hwtracing/coresight/coresight-priv.h     |  1 +
 3 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a3a03356c4e3729c530cd274f071500c4ae8d490..c2a290903cbf416651e7ec7057a1ee0b36bb6a8b 100644
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
@@ -82,6 +85,39 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
+static void coresight_set_percpu_source(struct coresight_device *csdev)
+{
+	if (!csdev || !coresight_is_percpu_source(csdev))
+		return;
+
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+
+	/* Expect no device to be set yet */
+	WARN_ON(per_cpu(csdev_source, csdev->cpu));
+	per_cpu(csdev_source, csdev->cpu) = csdev;
+}
+
+static void coresight_clear_percpu_source(struct coresight_device *csdev)
+{
+	if (!csdev || !coresight_is_percpu_source(csdev))
+		return;
+
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+
+	/* The per-CPU pointer should contain the same csdev */
+	WARN_ON(per_cpu(csdev_source, csdev->cpu) != csdev);
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
 struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
@@ -1449,6 +1485,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	if (ret)
 		goto out_unlock;
 
+	coresight_set_percpu_source(csdev);
 	mutex_unlock(&coresight_mutex);
 
 	if (cti_assoc_ops && cti_assoc_ops->add)
@@ -1478,6 +1515,7 @@ void coresight_unregister(struct coresight_device *csdev)
 		cti_assoc_ops->remove(csdev);
 
 	mutex_lock(&coresight_mutex);
+	coresight_clear_percpu_source(csdev);
 	etm_perf_del_symlink_sink(csdev);
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 206a983239a0b1983b2b78c5e78a5fd988d308ce..b9891c8ac078d99fc2180c858dc56b1e7dbec2d9 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -49,7 +49,6 @@ struct etm_ctxt {
 };
 
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
-static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
 GEN_PMU_FORMAT_ATTR(cycacc);
 GEN_PMU_FORMAT_ATTR(timestamp);
@@ -385,7 +384,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		struct coresight_path *path;
 		struct coresight_device *csdev;
 
-		csdev = per_cpu(csdev_src, cpu);
+		csdev = coresight_get_percpu_source(cpu);
 		/*
 		 * If there is no ETM associated with this CPU clear it from
 		 * the mask and continue with the rest. If ever we try to trace
@@ -863,17 +862,12 @@ int etm_perf_symlink(struct coresight_device *csdev, bool link)
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
index a0cd1a0ad2a182f762cc9721fd93725f2d4ef688..7ce79fa36232bb1b0af768423777bab27cacee95 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -249,6 +249,7 @@ void coresight_add_helper(struct coresight_device *csdev,
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
 struct coresight_device *coresight_get_source(struct coresight_path *path);
+struct coresight_device *coresight_get_percpu_source(int cpu);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);

-- 
2.34.1


