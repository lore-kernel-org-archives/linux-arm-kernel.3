Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EA2FC5918
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjtxVoEBDbhski1Taf5ekSN3ZVWzBWB5tOIyPGOuSRw=; b=4LkX2KmeOQlf5WOBV2y7CSQ+kJ
	fz8zNxsMGTaV7Ld6ua3XaXQjSaZAVgqygH3a2sqkU+c3tMXHJ8wz8IWr6FBhzZN0T881Iw3YEkzfn
	5mjcW3tZyjFcyGU6BTO3Ibnnd+wtLXxaGsqeTuPqInRaYF0+TbXHo4/LXpfzRwQmeJHthAc1eUAYv
	ZY1rR0Zd5Kq9A7eWSa1S+jCW+MJLk4xTBqpLARSQ8MOj+UtzJ3mshjIbvzXuAdyy0bB8BorPm4fy+
	Fi+7dMk7aVFmPR943RUIU9OhY+DVd53MDdGpOZ0KsLtdhRHiGeDUvZiBWqTHB5VmUKpzBN/Rl9mqJ
	W6kZBXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbd-00000005n6F-2fxm;
	Thu, 26 Feb 2026 09:24:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbU-00000005mzh-2GH1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FjtxVoEBDbhski1Taf5ekSN3ZVWzBWB5tOIyPGOuSRw=; b=G+8ZfONoDczmHZqsiWF0I3y+gR
	QHWGDsygTnLfcvXG2uaF5AMb2y6E6WmwE17xoqgjQuEHmKIWns1NLxouKlq3MImMHTvvIDBQFEkWl
	+QbSC3Su1KzNY6/v3D+RVT7UUS5x6us0Bnda2AVEvejnHO7v+1qWHYnhcUoYWn3hft6RJBewtTfcQ
	An+nAVRQFBIwN92U+iyh0m0CAzx8639bZ15YVs6KsqcUSAmtu0O7CfCl018flpO7Z4hncwp507FGX
	M4WdsHZzRhgp7AktAEX/ykobRk1yDkju5M98KWJ+o4sWWI/BnmNRiCpguY/1bTTkP6sXufKFreHPJ
	VOSRE2eQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbR-0000000AbTs-2Ak1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D057153B;
	Thu, 26 Feb 2026 01:24:06 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AD123F62B;
	Thu, 26 Feb 2026 01:24:10 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 26 Feb 2026 09:23:54 +0000
Subject: [PATCH v2 6/8] coresight: cti: Remove hw_powered flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-6-b30fada3cfec@arm.com>
References: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
In-Reply-To: <20260226-arm_coresight_cti_refactor_v1-v2-0-b30fada3cfec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=5776;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=78HBWw3rZu//Oc2CWmqhk0gfqqlUfI4gCU5MKgBJLA4=;
 b=H+KfhLtRJtC5PI/IxROZVUJYG4amXN9yb96yJqVfRm43W+sjwq38uDbykBPnVtw2XW/rWIfMd
 4RqOZ5XLJ+lDlWIwItdTaY9ilz5arWB0fmBWLbqnXR9XQC3Gpzyjpee
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092413_949835_24F1FC4F 
X-CRM114-Status: GOOD (  18.68  )
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

Since the CPU PM code has been removed from the CTI driver and the device
is enabled via runtime PM, pm_runtime_active() can be used to check
whether the device is powered.

As a result, the hw_powered flag is redundant, remove it.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 11 ++++-----
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 29 ++++++-----------------
 drivers/hwtracing/coresight/coresight-cti.h       |  6 ++---
 3 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 28f995263433c8727a7fdeff94fbe0a4286767e8..5ac36f0776181559a87b3ee37d6c9076882576b5 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -80,8 +80,8 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
-	/* no need to do anything if enabled or unpowered*/
-	if (config->hw_enabled || !config->hw_powered)
+	/* no need to do anything if enabled */
+	if (config->hw_enabled)
 		goto cti_state_unchanged;
 
 	/* claim the device */
