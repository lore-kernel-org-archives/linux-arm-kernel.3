Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130B5C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CR4hbHnROcuSYAzP82FLw24/+5rp6DwoH9TrGxGPjo=; b=UN6V1wjFnevkv1ho0FMLvb8zWt
	MDYsgTQ5GRWk2tJoQCANB4Dq72clG3vdDqKY+c0dibOh6as174nvx+uMyCIwgyAruVdW9wT6981mn
	/W7I0+eVGdlbh7MsH/mYFkneB1bP9E2qkAQwCYeqqZI0VMsEkPN8IEL/gKN3bZa/DKGqUV9j4TTRS
	fQvxRFp9cbFj8vSjbIHVNOSJJLkDMltM3gH0i8fuO3i05WIEQl6ZS3t0Is429iy+STuNdK6XIoKhD
	HR1UO7BcKa5LSk3hKNnQA9aE3WUBe8l3G/UoLBm6w03srzLRnJUZJYyDQvsjVGSd+VhxVzxu8lOF5
	wBilav2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nLx-0000000Bmi5-3gB2;
	Thu, 24 Sep 2026 17:35:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nLA-0000000BmH4-0wYz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:34:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C64AC1E4D;
	Thu, 24 Sep 2026 10:34:31 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 001C33F86F;
	Thu, 24 Sep 2026 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790271275; bh=am6sLdCOaVbd/yFfXAOasa2tloW+ZVuGOz7b3saGpC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kVo92T0HWU6NHcS39V7SpRGW5hSW8YbdaHv2G0NvSDPmJhOMykWbAGHI9aQ0QvGlJ
	 d6VeXRj2R+yn2pbtkzwei9XBGhLwEEYxWFgyQrQuiFDWwTQ1R1tdIbduBHBURoeXyF
	 ufmKUCGWC6ywS73YGm1e4XZtADpw3+UliRr+stoU=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 24 Sep 2026 18:33:46 +0100
Subject: [PATCH v12 08/14] coresight: etm4x: exclude ss_status from
 drvdata->config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-separate_etm_cfg_v2-v12-8-a2b41d2f7c2b@arm.com>
References: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
In-Reply-To: <20260924-separate_etm_cfg_v2-v12-0-a2b41d2f7c2b@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7738; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=am6sLdCOaVbd/yFfXAOasa2tloW+ZVuGOz7b3saGpC8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqtV8PV3LaADR0uZ9AhtxjK+z3NpBAQj6KKVQwM
 6VDgVDIr2GJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarVfDwAKCRBt1cPRWsUx
 M5ZLC/9DbToEiPx6Iu9PE1RpUh4uv6y0DEgAQVpx5ENy/BSLP6u9JpPrKb+5v/3gYU/YHrLqrm9
 3Z1JNlpgQgVhsaoSe0+RUYQZgKEUGJkVXbJR0RSKjyWSNNyfi8IqXBuAskBxTB+/B3YXRqefa0m
 Oa9K1byyKMX9PvAd2XHSR8H6CfA2oyszdi8JJX3b9yEK69arPRT46d9w/xGmEDGD7XvKWtshBJO
 O0vMJfWVML6AKfxQ9Tozt5G9MXyPZd4FxA3esCz2EjE8G1zr13o1cZZNQ38xWf+w7a1/andR3KE
 YuAdPfrnbGYO7dTOHUBglrP+GSGm90QsFDpEht4/Nw1DuoPM5K6sOeV/sq/V6DxDv5jDz49hktY
 OtWoTy2PYUNW/mJHMA8q5E52qLyAwQj2+BJ2ulKtW5XhyExwLdJ41O0rRrF0klUDLug87P3UbK+
 Cm3DdzV8c7sGRnSFinbROm0TAAcoChnOGgihDoXWFVbkQXQVqQPo7byuZnJF79jxYDKWk=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103436_399095_C48D86AE 
X-CRM114-Status: GOOD (  20.94  )
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

Therefore, exclude ss_status from drvdata->config and move it to drvdata.

Before this patch, clearing the PENDING and STATUS bits when enabling
a perf session could trigger multiple single-shot events within
the same session. This issue will be addressed in a future patch;
this patch intentionally preserves the existing behavior.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c   |  1 -
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 18 +++++++-----------
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 10 +++++-----
 drivers/hwtracing/coresight/coresight-etm4x.h       |  8 +++++++-
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index a9f6ed47a2f5..52cb036bb04b 100644
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
index 3900b96e9c7c..4a8c1070bbcb 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -95,7 +95,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
 	const struct etmv4_caps *caps = &drvdata->caps;
 
 	return (n < caps->nr_ss_cmp) && caps->nr_pe_cmp &&
