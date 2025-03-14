Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8D6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jdZTGA8hBuPyW8In58jZj25X9EizfXYbu1fEZ9mjEoY=; b=2HjO7eZ+t7p9P+99n4NuiYs4//
	Gu31PE8YmZdeHUmKA685QRJ3+V/Tj/PKxdWSZJmBD87IAnpcLZTNxuTTZiLrf7HlNfflUV2Yz7x+h
	upjFdhJ3PxlqmgiR30ndLmxAQ9LyQQOmaHZVmkAtASUS4TnGjn+gzndKEEQwGN8iWuANq0m5qxK/Q
	jp97VmsgdB7/7Iw2YfaTeupp9mTKGWnUi7u+g62e7KsIbXLmPnM98jz6dGesC+Qa4Znq1yytlG08E
	1DQbWbpahHAD4S88QDhWgpQQAPTtaj4YmvBOciUKan/WjUCb0q9MeciIxIYhXbgdiQsZl6YO13Wg2
	0r4zmY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2Dr-0000000DphC-0H7Y;
	Fri, 14 Mar 2025 10:24:59 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1yl-0000000DmnC-0fzZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:09:24 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZDg622dPyz1R6n8;
	Fri, 14 Mar 2025 18:07:38 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 692B4180069;
	Fri, 14 Mar 2025 18:09:20 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Mar 2025 18:09:20 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 18:09:19 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2] soc: hisilicon: kunpeng_hccs: Fix incorrect string assembly
Date: Fri, 14 Mar 2025 18:01:43 +0800
Message-ID: <20250314100143.3377268-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.30.45]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030923_375687_26EBA0CE 
X-CRM114-Status: UNSURE (   9.00  )
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

String assembly should use sysfs_emit_at() instead of sysfs_emit().

Fixes: 23fe8112a231 ("soc: hisilicon: kunpeng_hccs: Add used HCCS types sysfs")
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 8aa8dec14911..444a8f59b7da 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -1539,8 +1539,8 @@ static ssize_t used_types_show(struct kobject *kobj,
 	u16 i;
 
 	for (i = 0; i < hdev->used_type_num - 1; i++)
-		len += sysfs_emit(&buf[len], "%s ", hdev->type_name_maps[i].name);
-	len += sysfs_emit(&buf[len], "%s\n", hdev->type_name_maps[i].name);
+		len += sysfs_emit_at(buf, len, "%s ", hdev->type_name_maps[i].name);
+	len += sysfs_emit_at(buf, len, "%s\n", hdev->type_name_maps[i].name);
 
 	return len;
 }
-- 
2.33.0


