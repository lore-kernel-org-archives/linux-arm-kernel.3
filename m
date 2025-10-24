Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3779DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYjkHA7/J3j3KkSTbfe0szRGVIzduepVa2FrGcxR/Vk=; b=eFi+7oGmD1/FkKlEvXTmTIlv2s
	FDeDvWugzUiGHM9fJJ8k3JUMdtENdA28LTzuvZr1DbNkkpTf6dWhlQhswhbr6WgIJXeTuDfInqUnA
	HYfBDnZA93XI2cr7HDEYHeRN4g4JHKmJwdDMgkCNTrc2qGQ9bQS7aoeuegXPesxrjmd7J2mZWgpES
	xzXeAeh/8o+7fHNAfATb+ymNiAajtvqNc53/+sT5bezmuS706Qy8H9FJzOS6/AMRky59/UFmpoT4w
	0E09+61+bepY6fgHWc4PTj66+Y7DZU58OYduwXG/Jb9qbXWayXHhKhzpyUMgDBsHGF0EGrRbWCiKN
	CGCDITFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKwS-0000000A1GV-0Z9K;
	Fri, 24 Oct 2025 16:47:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKw4-0000000A0wO-0577
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:46:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAA7F1D34;
	Fri, 24 Oct 2025 09:46:30 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 307EB3F66E;
	Fri, 24 Oct 2025 09:46:37 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 24 Oct 2025 17:45:56 +0100
Subject: [PATCH v4 08/11] coresight: etm4x: Remove the state_needs_restore
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-arm_coresight_power_management_fix-v4-8-690e69ae6977@arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761324381; l=3586;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=OfXyIQXLHV6D1U6BbHBA/zweNecOxWJkkBRh4DL1js0=;
 b=XN6CfekQZJKHekAJAhq5S3SZhoQwaI+Ih+pHSk0E+all3tcUVdbnGcLy8QrPspYPaQrJMihUT
 MILz0WLf7v0AaiA8aoXQWFKEyKXaGpBbeefN2Omne85REaxaYmPDM/K
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_094642_968796_2513824C 
X-CRM114-Status: GOOD (  17.26  )
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
index df3260f2dfa72456c60fba4a8fa655fb6b48b95b..15f70268e5b605a6881504c0c60b001251fbbddf 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1984,8 +1984,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		goto out;
 	}
 
-	drvdata->state_needs_restore = true;
-
 	/*
 	 * Power can be removed from the trace unit now. We do this to
 	 * potentially save power on systems that respect the TRCPDCR_PU
@@ -2003,11 +2001,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
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
@@ -2097,8 +2098,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	if (!drvdata->skip_power_up)
 		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
 
-	drvdata->state_needs_restore = false;
-
 	/*
 	 * As recommended by section 4.3.7 ("Synchronization when using the
 	 * memory-mapped interface") of ARM IHI 0064D
@@ -2124,7 +2123,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
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


