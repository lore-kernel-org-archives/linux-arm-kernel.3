Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B134CD68B17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx2qbIVQCfquylI0hSKSiIRssUet/G2LCF/5OEUppKI=; b=0TLiW4J9qg4eLes6mw2lby/Kk7
	QRvsZJaCjrGQ9KiYx5uiC9te/JbM2+LLOP0eYnkZawr6YTRCVY+6VBbE41lDz8HtktnD1T6tFn76o
	cr+Gq1gj0CKYyXb546DOsOMG1/pYMB9v39k3AGfQuo08TimMmNyD7GTNRvtLDYSTQAOoec3JTVlao
	C/cOOciKgWG3H20gYZEy8LtpPsJ0C0E7dBs2ISrF5NrVDJsHVFmhxPmCJVAZwkSAIB/Xhe0AdgqxG
	Q03vZAlq3WMQdn9FrjxNRP8fAD9XHHsxB+Sv6HNcJY1RJhe2fkZCb7wglnupsoo10nJiojir0cx7U
	2nB0AyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBa4c-0000000A5QA-1IgY;
	Thu, 14 Nov 2024 13:39:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBa2e-0000000A50E-2quD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:37:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xq1PZ3H22zpb0m;
	Thu, 14 Nov 2024 21:35:46 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id EA53E18005F;
	Thu, 14 Nov 2024 21:37:38 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 14 Nov
 2024 21:37:38 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.11-rc1 3/6] arm_mpam: Create reqPARTIDs resource bitmap
Date: Thu, 14 Nov 2024 21:50:34 +0800
Message-ID: <20241114135037.918470-4-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114135037.918470-1-zengheng4@huawei.com>
References: <20241114135037.918470-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_053748_897396_12EA562C 
X-CRM114-Status: GOOD (  13.71  )
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

The driver checks whether mpam_partid_max and mpam_intpartid_max are equal
as a basis for supporting reqPARTID. If this feature is supported, use a
bitmap to represent whether the target reqPARTID is available or not.
Create the bitmap during monitor initialization, and the destructor is
called during the monitor exit process.

It is noted that the reqpartid_free_map reserves the first reqPARTID under
each intPARTID (which is equal to the corresponding intPARTID itself). By
default, assigns it to the corresponding control group for use in
monitoring.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index a74133d7b402..01ad6732eac5 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -1000,6 +1000,33 @@ static void mpam_resctrl_monitor_init(struct mpam_class *class,
 	return;
 }
 
+static unsigned long *reqpartid_free_map;
+static int reqpartid_free_map_len;
+
+static int reqpartid_create(void)
+{
+	u32 reqpartid_num = get_num_reqpartid();
+	int i;
+
+	reqpartid_free_map = bitmap_alloc(reqpartid_num, GFP_KERNEL);
+	if (!reqpartid_free_map)
+		return -ENOMEM;
+
+	bitmap_fill(reqpartid_free_map, reqpartid_num);
+
+	/* Reserved for the internal partIDs mapping */
+	for (i = 0; i < resctrl_arch_get_num_closid(NULL); i++)
+		__clear_bit(i, reqpartid_free_map);
+
+	reqpartid_free_map_len = reqpartid_num;
+	return 0;
+}
+
+static void reqpartid_destroy(void)
+{
+	bitmap_free(reqpartid_free_map);
+}
+
 int mpam_resctrl_setup(void)
 {
 	int err = 0;
@@ -1047,6 +1074,10 @@ int mpam_resctrl_setup(void)
 
 	cpus_read_unlock();
 
+	err = reqpartid_create();
+	if (err)
+		return err;
+
 	if (!err && !exposed_alloc_capable && !exposed_mon_capable)
 		err = -EOPNOTSUPP;
 
@@ -1075,6 +1106,8 @@ static void mpam_resctrl_exit(void)
 
 	WRITE_ONCE(resctrl_enabled, false);
 	resctrl_exit();
+
+	reqpartid_destroy();
 }
 
 
-- 
2.25.1


