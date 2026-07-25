Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F21C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hc3QgGyvfMwdGTJsPWf3nT7p1mot9pMwdqVvcUyXfQ=; b=CDb4KaGSb63LRuUPwNCPCCSuFo
	1LeTFbOnylTo8z14Jjn3tN02Xe6ncHifkSm3LoiUWeUgv6dn6B/p/GriKuolSv3xkaVT16h1+G2P0
	ZjdPFN8ewEPAP1MQ31Y1aTXisY/0amHeDg9wUiCO2UqBjB7NfjlmQK0djF6Zg5wkbcHK6ihqmcS+T
	7vxXO/iPeCQ0C6KSHQy0oOMLzaVzX999e6TIp8p9Yajf+TASOEJkzfN3N6B5L2wMZOYIEk9zDy+4e
	OyO5aCLebmsRP26OnRsUBFDW+u2RbvSEG7UfAo5+B+7D0hygkGLvrMo/6DH9tFgOy3vTxSJOvAnCZ
	fZzqr2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnah5-00000000IPm-2lN0;
	Sat, 25 Jul 2026 11:37:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagl-00000000IDQ-2YdI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6550F1477;
	Sat, 25 Jul 2026 04:37:01 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB1DA3F86F;
	Sat, 25 Jul 2026 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979425; bh=gLUAGZAEhyFdO+RviDvFSynD+IhfjLD3h0OkX6EA5QE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNiOig5UKqnelt3JJyXQ1rSnn7sRi3eGTfL/dtaaAfQ0JtBP/8VUgIQTF/dJ6Aqpl
	 G0wzbvx2As/g9apH0FIbXoyh0YCr8mFXS6Z8AqizHd0yDV7nEBX0HkQn5TrxIgG5/P
	 xQsvA0i5DGzcoB9VFhI/hViF9DVWKwkuhY2DVi0U=
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
Subject: [PATCH v9 04/13] coresight: etm4x: fix inconsistencies with sysfs configuration
Date: Sat, 25 Jul 2026 12:36:36 +0100
Message-ID: <20260725113645.57519-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043707_904807_A19EF3C5 
X-CRM114-Status: GOOD (  31.46  )
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

The current ETM4x configuration via sysfs can lead to
several inconsistencies:

  - If the configuration is modified via sysfs while a perf session is
    active, the running configuration may differ before a sched-out and
    after a subsequent sched-in.

  - If a perf session and a sysfs session enable tracing concurrently,
    the configuration from configfs may become corrupted.

  - There is a risk of corrupting drvdata->config if a perf session enables
    tracing while cscfg_csdev_disable_active_config() is being handled in
    etm4_disable_sysfs().

To resolve these issues, separate the configuration into:

  - active_config: the configuration applied to the current session
  - config: the configuration set via sysfs

Additionally:

  - Apply the configuration from configfs after taking the appropriate mode.

  - Since active_config and related fields are accessed only by the local CPU
    in etm4_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
    remove the lock/unlock from the sysfs enable/disable path and
    startup/dying_cpu except when to access config fields.

As the active_config is used for cfg-configfs, etmv4 doesn't need to set
its lock for the cfg-configfs since the active_config is proceted by cs_mode
otherwise it would make a possible cpu-stall when it get interrupt while
setting the sysfs configuration.

Therefore, set the drv_spinlock for cfg-configfs as NULL and
let the cfg-configfs disable irq without grap drv_spinlock when it is NULL.

Fixes: 54ff892b76c6 ("coresight: etm4x: splitting struct etmv4_drvdata")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-config.c    |  18 ++-
 .../hwtracing/coresight/coresight-config.h    |  26 +++++
 .../hwtracing/coresight/coresight-etm4x-cfg.c |  13 ++-
 .../coresight/coresight-etm4x-core.c          | 103 ++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h |   4 +-
 5 files changed, 100 insertions(+), 64 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.c b/drivers/hwtracing/coresight/coresight-config.c
