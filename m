Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB988C53219
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfpek8eFNnh5z362WmJdakpVVlLqpJsuwxwD1hCfKsA=; b=KVXUaPfIpUeQnvkf0gmYgRzeNz
	mZePTg3El2GMZ7dtQBTorI6iryDo0a57dXu1G2UUt2fIwsX0rA1B/59znKeL2I4GtkJ2RqW9w5fjD
	NnUZvcsNyR9DrNA3V/DfDdos/Lu+QN7PMzfgqFNC6oaAZJJjrmx5FoFIb/+h4LQ02Wsnju6Enrzc9
	Y/oKpIFQDZ+jMYpxdtzlYlum2UdDLiKcBrMu3RcIBoJ8ZO1zfP57wPUdPK3ci6e+rEvZNkuirseTo
	uWhYrpjD6qH7InP9qPXKaBdp26j92I1MCrFXhThsPLAH8sTWSq1HiCMdTjzHbTToYNJuMR9EIXW9L
	88hVZqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnahb-00000000Ir2-2tur;
	Sat, 25 Jul 2026 11:37:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnahB-00000000IXY-1h4k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EFE51476;
	Sat, 25 Jul 2026 04:37:27 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3549D3F86F;
	Sat, 25 Jul 2026 04:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979451; bh=cRIgcPNGbHW1IeBlbR/zWOE9Pweyb1DsrAzUua70M7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ew96MRXl0QOe7oMccSyhRukTG72Qfo07gcOQ4nBXiMcfury7aq24yc+bMXdvQpFXk
	 K72dAdmwfmL2sjzFKk0iifKPTChRhWjbksHTHJtWX6jMGtrDkgF0claIxMf3nNjTob
	 IHRI5H9R+eyNc6DMcIOgr9a7Sp/AR6c2xMQhUiaM=
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
Subject: [PATCH v9 13/13] coresight: etm3x: introduce struct etm_caps
Date: Sat, 25 Jul 2026 12:36:45 +0100
Message-ID: <20260725113645.57519-14-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043733_745852_8986568F 
X-CRM114-Status: GOOD (  23.54  )
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

Introduce struct etm_caps to describe ETMv3 capabilities
and move capabilities information into it.

Since drvdata->etmccr and drvdata->etmccer are used to check
whether it supports fifofull logic and timestamping,
remove etmccr and etmccer field from drvdata and add relevant fields
in etm_caps structure.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm.h   | 42 ++++++++++++-------
 .../coresight/coresight-etm3x-core.c          | 39 ++++++++++-------
 .../coresight/coresight-etm3x-sysfs.c         | 29 ++++++++-----
 3 files changed, 67 insertions(+), 43 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index bc8909a905c7..ceb333f3d691 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -140,6 +140,30 @@
 				 ETM_ADD_COMP_0		|	\
 				 ETM_EVENT_NOT_A)
 
