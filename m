Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E06E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAhcRMPStGRqCLofBjWI9q2BlqenCQBHYgu7i35fXPo=; b=DOIuc8ZrFEuyQ2S7Uq/0VdHfh8
	QGjzWoeujXtvsznPhc6IGlx59KX9t8A9ye7Otf4sUSHGdGvexlzfCS14+j89GAjoKLTtGV78FwIwb
	JH5X0GLN4VfkDPC1H/iCShvAosnLbq8fwKbSOfRD0R2CJ9zbQnT9rtkzrsYkJ5f4VXsPyUbmnAPa0
	qK/ux5aI3hVURRCZrY3ODjOjyXxPO/D8PaC0cK9BzlVeUN7n139sPVee1i9XwVjC3h5K/d9DX5S6M
	CHt8j5+ndggX1LRFVaDDOMHeD/2KC8HJnB14BlWHh1PnpQkIFMXCDLj6GcPIOAzftEaaQTwqVjPdL
	xBP5UMIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2rp-00000007D05-3DmN;
	Sat, 21 Dec 2024 17:02:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2pJ-00000007Cgb-2rJa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 16:59:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 279021477;
	Sat, 21 Dec 2024 09:00:07 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C53ED3F528;
	Sat, 21 Dec 2024 08:59:37 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs while enabled
Date: Sat, 21 Dec 2024 16:59:31 +0000
Message-Id: <20241221165934.1161856-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241221165934.1161856-1-yeoreum.yun@arm.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_085941_816485_6DB9F780 
X-CRM114-Status: GOOD (  13.44  )
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

When etm4x configuration is modified via sysfs while etm4x is being
enabled via perf, enabled etm4x could run with different configuration
from perf_event.

To address this, disallow altering config via sysfs while csdev is enabled.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm4x-sysfs.c         | 132 +++++++++++++++++-
 1 file changed, 128 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 11e865b8e824..cc1f112921d7 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -174,6 +174,9 @@ static ssize_t reset_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	if (val)
 		config->mode = 0x0;
@@ -300,6 +303,9 @@ static ssize_t mode_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	config->mode = val & ETMv4_MODE_ALL;
 
