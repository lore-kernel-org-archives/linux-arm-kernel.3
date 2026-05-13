Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07742CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v84rlq5VStiUsymDwmisndrKWY26Gu0Cs5DiKMPkIY=; b=SqoOW/5AXWeSh7TsWvfcdFXayk
	ZYUthx7C5Ty0Ak4vGV1v5pQBPNPt0uig3q8LgNiCnDsE8nXmd4ulZLKz8Wym1V53/qlA5FbPuAihV
	y0GyivgsJDyF50jjg4fzMWZ29mGQDYPzHTvs/a9SIf3T+MHvCoCzJ/Hg5M2asVC+5jbAvI8CRxfGS
	D02pO5uWJQUo3ewXZzX6F7Jxv5UVZkFKa+JzIY0f6CXOm80Ban/UY7BudAI8cQDPepS5Lu5/XAdlM
	vL3HOVZfER41jOR9JNtEk3cAbWtvDYUxovjqht4izLXzuAVVU34iKsJa+fTvN/ApaMJ/dm7uTLkaq
	hMFJFsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN685-00000001xwV-3pOF;
	Wed, 13 May 2026 09:43:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN685-00000001xvj-1BiF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 09:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7v84rlq5VStiUsymDwmisndrKWY26Gu0Cs5DiKMPkIY=; b=jCcQXDHKtEiWMq3uG9wImytobk
	UBa5jOcuUDEO5tbffAAVcKi+9ojfB5i/E0si7nzV3KOkJ9S72CkN1TDyNdnfJUcM15SryTGwvz7R+
	l9SKgZmMIx96PiuZMoP5mcz9+ckErR0uer42CeBbaUQGtNFGWFsYyFC+qpRz5Yt7e+OJ5a2WFlPWG
	dBOv3/6Ruoh8VNM6SDRHjdx+S0LFiWXv/mHiqTc3GaC0N15hNPQK2fsbS/t5Rs9EiC2LkpTa3KxJV
	8WDwAm9SWrtpYP0e39RWRG9R6wYa3n3KB5lb7ozzvvbjRoYhobvbJBvmfB1VH6Zrxd89XXw0qJSJH
	VamOZ40A==;
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN682-0000000BPwi-0XHh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:43:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gFpH43NHDz1K96k;
	Wed, 13 May 2026 17:35:44 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 33E2A40563;
	Wed, 13 May 2026 17:43:20 +0800 (CST)
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
Subject: [PATCH v2 5/6] devfreq: Get and put module refcount when switching governor
Date: Wed, 13 May 2026 17:38:31 +0800
Message-ID: <20260513093832.1645890-6-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260513_104346_498614_CA1568D7 
X-CRM114-Status: GOOD (  12.26  )
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

A governor module can be dynamically inserted or removed if compiled as a
kernel module.  'devfreq->governor' would become NULL if the governor
module is removed when it's in use.

To prevent the governor module from being removed (except for force
unload) when it's in use, get and put a refcount of the governor module
when starting and stopping the governor.

As a result, unloading a governor module in use returns an error, e.g.:
  $ cat governor
  performance
  $ rmmod governor_performance
  rmmod: ERROR: Module governor_performance is in use

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index e1363ab69173..2ea42325d030 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -345,24 +345,37 @@ static int devfreq_set_governor(struct devfreq *df,
 				 __func__, df->governor->name, ret);
 			return ret;
 		}
+		module_put(old_gov->owner);
 	}
 
 	/* Start the new governor */
+	if (!try_module_get(new_gov->owner)) {
+		df->governor = NULL;
+		return -EINVAL;
+	}
+
 	df->governor = new_gov;
 	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
 	if (ret) {
 		dev_warn(dev, "%s: Governor %s not started(%d)\n",
 			 __func__, df->governor->name, ret);
+		module_put(new_gov->owner);
 
 		/* Restore previous governor */
 		df->governor = old_gov;
 		if (!df->governor)
 			return ret;
 
+		if (!try_module_get(old_gov->owner)) {
+			df->governor = NULL;
+			return -EINVAL;
+		}
+
 		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
 		if (ret) {
 			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
 				__func__, df->governor->name, ret);
+			module_put(old_gov->owner);
 			df->governor = NULL;
 			return ret;
 		}
@@ -1040,9 +1053,11 @@ int devfreq_remove_device(struct devfreq *devfreq)
 
 	devfreq_cooling_unregister(devfreq->cdev);
 
-	if (devfreq->governor)
+	if (devfreq->governor) {
 		devfreq->governor->event_handler(devfreq,
 						 DEVFREQ_GOV_STOP, NULL);
+		module_put(devfreq->governor->owner);
+	}
 	device_unregister(&devfreq->dev);
 
 	return 0;
-- 
2.43.0