-	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
+	       (drvdata->ss_status[n] & TRCSSCSRn_PC);
 }
 
 u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
@@ -572,11 +572,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
 
 	for (i = 0; i < caps->nr_ss_cmp; i++) {
-		/* always clear status bit on restart if using single-shot */
+		/* always clear status and pending bits on restart if using single-shot */
 		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
-			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+			drvdata->ss_status[i] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
 		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
-		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
+		etm4x_relaxed_write32(csa, drvdata->ss_status[i], TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
 			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
 	}
@@ -1078,7 +1078,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 
 	/* read the status of the single shot comparators */
 	for (i = 0; i < caps->nr_ss_cmp; i++) {
-		config->ss_status[i] =
+		drvdata->ss_status[i] =
 			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
 	}
 
@@ -1163,12 +1163,9 @@ static void etm4_disable_sysfs(struct coresight_device *csdev)
 				 drvdata, 1);
 
 	/*
-	 * Userspace may read ss_status and cntr_val through sysfs after
+	 * Userspace may read cntr_val through sysfs after
 	 * the sysfs-session has been disabled.
 	 */
-	for (i = 0; i < caps->nr_ss_cmp; i++)
-		config->ss_status[i] = curr_config->ss_status[i];
-
 	for (i = 0; i < caps->nr_cntr; i++)
 		config->cntr_val[i] = curr_config->cntr_val[i];
 
@@ -1528,8 +1525,7 @@ static void etm4_init_arch_data(void *info)
 	 */
 	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
 	for (i = 0; i < caps->nr_ss_cmp; i++) {
-		drvdata->config.ss_status[i] =
-			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
+		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
 	}
 	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
 	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 0f1f50b588f2..a66f34c942ba 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1835,8 +1835,8 @@ static ssize_t sshot_ctrl_store(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->ss_idx;
 	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
-	/* must clear bit 31 in related status register on programming */
-	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
+	/* must clear bit 31 and 30 in related status register on programming */
+	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -1850,7 +1850,7 @@ static ssize_t sshot_status_show(struct device *dev,
 	struct etmv4_config *config = &drvdata->config;
 
 	raw_spin_lock(&drvdata->spinlock);
-	val = config->ss_status[config->ss_idx];
+	val = drvdata->ss_status[config->ss_idx];
 	raw_spin_unlock(&drvdata->spinlock);
 	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
 }
@@ -1885,8 +1885,8 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->ss_idx;
 	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
-	/* must clear bit 31 in related status register on programming */
-	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
+	/* must clear bit 31 and 30 in related status register on programming */
+	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index b4579261868d..67071f7cbdbc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -213,6 +213,11 @@
 #define TRCACATRn_EXLEVEL_MASK			GENMASK(14, 8)
 
 #define TRCSSCSRn_STATUS			BIT(31)
+/*
+ * TRCSSCSR.PENDING is only implemented by ETE and is therefore not
+ * described in DEN0117. See Arm ARM (DDI0487) M.c, section D24.4.59.
+ */
+#define TRCSSCSRn_PENDING			BIT(30)
 #define TRCSSCCRn_SAC_ARC_RST_MASK		GENMASK(24, 0)
 
 #define TRCSSPCICRn_PC_MASK			GENMASK(7, 0)
@@ -980,7 +985,6 @@ struct etmv4_config {
 	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
 	u8				ss_idx;
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
-	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
 	u8				addr_idx;
 	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
@@ -1071,6 +1075,7 @@ struct etmv4_save_state {
  * @config:	structure holding sysfs mode configuration.
  * @save_state:	State to be preserved across power loss
  * @paused:	Indicates if the trace unit is paused.
+ * @ss_status:	The status of the corresponding single-shot comparator.
  * @arch_features: Bitmap of arch features of etmv4 devices.
  */
 struct etmv4_drvdata {
@@ -1091,6 +1096,7 @@ struct etmv4_drvdata {
 	struct etmv4_config		curr_config;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
+	u32				ss_status[ETM_MAX_SS_CMP];
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.43.0


