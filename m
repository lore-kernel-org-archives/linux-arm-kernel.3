Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E6DC44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwVEbwj4d7me//Hg1skJQ018XqqImwex0pEPqXzq6D0=; b=CMrOoP5i8EOi+h0vlzRykJmizk
	58G5oRf4zelvE6mB48peHxmBKhHw0/c15ilJbyvW3aYJCPdRPeAT6ia3WySN7aenecmUC2EUQjXCl
	0ZXbupRzSOVXYriMGO4QNnuOj/xRhxASSGiabRro6E67KjS+L1GtATtMKGeOu3QDqHUp7HSrnpP/d
	TgQrm2iHeXn8HHR9qMuESW+xQocGLBRTnEIxuWmZ9TZDUTvjd3xFrGorzQ56fsNf8HX1QYJyT9tdp
	OYFSyY0H9TbgA1L+OzfGnL0nsfJl5Kgo3Ao+E9xtZ6zE5dI9bGsBCUC2FoUXBU7CiZo7BWyJGtjje
	abU25pWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWy-00000001em6-17gW;
	Thu, 09 Jul 2026 08:54:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVC-00000001aXD-0Hh5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8470C60EEF;
	Thu,  9 Jul 2026 08:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B0E1F00A3D;
	Thu,  9 Jul 2026 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587181;
	bh=UwVEbwj4d7me//Hg1skJQ018XqqImwex0pEPqXzq6D0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=exN32Z6eN3j5Uy6le9C6EpTDxYH6+lAxzkP1wlc2fL+DgwsRsDg0z08lAj03KD3w+
	 kaXFBF1oTohLFb8AowhkZJnMIHP+mWiiE/UUU+o3ELRJTu+fdjksqsiqflglLFmWk7
	 S/+eljlHAKx0tVDf33Am8eHRkzHcbDtwCqYxgDSPilIMc9R3jTAYy77LqB0F1LfClF
	 tmbrGNqaupor/gd2bI3QYdd8lv5bqPozoG2IP4vMx81hfgFS7mEcJ/JONI4PNcxshL
	 BQMhpf49zJqsAuc9AFQVRnKVCUSMx8Sg4PKU5ju54r8DsahsDPWjizWW/NmYv9So+X
	 nPkUzLjPegy7g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:26 +0100
Subject: [PATCH v5 02/16] firmware: arm_scmi: Quiesce notifications before
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-2-bea6a3024f05@kernel.org>
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

scmi_notification_exit() clears and releases the notification instance, but
transport callbacks can still deliver incoming notifications until the
TX/RX channels are freed. During remove, an RX interrupt in that window can
enter scmi_notify() while notification state is being torn down and then
dereference freed memory. The same ordering exists on the probe error path
after notification initialization.

The notification late-init worker has a separate lifetime issue: protocol
event registration queues ni->init_work on the system workqueue, so
destroying ni->notify_wq does not drain that work. If the devres group is
released while init_work is still pending or running, the late-init worker
can dereference the freed notification instance.

Unregister the requested device notifier first, quiesce the notification
core so no late-init work can run while channels are being torn down, then
clean up TX/RX channels before releasing the notification core resources.
The final notification exit path also cancels any pending late-init work
before destroying the notification workqueue and releasing the notification
devres group.

Fixes: 1e7cbfaa66d3 ("firmware: arm_scmi: Free mailbox channels if probe fails")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 13 +++++++------
 drivers/firmware/arm_scmi/notify.c | 32 +++++++++++++++++++++++++++++++-
 drivers/firmware/arm_scmi/notify.h |  1 +
 3 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1d1f5d25d773..1354de59ea84 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3325,7 +3325,7 @@ static int scmi_probe(struct platform_device *pdev)
 			dev_err(dev, "%s", err_str);
 			return 0;
 		}
-		goto notification_exit;
+		goto raw_mode_cleanup;
 	}
 
 	mutex_lock(&scmi_list_mutex);
