Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328A3C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fdytK0eVBE/MmvQJtNFcG+GJxcn7WfoMOfY69zZWId8=; b=c+f8y9db5iqLJ7tGqImeb+YkzB
	SZ0mu47wDlG8cHy7AFVWhOclUeZ5dUVMOqNzYvoW3v/95NimI0R54+W4YAPax/iZF4QhjsmbPy7zU
	QcwaDlpyZuOGIG/XrF9Duj0iuz9G71LBtVnLW59v17J91ka2K0Mc0N5ooMlZAtCBGGMMvPdYOaJdQ
	JCr6mUVl0Al10QKVl59Dy6GHpfJK5AoaGT8PxKc1xhpQUCnxaVgszLAAAtSpV0QaGEazYC3keyj8I
	Hd6Eu6lPFrD5xXCZI2jl+prnYEEU9n7TLhKJmIyAKevTvmk9YNP7EE8fj53vcWF7ZnABNNJj7fGYH
	5xjFxZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTdG-0000000BSXs-3iOO;
	Wed, 22 Jul 2026 09:52:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTdF-0000000BSXQ-2QfI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:52:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2F73417EA;
	Wed, 22 Jul 2026 09:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B091F000E9;
	Wed, 22 Jul 2026 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784713972;
	bh=fdytK0eVBE/MmvQJtNFcG+GJxcn7WfoMOfY69zZWId8=;
	h=From:To:Cc:Subject:Date;
	b=hs/qCTBct6ZK2iyaLjJC1/ILSbH+N7YP5ftHer+qzXO7T5RoolXARn1aMNNapIIDp
	 JtrowoXf2wtT6jyzY/xdqA+8nEmVkkNLuM1H7/xSoE+xdiR57TwLisQfmbfJwlqCG9
	 0+MYlmt1kahXADThsn0Zl6pwFK/fwbOAc4PLNLfW6dwzwr0QOMVIhP3BYQfdO7KPDJ
	 6P8dMwClA0v5grO90v96A7VxaFL3GUrHT8ciK6LfhitChxVAg1pXrV+vpvEiKzw8EN
	 RWWncoSK6LK1nJaDE5QhYRT5/W0+aEfh5Fqpmc3Xeit7Ll6gY8MXSsuFFvn0+gOhcY
	 aErltjkOQxsvQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH] firmware: arm_scmi: Fix requested device removal race
Date: Wed, 22 Jul 2026 10:52:50 +0100
Message-ID: <20260722095250.2011630-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

scmi_protocol_device_unrequest() drops scmi_requested_devices_mtx while
notifying listeners but continues to retain the per-protocol list head.
When two SCMI drivers for the same protocol unregister concurrently, one
thread can remove the final request and free the list head while the other
is running its notifier. The latter then dereferences the freed list head
after reacquiring the mutex and can free it a second time.

Complete the list and IDR updates, including freeing an empty list head,
before dropping the mutex. Keep the blocking notifier outside the critical
section and retain only the detached request across the callback.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

Hi,

I had ignored this issue after Sashiko had reported it but after thinking
a bit, since we allow registering more that one driver for the same protocol,
unregister can also be called concurrently and hence this is a valid possible
race condition IMO.

Regards,
Sudeep

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..d4d3f8c69014 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -159,6 +159,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
  */
 static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table)
 {
+	struct scmi_requested_dev *rdev, *victim = NULL;
 	struct list_head *phead;
 
 	pr_debug("Unrequesting SCMI device (%s) for protocol %x\n",
@@ -167,29 +168,28 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, id_table->protocol_id);
 	if (phead) {
-		struct scmi_requested_dev *victim, *tmp;
-
-		list_for_each_entry_safe(victim, tmp, phead, node) {
-			if (!strcmp(victim->id_table->name, id_table->name)) {
-				list_del(&victim->node);
-
-				mutex_unlock(&scmi_requested_devices_mtx);
-				blocking_notifier_call_chain(&scmi_requested_devices_nh,
-							     SCMI_BUS_NOTIFY_DEVICE_UNREQUEST,
-							     (void *)victim->id_table);
-				kfree(victim);
-				mutex_lock(&scmi_requested_devices_mtx);
+		list_for_each_entry(rdev, phead, node) {
+			if (!strcmp(rdev->id_table->name, id_table->name)) {
+				victim = rdev;
+				list_del(&rdev->node);
 				break;
 			}
 		}
 
-		if (list_empty(phead)) {
+		if (victim && list_empty(phead)) {
 			idr_remove(&scmi_requested_devices,
 				   id_table->protocol_id);
 			kfree(phead);
 		}
 	}
 	mutex_unlock(&scmi_requested_devices_mtx);
+
+	if (victim) {
+		blocking_notifier_call_chain(&scmi_requested_devices_nh,
+					     SCMI_BUS_NOTIFY_DEVICE_UNREQUEST,
+					     (void *)victim->id_table);
+		kfree(victim);
+	}
 }
 
 static void
-- 
2.43.0


