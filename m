Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB53E109C025
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6U/7Qyvb0Ve4L/zziu7fEg3hmE8jh7mD/QH7ceuFjc=; b=Ze+GNPPEnae04Usn4XFSb/xljZ
	1MVy2Z0eIb36/rqlbfEG5m074BTYu4iDlY5uYXjD7lVBR0uVxxfI6jKwNb+veGiQps/DR4bm2Vi9D
	crLaH24HBIxqMaHnFBnLUrpqvkvDI9JRKSy6tWXGOn7jVr7VOnpo0ho5OO5jqvG7DlUrAjBWD02XQ
	LkreXeLMJFfV2kf2YPvybR6lsnBoSrFqrR1sBPSFq2Npi5wktE3alzSMNd1ictkm0H400SFutlyey
	Dfettce5wjfTadbcY0vE067hMp8LXA7unjVZOkpcIYRpnPY51HhHKutjbLxRsIm/LffQRhRjzykR6
	HNQk9/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCp-00000003Zv9-0PvM;
	Wed, 25 Mar 2026 14:27:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCX-00000003Zi9-0m8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9A6A1F02;
	Wed, 25 Mar 2026 07:27:10 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9AB53F836;
	Wed, 25 Mar 2026 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448836; bh=Nk6vqzpDT28X42dRH/DMBvFc5oNhQb5F6CRl7J08cp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P5wEwh/Os2JkiE6/yC0WRQwecQUYYCDFOp7sDkGqnj7ErIiwGBb+qv9CCMmxxtMZO
	 i77rD7Dcvi7BYJY/ClaPgpGqdF6nCZoQX6c8KNjNz4uJgWJYdXCv9psVRxOl4srJn/
	 ijx3PO+I6Co6icpjkoeOKBXaIAht6wIm2goNX+p0=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:45 +0000
Subject: [PATCH v8 08/23] coresight: etm4x: Remove redundant condition
 checks in save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-8-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448816; l=2965;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Nk6vqzpDT28X42dRH/DMBvFc5oNhQb5F6CRl7J08cp0=;
 b=YhHf2o4uUzywumN/rcoN0gL0crKDtnoa9GHSsz3pkxiF5jfA54madcFu3gO3Xld+fVIB/H+0R
 n/ic+KREkjZAowk5IGuamY7c3GnjCBxdJNEy28v1acwWvgtlyKc9MEt
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072717_360080_CCCC86F0 
X-CRM114-Status: GOOD (  14.66  )
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

Since the core layer determines whether context save and restore
operations are needed, performing the same check within the save and
restore callbacks is redundant.

The save and restore flows currently use two-level functions: the first
level handles the condition check, while the second level performs the
low level operations. As the checks are no longer necessary, simplify
the logic into single-level functions.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 35 +++-------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 6ed0ee95c78c24bcb6c636d9ebf2ae463c748b22..4a9b226781a5c2ab6efcadf08614de58bcd4043a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1858,11 +1858,11 @@ static int etm4_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
 	int i, ret = 0;
 	struct etmv4_save_state *state;
-	struct coresight_device *csdev = drvdata->csdev;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct csdev_access *csa;
 	struct device *etm_dev;
 
@@ -2000,26 +2000,10 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
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
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
 	int i;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etmv4_save_state *state = drvdata->save_state;
 	struct csdev_access *csa = &drvdata->csdev->access;
 
@@ -2118,17 +2102,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
-		return;
-
-	if (coresight_get_mode(drvdata->csdev))
-		__etm4_cpu_restore(drvdata);
-}
-
 /* Setup PM. Deals with error conditions and counts */
 static int __init etm4_pm_setup(void)
 {

-- 
2.34.1


