Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78BC10A3D91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UB7FdfoXx03C606Sygc1OXh4g/aNCFHgAllnYL1t62I=; b=DwJmhe/496YvDGaGKlw0hVb7im
	dCu1JWkj0GO0pe5vhV3jJRU7xc0hVunvDUNeK12BgqcMzIsWpr3lirDAHD0UK3OmUm+Ihrq7Ncjkk
	8Zc74vY3DWSpFwJA7IXLi3HbKMY1AzZ7VQt9jvnuB/xJ0bmeMyMHNtEhP1v7rmBBvJil+Ig1UIVCD
	4XIAIBDSerPaEBp6I1nBCyVW+/UtSVYadnVGzGmW0GUDrJ4VHq+oJ/l+HppWIzi+niZ8n1HXweL+F
	THz+8P7c8RHju+W5gcMwMZg+PRl+DSD84igThnpL9Ue6jxqcwtcGKaBM8+GS7MN8eb6Fa8VtNR0OJ
	xbjzHDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k0L-00000005SvC-35Ue;
	Thu, 26 Mar 2026 12:40:05 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k01-00000005SkC-2hMa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:39:48 +0000
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fhNVX4fHGzcb1r;
	Thu, 26 Mar 2026 20:33:40 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 88EB840567;
	Thu, 26 Mar 2026 20:39:34 +0800 (CST)
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
Subject: [PATCH v1 08/10] devfreq: Allow find_devfreq_governor() to get module refcount
Date: Thu, 26 Mar 2026 20:34:26 +0800
Message-ID: <20260326123428.800407-9-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260326_053946_057332_F9E47F0D 
X-CRM114-Status: GOOD (  15.11  )
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

Add a 'get' parameter for find_devfreq_governor() to optionally get a
refcount of the governor module.

Getting refcount in try_then_request_governor() prevents the governor
module from being removed during the governor setting phase.

However, in devfreq_add/remove_governor(), it doesn't need to get a
refcount of the governor module because it just checks whether a
governor registered with the same name exists or not.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index ba09948915ba..c6b670b8fd22 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -254,11 +254,13 @@ EXPORT_SYMBOL(devfreq_update_status);
 /**
  * find_devfreq_governor() - find devfreq governor from name
  * @name:	name of the governor
+ * @get:	whether to get a refcount of the governor module
  *
  * Search the list of devfreq governors and return the matched
  * governor's pointer.
  */
-static struct devfreq_governor *find_devfreq_governor(const char *name)
+static struct devfreq_governor *find_devfreq_governor(const char *name,
+						      bool get)
 {
 	struct devfreq_governor *tmp_governor;
 
@@ -269,8 +271,13 @@ static struct devfreq_governor *find_devfreq_governor(const char *name)
 
 	guard(mutex)(&devfreq_gov_lock);
 	list_for_each_entry(tmp_governor, &devfreq_governor_list, node) {
-		if (!strncmp(tmp_governor->name, name, DEVFREQ_NAME_LEN))
-			return tmp_governor;
+		if (strncmp(tmp_governor->name, name, DEVFREQ_NAME_LEN))
+			continue;
+
+		if (get && !try_module_get(tmp_governor->owner))
+			return ERR_PTR(-EBUSY);
+
+		return tmp_governor;
 	}
 
 	return ERR_PTR(-ENODEV);
@@ -285,6 +292,9 @@ static struct devfreq_governor *find_devfreq_governor(const char *name)
  * if is not found. This can happen when both drivers (the governor driver
  * and the driver that call devfreq_add_device) are built as modules.
  * Returns the matched governor's pointer or an error pointer.
+ * On success, this holds a refcount of the governor module to prevent the
+ * module from being unloaded during usage, so the caller should put a module
+ * refcount after using it.
  */
 static struct devfreq_governor *try_then_request_governor(const char *name)
 {
@@ -296,7 +306,7 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
 		return ERR_PTR(-EINVAL);
 	}
 
-	governor = find_devfreq_governor(name);
+	governor = find_devfreq_governor(name, true);
 	if (IS_ERR(governor)) {
 		if (!strncmp(name, DEVFREQ_GOV_SIMPLE_ONDEMAND,
 			     DEVFREQ_NAME_LEN))
@@ -307,7 +317,7 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
 		if (err)
 			return (err < 0) ? ERR_PTR(err) : ERR_PTR(-EINVAL);
 
-		governor = find_devfreq_governor(name);
+		governor = find_devfreq_governor(name, true);
 	}
 
 	return governor;
@@ -1007,6 +1017,8 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	if (err)
 		goto err_devfreq;
 
+	module_put(governor->owner);
+
 	list_add(&devfreq->node, &devfreq_list);
 	mutex_unlock(&devfreq_list_lock);
 
@@ -1312,7 +1324,7 @@ int __devfreq_add_governor(struct devfreq_governor *governor,
 		return -EINVAL;
 	}
 
-	g = find_devfreq_governor(governor->name);
+	g = find_devfreq_governor(governor->name, false);
 	if (!IS_ERR(g)) {
 		pr_err("%s: governor %s already registered\n", __func__,
 		       g->name);
@@ -1361,7 +1373,7 @@ int devfreq_remove_governor(struct devfreq_governor *governor)
 		return -EINVAL;
 	}
 
-	g = find_devfreq_governor(governor->name);
+	g = find_devfreq_governor(governor->name, false);
 	if (IS_ERR(g)) {
 		pr_err("%s: governor %s not registered\n", __func__,
 		       governor->name);
@@ -1436,6 +1448,8 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 
 	ret = devfreq_set_governor(df, governor);
 
+	module_put(governor->owner);
+
 	return ret ? ret : count;
 }
 static DEVICE_ATTR_RW(governor);
-- 
2.43.0


