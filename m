Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA2410A3D81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sO8t3bVUURQPDm2bVyrzbal2Xet2RDT3B2uHVhqbo4E=; b=nE9ng2zISvVJXIM5g9uHqvlRKw
	1PrTGX3BCQ3kl2rAAzHP4lNrOASVDXMpk1BLIkRoFxdQ98ccbtlX9O4gOZ0LzQA8KbI/3+BqNRUd9
	UKAcrYIIrzn3Trm/wpRZk7qcIZ0QKR+p10nDciJRNGxJrWdsp9EthNhPWTo9pzoF099vXUp7B4YCK
	cNN2VXjHlOjDKnwKGgIdibtIPqWZtr9vL5i1Y1Qo6Hg9WpT5b5lZZd1nLZs5aC6S6zlkTvU9X4ZiY
	vrTUpI1wqWcmsawePqQrHckzs267KNcqAl9sBVx4ccYfGwMimXfyRv3maNJpVAQvzVYwiitlM/IZr
	lm2RyCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k0L-00000005Sul-1nNx;
	Thu, 26 Mar 2026 12:40:05 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k02-00000005SkF-1V9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:39:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fhNW05H7PznTVZ;
	Thu, 26 Mar 2026 20:34:04 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id B6CD440563;
	Thu, 26 Mar 2026 20:39:31 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Mar 2026 20:39:31 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <tianyaxiong@kylinos.cn>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>,
	<jonathan.cameron@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: [PATCH v1 01/10] devfreq: Use mutex guard in governor_store()
Date: Thu, 26 Mar 2026 20:34:19 +0800
Message-ID: <20260326123428.800407-2-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260326_053947_040571_32C0B929 
X-CRM114-Status: GOOD (  11.62  )
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

Use mutex guard in governor_store() so as to simplify the locking logic.

No functional impact intended.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index fcad3edceeea..21aa9661de0b 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1431,20 +1431,17 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	if (ret != 1)
 		return -EINVAL;
 
-	mutex_lock(&devfreq_list_lock);
+	guard(mutex)(&devfreq_list_lock);
 	governor = try_then_request_governor(str_governor);
-	if (IS_ERR(governor)) {
-		ret = PTR_ERR(governor);
-		goto out;
-	}
-	if (df->governor == governor) {
-		ret = 0;
-		goto out;
-	} else if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE)
-		|| IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE)) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (IS_ERR(governor))
+		return PTR_ERR(governor);
+
+	if (df->governor == governor)
+		return count;
+
+	if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE) ||
+	    IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE))
+		return -EINVAL;
 
 	/*
 	 * Stop the current governor and remove the specific sysfs files
@@ -1454,7 +1451,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	if (ret) {
 		dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
 			 __func__, df->governor->name, ret);
-		goto out;
+		return ret;
 	}
 
 	/*
@@ -1476,7 +1473,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 				"%s: reverting to Governor %s failed (%d)\n",
 				__func__, prev_governor->name, ret);
 			df->governor = NULL;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -1485,13 +1482,10 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	 * the new governor, restore the sysfs files of previous governor.
 	 */
 	ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
+	if (ret)
+		return ret;
 
-out:
-	mutex_unlock(&devfreq_list_lock);
-
-	if (!ret)
-		ret = count;
-	return ret;
+	return count;
 }
 static DEVICE_ATTR_RW(governor);
 
-- 
2.43.0


