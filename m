Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAC0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YCahtS6HBDtsHjiNdFyv7+H7MaOIaKhJDAMGYjxLTw=; b=Wz87qxlw1s98SkaCsc6myC8SVv
	ravocvh6ZyJ2yr5TlK4x/IUeXToZySgIxvnyqOs8YFgpGWcDq7A16QuC9RByHyDCWQXvGviE33gyW
	txCh9rI/z23Ld6NyumCV+qLjR/jIabYKoBMYX6+WqG7wt33/M7cZyIiMW9tdDv/E1yCSMrZm4wOJq
	Z6KnFXia+giiZFIBU2HYJx3pslzkKWb18Vj7geZo5iRKktMp3Ul6QDr3vDBwVhI3r9kYtR2UybatP
	oLw1eanryglSJ/w3JZsSG4Jy9mKhfmWfrIlE+DfDyzPMjt+uHSoWNuRGh3x28B0wBChv4bNZ3/wXv
	1jn4idSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCfM-0000000Cf23-2d1t;
	Wed, 28 May 2025 09:01:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCUY-0000000Ccs4-3LI8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:50:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A7052308;
	Wed, 28 May 2025 01:50:12 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FBB43F673;
	Wed, 28 May 2025 01:50:27 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 28 May 2025 09:49:42 +0100
Subject: [PATCH 2/3] firmware: arm_ffa: Move memory allocation outside the
 mutex locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ffa_notif_fix-v1-2-5ed7bc7f8437@arm.com>
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Forissier?= <jerome.forissier@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015030_925752_20A9DF4B 
X-CRM114-Status: GOOD (  13.21  )
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

The notifier callback node allocation is currently done while holding
the notify_lock mutex. While this is safe even if memory allocation may
sleep, we need to move the allocation outside the locked region in
preparation to move from using muxtes to rwlocks.

Move the memory allocation to avoid potential sleeping in atomic context
once the locks are moved from mutex to rwlocks.

Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notification callbacks")
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 6f75cdf29720993b1cd95eb7d3a36d01b0fdd1de..44eecb786e67b205161e2d48602e1f1b53533360 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1250,13 +1250,12 @@ notifier_hnode_get_by_type(u16 notify_id, enum notify_type type)
 	return NULL;
 }
 
-static int
-update_notifier_cb(struct ffa_device *dev, int notify_id, void *cb,
-		   void *cb_data, bool is_registration, bool is_framework)
+static int update_notifier_cb(struct ffa_device *dev, int notify_id,
+			      struct notifier_cb_info *cb, bool is_framework)
 {
 	struct notifier_cb_info *cb_info = NULL;
 	enum notify_type type = ffa_notify_type_get(dev->vm_id);
-	bool cb_found;
+	bool cb_found, is_registration = !!cb;
 
 	if (is_framework)
 		cb_info = notifier_hnode_get_by_vmid_uuid(notify_id, dev->vm_id,
@@ -1270,18 +1269,7 @@ update_notifier_cb(struct ffa_device *dev, int notify_id, void *cb,
 		return -EINVAL;
 
 	if (is_registration) {
-		cb_info = kzalloc(sizeof(*cb_info), GFP_KERNEL);
-		if (!cb_info)
-			return -ENOMEM;
-
-		cb_info->dev = dev;
-		cb_info->cb_data = cb_data;
-		if (is_framework)
-			cb_info->fwk_cb = cb;
-		else
-			cb_info->cb = cb;
-
-		hash_add(drv_info->notifier_hash, &cb_info->hnode, notify_id);
+		hash_add(drv_info->notifier_hash, &cb->hnode, notify_id);
 	} else {
 		hash_del(&cb_info->hnode);
 		kfree(cb_info);
@@ -1303,8 +1291,7 @@ static int __ffa_notify_relinquish(struct ffa_device *dev, int notify_id,
 
 	mutex_lock(&drv_info->notify_lock);
 
-	rc = update_notifier_cb(dev, notify_id, NULL, NULL, false,
-				is_framework);
+	rc = update_notifier_cb(dev, notify_id, NULL, is_framework);
 	if (rc) {
 		pr_err("Could not unregister notification callback\n");
 		mutex_unlock(&drv_info->notify_lock);
@@ -1335,6 +1322,7 @@ static int __ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 {
 	int rc;
 	u32 flags = 0;
+	struct notifier_cb_info *cb_info = NULL;
 
 	if (ffa_notifications_disabled())
 		return -EOPNOTSUPP;
@@ -1342,6 +1330,17 @@ static int __ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 	if (notify_id >= FFA_MAX_NOTIFICATIONS)
 		return -EINVAL;
 
+	cb_info = kzalloc(sizeof(*cb_info), GFP_KERNEL);
+	if (!cb_info)
+		return -ENOMEM;
+
+	cb_info->dev = dev;
+	cb_info->cb_data = cb_data;
+	if (is_framework)
+		cb_info->fwk_cb = cb;
+	else
+		cb_info->cb = cb;
+
 	mutex_lock(&drv_info->notify_lock);
 
 	if (!is_framework) {
@@ -1349,21 +1348,22 @@ static int __ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 			flags = PER_VCPU_NOTIFICATION_FLAG;
 
 		rc = ffa_notification_bind(dev->vm_id, BIT(notify_id), flags);
-		if (rc) {
-			mutex_unlock(&drv_info->notify_lock);
-			return rc;
-		}
+		if (rc)
+			goto out_unlock_free;
 	}
 
-	rc = update_notifier_cb(dev, notify_id, cb, cb_data, true,
-				is_framework);
+	rc = update_notifier_cb(dev, notify_id, cb_info, is_framework);
 	if (rc) {
 		pr_err("Failed to register callback for %d - %d\n",
 		       notify_id, rc);
 		if (!is_framework)
 			ffa_notification_unbind(dev->vm_id, BIT(notify_id));
 	}
+
+out_unlock_free:
 	mutex_unlock(&drv_info->notify_lock);
+	if (rc)
+		kfree(cb_info);
 
 	return rc;
 }

-- 
2.34.1


