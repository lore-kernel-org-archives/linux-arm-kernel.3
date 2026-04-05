Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB13E9D805
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwUQ3uSD+V8fxSOMVe0JcfGw/IoNWj6WjniaBxxLHjw=; b=G79JIr8tv3C6y/AZEwTTmY5t8O
	TJlM/9xWN5BS0yUSNVeZRr2M1ZcJOyZ1XZL1Lcyyb9FYRYqcsm1wo3dIi3fogHAB9N8ZtjJFtIn40
	ro0/MM1C8gCROiShgSNvs+w/6g7pDnsJyXuizphIZcfHsK9IdZuHTLLUqlKioxrXqW4iuGHh8GNRw
	4EeYebVbkBKjkYabmjJRd2YcBWC/5kZQCU5BIQvBg1PNlnSftcgyusNEBLBLPbLiAZBOzMAWpz9Bz
	gXDkF0haQnZBRsU7YHFCdcqvMk84YHUjYaI/CX4HrJ/BVH0C4nHP6DklX7taaKSMFYGfC0WGQdAyw
	WFJhgIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0e-00000004HOd-0Zg3;
	Sun, 05 Apr 2026 15:03:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0b-00000004HKy-3TbS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86CA326BE;
	Sun,  5 Apr 2026 08:03:23 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 944FF3F62B;
	Sun,  5 Apr 2026 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401409; bh=O/jD5YzDk4RzifDj0WFmzhJ1u4lQv9s/34sv+lA4/Kg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z2AZAG9QXQcC73C+k5u/rvTSSRWG0qYR5c5DRDI8W9d0EMkpcRfCMjktq68lh5bZ8
	 PE8yJhdVyPpjw+tIPx5fX7mf/DmkOdAqbEVbAu/m5JNeAactN0qdJ/oAAB2dsMjD6k
	 zpyHPL1G3VVG92ymrnkIV2562tfibF3snbsqCroA=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:45 +0100
Subject: [PATCH v10 09/20] coresight: etm4x: Remove redundant checks in PM
 save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-9-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=3117;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=O/jD5YzDk4RzifDj0WFmzhJ1u4lQv9s/34sv+lA4/Kg=;
 b=iEgfbqp5b9LY2Oj213S6zTvVTVVPEAZ85MIWKlLPr29bkYVyQGdXEMZMWBbpev3T1mD3j7/4x
 hDw+waH7/cjCl0mIyEBcsPrc/J74nnjJPRrCWMoLPU0Op1AYQhxm2SC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080329_974176_5A4DFED9 
X-CRM114-Status: GOOD (  13.84  )
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

ETMv4 driver save/restore callbacks still re-check conditions that are
already validated by the core layer before the callbacks are invoked.

Remove the duplicated checks and fold the two-level functions into
direct callback implementations.  The obsolete WARN_ON() checks are
removed as well.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 41 +++-------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 3fe9ebf31fe19738c8cfa3cfe6d3464ab96726ce..5ccbf792fe71bec7d5b74c24288c5313afdb7cd0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1861,17 +1861,14 @@ static inline bool etm4_pm_save_needed(void)
 	return pm_save_enable == PARAM_PM_SAVE_SELF_HOSTED;
 }
 
-static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
 	int i, ret = 0;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_save_state *state;
-	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa;
 	struct device *etm_dev;
 
-	if (WARN_ON(!csdev))
-		return -ENODEV;
-
 	etm_dev = &csdev->dev;
 	csa = &csdev->access;
 
@@ -2003,32 +2000,13 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret = 0;
-
-	if (!etm4_pm_save_needed())
-		return 0;
-
-	/*
-	 * Save and restore the ETM Trace registers only if
-	 * the ETM is active.
-	 */
-	if (coresight_get_mode(drvdata->csdev))
-		ret = __etm4_cpu_save(drvdata);
-	return ret;
-}
-
-static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
 	int i;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_save_state *state = drvdata->save_state;
 	struct csdev_access *csa = &drvdata->csdev->access;
 
-	if (WARN_ON(!drvdata->csdev))
-		return;
-
 	etm4_cs_unlock(drvdata, csa);
 	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
 
@@ -2121,17 +2099,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	if (!etm4_pm_save_needed())
-		return;
-
-	if (coresight_get_mode(drvdata->csdev))
-		__etm4_cpu_restore(drvdata);
-}
-
 static const struct coresight_ops etm4_cs_ops = {
 	.trace_id	= coresight_etm_get_trace_id,
 	.source_ops	= &etm4_source_ops,

-- 
2.34.1


