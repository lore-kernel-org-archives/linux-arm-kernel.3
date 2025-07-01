Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4261AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 17:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT2s1xWM9FNtyZrhS4N6Cc3G5QkQQIpjGv+1ygP8SBc=; b=KCjJH/R75jSoMP8MS22rx1XHK9
	50xCsRkuIAwU++qW5FLPKMzuCDutQv8Db0uy3Ug9PiSVr554J9/3KUQqfK7Kk/IQ8RxjY9Oegz2h0
	X7Wocs4ievcIrW9TnHyahawjDUHprUdAiVpK6lhTtbzs+FFEdFekWKsBjtUAkZ5Ax1r+KSzvwfKqJ
	2nGT0C9J82x/ImU86hCM7+II8mjlNL8lvB8z9JiVbmbzROH6sWe0YmqL/AKXJlpWYHaX2mFlbuZEy
	u6HC5D1RO/AZQKfgOk0pvFne5ZUVTJS/5YxwEoirsUTYZj9mgg/ueAdjyfe2sc/kwK/FymPvBLw1V
	HlVBWmbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeZ2-00000006CAj-16FZ;
	Tue, 01 Jul 2025 17:14:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcNZ-00000005mz8-1H62
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E4E2379;
	Tue,  1 Jul 2025 07:54:21 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C79453F66E;
	Tue,  1 Jul 2025 07:54:34 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:45 +0100
Subject: [PATCH v2 20/28] coresight: cti: Properly handle modes in CPU PM
 notifiers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-20-23ebb864fcc1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=2826;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=bnoqGLGLvkQZM71kWFaBE9XSAfVwfMZlT8ssFD7sZow=;
 b=80Tlb6gH6ObmrEHBgVOfdT7YeEX140AFqPYxSUE3gKFwvgSlzUEa/uQP08pPsuEaTGf5bqG+A
 tfqjQQn6r88AiBRNfj94GxraPPJRdmpTR0cUO1gBxagTwDmMlHltaUg
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075437_489610_E571A3DB 
X-CRM114-Status: GOOD (  15.60  )
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

This commit distinguishes CPU PM flows based on the mode.

The CTI driver retains its existing behavior for the CS_MODE_DEBUG mode.

For modes other than DEBUG, a future change will be made to manage CTI
devices by iterating through the CoreSight path in the core layer. To
avoid conflicts, the CTI driver no longer controls CTI hardware in CPU
PM notifiers for non DEBUG modes.

However, the CTI driver continues to update the hw_powered flag for all
modes to reflect the device's power state.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index ba4635dfc2e30b4e9ae4972f91bdc6647975b719..c91d339d7ccbf71db71cb7156f9a6f2961ae2198 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -141,6 +141,9 @@ static void cti_cpuhp_enable_hw(struct cti_drvdata *drvdata)
 	raw_spin_lock(&drvdata->spinlock);
 	config->hw_powered = true;
 
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DEBUG)
+		goto cti_hp_not_enabled;
+
 	/* no need to do anything if no enable request */
 	if (!drvdata->config.enable_req_count)
 		goto cti_hp_not_enabled;
@@ -697,21 +700,27 @@ static int cti_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 	case CPU_PM_ENTER:
 		/* CTI regs all static - we have a copy & nothing to save */
 		drvdata->config.hw_powered = false;
-		if (drvdata->config.hw_enabled)
+		if ((coresight_get_mode(drvdata->csdev) == CS_MODE_DEBUG) &&
+		    drvdata->config.hw_enabled)
 			coresight_disclaim_device(csdev);
 		break;
 
 	case CPU_PM_ENTER_FAILED:
 		drvdata->config.hw_powered = true;
-		if (drvdata->config.hw_enabled) {
+		if ((coresight_get_mode(drvdata->csdev) == CS_MODE_DEBUG) &&
+		    drvdata->config.hw_enabled) {
 			if (coresight_claim_device(csdev))
 				drvdata->config.hw_enabled = false;
 		}
 		break;
 
 	case CPU_PM_EXIT:
-		/* write hardware registers to re-enable. */
 		drvdata->config.hw_powered = true;
+
+		if (coresight_get_mode(drvdata->csdev) != CS_MODE_DEBUG)
+			break;
+
+		/* write hardware registers to re-enable. */
 		drvdata->config.hw_enabled = false;
 
 		/* check enable reference count to enable HW */
@@ -760,7 +769,8 @@ static int cti_dying_cpu(unsigned int cpu)
 
 	raw_spin_lock(&drvdata->spinlock);
 	drvdata->config.hw_powered = false;
-	if (drvdata->config.hw_enabled)
+	if ((coresight_get_mode(drvdata->csdev) == CS_MODE_DEBUG) &&
+	    drvdata->config.hw_enabled)
 		coresight_disclaim_device(drvdata->csdev);
 	raw_spin_unlock(&drvdata->spinlock);
 	return 0;

-- 
2.34.1


