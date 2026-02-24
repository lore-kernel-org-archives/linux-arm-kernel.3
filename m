Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F56E9B249
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2LJc1CU5nrbR4xIbgo6vBxCXH9MRUJuYA+4VpRccm2A=; b=zKp63rMh0M8xBz0+cM1hp2p8Sx
	6IOPkxQuCqOgAwDzczB45fj/i+9fTY9v36nU89sKrIingO7Aakaw1+LqGdN1W85Gr2FA2TZQ3tiL1
	+geSaTKpepUN6bvpKGhGbMuR6hTlB3LXlxNzDnQk/vKoTKv7M6i38wunkzo01uNxFQyvfy24vJVgX
	U21sPgn2k7QDc/uZqFedNWte3PKN/T+YOc6kKgYz2KaReEGrVbJrKacArHVHn8FPHkk4Vo1UC7+kS
	dEG+JH+Bx7ApLfYDGy+hBfEKxoGzrVYyZUewAX5Mp7ml4X9vyXbrev2IwQALTrZVTZsPs9FkWYonI
	8BskMEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq5f-00000001tTO-1bWZ;
	Tue, 24 Feb 2026 10:56:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq5c-00000001tT1-204u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:56:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69464339;
	Tue, 24 Feb 2026 02:56:19 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6833F62B;
	Tue, 24 Feb 2026 02:56:24 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 24 Feb 2026 10:56:14 +0000
Subject: [PATCH] coresight: cti: Move resource release to cti_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-arm_coresight_refactor_cti_resource_release-v1-1-ff1b2bca9176@arm.com>
X-B4-Tracking: v=1; b=H4sIAM2DnWkC/x3N4QrCMAwE4FcZ+W1hy4qgryJSapptAV0lqSKMv
 fuC/+6D424DYxU2uHYbKH/FpK6O4dQBLXmdOUhxA/Z47hFjyPpKVJVN5qUl5SlTq5qoicPqR4k
 9PDkbB4zl8igcp2Ek8MW31+X3f7vd9/0AULpV7n0AAAA=
X-Change-ID: 20260224-arm_coresight_refactor_cti_resource_release-24d9bde4f13c
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771930584; l=3982;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=x2UNo1Ahc2P9zL9ZXowIXwNJ1dEqdP4UyKQYNY7EWio=;
 b=dKgC6sGwk/M++VUvdXC1wOwe/HRJs3PEewEPQNcr3HNk9GWpOid0lJv7BKTu9U4q0G+4iqrrq
 ZgXAhnvNj0YBNH3rrsH7CXqZYjCpW1hYV1//6NxuhT06hrNllujDf4Y
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_025628_622219_519ABA59 
X-CRM114-Status: GOOD (  15.08  )
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

Currently, CTI driver releases resource by deferring
cti_device_release() to the device unregistration:

  cti_remove()
   `> coresight_unregister()
       `> cti_remove_assoc_from_csdev()
       `> device_unregister()
           `> cti_device_release()
               `> mutex_lock(&ect_mutex)
               `> release CTI resource
               `> mutex_unlock(&ect_mutex)

In the above flow, two different CTI release callbacks are involved:
cti_remove_assoc_from_csdev() and cti_device_release().  The former is
used by a CoreSight device to unbind its associated CTI helper device,
while the latter releases resources for the CTI device itself.  Since
there is no dependency between them, it is unnecessary to defer the CTI
resource release until device unregistration.

This commit releases the resources directly in cti_remove() and remove
the injected release callback.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 24 +++---------------------
 drivers/hwtracing/coresight/coresight-cti.h      |  2 --
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index bfbc365bb2ef2744efab11c056b8450472957005..7a8f1ef6b94e8ab3363ea62db95b0bc302292cd7 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -823,16 +823,13 @@ static const struct coresight_ops cti_ops = {
 	.helper_ops = &cti_ops_ect,
 };
 
-/*
- * Free up CTI specific resources
- * called by dev->release, need to call down to underlying csdev release.
- */
-static void cti_device_release(struct device *dev)
+static void cti_remove(struct amba_device *adev)
 {
-	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cti_drvdata *drvdata = dev_get_drvdata(&adev->dev);
 	struct cti_drvdata *ect_item, *ect_tmp;
 
 	mutex_lock(&ect_mutex);
+	cti_remove_conn_xrefs(drvdata);
 	cti_pm_release(drvdata);
 
 	/* remove from the list */
@@ -844,17 +841,6 @@ static void cti_device_release(struct device *dev)
 	}
 	mutex_unlock(&ect_mutex);
 
-	if (drvdata->csdev_release)
-		drvdata->csdev_release(dev);
-}
-static void cti_remove(struct amba_device *adev)
-{
-	struct cti_drvdata *drvdata = dev_get_drvdata(&adev->dev);
-
-	mutex_lock(&ect_mutex);
-	cti_remove_conn_xrefs(drvdata);
-	mutex_unlock(&ect_mutex);
-
 	coresight_unregister(drvdata->csdev);
 }
 
@@ -947,10 +933,6 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	cti_update_conn_xrefs(drvdata);
 	mutex_unlock(&ect_mutex);
 
-	/* set up release chain */
-	drvdata->csdev_release = drvdata->csdev->dev.release;
-	drvdata->csdev->dev.release = cti_device_release;
-
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
 	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 4f89091ee93f5fb046d93b97a4085051fca6b39d..daff9e32a6daca90f4d5f4726f163fdd9106191c 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -170,7 +170,6 @@ struct cti_config {
  * @spinlock:	Control data access to one at a time.
  * @config:	Configuration data for this CTI device.
  * @node:	List entry of this device in the list of CTI devices.
- * @csdev_release: release function for underlying coresight_device.
  */
 struct cti_drvdata {
 	void __iomem *base;
@@ -179,7 +178,6 @@ struct cti_drvdata {
 	raw_spinlock_t spinlock;
 	struct cti_config config;
 	struct list_head node;
-	void (*csdev_release)(struct device *dev);
 };
 
 /*

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-arm_coresight_refactor_cti_resource_release-24d9bde4f13c

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


