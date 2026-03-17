Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC2EFD8763
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=impRlLBUtBcLNAt9CbbQt8ACldOG8ImyVd97UOP/YKo=; b=gFWpDhM/IYD0J2M6pIkUF9CtqK
	NuJHVgyIoujVDfRoJrAVOa6pkr0vVdQKgzAmhBk4yCLE2av1/GVIrzeut2K5LhXf1ZOguLTQLpcdP
	XvNYv58oBVy+PSj/aQQRXPvtcUpCOBp8XcW9FN7cl1pJ/ODeDh3H/nV8/LzdV+gD7lPV7+SxUBT/e
	tsn8Fm3Fvs2QuIXUrvMQIKnolzLcNug23PiQSKWd3HeVp4k6MosqcsmSrpXnOZ9MDEHh0EbTb8hvQ
	kkLOQLMpOTFsZtP3v5Tu+mdVZdq4xTEHx4UZvAZsYRPvR8GjT/pgOYHpmLATiD/ZXjN/3BojSMXgj
	zYX1bwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UZs-00000006S9t-1rBK;
	Tue, 17 Mar 2026 13:35:20 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UZp-00000006S8I-47Rh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:35:19 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9299A20B710C;
	Tue, 17 Mar 2026 06:35:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9299A20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773754517;
	bh=impRlLBUtBcLNAt9CbbQt8ACldOG8ImyVd97UOP/YKo=;
	h=From:To:Subject:Date:From;
	b=MglOiBWtQlsYmpzuq2l1qHp5jgiFwcGdL4S8Dymc2zVGG2DkOeRDDAlShLnMfQ/an
	 gpABvdStK+CYqggBxLO2gFTpa0ZQ5Ce//fYeovrtZgTJmmYORlhp3gQ7rosiKWC8sv
	 +ahPL/RJ1vFgt7tnVnL4ZCbTYrH5pWQXLQ/E4H+0=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	michal.simek@amd.com,
	jay.buddhabhatti@amd.com,
	marco.crivellari@suse.com,
	tejas.patel@xilinx.com,
	rajan.vaja@xilinx.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: xilinx: Fix race condition in event registration
Date: Tue, 17 Mar 2026 06:35:17 -0700
Message-ID: <20260317133517.1324319-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_063518_045143_2C98CEC4 
X-CRM114-Status: GOOD (  13.25  )
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

The zynqmp_power driver registers handlers for suspend and subsystem
restart events using register_event(). However, the work structures
(zynqmp_pm_init_suspend_work and zynqmp_pm_init_restart_work) used by
these handlers were allocated and initialized after the registration
call.

This created a race window where, if the firmware triggered an event
immediately after registration but before allocation, the callback
(suspend_event_callback or subsystem_restart_event_callback) would
dereference a NULL pointer in work_pending(), leading to a crash.

Fix this by allocating and initializing the work structures before
registering the events.

Fixes: fcf544ac6439 ("soc: xilinx: Add cb event for subsystem restart")

Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/soc/xilinx/zynqmp_power.c | 34 +++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 9085db1b480a..aa35b63b45a3 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -303,18 +303,18 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 	 * is not available to use) or -ENODEV(Xilinx Event Manager not compiled),
 	 * then use ipi-mailbox or interrupt method.
 	 */
+	zynqmp_pm_init_suspend_work = devm_kzalloc(&pdev->dev,
+						   sizeof(struct zynqmp_pm_work_struct),
+						   GFP_KERNEL);
+	if (!zynqmp_pm_init_suspend_work)
+		return -ENOMEM;
+
+	INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
+		  zynqmp_pm_init_suspend_work_fn);
+
 	ret = register_event(&pdev->dev, PM_INIT_SUSPEND_CB, 0, 0, false,
 			     suspend_event_callback);
 	if (!ret) {
-		zynqmp_pm_init_suspend_work = devm_kzalloc(&pdev->dev,
-							   sizeof(struct zynqmp_pm_work_struct),
-							   GFP_KERNEL);
-		if (!zynqmp_pm_init_suspend_work)
-			return -ENOMEM;
-
-		INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
-			  zynqmp_pm_init_suspend_work_fn);
-
 		ret = zynqmp_pm_get_family_info(&pm_family_code);
 		if (ret < 0)
 			return ret;
@@ -326,14 +326,6 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 		else
 			return -ENODEV;
 
-		ret = register_event(&pdev->dev, PM_NOTIFY_CB, node_id, EVENT_SUBSYSTEM_RESTART,
-				     false, subsystem_restart_event_callback);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n",
-				ret);
-			return ret;
-		}
-
 		zynqmp_pm_init_restart_work = devm_kzalloc(&pdev->dev,
 							   sizeof(struct zynqmp_pm_work_struct),
 							   GFP_KERNEL);
@@ -342,6 +334,14 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 
 		INIT_WORK(&zynqmp_pm_init_restart_work->callback_work,
 			  zynqmp_pm_subsystem_restart_work_fn);
+
+		ret = register_event(&pdev->dev, PM_NOTIFY_CB, node_id, EVENT_SUBSYSTEM_RESTART,
+				     false, subsystem_restart_event_callback);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n",
+				ret);
+			return ret;
+		}
 	} else if (ret != -EACCES && ret != -ENODEV) {
 		dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n", ret);
 		return ret;
-- 
2.49.0


