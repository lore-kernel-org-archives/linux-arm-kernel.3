Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F5ECD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hk1dp8NPTmaGkXE1nl/HOFJ0NlZUtMFoYOrkZcVKmoE=; b=2uvV5JvituXP9h4xAY9CWoEF0c
	3lQV3GokfwM3v77ZQo96Skfp2VxzyIITdxXw8jCNIrzJ3Yw6rTuVCaUbCLEF/lVWUSvAAiN4mlQqj
	v1PopqyslyXiAobzHKvzGjnfyYsaCQEG8Gs6tukazsA5qBMRjr1OBD1RHw0/bXpb+FxMzynO3mHAD
	2HlGHN6tccKzlv6NAYdoLz6ZxAg1l/aPOsQGPcAiGPMuSdpU8rHE2XT8pk90tx3bckXpywkXNd+FH
	HpQY7T0HnW+qCFg1NEtYjbH7iwP0FF27MR1iwHMbv5TE7FBM31EcIRW8+1M0obWEbWVavMw4FIOzb
	8IzajRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9VQ-00000008jXw-17SF;
	Wed, 12 Nov 2025 11:59:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9VK-00000008jRr-1A6n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:59:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14EAC1595;
	Wed, 12 Nov 2025 03:59:06 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2121E3F5A1;
	Wed, 12 Nov 2025 03:59:12 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 11:58:44 +0000
Subject: [PATCH v7 08/11] coresight: etm4x: Remove the state_needs_restore
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-arm_coresight_power_management_fix-v7-8-33e0b6f995f7@arm.com>
References: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
In-Reply-To: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762948736; l=3586;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=JBAwnNTjouwEiWl1NoewFcoUa/X0+OB3vOypd50Ojy8=;
 b=nE9DRM3xSNSUGFkw5GiC5TWjZoGCLIlG8lLDovS5OcxYqOX0CYLhGNnNrMx6S2VJY9ty3Fg60
 uuixIMzR+mMCPEv/tVoHHSOY3HrO49ob7M4lPHDqaGbREg4/PHd93te
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_035914_516904_22930F2B 
X-CRM114-Status: GOOD (  17.22  )
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

When the restore flow is invoked, it means no error occurred during the
save phase. Otherwise, if any errors happened while saving the context,
the function would return an error and abort the suspend sequence.

Therefore, the state_needs_restore flag is unnecessary. The save and
restore functions are changed to check two conditions:

1) The global flag pm_save_enable is SELF_HOSTED mode;
2) The device is in active mode (non DISABLED).

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 14 ++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  2 --
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index bdf5ab85b2213dfd601391fdcf50960667fa7cea..560975b70474c3449aa6799fc1a8e05d5ea93495 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1966,8 +1966,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		goto out;
 	}
 
-	drvdata->state_needs_restore = true;
-
 	/*
 	 * Power can be removed from the trace unit now. We do this to
 	 * potentially save power on systems that respect the TRCPDCR_PU
@@ -1985,11 +1983,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int ret = 0;
 
+	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+		return 0;
+
 	/*
 	 * Save and restore the ETM Trace registers only if
 	 * the ETM is active.
 	 */
-	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
+	if (coresight_get_mode(drvdata->csdev))
 		ret = __etm4_cpu_save(drvdata);
 	return ret;
 }
@@ -2079,8 +2080,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	if (!drvdata->skip_power_up)
 		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
 
-	drvdata->state_needs_restore = false;
-
 	/*
 	 * As recommended by section 4.3.7 ("Synchronization when using the
 	 * memory-mapped interface") of ARM IHI 0064D
@@ -2099,7 +2098,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
-	if (drvdata->state_needs_restore)
+	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+		return;
+
+	if (coresight_get_mode(drvdata->csdev))
 		__etm4_cpu_restore(drvdata);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index b8796b4271025f6aba79fe3cd6e4d17d0b56952d..012c52fd19338133129752d35523dc102df24604 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -980,7 +980,6 @@ struct etmv4_save_state {
  *		in EL2. Otherwise, 0.
  * @config:	structure holding configuration parameters.
  * @save_state:	State to be preserved across power loss
- * @state_needs_restore: True when there is context to restore after PM exit
  * @skip_power_up: Indicates if an implementation can skip powering up
  *		   the trace unit.
  * @paused:	Indicates if the trace unit is paused.
@@ -1036,7 +1035,6 @@ struct etmv4_drvdata {
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
-	bool				state_needs_restore;
 	bool				skip_power_up;
 	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);

-- 
2.34.1


