Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7508E937EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhiMr6/4cpfSMr434Svd6fTlzHtz588S+85p9ZUCAsY=; b=FhdtEmNZ4ADIDmGoEEx6XIsDab
	BQfNIZ4kn6dWHlz3ukdtA7YyyzIcsgmTXxZPutYyie9V8TaulfXHVluNYx1Ll77liTdhKG07vIAS6
	XhQ+CwaQ+PMw1gGzYSdbxvPNT+LqvkEm6Foy1toB9Xu7TWAEzXtxs+Ks5Q2/ZJgttw3r8Fvk+/6LK
	UD0gcdDCvSbmtYxUzHFtV/jcybt4mML0rnWfaHWd+XN/9vLzoCJ7DOvRF5dslZGBxS37suRlI/CqC
	PsEDB+SJMIctC3V6iWTOVMel/pWtFsRz/a2Pry6eq/gVLGuEW6bYd3BwlTqs8Vpx/DHzL60X6zDCk
	s7R9/KiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBz1m-0000000EYwS-0obc;
	Sun, 12 Apr 2026 17:55:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBz1f-0000000EYsx-45rd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:55:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B915E4D23;
	Sun, 12 Apr 2026 10:55:08 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E694F3F7B4;
	Sun, 12 Apr 2026 10:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776016514; bh=DJgEprvbSEmAeh7NwR8pfDaeaSxlJbbq4UEB+jx01Ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ftEjm7qjSM7EWwNmYpif371Q+iDZHdNtmXKun9EU30heXVScMwfyB3yXRiak+fe1q
	 kLWvkMnUe1X8X0AQmD2a+0aToCZq+gFm+2xT/AC/vdBgWCgeUuClZJppdYMIUiUcmT
	 N6Pf7vfY2fCs80hYMeGscxiI2+7d2uNdKFD3ZsZc=
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
Subject: [PATCH v3 2/5] coresight: etm4x: exclude ss_status from drvdata->config
Date: Sun, 12 Apr 2026 18:55:03 +0100
Message-Id: <20260412175506.412301-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260412175506.412301-1-yeoreum.yun@arm.com>
References: <20260412175506.412301-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_105517_091862_39571EB3 
X-CRM114-Status: GOOD (  16.56  )
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
 drivers/hwtracing/coresight/coresight-etm4x.h  |  3 ++-
 4 files changed, 9 insertions(+), 20 deletions(-)

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
index 8eebb83fcaeb..3cc1ca76c933 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -213,6 +213,7 @@
 #define TRCACATRn_EXLEVEL_MASK			GENMASK(14, 8)
 
 #define TRCSSCSRn_STATUS			BIT(31)
+#define TRCSSCSRn_PENDING			BIT(30)
 #define TRCSSCCRn_SAC_ARC_RST_MASK		GENMASK(24, 0)
 
 #define TRCSSPCICRn_PC_MASK			GENMASK(7, 0)
@@ -898,6 +899,7 @@ struct etmv4_caps {
 	bool	atbtrig : 1;
 	bool	lpoverride : 1;
 	bool	skip_power_up : 1;
+	u32	ss_status[ETM_MAX_SS_CMP];
 };
 
 /**
@@ -976,7 +978,6 @@ struct etmv4_config {
 	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
 	u8				ss_idx;
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
-	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
 	u8				addr_idx;
 	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


