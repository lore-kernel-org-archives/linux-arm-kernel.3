Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2B4FC5914
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbZMTkUyvN8lEhczPaTs65ZU3mJ4mMrAkAvCbTEqYh0=; b=iNM2fDsgOvFcnZdNXjQ4cnmRxz
	W6qr6SQAyG84TgxCiZEPTgAOlVVRWyzQaI+jxhWb0IsYjwaL2+e3xs5uCw/usrWEaojZbyVYT72In
	moFxBMJCYqVfwgETezbBZIP4z/K36nUhWILqO0QEvQx9EzaOJqJ39h62ot6/CiMxk2sbvTKIRwA60
	xnKgcxvclyY/WpuyNANMN2R+u8KzLpceabqAvPvx7FO2KN1+a3M2rPffrGeHmwOfsTCwUSD/Gyl0s
	pj0eVjHWoOBy1cKhMPJz7gyKb/kaCNnhxLrl0uxr2cQGMwECMIDI2uEIcqjjHe3vVSZRtepuSVrH8
	Yb4LFmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbL-00000005muf-43xb;
	Thu, 26 Feb 2026 09:24:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbJ-00000005mtt-3zc8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 09:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fbZMTkUyvN8lEhczPaTs65ZU3mJ4mMrAkAvCbTEqYh0=; b=U5FisSDgZixxz8Klj0kTbaAZr2
	mH/DbYsZQJgWPLSeJNls9wqvx5UTadQdmpLjiREcMKDHr+/jKN3/Al16ZqH1Notuou4a7XQD0Rkq3
	O0anb7XfJqha1u1iNAeTWCLaVlASujUHBL5hoshcha9dHXEN6EvhMI3mUkzaEhSB0EFNk+GUJD/AX
	j/TAhXa7ILIlCeiGAdp5j/PDPA/OKhypodHiUiHvRPPUvNTT8FaJOtmzO6RgNOb/l7kI8S6XgKL6Y
	MduMDiuJrCr+r6zXymGxjKvf4K4Q8CsAc48eZEVnFShxXA4+AwqmAwljWXyaremm4Z7MrqctpKjzX
	Jp4jTzrg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXbG-0000000AbSM-2dlz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:24:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73DE7153B;
	Thu, 26 Feb 2026 01:23:55 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF8B63F62B;
	Thu, 26 Feb 2026 01:23:59 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 26 Feb 2026 09:23:49 +0000
Subject: [PATCH v2 1/8] coresight: cti: Make spinlock usage consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-arm_coresight_cti_refactor_v1-v2-1-b30fada3cfec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772097837; l=18093;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=pMfExa9UsfodncwklBjNdHqOpkjX5bE7fYev2ubLSyQ=;
 b=445vKHEYfCWjkHTyXtp6m1m4hWND8wIC+v/BB/8CqfOqJWmtCVNw+/BiOm7Rg34Fe/clA1wex
 +9bBWbN/jbLCXJBoB8lfQMiX6KWSgXvIRUpsPfCuu7qE7b6NM8IadHB
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_092403_109718_86964CE3 
X-CRM114-Status: GOOD (  21.20  )
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

The spinlock is acquired sometimes with IRQs disabled and sometimes
without.  This leads to inconsistent semantics: the lock can be either
HARDIRQ-safe or HARDIRQ-unsafe, which may trigger lockdep complaints.

Make spinlock usage consistent by acquiring it with disabling IRQs.  It
is possible for sysfs knobs to acquire the spinlock for accessing a
CTI device, while at the same time a perf session sends an IPI to
enable the same CTI device.  In this case, the spinlock must be
IRQ-safe, which is why all lock acquisitions are changed to disable
IRQs.

Use guard() and scoped_guard() for spinlock to tidy up the code.

Fixes: 984f37efa385 ("coresight: cti: Write regsiters directly in cti_enable_hw()")
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  |  74 ++++-------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 145 ++++++++++++----------
 2 files changed, 103 insertions(+), 116 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index fddc8f31b91dccba1506aae8c2fd5f348240b98b..e3c98d89c987c10faafa02d1dbd721cfd4187edb 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -81,10 +81,9 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 static int cti_enable_hw(struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
-	unsigned long flags;
-	int rc = 0;
+	int rc;
 
-	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* no need to do anything if enabled or unpowered*/
 	if (config->hw_enabled || !config->hw_powered)
@@ -93,22 +92,15 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 	/* claim the device */
 	rc = coresight_claim_device(drvdata->csdev);
 	if (rc)
-		goto cti_err_not_enabled;
+		return rc;
 
 	cti_write_all_hw_regs(drvdata);
 
 	config->hw_enabled = true;
-	drvdata->config.enable_req_count++;
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-	return rc;
 
 cti_state_unchanged:
 	drvdata->config.enable_req_count++;
-
-	/* cannot enable due to error */
-cti_err_not_enabled:
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-	return rc;
+	return 0;
 }
 
 /* re-enable CTI on CPU when using CPU hotplug */
