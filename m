Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FCCC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoT59G3XdcgBNpe/X2QFnvPBS0+VFXuTVmMBdkjrYOo=; b=f/VgBR93ZOrmKq2uS2th/EgHbP
	qapscFwtnJ4oNOSzYyo+8dQJN7r2mdn5SdqgqZu+mkGXPAXiXUSMLDppRxV5kf85Mmo7a+E6ChbD/
	SFLbLsSEnWfd0054QWwWluEkEpOaD1TMqf6zUmpQuz/DvIGFH+UDz79CLZSHNcT2+6wh8nPDdLo0t
	YzWimuARLllQqxA+/b5vTtsxiBdPt7V+vpaKK7k2R3/LUXWoQlao7jOouJ2UB0smqNKoFKtXSXdz4
	FfsdTKIr8hNiaaOlmh9DP3zdyH8eJDZEoUcnSWWJtFWRqo8kuAl/EHi3uIX9drQtYFDmCfbeVJk1D
	G8O8OGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Z2-00000007YHb-2TzT;
	Wed, 29 Jul 2026 10:31:04 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Yy-00000007YEg-46Ly
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:31:03 +0000
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h97fT3WM1zpSvB;
	Wed, 29 Jul 2026 18:21:37 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id DB4CE40561;
	Wed, 29 Jul 2026 18:30:54 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 18:30:54 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cwchoi00@gmail.com>, <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v4 2/4] devfreq: Use mutex guard in devfreq_add/remove_governor()
Date: Wed, 29 Jul 2026 18:23:46 +0800
Message-ID: <20260729102348.3857779-3-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
References: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_033101_217278_C068322D 
X-CRM114-Status: GOOD (  10.49  )
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

Use mutex guard in devfreq_add/remove_governor() so as to simplify the
locking logic.

No functional impact intended.

Reviewed-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 7a70dd051644..53c40d795a13 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1261,28 +1261,23 @@ void devfreq_resume(void)
 int devfreq_add_governor(struct devfreq_governor *governor)
 {
 	struct devfreq_governor *g;
-	int err = 0;
 
 	if (!governor) {
 		pr_err("%s: Invalid parameters.\n", __func__);
 		return -EINVAL;
 	}
 
-	mutex_lock(&devfreq_list_lock);
+	guard(mutex)(&devfreq_list_lock);
 	g = find_devfreq_governor(governor->name);
 	if (!IS_ERR(g)) {
 		pr_err("%s: governor %s already registered\n", __func__,
 		       g->name);
-		err = -EINVAL;
-		goto err_out;
+		return -EINVAL;
 	}
 
 	list_add(&governor->node, &devfreq_governor_list);
 
-err_out:
-	mutex_unlock(&devfreq_list_lock);
-
-	return err;
+	return 0;
 }
 EXPORT_SYMBOL(devfreq_add_governor);
 
@@ -1320,21 +1315,20 @@ int devfreq_remove_governor(struct devfreq_governor *governor)
 {
 	struct devfreq_governor *g;
 	struct devfreq *devfreq;
-	int err = 0;
 
 	if (!governor) {
 		pr_err("%s: Invalid parameters.\n", __func__);
 		return -EINVAL;
 	}
 
-	mutex_lock(&devfreq_list_lock);
+	guard(mutex)(&devfreq_list_lock);
 	g = find_devfreq_governor(governor->name);
 	if (IS_ERR(g)) {
 		pr_err("%s: governor %s not registered\n", __func__,
 		       governor->name);
-		err = PTR_ERR(g);
-		goto err_out;
+		return PTR_ERR(g);
 	}
+
 	list_for_each_entry(devfreq, &devfreq_list, node) {
 		int ret;
 		struct device *dev = devfreq->dev.parent;
@@ -1356,10 +1350,8 @@ int devfreq_remove_governor(struct devfreq_governor *governor)
 	}
 
 	list_del(&governor->node);
-err_out:
-	mutex_unlock(&devfreq_list_lock);
 
-	return err;
+	return 0;
 }
 EXPORT_SYMBOL(devfreq_remove_governor);
 
-- 
2.43.0


