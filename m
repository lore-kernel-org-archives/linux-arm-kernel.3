Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EEFC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT5rzhdJbULQ380yD5HKFPOaijZr82Z1WbX0PL8FMtI=; b=sPEqYx/C+uspZgT9wDXMPiPP5C
	o468BGgFrSQLicAziTDnrVtiDKMcp35iZLaP8moyea2CySesNk8iZ4zkb6IFY4FwFp4ZaRFwYmBzl
	CTICc4Xpakx0jf6M/XpFH/M68q4CJ3m8320nxfWyVg6q7crGdSAz+en2JZiZmGGY6DXoodMh2tQcQ
	AJRay4HF/X15nv4zR3RJaF5XOQMSWuCMY0Gdw8wEQ/yphLnFqctlo7QPxfs7dRFHnWdhLe1zKN5UO
	y5q5mBdU94g8QjeUF9LSqBzG6RJpUVNSgBGUDCP/GLmu0/pJdDVIYW7II7KB4tQEfL8baTu7bSrxu
	hRUIrjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3jv-00000005DkY-1vod;
	Mon, 17 Feb 2025 16:12:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Dm-000000055XP-1w5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73ED11063;
	Mon, 17 Feb 2025 07:40:05 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FE583F6A8;
	Mon, 17 Feb 2025 07:39:45 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:58 +0000
Subject: [PATCH v3 17/19] firmware: arm_ffa: Add support for handling
 framework notifications
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-ffa_updates-v3-17-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3917; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=zUw9jpCCHwbKRiqx7Z32FGOQBWRbtxyOOD74emf44tE=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gvyqk55MtjEByyz9lgsEdQeQbM/lstIDQKH
 0JT4Odm8y2JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLwAKCRAAQbq8MX7i
 mDBRD/9ssBXMIPSl1evsnV27zqqtXe4QKXj8oq8NX8NxhTw8Wrgryq1vFwuaZb9NPEVHIHtorKn
 vBfs8KvUJHWMxQVYMkdFLPI2aoyCOWxsyQiJyImDEUJIs1VHexZ0ajDEexVYoY9n6LILCQVnoFA
 CpWr1oeqfzxY6Sb6C26FoHCOOGZcNmzkm0iEzz/mipzD1215FUYBdobgpP8kFqZkhypR87bllDi
 vciz18P6cz92e6R6iQ6/5oDcbRTmiubNAEG+ktRTIl8oH4OvMPCOpYad3/Qs7R2sZiJrXxlYrWj
 eL6ppsFXYf+3GUEnruKb3MFXOFi2fk9AYlEYitVLssK605uiFm2ASMjyKktwPPKxjD407RQPQwQ
 9O6jLsP5q3HVSK2GvnzeOzEoz3dwG86qdpDqVJGYAlELz6qeL1c8Ks9F7Q9V/s+Ebfb3fRlbyXM
 sNBbaOxXiXiKw0+x8WlfQXkm0CGSzLdse/x12/e22ciNs09nkW6PL8eX9I60TeGuaesrrYFPKU+
 9GPm8WoBBZJhmQwmZQoOz9cY7jr0lRaCVWCCyad4mpcviqU/K3sthyshyAJr3ydmBpJETviOrxs
 ojpL0y486OUPwhvgZZ3mLafTCpGZKcLO1igt2e67jvLIpSVJ5jt/xnHc8uGnzAPV3quTdq1xTsC
 GMV2NtyvUdzaaPQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073946_586105_E290CCBC 
X-CRM114-Status: GOOD (  13.40  )
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

Currently FF-A specification defines only one framework notification:
RX buffer full notification. This notification is signaled by the
partition manager during transmission of a partition message through
indirect messaging to,

1. Notify an endpoint that it has a pending message in its Rx buffer.
2. Inform the message receiver’s scheduler via the schedule receiver
   interrupt that the receiver must be run.

In response to an FFA_MSG_SEND2 invocation by a sender endpoint, the
framework performs the following actions after the message is copied
from the Tx buffer of the sender to the Rx buffer of the receiver:

