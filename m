Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8345C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBXpU0D8pq0jWUN+QTzkLXNljq9YczofYT2tGDbBbdg=; b=MInGgtg9P/xdw4K6rwJro/9v60
	TWqIRsdMuUQ8pn0tSQu9nCNaPdZRsp2trKuHtIHIyorTCEIBMvKGB9HMCkgIblPcOfCL4u810dqk3
	5G6tENF6M8krp+DSaenGkFaTGxKvzsEbNKhVLqykTZeEWOsaL6+2C6+rW4cIJ8iCY7tR1lvimKn0U
	FA6go3gF/nwoq8RMVx+8bKU9qTr6Pv6gtddjXdauqkUaMkyeEeFwFNiWA0f2D3ZFtw2JOSMryyuwe
	sU+OFY+qVGT0S8+uKcuoGNdsIGnlO5/au5w94BN4KPGOop+uhEuZndgHg7k6cEhbUuxEZGlXZYuKw
	EpV9Tg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3h4-00000005DIv-0HYa;
	Mon, 17 Feb 2025 16:10:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Dk-000000055XP-1iAF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6731D1063;
	Mon, 17 Feb 2025 07:40:03 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 832F23F6A8;
	Mon, 17 Feb 2025 07:39:43 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:56 +0000
Subject: [PATCH v3 15/19] firmware: arm_ffa: Stash ffa_device instead of
 notify_type in notifier_cb_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-15-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3541; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=a+m7Jcn3/5rOXkUlDE7zE4WFeovCOPzxO6ncEsdu46s=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gvxHscpAJVylxg3E1rCxo/gAykEC9AxaQ4z
 GS5AInoSeWJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLwAKCRAAQbq8MX7i
 mMhtEACupYnhbABfRgAxOCIJthXbvk3V50VSPi3g8KQTIZwbypXqE5qWfBx+h9MM3j0AhJo1wzL
 e5Uw2G6k4bf+hh/X15ck5WKRLvsRALiDAhJo/PDd+g7/MD0zpFqcziJf9MLbA1zjXmydB0D9YKn
 AKFFDVh66J4BMHNKgJggC7xM+VjL3ipmixLruOX1UBENUkQY6rxwYl5bJ4/LAeFHXNWh85XYi5t
 BDyxdKci1QqmWhL9dq09vjytFTIsX/AvdmLe0BsrA8aytCfoqgZVICkcdKELQvYlJQuXogiYusO
 0iPApcNZ21A37xIYxJbl6xnUhmREDtDYFhkqR5rD8Jjl2MkzyWdLYLs9GmrenFJBs7BGovb/WQu
 kYNYR86C/LL6ZKAbzzKrnmOiw0WKcf8460R4w+ZXEfVWHmecC0i2PZH/A9/2uoxZJF2vONc7Tbi
 pYLJl8HkqkFQk68aoTBqPsPbnhqQ0GTHKp6sGC4MILHZQaGhPF/LJWPbtqJ9R91NFXgB/5AWvoC
 jBnTao4tfQNep8mYTZhP6JJIH0yuj+FEXyJWYinL5WO/9NrVXI9uqLqJz3Rmqs/KwLK3aMPWerE
 LGvP7b5hQQQ/I4ofvKzn8c7SQnPfSOI/fE0170p35Pd22j2K0ZfuXjUEEeUo95D3UzcWrlPcGHb
 cQ8bhRJuIEgOZzg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073944_602393_37AF1529 
X-CRM114-Status: GOOD (  12.38  )
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

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 0abbf08bc8d39c701947366bdf9c8fac8e64cf64..5863272f45d9c075d8e86d45a90ac6b1fb743c98 100644
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


