Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01854CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eR/377sWNeVjzPMNMI4Ye/W95sbh/D0Or5aYjlGi+nk=; b=jo3x5YmVKNIkQGrCc/dA4zdAYE
	Na8uQJ0s3jdQxRiX2pNNST7iZ0bd5pw4J/8QWinhwrvSj+CcH5Rnv+OZMff58OjQRWImnHDkUDxSi
	3GSEDxSEpt3mUP0qt/nBM9aYycI25JBBWrK/+RI4XZ9CrcLPy9EwimXBYn62zFJAiVMMqKMLfYSUP
	4+y3otY+JaWLaD+50ytj4YKzVGX2jlzi1s6jTXbWcZMXEXAzxgmaN292/faTn6R7sOkUX2tXlRlfZ
	gqecUQdYuF/yaBZxyydHNiIqpl42QEsFJnPv5KX8kgb3a1nPH+ifK2yKrjVE5IcELOG33dWwCCE4G
	eKAjdjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN67o-00000001xlF-2tYc;
	Wed, 13 May 2026 09:43:32 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN67j-00000001xhL-0wiy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:43:29 +0000
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gFpH22ychzmV7R;
	Wed, 13 May 2026 17:35:42 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id A62EC40562;
	Wed, 13 May 2026 17:43:20 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 May 2026 17:43:20 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cwchoi00@gmail.com>, <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v2 6/6] devfreq: Get module refcount in try_then_request_governor()
Date: Wed, 13 May 2026 17:38:32 +0800
Message-ID: <20260513093832.1645890-7-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260513_024327_425490_24B615C7 
X-CRM114-Status: GOOD (  12.00  )
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

Get a refcount of the governor module in try_then_request_governor() so
that the governor module cannot be unloaded between finding the governor
and the caller using it.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 2ea42325d030..fb1a7aa168aa 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -285,6 +285,9 @@ static struct devfreq_governor *find_devfreq_governor(const char *name)
  * and the driver that call devfreq_add_device) are built as modules.
  * devfreq_list_lock should be held by the caller. Returns the matched
  * governor's pointer or an error pointer.
+ * On success, this holds a refcount of the governor module to prevent the
+ * module from being unloaded during usage, so the caller should put a module
+ * refcount after using it.
  */
 static struct devfreq_governor *try_then_request_governor(const char *name)
 {
@@ -313,8 +316,13 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
 			return (err < 0) ? ERR_PTR(err) : ERR_PTR(-EINVAL);
 
 		governor = find_devfreq_governor(name);
+		if (IS_ERR(governor))
+			return governor;
 	}
 
+	if (!try_module_get(governor->owner))
+		return ERR_PTR(-EBUSY);
+
 	return governor;
 }
 
@@ -1009,6 +1017,7 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	}
 
 	err = devfreq_set_governor(devfreq, governor);
+	module_put(governor->owner);
 	if (err) {
 		dev_err_probe(dev, err,
 			"%s: Unable to start governor for the device\n",
@@ -1446,6 +1455,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 		return PTR_ERR(governor);
 
 	ret = devfreq_set_governor(df, governor);
+	module_put(governor->owner);
 	if (ret)
 		return ret;
 
-- 
2.43.0


