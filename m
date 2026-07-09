Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BF3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j63KEgZfmI5uVi9AQ1/7Za7dPCkD9AQZOarKSl1v0vE=; b=vTt03AxAeya7J/oRPtYhSx9DL6
	q4huU5QI+ZvzPFsC1qD6uKHif2+xw/Kel5E6s3uGA7L2og3R77SlxXaEvuHogszxUciRmX6AJ27jU
	QV27M3UfelMy8jdOB2Ei8I6tL1ybJs6vTi13VRdM9a20DTJ0mBLOWi0jEjbJWEcJNXBVACruZAsD/
	3lalM5XSUxW/Qwe8HQ453vsnas3Wi5thpZd/VmtIFhshmmZaGhERIYbsoD7oFC6RB+oWhwtZ8yPEs
	mRu2hz+z0zZ0ZatftCv5xNrqeL3u39xewnS5k4hjm8MPrCX17Hx+++DYe/N3pL/+EB7I4X/4YzZcy
	faChOTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX3-00000001ez4-0Fom;
	Thu, 09 Jul 2026 08:54:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVJ-00000001aYa-0E4u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD31240F87;
	Thu,  9 Jul 2026 08:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1B71F00A3A;
	Thu,  9 Jul 2026 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587188;
	bh=j63KEgZfmI5uVi9AQ1/7Za7dPCkD9AQZOarKSl1v0vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fnL3Yi/V+/eiWkzL6UguMGw4d7szBIeMxk7TUI3VpssM4M6QBfR43xdPvFVkGHjyw
	 Jq9N6x+cqN53jmMwYP/XPgUIqye3NvPhkx+cVAIc4qkDoKz+HDqjMksVs95ngwPPAO
	 HBInmNrjgC9ciVLAzNPy93KzLK74w4t19Oab/HtkxdBet/Ts8GcurgyjHOujMuOsiH
	 NxMUiKrrgl7+YTagUGKLL5rZly9P3cEjhABzKVIwkApKu7j0yKwO75axxQUuPCCW9b
	 UH1iPQZPrSYrF7qT9NSN8w+rQDBPvSMmD5f7vl2gkvxUFTOlEGVpc305cBVVsZ73Kf
	 QwU3TOcz1lNow==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:34 +0100
Subject: [PATCH v5 10/16] firmware: arm_scmi: Drop handle on protocol bind
 failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-10-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

The SCMI bus notifier acquires an SCMI handle when the driver core emits
BUS_NOTIFY_BIND_DRIVER, before invoking the protocol driver probe
callback. The protocol probe path only checks whether sdev->handle is
set.

If device_link_add() fails after the handle has been acquired, the
protocol device can still bind with a valid handle but without the
dependency link to the SCMI parent. A concurrent parent unbind can then
miss the child and tear down the SCMI instance while the child still
holds a handle into it.

If the protocol driver probe later fails, for example with
-EPROBE_DEFER, the driver core emits BUS_NOTIFY_DRIVER_NOT_BOUND rather
than BUS_NOTIFY_UNBOUND_DRIVER. The SCMI notifier only released the
handle on BUS_NOTIFY_UNBOUND_DRIVER, so each failed protocol-device bind
leaked the SCMI instance users refcount and left sdev->handle set after
the failed probe.

Make the link helper report failure and drop the acquired handle if the
link cannot be created. Also handle BUS_NOTIFY_DRIVER_NOT_BOUND in the
same cleanup path used for unbind so failed probes balance the earlier
BUS_NOTIFY_BIND_DRIVER acquisition.

Fixes: 971fc0665f13 ("firmware: arm_scmi: Move handle get/set helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index a2871dca24dc..84d1294f269c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2629,21 +2629,31 @@ static int scmi_handle_put(const struct scmi_handle *handle)
 	return 0;
 }
 
-static void scmi_device_link_add(struct device *consumer,
+static bool scmi_device_link_add(struct device *consumer,
 				 struct device *supplier)
 {
 	struct device_link *link;
 
 	link = device_link_add(consumer, supplier, DL_FLAG_AUTOREMOVE_CONSUMER);
 
-	WARN_ON(!link);
+	return !WARN_ON(!link);
+}
+
+static void scmi_clear_handle(struct scmi_device *scmi_dev)
+{
+	if (!scmi_dev->handle)
+		return;
+
+	scmi_handle_put(scmi_dev->handle);
+	scmi_dev->handle = NULL;
 }
 
 static void scmi_set_handle(struct scmi_device *scmi_dev)
 {
 	scmi_dev->handle = scmi_handle_get(&scmi_dev->dev);
-	if (scmi_dev->handle)
-		scmi_device_link_add(&scmi_dev->dev, scmi_dev->handle->dev);
+	if (scmi_dev->handle &&
+	    !scmi_device_link_add(&scmi_dev->dev, scmi_dev->handle->dev))
+		scmi_clear_handle(scmi_dev);
 }
 
 static int __scmi_xfer_info_init(struct scmi_info *sinfo,
@@ -2927,6 +2937,7 @@ static int scmi_bus_notifier(struct notifier_block *nb,
 {
 	struct scmi_info *info = bus_nb_to_scmi_info(nb);
 	struct scmi_device *sdev = to_scmi_dev(data);
+	const char *status;
 
 	/* Skip devices of different SCMI instances */
 	if (sdev->dev.parent != info->dev)
@@ -2936,18 +2947,22 @@ static int scmi_bus_notifier(struct notifier_block *nb,
 	case BUS_NOTIFY_BIND_DRIVER:
 		/* setup handle now as the transport is ready */
 		scmi_set_handle(sdev);
+		status = "about to be BOUND.";
+		break;
+	case BUS_NOTIFY_DRIVER_NOT_BOUND:
+		scmi_clear_handle(sdev);
+		status = "NOT BOUND.";
 		break;
 	case BUS_NOTIFY_UNBOUND_DRIVER:
-		scmi_handle_put(sdev->handle);
-		sdev->handle = NULL;
+		scmi_clear_handle(sdev);
+		status = "UNBOUND.";
 		break;
 	default:
 		return NOTIFY_DONE;
 	}
 
 	dev_dbg(info->dev, "Device %s (%s) is now %s\n", dev_name(&sdev->dev),
-		sdev->name, action == BUS_NOTIFY_BIND_DRIVER ?
-		"about to be BOUND." : "UNBOUND.");
+		sdev->name, status);
 
 	return NOTIFY_OK;
 }

-- 
2.43.0


