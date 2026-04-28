Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311C2FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7//KKCT4PVvoiyRif/LYPBHrOlnRWt6k99Aj+8ydyE=; b=Op/ZLO7KpYnHEn72kEfzYnwIGv
	jNVlnNnWks7uVna8R6bNSag9e9ww2/InqqL2IGB85RCHTkEoHg8YQljtEabvZ/sNman5WMuEQLZSy
	sclpI4KJ0V37bFUQtC11khvardWFPQHr+El3JiAJtoq7PjHAiRW/1OlunjTlwqqe9RJnhvtZtiHmT
	NCzGwUqhs2tv6sU2LqCH7cL69yxLVqzkiTMFNeLlfAZQjgm8S3OAEdsktk6JdHoIalCX5nws9QliB
	xEaPS1ng++AXj7fKin21Ldxh32Fqjn8UkUkSsdti1zeC0En0tzjiBrL+JTVXLUTre9dB8sogda0nJ
	8TANk3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnGQ-000000025hH-2EJ2;
	Tue, 28 Apr 2026 18:34:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFx-000000025HX-1PVh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 142D2406AB;
	Tue, 28 Apr 2026 18:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA02C2BCB3;
	Tue, 28 Apr 2026 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401241;
	bh=lf8FNqMoY3bRcXhsXqO47iWYBbsuI1PT5XjhAchyLzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hH4eFv/r3Ct/0fM0RVmVj1w5VgfvyfC8dc6MpnKeCDivTlmJbzfFG6SGiiCXbl18g
	 UJjXpVhSjqzzgatsJoxPNy4bJwIgKpvMVgZJePHRMcxgArSsS0/o6AO58KSQM+FQrK
	 JFAvxMCUqMEY9H8338oGFaRUYzte1KEgWLCQnhu3njrI9r6MUnhxFNVOBNdbdnM3tz
	 V3uNd3b9p8T1ujyJ1HLFT9kaSZBBf31lB9RrmE19+tcZ/StxXebZqS54iU+2jCaDnr
	 Xv8ygPv0K8A8VmYCKPXKM+YsLsg8KxucsbFVTXGjRch37PYTYaBuVGhUWpEkgyY+Lv
	 igWMUgBCmtTlQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:34 +0100
Subject: [PATCH v2 10/11] firmware: arm_ffa: Snapshot notifier callbacks
 under lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-10-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113401_426700_A7C9B8A5 
X-CRM114-Status: GOOD (  13.64  )
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

Both notification handlers currently look up a notifier callback under
notify_lock, drop the lock, and then dereference the returned
notifier entry. A concurrent unregister can delete and free that
entry in the gap, leaving the handler to dereference stale memory.

Copy the callback pointer and callback data while notify_lock is
still held and invoke the callback only after the lock is dropped.
This keeps the existing callback execution model while removing the
use-after-free window in both the framework and non-framework
notification paths.

Fixes: 285a5ea0f542 ("firmware: arm_ffa: Add support for handling framework notifications")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 9181cc752ce1..2e9820395162 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1465,20 +1465,25 @@ static int ffa_notify_send(struct ffa_device *dev, int notify_id,
 
 static void handle_notif_callbacks(u64 bitmap, enum notify_type type)
 {
+	ffa_notifier_cb cb;
+	void *cb_data;
 	int notify_id;
-	struct notifier_cb_info *cb_info = NULL;
 
 	for (notify_id = 0; notify_id <= FFA_MAX_NOTIFICATIONS && bitmap;
 	     notify_id++, bitmap >>= 1) {
 		if (!(bitmap & 1))
 			continue;
 
-		read_lock(&drv_info->notify_lock);
-		cb_info = notifier_hnode_get_by_type(notify_id, type);
-		read_unlock(&drv_info->notify_lock);
+		scoped_guard(read_lock, &drv_info->notify_lock) {
+			struct notifier_cb_info *cb_info;
+
+			cb_info = notifier_hnode_get_by_type(notify_id, type);
+			cb = cb_info ? cb_info->cb : NULL;
+			cb_data = cb_info ? cb_info->cb_data : NULL;
+		}
 
-		if (cb_info && cb_info->cb)
-			cb_info->cb(notify_id, cb_info->cb_data);
+		if (cb)
+			cb(notify_id, cb_data);
 	}
 }
 
@@ -1486,9 +1491,10 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 {
 	void *buf;
 	uuid_t uuid;
+	void *fwk_cb_data;
 	int notify_id = 0, target;
+	ffa_fwk_notifier_cb fwk_cb;
 	struct ffa_indirect_msg_hdr *msg;
-	struct notifier_cb_info *cb_info = NULL;
 	size_t min_offset = offsetof(struct ffa_indirect_msg_hdr, uuid);
 
 	/* Only one framework notification defined and supported for now */
@@ -1524,12 +1530,17 @@ static void handle_fwk_notif_callbacks(u32 bitmap)
 		ffa_rx_release();
 	}
 
-	read_lock(&drv_info->notify_lock);
-	cb_info = notifier_hnode_get_by_vmid_uuid(notify_id, target, &uuid);
-	read_unlock(&drv_info->notify_lock);
+	scoped_guard(read_lock, &drv_info->notify_lock) {
+		struct notifier_cb_info *cb_info;
+
+		cb_info = notifier_hnode_get_by_vmid_uuid(notify_id, target,
+							  &uuid);
+		fwk_cb = cb_info ? cb_info->fwk_cb : NULL;
+		fwk_cb_data = cb_info ? cb_info->cb_data : NULL;
+	}
 
-	if (cb_info && cb_info->fwk_cb)
-		cb_info->fwk_cb(notify_id, cb_info->cb_data, buf);
+	if (fwk_cb)
+		fwk_cb(notify_id, fwk_cb_data, buf);
 	kfree(buf);
 }
 

-- 
2.43.0


