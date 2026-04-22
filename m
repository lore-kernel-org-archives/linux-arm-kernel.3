Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA338F9EDCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6H+dAk0E9QNTJ0Bamz3Qlc0mOLqwi+PFoVDt7YqXPw=; b=er/o65EVPtE6qEjioM4yZVCXIE
	g6iPjfxRKy6yQx3GUnZdeYnQfmjgazAd9tipTvF9bRSFpcZNiM8wePlWAIFMJFQuPS1tOwpvCq7c0
	RY4F9ibx9C7nnV+6FJqnSBsxe2oTpUflo+Y501J09iJW0apF9hXcuDaNMDQ07+REaGNgH/fAkd3A9
	dee+qwa+Hfi/EaCznbYAc3XQYTGV70w7OhR/XNRv43j8BDhNAHsIUD6QlcnN1iZ7Z6MaOgv4N41s9
	Y3WGbWiQCuMdFwviTRdfCQ4TnxVMQUufUAPigLXJnxT1xg1UvrOdkoeaPscR0rnboTflCRxNKbLtA
	ZCylah7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXXJ-0000000AHnt-3Gl4;
	Wed, 22 Apr 2026 13:22:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXXB-0000000AHdA-2njP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:22:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58C032454;
	Wed, 22 Apr 2026 06:22:22 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 171D73FD46;
	Wed, 22 Apr 2026 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776864147; bh=gHPhf/rLsWK1Jg146ax7ng4ZMmOvo16EVraH3FI8/Vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hRsHEoki1fPkGI6HdXWcmSqf2/BAfZK2lNF7vuGwuUyjVOCO84p0lvqVUQZ9IbJwI
	 mD98s7ZDvJzB4KH/Xr7fbBM20JLJKgKVTmf2YoTTOSnZT+x1PR4F9FlA+0byd/X6Es
	 LAooylbiUs4TwSwWO9zfuN2NAMy3LAvldYwRw9T8=
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
Subject: [PATCH v6 09/13] coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
Date: Wed, 22 Apr 2026 14:21:59 +0100
Message-Id: <20260422132203.977549-10-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422132203.977549-1-yeoreum.yun@arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_062229_749069_9B9764F7 
X-CRM114-Status: GOOD (  15.19  )
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
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-core.c  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d09e0a4171..d6fd6125ef60 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -895,6 +895,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			 * Missing BB support could cause silent decode errors
 			 * so fail to open if it's not supported.
 			 */
+			if (cfg_hash)
+				cscfg_csdev_disable_active_config(csdev);
 			ret = -EINVAL;
 			goto out;
 		} else {
@@ -911,6 +913,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 			    struct coresight_path *path)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct perf_event_attr *attr = &event->attr;
 	int ret;
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
@@ -922,7 +925,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	/* Configure the tracer based on the session's specifics */
 	ret = etm4_parse_event_config(csdev, event);
 	if (ret)
-		goto out;
+		goto err;
 
 	drvdata->trcid = path->trace_id;
 
@@ -931,11 +934,17 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
+	if (ret) {
+		if (ATTR_CFG_GET_FLD(attr, configid))
+			cscfg_csdev_disable_active_config(csdev);
+		goto err;
+	}
 
-out:
+	return 0;
+
+err:
 	/* Failed to start tracer; roll back to DISABLED mode */
-	if (ret)
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	return ret;
 }
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


