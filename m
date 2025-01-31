Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE51C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXokwiudd4fS/kOnu+pVm+nE1WeZugOSwkmGq2un8+Q=; b=pW7cxotOPc33Q1i8OFE4b3Rq72
	dZm2WnXOKDj8WvMkrPzMqUMzIv1yTeBswkDWtn05tuS8T7+yEHS1NA0XMw3EM7M9damSvPK7d4PiC
	wWzEner651eJRoTdq9LbTc6QpZDUY9TL9/QvhpBMWQpUNomdh5Scs0Q6USYhIa5e8eePut8dpVEgl
	9AkvwP151yQBChCN4jPyEQa3kJPlsSBK/xZoo2ae9YCNi/WI8XeeCXpIGB7ZKddjTB9LovymnTIol
	H1NIaul2DJZtA6EEOoQgzz09wDpFz/HGn9dcGQuJVBh8983LYpEy5MpZ06MMOBgOw2+n1YrjoRzh4
	eeV2Ur/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpW6-0000000AXyQ-3TAk;
	Fri, 31 Jan 2025 11:48:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp9H-0000000ATpp-3wJv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36FCFFEC;
	Fri, 31 Jan 2025 03:25:49 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 124173F63F;
	Fri, 31 Jan 2025 03:25:22 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:17 +0000
Subject: [PATCH v2 17/18] firmware: arm_ffa: Add support for handling
 framework notifications
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250131-ffa_updates-v2-17-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3890; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=tKQtXeBcDSeq+ploR2WzRap4P0UUs9Qp+htINEVCR1o=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMRaBLHl9ojapsEGCM6b2KTz+ItevgFDZIDQ
 g1S8E9JRRGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEQAKCRAAQbq8MX7i
 mErdEACJ1il05A/YjFwK7OClKWTbrQKJfoMoYp/6nGQ4xmdevFT9uEaHdcSOnw8OfpvPO7Pq3Fl
 NX2H4NJUsvf++KeU7RdXwJASw6ZvOrnab/N/u85tTJWYN9nlaOStrtFx9lDxACy/xQ7oGWeNLA0
 59N8lMfKkCf8hF3E/KX4iDftiAeCqWgAk3X0JSUktyTkd02+WI0D4RvTcazRvuqEu9O4+GBZ0C6
 lQ4yFSxe2bgNPyWNqVl/+RlLBaaq+/8ubge8bnRsv50gGCCcksD+PfXarBoQlmJWFt0/JTv1KO7
 5rdEbM70DS3QzjOwDIXP9s6ckkphFfl3U0nKWck04htjSLtRCqLCOz8/UxeQh4Xw+EfwzcgZtLI
 BKE460F5Dp/cxjCpDKg9TZxKqI1Z3wudPW/wLacFGuGnV1eSE5rRWqophcA79u0HpQKawO/Aijc
 35X9DKkP8WZPP6zVjw2yJbIMzypmF7RebfQEwCqvwPjVOwZ93ZpMqMiZ1DPeAgLswqdu8oGzjUc
 oyxPmdZKeHl8/51VskArCJtlULpjus8r+assS8viiFd+H3TV8RhT5tNs/NUXxR3MVq3QmE1Dzid
 /aiM1EchQm0hI0d28y9Jsj16B0ESOxhaxVdIODlPavUuALVqSqfGvBQm2CWUa32t1FMPl3WiMGr
 Mg5Yg0oj8cjwPYQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032524_058585_6A37F93B 
X-CRM114-Status: GOOD (  13.42  )
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

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 50 +++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f0e853584b51645cd7f590e4cb8d01ca1e7914dc..ab50836adc75ab4bdab3c2da7e23ec5d11826e8b 100644
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
+	buf = kmalloc(msg->size, GFP_KERNEL);
+	if (!buf) {
+		mutex_unlock(&drv_info->rx_lock);
+		return;
+	}
+	memcpy(buf, (void *)msg + msg->offset, msg->size);
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


