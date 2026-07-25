Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56212C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5uU7iKfz5gz3ypg/qQCTM/sjikw2S1CTGrsZ5Nq1Oo=; b=2+H6bQ3eoowfDJpfJhdYqt8uRL
	cKxux/hLJEGKmj8/AQ0fs8fDpA8m5AlMw8ctRVYxqXEK2j+vV0GowW0hSOMO2SxI/XGCj830l67Yi
	/6EZLG7FFVKzgu2vFOAFiESAyQHtVG8weNYl8zDyJh/QaDQ2p5fWAAyfDrRHDdwmiGC1KF/Rs16oY
	/o6FREPzka0NsszI+I2DqqOdoYxlO6rScYblRH6rOdbDiPyXhv1nSChtdHe88zC0bfixeCLakCDjh
	ej95r2b2liuKoDxtG9uUmnHMUqGEDYcVQCrZtH/5qzf1vG4iDlJfmuK8etCXfNl1z4hQFJ2uRUJeL
	QNn71Qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnah6-00000000IQv-0Fyc;
	Sat, 25 Jul 2026 11:37:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagt-00000000IHJ-0uAE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC44B1476;
	Sat, 25 Jul 2026 04:37:09 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 88D033F86F;
	Sat, 25 Jul 2026 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979434; bh=SYHzL4tVfIQbiHjg6OKBP+pA+cS5EYqqeFVJOUPv52E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MfQ1fkEuj5GzgbhZzUVmNhQhIOHHmUjiqQZ/OByCZmp+lDp7UXYqjYPEi6cHlNUMo
	 JQ13tse32tOiQSO+ejwG5amA7XtpkUjWaxsTRgwonc82gvOfYPNsNrtPsgzZMFmg9J
	 XkkQhWlPrlE8sYo4qPfKnBDZFGWg4W/tZPXcbbh0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 07/13] coresight: etm3x: change drvdata->spinlock type to raw_spin_lock_t
Date: Sat, 25 Jul 2026 12:36:39 +0100
Message-ID: <20260725113645.57519-8-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043715_526763_0F5AF4B3 
X-CRM114-Status: GOOD (  14.49  )
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

etm_starting_cpu()/etm_dying_cpu() are called in not sleepable context.
This poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this, change etm3's drvdata->spinlock type to raw_spin_lock_t.
This will be good to align with etm4x.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm.h   |   2 +-
 .../coresight/coresight-etm3x-core.c          |   2 +-
 .../coresight/coresight-etm3x-sysfs.c         | 130 +++++++++---------
 3 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index f3796162168d..bc8909a905c7 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -233,7 +233,7 @@ struct etm_drvdata {
 	struct csdev_access		csa;
 	struct clk			*atclk;
 	struct coresight_device		*csdev;
-	spinlock_t			spinlock;
+	raw_spinlock_t			spinlock;
 	int				cpu;
 	int				port_size;
 	u8				arch;
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 93dc98145b66..7a1e183c0b48 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -811,7 +811,7 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 
 	desc.access = drvdata->csa = CSDEV_ACCESS_IOMEM(base);
 
-	spin_lock_init(&drvdata->spinlock);
+	raw_spin_lock_init(&drvdata->spinlock);
 
 	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
 	if (IS_ERR(drvdata->atclk))
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 762109307b86..42b12c33516b 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -49,13 +49,13 @@ static ssize_t etmsr_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
 	pm_runtime_get_sync(dev->parent);
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	CS_UNLOCK(drvdata->csa.base);
 
 	val = etm_readl(drvdata, ETMSR);
 
 	CS_LOCK(drvdata->csa.base);
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	pm_runtime_put(dev->parent);
 
 	return sprintf(buf, "%#lx\n", val);
@@ -76,7 +76,7 @@ static ssize_t reset_store(struct device *dev,
 		return ret;
 
 	if (val) {
-		spin_lock(&drvdata->spinlock);
+		raw_spin_lock(&drvdata->spinlock);
 		memset(config, 0, sizeof(struct etm_config));
 		config->mode = ETM_MODE_EXCLUDE;
 		config->trigger_event = ETM_DEFAULT_EVENT_VAL;
@@ -86,7 +86,7 @@ static ssize_t reset_store(struct device *dev,
 
 		etm_set_default(config);
 		etm_release_trace_id(drvdata);
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 	}
 
 	return size;
@@ -117,7 +117,7 @@ static ssize_t mode_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->mode = val & ETM_MODE_ALL;
 
 	if (config->mode & ETM_MODE_EXCLUDE)
@@ -168,12 +168,12 @@ static ssize_t mode_store(struct device *dev,
 	if (config->mode & (ETM_MODE_EXCL_KERN | ETM_MODE_EXCL_USER))
 		etm_config_trace_mode(config);
 
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 
 err_unlock:
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 	return ret;
 }
 static DEVICE_ATTR_RW(mode);
@@ -299,9 +299,9 @@ static ssize_t addr_idx_store(struct device *dev,
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
 	 */
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->addr_idx = val;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -315,16 +315,16 @@ static ssize_t addr_single_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
 	      config->addr_type[idx] == ETM_ADDR_TYPE_SINGLE)) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EINVAL;
 	}
 
 	val = config->addr_val[idx];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -343,17 +343,17 @@ static ssize_t addr_single_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
 	      config->addr_type[idx] == ETM_ADDR_TYPE_SINGLE)) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EINVAL;
 	}
 
 	config->addr_val[idx] = val;
 	config->addr_type[idx] = ETM_ADDR_TYPE_SINGLE;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -367,23 +367,23 @@ static ssize_t addr_range_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (idx % 2 != 0) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EPERM;
 	}
 	if (!((config->addr_type[idx] == ETM_ADDR_TYPE_NONE &&
 	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_NONE) ||
 	      (config->addr_type[idx] == ETM_ADDR_TYPE_RANGE &&
 	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_RANGE))) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EPERM;
 	}
 
 	val1 = config->addr_val[idx];
 	val2 = config->addr_val[idx + 1];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx %#lx\n", val1, val2);
 }
