Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C55BCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24FT42bUhXV8TaL5nnLSwUy6QczS9ARsiX0DQtJvpqE=; b=dQBve0+TNiq3kzCw5XED7Uct8z
	mpwBFsTTMFOX/HI1RnvKmlHD6kfrU4iUIxuxwLz3e4UxVyNHZ3hrOk/EwzEkLzE1v8oMMIPJTrJmc
	YTnYP4BmXAIcz3lk3vglztcnSP2PntWJ8IOr9+7m1svNOloCoLdIjOdc9+2UyxMSUZkYi3LotaCcy
	XUlKPMT88uRhRlOLoJTBRtEt0QK/OezRxpfCu4HobNxE/NQqiTWdOHg4Mv+JbAzx1eO3v4tcSl+JM
	dNVYNP8FxHLbSKpsvaKRX7Kobq/JC0MvfFto2U1spHgppQcPxNC5MTdnYquRNGP9idmVzLenUJ0Zf
	yo8drKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2k-00000007RNZ-2nDZ;
	Fri, 01 May 2026 16:48:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2i-00000007RJj-0qbs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417B24387;
	Fri,  1 May 2026 09:48:37 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EDD83F7B4;
	Fri,  1 May 2026 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654122; bh=Q4dogpiV3z4ZelKQ9XUXt6nGJZ89pb2n1tIGywEfshI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XvQniIYkBrxByqpXe8coEwL3bdT8DQp+kaJbliL4YIavcnxsXiWcV7mQhOmlvh4B5
	 dTDthK5+uf4zCHL7JPAQpzVuHJyWiAHBIN9G5pPsXP4i/bzX7Tm5y1Px4loxEtO4nJ
	 LobBK2yzXiVA77q5h+Q0d/4jZriukdiwc0ehtAGE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:53 +0100
Subject: [PATCH v11 12/27] coresight: etm4x: Remove redundant checks in PM
 save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-12-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=3181;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Q4dogpiV3z4ZelKQ9XUXt6nGJZ89pb2n1tIGywEfshI=;
 b=NREf4/H3MlWYGUG6M8pgnHEGHtKCu0FcwBmdYmTPcXCEiym3Pv212tSQbkHYdXCTtXBKILmQ3
 CLPR+5DCSioDFhQ8FnKvPjd/2uClLCP3OIR1HBqqE6ktiG7Ib3RHBz6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094844_339332_CBAED1F2 
X-CRM114-Status: GOOD (  14.12  )
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
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 41 +++-------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 64bdc1b18b916b83fc063eb541193e0acfa741ee..bf29ecf487a6c57c67a31004a9911fffeba929f8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1849,17 +1849,14 @@ static inline bool etm4_pm_save_needed(struct etmv4_drvdata *drvdata)
 	return !!drvdata->save_state;
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
 
@@ -1991,32 +1988,13 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int ret = 0;
-
-	if (!etm4_pm_save_needed(drvdata))
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
 
@@ -2109,17 +2087,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct coresight_device *csdev)
-{
-	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	if (!etm4_pm_save_needed(drvdata))
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


