Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BD610A3D8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVAk2qNGjm1EC2mPz9NJJUbLP4k2OnFT5Hh0I6p7xUg=; b=zmLQhQ0J8KrbbZrrEo17Ufc3rl
	1riTDCoXG/17xVselFl7kcCZET3rJjR1/TYWvscAiaMXdTc+la+T+vakkwdQCNv7tpkowzOF2P3Ix
	bXEBl14fZ22kQHhvT3nYgwJ20Dxs1mdqTPnwqgaBfbacuidqcD+q7JcCiedm6XC/XNztk7qnrkI1Y
	ajfzrPY2kSdT5SWZ/F2PJT7abt0qU0InPc3GU1ipekCQMZhCyRfdSAL5+9qfbKUHGDQuliVIzOImv
	U4/4Qj0YNRsUotLpFIraB4WPcjFHlcTLfwqS0zbgW8bhDCbKkqd1hto1hfi6/kMifDsoGzeumSO+f
	E7sxLK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k03-00000005Smm-2Waq;
	Thu, 26 Mar 2026 12:39:47 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jzz-00000005Sk1-14gY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:39:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fhNVH0SyszLlt4;
	Thu, 26 Mar 2026 20:33:27 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 823D74056C;
	Thu, 26 Mar 2026 20:39:32 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Mar 2026 20:39:31 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <tianyaxiong@kylinos.cn>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>,
	<jonathan.cameron@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: [PATCH v1 03/10] devfreq: Add a dedicated mutex for the governor list
Date: Thu, 26 Mar 2026 20:34:21 +0800
Message-ID: <20260326123428.800407-4-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260326_053944_655000_6D7145C6 
X-CRM114-Status: GOOD (  17.52  )
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

Accessing the list of available governors ('devfreq_governor_list') is
currently guarded by 'devfreq_list_lock', but 'devfreq_list_lock' is
supposed to protect the list of devfreq devices ('devfreq_list').

The scope of 'devfreq_list_lock' is too broad to maintain.
'devfreq_governor_list' should have its own mutex lock rather than share
with 'devfreq_list'.

Add a governor mutex lock and lock it when accessing the governor list.
Remove locking of 'devfreq_list_lock' around 'devfreq_governor_list'.

This is also a preparation for further refactoring around
try_then_request_governor().

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 83f75dc21c99..e54e3092e0e0 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -49,6 +49,7 @@ static struct workqueue_struct *devfreq_wq;
 
 /* The list of all device-devfreq governors */
 static LIST_HEAD(devfreq_governor_list);
+static DEFINE_MUTEX(devfreq_gov_lock);
 /* The list of all device-devfreq */
 static LIST_HEAD(devfreq_list);
 static DEFINE_MUTEX(devfreq_list_lock);
@@ -255,19 +256,18 @@ EXPORT_SYMBOL(devfreq_update_status);
  * @name:	name of the governor
  *
  * Search the list of devfreq governors and return the matched
