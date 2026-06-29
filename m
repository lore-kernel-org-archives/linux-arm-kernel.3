Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711AFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiVKe3VbR4WCrY2hozCiXXvZGMQuMkp68+ZeATdjDaQ=; b=uzc6o+fULvYORcwNMbk6jGFLn7
	NtpjfkLtXc4Pv/+OL+9GjB5/7v5CHrkxQ34Hq2OuW1NuYzfxjB00BtB4R5efwQ0YtArdD9d/CZO72
	6EPOKIm28nWFo4PSVVwR8ovo3rvufrugQXoTohsg2yeY/lMzcluC1NAe/PkxDU5a2Pn3XCT2kfdi9
	YJ7gT8/UCZBsGENJdDMVgsyXl0GKoHoYcdh7QrOJyMSY9KX3lEnZ3zJy8V+n5pdPx7HGYrd7DSGcB
	SYjrHleK1FC0IaOKoQG7oyVBOfUGXoXLHfvAActeS7aIZkq6TxGATW9hGdjXkMnmxX7z9T76eHhCv
	a/PPiRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7qu-0000000E4uI-3Upw;
	Mon, 29 Jun 2026 09:00:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7qo-0000000E4qF-3XTD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:00:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59DDB1A2D;
	Mon, 29 Jun 2026 02:00:17 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1131F3F836;
	Mon, 29 Jun 2026 02:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782723621; bh=k8GrncH6zDSch9kcEd3ne+dde3g+F+7iynsKY/d+TSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RPIXDFWsIeWSOcH99JRsKlz4kmf6wjapCQnC5vsPjrDRbP9dvvqm/QbWolbLhaU24
	 KFgEl35c2NLoc5Y+0tJW4G8zRHBKSlFqIpJeORQtUSssxx4qhX992y6bOOlw2NtpDX
	 ZwVx5WP9liM7U/cCQS4EuBLGuO+/5p6xZOyZi13E=
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
Subject: [PATCH v8 05/13] coresight: etm4x: remove s_ex_level from config
Date: Mon, 29 Jun 2026 09:59:58 +0100
Message-ID: <20260629090007.1718746-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629090007.1718746-1-yeoreum.yun@arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_020022_977980_6B5018DF 
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

s_ex_level is a hardware capability rather than a configurable parameter.
As such, it should not be stored in the configuration structure.

Remove s_ex_level from the config structure and pass etm4_caps to the
functions that need to access this capability.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm4x-core.c          | 58 +++++++++++--------
 .../coresight/coresight-etm4x-sysfs.c         |  2 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |  5 +-
 3 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 8fc593bc7041..faa00dcd03a7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -66,10 +66,12 @@ MODULE_PARM_DESC(pm_save_enable,
 	"Save/restore state on power down: 1 = never, 2 = self-hosted. MMIO and DT only.");
 
 static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
-static void etm4_set_default_config(struct etmv4_config *config);
+static void etm4_set_default_config(struct etmv4_config *config,
+				    const struct etmv4_caps *caps);
 static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
 				  struct perf_event *event);
-static u64 etm4_get_access_type(struct etmv4_config *config);
+static u64 etm4_get_access_type(struct etmv4_config *config,
+				const struct etmv4_caps *caps);
 
 static enum cpuhp_state hp_online;
 
@@ -784,7 +786,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		config->mode |= ETM_MODE_EXCL_GUEST;
 
 	/* Always start from the default config */
-	etm4_set_default_config(config);
+	etm4_set_default_config(config, caps);
 
 	/* Configure filters specified on the perf cmd line, if any. */
 	ret = etm4_set_event_filters(drvdata, event);
@@ -1445,7 +1447,6 @@ static void etm4_init_arch_data(void *info)
 
 	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
 	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
