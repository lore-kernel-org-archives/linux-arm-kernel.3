Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8612D10A3D8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDfPZbLOars6V3VM6WyNpF/5C7AAMwDITeXI0ArFbKM=; b=oe2mR6DseX6lZ6OJ2/IgnKffr8
	baC135gHuOLN7sWSf4HSO1Xe55GNErgNQ6M57Vm8gngInSYSj9Z8HPHnAnkUbbisnvvlQ9M6m15OP
	KMqIkVDFV7A+m8srFIDJIpPwMFFZ/ykg5qUqY1R5rSh3nmfMf7vz9khJEfR3o23S/f5hU3aa+l52h
	qLOt/gBYuOaiy6gKURYrEMsVNr1RDJMnQVYycGrue/5rWkkyf4hszQ09mD/MFw5hgQlVlELihILIK
	C65QHWzdGl5Q4qzCK00nRtTofSagyaCE1NMrmgkkuBfAr+NvDMPpQDmdJXAA+RyqVHUDgxalDzmg4
	u+MxTAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k23-00000005Th0-2lSW;
	Thu, 26 Mar 2026 12:41:51 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k1w-00000005SkD-0nAx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:41:47 +0000
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fhNVG0Z0JzmV8X;
	Thu, 26 Mar 2026 20:33:26 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id BDB5540565;
	Thu, 26 Mar 2026 20:39:33 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Mar 2026 20:39:33 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <tianyaxiong@kylinos.cn>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>,
	<jonathan.cameron@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: [PATCH v1 06/10] devfreq: Add module owner to devfreq governor
Date: Thu, 26 Mar 2026 20:34:24 +0800
Message-ID: <20260326123428.800407-7-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326123428.800407-1-zhanjie9@hisilicon.com>
References: <20260326123428.800407-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_054145_867740_CDDA7BE3 
X-CRM114-Status: GOOD (  15.29  )
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

Add an 'owner' member to struct devfreq_governor, such that we can find
the module that holds the governor code when it's compiled as a kernel
module.  This allows the devfreq core to properly manage the lifecycle
of governors.

Update devfreq_add_governor() and devm_devfreq_add_governor() to
automatically set 'owner' to THIS_MODULE via helper macros.

This is a prerequisite for implementing governor reference counting
to prevent module unloading while a governor is in use.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c        | 26 +++++++++-----------------
 include/linux/devfreq-governor.h | 26 +++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 7e71e8c76303..9b078458d129 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1293,11 +1293,8 @@ void devfreq_resume(void)
 	mutex_unlock(&devfreq_list_lock);
 }
 
-/**
- * devfreq_add_governor() - Add devfreq governor
- * @governor:	the devfreq governor to be added
- */
-int devfreq_add_governor(struct devfreq_governor *governor)
+int __devfreq_add_governor(struct devfreq_governor *governor,
+			   struct module *mod)
 {
 	struct devfreq_governor *g;
 
@@ -1313,38 +1310,33 @@ int devfreq_add_governor(struct devfreq_governor *governor)
 		return -EINVAL;
 	}
 
+	governor->owner = mod;
 	scoped_guard(mutex, &devfreq_gov_lock)
 		list_add(&governor->node, &devfreq_governor_list);
 
 	return 0;
 }
-EXPORT_SYMBOL(devfreq_add_governor);
+EXPORT_SYMBOL(__devfreq_add_governor);
 
 static void devm_devfreq_remove_governor(void *governor)
 {
 	WARN_ON(devfreq_remove_governor(governor));
 }
 
-/**
- * devm_devfreq_add_governor() - Add devfreq governor
- * @dev:	device which adds devfreq governor
- * @governor:	the devfreq governor to be added
- *
- * This is a resource-managed variant of devfreq_add_governor().
- */
-int devm_devfreq_add_governor(struct device *dev,
-			      struct devfreq_governor *governor)
+int __devm_devfreq_add_governor(struct device *dev,
+				struct devfreq_governor *governor,
+				struct module *mod)
 {
 	int err;
 
-	err = devfreq_add_governor(governor);
+	err = __devfreq_add_governor(governor, mod);
 	if (err)
 		return err;
 
 	return devm_add_action_or_reset(dev, devm_devfreq_remove_governor,
 					governor);
 }
-EXPORT_SYMBOL(devm_devfreq_add_governor);
+EXPORT_SYMBOL(__devm_devfreq_add_governor);
 
 /**
  * devfreq_remove_governor() - Remove devfreq feature from a device.
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index dfdd0160a29f..1c4ff57e24de 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -12,6 +12,7 @@
 #define __LINUX_DEVFREQ_DEVFREQ_H__
 
 #include <linux/devfreq.h>
+struct module;
 
 #define DEVFREQ_NAME_LEN			16
 
@@ -50,6 +51,7 @@
 /**
  * struct devfreq_governor - Devfreq policy governor
  * @node:		list node - contains registered devfreq governors
+ * @owner:		Module that this governor belongs to
  * @name:		Governor's name
  * @attrs:		Governor's sysfs attribute flags
  * @flags:		Governor's feature flags
@@ -67,6 +69,7 @@
 struct devfreq_governor {
 	struct list_head node;
 
+	struct module *owner;
 	const char name[DEVFREQ_NAME_LEN];
 	const u64 attrs;
 	const u64 flags;
@@ -81,11 +84,28 @@ void devfreq_monitor_suspend(struct devfreq *devfreq);
 void devfreq_monitor_resume(struct devfreq *devfreq);
 void devfreq_update_interval(struct devfreq *devfreq, unsigned int *delay);
 
-int devfreq_add_governor(struct devfreq_governor *governor);
+/**
+ * devfreq_add_governor() - Add devfreq governor
+ * @governor:	The devfreq governor to be added
+ */
+#define devfreq_add_governor(governor) \
+	__devfreq_add_governor((governor), THIS_MODULE)
+int __devfreq_add_governor(struct devfreq_governor *governor,
+			   struct module *mod);
 int devfreq_remove_governor(struct devfreq_governor *governor);
 
-int devm_devfreq_add_governor(struct device *dev,
-			      struct devfreq_governor *governor);
+/**
+ * devm_devfreq_add_governor() - Add devfreq governor
+ * @dev:	device which adds devfreq governor
+ * @governor:	the devfreq governor to be added
+ *
+ * This is a resource-managed variant of devfreq_add_governor().
+ */
+#define devm_devfreq_add_governor(dev, governor) \
+	__devm_devfreq_add_governor((dev), (governor), THIS_MODULE)
+int __devm_devfreq_add_governor(struct device *dev,
+				struct devfreq_governor *governor,
+				struct module *mod);
 
 int devfreq_update_status(struct devfreq *devfreq, unsigned long freq);
 int devfreq_update_target(struct devfreq *devfreq, unsigned long freq);
-- 
2.43.0


