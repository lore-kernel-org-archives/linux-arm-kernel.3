Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46276D3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwLUtlz0X+H+B4hbv9ZwbAB8pJpnt/HsCsdayi2XrwM=; b=CkHKu+QrPSwdJcvKIwZR6XAfQZ
	P/7YCFUDGloQsonyhLL0c6vybV/odPHtfFBFbnHUbjK8f9p8TzM5Zea9S6Sz1UKiqivyBXkw6lYmr
	bhfHXEVtdaJp/KbpqfVh4EVvHaDu13Fp7sINNkcnlxuE4lKMYI/CT2IulNYDCguZ7uvybu51+gAeg
	PB5Vj8a+O5OUrX19NDxkLw0Ww7Ni03xshP40yV+pIB7Vxpz+gI2ZZoMtXkZyAxXKg81IDg7yD1mPZ
	4xog1Mlww/wEkCf9ylQeo+xXdokgMKaXqnexlhy1e3BK9GHVADymDhmHDknYGWW12bVhQRL4K/+BK
	deB/2kuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWA8-00000007i7Q-24VF;
	Mon, 25 Nov 2024 10:17:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVm4-00000007ehe-2Vtm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:52:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D0E1756;
	Mon, 25 Nov 2024 01:53:26 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 462103F5A1;
	Mon, 25 Nov 2024 01:52:55 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH 1/3] firmware/arm_ffa: change ffa_device_register()'s parameters and return
Date: Mon, 25 Nov 2024 09:52:49 +0000
Message-Id: <20241125095251.366866-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125095251.366866-1-yeoreum.yun@arm.com>
References: <20241125095251.366866-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_015256_725440_25B7A2BA 
X-CRM114-Status: GOOD (  13.99  )
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

From: Levi Yun <yeoreum.yun@arm.com>

Currently, ffa_dev->properties is set after ffa_device_register() in
ffa_setup_partitions().
This means it couldn't validate partition's properties
while probing ffa_device.

Change parameter of ffa_device_register() to receive ffa_partition_info
so that before device_register(), ffa_device->properties can be setup
and any other data.

Also, change return value of ffa_device_register() from NULL to ERR_PTR
so that it passes error code.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/arm_ffa/bus.c    | 22 +++++++++++++++-------
 drivers/firmware/arm_ffa/driver.c | 12 ++++--------
 include/linux/arm_ffa.h           | 12 ++++++++----
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index eb17d03b66fe..95c0e9518556 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -38,6 +38,7 @@ static int ffa_device_match(struct device *dev, const struct device_driver *drv)
 
 		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
 			return 1;
+
 		id_table++;
 	}
 
@@ -187,21 +188,26 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev)
 	return valid;
 }
 
-struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
-				       const struct ffa_ops *ops)
+struct ffa_device *ffa_device_register(
+		const struct ffa_partition_info *part_info,
+		const struct ffa_ops *ops)
 {
 	int id, ret;
+	uuid_t uuid;
 	struct device *dev;
 	struct ffa_device *ffa_dev;
 
+	if (!part_info)
+		return ERR_PTR(-EINVAL);
+
 	id = ida_alloc_min(&ffa_bus_id, 1, GFP_KERNEL);
 	if (id < 0)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ffa_dev = kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
 	if (!ffa_dev) {
 		ida_free(&ffa_bus_id, id);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	dev = &ffa_dev->dev;
@@ -210,16 +216,18 @@ struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
 	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
 
 	ffa_dev->id = id;
-	ffa_dev->vm_id = vm_id;
+	ffa_dev->vm_id = part_info->id;
+	ffa_dev->properties = part_info->properties;
 	ffa_dev->ops = ops;
-	uuid_copy(&ffa_dev->uuid, uuid);
+	import_uuid(&uuid, (u8 *)part_info->uuid);
+	uuid_copy(&ffa_dev->uuid, &uuid);
 
 	ret = device_register(&ffa_dev->dev);
 	if (ret) {
 		dev_err(dev, "unable to register device %s err=%d\n",
 			dev_name(dev), ret);
 		put_device(dev);
-		return NULL;
+		return ERR_PTR(ret);
 	}
 
 	return ffa_dev;
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b14cbdae94e8..a3a9cdec7389 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1406,23 +1406,19 @@ static int ffa_setup_partitions(void)
 
 	xa_init(&drv_info->partition_info);
 	for (idx = 0, tpbuf = pbuf; idx < count; idx++, tpbuf++) {
-		import_uuid(&uuid, (u8 *)tpbuf->uuid);
-
 		/* Note that if the UUID will be uuid_null, that will require
 		 * ffa_bus_notifier() to find the UUID of this partition id
 		 * with help of ffa_device_match_uuid(). FF-A v1.1 and above
 		 * provides UUID here for each partition as part of the
 		 * discovery API and the same is passed.
 		 */
-		ffa_dev = ffa_device_register(&uuid, tpbuf->id, &ffa_drv_ops);
-		if (!ffa_dev) {
-			pr_err("%s: failed to register partition ID 0x%x\n",
-			       __func__, tpbuf->id);
+		ffa_dev = ffa_device_register(tpbuf, &ffa_drv_ops);
+		if (IS_ERR_OR_NULL(ffa_dev)) {
+			pr_err("%s: failed to register partition ID 0x%x, error %ld\n",
+			       __func__, tpbuf->id, PTR_ERR(ffa_dev));
 			continue;
 		}
 
-		ffa_dev->properties = tpbuf->properties;
-
 		if (drv_info->version > FFA_VERSION_1_0 &&
 		    !(tpbuf->properties & FFA_PARTITION_AARCH64_EXEC))
 			ffa_mode_32bit_set(ffa_dev);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index a28e2a6a13d0..3fb9c7a3453b 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -166,9 +166,12 @@ static inline void *ffa_dev_get_drvdata(struct ffa_device *fdev)
 	return dev_get_drvdata(&fdev->dev);
 }
 
+struct ffa_partition_info;
+
 #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
-struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
-				       const struct ffa_ops *ops);
+struct ffa_device *ffa_device_register(
+		const struct ffa_partition_info *part_info,
+		const struct ffa_ops *ops);
 void ffa_device_unregister(struct ffa_device *ffa_dev);
 int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
 			const char *mod_name);
@@ -177,8 +180,9 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev);
 
 #else
 static inline
-struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
-				       const struct ffa_ops *ops)
+struct ffa_device *ffa_device_register(
+		const struct ffa_partition_info *part_info,
+		const struct ffa_ops *ops)
 {
 	return NULL;
 }
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


