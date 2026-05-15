Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF32ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om32yXhs+QvBym8qN0KqHr18ySF4002j+nxRXTzSuLo=; b=XpAItpifNUzgg/HRbKLR3Pa4eT
	viNOv2B045uBpv4a1uCojHtB8AHU8967R92S5VAu2OnJZsa2+UnwtdF2Z0MKTr8pnCxRz8pbTV0U8
	5dZV1U1DHmhLG9FOW/OA4tMct3ii1IqQ3zm51F7WLAtmQTQMqNkQOuNMtcRDI30nPBbzQthEtgE8Z
	K1b5m30ue6Cp17iBb9QhpeCVDHuadu3RAP/KelCWkWrXWVU5jLKrnrmums2R5k8Ajuy03BJweVN2w
	WmxI5KHwKjWilhRVbEKBLQu1qB3683/oXqBFMKWBNrC0+WKBJ1Q9XnJw9zSygH6w2AbbKHFH46AGH
	kehNOurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxeC-000000098KT-2Zlp;
	Fri, 15 May 2026 18:52:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxe3-0000000988b-37Fk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:52:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5B5727D3;
	Fri, 15 May 2026 11:52:16 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AF4B3F836;
	Fri, 15 May 2026 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871141; bh=qmXnyAfd8XzEF5licnSwSdyXddUMt9j3gcpVUu/ZpmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MqIX4GnoOzethC4RBAaQkgcYHJqX85wYCpKahDTJSFOo0TWxZIQZXnvNbN23a07Lo
	 gO2j4TSHuOlY2Puuem0loA18vkEFwBjA92y2N1RnLtnEPs32qhoS0JRGDzbAmqmm0E
	 Fmwb0rULEnS+NZUMmyM60fLY5/ngXPac2bD3sYQI=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:36 +0100
Subject: [PATCH v13 13/28] coresight: etm4x: Remove redundant checks in PM
 save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-13-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=3181;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qmXnyAfd8XzEF5licnSwSdyXddUMt9j3gcpVUu/ZpmA=;
 b=X0kTCeeN/WhecxdlMK+xqgetP4zyohirmcyPM4Wy7poeArkDrml8LQV/60lDXqHtNjwUf3B9x
 XHjzq2UhMv1C9ygM0H2u3p05OLh2lzAR4QNHZcNf/d38TIsb3jF0HcH
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115223_884166_4317A06E 
X-CRM114-Status: GOOD (  14.00  )
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
index 5cd70f0f3710a5ec6406a89c034d30230f782b13..fef1270439e9d770fc0459e9ab8cab7cb40827ee 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1853,17 +1853,14 @@ static inline bool etm4_pm_save_needed(struct etmv4_drvdata *drvdata)
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
 
@@ -1995,32 +1992,13 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
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
 
@@ -2113,17 +2091,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
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