@@ -116,25 +108,21 @@ static void cti_cpuhp_enable_hw(struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	config->hw_powered = true;
 
 	/* no need to do anything if no enable request */
 	if (!drvdata->config.enable_req_count)
-		goto cti_hp_not_enabled;
+		return;
 
 	/* try to claim the device */
 	if (coresight_claim_device(drvdata->csdev))
-		goto cti_hp_not_enabled;
+		return;
 
 	cti_write_all_hw_regs(drvdata);
 	config->hw_enabled = true;
-	raw_spin_unlock(&drvdata->spinlock);
 	return;
-
-	/* did not re-enable due to no claim / no request */
-cti_hp_not_enabled:
-	raw_spin_unlock(&drvdata->spinlock);
 }
 
 /* disable hardware */
@@ -142,23 +130,20 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
-	int ret = 0;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* don't allow negative refcounts, return an error */
-	if (!drvdata->config.enable_req_count) {
-		ret = -EINVAL;
-		goto cti_not_disabled;
-	}
+	if (!drvdata->config.enable_req_count)
+		return -EINVAL;
 
 	/* check refcount - disable on 0 */
 	if (--drvdata->config.enable_req_count > 0)
-		goto cti_not_disabled;
+		return 0;
 
 	/* no need to do anything if disabled or cpu unpowered */
 	if (!config->hw_enabled || !config->hw_powered)
-		goto cti_not_disabled;
+		return 0;
 
 	CS_UNLOCK(drvdata->base);
 
@@ -168,13 +153,7 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 
 	coresight_disclaim_device_unlocked(csdev);
 	CS_LOCK(drvdata->base);
-	raw_spin_unlock(&drvdata->spinlock);
-	return ret;
-
-	/* not disabled this call */
-cti_not_disabled:
-	raw_spin_unlock(&drvdata->spinlock);
-	return ret;
+	return 0;
 }
 
 void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
@@ -189,11 +168,11 @@ void cti_write_intack(struct device *dev, u32 ackval)
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	/* write if enabled */
 	if (cti_active(config))
 		cti_write_single_reg(drvdata, CTIINTACK, ackval);
-	raw_spin_unlock(&drvdata->spinlock);
 }
 
 /*
@@ -360,7 +339,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
 		      CTIOUTEN(trigger_idx));
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* read - modify write - the trigger / channel enable value */
 	reg_value = direction == CTI_TRIG_IN ? config->ctiinen[trigger_idx] :
@@ -379,7 +358,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	/* write through if enabled */
 	if (cti_active(config))
 		cti_write_single_reg(drvdata, reg_offset, reg_value);
-	raw_spin_unlock(&drvdata->spinlock);
+
 	return 0;
 }
 
@@ -397,7 +376,8 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
 
 	chan_bitmask = BIT(channel_idx);
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	reg_value = config->ctigate;
 	switch (op) {
 	case CTI_GATE_CHAN_ENABLE:
@@ -417,7 +397,7 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
 		if (cti_active(config))
 			cti_write_single_reg(drvdata, CTIGATE, reg_value);
 	}
-	raw_spin_unlock(&drvdata->spinlock);
+
 	return err;
 }
 
@@ -436,7 +416,8 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 
 	chan_bitmask = BIT(channel_idx);
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	reg_value = config->ctiappset;
 	switch (op) {
 	case CTI_CHAN_SET:
@@ -464,7 +445,6 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 
 	if ((err == 0) && cti_active(config))
 		cti_write_single_reg(drvdata, reg_offset, reg_value);
-	raw_spin_unlock(&drvdata->spinlock);
 
 	return err;
 }
@@ -667,7 +647,7 @@ static int cti_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	if (WARN_ON_ONCE(drvdata->ctidev.cpu != cpu))
 		return NOTIFY_BAD;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	switch (cmd) {
 	case CPU_PM_ENTER:
@@ -707,7 +687,6 @@ static int cti_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	}
 
 cti_notify_exit:
-	raw_spin_unlock(&drvdata->spinlock);
 	return notify_res;
 }
 