-	drvdata->config.s_ex_level = caps->s_ex_level;
 	/* EXLEVEL_NS, bits[23:20] Non-secure state instruction tracing */
 	caps->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
 	/*
@@ -1530,19 +1531,22 @@ static void etm4_init_arch_data(void *info)
 	cpu_detect_trace_filtering(drvdata);
 }
 
-static u32 etm4_get_victlr_access_type(struct etmv4_config *config)
+static u32 etm4_get_victlr_access_type(struct etmv4_config *config,
+				       const struct etmv4_caps *caps)
 {
-	return etm4_get_access_type(config) << __bf_shf(TRCVICTLR_EXLEVEL_MASK);
+	return etm4_get_access_type(config, caps) << __bf_shf(TRCVICTLR_EXLEVEL_MASK);
 }
 
 /* Set ELx trace filter access in the TRCVICTLR register */
-static void etm4_set_victlr_access(struct etmv4_config *config)
+static void etm4_set_victlr_access(struct etmv4_config *config,
+			           const struct etmv4_caps *caps)
 {
 	config->vinst_ctrl &= ~TRCVICTLR_EXLEVEL_MASK;
-	config->vinst_ctrl |= etm4_get_victlr_access_type(config);
+	config->vinst_ctrl |= etm4_get_victlr_access_type(config, caps);
 }
 
-static void etm4_set_default_config(struct etmv4_config *config)
+static void etm4_set_default_config(struct etmv4_config *config,
+			            const struct etmv4_caps *caps)
 {
 	/* disable all events tracing */
 	config->eventctrl0 = 0x0;
@@ -1561,7 +1565,7 @@ static void etm4_set_default_config(struct etmv4_config *config)
 	config->vinst_ctrl = FIELD_PREP(TRCVICTLR_EVENT_MASK, 0x01);
 
 	/* TRCVICTLR::EXLEVEL_NS:EXLEVELS: Set kernel / user filtering */
-	etm4_set_victlr_access(config);
+	etm4_set_victlr_access(config, caps);
 }
 
 static u64 etm4_get_ns_access_type(struct etmv4_config *config)
@@ -1593,21 +1597,24 @@ static u64 etm4_get_ns_access_type(struct etmv4_config *config)
  * This must be shifted to the corresponding register field
  * for usage.
  */
-static u64 etm4_get_access_type(struct etmv4_config *config)
+static u64 etm4_get_access_type(struct etmv4_config *config,
+				const struct etmv4_caps *caps)
 {
 	/* All Secure exception levels are excluded from the trace */
-	return etm4_get_ns_access_type(config) | (u64)config->s_ex_level;
+	return etm4_get_ns_access_type(config) | (u64)caps->s_ex_level;
 }
 
