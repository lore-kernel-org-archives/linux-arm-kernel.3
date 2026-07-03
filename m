Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D710C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5DWrWPIxkt1f50GIPXLPv4ckLJWFETJKFnIXi7eobc=; b=TmfMRqoKHqDStIR7kiI8IlzhXw
	ipl3s4hrS+zwnZapmpxsPrM/bHfm3XxtHA1blkm+Mb9XuaQ8SCXKSNU+P86TUnLskc+mSDTaJe0jv
	7Y7pkxVQ8hooi1vRSoyvR/W6d9Z9hzPvGOIXULJffKQxYruwB6+hyERvKPraJFowFR34rr83mjC9T
	dRxEAEMhPkjOSlKr9ea1rbVmMdiK8K1zyMiUMGKG9w/Bq1sMowbRO/sAuZYEmTnGhcDPZvCD2xyIa
	EY6uoAJXyEanyT1aEIltUfdmg1akmoiklKDPgfAU3329dq+0AewDiRww3vqJiMvu9h7a1l9F4qg0S
	ggHe2kdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSM-00000007qia-1LS1;
	Fri, 03 Jul 2026 20:25:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSF-00000007qV2-2GWw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C82142AB1;
	Fri,  3 Jul 2026 20:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8DA1F00AC4;
	Fri,  3 Jul 2026 20:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110343;
	bh=u5DWrWPIxkt1f50GIPXLPv4ckLJWFETJKFnIXi7eobc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AmREA9lrL8acgoKfB3Z4dziNTBYstfyG9klAEvUIbK3pwQXYcnujVfc6um8qhx6ED
	 B2ndvLT3mbbK5Qt+91znzNSQmxmqCecBoTLwHRnxqsr2b3XU4Iqehuj7Z7rQTfDpWu
	 RO9vvDqfR8HWRCYZDXfkkkagKtMYurElCUWgb5yC8byRwQePDaZ3Bo4rqQG1b0nTjZ
	 KU0BhTEldois77kVvMZjyss/px+IKqTrHxgLSorfp3Fx0G86+MaNN8wUbaoFqdYybe
	 p1n37Aaz4bY7J4aQJwSEJWROe6EkOHRISuwzUCGlDopHRE7rntKccXLu2RJ6mSvtK6
	 mz2gzll7LtXlw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:52 +0100
Subject: [PATCH v3 16/17] firmware: arm_scmi: Drop handle on protocol bind
 failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-16-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
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
index 12ebf32aa4da..894c3427bc0b 100644
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
@@ -2926,6 +2936,7 @@ static int scmi_bus_notifier(struct notifier_block *nb,
 {
 	struct scmi_info *info = bus_nb_to_scmi_info(nb);
 	struct scmi_device *sdev = to_scmi_dev(data);
+	const char *status;
 
 	/* Skip devices of different SCMI instances */
 	if (sdev->dev.parent != info->dev)
@@ -2935,18 +2946,22 @@ static int scmi_bus_notifier(struct notifier_block *nb,
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


