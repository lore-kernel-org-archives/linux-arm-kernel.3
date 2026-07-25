Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C00C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbQvtRpADPWlkL4BayJUB2kdU58zWu4a2csIYPj32J0=; b=rDDUhigr1YAKxMgBtwbKV2cIvr
	PBtbB4zom1nMjFyAIwYRQy5GoXZeRiuqUVCZL9IdCdXUr4HaDIEfmwjECQ4XymG6BNJrx+VueRosK
	88OnobOVrFGWR0sSVicdBmJvlOSVTm87GxWBWSiL0IGSJNxhNE/2STssdkSCwLdaFwOHp/kJhheWC
	IDTRSdB6SMO0g22R0Y0Bqcw0U+rXMRYaRHB2MPTyMVKAmf9/gMAxhMrSEWk3EK7012YeAP6kIDOfo
	+DkleJrlXiCmZ5LTRNxAz2V6juXSTPZS4AaMX8qDecQhmudxeeanq95oXvp4iTjs0nQh9RCJq4qnn
	Qi3ATJ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagm-00000000IE9-1HZA;
	Sat, 25 Jul 2026 11:37:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagh-00000000ICQ-410n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CE4B1A9A;
	Sat, 25 Jul 2026 04:36:55 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 175453F86F;
	Sat, 25 Jul 2026 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979419; bh=1wUPEE/MHLaiL1G8PWcFwddhnb1wbeYVF6Gouhra9fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=luIVGpyA4XsQYJnbkdAnvjbtMTOiHGZbS8iL/FmfMhaS0KO/X6jVANJ9fMv9bA+Oi
	 zJSFBESsjnZfOVFipUBm4fksfclKbBsXtBIVypEsRxj+9hfRMx2iVATZhA78yR26G4
	 eTCFEHfO/NSQufWBcC44BVAWUwxw4pV0Y7fxPQcg=
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
Subject: [PATCH v9 02/13] coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
Date: Sat, 25 Jul 2026 12:36:34 +0100
Message-ID: <20260725113645.57519-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043704_292762_EE84F260 
X-CRM114-Status: GOOD (  17.50  )
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

According to IHI006H Embedded Trace Macrocell Architecture
Specification[0], TRCSEQEVR<n> is implemented only when
TRCIDR5.NUMSEQSTATE is 0b100, in which case n ranges from 0 to 2;
otherwise, TRCIDR5.NUMSEQSTATE is 0b000.

IOW, the number of usage in the initialisation or setting
TRCSEQEVR<n> with drvdata->nrseqstate - 1 in the loop could make
underflow issue when TRCIDR5.NUMSEQSTATE is 0b000.

Therefore, introduce nr_seq_ctrls field and untie it from nrseqstate.
As part of this introduce ETM_MAX_SEQ_TRANSITIONS macro and
apply nr_seq_ctrls and above macro to TRCSEQEVR<n> relevant fields setup.

Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
Suggested-by: Leo Yan <leo.yan@arm.com>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c   | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 9 ++++++---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 6 ++++--
 drivers/hwtracing/coresight/coresight-etm4x.h       | 7 +++++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index c302072b293a..e1a59b434505 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