@@ -114,8 +114,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	if (--drvdata->config.enable_req_count > 0)
 		return 0;
 
-	/* no need to do anything if disabled or cpu unpowered */
-	if (!config->hw_enabled || !config->hw_powered)
+	/* no need to do anything if disabled */
+	if (!config->hw_enabled)
 		return 0;
 
 	CS_UNLOCK(drvdata->base);
@@ -702,9 +702,6 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 		return  PTR_ERR(pdata);
 	}
 
-	/* default to powered - could change on PM notifications */
-	drvdata->config.hw_powered = true;
-
 	/*
 	 * Set up device name - will depend if cpu bound or otherwise.
 	 *
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index a22cc9a2bee24eb6115e7adb61880cc86d03e12e..9ab586a5c9a4fd2a64c542aaaaa625e2299edd62 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -81,19 +81,12 @@ static ssize_t enable_show(struct device *dev,
 			   char *buf)
 {
 	int enable_req;
-	bool enabled, powered;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		enable_req = drvdata->config.enable_req_count;
-		powered = drvdata->config.hw_powered;
-		enabled = drvdata->config.hw_enabled;
-	}
 
-	if (powered)
-		return sprintf(buf, "%d\n", enabled);
-	else
-		return sprintf(buf, "%d\n", !!enable_req);
+	return sprintf(buf, "%d\n", !!enable_req);
 }
 
 static ssize_t enable_store(struct device *dev,
@@ -131,11 +124,7 @@ static ssize_t powered_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
 {
-	bool powered;
-	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
-
-	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		powered = drvdata->config.hw_powered;
+	bool powered = pm_runtime_active(dev->parent);
 
 	return sprintf(buf, "%d\n", powered);
 }
@@ -181,10 +170,8 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 
 	pm_runtime_get_sync(dev->parent);
 
-	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
-		if (drvdata->config.hw_powered)
-			val = cti_read_single_reg(drvdata, cti_attr->off);
-	}
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
+		val = cti_read_single_reg(drvdata, cti_attr->off);
 
 	pm_runtime_put_sync(dev->parent);
 	return sysfs_emit(buf, "0x%x\n", val);
@@ -204,10 +191,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 
 	pm_runtime_get_sync(dev->parent);
 
-	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
-		if (drvdata->config.hw_powered)
-			cti_write_single_reg(drvdata, cti_attr->off, val);
-	}
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
+		cti_write_single_reg(drvdata, cti_attr->off, val);
 
 	pm_runtime_put_sync(dev->parent);
 	return size;
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 2edc0d01812c93fe5a817da366a2862b8490c0a3..8754cb5def7918f03235343844467af8410b75a8 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -122,7 +122,6 @@ struct cti_device {
  * @asicctl_impl: true if asicctl is implemented.
  * @enable_req_count: CTI is enabled alongside >=1 associated devices.
  * @hw_enabled: true if hw is currently enabled.
- * @hw_powered: true if associated cpu powered on, or no cpu.
  * @trig_in_use: bitfield of in triggers registered as in use.
  * @trig_out_use: bitfield of out triggers registered as in use.
  * @trig_out_filter: bitfield of out triggers that are blocked if filter
@@ -146,7 +145,6 @@ struct cti_config {
 	/* cti enable control */
 	int enable_req_count;
 	bool hw_enabled;
-	bool hw_powered;
 
 	/* registered triggers and filtering */
 	u32 trig_in_use;
@@ -235,10 +233,10 @@ struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
-/* cti powered and enabled */
+/* Check if a cti device is enabled */
 static inline bool cti_is_active(struct cti_config *cfg)
 {
-	return cfg->hw_powered && cfg->hw_enabled;
+	return cfg->hw_enabled;
 }
 
 #endif  /* _CORESIGHT_CORESIGHT_CTI_H */

-- 
2.34.1