- * governor's pointer. devfreq_list_lock should be held by the caller.
+ * governor's pointer.
  */
 static struct devfreq_governor *find_devfreq_governor(const char *name)
 {
 	struct devfreq_governor *tmp_governor;
 
-	lockdep_assert_held(&devfreq_list_lock);
-
 	if (IS_ERR_OR_NULL(name)) {
 		pr_err("DEVFREQ: %s: Invalid parameters\n", __func__);
 		return ERR_PTR(-EINVAL);
 	}
 
+	guard(mutex)(&devfreq_gov_lock);
 	list_for_each_entry(tmp_governor, &devfreq_governor_list, node) {
 		if (!strncmp(tmp_governor->name, name, DEVFREQ_NAME_LEN))
 			return tmp_governor;
@@ -284,16 +284,13 @@ static struct devfreq_governor *find_devfreq_governor(const char *name)
  * Search the list of devfreq governors and request the module and try again
  * if is not found. This can happen when both drivers (the governor driver
  * and the driver that call devfreq_add_device) are built as modules.
- * devfreq_list_lock should be held by the caller. Returns the matched
- * governor's pointer or an error pointer.
+ * Returns the matched governor's pointer or an error pointer.
  */
 static struct devfreq_governor *try_then_request_governor(const char *name)
 {
 	struct devfreq_governor *governor;
 	int err = 0;
 
-	lockdep_assert_held(&devfreq_list_lock);
-
 	if (IS_ERR_OR_NULL(name)) {
 		pr_err("DEVFREQ: %s: Invalid parameters\n", __func__);
 		return ERR_PTR(-EINVAL);
@@ -301,15 +298,12 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
 
 	governor = find_devfreq_governor(name);
 	if (IS_ERR(governor)) {
-		mutex_unlock(&devfreq_list_lock);
-
 		if (!strncmp(name, DEVFREQ_GOV_SIMPLE_ONDEMAND,
 			     DEVFREQ_NAME_LEN))
 			err = request_module("governor_%s", "simpleondemand");
 		else
 			err = request_module("governor_%s", name);
 		/* Restore previous state before return */
-		mutex_lock(&devfreq_list_lock);
 		if (err)
 			return (err < 0) ? ERR_PTR(err) : ERR_PTR(-EINVAL);
 
@@ -933,16 +927,15 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	if (err)
 		goto err_devfreq;
 
-	mutex_lock(&devfreq_list_lock);
-
 	governor = try_then_request_governor(governor_name);
 	if (IS_ERR(governor)) {
 		dev_err(dev, "%s: Unable to find governor for the device\n",
 			__func__);
 		err = PTR_ERR(governor);
-		goto err_init;
+		goto err_devfreq;
 	}
 
+	mutex_lock(&devfreq_list_lock);
 	devfreq->governor = governor;
 	err = devfreq->governor->event_handler(devfreq, DEVFREQ_GOV_START,
 						NULL);
@@ -1269,7 +1262,6 @@ int devfreq_add_governor(struct devfreq_governor *governor)
 		return -EINVAL;
 	}
 
-	guard(mutex)(&devfreq_list_lock);
 	g = find_devfreq_governor(governor->name);
 	if (!IS_ERR(g)) {
 		pr_err("%s: governor %s already registered\n", __func__,
@@ -1277,8 +1269,10 @@ int devfreq_add_governor(struct devfreq_governor *governor)
 		return -EINVAL;
 	}
 
-	list_add(&governor->node, &devfreq_governor_list);
+	scoped_guard(mutex, &devfreq_gov_lock)
+		list_add(&governor->node, &devfreq_governor_list);
 
+	guard(mutex)(&devfreq_list_lock);
 	list_for_each_entry(devfreq, &devfreq_list, node) {
 		int ret = 0;
 		struct device *dev = devfreq->dev.parent;
@@ -1355,7 +1349,6 @@ int devfreq_remove_governor(struct devfreq_governor *governor)
 		return -EINVAL;
 	}
 
-	guard(mutex)(&devfreq_list_lock);
 	g = find_devfreq_governor(governor->name);
 	if (IS_ERR(g)) {
 		pr_err("%s: governor %s not registered\n", __func__,
@@ -1363,6 +1356,7 @@ int devfreq_remove_governor(struct devfreq_governor *governor)
 		return PTR_ERR(g);
 	}
 
+	guard(mutex)(&devfreq_list_lock);
 	list_for_each_entry(devfreq, &devfreq_list, node) {
 		int ret;
 		struct device *dev = devfreq->dev.parent;
@@ -1383,7 +1377,8 @@ int devfreq_remove_governor(struct devfreq_governor *governor)
 		}
 	}
 
-	list_del(&governor->node);
+	scoped_guard(mutex, &devfreq_gov_lock)
+		list_del(&governor->node);
 
 	return 0;
 }
@@ -1423,11 +1418,11 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	if (ret != 1)
 		return -EINVAL;
 
-	guard(mutex)(&devfreq_list_lock);
 	governor = try_then_request_governor(str_governor);
 	if (IS_ERR(governor))
 		return PTR_ERR(governor);
 
+	guard(mutex)(&devfreq_list_lock);
 	if (df->governor == governor)
 		return count;
 
-- 
2.43.0


