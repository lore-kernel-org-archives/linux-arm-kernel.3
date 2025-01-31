Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82712C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldvJVm8DDHv2/siFMd8ow7IVJX0qswtnl2VGE0oRHsQ=; b=b+Q6cJSYD0PZ7ZxVtLVLgJ4GzK
	NcFhG7ahq4mI7SvkU/TosNrfzh7yxOSpyrGfuF9nZHhPl+VPf76qYDnzPfqiYaTeXC0+Xi+c2scae
	BliCnDb15tCBSBop6WLSIj5jwgs49gfgMJjP0rAdiKMd4ZSP47SSkXAsK5hNxH632p8HhilnEyJoZ
	CpPloPB3s66jy0nquNIQ+KRnd7xkGy2EWi224v9OW2aoA/ZI261/hyHfE0etY/M9FfRWYcarJ7lIQ
	efKPoWYfpXsb8CqtZ2uEU27SN7vdTQfdJ0B5TeGJIuUSNGM+IK0rtNVklZA0Bkr8rHVpgBG5XmWKZ
	0aycZ1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpTY-0000000AXU5-23Eb;
	Fri, 31 Jan 2025 11:46:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp9F-0000000ATpp-3tRC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A8D4FEC;
	Fri, 31 Jan 2025 03:25:47 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05D823F63F;
	Fri, 31 Jan 2025 03:25:20 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:15 +0000
Subject: [PATCH v2 15/18] firmware: arm_ffa: Stash ffa_device instead of
 notify_type in notifier_cb_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-15-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=ppHCXWGMtBjYqasFlq5USxa8F65s3HoS/cBJa+OZxBc=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMRBuIh27ziuPfs8So1yLkq6OEw3A+xBlmlZ
 PbgP5yQQXuJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEQAKCRAAQbq8MX7i
 mKpDEAC+wz+pn3lmr5K+NgtpCsurmQj9U6ThCm0xmNbVsoYRdYuAoxX14DxTrXHgUJh2W1zK9Lv
 YgCBwijlkhcvzRHtRxTEa4z4H9Ef2yYPsjTsx8DiScEEC1eJAFXM9ldD4kuSITzX6BuxKmh+8LH
 4FLD3iCvxcnDQiNmymplcEJZHrcJcAF+9rCP4OO1zLB3dMnGWuEbK1BCvM4gLLsIJawZGsO7JSE
 LIUNFNt3RhwCw+nDJuV8ZN2Sk5xt1R87fnzlYLyHCiOkIfZ2xGUeiEE+F07i9trKhaK3EOZm4ku
 aE3ipHhKAJ3TQ2k0EU8YoigSTB/vp0L7Ljfq2NRIExkAU+ScpUMwr3CH6WDhbo7nD2nWhuY7M79
 eOl3EXZLLAEdNnhjtzK2EYPEF1invLtmw5uiDiQN5zWCUlehnDv0EXpuIE2+GLxdWY6vb+YXwnq
 6brJS0YQ9BkxjTe2tDp1eAakGK90v0Eq6VQBCK7wkREY8seX335Ra4hmgyQjYwSlB/AhH70rlzp
 r7TckNpY092suOxThHwSBe1hmgEUwOTWE5GzkrPX2FLa3e3uQCyMVNqrHgJXRHDgyE3MGcn1uXq
 cxNDYRBSLembSdT/s96tqHr4Jh2ZsdK6Xm2kpHI2hVV3KsYoftaBRMp17N6VhILOh7PzADal96u
 8t9YA02BYaqNBdw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032522_067756_7A304ADF 
X-CRM114-Status: GOOD (  12.29  )
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

Currently, we store the type of the notification in the notifier_cb_info
structure that is put into the hast list to identify if the notification
block is for the secure partition or the non secure VM.

In order to support framework notifications to reuse the hash list and
to avoid creating one for each time, we need store the ffa_device pointer
itself as the same notification ID in framework notifications can be
registered by multiple FF-A devices.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index dc2d05bb361272b4100802503dd883c17f8900f3..86c0667ff8825ca5e70547e9056a28b73b8ab251 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1116,9 +1116,9 @@ static int ffa_memory_lend(struct ffa_mem_ops_args *args)
 
 struct notifier_cb_info {
 	struct hlist_node hnode;
+	struct ffa_device *dev;
 	ffa_notifier_cb cb;
 	void *cb_data;
-	enum notify_type type;
 };
 
 static int ffa_sched_recv_cb_update(u16 part_id, ffa_sched_recv_cb callback,
@@ -1187,17 +1187,18 @@ notifier_hash_node_get(u16 notify_id, enum notify_type type)
 	struct notifier_cb_info *node;
 
 	hash_for_each_possible(drv_info->notifier_hash, node, hnode, notify_id)
-		if (type == node->type)
+		if (type == ffa_notify_type_get(node->dev->vm_id))
 			return node;
 
 	return NULL;
 }
 
 static int
-update_notifier_cb(int notify_id, enum notify_type type, ffa_notifier_cb cb,
+update_notifier_cb(struct ffa_device *dev, int notify_id, ffa_notifier_cb cb,
 		   void *cb_data, bool is_registration)
 {
 	struct notifier_cb_info *cb_info = NULL;
+	enum notify_type type = ffa_notify_type_get(dev->vm_id);
 	bool cb_found;
 
 	cb_info = notifier_hash_node_get(notify_id, type);
@@ -1211,7 +1212,7 @@ update_notifier_cb(int notify_id, enum notify_type type, ffa_notifier_cb cb,
 		if (!cb_info)
 			return -ENOMEM;
 
-		cb_info->type = type;
+		cb_info->dev = dev;
 		cb_info->cb = cb;
 		cb_info->cb_data = cb_data;
 
@@ -1226,7 +1227,6 @@ update_notifier_cb(int notify_id, enum notify_type type, ffa_notifier_cb cb,
 static int ffa_notify_relinquish(struct ffa_device *dev, int notify_id)
 {
 	int rc;
-	enum notify_type type = ffa_notify_type_get(dev->vm_id);
 
 	if (ffa_notifications_disabled())
 		return -EOPNOTSUPP;
@@ -1236,7 +1236,7 @@ static int ffa_notify_relinquish(struct ffa_device *dev, int notify_id)
 
 	mutex_lock(&drv_info->notify_lock);
 
-	rc = update_notifier_cb(notify_id, type, NULL, NULL, false);
+	rc = update_notifier_cb(dev, notify_id, NULL, NULL, false);
 	if (rc) {
 		pr_err("Could not unregister notification callback\n");
 		mutex_unlock(&drv_info->notify_lock);
@@ -1255,7 +1255,6 @@ static int ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 {
 	int rc;
 	u32 flags = 0;
-	enum notify_type type = ffa_notify_type_get(dev->vm_id);
 
 	if (ffa_notifications_disabled())
 		return -EOPNOTSUPP;
@@ -1274,7 +1273,7 @@ static int ffa_notify_request(struct ffa_device *dev, bool is_per_vcpu,
 		return rc;
 	}
 
-	rc = update_notifier_cb(notify_id, type, cb, cb_data, true);
+	rc = update_notifier_cb(dev, notify_id, cb, cb_data, true);
 	if (rc) {
 		pr_err("Failed to register callback for %d - %d\n",
 		       notify_id, rc);

-- 
2.34.1


