Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB78CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+ZEenHC5Dw5pa3hF4xWhQjQWcl+zE0Tg3zwHlFD/XI=; b=tHxQ0Cxj0iiU1D5wKb1dt3JqXx
	uGYY5XHfuqZC/jjYrcDhtFkVv99t8rMry5442ZQiknqR+LfuDjC7sRcXrJfeDGzW8AELG96RPqTqp
	ziiosdDM6XKXOsmqq8sna7j9I4lFY4x9dO/SQetdSo4vMWGkgF9dVZBbFTuZUiCEJrijC7T92IoMw
	bxxONV4GYpJcPG611LSZzUB3yghmSxWVwroBF1Ew+4qwP7vv9YNqoHRp9evIuna0qoAw7PK23KrOz
	eaaSAYaOf1xZUIfrBnQW7YsC+KjuUSuCgo43ZeZvpuBa9REGtqbxYZMqM+qlE0vN9V7+52/aj4e0m
	xlhn5mHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN68C-00000001y1L-05Fa;
	Wed, 13 May 2026 09:43:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN688-00000001xyW-3gny
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 09:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=O+ZEenHC5Dw5pa3hF4xWhQjQWcl+zE0Tg3zwHlFD/XI=; b=p5pplJ9khMugd8rnbHw2T6mJaK
	9/0HDdYFUv//pl/s8JIQRvxUsMO2GoQnQt9BhvX0Suo6d+V3L8VnfiIoNaM94q5VhnkGz0YEOEAQL
	EeATOtz6q13QaSbEz+eA7PR/BW2uDFOUtP3XA9oi4FY85SXoX8xeRvuSwEbufCyOF/A7KUedB2Lxi
	kwAIF0iaNbfqG9prwj7t2lssVFfSGvgz6oPDehmFnYsC9U4HWS5ZbnuWTQ3aQQah0olkgNp73TPaa
	sLcH2sYdHuRz+mcvUlyYTSK2U9w3l+SpY81RJj5ohVLx59jjWq1DChHF9rZNb8brb0G6vA5VVsLzY
	AlFyhOqA==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN685-0000000BPxm-02MI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:43:51 +0000
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gFpGx3TYQz1T4Fh;
	Wed, 13 May 2026 17:35:37 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id D2A43202E6;
	Wed, 13 May 2026 17:43:18 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 May 2026 17:43:18 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cwchoi00@gmail.com>, <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v2 2/6] devfreq: Use mutex guard in devfreq_add/remove_governor()
Date: Wed, 13 May 2026 17:38:28 +0800
Message-ID: <20260513093832.1645890-3-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260513_104349_968346_6580DEF3 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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


