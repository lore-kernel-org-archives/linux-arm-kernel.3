Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A70ECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyGafwdCt3x/g0QzVWJIypA8vetW0tTDwYoQi1w4h74=; b=l+TCRBOmuvZKK9zwgCCrbzGpEL
	gzZf49TXSVPieIEzaOmTDd2ZzQmlBWcLkr38kGfbx7gVbBQpMj2Vjw0XVolyW28OSQ8gVG9R3AKv0
	Fa9xtHqNyqpZ7A5NdqH+nRtoWufOJlWi2Pfyl0pEBYkVa/h1+eBCxAwTVb8hbnsbXDNeD28rKUNIX
	TmsgT+jtbdmqCc7a2WzsUAiblMltAW/Go+6K3xTv1EF91F/6+esH7HvffV1/vH2Mv1CXfaRWDA3Sl
	mCilqEfjwLmoiXFgWZ9mtvQtJsepCCQiF2qNekBgeQ57+7xYq2qjIwN3OaFncOJtUwLhuHuwpZPLt
	u8unCSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdy-0000000983E-2YHp;
	Fri, 15 May 2026 18:52:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxdp-000000097tu-3ZKk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:52:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F1111516;
	Fri, 15 May 2026 11:52:04 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ED783F836;
	Fri, 15 May 2026 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871129; bh=k2A7GtXH6QZ5Unx0VpGpTx7vHk1WJEBp7z9kY2xYmQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AaTcUwQOLnU9QV/kVicMJALgysbVF1hbewqjv4M+De9i01f4S7wIBulNaPHkVN0CK
	 mcfNVNqBVXQ+5nTEkSBWnCZTFVMFG8Ezhh5Ivob8LQMDZa8d8qvmXHjDJ6RMt3TMjT
	 kodKwrMWDIJIBhM3ppznuloV/dS+ZfaEzZAWyTpc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:32 +0100
Subject: [PATCH v13 09/28] coresight: Move per-CPU source pointer to core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-9-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=5684;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=k2A7GtXH6QZ5Unx0VpGpTx7vHk1WJEBp7z9kY2xYmQQ=;
 b=1sJM0rtOzzg0fpbqoSPTw8d0wd2Z8l04uMeQPWiIaIyWMutW0ZCXs8KNYIrYb9NkT+ApYnlud
 FKEUaJG4Q7nAro4/5+9SRS77beNn5r14eOPKrX1VCG9LDmTg1eBSEok
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115210_001186_B7C6DBF8 
X-CRM114-Status: GOOD (  18.58  )
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
index 6b098c3cab0b8a710863bceb2c5f9584ad0bd8af..995a4a1bab3d983141237f453b6f630e73e69e5e 100644
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
@@ -1452,6 +1488,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	if (ret)
 		goto out_unlock;
 
+	coresight_set_percpu_source(csdev);
 	mutex_unlock(&coresight_mutex);
 
 	if (cti_assoc_ops && cti_assoc_ops->add)
@@ -1481,6 +1518,7 @@ void coresight_unregister(struct coresight_device *csdev)
 		cti_assoc_ops->remove(csdev);
 
 	mutex_lock(&coresight_mutex);
+	coresight_clear_percpu_source(csdev);
 	etm_perf_del_symlink_sink(csdev);
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index bab85f7dac4757173912639ea016cdc32e5616fb..b9e556818c3c6873ed53e5a1b8052443dd7740d0 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -49,7 +49,6 @@ struct etm_ctxt {
 };
 
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
-static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
 GEN_PMU_FORMAT_ATTR(cycacc);
 GEN_PMU_FORMAT_ATTR(timestamp);
@@ -386,7 +385,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		struct coresight_path *path;
 		struct coresight_device *csdev;
 
-		csdev = per_cpu(csdev_src, cpu);
+		csdev = coresight_get_percpu_source(cpu);
 		/*
 		 * If there is no ETM associated with this CPU clear it from
 		 * the mask and continue with the rest. If ever we try to trace
@@ -864,17 +863,12 @@ int etm_perf_symlink(struct coresight_device *csdev, bool link)
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
index 75029744561f7744225c7b866eee60e0f7cf9e10..4d6f5bc1df9cc5dfd974a8b27820328e7916f169 100644
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


