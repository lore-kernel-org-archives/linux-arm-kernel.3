Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28110C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb8Ch2o/C1+/8OFb2fziJnkIwhTZQBpHxWQly4R1jGY=; b=cv/dvbpc6+rcwQ8UaVOrhJfirS
	FMHLsPoz7L/3X9EfK96zzww26T0ht7OT2UKz9V8JUDYMnP7ghY3At7iZF4dlxXx9JHRtm7ap15fWC
	yYvgP9Gt9o2aODa0s3djo/GpXqQZcmhn3LCiOKg3DyXG+f8oalFGDzIkUJ+8kDgx7FCcRzW3D5iaf
	rtrEvRG4stl1YYIPKGrKt6TNoHD1mvf3LT4Zh5qpJYg4Rol6JNgQE/oFBQVHK4M0r2ZbPk2atuD7t
	DTYUpWlR9jcysoP/929moWpgSHW43Q6RArrdLngf8d6+I4876PGWuCf95V1/PR3J76+pzQzPU5wzD
	VZnV9nMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpI3-0000000AWBS-2oYb;
	Fri, 31 Jan 2025 11:34:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp96-0000000ATpA-2z2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7ABD497;
	Fri, 31 Jan 2025 03:25:37 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2F463F63F;
	Fri, 31 Jan 2025 03:25:11 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:06 +0000
Subject: [PATCH v2 06/18] firmware: arm_ffa: Refactor addition of partition
 information into XArray
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-6-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2741; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=nhubqO1qEmc8fhsAz3PI0VU0iirPJL57lKmAlJbAdIM=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQMImWsaOOj6QlbeWqTk6hdTAkKzs79VXh5
 ffUESKoX1CJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mN3/D/4iY7ODMH0FWbCMqW9yhcba9bnW+pM4y51fofubRlEBD0wl+NV8fbKV9THg618PuAcCuZx
 SjFc/8M+sPpTGkxjyxwz442jGSV7gcyqFgmkIS+t9wmEifZy2cmZ5F2xAkGTrTTrDDl6gUxhKm5
 nCdtDI9O6nEqkpFrWBwV+GQm9TtcBbqxAjk45r3/sMZeWGHN47AkpeCYHdTVU/iEUrYHD8dH9ht
 Q8yj2FwDZMU+uIR6140Dujw3paLj0XbouGtvhWKn/fPHMm7A+t5Xta7rQzagraonuGBOV5Uv5WV
 m74NJRnbMewlmoBk3Jp8ao+TLK+bD2o3ZrslEE4M9WLbjchGWA0wBdfDRZgpDtNFJcXCvwPMpEg
 30evia28Fqsu4Xq0y/PP10sOUhaH648zm8d2uOvKYNGMLNwpKKJ2wjMl1aNOmQSKg6Jb/CIoeTg
 WDcF8cK3H6qzMqt+YL6+84rSFrRVorxwYfkpbu2oNCed86e2ATX/XW1d0za1s+2euyX/sZ4Y/P9
 sJ1ZmFuzj3iLB1h0E3IgFZX7B62ci0cc49oGsTd8uxEbMYwV8gT8T+HUPnfnHPkhJQXPX4Kuh9L
 t8FFKhYOSPTh9nwzFWXFDXCcS8Ef7pXkAm+uMwB9H/Zp209UUEviSsgQAW2nfixhHVqwRWdAbXN
 q7Zl0xvCyeP11WQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032512_881457_2F9E397A 
X-CRM114-Status: GOOD (  13.33  )
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
 drivers/firmware/arm_ffa/driver.c | 48 +++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 87e106c728b89f3ce7c11219cf7cad9cc166dda2..67d5be261d83633805c81dd84fdfc2b5c702f3ca 100644
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
@@ -1461,39 +1480,18 @@ static int ffa_setup_partitions(void)
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
+
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


