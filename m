Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BDCC02193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VagP84b1B3/WOGdRo61p825pQSxCX8wDZUEy5peJt8w=; b=d1SANoVdagwuzsMaktzirBiLKF
	a+gh3O4F1QAa8D36Lp176BeG8YO2O9V+NxZATSTBWIuENW0jn5V03fsseppACxl5YB9ZjBvvo5/F0
	p9kr9muEzlrw8M/0IYsxzh5UMzL8zgw6kY0LIL8jJ1Nr0iKthkaKsNCmezl51lx9VaErm10ZOquqv
	QuyCnDShjS9KtjaYKG3+361J3Ij4n57VvjGFQKACiHsRODbiZ8pg4ODkyAIU8W5XG/UJJ8Ke+P+TB
	zN++6LDfUz3dnS8kOVeMVsxP5LHBokDOWZTNs7mHbpWxIXB5k2BcG3oevw2wPFDt6YJDTqLzITJ5q
	zqEUOepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpXN-0000000AY6s-1xcO;
	Fri, 31 Jan 2025 11:50:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp9I-0000000ATpA-44fz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D274497;
	Fri, 31 Jan 2025 03:25:50 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 188DB3F63F;
	Fri, 31 Jan 2025 03:25:23 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:18 +0000
Subject: [PATCH v2 18/18] firmware: arm_ffa: Allow multiple UUIDs per
 partition to register SRI callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-18-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8199; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=DhLeAPsZXmTLsWlQfRK5k/9Vj553i3U944841job/Ac=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMR4nDFKrZ1L7cAhNYpD5SLshn8MwGEZmMw7
 opryuiluZGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEQAKCRAAQbq8MX7i
 mA0rD/sFc/Jpprn1nw3Nk+1Y7K89S4Hb8c5bGnT4boiSq4ayK38jXfQ37kKDbrmP+UKMsgBRMo1
 IiNhjPDKllip9Mfi2x9LoPu6/NmFeqgKQIg0qxXwKx7Irfu9uf7eS/qsScWMF3PmOWG8FpLucEf
 kfAfCceAeK2Q2mZ2isgkRuas4TctOsGXd6F4V/Y0CrTeSZ7P/MK1xOsWj2bb+FYkc4FlxTbXsqj
 1XyU8gem4c5ssmxC6DO7NWvrRjsJ3CJCs2BS05nxW8vGr5uTCwcUBHmjQm2IXqp2dh0S5q6cTNd
 1BzMUKuXIoVv9Ip3NGzIjVoY/H5g9iEAuQCg5CfudTUBf299K4449cXIH83j2TcLP9kdQB4aSe/
 vxnGP4X06I+54jR/uhKgcWFx0GAhNWB9r0yiOYjdGl5sbQdvMG34AGS4c+hVEljJ5BWaOPaHU2t
 WgrBBoGUHZeDp6joL03a71W9c9rNmEsi5voAJpqDNi6Md3Sl6yOsjiVZFjesW27jsSpUVWWxFx5
 K3qEc+q9poyBoqd4f6mQV1z/10z5ejy7VsvcT2loe+mWxW9vM7plCkrvlgbWRkQ3uX6I0X3oaxq
 l89Iw+7P0SCKo5M75+VYN+L9yUIf5RHUKDpoXfmlmqxuQRYlifxx/GlrQPIBEW1YjZ0haijx4Kb
 KWEAMa1PVCzeo/Q==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032525_107139_EDBC500B 
X-CRM114-Status: GOOD (  21.85  )
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

A partition can implement multiple UUIDs and currently we successfully
register each UUID service as a FF-A device. However when adding the
same partition info to the XArray which tracks the SRI callbacks more
than once, it fails.

In order to allow multiple UUIDs per partition to register SRI callbacks
the partition information stored in the XArray needs to be extended to
a listed list.

