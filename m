Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4E0C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+TGG8qtBglqJavPmY+hs70Dp6jkC5Q68VitJTVW8cc=; b=o7pFIXavHCZftILOmK+mcq/Y7a
	sS3wD66CL4xR6eHgQLQPMr8c3hTZIkMmaMICxZuukTFV2bZX7jG+XIOV9FAGx6eu47FOYHGNRGJPn
	bM4ZG5lowrYTYWCjLmfe8hInMchH7MLgneVwqkkxajLWgZUUPmA+KXmOLCYl6XyXWzdQA6udW6Prz
	wVVbugcpMCauyqaQ8rSGReOJFB8J6LxWiIuodLVgXGqdQWp+lr99cABPwX1dtGvzerkfF9BQ15RS0
	LFg9KbsAiB1X2A04HLms6WYcfc/JbMWSUXiybf+pkA9aFRZ6gRF914hjz67JrztaP6Wowynv/0LOM
	8X7tGdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ywI-0000000GRRZ-1M6F;
	Fri, 11 Sep 2026 10:57:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yvr-0000000GRFZ-12MS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:56:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68DAF16F2;
	Fri, 11 Sep 2026 03:56:30 -0700 (PDT)
Received: from e129823.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C9B83F7B4;
	Fri, 11 Sep 2026 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789124194; bh=Ra8WQUHklL6D0vxjAbS4QN95/5pSkuGiFKCCtMPG3K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y66OqGDOoMZ5rDOVu97u1CocBc0tXwG+zvAmfQe+vTC9Z0EV+q3c+E5bwA4QfHY8u
	 Y6UbzGY1vttB+8klivslgxu0WkaJkaGhXa3b1E6UODEWd6R2B00JkBvCYcoXQPJE0M
	 FxTeYpFy2DCPZIl691db3beq1o4fevDiBNv3Rv/4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 11 Sep 2026 11:56:07 +0100
Subject: [PATCH v10 8/8] coresight: etm3x: introduce struct etm_caps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-separate_etm_cfg_v2-v10-8-1b715d95927a@arm.com>
References: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
In-Reply-To: <20260911-separate_etm_cfg_v2-v10-0-1b715d95927a@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13291; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=Ra8WQUHklL6D0vxjAbS4QN95/5pSkuGiFKCCtMPG3K8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqo95Li59Qm5cL/vDxa1NrtZ1PqCttmWneb7G/m
 //JnvIo4kqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqPeSwAKCRBt1cPRWsUx
 MzyTC/94N7GQ2/dI2LoT31h8TvciN3TjSkhIIAt7yIXuU6nfNladTscclQe4nzOJtgD+BYh4sZl
 zHyYa1cwcMqc5TLsOBS4aaA59YKJmXmrflSGfqQeQtqi1XLqTds4NQIE/5Msr+VQ3bfIfsS+ztz
 U8YAZto2kUxG3AxzTF8UiMkjnzAUbdmF1pj/Gg21drfEjOjHb18FrnlG5UB80irydECz+4B7l6c
 I7VZVV+SV3NGX+zajqIr9wL1U0Rf6rmlIGr2nYUnxT5VwF2EsjNbyFiETrhoVll4suzaK0O7x0h
 47q2UTZCk9mdPUn/QBo5FH59t96X/dwo1lIEkiEeT1UQm659oBz+2cWf6g4JambQ52Qfk2nMUn9
 IEjetF/O6qNmaB3OL0FdVuHXzmvqKq3B8nuIlPCA4y1M0Gz9tRLkCXF3f3oeWJTLPUtMn4K+Luy
 T7+COQ7CMwe3BWECLLAR6XTl8lqQNfa2Npjn30Vag7ZSle6iF+vfy+UNjPBpq9GB0Id6E=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_035635_504928_E2FB62E2 
X-CRM114-Status: GOOD (  23.79  )
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
 drivers/hwtracing/coresight/coresight-etm.h        | 42 +++++++++++++---------
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 39 +++++++++++---------
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    | 25 ++++++++-----
 3 files changed, 65 insertions(+), 41 deletions(-)

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
index 0701edc09458..6c911b8c1be9 100644
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
@@ -719,6 +724,7 @@ static ssize_t cntr_val_show(struct device *dev,
 {
 	u32 val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etm_caps *caps = &drvdata->caps;
 	struct etm_config *config = &drvdata->config;
 
 	if (!coresight_get_mode(drvdata->csdev)) {
@@ -992,13 +998,14 @@ static ssize_t ctxid_idx_store(struct device *dev,
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
2.43.0