index 4f72ae71b696..45f145dc5e89 100644
--- a/drivers/hwtracing/coresight/coresight-config.c
+++ b/drivers/hwtracing/coresight/coresight-config.c
@@ -73,13 +73,12 @@ static void cscfg_init_reg_param(struct cscfg_feature_csdev *feat_csdev,
 /* set values into the driver locations referenced in cscfg_reg_csdev */
 static int cscfg_set_on_enable(struct cscfg_feature_csdev *feat_csdev)
 {
-	unsigned long flags;
 	int i;
 
-	raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
-	for (i = 0; i < feat_csdev->nr_regs; i++)
-		cscfg_set_reg(&feat_csdev->regs_csdev[i]);
-	raw_spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
+	scoped_guard (feat_csdev_lock, feat_csdev) {
+		for (i = 0; i < feat_csdev->nr_regs; i++)
+			cscfg_set_reg(&feat_csdev->regs_csdev[i]);
+	}
 	dev_dbg(&feat_csdev->csdev->dev, "Feature %s: %s",
 		feat_csdev->feat_desc->name, "set on enable");
 	return 0;
@@ -88,13 +87,12 @@ static int cscfg_set_on_enable(struct cscfg_feature_csdev *feat_csdev)
 /* copy back values from the driver locations referenced in cscfg_reg_csdev */
 static void cscfg_save_on_disable(struct cscfg_feature_csdev *feat_csdev)
 {
-	unsigned long flags;
 	int i;
 
-	raw_spin_lock_irqsave(feat_csdev->drv_spinlock, flags);
-	for (i = 0; i < feat_csdev->nr_regs; i++)
-		cscfg_save_reg(&feat_csdev->regs_csdev[i]);
-	raw_spin_unlock_irqrestore(feat_csdev->drv_spinlock, flags);
+	scoped_guard (feat_csdev_lock, feat_csdev) {
+		for (i = 0; i < feat_csdev->nr_regs; i++)
+			cscfg_save_reg(&feat_csdev->regs_csdev[i]);
+	}
 	dev_dbg(&feat_csdev->csdev->dev, "Feature %s: %s",
 		feat_csdev->feat_desc->name, "save on disable");
 }
diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index 90fd937d3bd8..0782db3b1b74 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -8,6 +8,7 @@
 #define _CORESIGHT_CORESIGHT_CONFIG_H
 
 #include <linux/coresight.h>
+#include <linux/cleanup.h>
 #include <linux/types.h>
 
 /* CoreSight Configuration Management - component and system wide configuration */
@@ -259,4 +260,29 @@ void cscfg_csdev_disable_config(struct cscfg_config_csdev *config_csdev);
 /* reset a feature to default values */
 void cscfg_reset_feat(struct cscfg_feature_csdev *feat_csdev);
 
+#define feat_csdev_lock(feat_csdev, flags)				\
+	do {								\
+		raw_spinlock_t *__lock = feat_csdev->drv_spinlock;	\
+		typecheck(unsigned long, flags);			\
+		if (__lock)						\
+			raw_spin_lock_irqsave(__lock, flags);		\
+		else							\
+			local_irq_save(flags);				\
+	} while (0)
+
+#define feat_csdev_unlock(feat_csdev, flags)				\
+	do {								\
+		raw_spinlock_t *__lock = feat_csdev->drv_spinlock;	\
+		typecheck(unsigned long, flags);			\
+		if (__lock)						\
+			raw_spin_unlock_irqrestore(__lock, flags);	\
+		else							\
+			local_irq_restore(flags);			\
+	} while (0)
+
+DEFINE_LOCK_GUARD_1(feat_csdev_lock, struct cscfg_feature_csdev,
+		    feat_csdev_lock(_T->lock, _T->flags),
+		    feat_csdev_unlock(_T->lock, _T->flags),
+		    unsigned long flags)
+
 #endif /* _CORESIGHT_CORESIGHT_CONFIG_H */
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index e1a59b434505..d24f533c623d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
@@ -47,7 +47,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
 				   struct cscfg_regval_csdev *reg_csdev, u32 offset)
 {
 	int err = -EINVAL, idx;
-	struct etmv4_config *drvcfg = &drvdata->config;
+	struct etmv4_config *drvcfg = &drvdata->active_config;
 	u32 off_mask;
 
 	if (((offset >= TRCEVENTCTL0R) && (offset <= TRCVIPCSSCTLR)) ||
@@ -154,11 +154,14 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
 	int i = 0, err = 0;
 
 	/*
-	 * essential we set the device spinlock - this is used in the generic
-	 * programming routines when copying values into the drvdata structures
-	 * via the pointers setup in etm4_cfg_map_reg_offset().
+	 * drvdata structure of etm4 for configfs is active_config and
+	 * this active_config is protected with csdev->mode by restricting
+	 * access to active_config after mode changed to PERF or SYSFS.
+	 *
+	 * Therefore, it doesn't need to protected with etmv4_drvdata->spinlock
+	 * to feature applying and set the NULL.
 	 */
-	feat_csdev->drv_spinlock = &drvdata->spinlock;
+	feat_csdev->drv_spinlock = NULL;
 
 	/* process the register descriptions */
 	for (i = 0; i < feat_csdev->nr_regs && !err; i++) {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 8363c55b3952..8fac6416f3fa 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -239,6 +239,7 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 struct etm4_enable_arg {
 	struct etmv4_drvdata *drvdata;
 	struct coresight_path *path;
+	struct etmv4_config config;
 	int rc;
 };
 
@@ -264,10 +265,11 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
 static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
 {
 	u64 trfcr = drvdata->trfcr;
+	struct etmv4_config *config = &drvdata->active_config;
 
-	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
+	if (config->mode & ETM_MODE_EXCL_KERN)
 		trfcr &= ~TRFCR_EL1_ExTRE;
-	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
+	if (config->mode & ETM_MODE_EXCL_USER)
 		trfcr &= ~TRFCR_EL1_E0TRE;
 
 	return trfcr;
@@ -275,7 +277,7 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
 
 /*
  * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
- * as configured by the drvdata->config.mode for the current
+ * as configured by the drvdata->active_config.mode for the current
  * session. Even though we have TRCVICTLR bits to filter the
  * trace in the ELs, it doesn't prevent the ETM from generating
  * a packet (e.g, TraceInfo) that might contain the addresses from
@@ -286,12 +288,13 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
 static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
 {
 	u64 trfcr, guest_trfcr;
+	struct etmv4_config *config = &drvdata->active_config;
 
 	/* If the CPU doesn't support FEAT_TRF, nothing to do */
 	if (!drvdata->trfcr)
 		return;
 
-	if (drvdata->config.mode & ETM_MODE_EXCL_HOST)
+	if (config->mode & ETM_MODE_EXCL_HOST)
 		trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
 	else
 		trfcr = etm4x_get_kern_user_filter(drvdata);
@@ -299,7 +302,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
 	write_trfcr(trfcr);
 
 	/* Set filters for guests and pass to KVM */
-	if (drvdata->config.mode & ETM_MODE_EXCL_GUEST)
+	if (config->mode & ETM_MODE_EXCL_GUEST)
 		guest_trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
 	else
 		guest_trfcr = etm4x_get_kern_user_filter(drvdata);
@@ -492,7 +495,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 {
 	int i, rc;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct device *etm_dev = &csdev->dev;
 	struct csdev_access *csa = &csdev->access;
@@ -612,27 +615,52 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 static void etm4_enable_sysfs_smp_call(void *info)
 {
 	struct etm4_enable_arg *arg = info;
+	struct etmv4_drvdata *drvdata;
 	struct coresight_device *csdev;
+	unsigned long cfg_hash;
+	int preset;
 
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
 
-	arg->rc = etm4_enable_hw(arg->drvdata);
+	drvdata->active_config = arg->config;
 
-	/* The tracer didn't start */
+	/* enable any config activated by configfs */
+	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
+	if (cfg_hash) {
+		arg->rc = cscfg_csdev_enable_active_config(csdev,
+							   cfg_hash,
+							   preset);
+		if (arg->rc)
+			goto err;
+	}
+
+	drvdata->trcid = arg->path->trace_id;
+
+	/* Tracer will never be paused in sysfs mode */
+	drvdata->paused = false;
+
+	arg->rc = etm4_enable_hw(drvdata);
 	if (arg->rc) {
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
-		return;
+		cscfg_csdev_disable_active_config(csdev);
+		goto err;
 	}
 
+	drvdata->sticky_enable = true;
 	csdev->path = arg->path;
+
+	return;
+err:
+	/* The tracer didn't start */
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 /*
@@ -669,7 +697,7 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
 {
 	int ctridx;
 	int rselector;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!drvdata->nr_cntr)
@@ -752,7 +780,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 {
 	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct perf_event_attr max_timestamp = {
 		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
 	};
@@ -913,25 +941,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etm4_enable_arg arg = { };
-	unsigned long cfg_hash;
-	int ret, preset;
-
-	/* enable any config activated by configfs */
-	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
-	if (cfg_hash) {
-		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
-		if (ret) {
-			etm4_release_trace_id(drvdata);
-			return ret;
-		}
-	}
-
-	raw_spin_lock(&drvdata->spinlock);
-
-	drvdata->trcid = path->trace_id;
-
-	/* Tracer will never be paused in sysfs mode */
-	drvdata->paused = false;
+	int ret;
 
 	/*
 	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
@@ -939,20 +949,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 	 */
 	arg.drvdata = drvdata;
 	arg.path = path;
+
+	raw_spin_lock(&drvdata->spinlock);
+	arg.config = drvdata->config;
+	raw_spin_unlock(&drvdata->spinlock);
+
 	ret = smp_call_function_single(drvdata->cpu,
 				       etm4_enable_sysfs_smp_call, &arg, 1);
 	if (!ret)
 		ret = arg.rc;
 	if (!ret)
-		drvdata->sticky_enable = true;
-
-	if (ret)
+		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
+	else
 		etm4_release_trace_id(drvdata);
 
-	raw_spin_unlock(&drvdata->spinlock);
-
-	if (!ret)
-		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
 	return ret;
 }
 
@@ -1038,7 +1048,7 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
 static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 {
 	u32 control;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
 	int i;
@@ -1080,7 +1090,10 @@ static void etm4_disable_sysfs_smp_call(void *info)
 
 	etm4_disable_hw(drvdata);
 
+	cscfg_csdev_disable_active_config(drvdata->csdev);
+
 	drvdata->csdev->path = NULL;
+
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -1125,8 +1138,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-
 	/*
 	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
@@ -1134,10 +1145,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm4_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	raw_spin_unlock(&drvdata->spinlock);
-
-	cscfg_csdev_disable_active_config(csdev);
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
@@ -1684,7 +1691,7 @@ static void etm4_set_default(struct etmv4_config *config)
 static int etm4_get_next_comparator(struct etmv4_drvdata *drvdata, u32 type)
 {
 	int nr_comparator, index = 0;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 
 	/*
 	 * nr_addr_cmp holds the number of comparator _pair_, so time 2
@@ -1725,7 +1732,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
 {
 	int i, comparator, ret = 0;
 	u64 address;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct etm_filters *filters = event->hw.addr_filters;
 
 	if (!filters)
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 84db8b97c98a..1dd55264c3f0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1024,7 +1024,8 @@ struct etmv4_save_state {
  *		allows tracing at all ELs. We don't want to compute this
  *		at runtime, due to the additional setting of TRFCR_CX when
  *		in EL2. Otherwise, 0.
- * @config:	structure holding configuration parameters.
+ * @active_config:	structure holding current applied configuration.
+ * @config:	structure holding sysfs mode configuration.
  * @save_state:	State to be preserved across power loss
  * @skip_power_up: Indicates if an implementation can skip powering up
  *		   the trace unit.
@@ -1082,6 +1083,7 @@ struct etmv4_drvdata {
 	bool				skip_power_up : 1;
 	bool				paused : 1;
 	u64				trfcr;
+	struct etmv4_config		active_config;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