A function to remove the list of partition information in the XArray
is not added as there are no users at the time. All the partitions are
added at probe/initialisation and removed at cleanup stage.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 157 ++++++++++++++++++++++++++++----------
 1 file changed, 116 insertions(+), 41 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index ab50836adc75ab4bdab3c2da7e23ec5d11826e8b..3c49ab3fe11861f5704ad92655705591bf0d2ee1 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -925,27 +925,32 @@ struct ffa_dev_part_info {
 	ffa_sched_recv_cb callback;
 	void *cb_data;
 	rwlock_t rw_lock;
+	struct ffa_device *dev;
+	struct list_head node;
 };
 
 static void __do_sched_recv_cb(u16 part_id, u16 vcpu, bool is_per_vcpu)
 {
-	struct ffa_dev_part_info *partition;
+	struct ffa_dev_part_info *partition = NULL, *tmp;
 	ffa_sched_recv_cb callback;
+	struct list_head *phead;
 	void *cb_data;
 
-	partition = xa_load(&drv_info->partition_info, part_id);
-	if (!partition) {
+	phead = xa_load(&drv_info->partition_info, part_id);
+	if (!phead) {
 		pr_err("%s: Invalid partition ID 0x%x\n", __func__, part_id);
 		return;
 	}
 
-	read_lock(&partition->rw_lock);
-	callback = partition->callback;
-	cb_data = partition->cb_data;
-	read_unlock(&partition->rw_lock);
+	list_for_each_entry_safe(partition, tmp, phead, node) {
+		read_lock(&partition->rw_lock);
+		callback = partition->callback;
+		cb_data = partition->cb_data;
+		read_unlock(&partition->rw_lock);
 
-	if (callback)
-		callback(vcpu, is_per_vcpu, cb_data);
+		if (callback)
+			callback(vcpu, is_per_vcpu, cb_data);
+	}
 }
 
 static void ffa_notification_info_get(void)
@@ -1123,18 +1128,29 @@ struct notifier_cb_info {
 	void *cb_data;
 };
 
-static int ffa_sched_recv_cb_update(u16 part_id, ffa_sched_recv_cb callback,
-				    void *cb_data, bool is_registration)
+static int
+ffa_sched_recv_cb_update(struct ffa_device *dev, ffa_sched_recv_cb callback,
+			 void *cb_data, bool is_registration)
 {
-	struct ffa_dev_part_info *partition;
+	struct ffa_dev_part_info *partition = NULL, *tmp;
+	struct list_head *phead;
 	bool cb_valid;
 
 	if (ffa_notifications_disabled())
 		return -EOPNOTSUPP;
 
-	partition = xa_load(&drv_info->partition_info, part_id);
+	phead = xa_load(&drv_info->partition_info, dev->vm_id);
+	if (!phead) {
+		pr_err("%s: Invalid partition ID 0x%x\n", __func__, dev->vm_id);
+		return -EINVAL;
+	}
+
+	list_for_each_entry_safe(partition, tmp, phead, node)
+		if (partition->dev == dev)
+			break;
+
 	if (!partition) {
-		pr_err("%s: Invalid partition ID 0x%x\n", __func__, part_id);
+		pr_err("%s: No such partition ID 0x%x\n", __func__, dev->vm_id);
 		return -EINVAL;
 	}
 
@@ -1156,12 +1172,12 @@ static int ffa_sched_recv_cb_update(u16 part_id, ffa_sched_recv_cb callback,
 static int ffa_sched_recv_cb_register(struct ffa_device *dev,
 				      ffa_sched_recv_cb cb, void *cb_data)
 {
-	return ffa_sched_recv_cb_update(dev->vm_id, cb, cb_data, true);
+	return ffa_sched_recv_cb_update(dev, cb, cb_data, true);
 }
 
 static int ffa_sched_recv_cb_unregister(struct ffa_device *dev)
 {
-	return ffa_sched_recv_cb_update(dev->vm_id, NULL, NULL, false);
+	return ffa_sched_recv_cb_update(dev, NULL, NULL, false);
 }
 
 static int ffa_notification_bind(u16 dst_id, u64 bitmap, u32 flags)
@@ -1548,37 +1564,101 @@ static struct notifier_block ffa_bus_nb = {
 	.notifier_call = ffa_bus_notifier,
 };
 
-static int ffa_xa_add_partition_info(int vm_id)
+static int ffa_xa_add_partition_info(struct ffa_device *dev)
 {
 	struct ffa_dev_part_info *info;
-	int ret;
+	struct list_head *head, *phead;
+	int ret = -ENOMEM;
+
+	phead = xa_load(&drv_info->partition_info, dev->vm_id);
+	if (phead) {
+		head = phead;
+		list_for_each_entry(info, head, node) {
+			if (info->dev == dev) {
+				pr_err("%s: duplicate dev %p part ID 0x%x\n",
+				       __func__, dev, dev->vm_id);
+				return -EEXIST;
+			}
+		}
+	}
 
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
-		return -ENOMEM;
+		return ret;
 
 	rwlock_init(&info->rw_lock);
-	ret = xa_insert(&drv_info->partition_info, vm_id, info, GFP_KERNEL);
-	if (ret) {
-		pr_err("%s: failed to save partition ID 0x%x - ret:%d. Abort.\n",
-		       __func__, vm_id, ret);
-		kfree(info);
+	info->dev = dev;
+
+	if (!phead) {
+		phead = kzalloc(sizeof(*phead), GFP_KERNEL);
+		if (!phead)
+			goto free_out;
+
+		INIT_LIST_HEAD(phead);
+
+		ret = xa_insert(&drv_info->partition_info, dev->vm_id, phead,
+				GFP_KERNEL);
+		if (ret) {
+			pr_err("%s: failed to save part ID 0x%x Ret:%d\n",
+			       __func__, dev->vm_id, ret);
+			goto free_out;
+		}
+	}
+	list_add(&info->node, phead);
+	return 0;
+
+free_out:
+	kfree(phead);
+	kfree(info);
+	return ret;
+}
+
+static int ffa_setup_host_partition(int vm_id)
+{
+	struct ffa_partition_info buf = { 0 };
+	struct ffa_device *ffa_dev;
+	int ret;
+
+	buf.id = vm_id;
+	ffa_dev = ffa_device_register(&buf, &ffa_drv_ops);
+	if (!ffa_dev) {
+		pr_err("%s: failed to register host partition ID 0x%x\n",
+		       __func__, vm_id);
+		return -EINVAL;
 	}
 
+	ret = ffa_xa_add_partition_info(ffa_dev);
+	if (ret)
+		return ret;
+
+	if (ffa_notifications_disabled())
+		return 0;
+
+	ret = ffa_sched_recv_cb_update(ffa_dev, ffa_self_notif_handle,
+				       drv_info, true);
+	if (ret)
+		pr_info("Failed to register driver sched callback %d\n", ret);
+
 	return ret;
 }
 
 static void ffa_partitions_cleanup(void)
 {
-	struct ffa_dev_part_info *info;
+	struct ffa_dev_part_info *info, *tmp;
 	unsigned long idx;
 
 	/* Clean up/free all registered devices */
 	ffa_devices_unregister();
 
 	xa_for_each(&drv_info->partition_info, idx, info) {
+		struct list_head *phead = (struct list_head *)idx;
+
 		xa_erase(&drv_info->partition_info, idx);
-		kfree(info);
+		list_for_each_entry_safe(info, tmp, phead, node) {
+			list_del(&info->node);
+			kfree(info);
+		}
+		kfree(phead);
 	}
 
 	xa_destroy(&drv_info->partition_info);
@@ -1621,7 +1701,7 @@ static int ffa_setup_partitions(void)
 		    !(tpbuf->properties & FFA_PARTITION_AARCH64_EXEC))
 			ffa_mode_32bit_set(ffa_dev);
 
-		if (ffa_xa_add_partition_info(ffa_dev->vm_id)) {
+		if (ffa_xa_add_partition_info(ffa_dev)) {
 			ffa_device_unregister(ffa_dev);
 			continue;
 		}
@@ -1630,12 +1710,16 @@ static int ffa_setup_partitions(void)
 
 	kfree(pbuf);
 
-	/* Check if the host is already added as part of partition info */
+	/*
+	 * Check if the host is already added as part of partition info
+	 * No multiple UUID possible for the host, so just checking if
+	 * there is an entry will suffice
+	 */
 	if (xa_load(&drv_info->partition_info, drv_info->vm_id))
 		return 0;
 
 	/* Allocate for the host */
-	ret = ffa_xa_add_partition_info(drv_info->vm_id);
+	ret = ffa_setup_host_partition(drv_info->vm_id);
 	if (ret)
 		ffa_partitions_cleanup();
 
@@ -1944,19 +2028,10 @@ static int __init ffa_init(void)
 	ffa_notifications_setup();
 
 	ret = ffa_setup_partitions();
-	if (ret) {
-		pr_err("failed to setup partitions\n");
-		goto cleanup_notifs;
-	}
-
-	ret = ffa_sched_recv_cb_update(drv_info->vm_id, ffa_self_notif_handle,
-				       drv_info, true);
-	if (ret)
-		pr_info("Failed to register driver sched callback %d\n", ret);
-
-	return 0;
+	if (!ret)
+		return ret;
 
-cleanup_notifs:
+	pr_err("failed to setup partitions\n");
 	ffa_notifications_cleanup();
 free_pages:
 	if (drv_info->tx_buffer)

-- 
2.34.1


