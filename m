Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC6CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ldEvxm++ErwgHwnpJt3Ghq4YXVW+8w1frETmAkJhv0=; b=Xo5B0tpuVJiJbCL3FkJ2XtV+D6
	uqZ5mcBUvbLFMibZwpoX8C6EU+/MA77HfBW58gEsiOUyn/CUs8xE3FBlV2WOcsSyk/VrnV23I3QTg
	jpUZJ5IpGPe9moahbsK9JMBvq6ESIDpoQOwg2c8VWbiTmhQHbncy5ONwoi5yhaquwLa2+acE/qlae
	Aw4WagDSYmYq0c3ZAnIbRFGMiujkm3YWjHRKyg1p7pXKuGUYMTk2FBh9H+s0eEYIHkScvSK8HhcJE
	LUDCa0sPs8BFzRmGqFJ3hPnq38ei3oAG0pqCqKhmpGMeLmbv9sbNeXH/Todvk01PXwGKMT0FJWpTd
	stJpww8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3U7-00000005ARC-2TPq;
	Mon, 17 Feb 2025 15:56:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Db-000000055Y5-0tx3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E9F0176C;
	Mon, 17 Feb 2025 07:39:54 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A9BD3F6A8;
	Mon, 17 Feb 2025 07:39:34 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:47 +0000
Subject: [PATCH v3 06/19] firmware: arm_ffa: Refactor addition of partition
 information into XArray
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-6-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=0rtRvJYON+bBWGuI7xH2qiK+GlnT4NIkX7bmwfVc55I=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1guRY129t9hXimLHH74gX733HjYK1vFoEV4y
 d/024VfviOJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLgAKCRAAQbq8MX7i
 mMHKEADOvrF2of7ReK/hGLkBM+iIObw4IIA0HmrXAFytlxoBicuIytplDbeoHH79vLASlI/rxRH
 RpQTqCpnksJoCYpvbxG5VdmoT8OyNFcXiqqk8VefIf12hdJ0Gk9aeFcBPFTS+S+hNoyWfIxG6bD
 R14rbzRMW5EdcHjMfF6WmMDtwD/3O30WKnPI/lwPXnEXybXM+Xk3mluoLJqRZ7JuoaHXw2Fck+S
 nUhpNqofZpD7ZRh0iSEIjh7huhnndAtmBLnspDBZc3Jam1E4IXpBOup8J28856MA8tla1GY4E+3
 34W01AUozEa4nBRE3i0C9cuoBBvdDso8ttYfyRgp8DJAnULg+pBO4474v8gpa8sOYRdreg9Ld7n
 brF9PGKN7J/BPecen8nTeHDH6c58ZgNFz0IB157P8VPM48IaFMUEUgBeZ1/DBc7Ddsf8Xi0Wq91
 oEmJzoHf8T54WGQVu+W5YRt8LXwAMiI4Q954zF9R/n8OBducc+4U93WwIlDsO54/yUE5iEaP4sK
 saT4p2yXQ4CEVCnFiB40T2QEJIQpCDsgBkLKjtUQn96d+3iz/ZNiidEpQy1ZMiCMacwpWSlWqTF
 dZh7pbCu/nGirN5ZNj1pHcTL1y5SSY2jZXPfuLG/Vuo862zQztTYD+CyIgruVdY3PEnj14lP0+P
 Fs8G1PXRgcaYCBw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073935_412634_592CA29B 
X-CRM114-Status: GOOD (  13.25  )
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

From: Viresh Kumar <viresh.kumar@linaro.org>

Move the common code handling addition of the FF-A partition information
into the XArray as a new routine. No functional change.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 47 ++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 87e106c728b89f3ce7c11219cf7cad9cc166dda2..2994b5ee63bc7feafc15e535cf8a2d46e6003968 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1423,11 +1423,30 @@ static struct notifier_block ffa_bus_nb = {
 	.notifier_call = ffa_bus_notifier,
 };
 
+static int ffa_xa_add_partition_info(int vm_id)
+{
+	struct ffa_dev_part_info *info;
+	int ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	rwlock_init(&info->rw_lock);
+	ret = xa_insert(&drv_info->partition_info, vm_id, info, GFP_KERNEL);
+	if (ret) {
+		pr_err("%s: failed to save partition ID 0x%x - ret:%d. Abort.\n",
+		       __func__, vm_id, ret);
+		kfree(info);
+	}
+
+	return ret;
+}
+
 static int ffa_setup_partitions(void)
 {
 	int count, idx, ret;
 	struct ffa_device *ffa_dev;
-	struct ffa_dev_part_info *info;
 	struct ffa_partition_info *pbuf, *tpbuf;
 
 	if (drv_info->version == FFA_VERSION_1_0) {
@@ -1461,39 +1480,17 @@ static int ffa_setup_partitions(void)
 		    !(tpbuf->properties & FFA_PARTITION_AARCH64_EXEC))
 			ffa_mode_32bit_set(ffa_dev);
 
-		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info) {
+		if (ffa_xa_add_partition_info(ffa_dev->vm_id)) {
 			ffa_device_unregister(ffa_dev);
 			continue;
 		}
-		rwlock_init(&info->rw_lock);
-		ret = xa_insert(&drv_info->partition_info, tpbuf->id,
-				info, GFP_KERNEL);
-		if (ret) {
-			pr_err("%s: failed to save partition ID 0x%x - ret:%d\n",
-			       __func__, tpbuf->id, ret);
-			ffa_device_unregister(ffa_dev);
-			kfree(info);
-		}
 	}
 
 	kfree(pbuf);
 
 	/* Allocate for the host */
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
-	if (!info) {
-		/* Already registered devices are freed on bus_exit */
-		ffa_partitions_cleanup();
-		return -ENOMEM;
-	}
-
-	rwlock_init(&info->rw_lock);
-	ret = xa_insert(&drv_info->partition_info, drv_info->vm_id,
-			info, GFP_KERNEL);
+	ret = ffa_xa_add_partition_info(drv_info->vm_id);
 	if (ret) {
-		pr_err("%s: failed to save Host partition ID 0x%x - ret:%d. Abort.\n",
-		       __func__, drv_info->vm_id, ret);
-		kfree(info);
 		/* Already registered devices are freed on bus_exit */
 		ffa_partitions_cleanup();
 	}

-- 
2.34.1


