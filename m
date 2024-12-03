Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591F9E69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRs3Uqt0xNzOZNfdHdGtnIdlq1S8C6k7CsoyaEkneXM=; b=wn9vjshEGrCnZFKC/fGHopNKZr
	TIm89rZmvITgUtzFRvbjbb9vIY91XlNRaVy5wRPDseV8SLFiEDKrlDPCrzkPgcX7dsUEXHv0iKkIz
	3JSbeb0uQOA3wNX4sd8NAJzKvNWP6Bs9AHZ315LKUBuxUrmW8FHO0XG8GMrcvJyEsJo0VmjD5iG8u
	4Lglp50Te1+bzvKZ7u0kh5+5fNQLsX2js/jD3mtF3eqrmb8i0RaphtK8R/FUFanhj57WKpI9NK48f
	O82ddJECELjzSb1Bd5aC4dp7HnEHwVGAowsSf76oSeMp0quFl7O5Xy3xQDoBBT+PcEsMRLE5RgM1F
	Tu06nOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIV45-00000009ylu-44pb;
	Tue, 03 Dec 2024 15:43:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITvm-00000009mel-16Wq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 14:31:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65FF7143D;
	Tue,  3 Dec 2024 06:31:41 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8BA433F71E;
	Tue,  3 Dec 2024 06:31:12 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: sudeep.holla@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 1/2] firmware/arm_ffa: change ffa_device_register()'s parameters and return
Date: Tue,  3 Dec 2024 14:31:08 +0000
Message-Id: <20241203143109.1030514-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203143109.1030514-1-yeoreum.yun@arm.com>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_063114_389662_5E667DF2 
X-CRM114-Status: GOOD (  13.50  )
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
 drivers/firmware/arm_ffa/bus.c    | 15 +++++++++++----
 drivers/firmware/arm_ffa/driver.c |  7 +------
 include/linux/arm_ffa.h           | 12 ++++++++----
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index eb17d03b66fe..a4ab6d14afef 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -187,13 +187,18 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev)
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
+		return NULL;
+
 	id = ida_alloc_min(&ffa_bus_id, 1, GFP_KERNEL);
 	if (id < 0)
 		return NULL;
@@ -210,9 +215,11 @@ struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id,
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
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b14cbdae94e8..2c2ec3c35f15 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1387,7 +1387,6 @@ static struct notifier_block ffa_bus_nb = {
 static int ffa_setup_partitions(void)
 {
 	int count, idx, ret;
-	uuid_t uuid;
 	struct ffa_device *ffa_dev;
 	struct ffa_dev_part_info *info;
 	struct ffa_partition_info *pbuf, *tpbuf;
@@ -1406,23 +1405,19 @@ static int ffa_setup_partitions(void)
 
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
+		ffa_dev = ffa_device_register(tpbuf, &ffa_drv_ops);
 		if (!ffa_dev) {
 			pr_err("%s: failed to register partition ID 0x%x\n",
 			       __func__, tpbuf->id);
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