@@ -734,11 +713,12 @@ static int cti_dying_cpu(unsigned int cpu)
 	if (!drvdata)
 		return 0;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	drvdata->config.hw_powered = false;
 	if (drvdata->config.hw_enabled)
 		coresight_disclaim_device(drvdata->csdev);
-	raw_spin_unlock(&drvdata->spinlock);
+
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 572b80ee96fbf18ec8cf9abc30d109a676dfbc5d..455d08bcccd49a3f1eac8abd8246806ef73a9ab6 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -84,11 +84,11 @@ static ssize_t enable_show(struct device *dev,
 	bool enabled, powered;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-	enable_req = drvdata->config.enable_req_count;
-	powered = drvdata->config.hw_powered;
-	enabled = drvdata->config.hw_enabled;
-	raw_spin_unlock(&drvdata->spinlock);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		enable_req = drvdata->config.enable_req_count;
+		powered = drvdata->config.hw_powered;
+		enabled = drvdata->config.hw_enabled;
+	}
 
 	if (powered)
 		return sprintf(buf, "%d\n", enabled);
@@ -134,9 +134,8 @@ static ssize_t powered_show(struct device *dev,
 	bool powered;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-	powered = drvdata->config.hw_powered;
-	raw_spin_unlock(&drvdata->spinlock);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
+		powered = drvdata->config.hw_powered;
 
 	return sprintf(buf, "%d\n", powered);
 }
@@ -181,10 +180,12 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	u32 val = 0;
 
 	pm_runtime_get_sync(dev->parent);
-	raw_spin_lock(&drvdata->spinlock);
-	if (drvdata->config.hw_powered)
-		val = readl_relaxed(drvdata->base + cti_attr->off);
-	raw_spin_unlock(&drvdata->spinlock);
+
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (drvdata->config.hw_powered)
+			val = readl_relaxed(drvdata->base + cti_attr->off);
+	}
+
 	pm_runtime_put_sync(dev->parent);
 	return sysfs_emit(buf, "0x%x\n", val);
 }
@@ -202,10 +203,12 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 		return -EINVAL;
 
 	pm_runtime_get_sync(dev->parent);
-	raw_spin_lock(&drvdata->spinlock);
-	if (drvdata->config.hw_powered)
-		cti_write_single_reg(drvdata, cti_attr->off, val);
-	raw_spin_unlock(&drvdata->spinlock);
+
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (drvdata->config.hw_powered)
+			cti_write_single_reg(drvdata, cti_attr->off, val);
+	}
+
 	pm_runtime_put_sync(dev->parent);
 	return size;
 }
@@ -264,17 +267,18 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
 
-	raw_spin_lock(&drvdata->spinlock);
-	if ((reg_offset >= 0) && cti_active(config)) {
-		CS_UNLOCK(drvdata->base);
-		val = readl_relaxed(drvdata->base + reg_offset);
-		if (pcached_val)
-			*pcached_val = val;
-		CS_LOCK(drvdata->base);
-	} else if (pcached_val) {
-		val = *pcached_val;
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if ((reg_offset >= 0) && cti_active(config)) {
+			CS_UNLOCK(drvdata->base);
+			val = readl_relaxed(drvdata->base + reg_offset);
+			if (pcached_val)
+				*pcached_val = val;
+			CS_LOCK(drvdata->base);
+		} else if (pcached_val) {
+			val = *pcached_val;
+		}
 	}
-	raw_spin_unlock(&drvdata->spinlock);
+
 	return sprintf(buf, "%#x\n", val);
 }
 
@@ -293,15 +297,16 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	raw_spin_lock(&drvdata->spinlock);
-	/* local store */
-	if (pcached_val)
-		*pcached_val = (u32)val;
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		/* local store */
+		if (pcached_val)
+			*pcached_val = (u32)val;
+
+		/* write through if offset and enabled */
+		if ((reg_offset >= 0) && cti_active(config))
+			cti_write_single_reg(drvdata, reg_offset, val);
+	}
 
-	/* write through if offset and enabled */
-	if ((reg_offset >= 0) && cti_active(config))
-		cti_write_single_reg(drvdata, reg_offset, val);
-	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
 
@@ -349,9 +354,9 @@ static ssize_t inout_sel_store(struct device *dev,
 	if (val > (CTIINOUTEN_MAX - 1))
 		return -EINVAL;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	drvdata->config.ctiinout_sel = val;
-	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
 static DEVICE_ATTR_RW(inout_sel);
@@ -364,10 +369,11 @@ static ssize_t inen_show(struct device *dev,
 	int index;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-	index = drvdata->config.ctiinout_sel;
-	val = drvdata->config.ctiinen[index];
-	raw_spin_unlock(&drvdata->spinlock);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		index = drvdata->config.ctiinout_sel;
+		val = drvdata->config.ctiinen[index];
+	}
+
 	return sprintf(buf, "%#lx\n", val);
 }
 
