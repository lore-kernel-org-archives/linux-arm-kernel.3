Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA2510A3D81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PP3ehgoZH763m5OLypv7QrdFHHRaerqdZJzA4cotLl0=; b=KMCL6F6dAJLFYDco7iZcknI17O
	3ed9Qjm0G+Irn0UzKOAncquQtwVpBrYX8/MTNAyleED7lJn5hVtCsNTD/US0hrmvkurJ7PfeG4fUm
	uV65lFnKFougPxpqAOf9idmT9q8T0IJg8io5Wp2WFG69R54cNcmWKFa30WyDL+37OG9qbtdMFrhAc
	aNzTKMTObiZF/Ko5r/ecAtwGgc8SxOKQesGbtYdGXeC+6tpOlO6fHWLy/TcWdtD1Ueaww+U7c/7Co
	QImO51rGwU33x+sqkJynEYFuzDoEjL8riBi3XMCYrBIUMIvBMWfHpc7wh9K54MZsHKdEib12XDISv
	IDrYaKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k0K-00000005StO-1lBJ;
	Thu, 26 Mar 2026 12:40:04 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k01-00000005SkQ-3dss
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:39:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fhNVH0K1TzRhQP;
	Thu, 26 Mar 2026 20:33:27 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D6CC40537;
	Thu, 26 Mar 2026 20:39:33 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Mar 2026 20:39:32 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <tianyaxiong@kylinos.cn>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>,
	<jonathan.cameron@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: [PATCH v1 05/10] devfreq: Remove dead code in devfreq_add_governor()
Date: Thu, 26 Mar 2026 20:34:23 +0800
Message-ID: <20260326123428.800407-6-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260326_053946_087593_BD03FFE7 
X-CRM114-Status: GOOD (  11.69  )
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

In devfreq_add_governor(), we've already checked the governor list to
see if there's a governor already registered with the same name.

It's impossible that a devfreq device is using such a governor, so the
check can never be true and the error handling is unreachable.

Remove the redundant error handling to simplify the logic.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 378a01f71165..7e71e8c76303 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1300,7 +1300,6 @@ void devfreq_resume(void)
 int devfreq_add_governor(struct devfreq_governor *governor)
 {
 	struct devfreq_governor *g;
-	struct devfreq *devfreq;
 
 	if (!governor) {
 		pr_err("%s: Invalid parameters.\n", __func__);
@@ -1317,39 +1316,6 @@ int devfreq_add_governor(struct devfreq_governor *governor)
 	scoped_guard(mutex, &devfreq_gov_lock)
 		list_add(&governor->node, &devfreq_governor_list);
 
-	guard(mutex)(&devfreq_list_lock);
-	list_for_each_entry(devfreq, &devfreq_list, node) {
-		int ret = 0;
-		struct device *dev = devfreq->dev.parent;
-
-		if (!strncmp(devfreq->governor->name, governor->name,
-			     DEVFREQ_NAME_LEN)) {
-			/* The following should never occur */
-			if (devfreq->governor) {
-				dev_warn(dev,
-					 "%s: Governor %s already present\n",
-					 __func__, devfreq->governor->name);
-				ret = devfreq->governor->event_handler(devfreq,
-							DEVFREQ_GOV_STOP, NULL);
-				if (ret) {
-					dev_warn(dev,
-						 "%s: Governor %s stop = %d\n",
-						 __func__,
-						 devfreq->governor->name, ret);
-				}
-				/* Fall through */
-			}
-			devfreq->governor = governor;
-			ret = devfreq->governor->event_handler(devfreq,
-						DEVFREQ_GOV_START, NULL);
-			if (ret) {
-				dev_warn(dev, "%s: Governor %s start=%d\n",
-					 __func__, devfreq->governor->name,
-					 ret);
-			}
-		}
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL(devfreq_add_governor);
-- 
2.43.0


