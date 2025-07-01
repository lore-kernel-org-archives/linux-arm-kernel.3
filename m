Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD2CC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfninb3PM81tnqVR4k9/eFNyq15A3H03oVgI/Od0ZQE=; b=iFLRx4NebdFlCQ3uH19+bqe3H8
	8ZQDmMizaVwhjKmP+Q0SzCZrOvpEMz0KWtPY6hJFIBA4K/YOyEL972F9jYUFvfVOVEPtTysqvm4Mk
	K2i0UNuZv+5sEmiVs+JwlXUURqkr4ciUidbzo7iORCe+aUE5j/B0pN/FaD6J5auL5e2+Xq1BuwgvW
	jlAnQ6Xhag5qvMzjjh1WcCmkbCXq6TzusKwbtj9l4f7vqJ6DTjjC147Jta3IyBNfq9jrnvvEZ0men
	xRr/mp5pZRC3ghV2Whn9/I2I4v295RZpl5+PjKs2ylWPUrn6nJSiYdDTuabHf072uIdsD1/pZwzqv
	OzpMLe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeS5-00000006Ab8-3NOZ;
	Tue, 01 Jul 2025 17:07:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcNS-00000005mvB-0fM3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74954236D;
	Tue,  1 Jul 2025 07:54:14 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA45B3F66E;
	Tue,  1 Jul 2025 07:54:27 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:42 +0100
Subject: [PATCH v2 17/28] coresight: etm4x: Remove redundant condition
 checks in save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-17-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=2489;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qFXl7UwZDJPYjl6fs+deO8QNuiTAQtNFxmFllav6qYM=;
 b=S77Op1g8F+ZWBYCr/I3kt9V3ckIw+QEoUK9ZVhgcjwfFEGDkBdbOqNM8dF0FuV8v+Az++ivOa
 vpcG+moFIKdAJAp+e2mZKqkasZPIaYqBuBRkFQ/JMsd54vGkokAyYWS
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075430_317976_63D26B82 
X-CRM114-Status: GOOD (  13.81  )
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

Since a dedicated callback is now used to determine whether context save
and restore operations are needed, performing the same check within the
save and restore callbacks is redundant.

The save and restore flows currently use two-level functions: the first
level handles the condition check, while the second level performs the
low level operations. As the checks are no longer necessary, simplify
the logic into single-level functions.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 35 ++--------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 92ded5c87614b2a74736005c4d127e266cb9b0e2..d71ac055c3d0b74053279a86ede7e5592f2b2909 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1851,10 +1851,10 @@ static bool etm4_need_context_save_restore(struct coresight_device *csdev)
 	return false;
 }
 
-static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
 	int ret = 0;
-	struct coresight_device *csdev = drvdata->csdev;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct csdev_access *csa;
 	struct device *etm_dev;
 
@@ -1902,40 +1902,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret = 0;
-
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
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
-{
-	if (WARN_ON(!drvdata->csdev))
-		return;
-
-	etm4_enable_hw(drvdata, false);
-}
-
 static void etm4_cpu_restore(struct coresight_device *csdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
-		return;
-
-	if (coresight_get_mode(drvdata->csdev))
-		__etm4_cpu_restore(drvdata);
+	etm4_enable_hw(drvdata, false);
 }
 
 static const struct coresight_ops_source etm4_source_ops = {

-- 
2.34.1