@@ -3367,17 +3367,18 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
-notification_exit:
+raw_mode_cleanup:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
-	scmi_notification_exit(&info->handle);
 clear_dev_req_notifier:
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
 clear_bus_notifier:
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
+	scmi_notification_quiesce(&info->handle);
 	scmi_cleanup_txrx_channels(info);
+	scmi_notification_exit(&info->handle);
 clear_ida:
 	ida_free(&scmi_id, info->id);
 
@@ -3401,6 +3402,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	/* Stop transport callbacks before tearing down notifications. */
+	scmi_notification_quiesce(&info->handle);
+	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3415,9 +3419,6 @@ static void scmi_remove(struct platform_device *pdev)
 					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..2491c848d4f3 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -209,6 +209,7 @@ struct scmi_registered_events_desc;
  * @init_work: A work item to perform final initializations of pending handlers
  * @notify_wq: A reference to the allocated Kernel cmwq
  * @pending_mtx: A mutex to protect @pending_events_handlers
+ * @shutting_down: Flag to block late-init work scheduling during teardown
  * @registered_protocols: A statically allocated array containing pointers to
  *			  all the registered protocol-level specific information
  *			  related to events' handling
@@ -225,6 +226,7 @@ struct scmi_notify_instance {
 	struct workqueue_struct	*notify_wq;
 	/* lock to protect pending_events_handlers */
 	struct mutex		pending_mtx;
+	bool			shutting_down;
 	struct scmi_registered_events_desc	**registered_protocols;
 	DECLARE_HASHTABLE(pending_events_handlers, SCMI_PENDING_HASH_SZ);
 };
@@ -845,7 +847,10 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 	 * Finalize any pending events' handler which could have been waiting
 	 * for this protocol's events registration.
 	 */
-	schedule_work(&ni->init_work);
+	mutex_lock(&ni->pending_mtx);
+	if (!ni->shutting_down)
+		schedule_work(&ni->init_work);
+	mutex_unlock(&ni->pending_mtx);
 
 	return 0;
 }
@@ -1706,6 +1711,29 @@ int scmi_notification_init(struct scmi_handle *handle)
 	return -ENOMEM;
 }
 
+/**
+ * scmi_notification_quiesce()  - Stop notification late initialization
+ * @handle: The handle identifying the platform instance to quiesce
+ *
+ * Prevent new late-init work from being queued and wait for any already queued
+ * or running late-init work to complete before transport channels are torn
+ * down.
+ */
+void scmi_notification_quiesce(struct scmi_handle *handle)
+{
+	struct scmi_notify_instance *ni;
+
+	ni = scmi_notification_instance_data_get(handle);
+	if (!ni)
+		return;
+
+	mutex_lock(&ni->pending_mtx);
+	ni->shutting_down = true;
+	mutex_unlock(&ni->pending_mtx);
+
+	cancel_work_sync(&ni->init_work);
+}
+
 /**
  * scmi_notification_exit()  - Shutdown and clean Notification core
  * @handle: The handle identifying the platform instance to shutdown
@@ -1717,6 +1745,8 @@ void scmi_notification_exit(struct scmi_handle *handle)
 	ni = scmi_notification_instance_data_get(handle);
 	if (!ni)
 		return;
+
+	scmi_notification_quiesce(handle);
 	scmi_notification_instance_data_set(handle, NULL);
 
 	/* Destroy while letting pending work complete */
diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/arm_scmi/notify.h
index 76758a736cf4..f18f98c5ab3b 100644
--- a/drivers/firmware/arm_scmi/notify.h
+++ b/drivers/firmware/arm_scmi/notify.h
@@ -82,6 +82,7 @@ struct scmi_protocol_events {
 };
 
 int scmi_notification_init(struct scmi_handle *handle);
+void scmi_notification_quiesce(struct scmi_handle *handle);
 void scmi_notification_exit(struct scmi_handle *handle);
 int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
 				  const struct scmi_protocol_handle *ph,

-- 
2.43.0


