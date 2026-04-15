Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4376F43848
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW+MCL7tZ8c8IUV88x4bv2CtyD2hyPFN3PJIqlm0HyA=; b=o1k4VQsedmqL47Bq2CNEDu/NGZ
	j2k49vnvnewlUp00VzLQXL6hZG2PiXAdjjfMDSL6suag1geQY153ylNo1CLc0pdD6cUWPsRu+tiDj
	Z8t/GWhPtfbcrEm/UWG8FZCG2wLevfjnGtkWjRtnPr9+QfRRMk0j9EIZNW4JXmCrrE334aJ7RHZTE
	TltmLveKhnKK/4ztfUN6RUlQ4NWI6lEBST/XWnsHZeHIniKn5XFvarhObb12uWKeGnzpgMCmlx+1c
	4+mT96vBW8HNUAeKZKaVCHdIXHJqWB2kCHybxDn8Jyphy8l2PfrsGegGG8HsnkgMw/aZ0iyKIpuAc
	ngSYfNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wt-00000001PdS-0Wsg;
	Wed, 15 Apr 2026 16:55:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wn-00000001PZj-05Jr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:55:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A0B732D1;
	Wed, 15 Apr 2026 09:55:42 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D3E23F7D8;
	Wed, 15 Apr 2026 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776272147; bh=6u4jrZlea0UhDSy2tvdgz3PanKx80/KItEaTdYG6gKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XO87QKbjDQuTeVuCBfuJ6puvw9MZf26L2Lf9/n7o378sZ6fPrxZYJZkAz8yRt4aba
	 RzRgkcAsY4Tn42044QMTQ31ODZ80dsCEV2RkB0qBDQGN0ZTCGRb+hrsH/U+c59BZ44
	 HtoFEgmYSKI+nn5DIX7dNlStTgvJtCzm7sxxzwE8=
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
Subject: [PATCH v5 07/12] coresight: etm4x: fix inconsistencies with sysfs configuration
Date: Wed, 15 Apr 2026 17:55:23 +0100
Message-Id: <20260415165528.3369607-8-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415165528.3369607-1-yeoreum.yun@arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_095549_158799_4FD534C9 
X-CRM114-Status: GOOD (  27.53  )
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

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-cfg.c |   2 +-
 .../coresight/coresight-etm4x-core.c          | 107 ++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
 3 files changed, 63 insertions(+), 48 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index d14d7c8a23e5..0553771d04e7 100644
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
index b199aebbdb60..15aaf4a898e1 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -245,6 +245,10 @@ void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 
 struct etm4_enable_arg {
 	struct etmv4_drvdata *drvdata;
+	unsigned long cfg_hash;
+	int preset;
+	u8 trace_id;
+	struct etmv4_config config;
 	int rc;
 };
 
@@ -270,10 +274,11 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
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
@@ -281,7 +286,7 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
 
 /*
  * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
- * as configured by the drvdata->config.mode for the current
+ * as configured by the drvdata->active_config.mode for the current
  * session. Even though we have TRCVICTLR bits to filter the
  * trace in the ELs, it doesn't prevent the ETM from generating
  * a packet (e.g, TraceInfo) that might contain the addresses from
@@ -292,12 +297,13 @@ static u64 etm4x_get_kern_user_filter(struct etmv4_drvdata *drvdata)
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
@@ -305,7 +311,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
 	write_trfcr(trfcr);
 
 	/* Set filters for guests and pass to KVM */
-	if (drvdata->config.mode & ETM_MODE_EXCL_GUEST)
+	if (config->mode & ETM_MODE_EXCL_GUEST)
 		guest_trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
 	else
 		guest_trfcr = etm4x_get_kern_user_filter(drvdata);
