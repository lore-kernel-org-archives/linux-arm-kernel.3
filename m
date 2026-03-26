Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD63310A3D8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qAeFBCdLp4sqr//iEcBThvsCw8Ax4MNrHHyNcO5P4k=; b=V8+dNBnH9Ufn5tt3OorhyNpvTC
	FVYr3NtVLQ7+LYN52aksyEopZ5GJ5j5w8lRHC1wPY9InBe3xlQPUGC+6TJSJDbCqj/jPdKZbsSPag
	6WikvnG88qbRkUt5bEtgV6ORZVEAu02TDDPaukjbULLnuhs0CA1Ymk5XM1MorvAIIW7txQsZUMJxy
	BSUdkYSMRbR2gTbDxr6IlghPrlWyzV8mdjbQihczylmRfJ5pOnI/j5Pom9pgWFWdy++0L2lIsdCQJ
	6Mtk2p19yxO1kZWr9J1ep3hU8BHlztSX+JJqklBlE3jGC0yq/BNsq0zR7Lsb9Hwiys3kFZ0JKfio5
	/lekkcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k1x-00000005TfC-3lC1;
	Thu, 26 Mar 2026 12:41:45 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k1t-00000005Sk4-2poa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:41:44 +0000
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fhNVx38F8z1T4gq;
	Thu, 26 Mar 2026 20:34:01 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F3E840569;
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
Subject: [PATCH v1 07/10] devfreq: Get and put module refcount when switching governor
Date: Thu, 26 Mar 2026 20:34:25 +0800
Message-ID: <20260326123428.800407-8-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260326_054141_918597_6798E94E 
X-CRM114-Status: GOOD (  11.78  )
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

When compiled as a kernel module, the governor module can be dynamically
inserted or removed.  'devfreq->governor' would become NULL if the
governor module is removed when it's in use.

To prevent the governor module from being removed (except for force
unload) when it's in use, get and put a refcount of the governor module
when starting and stopping the governor.

Now, unloading a governor module that is set for a devfreq device
returns an error, for example:
  # cat governor
  performance
  # rmmod governor_performance
  rmmod: ERROR: Module governor_performance is in use

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 9b078458d129..ba09948915ba 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -338,22 +338,31 @@ static int devfreq_set_governor_locked(struct devfreq *df,
 				 __func__, df->governor->name, ret);
 			return ret;
 		}
+		module_put(old_gov->owner);
 	}
 
 	/* Start the new governor */
+	if (!try_module_get(new_gov->owner))
+		return -EINVAL;
+
 	df->governor = new_gov;
 	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
 	if (ret) {
 		dev_warn(dev, "%s: Governor %s not started(%d)\n",
 			 __func__, df->governor->name, ret);
 
+		module_put(new_gov->owner);
 		if (!old_gov)
 			return ret;
 
 		/* Restore previous governor */
+		if (!try_module_get(old_gov->owner))
+			return -EINVAL;
+
 		df->governor = old_gov;
 		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
 		if (ret) {
+			module_put(old_gov->owner);
 			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
 				__func__, old_gov->name, ret);
 			df->governor = NULL;
-- 
2.43.0


