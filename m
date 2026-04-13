Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2800F34C56
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHZKsU81QOfGRsMOfsragL3rZ9meL7ls/W0VzudbeVo=; b=xNAMnVt33jWfDW/1q8pi2AnedX
	xzvg06MsmEEI9FqTTpdi01QPX/LZfJePwML2yQ0PJfxaM73bwgTmhpd/FtNUQdV98W0gh1MWH0X2j
	hszwwtKNAr6YPaxPOzrE7bGoNgy5XLWdqfTI+ejiLuCJ5gWLW9vjvYZfR7aN2wsfAomT5UDWkglXt
	7b415Sjz88Z46ejTgk74iXRQPZmiUn4TCluK72D9q0BsbHyZ0ceS2VnL2tma9RO5z/v4mAz66QknK
	FJlkdTM8vXsautKaScv5mYuD1iaTNb+wqeHOVYy6EKfWz+bSqDunuoVzNw6ifUk1vPd0EKYlcMLgJ
	eqY8eT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCI99-0000000FqUP-2VEo;
	Mon, 13 Apr 2026 14:20:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCI96-0000000FqSu-16m0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:20:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12C41357A;
	Mon, 13 Apr 2026 07:20:05 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D9163F641;
	Mon, 13 Apr 2026 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776090010; bh=eq//its+fKJHCAAlSCrMXZbgNnYFvVwxJg6I3zp+VAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dk9O07Vneidy+dKZY3ddN998PoxCmBfw5Bfr2jWGFUBzcFhC8MdbSYT5kSuC5a9HB
	 3S2ywtpfyAiUvfJ/oqPziLRm3J6rJDIcFh0iVr43qt6vV4UCDo3kkQYSa7Zy/RnMJv
	 QiNntmyr+9Ynxu0jtmnvUN5yJmHHtHfv9nlpS60U=
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
Subject: [PATCH v4 2/9] coresight: etm4x: exclude ss_status from drvdata->config
Date: Mon, 13 Apr 2026 15:19:55 +0100
Message-Id: <20260413142003.3549310-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413142003.3549310-1-yeoreum.yun@arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_072012_403931_B3D0489F 
X-CRM114-Status: GOOD (  17.53  )
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

The purpose of TRCSSCSRn register is to show status of
the corresponding Single-shot Comparator Control and input supports.
That means writable field's purpose for reset or restore from idle status
not for configuration.

Therefore, exclude ss_status from drvdata->config, move it to etm4x_caps.
This includes remove TRCSSCRn from configurable item and
remove saving in etm4_disable_hw().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-cfg.c  |  1 -
 .../hwtracing/coresight/coresight-etm4x-core.c | 18 +++++-------------
 .../coresight/coresight-etm4x-sysfs.c          |  7 ++-----
 drivers/hwtracing/coresight/coresight-etm4x.h  |  4 +++-
 4 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index c302072b293a..d14d7c8a23e5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
@@ -86,7 +86,6 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
 		off_mask =  (offset & GENMASK(11, 5));
 		do {
 			CHECKREGIDX(TRCSSCCRn(0), ss_ctrl, idx, off_mask);
-			CHECKREGIDX(TRCSSCSRn(0), ss_status, idx, off_mask);
 			CHECKREGIDX(TRCSSPCICRn(0), ss_pe_cmp, idx, off_mask);
 		} while (0);
 	} else if ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7))) {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 6443f3717b37..8ebfd3924143 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -91,7 +91,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
 	const struct etmv4_caps *caps = &drvdata->caps;
 
 	return (n < caps->nr_ss_cmp) && caps->nr_pe &&
-	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
+	       (caps->ss_status[n] & TRCSSCSRn_PC);
 }
 
 u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
@@ -571,11 +571,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
 
 	for (i = 0; i < caps->nr_ss_cmp; i++) {
-		/* always clear status bit on restart if using single-shot */
-		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
-			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
 		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
-		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
+		/* always clear status and pending bits on restart if using single-shot */
+		etm4x_relaxed_write32(csa, caps->ss_status[i], TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
 			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
 	}
@@ -1053,12 +1051,6 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 
 	etm4_disable_trace_unit(drvdata);
 
-	/* read the status of the single shot comparators */
-	for (i = 0; i < caps->nr_ss_cmp; i++) {
-		config->ss_status[i] =
-			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
-	}
-
 	/* read back the current counter values */
 	for (i = 0; i < caps->nr_cntr; i++) {
 		config->cntr_val[i] =
@@ -1501,8 +1493,8 @@ static void etm4_init_arch_data(void *info)
 	 */
 	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
 	for (i = 0; i < caps->nr_ss_cmp; i++) {
-		drvdata->config.ss_status[i] =
-			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
+		caps->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
+		caps->ss_status[i] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
 	}
 	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
 	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 50408215d1ac..dd62f01674cf 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1827,8 +1827,6 @@ static ssize_t sshot_ctrl_store(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->ss_idx;
 	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
-	/* must clear bit 31 in related status register on programming */
-	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -1839,10 +1837,11 @@ static ssize_t sshot_status_show(struct device *dev,
 {
 	unsigned long val;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const struct etmv4_caps *caps = &drvdata->caps;
 	struct etmv4_config *config = &drvdata->config;
 
 	raw_spin_lock(&drvdata->spinlock);
-	val = config->ss_status[config->ss_idx];
+	val = caps->ss_status[config->ss_idx];
 	raw_spin_unlock(&drvdata->spinlock);
 	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
 }
@@ -1877,8 +1876,6 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->ss_idx;
 	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
-	/* must clear bit 31 in related status register on programming */
-	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 8168676f2945..8864cfb76bad 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -213,6 +213,7 @@
 #define TRCACATRn_EXLEVEL_MASK			GENMASK(14, 8)
 
 #define TRCSSCSRn_STATUS			BIT(31)
+#define TRCSSCSRn_PENDING			BIT(30)
 #define TRCSSCCRn_SAC_ARC_RST_MASK		GENMASK(24, 0)
 
 #define TRCSSPCICRn_PC_MASK			GENMASK(7, 0)
@@ -861,6 +862,7 @@ enum etm_impdef_type {
  * @lpoverride:	If the implementation can support low-power state over.
  * @skip_power_up: Indicates if an implementation can skip powering up
  *		   the trace unit.
+ * @ss_status:	The status of the corresponding single-shot comparator.
  */
 struct etmv4_caps {
 	u8	nr_pe;
@@ -899,6 +901,7 @@ struct etmv4_caps {
 	bool	atbtrig : 1;
 	bool	lpoverride : 1;
 	bool	skip_power_up : 1;
+	u32	ss_status[ETM_MAX_SS_CMP];
 };
 
 /**
@@ -977,7 +980,6 @@ struct etmv4_config {
 	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
 	u8				ss_idx;
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
-	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
 	u8				addr_idx;
 	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


