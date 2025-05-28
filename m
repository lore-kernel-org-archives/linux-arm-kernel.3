Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB34C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVbIe5v1cq52dwD/mk5WKiretLnuHu/TNGoFBJZcm54=; b=PSIXEx2UieddmQpckeBoBRwt3H
	y7O8wzqJxXp27eazPFId5eeEPbylcCxRi6+UITqDQapnp8hUqiJRl93A7UMZnRPk27thxazWhQOzl
	VefRaGNmlI5gytwtq5vfmtegkZpAUF2J7xxK50MAUunHo9aN611M+MA4Kg9PIYoFzE0OvOApSh92O
	kSXXw3z7h679RLFjjdmz7NP+g59IEwn1xMn+L8UlsD5lE8M/zxHYPAm4FOK04zpvmtKV/x05HxDuy
	HTPqxnc0nSx76ypULpMKm5SFLj7B7/sKh10AfK2SXdFCC+BqyTUaxF0YGUqSGpbPaAIfdV+toiz71
	F9J1QeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCdD-0000000Cees-3UYc;
	Wed, 28 May 2025 08:59:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCUX-0000000CcsV-3wNe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:50:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 362902309;
	Wed, 28 May 2025 01:50:13 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AECF3F673;
	Wed, 28 May 2025 01:50:28 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 28 May 2025 09:49:43 +0100
Subject: [PATCH 3/3] firmware: arm_ffa: Replace mutex with rwlock to avoid
 sleep in atomic context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250528-ffa_notif_fix-v1-3-5ed7bc7f8437@arm.com>
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Forissier?= <jerome.forissier@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015030_081395_E3ADB22C 
X-CRM114-Status: GOOD (  12.94  )
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

The current use of a mutex to protect the notifier hashtable accesses
can lead to issues in the atomic context. It results in the below
kernel warnings:

  |  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:258
  |  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 9, name: kworker/0:0
  |  preempt_count: 1, expected: 0
  |  RCU nest depth: 0, expected: 0
  |  CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.14.0 #4
  |  Workqueue: ffa_pcpu_irq_notification notif_pcpu_irq_work_fn
  |  Call trace:
  |   show_stack+0x18/0x24 (C)
  |   dump_stack_lvl+0x78/0x90
  |   dump_stack+0x18/0x24
  |   __might_resched+0x114/0x170
  |   __might_sleep+0x48/0x98
  |   mutex_lock+0x24/0x80
  |   handle_notif_callbacks+0x54/0xe0
  |   notif_get_and_handle+0x40/0x88
  |   generic_exec_single+0x80/0xc0
  |   smp_call_function_single+0xfc/0x1a0
  |   notif_pcpu_irq_work_fn+0x2c/0x38
  |   process_one_work+0x14c/0x2b4
  |   worker_thread+0x2e4/0x3e0
  |   kthread+0x13c/0x210
  |   ret_from_fork+0x10/0x20

To address this, replace the mutex with an rwlock to protect the notifier
hashtable accesses. This ensures that read-side locking does not sleep and
multiple readers can acquire the lock concurrently, avoiding unnecessary
contention and potential deadlocks. Writer access remains exclusive,
preserving correctness.

This change resolves warnings from lockdep about potential sleep in
atomic context.

Cc: Jens Wiklander <jens.wiklander@linaro.org>
Reported-by: Jérôme Forissier <jerome.forissier@linaro.org>
Closes: https://github.com/OP-TEE/optee_os/issues/7394
Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notification callbacks")
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 44eecb786e67b205161e2d48602e1f1b53533360..37eb2e6c2f9f4d30831b7bf6ce5142a39a19f50c 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -110,7 +110,7 @@ struct ffa_drv_info {
 	struct work_struct sched_recv_irq_work;
 	struct xarray partition_info;
 	DECLARE_HASHTABLE(notifier_hash, ilog2(FFA_MAX_NOTIFICATIONS));
-	struct mutex notify_lock; /* lock to protect notifier hashtable  */
+	rwlock_t notify_lock; /* lock to protect notifier hashtable  */
 };
 
 static struct ffa_drv_info *drv_info;
@@ -1289,19 +1289,19 @@ static int __ffa_notify_relinquish(struct ffa_device *dev, int notify_id,
 	if (notify_id >= FFA_MAX_NOTIFICATIONS)
 		return -EINVAL;
 
-	mutex_lock(&drv_info->notify_lock);
+	write_lock(&drv_info->notify_lock);
 
 	rc = update_notifier_cb(dev, notify_id, NULL, is_framework);
 	if (rc) {
 		pr_err("Could not unregister notification callback\n");
-		mutex_unlock(&drv_info->notify_lock);
+		write_unlock(&drv_info->notify_lock);
 		return rc;
 	}
 
 	if (!is_framework)
 		rc = ffa_notification_unbind(dev->vm_id, BIT(notify_id));
 
-	mutex_unlock(&drv_info->notify_lock);
+	write_unlock(&drv_info->notify_lock);
 
 	return rc;
 }
@@ -1341,7 +1341,7 @@ static int __ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 	else
 		cb_info->cb = cb;
 
-	mutex_lock(&drv_info->notify_lock);
+	write_lock(&drv_info->notify_lock);
 
 	if (!is_framework) {
 		if (is_per_vcpu)
@@ -1361,7 +1361,7 @@ static int __ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 	}
 
 out_unlock_free:
-	mutex_unlock(&drv_info->notify_lock);
+	write_unlock(&drv_info->notify_lock);
 	if (rc)
 		kfree(cb_info);
 
@@ -1407,9 +1407,9 @@ static void handle_notif_callbacks(u64 bitmap, enum notify_type type)
 		if (!(bitmap & 1))
 			continue;
 
-		mutex_lock(&drv_info->notify_lock);
+		read_lock(&drv_info->notify_lock);
 		cb_info = notifier_hnode_get_by_type(notify_id, type);
-		mutex_unlock(&drv_info->notify_lock);
+		read_unlock(&drv_info->notify_lock);
 
 		if (cb_info && cb_info->cb)
 			cb_info->cb(notify_id, cb_info->cb_data);
@@ -1447,9 +1447,9 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 
 	ffa_rx_release();
 
-	mutex_lock(&drv_info->notify_lock);
+	read_lock(&drv_info->notify_lock);
 	cb_info = notifier_hnode_get_by_vmid_uuid(notify_id, target, &uuid);
-	mutex_unlock(&drv_info->notify_lock);
+	read_unlock(&drv_info->notify_lock);
 
 	if (cb_info && cb_info->fwk_cb)
 		cb_info->fwk_cb(notify_id, cb_info->cb_data, buf);
@@ -1974,7 +1974,7 @@ static void ffa_notifications_setup(void)
 		goto cleanup;
 
 	hash_init(drv_info->notifier_hash);
-	mutex_init(&drv_info->notify_lock);
+	rwlock_init(&drv_info->notify_lock);
 
 	drv_info->notif_enabled = true;
 	return;

-- 
2.34.1