+/**
+ * struct etm_caps - specifics ETM capabilities
+ * @port_size:	port size as reported by ETMCR bit 4-6 and 21.
+ * @nr_addr_cmp:Number of pairs of address comparators as found in ETMCCR.
+ * @nr_cntr:	Number of counters as found in ETMCCR bit 13-15.
+ * @nr_ext_inp:	Number of external input as found in ETMCCR bit 17-19.
+ * @nr_ext_out:	Number of external output as found in ETMCCR bit 20-22.
+ * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR bit 24-25.
+ * @fifofull:	FIFOFULL logic is present.
+ * @timestamp:	Timestamping is implemented.
+ * @retstack:	Return stack is implemented.
+ */
+struct etm_caps {
+	int	port_size;
+	u8	nr_addr_cmp;
+	u8	nr_cntr;
+	u8	nr_ext_inp;
+	u8	nr_ext_out;
+	u8	nr_ctxid_cmp;
+	bool	fifofull : 1;
+	bool	timestamp : 1;
+	bool	retstack : 1;
+};
+
 /**
  * struct etm_config - configuration information related to an ETM
  * @mode:	controls various modes supported by this ETM/PTM.
@@ -212,19 +236,12 @@ struct etm_config {
  * @csdev:	component vitals needed by the framework.
  * @spinlock:	only one at a time pls.
  * @cpu:	the cpu this component is affined to.
- * @port_size:	port size as reported by ETMCR bit 4-6 and 21.
  * @arch:	ETM/PTM version number.
+ * @caps:	ETM capabilities.
  * @use_cpu14:	true if management registers need to be accessed via CP14.
  * @sticky_enable: true if ETM base configuration has been done.
  * @boot_enable:true if we should start tracing at boot time.
  * @os_unlock:	true if access to management registers is allowed.
- * @nr_addr_cmp:Number of pairs of address comparators as found in ETMCCR.
- * @nr_cntr:	Number of counters as found in ETMCCR bit 13-15.
- * @nr_ext_inp:	Number of external input as found in ETMCCR bit 17-19.
- * @nr_ext_out:	Number of external output as found in ETMCCR bit 20-22.
- * @nr_ctxid_cmp: Number of contextID comparators as found in ETMCCR bit 24-25.
- * @etmccr:	value of register ETMCCR.
- * @etmccer:	value of register ETMCCER.
  * @traceid:	value of the current ID for this component.
  * @active_config:	structure holding current running configuration.
  * @config:	structure holding sysfs mode configuration.
@@ -235,19 +252,12 @@ struct etm_drvdata {
 	struct coresight_device		*csdev;
 	raw_spinlock_t			spinlock;
 	int				cpu;
-	int				port_size;
 	u8				arch;
+	struct etm_caps			caps;
 	bool				use_cp14;
 	bool				sticky_enable;
 	bool				boot_enable;
 	bool				os_unlock;
-	u8				nr_addr_cmp;
-	u8				nr_cntr;
-	u8				nr_ext_inp;
-	u8				nr_ext_out;
-	u8				nr_ctxid_cmp;
-	u32				etmccr;
-	u32				etmccer;
 	u32				traceid;
 	struct etm_config		active_config;
 	struct etm_config		config;
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 14e0724a43a1..9dbfe6a1dc4d 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -308,6 +308,7 @@ void etm_config_trace_mode(struct etm_config *config)
 static int etm_parse_event_config(struct etm_drvdata *drvdata,
 				  struct perf_event *event)
 {
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->active_config;
 	struct perf_event_attr *attr = &event->attr;
 	u8 ts_level;
@@ -356,8 +357,7 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	 * has ret stack) on the same SoC. So only enable when it can be honored
 	 * - trace will still continue normally otherwise.
 	 */
-	if (ATTR_CFG_GET_FLD(attr, retstack) &&
-	    (drvdata->etmccer & ETMCCER_RETSTACK))
+	if (ATTR_CFG_GET_FLD(attr, retstack) && (caps->retstack))
 		config->ctrl |= ETMCR_RETURN_STACK;
 
 	return 0;