@@ -403,17 +403,17 @@ static ssize_t addr_range_store(struct device *dev,
 	if (val1 > val2)
 		return -EINVAL;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (idx % 2 != 0) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EPERM;
 	}
 	if (!((config->addr_type[idx] == ETM_ADDR_TYPE_NONE &&
 	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_NONE) ||
 	      (config->addr_type[idx] == ETM_ADDR_TYPE_RANGE &&
 	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_RANGE))) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EPERM;
 	}
 
@@ -422,7 +422,7 @@ static ssize_t addr_range_store(struct device *dev,
 	config->addr_val[idx + 1] = val2;
 	config->addr_type[idx + 1] = ETM_ADDR_TYPE_RANGE;
 	config->enable_ctrl1 |= (1 << (idx/2));
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -436,16 +436,16 @@ static ssize_t addr_start_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
 	      config->addr_type[idx] == ETM_ADDR_TYPE_START)) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EPERM;
 	}
 
 	val = config->addr_val[idx];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -464,11 +464,11 @@ static ssize_t addr_start_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
 	      config->addr_type[idx] == ETM_ADDR_TYPE_START)) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EPERM;
 	}
 
@@ -476,7 +476,7 @@ static ssize_t addr_start_store(struct device *dev,
 	config->addr_type[idx] = ETM_ADDR_TYPE_START;
 	config->startstop_ctrl |= (1 << idx);
 	config->enable_ctrl1 |= ETMTECR1_START_STOP;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -490,16 +490,16 @@ static ssize_t addr_stop_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
 	      config->addr_type[idx] == ETM_ADDR_TYPE_STOP)) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EPERM;
 	}
 
 	val = config->addr_val[idx];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -518,11 +518,11 @@ static ssize_t addr_stop_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
 	      config->addr_type[idx] == ETM_ADDR_TYPE_STOP)) {
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return -EPERM;
 	}
 
@@ -530,7 +530,7 @@ static ssize_t addr_stop_store(struct device *dev,
 	config->addr_type[idx] = ETM_ADDR_TYPE_STOP;
 	config->startstop_ctrl |= (1 << (idx + 16));
 	config->enable_ctrl1 |= ETMTECR1_START_STOP;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -543,9 +543,9 @@ static ssize_t addr_acctype_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	val = config->addr_acctype[config->addr_idx];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -563,9 +563,9 @@ static ssize_t addr_acctype_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->addr_acctype[config->addr_idx] = val;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -601,9 +601,9 @@ static ssize_t cntr_idx_store(struct device *dev,
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
 	 */
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->cntr_idx = val;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -616,9 +616,9 @@ static ssize_t cntr_rld_val_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	val = config->cntr_rld_val[config->cntr_idx];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -636,9 +636,9 @@ static ssize_t cntr_rld_val_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->cntr_rld_val[config->cntr_idx] = val;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -651,9 +651,9 @@ static ssize_t cntr_event_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	val = config->cntr_event[config->cntr_idx];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -671,9 +671,9 @@ static ssize_t cntr_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->cntr_event[config->cntr_idx] = val & ETM_EVENT_MASK;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -686,9 +686,9 @@ static ssize_t cntr_rld_event_show(struct device *dev,
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	val = config->cntr_rld_event[config->cntr_idx];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -706,9 +706,9 @@ static ssize_t cntr_rld_event_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->cntr_rld_event[config->cntr_idx] = val & ETM_EVENT_MASK;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -723,11 +723,11 @@ static ssize_t cntr_val_show(struct device *dev,
 	struct etm_config *config = &drvdata->config;
 
 	if (!coresight_get_mode(drvdata->csdev)) {
-		spin_lock(&drvdata->spinlock);
+		raw_spin_lock(&drvdata->spinlock);
 		for (i = 0; i < drvdata->nr_cntr; i++)
 			ret += sprintf(buf, "counter %d: %x\n",
 				       i, config->cntr_val[i]);
-		spin_unlock(&drvdata->spinlock);
+		raw_spin_unlock(&drvdata->spinlock);
 		return ret;
 	}
 
@@ -752,9 +752,9 @@ static ssize_t cntr_val_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->cntr_val[config->cntr_idx] = val;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -947,13 +947,13 @@ static ssize_t seq_curr_state_show(struct device *dev,
 	}
 
 	pm_runtime_get_sync(dev->parent);
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
 	CS_UNLOCK(drvdata->csa.base);
 	val = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
 	CS_LOCK(drvdata->csa.base);
 
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	pm_runtime_put(dev->parent);
 out:
 	return sprintf(buf, "%#lx\n", val);
@@ -1012,9 +1012,9 @@ static ssize_t ctxid_idx_store(struct device *dev,
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
 	 */
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->ctxid_idx = val;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
@@ -1034,9 +1034,9 @@ static ssize_t ctxid_pid_show(struct device *dev,
 	if (task_active_pid_ns(current) != &init_pid_ns)
 		return -EINVAL;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	val = config->ctxid_pid[config->ctxid_idx];
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -1066,9 +1066,9 @@ static ssize_t ctxid_pid_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	spin_lock(&drvdata->spinlock);
+	raw_spin_lock(&drvdata->spinlock);
 	config->ctxid_pid[config->ctxid_idx] = pid;
-	spin_unlock(&drvdata->spinlock);
+	raw_spin_unlock(&drvdata->spinlock);
 
 	return size;
 }
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


