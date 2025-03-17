Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818B0C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AgJsb4qyuR7PFP1uT/ah1Ty4VxBxIKGlmaHkh9dxIPw=; b=DjeX2qUBDDWcBYStNhnfq9lR2k
	c6HVJ6Omjm9EmQ7NBEDJW0Xg9Vq+qgsvWNbfnx9ipQ358nZaEVU7w8oZH6AWgiXhgy/lf78/f75pS
	HaayEghe/CWrVpL7fNGgXmvDkEyFMZhmYfa9wTYOKIubNc263wcB1DhxAW5Q2R6UC6e1h739x25dx
	Hammte0ZyUejF4h8g0q7VyHlpBql4FYcvzNix8sK4NJIJGQGCCLrXcgHkjmR70Tp9yew804E4B6tE
	0Mae228P1PpJe3ie3JF8Okl8smwSXeBWGE6InO4Wim19kNDtjdSEGsGkbotCvyKlOFpFwN3Y8/itU
	qXbCLfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA4e-00000002ebK-1Xxl;
	Mon, 17 Mar 2025 13:00:08 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9tj-00000002cmx-3RCo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 12:48:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZGZSr2rM8z2Ccln;
	Mon, 17 Mar 2025 20:45:32 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 727A91400FD;
	Mon, 17 Mar 2025 20:48:45 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 17 Mar 2025 20:48:45 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 17 Mar 2025 20:48:44 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH v2] coresight: Fixes device's owner field for registered using coresight_init_driver()
Date: Mon, 17 Mar 2025 20:41:06 +0800
Message-ID: <20250317124106.271374-1-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.30.45]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054852_244424_C0E096AD 
X-CRM114-Status: GOOD (  10.64  )
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

The coresight_init_driver() of the coresight-core module is called from
the sub coresgiht device (such as tmc/stm/funnle/...) module. It calls
amba_driver_register() and Platform_driver_register(), which are macro
functions that use the coresight-core's module to initialize the caller's
owner field.  Therefore, when the sub coresight device calls
coresight_init_driver(), an incorrect THIS_MODULE value is captured.

The sub coesgiht modules can be removed while their callbacks are
running, resulting in a general protection failure.

User a macro to automatically add the THIS_MODULE param to
coresight_init_driver() to fix this.

Fixes: 075b7cd7ad7d ("coresight: Add helpers registering/removing both AMBA and platform drivers")
Signed-off-by: Junhao He <hejunhao3@huawei.com>
---
Changes in v2:
- even a macro to automatically add the THIS_MODULE param for coresight_init_driver();
- Link to v1: https://lore.kernel.org/lkml/c3744062-f7c1-82df-2fa1-591da3b2dc5e@huawei.com/T/
---
 drivers/hwtracing/coresight/coresight-core.c | 11 ++++++-----
 include/linux/coresight.h                    |  7 +++++--
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..abf2e4fd4de0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1486,18 +1486,19 @@ static void __exit coresight_exit(void)
 module_init(coresight_init);
 module_exit(coresight_exit);
 
-int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
-			  struct platform_driver *pdev_drv)
+int coresight_init_driver_owner(const char *drv, struct amba_driver *amba_drv,
+				struct platform_driver *pdev_drv,
+				struct module *owner)
 {
 	int ret;
 
-	ret = amba_driver_register(amba_drv);
+	ret = __amba_driver_register(amba_drv, owner);
 	if (ret) {
 		pr_err("%s: error registering AMBA driver\n", drv);
 		return ret;
 	}
 
-	ret = platform_driver_register(pdev_drv);
+	ret = __platform_driver_register(pdev_drv, owner);
 	if (!ret)
 		return 0;
 
@@ -1505,7 +1506,7 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 	amba_driver_unregister(amba_drv);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(coresight_init_driver);
+EXPORT_SYMBOL_GPL(coresight_init_driver_owner);
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 17276965ff1d..b07455956f7a 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -689,8 +689,11 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   enum coresight_dev_type type,
 			   union coresight_dev_subtype subtype);
 
-int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
-			  struct platform_driver *pdev_drv);
+int coresight_init_driver_owner(const char *drv, struct amba_driver *amba_drv,
+				struct platform_driver *pdev_drv, struct module *owner);
+
+#define coresight_init_driver(name, amba_drv, pdev_drv)	\
+	coresight_init_driver_owner(name, amba_drv, pdev_drv, THIS_MODULE)
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv);
-- 
2.33.0


