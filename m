Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD803CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oejtoKmrkUC4cJipjhDXF80Ra/+p6szV6WXQcfrYTi8=; b=EAmdm0H9dVKAN8AsqKXNl9YCU+
	MUj5moe0UjmHaUxyNJW58cCAwf7OFIaVawg+Co3fJ/ejD0m31D4QXdPY9fGlWeWZKA2Y6s9YRj/00
	IpgS43Y1mKQ9NUQA8X97FxoNYxIWFHNDOlio0a6YOp4HA0wK1mfHf3r2W8VedbVMLAaHkHMW2SaVJ
	oNPs8hxlB947Cf41pSdKaoSH/axwwt93MUtsHnAXZTo8ZwFxAD44vaiH5lo1p46Vw3qwGQSl93RQa
	o69IMAxDrSxAjoC5i/+cVUK8dIQ/Z6M/8QMqhINsNvCKBZExXT/nt9zjhLxo74J3Xa4F129xSKyT3
	KMNRfdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgZ-000000026wd-2ecx;
	Tue, 19 May 2026 15:48:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMgS-000000026oX-0dbu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:48:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98AB41682;
	Tue, 19 May 2026 08:48:33 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6237D3F632;
	Tue, 19 May 2026 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779205718; bh=j9lJOVGqLHE8ZpNO0t7HoeRl4zeD++yFKR/dTIxVcTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ic8ycZNYgT1br9Y0ehGBmwrLj5Y9gtG0JdI2GVKHRc7+x+Yp4vFIt/HKXWVhLNtN4
	 cJdC4iDasPbs8Pn9F5g/gSp3zbXjKMVE6AmTMZ4xxYHoDajJ9tZXPHAKwB53AgebgR
	 v7H5mVngecYiPqHP7TGOdiPo3jHg47Y+KG/z2uNs=
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
Subject: [PATCH v7 08/13] coresight: etm4x: fix inconsistencies with sysfs configuration
Date: Tue, 19 May 2026 16:48:07 +0100
Message-Id: <20260519154812.254884-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519154812.254884-1-yeoreum.yun@arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_084840_273899_95612578 
X-CRM114-Status: GOOD (  27.01  )
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

Fixes: 54ff892b76c6 ("coresight: etm4x: splitting struct etmv4_drvdata")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-cfg.c |   2 +-
 .../coresight/coresight-etm4x-core.c          | 107 ++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
 3 files changed, 61 insertions(+), 50 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index 9b4947d75fde..9d56e17e09b1 100644
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
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 9b477b36b432..f0a9f2ef4b27 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -243,6 +243,7 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 struct etm4_enable_arg {
 	struct etmv4_drvdata *drvdata;
 	struct coresight_path *path;
+	struct etmv4_config config;
 	int rc;
 };
 
@@ -268,10 +269,11 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
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
@@ -279,7 +281,7 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
 
 /*
  * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
- * as configured by the drvdata->config.mode for the current
+ * as configured by the drvdata->active_config.mode for the current
  * session. Even though we have TRCVICTLR bits to filter the
  * trace in the ELs, it doesn't prevent the ETM from generating
  * a packet (e.g, TraceInfo) that might contain the addresses from
@@ -290,12 +292,13 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
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
@@ -303,7 +306,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
 	write_trfcr(trfcr);
 
 	/* Set filters for guests and pass to KVM */
-	if (drvdata->config.mode & ETM_MODE_EXCL_GUEST)
+	if (config->mode & ETM_MODE_EXCL_GUEST)
 		guest_trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
 	else
 		guest_trfcr = etm4x_get_kern_user_filter(drvdata);
@@ -497,7 +500,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 {
 	int i, rc;
 	const struct etmv4_caps *caps = &drvdata->caps;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct device *etm_dev = &csdev->dev;
 	struct csdev_access *csa = &csdev->access;
@@ -618,27 +621,53 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
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
+	/* enable any config activated by configfs */
+	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
 
-	/* The tracer didn't start */
+	drvdata->active_config = arg->config;
+
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
@@ -676,7 +705,7 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
 	int ctridx;
 	int rselector;
 	const struct etmv4_caps *caps = &drvdata->caps;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!caps->nr_cntr)
@@ -760,7 +789,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	const struct etmv4_caps *caps = &drvdata->caps;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct perf_event_attr max_timestamp = {
 		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
 	};
@@ -922,25 +951,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
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
@@ -948,20 +959,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
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
 
@@ -1048,7 +1059,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 {
 	u32 control;
 	const struct etmv4_caps *caps = &drvdata->caps;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
 	int i;
@@ -1091,6 +1102,8 @@ static void etm4_disable_sysfs_smp_call(void *info)
 	etm4_disable_hw(drvdata);
 
 	drvdata->csdev->path = NULL;
+	cscfg_csdev_disable_active_config(drvdata->csdev);
+
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -1135,8 +1148,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-
 	/*
 	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
@@ -1144,10 +1155,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm4_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	raw_spin_unlock(&drvdata->spinlock);
-
-	cscfg_csdev_disable_active_config(csdev);
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
@@ -1382,6 +1389,7 @@ static void etm4_init_arch_data(void *info)
 	struct etm4_init_arg *init_arg = info;
 	struct etmv4_drvdata *drvdata;
 	struct etmv4_caps *caps;
+	struct etmv4_config *config;
 	struct csdev_access *csa;
 	struct device *dev = init_arg->dev;
 	int i;
@@ -1389,6 +1397,7 @@ static void etm4_init_arch_data(void *info)
 	drvdata = dev_get_drvdata(init_arg->dev);
 	caps = &drvdata->caps;
 	csa = init_arg->csa;
+	config = &drvdata->config;
 
 	/*
 	 * If we are unable to detect the access mechanism,
@@ -1449,7 +1458,7 @@ static void etm4_init_arch_data(void *info)
 
 	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
 	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
-	drvdata->config.s_ex_level = caps->s_ex_level;
+	config->s_ex_level = caps->s_ex_level;
 	/* EXLEVEL_NS, bits[23:20] Non-secure state instruction tracing */
 	caps->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
 	/*
@@ -1695,7 +1704,7 @@ static void etm4_set_default(struct etmv4_config *config)
 static int etm4_get_next_comparator(struct etmv4_drvdata *drvdata, u32 type)
 {
 	int nr_comparator, index = 0;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 
 	/*
 	 * nr_addr_cmp holds the number of comparator _pair_, so time 2
@@ -1736,7 +1745,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
 {
 	int i, comparator, ret = 0;
 	u64 address;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct etm_filters *filters = event->hw.addr_filters;
 
 	if (!filters)
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index cdeb2140735d..485750b72635 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1068,6 +1068,7 @@ struct etmv4_save_state {
  *		allows tracing at all ELs. We don't want to compute this
  *		at runtime, due to the additional setting of TRFCR_CX when
  *		in EL2. Otherwise, 0.
+ * @active_config:	structure holding current applied configuration parameters.
  * @config:	structure holding configuration parameters.
  * @save_state:	State to be preserved across power loss
  * @paused:	Indicates if the trace unit is paused.
@@ -1089,6 +1090,7 @@ struct etmv4_drvdata {
 	bool				os_unlock : 1;
 	bool				paused : 1;
 	u64				trfcr;
+	struct etmv4_config		active_config;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
 	u32				ss_status[ETM_MAX_SS_CMP];
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