@@ -76,7 +76,7 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
 	} else if ((offset & GENMASK(11, 4)) == TRCSEQEVRn(0)) {
 		/* sequencer state control registers */
 		idx = (offset & GENMASK(3, 0)) / 4;
-		if (idx < ETM_MAX_SEQ_STATES) {
+		if (idx < ETM_MAX_SEQ_TRANSITIONS) {
 			reg_csdev->driver_regval = &drvcfg->seq_ctrl[idx];
 			err = 0;
 		}
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1e3b0344dc00..1884960cfe6f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -542,7 +542,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
 	if (drvdata->nr_pe_cmp)
 		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
+
+	for (i = 0; i < drvdata->nr_seq_ctrls; i++)
 		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
 	if (drvdata->nrseqstate) {
 		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
@@ -1508,6 +1509,8 @@ static void etm4_init_arch_data(void *info)
 	drvdata->lpoverride = (etmidr5 & TRCIDR5_LPOVERRIDE) && (!drvdata->skip_power_up);
 	/* NUMSEQSTATE, bits[27:25] number of sequencer states implemented */
 	drvdata->nrseqstate = FIELD_GET(TRCIDR5_NUMSEQSTATE_MASK, etmidr5);
+	if (drvdata->nrseqstate)
+		drvdata->nr_seq_ctrls = ETM_MAX_SEQ_TRANSITIONS;
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
 
@@ -1896,7 +1899,7 @@ static int etm4_cpu_save(struct coresight_device *csdev)
 	if (drvdata->nr_pe_cmp)
 		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
 
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
+	for (i = 0; i < drvdata->nr_seq_ctrls; i++)
 		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
 
 	if (drvdata->nrseqstate) {
@@ -2009,7 +2012,7 @@ static void etm4_cpu_restore(struct coresight_device *csdev)
 	if (drvdata->nr_pe_cmp)
 		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
 
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
+	for (i = 0; i < drvdata->nr_seq_ctrls; i++)
 		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
 
 	if (drvdata->nrseqstate) {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index e9eeea6240d5..cc6cdd3ae29d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -223,7 +223,7 @@ static ssize_t reset_store(struct device *dev,
 	config->vipcssctlr = 0x0;
 
 	/* Disable seq events */
-	for (i = 0; i < drvdata->nrseqstate-1; i++)
+	for (i = 0; i < drvdata->nr_seq_ctrls; i++)
 		config->seq_ctrl[i] = 0x0;
 	config->seq_rst = 0x0;
 	config->seq_state = 0x0;
@@ -1395,9 +1395,11 @@ static ssize_t seq_idx_store(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etmv4_config *config = &drvdata->config;
 
+	if (!drvdata->nr_seq_ctrls)
+		return -ENOTSUPP;
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
-	if (val >= drvdata->nrseqstate - 1)
+	if (val >= drvdata->nr_seq_ctrls)
 		return -EINVAL;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 89d81ce4e04e..84db8b97c98a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -614,6 +614,7 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
 #define ETM_MAX_NR_PE			8
 #define ETMv4_MAX_CNTR			4
 #define ETM_MAX_SEQ_STATES		4
+#define ETM_MAX_SEQ_TRANSITIONS		3
 #define ETM_MAX_EXT_INP_SEL		4
 #define ETM_MAX_EXT_INP			256
 #define ETM_MAX_EXT_OUT			4
@@ -877,7 +878,7 @@ struct etmv4_config {
 	u32				vipcssctlr;
 	u8				seq_idx;
 	u8				syncfreq;
-	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
+	u32				seq_ctrl[ETM_MAX_SEQ_TRANSITIONS];
 	u32				seq_rst;
 	u32				seq_state;
 	u8				cntr_idx;
@@ -928,7 +929,7 @@ struct etmv4_save_state {
 	u32	trcvissctlr;
 	u32	trcvipcssctlr;
 
-	u32	trcseqevr[ETM_MAX_SEQ_STATES];
+	u32	trcseqevr[ETM_MAX_SEQ_TRANSITIONS];
 	u32	trcseqrstevr;
 	u32	trcseqstr;
 	u32	trcextinselr;
@@ -981,6 +982,7 @@ struct etmv4_save_state {
  * @numcidc:	Number of contextID comparators.
  * @numvmidc:	Number of VMID comparators.
  * @nrseqstate: The number of sequencer states that are implemented.
+ * @nr_seq_ctrls: The number of sequence state transition control registers.
  * @nr_event:	Indicates how many events the trace unit support.
  * @nr_resource:The number of resource selection pairs available for tracing.
  * @nr_ss_cmp:	Number of single-shot comparator controls that are available.
@@ -1046,6 +1048,7 @@ struct etmv4_drvdata {
 	u8				numextinsel;
 	u8				numvmidc;
 	u8				nrseqstate;
+	u8				nr_seq_ctrls;
 	u8				nr_event;
 	u8				nr_resource;
 	u8				nr_ss_cmp;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


