Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8043DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmvZ3fwGKK1GXF5Tg09uceM5PBTkO8q7jbUNj002pnw=; b=CCaYXgeuBEsLkvOJIhNVeutVZm
	R+2+VHZsxT0RyMKkGiOj7DUvYYfrKXwDtsexCT8QUiylLdzYlYYsqrBzfnSQKKNen9tq1u/jeRr3O
	KuN3Z+kmwla+IDHJBnl3ID3nnFtG0fVXvyH8hGZ6XPapKwXNputjYbsEDacKtkKajAT7vS7iw0/8I
	V19UblFHebEeQnhbf3R8fUCwffe2Wdy8gX9pANEoXtUgnfsHnA3Hi+rDGmbmkIFh8LaBxsHYu84J9
	bBbgSY9nNGj7UhwpMIMUys7aK95CNCknLdb5nZQHXtKZis2l5Fi6uqVv7JBlK97UVzlxUi8WKy6az
	vQi5j0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbZt-00000002TGt-47QH;
	Mon, 10 Mar 2025 11:45:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trahO-00000002JIP-3zEO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:49:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CD6815A1;
	Mon, 10 Mar 2025 03:49:42 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2A633F673;
	Mon, 10 Mar 2025 03:49:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 1/8] coresight: etm4x: Extract the trace unit controlling
Date: Mon, 10 Mar 2025 10:49:12 +0000
Message-Id: <20250310104919.58816-2-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310104919.58816-1-leo.yan@arm.com>
References: <20250310104919.58816-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034931_080400_0DA5E789 
X-CRM114-Status: GOOD (  18.49  )
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

The trace unit is controlled in the ETM hardware enabling and disabling.
The sequential changes for support AUX pause and resume will reuse the
same operations.

Extract the operations in the etm4_{enable|disable}_trace_unit()
functions.  A minor improvement in etm4_enable_trace_unit() is for
returning the timeout error to callers.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../coresight/coresight-etm4x-core.c          | 126 ++++++++++--------
 1 file changed, 74 insertions(+), 52 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2c1a60577728..71be566bd117 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -428,6 +428,78 @@ static void etm4_check_arch_features(struct etmv4_drvdata *drvdata,
 }
 #endif /* CONFIG_ETM4X_IMPDEF_FEATURE */
 
+static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
+{
+	struct coresight_device *csdev = drvdata->csdev;
+	struct device *etm_dev = &csdev->dev;
+	struct csdev_access *csa = &csdev->access;
+
+	/*
+	 * ETE mandates that the TRCRSR is written to before
+	 * enabling it.
+	 */
+	if (etm4x_is_ete(drvdata))
+		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
+
+	etm4x_allow_trace(drvdata);
+	/* Enable the trace unit */
+	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
+
+	/* Synchronize the register updates for sysreg access */
+	if (!csa->io_mem)
+		isb();
+
+	/* wait for TRCSTATR.IDLE to go back down to '0' */
+	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_IDLE_BIT, 0)) {
+		dev_err(etm_dev,
+			"timeout while waiting for Idle Trace Status\n");
+		return -ETIME;
+	}
+
+	/*
+	 * As recommended by section 4.3.7 ("Synchronization when using the
+	 * memory-mapped interface") of ARM IHI 0064D
+	 */
+	dsb(sy);
+	isb();
+
+	return 0;
+}
+
+static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
+{
+	u32 control;
+	struct coresight_device *csdev = drvdata->csdev;
+	struct device *etm_dev = &csdev->dev;
+	struct csdev_access *csa = &csdev->access;
+
+	control = etm4x_relaxed_read32(csa, TRCPRGCTLR);
+
+	/* EN, bit[0] Trace unit enable bit */
+	control &= ~0x1;
+
+	/*
+	 * If the CPU supports v8.4 Trace filter Control,
+	 * set the ETM to trace prohibited region.
+	 */
+	etm4x_prohibit_trace(drvdata);
+	/*
+	 * Make sure everything completes before disabling, as recommended
+	 * by section 7.3.77 ("TRCVICTLR, ViewInst Main Control Register,
+	 * SSTATUS") of ARM IHI 0064D
+	 */
+	dsb(sy);
+	isb();
+	/* Trace synchronization barrier, is a nop if not supported */
+	tsb_csync();
+	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
+
+	/* wait for TRCSTATR.PMSTABLE to go to '1' */
+	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
+		dev_err(etm_dev,
+			"timeout while waiting for PM stable Trace Status\n");
+}
+
 static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 {
 	int i, rc;
@@ -536,33 +608,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
 	}
 
-	/*
-	 * ETE mandates that the TRCRSR is written to before
-	 * enabling it.
-	 */
-	if (etm4x_is_ete(drvdata))
-		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
-
-	etm4x_allow_trace(drvdata);
-	/* Enable the trace unit */
-	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
-
-	/* Synchronize the register updates for sysreg access */
-	if (!csa->io_mem)
-		isb();
-
-	/* wait for TRCSTATR.IDLE to go back down to '0' */
-	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_IDLE_BIT, 0))
-		dev_err(etm_dev,
-			"timeout while waiting for Idle Trace Status\n");
-
-	/*
-	 * As recommended by section 4.3.7 ("Synchronization when using the
-	 * memory-mapped interface") of ARM IHI 0064D
-	 */
-	dsb(sy);
-	isb();
-
+	rc = etm4_enable_trace_unit(drvdata);
 done:
 	etm4_cs_lock(drvdata, csa);
 
@@ -906,7 +952,6 @@ static void etm4_disable_hw(void *info)
 	struct etmv4_drvdata *drvdata = info;
 	struct etmv4_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
-	struct device *etm_dev = &csdev->dev;
 	struct csdev_access *csa = &csdev->access;
 	int i;
 
@@ -920,31 +965,8 @@ static void etm4_disable_hw(void *info)
 		etm4x_relaxed_write32(csa, control, TRCPDCR);
 	}
 
-	control = etm4x_relaxed_read32(csa, TRCPRGCTLR);
+	etm4_disable_trace_unit(drvdata);
 
-	/* EN, bit[0] Trace unit enable bit */
-	control &= ~0x1;
-
-	/*
-	 * If the CPU supports v8.4 Trace filter Control,
-	 * set the ETM to trace prohibited region.
-	 */
-	etm4x_prohibit_trace(drvdata);
-	/*
-	 * Make sure everything completes before disabling, as recommended
-	 * by section 7.3.77 ("TRCVICTLR, ViewInst Main Control Register,
-	 * SSTATUS") of ARM IHI 0064D
-	 */
-	dsb(sy);
-	isb();
-	/* Trace synchronization barrier, is a nop if not supported */
-	tsb_csync();
-	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
-
-	/* wait for TRCSTATR.PMSTABLE to go to '1' */
-	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
-		dev_err(etm_dev,
-			"timeout while waiting for PM stable Trace Status\n");
 	/* read the status of the single shot comparators */
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		config->ss_status[i] =
-- 
2.34.1