@@ -499,7 +505,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 {
 	int i, rc;
 	const struct etmv4_caps *caps = &drvdata->caps;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct device *etm_dev = &csdev->dev;
 	struct csdev_access *csa = &csdev->access;
@@ -618,23 +624,45 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 static void etm4_enable_sysfs_smp_call(void *info)
 {
 	struct etm4_enable_arg *arg = info;
+	struct etmv4_drvdata *drvdata;
 	struct coresight_device *csdev;
 
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
+	if (arg->cfg_hash) {
+		arg->rc = cscfg_csdev_enable_active_config(csdev,
+							   arg->cfg_hash,
+							   arg->preset);
+		if (arg->rc)
+			goto err;
+	}
+
+	drvdata->trcid = arg->trace_id;
+
+	/* Tracer will never be paused in sysfs mode */
+	drvdata->paused = false;
+
+	arg->rc = etm4_enable_hw(drvdata);
 	if (arg->rc)
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		goto err;
+
+	drvdata->sticky_enable = true;
+
+	return;
+err:
+	/* The tracer didn't start */
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 /*
@@ -672,7 +700,7 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
 	int ctridx;
 	int rselector;
 	const struct etmv4_caps *caps = &drvdata->caps;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!caps->nr_cntr)
@@ -756,7 +784,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	const struct etmv4_caps *caps = &drvdata->caps;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct perf_event_attr max_timestamp = {
 		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
 	};
@@ -918,40 +946,29 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 
 	/* enable any config activated by configfs */
 	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
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
 
 	/*
 	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
 	 * ensures that register writes occur when cpu is powered.
 	 */
 	arg.drvdata = drvdata;
+	arg.cfg_hash = cfg_hash;
+	arg.preset = preset;
+	arg.trace_id = path->trace_id;
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
 
@@ -1038,7 +1055,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 {
 	u32 control;
 	const struct etmv4_caps *caps = &drvdata->caps;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
 	int i;
@@ -1074,6 +1091,8 @@ static void etm4_disable_sysfs_smp_call(void *info)
 
 	etm4_disable_hw(drvdata);
 
+	cscfg_csdev_disable_active_config(drvdata->csdev);
+
 	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
@@ -1124,7 +1143,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	 * DYING hotplug callback is serviced by the ETM driver.
 	 */
 	cpus_read_lock();
-	raw_spin_lock(&drvdata->spinlock);
 
 	/*
 	 * Executing etm4_disable_hw on the cpu whose ETM is being disabled
@@ -1133,10 +1151,6 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm4_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	raw_spin_unlock(&drvdata->spinlock);
-
-	cscfg_csdev_disable_active_config(csdev);
-
 	cpus_read_unlock();
 
 	/*
@@ -1379,6 +1393,7 @@ static void etm4_init_arch_data(void *info)
 	struct etm4_init_arg *init_arg = info;
 	struct etmv4_drvdata *drvdata;
 	struct etmv4_caps *caps;
+	struct etmv4_config *config;
 	struct csdev_access *csa;
 	struct device *dev = init_arg->dev;
 	int i;
@@ -1386,6 +1401,7 @@ static void etm4_init_arch_data(void *info)
 	drvdata = dev_get_drvdata(init_arg->dev);
 	caps = &drvdata->caps;
 	csa = init_arg->csa;
+	config = &drvdata->active_config;
 
 	/*
 	 * If we are unable to detect the access mechanism,
@@ -1446,7 +1462,7 @@ static void etm4_init_arch_data(void *info)
 
 	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
 	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
-	drvdata->config.s_ex_level = caps->s_ex_level;
+	config->s_ex_level = caps->s_ex_level;
 	/* EXLEVEL_NS, bits[23:20] Non-secure state instruction tracing */
 	caps->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
 	/*
@@ -1692,7 +1708,7 @@ static void etm4_set_default(struct etmv4_config *config)
 static int etm4_get_next_comparator(struct etmv4_drvdata *drvdata, u32 type)
 {
 	int nr_comparator, index = 0;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 
 	/*
 	 * nr_addr_cmp holds the number of comparator _pair_, so time 2
@@ -1733,7 +1749,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
 {
 	int i, comparator, ret = 0;
 	u64 address;
-	struct etmv4_config *config = &drvdata->config;
+	struct etmv4_config *config = &drvdata->active_config;
 	struct etm_filters *filters = event->hw.addr_filters;
 
 	if (!filters)
@@ -1851,13 +1867,11 @@ static int etm4_starting_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
 	if (!etmdrvdata[cpu]->os_unlock)
 		etm4_os_unlock(etmdrvdata[cpu]);
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm4_enable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
@@ -1866,10 +1880,8 @@ static int etm4_dying_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm4_disable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
@@ -2255,7 +2267,8 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	if (!desc.name)
 		return -ENOMEM;
 
-	etm4_set_default(&drvdata->config);
+	etm4_set_default(&drvdata->active_config);
+	drvdata->config = drvdata->active_config;
 
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index cbd8890d166a..9b50aaa368cf 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1069,6 +1069,7 @@ struct etmv4_save_state {
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
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