@@ -383,14 +389,15 @@ static ssize_t inen_store(struct device *dev,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	index = config->ctiinout_sel;
 	config->ctiinen[index] = val;
 
 	/* write through if enabled */
 	if (cti_active(config))
 		cti_write_single_reg(drvdata, CTIINEN(index), val);
-	raw_spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(inen);
@@ -403,10 +410,11 @@ static ssize_t outen_show(struct device *dev,
 	int index;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-	index = drvdata->config.ctiinout_sel;
-	val = drvdata->config.ctiouten[index];
-	raw_spin_unlock(&drvdata->spinlock);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		index = drvdata->config.ctiinout_sel;
+		val = drvdata->config.ctiouten[index];
+	}
+
 	return sprintf(buf, "%#lx\n", val);
 }
 
@@ -422,14 +430,15 @@ static ssize_t outen_store(struct device *dev,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	index = config->ctiinout_sel;
 	config->ctiouten[index] = val;
 
 	/* write through if enabled */
 	if (cti_active(config))
 		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
-	raw_spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_RW(outen);
@@ -463,7 +472,7 @@ static ssize_t appclear_store(struct device *dev,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* a 1'b1 in appclr clears down the same bit in appset*/
 	config->ctiappset &= ~val;
@@ -471,7 +480,7 @@ static ssize_t appclear_store(struct device *dev,
 	/* write through if enabled */
 	if (cti_active(config))
 		cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
-	raw_spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_WO(appclear);
@@ -487,12 +496,12 @@ static ssize_t apppulse_store(struct device *dev,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* write through if enabled */
 	if (cti_active(config))
 		cti_write_single_reg(drvdata, CTIAPPPULSE, val);
-	raw_spin_unlock(&drvdata->spinlock);
+
 	return size;
 }
 static DEVICE_ATTR_WO(apppulse);
@@ -681,9 +690,9 @@ static ssize_t trig_filter_enable_show(struct device *dev,
 	u32 val;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-	val = drvdata->config.trig_filter_enable;
-	raw_spin_unlock(&drvdata->spinlock);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
+		val = drvdata->config.trig_filter_enable;
+
 	return sprintf(buf, "%d\n", val);
 }
 
@@ -697,9 +706,9 @@ static ssize_t trig_filter_enable_store(struct device *dev,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	drvdata->config.trig_filter_enable = !!val;
-	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
 static DEVICE_ATTR_RW(trig_filter_enable);
@@ -728,7 +737,7 @@ static ssize_t chan_xtrigs_reset_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* clear the CTI trigger / channel programming registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
@@ -747,7 +756,6 @@ static ssize_t chan_xtrigs_reset_store(struct device *dev,
 	if (cti_active(config))
 		cti_write_all_hw_regs(drvdata);
 
-	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
 static DEVICE_ATTR_WO(chan_xtrigs_reset);
@@ -768,9 +776,9 @@ static ssize_t chan_xtrigs_sel_store(struct device *dev,
 	if (val > (drvdata->config.nr_ctm_channels - 1))
 		return -EINVAL;
 
-	raw_spin_lock(&drvdata->spinlock);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	drvdata->config.xtrig_rchan_sel = val;
-	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
 
@@ -781,9 +789,8 @@ static ssize_t chan_xtrigs_sel_show(struct device *dev,
 	unsigned long val;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-	val = drvdata->config.xtrig_rchan_sel;
-	raw_spin_unlock(&drvdata->spinlock);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
+		val = drvdata->config.xtrig_rchan_sel;
 
 	return sprintf(buf, "%ld\n", val);
 }
@@ -838,12 +845,12 @@ static ssize_t print_chan_list(struct device *dev,
 	unsigned long inuse_bits = 0, chan_mask;
 
 	/* scan regs to get bitmap of channels in use. */
-	raw_spin_lock(&drvdata->spinlock);
-	for (i = 0; i < config->nr_trig_max; i++) {
-		inuse_bits |= config->ctiinen[i];
-		inuse_bits |= config->ctiouten[i];
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		for (i = 0; i < config->nr_trig_max; i++) {
+			inuse_bits |= config->ctiinen[i];
+			inuse_bits |= config->ctiouten[i];
+		}
 	}
-	raw_spin_unlock(&drvdata->spinlock);
 
 	/* inverse bits if printing free channels */
 	if (!inuse)

-- 
2.34.1


