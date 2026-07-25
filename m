Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0C8C53219
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iU0hw9wRsQnxoEPhBRnCjle+PfxE4tvw3wIDOOT3QZg=; b=Yt2eydfnQLJXp+YuJDJlngSpWr
	eh1X42tMs6GfwkL4BhQ5LYFhYqp7wLsWcJZiyDV2BVhOqCLGaXI1DrN6Kw9S3df211fe7VtQEv4CN
	IWvLbPYI9caNMEtjDJFufEDYgPaT41gDCwyPK7MwM+Tn+Xk01CAVGaMI5mymwW9AtaNOHau/97g86
	xAP3gIshfjgEROHxmoITbOBMj96lqzAGElMDwgCFMVe//vDXprDNYB8bCPVi9X7LCV/nRX9AgBx9J
	dm19ekqMuDQtBdZMvdrIeSb+fcBwQpVUTzDbpPa9yTO4z1yNA4KcP4ovQvmsI1bErxYQ5QoOfjA6m
	jfxmGerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnah5-00000000IQ4-3DnQ;
	Sat, 25 Jul 2026 11:37:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagp-00000000IGK-1LTk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D5731476;
	Sat, 25 Jul 2026 04:37:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB39E3F86F;
	Sat, 25 Jul 2026 04:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979428; bh=188AIDbMY1v/sDiWYppH+U+SiageqLxgU3HJYaHaZLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TXicx+AO63HUENlK4eVJlP9De5vGIk2GA2+5bVfpveyhRVQnQVymtwu8w3MH5CHdc
	 9kjUi1OlR1G4rsSSztH1f+HDaFH7BB//rcrWvQ4CAFFxQRzs/MfsI+7Fz6bLbXOZV6
	 KiyR+I3yVxh2eqQDyICRFa0B3bEq6/KRCeNWFz5g=
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
Subject: [PATCH v9 05/13] coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
Date: Sat, 25 Jul 2026 12:36:37 +0100
Message-ID: <20260725113645.57519-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043711_642935_903C5AB2 
X-CRM114-Status: GOOD (  15.69  )
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

In the perf enable path, there are missing cases where
cscfg_csdev_disable_active_config() is not called:

  - Branch broadcast is selected but not supported by the hardware
  - etm4_enable_hw() fails

This can lead to a leak of config_desc->active_cnt.
Fix this by properly calling cscfg_csdev_disable_active_config()
in these error paths.

Fixes: 810ac401db1f ("coresight: etm4x: Add complex configuration handlers to etmv4")
Suggested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../coresight/coresight-etm4x-core.c          | 44 +++++++++++--------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 8fac6416f3fa..02b91a67b00b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -785,8 +785,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
 	};
 	struct perf_event_attr *attr = &event->attr;
-	unsigned long cfg_hash;
-	int preset, cc_threshold;
+	int cc_threshold;
 	u8 ts_level;
 
 	/* Clear configuration from previous run */
@@ -872,16 +871,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		/* bit[12], Return stack enable bit */
 		config->cfg |= TRCCONFIGR_RS;
 
-	/*
-	 * Set any selected configuration and preset. A zero configid means no
-	 * configuration active, preset = 0 means no preset selected.
-	 */
-	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
-	if (cfg_hash) {
-		preset = ATTR_CFG_GET_FLD(attr, preset);
-		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
-	}
-
 	/* branch broadcast - enable if selected and supported */
 	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
 		if (!drvdata->trcbb) {
@@ -905,7 +894,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 			    struct coresight_path *path)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret;
+	struct perf_event_attr *attr = &event->attr;
+	unsigned long cfg_hash;
+	int ret, preset;
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return -EINVAL;
@@ -916,7 +907,19 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	/* Configure the tracer based on the session's specifics */
 	ret = etm4_parse_event_config(csdev, event);
 	if (ret)
-		goto out;
+		goto err;
+
+	/*
+	 * Set any selected configuration and preset. A zero configid means no
+	 * configuration active, preset = 0 means no preset selected.
+	 */
+	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
+	if (cfg_hash) {
+		preset = ATTR_CFG_GET_FLD(attr, preset);
+		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
+		if (ret)
+			goto err;
+	}
 
 	drvdata->trcid = path->trace_id;
 
@@ -925,16 +928,19 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
-
-out:
-	/* Failed to start tracer; roll back to DISABLED mode */
 	if (ret) {
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
-		return ret;
+		if (cfg_hash)
+			cscfg_csdev_disable_active_config(csdev);
+		goto err;
 	}
 
 	csdev->path = path;
 	return 0;
+
+err:
+	/* Failed to start tracer; roll back to DISABLED mode */
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
+	return ret;
 }
 
 static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


