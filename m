Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867DFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtnszWQ1EqP0wG06eKPYqJbUwcsky+YWGL6tHgkD3mY=; b=giWRdOBMLEj+i2NagTJKlWJYzF
	7RVX6vXa8yylkTQnCvV6X1gpHhC22MAWe19jt/ilGbmrScwOWInHcc5tOeLV8nhg0+9WX3pI758LM
	fiii4rnm6VJ7La7wFJN2gMpectHxzhbXKq4evxEe9txAn4B4ZvVHieu/HOS0dlExSQiGMkOAvztzJ
	Az6sNcO2nTjz8UmwGUjTTu3ZjH9nwmO3BQ6piFBQ8KXrZMO1xF53P6qmCoMGvCTyFJmPOCXph8+Fr
	oFD44WYydVRrZsLdLlRifSe1K6KApCSboffOKPiXx/gPM0Ig7ON8KG3ZkmU/WJSmGz99EQAG7eDd+
	c+M5rNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8s-0000000Gfve-02JY;
	Wed, 08 Jul 2026 09:00:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8p-0000000Gfum-1evL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23AAB43714;
	Wed,  8 Jul 2026 09:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750821F00A3D;
	Wed,  8 Jul 2026 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501227;
	bh=qtnszWQ1EqP0wG06eKPYqJbUwcsky+YWGL6tHgkD3mY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R1BoSBsIPRhcKS2FiPkIPBk+YIgMMvSTCZpub8rc8NNZCADe9WK4YuVoKEmg6u/tq
	 8va2iZu++FhCdODlvfKnfLk56829rjoZSDZ0XqPJplfFcvXR/EABl9Sad2KuhjOG7q
	 DCiA2s4j5aES7eNt99sD0rZ5pHpDTPgqjqHMWAEYLD8dhc+UGZugu3HU2pMcgfKIDW
	 r9AmNedz+k4Mus/8goJecwRuSymbquk7vksnBwGI2oxj2mbIj6szrKvd4EcPgRdtyt
	 m2zXSJg3edtVgliajxWQloxuRERdXXwvYYBVJrdU2zVg28FeEZmQbHu3ilE8cd7yFt
	 Gu87pRADDT7kg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 09:59:58 +0100
Subject: [PATCH v4 02/16] firmware: arm_scmi: Quiesce notifications before
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-2-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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

Unregister the requested device notifier first, stop transport callbacks by
cleaning up TX/RX channels before releasing the notification core, and
cancel init_work before destroying the notification workqueue and releasing
the notification devres group.

Fixes: 1e7cbfaa66d3 ("firmware: arm_scmi: Free mailbox channels if probe fails")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 12 +++++-------
 drivers/firmware/arm_scmi/notify.c |  2 ++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1d1f5d25d773..6f588840bf11 100644
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
@@ -3367,10 +3367,9 @@ static int scmi_probe(struct platform_device *pdev)
 
 	return 0;
 
-notification_exit:
+raw_mode_cleanup:
 	if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT))
 		scmi_raw_mode_cleanup(info->raw);
-	scmi_notification_exit(&info->handle);
 clear_dev_req_notifier:
 	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
 					   &info->dev_req_nb);
@@ -3378,7 +3377,7 @@ static int scmi_probe(struct platform_device *pdev)
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
 	scmi_cleanup_txrx_channels(info);
-clear_ida:
+	scmi_notification_exit(&info->handle);
 	ida_free(&scmi_id, info->id);
 
 out_err:
@@ -3401,6 +3400,8 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	/* Stop transport callbacks before tearing down notifications. */
+	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3415,9 +3416,6 @@ static void scmi_remove(struct platform_device *pdev)
 					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
-	/* Safe to free channels since no more users */
-	scmi_cleanup_txrx_channels(info);
-
 	ida_free(&scmi_id, info->id);
 }
 
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 40ec184eedae..be2eadfd93a4 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1719,6 +1719,8 @@ void scmi_notification_exit(struct scmi_handle *handle)
 		return;
 	scmi_notification_instance_data_set(handle, NULL);
 
+	cancel_work_sync(&ni->init_work);
+
 	/* Destroy while letting pending work complete */
 	destroy_workqueue(ni->notify_wq);
 

-- 
2.43.0


