Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4E9CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoT59G3XdcgBNpe/X2QFnvPBS0+VFXuTVmMBdkjrYOo=; b=D2jyLG5UFWl1s0zpbq3aEBA0/n
	U/0jXrU8QQRD3qTtFHc/FD/WAcX+Zmp3VjiK9d10xlq/OCsMb6v8q5N7IiUw59AkDulXry9CoACWm
	8I+30vsCJx9f6kq5cjpagMY7jz4yDIbAE3whw1OyPMu/eSUgBogYjROtWzdxkNE8PfyCwx5LhSLzw
	ghM7b4hnEbKhgdaFLd+MTMgcJ2K1kp7UZKWEWvQ03HFzulPQ5kORu0wqG1zVlEW7ANvpnzhNo5Hnz
	PUYyVbY7cQjPiayC3C7jtmUKc1oqKmYJ9WyXglI8Hhm9wiUWPquujBehO5OaFmFrIyNm2LRFD8exR
	LGjn33GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIlw-00000001LOA-1O71;
	Tue, 19 May 2026 11:38:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIlo-00000001LJD-01sS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 11:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xoT59G3XdcgBNpe/X2QFnvPBS0+VFXuTVmMBdkjrYOo=; b=KCzuPfBtoYRRA7xQoDQ4SVYeBd
	UrjcLm9K2qFRJ1MrTCXMeAhzgxIVqMKCcLhVWkzFUwv7z7/T5duXOuUkBQIzAbRTOy2Y9iSj/zqmF
	zpfDgv6EfacRllbR7dm7S9amgpobyFd4I18LOtZN9ancT1+W/4bCbdW5mgazqXRCwFNbXQI9lbnN0
	AlpGLFjp8s/ZJDro19/+EoCMlUjlnLmZ6eaSsn9tP6f8J+VmOC2rwO8L1NrTDPv9CIx6bNF0zVl0M
	86xJO5sM+QZNQBfqWd3CHMc4JW3R+n8caR5ZNYWrSvI9s1T0WNP8I8ea1gOPnvDvuyBYf/nj4+7VD
	AfbZHvlQ==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIlk-0000000E4qi-10E9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:37:54 +0000
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gKXX02KDMz1prLM;
	Tue, 19 May 2026 19:29:52 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id A008140538;
	Tue, 19 May 2026 19:37:35 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 May 2026 19:37:34 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cwchoi00@gmail.com>, <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v3 2/4] devfreq: Use mutex guard in devfreq_add/remove_governor()
Date: Tue, 19 May 2026 19:32:48 +0800
Message-ID: <20260519113251.3745140-3-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519113251.3745140-1-zhanjie9@hisilicon.com>
References: <20260519113251.3745140-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_123752_969121_3886C2D0 
X-CRM114-Status: GOOD (  10.70  )
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