@@ -367,6 +367,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 {
 	int i, rc;
 	u32 etmcr;
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
@@ -388,7 +389,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	etmcr = etm_readl(drvdata, ETMCR);
 	/* Clear setting from a previous run if need be */
 	etmcr &= ~ETM3X_SUPPORTED_OPTIONS;
-	etmcr |= drvdata->port_size;
+	etmcr |= caps->port_size;
 	etmcr |= ETMCR_ETM_EN;
 	etm_writel(drvdata, config->ctrl | etmcr, ETMCR);
 	etm_writel(drvdata, config->trigger_event, ETMTRIGGER);
@@ -396,11 +397,11 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	etm_writel(drvdata, config->enable_event, ETMTEEVR);
 	etm_writel(drvdata, config->enable_ctrl1, ETMTECR1);
 	etm_writel(drvdata, config->fifofull_level, ETMFFLR);
-	for (i = 0; i < drvdata->nr_addr_cmp; i++) {
+	for (i = 0; i < caps->nr_addr_cmp; i++) {
 		etm_writel(drvdata, config->addr_val[i], ETMACVRn(i));
 		etm_writel(drvdata, config->addr_acctype[i], ETMACTRn(i));
 	}
-	for (i = 0; i < drvdata->nr_cntr; i++) {
+	for (i = 0; i < caps->nr_cntr; i++) {
 		etm_writel(drvdata, config->cntr_rld_val[i], ETMCNTRLDVRn(i));
 		etm_writel(drvdata, config->cntr_event[i], ETMCNTENRn(i));
 		etm_writel(drvdata, config->cntr_rld_event[i],
@@ -414,9 +415,9 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	etm_writel(drvdata, config->seq_32_event, ETMSQ32EVR);
 	etm_writel(drvdata, config->seq_13_event, ETMSQ13EVR);
 	etm_writel(drvdata, config->seq_curr_state, ETMSQR);
-	for (i = 0; i < drvdata->nr_ext_out; i++)
+	for (i = 0; i < caps->nr_ext_out; i++)
 		etm_writel(drvdata, ETM_DEFAULT_EVENT_VAL, ETMEXTOUTEVRn(i));
-	for (i = 0; i < drvdata->nr_ctxid_cmp; i++)
+	for (i = 0; i < caps->nr_ctxid_cmp; i++)
 		etm_writel(drvdata, config->ctxid_pid[i], ETMCIDCVRn(i));
 	etm_writel(drvdata, config->ctxid_mask, ETMCIDCMR);
 	etm_writel(drvdata, config->sync_freq, ETMSYNCFR);
@@ -564,6 +565,7 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
@@ -573,7 +575,7 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
 	/* Read back sequencer and counters for post trace analysis */
 	config->seq_curr_state = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
 
-	for (i = 0; i < drvdata->nr_cntr; i++)
+	for (i = 0; i < caps->nr_cntr; i++)
 		config->cntr_val[i] = etm_readl(drvdata, ETMCNTVRn(i));
 
 	etm_set_pwrdwn(drvdata);
@@ -715,7 +717,9 @@ static void etm_init_arch_data(void *info)
 {
 	u32 etmidr;
 	u32 etmccr;
+	u32 etmccer;
 	struct etm_drvdata *drvdata = info;
+	struct etm_caps *caps = &drvdata->caps;
 
 	/* Make sure all registers are accessible */
 	etm_os_unlock(drvdata);
@@ -740,16 +744,19 @@ static void etm_init_arch_data(void *info)
 	/* Find all capabilities */
 	etmidr = etm_readl(drvdata, ETMIDR);
 	drvdata->arch = BMVAL(etmidr, 4, 11);
-	drvdata->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
+	caps->port_size = etm_readl(drvdata, ETMCR) & PORT_SIZE_MASK;
+
+	etmccer = etm_readl(drvdata, ETMCCER);
+	caps->timestamp = !!(etmccer & ETMCCER_TIMESTAMP);
+	caps->retstack = !!(etmccer & ETMCCER_RETSTACK);
 
-	drvdata->etmccer = etm_readl(drvdata, ETMCCER);
 	etmccr = etm_readl(drvdata, ETMCCR);
-	drvdata->etmccr = etmccr;
-	drvdata->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
-	drvdata->nr_cntr = BMVAL(etmccr, 13, 15);
-	drvdata->nr_ext_inp = BMVAL(etmccr, 17, 19);
-	drvdata->nr_ext_out = BMVAL(etmccr, 20, 22);
-	drvdata->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
+	caps->fifofull = !!(etmccr & ETMCCR_FIFOFULL);
+	caps->nr_addr_cmp = BMVAL(etmccr, 0, 3) * 2;
+	caps->nr_cntr = BMVAL(etmccr, 13, 15);
+	caps->nr_ext_inp = BMVAL(etmccr, 17, 19);
+	caps->nr_ext_out = BMVAL(etmccr, 20, 22);
+	caps->nr_ctxid_cmp = BMVAL(etmccr, 24, 25);
 
 	coresight_clear_self_claim_tag_unlocked(&drvdata->csa);
 	etm_set_pwrdwn(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 42b12c33516b..f7330d830e21 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -15,8 +15,9 @@ static ssize_t nr_addr_cmp_show(struct device *dev,
 {
 	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etm_caps *caps = &drvdata->caps;
 
-	val = drvdata->nr_addr_cmp;
+	val = caps->nr_addr_cmp;
 	return sprintf(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_addr_cmp);
@@ -25,8 +26,9 @@ static ssize_t nr_cntr_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etm_caps *caps = &drvdata->caps;
 
-	val = drvdata->nr_cntr;
+	val = caps->nr_cntr;
 	return sprintf(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_cntr);
@@ -37,7 +39,7 @@ static ssize_t nr_ctxid_cmp_show(struct device *dev,
 	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	val = drvdata->nr_ctxid_cmp;
+	val = drvdata->caps.nr_ctxid_cmp;
 	return sprintf(buf, "%#lx\n", val);
 }
 static DEVICE_ATTR_RO(nr_ctxid_cmp);
@@ -80,7 +82,7 @@ static ssize_t reset_store(struct device *dev,
 		memset(config, 0, sizeof(struct etm_config));
 		config->mode = ETM_MODE_EXCLUDE;
 		config->trigger_event = ETM_DEFAULT_EVENT_VAL;
-		for (i = 0; i < drvdata->nr_addr_cmp; i++) {
+		for (i = 0; i < drvdata->caps.nr_addr_cmp; i++) {
 			config->addr_type[i] = ETM_ADDR_TYPE_NONE;
 		}
 
@@ -111,6 +113,7 @@ static ssize_t mode_store(struct device *dev,
 	int ret;
 	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->config;
 
 	ret = kstrtoul(buf, 16, &val);
@@ -131,7 +134,7 @@ static ssize_t mode_store(struct device *dev,
 		config->ctrl &= ~ETMCR_CYC_ACC;
 
 	if (config->mode & ETM_MODE_STALL) {
-		if (!(drvdata->etmccr & ETMCCR_FIFOFULL)) {
+		if (!caps->fifofull) {
 			dev_warn(dev, "stall mode not supported\n");
 			ret = -EINVAL;
 			goto err_unlock;
@@ -141,7 +144,7 @@ static ssize_t mode_store(struct device *dev,
 		config->ctrl &= ~ETMCR_STALL_MODE;
 
 	if (config->mode & ETM_MODE_TIMESTAMP) {
-		if (!(drvdata->etmccer & ETMCCER_TIMESTAMP)) {
+		if (!caps->timestamp) {
 			dev_warn(dev, "timestamp not supported\n");
 			ret = -EINVAL;
 			goto err_unlock;
@@ -286,13 +289,14 @@ static ssize_t addr_idx_store(struct device *dev,
 	int ret;
 	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->config;
 
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
 
-	if (val >= drvdata->nr_addr_cmp)
+	if (val >= caps->nr_addr_cmp)
 		return -EINVAL;
 
 	/*
@@ -589,13 +593,14 @@ static ssize_t cntr_idx_store(struct device *dev,
 	int ret;
 	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->config;
 
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
 
-	if (val >= drvdata->nr_cntr)
+	if (val >= caps->nr_cntr)
 		return -EINVAL;
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
@@ -720,18 +725,19 @@ static ssize_t cntr_val_show(struct device *dev,
 	int i, ret = 0;
 	u32 val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->config;
 
 	if (!coresight_get_mode(drvdata->csdev)) {
 		raw_spin_lock(&drvdata->spinlock);
-		for (i = 0; i < drvdata->nr_cntr; i++)
+		for (i = 0; i < caps->nr_cntr; i++)
 			ret += sprintf(buf, "counter %d: %x\n",
 				       i, config->cntr_val[i]);
 		raw_spin_unlock(&drvdata->spinlock);
 		return ret;
 	}
 
-	for (i = 0; i < drvdata->nr_cntr; i++) {
+	for (i = 0; i < caps->nr_cntr; i++) {
 		val = etm_readl(drvdata, ETMCNTVRn(i));
 		ret += sprintf(buf, "counter %d: %x\n", i, val);
 	}
@@ -999,13 +1005,14 @@ static ssize_t ctxid_idx_store(struct device *dev,
 	int ret;
 	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->config;
 
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
 
-	if (val >= drvdata->nr_ctxid_cmp)
+	if (val >= caps->nr_ctxid_cmp)
 		return -EINVAL;
 
 	/*
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