1. The notification is pended in the framework notification bitmap of
   the receiver.
2. The partition manager of the endpoint that contains receiver’s
   scheduler pends the schedule receiver interrupt for this endpoint.

The receiver receives the notification and copies out the message from
its Rx buffer.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 50 +++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index a889ad6d94ac499cff869a138970c9dc7ae0a1f9..5441c4d8878023ad9107b185b711fd7b04224bb4 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -848,6 +848,7 @@ enum notify_type {
 
 #define SPM_FRAMEWORK_BITMAP(x)			NOTIFICATION_BITMAP_LOW(x)
 #define NS_HYP_FRAMEWORK_BITMAP(x)		NOTIFICATION_BITMAP_HIGH(x)
+#define FRAMEWORK_NOTIFY_RX_BUFFER_FULL		BIT(0)
 
 static int ffa_notification_bind_common(u16 dst_id, u64 bitmap,
 					u32 flags, bool is_bind)
@@ -1373,9 +1374,6 @@ static void handle_notif_callbacks(u64 bitmap, enum notify_type type)
 	int notify_id;
 	struct notifier_cb_info *cb_info = NULL;
 
-	if (type == SPM_FRAMEWORK || type == NS_HYP_FRAMEWORK)
-		return;
-
 	for (notify_id = 0; notify_id <= FFA_MAX_NOTIFICATIONS && bitmap;
 	     notify_id++, bitmap >>= 1) {
 		if (!(bitmap & 1))
@@ -1390,6 +1388,46 @@ static void handle_notif_callbacks(u64 bitmap, enum notify_type type)
 	}
 }
 
+static void handle_fwk_notif_callbacks(u32 bitmap)
+{
+	void *buf;
+	uuid_t uuid;
+	int notify_id = 0, target;
+	struct ffa_indirect_msg_hdr *msg;
+	struct notifier_cb_info *cb_info = NULL;
+
+	/* Only one framework notification defined and supported for now */
+	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
+		return;
+
+	mutex_lock(&drv_info->rx_lock);
+
+	msg = drv_info->rx_buffer;
+	buf = kmemdup((void *)msg + msg->offset, msg->size, GFP_KERNEL);
+	if (!buf) {
+		mutex_unlock(&drv_info->rx_lock);
+		return;
+	}
+
+	target = SENDER_ID(msg->send_recv_id);
+	if (msg->offset >= sizeof(*msg))
+		uuid_copy(&uuid, &msg->uuid);
+	else
+		uuid_copy(&uuid, &uuid_null);
+
+	mutex_unlock(&drv_info->rx_lock);
+
+	ffa_rx_release();
+
+	mutex_lock(&drv_info->notify_lock);
+	cb_info = notifier_hnode_get_by_vmid_uuid(notify_id, target, &uuid);
+	mutex_unlock(&drv_info->notify_lock);
+
+	if (cb_info && cb_info->fwk_cb)
+		cb_info->fwk_cb(notify_id, cb_info->cb_data, buf);
+	kfree(buf);
+}
+
 static void notif_get_and_handle(void *unused)
 {
 	int rc;
@@ -1401,10 +1439,8 @@ static void notif_get_and_handle(void *unused)
 		return;
 	}
 
-	handle_notif_callbacks(SPM_FRAMEWORK_BITMAP(bitmaps.arch_map),
-			       SPM_FRAMEWORK);
-	handle_notif_callbacks(NS_HYP_FRAMEWORK_BITMAP(bitmaps.arch_map),
-			       NS_HYP_FRAMEWORK);
+	handle_fwk_notif_callbacks(SPM_FRAMEWORK_BITMAP(bitmaps.arch_map));
+	handle_fwk_notif_callbacks(NS_HYP_FRAMEWORK_BITMAP(bitmaps.arch_map));
 	handle_notif_callbacks(bitmaps.vm_map, NON_SECURE_VM);
 	handle_notif_callbacks(bitmaps.sp_map, SECURE_PARTITION);
 }

-- 
2.34.1


