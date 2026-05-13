Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8FACD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4yBtoP+AK2YPvlIquQULnZH1cqZ3cAYW4fmzkPzSqU=; b=y6MVeRy4M/04WDGGsdvDljf95A
	2IwopPCGC85N/axRL+0Q2mflMIPPa8LYAXu7tas/bUaAz0rmN8Yl2daimTxlILSVRgDKcsN3Clxfe
	fL5yAhIOH9AU5zMAX+SIdJAf48yIq59M69CAbz8r71EqZS5ldtGeBcs3TuJ0PxnQHty5+Cc2J1JwZ
	xCki1/skMQ3YfRzDLQDjuTiSCy5Di8W+xbdXEjBJ4kI297LqAY6VgArm9ClTeqmZW9tfkuAWhJxv+
	92BW2OfdVt8DVEeNN8LZMpPEAH7mZgcLun7QLBWJD5+bHegRwYOsrmiknZhaktMe5TQK14pi3eUvP
	i+ROgTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN67l-00000001xju-1w27;
	Wed, 13 May 2026 09:43:29 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN67i-00000001xh9-0hlM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:43:28 +0000
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gFpHk1pVQzpSwF;
	Wed, 13 May 2026 17:36:18 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id B7F3940538;
	Wed, 13 May 2026 17:43:19 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 May 2026 17:43:19 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cwchoi00@gmail.com>, <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v2 4/6] devfreq: Add module owner to devfreq governor
Date: Wed, 13 May 2026 17:38:30 +0800
Message-ID: <20260513093832.1645890-5-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
References: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_024326_505143_C1816F1E 
X-CRM114-Status: GOOD (  15.62  )
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

This is a prerequisite for implementing governor reference counting to
prevent a governor module from being unloaded (except for force unload)
while a governor is in use.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c        | 26 +++++++++-----------------
 include/linux/devfreq-governor.h | 26 +++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 9e3e6a7348f8..e1363ab69173 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1301,11 +1301,8 @@ void devfreq_resume(void)
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
 
@@ -1322,37 +1319,32 @@ int devfreq_add_governor(struct devfreq_governor *governor)
 		return -EINVAL;
 	}
 
+	governor->owner = mod;
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