@@ -466,6 +472,9 @@ static ssize_t pe_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	if (val > drvdata->nr_pe) {
 		raw_spin_unlock(&drvdata->spinlock);
@@ -501,6 +510,9 @@ static ssize_t event_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	switch (drvdata->nr_event) {
 	case 0x0:
@@ -550,6 +562,9 @@ static ssize_t event_instren_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	/* start by clearing all instruction event enable bits */
 	config->eventctrl1 &= ~TRCEVENTCTL1R_INSTEN_MASK;
@@ -608,6 +623,9 @@ static ssize_t event_ts_store(struct device *dev,
 	if (!drvdata->ts_size)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	config->ts_ctrl = val & ETMv4_EVENT_MASK;
 	return size;
 }
@@ -638,6 +656,9 @@ static ssize_t syncfreq_store(struct device *dev,
 	if (drvdata->syncpr == true)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	config->syncfreq = val & ETMv4_SYNC_MASK;
 	return size;
 }
@@ -666,6 +687,9 @@ static ssize_t cyc_threshold_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/* mask off max threshold before checking min value */
 	val &= ETM_CYC_THRESHOLD_MASK;
 	if (val < drvdata->ccitmin)
@@ -703,6 +727,9 @@ static ssize_t bb_ctrl_store(struct device *dev,
 	if (!drvdata->nr_addr_cmp)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Bit[8] controls include(1) / exclude(0), bits[0-7] select
 	 * individual range comparators. If include then at least 1
@@ -739,6 +766,9 @@ static ssize_t event_vinst_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	val &= TRCVICTLR_EVENT_MASK >> __bf_shf(TRCVICTLR_EVENT_MASK);
 	config->vinst_ctrl &= ~TRCVICTLR_EVENT_MASK;
@@ -771,6 +801,9 @@ static ssize_t s_exlevel_vinst_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	/* clear all EXLEVEL_S bits  */
 	config->vinst_ctrl &= ~TRCVICTLR_EXLEVEL_S_MASK;
@@ -806,6 +839,9 @@ static ssize_t ns_exlevel_vinst_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	/* clear EXLEVEL_NS bits  */
 	config->vinst_ctrl &= ~TRCVICTLR_EXLEVEL_NS_MASK;
@@ -842,6 +878,9 @@ static ssize_t addr_idx_store(struct device *dev,
 	if (val >= drvdata->nr_addr_cmp * 2)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
@@ -888,6 +927,9 @@ static ssize_t addr_instdatatype_store(struct device *dev,
 	if (sscanf(buf, "%s", str) != 1)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!strcmp(str, "instr"))
@@ -913,7 +955,7 @@ static ssize_t addr_single_show(struct device *dev,
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
 	      config->addr_type[idx] == ETM_ADDR_TYPE_SINGLE)) {
 		raw_spin_unlock(&drvdata->spinlock);
-		return -EPERM;
+		return -EBUSY;
 	}
 	val = (unsigned long)config->addr_val[idx];
 	raw_spin_unlock(&drvdata->spinlock);
@@ -932,12 +974,15 @@ static ssize_t addr_single_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!(config->addr_type[idx] == ETM_ADDR_TYPE_NONE ||
 	      config->addr_type[idx] == ETM_ADDR_TYPE_SINGLE)) {
 		raw_spin_unlock(&drvdata->spinlock);
-		return -EPERM;
+		return -EBUSY;
 	}
 
 	config->addr_val[idx] = (u64)val;
@@ -960,14 +1005,14 @@ static ssize_t addr_range_show(struct device *dev,
 	idx = config->addr_idx;
 	if (idx % 2 != 0) {
 		raw_spin_unlock(&drvdata->spinlock);
-		return -EPERM;
+		return -EBUSY;
 	}
 	if (!((config->addr_type[idx] == ETM_ADDR_TYPE_NONE &&
 	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_NONE) ||
 	      (config->addr_type[idx] == ETM_ADDR_TYPE_RANGE &&
 	       config->addr_type[idx + 1] == ETM_ADDR_TYPE_RANGE))) {
 		raw_spin_unlock(&drvdata->spinlock);
-		return -EPERM;
+		return -EBUSY;
 	}
 
 	val1 = (unsigned long)config->addr_val[idx];
@@ -995,6 +1040,9 @@ static ssize_t addr_range_store(struct device *dev,
 	if (val1 > val2)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (idx % 2 != 0) {
@@ -1063,6 +1111,9 @@ static ssize_t addr_start_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!drvdata->nr_addr_cmp) {
@@ -1118,6 +1169,9 @@ static ssize_t addr_stop_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!drvdata->nr_addr_cmp) {
@@ -1172,6 +1226,9 @@ static ssize_t addr_ctxtype_store(struct device *dev,
 	if (sscanf(buf, "%s", str) != 1)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	if (!strcmp(str, "none"))
@@ -1238,6 +1295,9 @@ static ssize_t addr_context_store(struct device *dev,
 		     drvdata->numcidc : drvdata->numvmidc))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
 	/* clear context ID comparator bits[6:4] */
@@ -1276,6 +1336,9 @@ static ssize_t addr_exlevel_s_ns_store(struct device *dev,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	if (val & ~(TRCACATRn_EXLEVEL_MASK >> __bf_shf(TRCACATRn_EXLEVEL_MASK)))
 		return -EINVAL;
 
@@ -1366,6 +1429,9 @@ static ssize_t vinst_pe_cmp_start_stop_store(struct device *dev,
 	if (!drvdata->nr_pe_cmp)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	config->vipcssctlr = val;
 	raw_spin_unlock(&drvdata->spinlock);
@@ -1398,6 +1464,9 @@ static ssize_t seq_idx_store(struct device *dev,
 	if (val >= drvdata->nrseqstate - 1)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
@@ -1434,6 +1503,9 @@ static ssize_t seq_state_store(struct device *dev,
 	if (val >= drvdata->nrseqstate)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	config->seq_state = val;
 	return size;
 }
@@ -1467,6 +1539,9 @@ static ssize_t seq_event_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->seq_idx;
 	/* Seq control has two masks B[15:8] F[7:0] */
@@ -1501,6 +1576,9 @@ static ssize_t seq_reset_event_store(struct device *dev,
 	if (!(drvdata->nrseqstate))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	config->seq_rst = val & ETMv4_EVENT_MASK;
 	return size;
 }
@@ -1531,6 +1609,9 @@ static ssize_t cntr_idx_store(struct device *dev,
 	if (val >= drvdata->nr_cntr)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
@@ -1572,6 +1653,9 @@ static ssize_t cntrldvr_store(struct device *dev,
 	if (val > ETM_CNTR_MAX_VAL)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->cntr_idx;
 	config->cntrldvr[idx] = val;
@@ -1610,6 +1694,9 @@ static ssize_t cntr_val_store(struct device *dev,
 	if (val > ETM_CNTR_MAX_VAL)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->cntr_idx;
 	config->cntr_val[idx] = val;
@@ -1646,6 +1733,9 @@ static ssize_t cntr_ctrl_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->cntr_idx;
 	config->cntr_ctrl[idx] = val;
@@ -1676,6 +1766,10 @@ static ssize_t res_idx_store(struct device *dev,
 
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
+
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Resource selector pair 0 is always implemented and reserved,
 	 * namely an idx with 0 and 1 is illegal.
@@ -1722,6 +1816,9 @@ static ssize_t res_ctrl_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->res_idx;
 	/* For odd idx pair inversal bit is RES0 */
@@ -1761,6 +1858,9 @@ static ssize_t sshot_idx_store(struct device *dev,
 	if (val >= drvdata->nr_ss_cmp)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	config->ss_idx = val;
 	raw_spin_unlock(&drvdata->spinlock);
@@ -1794,6 +1894,9 @@ static ssize_t sshot_ctrl_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->ss_idx;
 	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
@@ -1844,6 +1947,9 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->ss_idx;
 	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
@@ -1879,6 +1985,9 @@ static ssize_t ctxid_idx_store(struct device *dev,
 	if (val >= drvdata->numcidc)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
@@ -1944,6 +2053,9 @@ static ssize_t ctxid_pid_store(struct device *dev,
 	if (kstrtoul(buf, 16, &pid))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->ctxid_idx;
 	config->ctxid_pid[idx] = (u64)pid;
@@ -2003,6 +2115,9 @@ static ssize_t ctxid_masks_store(struct device *dev,
 	if ((drvdata->numcidc > 4) && (nr_inputs != 2))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	/*
 	 * each byte[0..3] controls mask value applied to ctxid
@@ -2105,6 +2220,9 @@ static ssize_t vmid_idx_store(struct device *dev,
 	if (val >= drvdata->numvmidc)
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	/*
 	 * Use spinlock to ensure index doesn't change while it gets
 	 * dereferenced multiple times within a spinlock block elsewhere.
@@ -2161,6 +2279,9 @@ static ssize_t vmid_val_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 	config->vmid_val[config->vmid_idx] = (u64)val;
 	raw_spin_unlock(&drvdata->spinlock);
@@ -2217,6 +2338,9 @@ static ssize_t vmid_masks_store(struct device *dev,
 	if ((drvdata->numvmidc > 4) && (nr_inputs != 2))
 		return -EINVAL;
 
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
+
 	raw_spin_lock(&drvdata->spinlock);
 
 	/*
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


