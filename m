Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CF5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8G7v3kCj3ZfKZLuYQ6CnoGyLi7YxlqqbXOp6kXO5fc=; b=D+uSGPzKYCCr2NQIELBPJr6bm8
	NAauRQJ43B+SfJCZVKg4AFUAMjdaMWh80V6ph+hMa2GFiSzrqj0bNOtsBCblrBi9T4LH8+fYZVcFm
	AH0UPs7c1i8hSNE7rXSFWEuSnb5/aSPp9yCYEZdKYdG2umkxCt9jt5h21E0QtXLCCMDgeGAo/Lcqb
	7n4ARtiC5UFyoJgd0U1VaK5LTWMVYLvsqti6ZhQSoEDGv/SgKTTumFjTdfDkmjRWOYJubjFHMxt5I
	t0jqtfcWnjRD2OXmVWB39cpx3OcLrSY3mGCxrSoiG0VLOqOyVRfmGebbELchTRP5VOeiJ5lRQq8ty
	zFbr5cdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBo-00000002bGv-0dWI;
	Wed, 01 Jul 2026 16:53:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBl-00000002bCb-3j4w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5350160138;
	Wed,  1 Jul 2026 16:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CB91F00A3E;
	Wed,  1 Jul 2026 16:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924809;
	bh=u8G7v3kCj3ZfKZLuYQ6CnoGyLi7YxlqqbXOp6kXO5fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FBCrALLNVfpnBzx6Y2Yr8y95Cc7TsDcxp2Er5hfxqAJwo8k2Fv/Gi+rflxlo310nI
	 X9NXSpbQTsOJt6+IIoBVk13YyHmNZcb22sp5ZtWphA3jB01nnEoR4qfiGvOO+hwV8y
	 Q4feYVutsiMPsmUNKyc/aAEFCP25Ywl4rYzhLM65IOgu4ag4HjcF/RINUO48+ndzTK
	 a4I9tqj/kfqz5rjtgJqtqBPR6v7QNMy7lGO27lCmtAtXR49VYSI5mVWH3qZcgjIED/
	 J18lEct8U56d3I7+E8btTfn47szZ09q/Qh4duts42lSNWfSxKsdwAssWMwZEMEb/C3
	 C4w0jtW8Lww1w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:34 +0100
Subject: [PATCH v2 13/14] firmware: arm_scmi: Stop channels before
 notification teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-13-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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

scmi_notification_exit() clears and releases the notification instance,
but transport callbacks can still deliver incoming notifications until
the TX/RX channels are freed.

During remove, an RX interrupt in that window can enter scmi_notify()
while the notification instance is being torn down and then dereference
freed notification state. The same ordering exists on the probe error
path after notification initialization.

Unregister the requested device notifier first, then stop transport
callbacks by cleaning up the TX/RX channels before releasing the
notification core. This keeps the notification data alive until no
transport callback can queue or process a new event.

Fixes: 1e7cbfaa66d3 ("firmware: arm_scmi: Free mailbox channels if probe fails")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f515b192c1bd..ddd026b05300 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3328,7 +3328,7 @@ static int scmi_probe(struct platform_device *pdev)
 			dev_err(dev, "%s", err_str);
 			return 0;
 		}
-		goto notification_exit;
+		goto raw_mode_cleanup;
 	}
 
 	mutex_lock(&scmi_list_mutex);
@@ -3372,10 +3372,9 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
-notification_exit:
+raw_mode_cleanup:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
-	scmi_notification_exit(&info->handle);
 clear_dev_req_notifier:
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
@@ -3383,6 +3382,7 @@ static int scmi_probe(struct platform_device *pdev)
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
 	scmi_cleanup_txrx_channels(info);
+	scmi_notification_exit(&info->handle);
 	ida_free(&scmi_id, info->id);
 
 out_err:
@@ -3405,11 +3405,13 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
-	scmi_notification_exit(&info->handle);
-
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
 
+	/* Stop transport callbacks before tearing down notifications. */
+	scmi_cleanup_txrx_channels(info);
+	scmi_notification_exit(&info->handle);
+
 	mutex_lock(&info->protocols_mtx);
 	idr_destroy(&info->protocols);
 	mutex_unlock(&info->protocols_mtx);
@@ -3420,9 +3422,6 @@ static void scmi_remove(struct platform_device *pdev)
 
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 

-- 
2.43.0


