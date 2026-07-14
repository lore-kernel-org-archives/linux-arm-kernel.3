Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094A5C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOQi0GQwy8LOev89x4shyoqxLybJwHsxamnktAUjmeI=; b=uWMFHn6husCJp1YZYprdbzwuPp
	0/Wb/bzxx/IpAE3AqdnSYdJjzYRlXjRcc2Iz0OJ9bTnYh3bihZWXAtdLX2A/xjMpvnxRFECvO3Hue
	V9ImkFmTZ9K3qFMSVT4WkcaklnQggdrVWRVXeuOPKMY+xycvUitwrpt46BtAavyaLSRFz2nA7oVv8
	Vvp/L8ss6RV3SFlzarqyF/rMmGaAogu1toExhapGFTCPz/tqEAtqnZ5quc9d4yLA5NRmaUQJ9xJUi
	qaYvgzEdvtY3fCHPxbMAje9o3f/YhQhNA2SRGRu8wTSFlCynOwjTtaZctuv1AzQrrj31zUy5m473t
	/CAHMi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcim-0000000C2c9-2us8;
	Tue, 14 Jul 2026 12:58:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcif-0000000C2Xo-0rpt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F06E4407E7;
	Tue, 14 Jul 2026 12:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9B11F00A3D;
	Tue, 14 Jul 2026 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033920;
	bh=QOQi0GQwy8LOev89x4shyoqxLybJwHsxamnktAUjmeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Qpv2yZMoV0IwLkDWYBeTujtcCkPjxoO392MiDs1lu7Pk/naBHnxQnDT/ZrjwOh/ig
	 EsonaUbiHchwnW1+LgZdbAhqGSmKVp5DN9oGY/4vBHSnU/7cCAISCtV+d0vbzP+zbx
	 nS0nTcfU8MoW9AR8IPzK7Eqx6fiMHcOoaY3jg8S/2AyLFkIQ3s3SQqp/NDhRnqh1cW
	 M11h0mAnRtXqK3tCFLUHSlqjYZZec5IN6f26nVlkL81NyMvEIriWCd9mmn4UgtNOht
	 gs5FFfQZWNL49SmSVkOrwOhqFL0LbVC5Zw4z/kpze8Vgrqs6uRtTBTTSPk10P7ykHf
	 58prhXcvKiZyg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:22 +0100
Subject: [PATCH v6 03/16] firmware: arm_scmi: Quiesce notifications before
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-3-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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
the TX/RX channels are freed. During remove, an RX interrupt in that
window can enter scmi_notify() while notification state is being torn
down and then dereference freed memory. The same ordering exists on the
probe error path after notification initialization.

The notification late-init worker has a separate lifetime issue: protocol
event registration queues ni->init_work on the system workqueue, so
destroying ni->notify_wq does not drain that work. If the devres group is
released while init_work is still pending or running, the late-init worker
can dereference the freed notification instance.

Quiesce the notification core before TX/RX channels are torn down, then
clean up the channels before releasing the notification core resources.
Use disable_work_sync() so future late-init queueing is rejected and any
already queued or running late-init work has completed before channel
teardown starts.

Fixes: 1e7cbfaa66d3 ("firmware: arm_scmi: Free mailbox channels if probe fails")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 13 +++++++------
 drivers/firmware/arm_scmi/notify.c | 21 +++++++++++++++++++++
 drivers/firmware/arm_scmi/notify.h |  1 +
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 52aff3aded4c..ec373595f955 100644
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
 
@@ -3404,6 +3405,9 @@ static void scmi_remove(struct platform_device *pdev)
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
 
+	/* Stop transport callbacks before tearing down notifications. */
+	scmi_notification_quiesce(&info->handle);
+	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3416,9 +3420,6 @@ static void scmi_remove(struct platform_device *pdev)
 
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..3239c28d6fa9 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1706,6 +1706,25 @@ int scmi_notification_init(struct scmi_handle *handle)
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
+	disable_work_sync(&ni->init_work);
+}
+
 /**
  * scmi_notification_exit()  - Shutdown and clean Notification core
  * @handle: The handle identifying the platform instance to shutdown
@@ -1717,6 +1736,8 @@ void scmi_notification_exit(struct scmi_handle *handle)
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


