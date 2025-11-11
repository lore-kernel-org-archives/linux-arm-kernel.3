Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2DACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hk1dp8NPTmaGkXE1nl/HOFJ0NlZUtMFoYOrkZcVKmoE=; b=gwyaaVG569QwAQJjYRciadopoc
	15YIy54JpagOjHH1tmxMtOq5Fwd8YGRY5Ua7nHxVBHXJye0l5soPtDWqJKHFjz39vXgV0LBzC+L5O
	ydb5HcxaZa7X7kMF37uF10OJMeGUJ1/4niLuf4y9AQ4vZol8/pPAD+XqBn0Vdms3nNUTGuGgoG11N
	NXDfNmU5YpHzWqcZg4rfr7yF5i8ghXR0L7x4BcF4tqISOwhBttq9/s+y0LGcG2YOefnXVUY+1keEx
	uL7qQ1aLM/+zQb3jiP2LJ+Gg8QY8PyEIBLSbOA+A8ZjSRHA/ZrvAFcEt4N5f+imUGusucmBoYeI2U
	lPCZCoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaU-00000007eMx-1dFx;
	Tue, 11 Nov 2025 18:59:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaR-00000007eK7-1b5V
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Nov 2025 18:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hk1dp8NPTmaGkXE1nl/HOFJ0NlZUtMFoYOrkZcVKmoE=; b=ilUfzDMsuxAUzrH9/p/gqRgL5q
	gye1AeNXe6jd5QpV83ibcEcgDcPxES+Vf4dCZah2Dt99ZG2acgt8Ftz3rJwIZl1aQjveaFxdYNpDJ
	Ry7zUcEryczoKEFcvmbaeJHNSPcE05BS/lgwNk0FWgvrFxTS/stf2rA1TMfHWt5aYFZ6+yz/8zt9Y
	cU9ODqik8EneDEyul8ZtJJY39YyYoRJLJ8A2kJJPp+kiJDjUlLOqFCkrEJzlc313lawpHMSGkYucy
	P14hnd9pVVxXFcpu7TfFo8O6d+j82i9scJ3UWB/jh5zKM66dY9K/tmiEDkkgoY3Yz7KooZmC9D7Bg
	Z8h4fjsg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsii-0000000E0oA-3SNM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:03:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 255411515;
	Tue, 11 Nov 2025 10:59:16 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36A583F63F;
	Tue, 11 Nov 2025 10:59:22 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 11 Nov 2025 18:58:42 +0000
Subject: [PATCH v6 08/11] coresight: etm4x: Remove the state_needs_restore
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-arm_coresight_power_management_fix-v6-8-f55553b6c8b3@arm.com>
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
In-Reply-To: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762887546; l=3586;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=JBAwnNTjouwEiWl1NoewFcoUa/X0+OB3vOypd50Ojy8=;
 b=mRaDWbYqzwyr/t7gyGzovJW7TSo+HU0x0wm5rEFSNlN2LvX0XGo62z4aJDC6IEmW9P+tRgiJi
 fTiV7kVUk21B5+2KrXybVNd+6snTLW1dIZCL+xvtucpHXOadt//golj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_180357_303615_EE95799F 
X-CRM114-Status: GOOD (  17.44  )
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