-static u64 etm4_get_comparator_access_type(struct etmv4_config *config)
+static u64 etm4_get_comparator_access_type(struct etmv4_config *config,
+					   const struct etmv4_caps *caps)
 {
-	return etm4_get_access_type(config) << TRCACATR_EXLEVEL_SHIFT;
+	return etm4_get_access_type(config, caps) << TRCACATR_EXLEVEL_SHIFT;
 }
 
 static void etm4_set_comparator_filter(struct etmv4_config *config,
+				       const struct etmv4_caps *caps,
 				       u64 start, u64 stop, int comparator)
 {
-	u64 access_type = etm4_get_comparator_access_type(config);
+	u64 access_type = etm4_get_comparator_access_type(config, caps);
 
 	/* First half of default address comparator */
 	config->addr_val[comparator] = start;
@@ -1638,11 +1645,12 @@ static void etm4_set_comparator_filter(struct etmv4_config *config,
 }
 
 static void etm4_set_start_stop_filter(struct etmv4_config *config,
+				       const struct etmv4_caps *caps,
 				       u64 address, int comparator,
 				       enum etm_addr_type type)
 {
 	int shift;
-	u64 access_type = etm4_get_comparator_access_type(config);
+	u64 access_type = etm4_get_comparator_access_type(config, caps);
 
 	/* Configure the comparator */
 	config->addr_val[comparator] = address;
@@ -1674,7 +1682,8 @@ static void etm4_set_default_filter(struct etmv4_config *config)
 	config->vissctlr = 0x0;
 }
 
-static void etm4_set_default(struct etmv4_config *config)
+static void etm4_set_default(struct etmv4_config *config,
+			     const struct etmv4_caps *caps)
 {
 	if (WARN_ON_ONCE(!config))
 		return;
@@ -1686,7 +1695,7 @@ static void etm4_set_default(struct etmv4_config *config)
 	 * full instruction trace - with a default filter for trace all
 	 * achieved by having no filtering.
 	 */
-	etm4_set_default_config(config);
+	etm4_set_default_config(config, caps);
 	etm4_set_default_filter(config);
 }
 
@@ -1734,6 +1743,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
 {
 	int i, comparator, ret = 0;
 	u64 address;
+	const struct etmv4_caps *caps = &drvdata->caps;
 	struct etmv4_config *config = &drvdata->config;
 	struct etm_filters *filters = event->hw.addr_filters;
 
@@ -1763,7 +1773,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
 
 		switch (type) {
 		case ETM_ADDR_TYPE_RANGE:
-			etm4_set_comparator_filter(config,
+			etm4_set_comparator_filter(config, caps,
 						   filter->start_addr,
 						   filter->stop_addr,
 						   comparator);
@@ -1784,7 +1794,7 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
 				   filter->stop_addr);
 
 			/* Configure comparator */
-			etm4_set_start_stop_filter(config, address,
+			etm4_set_start_stop_filter(config, caps, address,
 						   comparator, type);
 
 			/*
@@ -1820,7 +1830,8 @@ static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
 	return ret;
 }
 
-void etm4_config_trace_mode(struct etmv4_config *config)
+void etm4_config_trace_mode(struct etmv4_config *config,
+			    const struct etmv4_caps *caps)
 {
 	u32 mode;
 
@@ -1834,7 +1845,7 @@ void etm4_config_trace_mode(struct etmv4_config *config)
 	if (!(mode & ETM_MODE_EXCL_KERN) && !(mode & ETM_MODE_EXCL_USER))
 		return;
 
-	etm4_set_victlr_access(config);
+	etm4_set_victlr_access(config, caps);
 }
 
 static int etm4_online_cpu(unsigned int cpu)
@@ -2146,6 +2157,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	struct coresight_platform_data *pdata = NULL;
 	struct device *dev = init_arg->dev;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
+	const struct etmv4_caps *caps = &drvdata->caps;
 	struct coresight_desc desc = { 0 };
 	u8 major, minor;
 	char *type_name;
@@ -2175,7 +2187,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	if (!desc.name)
 		return -ENOMEM;
 
-	etm4_set_default(&drvdata->config);
+	etm4_set_default(&drvdata->config, caps);
 
 	if (etm4x_always_pm_save(dev, init_arg->csa))
 		pm_save = true;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index ac290f446c51..fa4a271d4191 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -443,7 +443,7 @@ static ssize_t mode_store(struct device *dev,
 		config->vinst_ctrl &= ~TRCVICTLR_TRCERR;
 
 	if (config->mode & (ETM_MODE_EXCL_KERN | ETM_MODE_EXCL_USER))
-		etm4_config_trace_mode(config);
+		etm4_config_trace_mode(config, caps);
 
 	raw_spin_unlock(&drvdata->spinlock);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 86fd0cad703e..43f878dc8748 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -955,7 +955,6 @@ struct etmv4_caps {
  * @vmid_mask0:	VM ID comparator mask for comparator 0-3.
  * @vmid_mask1:	VM ID comparator mask for comparator 4-7.
  * @ext_inp:	External input selection.
- * @s_ex_level: Secure ELs where tracing is supported.
  */
 struct etmv4_config {
 	u64				mode;
@@ -998,7 +997,6 @@ struct etmv4_config {
 	u32				vmid_mask0;
 	u32				vmid_mask1;
 	u32				ext_inp;
-	u8				s_ex_level;
 };
 
 /**
@@ -1119,7 +1117,8 @@ enum etm_addr_ctxtype {
 };
 
 extern const struct attribute_group *coresight_etmv4_groups[];
-void etm4_config_trace_mode(struct etmv4_config *config);
+void etm4_config_trace_mode(struct etmv4_config *config,
+			    const struct etmv4_caps *caps);
 
 u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit);
 void etm4x_sysreg_write(u64 val, u32 offset, bool _relaxed, bool _64bit);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


