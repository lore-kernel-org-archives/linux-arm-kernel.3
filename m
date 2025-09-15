Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA9ACAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYN6hvmCT/lWtc9bkdnhiTjHrhHh+P67zhFcvkMVjdU=; b=MI/gVfg+YDLWDN+X7vpvxO3Aas
	EL0H4qhvRl00lm8fNcqYLH8Xujsv5yruPlwl2rVcbvIxgYucSKmsXnxo6sMsS4u34EuxysxrZAUJl
	iDf2uypzYynVC6V9zf3tQsoHcMVI7EiCy3cjnl/PAPBmc7VjQl5I4HKIQEJPN0IgvrsQBC+mMwBZw
	yjscLSnvAPvSOyMUNQ5fFHnVFtQxE4dLQxtbRPjW8umscm+4QqZU3niXeOAalNvg4oLlDWgNjFzqH
	DI+GOCmdsCTzuUZhvi8kYGqqoUNERI5S9Vm69+cwoJNNFc4CdMrWq5VCwjcYM/lQWN5bxhLQtCoUR
	npz3mWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xl-00000003gRs-2FhN;
	Mon, 15 Sep 2025 10:34:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XH-00000003fmh-00Rj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 447E91BF7;
	Mon, 15 Sep 2025 03:34:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA9963F66E;
	Mon, 15 Sep 2025 03:34:12 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:40 +0100
Subject: [PATCH v3 17/31] coresight: etm4x: Remove redundant condition
 checks in save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-17-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=2489;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=XuGzLfzYyasikbaMLaRyeuNe5KYdaDCdIJ6wYOP5e7Y=;
 b=/k6iTZ+ncnk2d4ShroIWoEnTGpgBBHtfqZR7N7l0WxKcaQDC2FGuzoYXz6qn/oGbMmxCoYopl
 Vk0ov08wwAFB2EOJ1RHf20sxteDSHoKt6FRMbDdNisHdT6fa/zMwb8c
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033415_166018_23375540 
X-CRM114-Status: GOOD (  13.55  )
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
index 66aefdb002f075446572df9c4eed9093da19a066..b63433e80d305588c18b084408496690480a7af0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1854,10 +1854,10 @@ static bool etm4_need_context_save_restore(struct coresight_device *csdev)
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
 
@@ -1905,40 +1905,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
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


