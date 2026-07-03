Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC3DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8G7v3kCj3ZfKZLuYQ6CnoGyLi7YxlqqbXOp6kXO5fc=; b=RTgLHcHPbfcCIXarZGA8LxPbRY
	DCR95lumjHvyrXjFx3cznQvsspJEz0UCehbqlaIfZ6Q6qxZ8D2Y0eTfmutL441MR9voAISYlt+CYH
	qxd3S5MQftUTjrXxBLvH0jH/5tQ+lldW2drhrj0fAcO6lHXr16/6XPKr3OhArpzav2O7F8pcs2mII
	T/vkbeld39niwKp4XMyMyJ1Yw8up8mB0O2V1RLc4/d+wNqNVIsFwgc5pqIysM1oPBYLMywrm4rbFy
	ZAHBU0W6zrS5vi0EsjFB3Qf5hIVlQPk1/QoR7DoubOH4XcG4oJztACfIZBQ8H6QId8tCLxxDQ54+Y
	+u66nSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSF-00000007qWh-3ap3;
	Fri, 03 Jul 2026 20:25:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSD-00000007qS4-15QA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9487600AF;
	Fri,  3 Jul 2026 20:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3A01F00A3A;
	Fri,  3 Jul 2026 20:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110340;
	bh=u8G7v3kCj3ZfKZLuYQ6CnoGyLi7YxlqqbXOp6kXO5fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ccPdtRD4Y1a2pAgu6e9ntU8TQjMjFBgonaaSsnP9+yaz+D4AG0OVGo7EULMylO+lz
	 inGN8jBVcsOJJFj8Gj3Jaf0kmTJZXUUZi40aZmNznUV3U50o+PIxx4vY+2AI+Mi5Cm
	 y5hzH4vlkKxNrsYnvEev7ct2HB9+5ZRJ/FGDnT8XEHMBKPQGvFRV0lf9pjE39XbFXW
	 RascYGm+BhjwwAc5UxEc2MpJ8k9Jkq+XHeuzU/hmTBXbkponpKSaxpJX34ix1bcw0N
	 EtJ/jn2cS0UxG3GF4nPv0cKKCuh+/D0AxV22FFp3DBpCz+JIuybJsCEyzNMd3Svn6w
	 HpwEnesQdkqJA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:49 +0100
Subject: [PATCH v3 13/17] firmware: arm_scmi: Stop channels before
 notification teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-13-5bae9766abfc@kernel.org>
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


