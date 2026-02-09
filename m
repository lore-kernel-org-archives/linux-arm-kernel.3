Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E468EE7E0BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Q8PXO+9UC+8xVkvE9v9jl+DyKnXIYvX5W1kHM6vXy0=; b=iAM2O4bKMNyhD/nIHdNuG4HJXf
	prHXMrXsdOgHAyjLPld3vvRsI9Mq+qo1ce6SEFMdZi6ZFP16NUvAd3UrqdJ0KgRyqnM5bqmZyutBx
	GVUnVOuEFI0J0BG+/C1EK9Ry655M6SmnvS0LF3R7BNR3/bt39gZqGUt5Cpq+EVxXcFkznYtTDi42U
	G2UwupQZGMgtSoLNeQvD4REyf4iwR+kMhhfqfwqobYpkGia+pjjBUxEJRZ5G/Ub9cS5eM0gOX5i5E
	6H506zsJo2YL/8C2UTAg7BVAnHlkVqZSr3lfUhVAFeeS8cIcr9WR6twMM7rG+tRpjwi3mRpoYxYbh
	HwFZ3D6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZw-0000000Fp0h-3eBa;
	Mon, 09 Feb 2026 18:01:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVZt-0000000Foxp-2atg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:01:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73730339;
	Mon,  9 Feb 2026 10:01:34 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C08EE3F63F;
	Mon,  9 Feb 2026 10:01:38 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Feb 2026 18:01:16 +0000
Subject: [PATCH 6/8] coresight: cti: Remove hw_powered flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-arm_coresight_cti_refactor_v1-v1-6-db71ab4d200b@arm.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tingwei Zhang <quic_tingwei@quicinc.com>, 
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770660084; l=5818;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=s2izx/skdpjt43YiiPSi+hbG9caTa0Cbpq+GfQO2Hp8=;
 b=+L8RERsEZ4Dq5fpBoKvQPwu2wtcjYEujuquNX+Px0WCffL1JFgQo1ZaF8DHnE3JGXQ0P9SqET
 BRFSz9VQ1NbC5k/926anldx4HYXDm3D/myVW5YnLdmiGlIoM5NHIHVE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_100141_751450_959D754B 
X-CRM114-Status: GOOD (  19.08  )
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

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 11 ++++-----
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 29 ++++++-----------------
 drivers/hwtracing/coresight/coresight-cti.h       |  6 ++---
 3 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 48db87e2fd0f1a669f2d20a0014108da215e26fd..3b3b851a018851a8656eba64e638c61f3d04b99f 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -89,8 +89,8 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
-	/* no need to do anything if enabled or unpowered*/
-	if (config->hw_enabled || !config->hw_powered)
+	/* no need to do anything if enabled */
+	if (config->hw_enabled)
 		goto cti_state_unchanged;
 
 	/* claim the device */
@@ -123,8 +123,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	if (--drvdata->config.enable_req_count > 0)
 		return 0;
 
-	/* no need to do anything if disabled or cpu unpowered */
-	if (!config->hw_enabled || !config->hw_powered)
+	/* no need to do anything if disabled */
+	if (!config->hw_enabled)
 		return 0;
 
 	CS_UNLOCK(drvdata->base);
@@ -725,9 +725,6 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 		return  PTR_ERR(pdata);
 	}
 
-	/* default to powered - could change on PM notifications */
-	drvdata->config.hw_powered = true;
-
 	/* set up device name - will depend if cpu bound or otherwise */
 	if (drvdata->ctidev.cpu >= 0)
 		cti_desc.name = devm_kasprintf(dev, GFP_KERNEL, "cti_cpu%d",
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
index 400c1545b22bfe631144d24faceb354ff2d49166..c858847a5b80036fb48180ff7fbbfe684028cb89 100644
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
@@ -237,10 +235,10 @@ struct coresight_platform_data *
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


