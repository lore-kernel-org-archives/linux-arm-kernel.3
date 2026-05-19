Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EEFCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+pnPrTARTdu/51/UVL2174rlEeK6aiFs3z6XJSynmE=; b=RwVOCMhgs+IZZx/kKD/CbojH6G
	QP7JoL2af9GC/kj77NHLGCc/GwmjoWNi5L2If5SE0jR0eXBu2rrAALcV4qc45VXMiVBijxrGgKnMz
	RiXnNhoNXixhOGS8VFnHme7RfF9TNLCOs6gGjYQS9FbFyPu/OXLlYgB4xiDTSvERrxd5iC+cW/cT7
	V2I6x4IvKvP0xQtl7Mn8Ah6ZH0X7DjN/A2JmYffDwHW+0gax5GTKfs74K17gD6vEFGwhOISO4z7YN
	wfttpiaMKb48SpEnUDSDo9K2n/8S47+/KgNrfzWQR1m9IT/wIrDHPgDJmpk6fpfOhJlov+ML4E3Zp
	2Q4Ej4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIlw-00000001LNr-0wAU;
	Tue, 19 May 2026 11:38:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIlo-00000001LJC-01nx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 11:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a+pnPrTARTdu/51/UVL2174rlEeK6aiFs3z6XJSynmE=; b=OvEsKo5NM9oaN94yKseHjrTL0Y
	nRM1yP0kuhAOfpBDsKdcF6Xj5euwTNIMJKMUS1toL6OSF3qErmEo57Ilj732q65coPTtDF65V5HhS
	ha72Upa/lvqlDKv3BpYcah8PESd0BKSVBYf208AfU6WVfWoX0M1pmb3/ImZaURkYloBG27uyiqm/I
	vnHu04GgBX2Pt3Ei2NRjeSMekG8XZVsLHQcGgY2i/QAVBx+1FgG44camsnBI6otI6jolDQX4zLsIa
	wDlQollPZ568oifxTAuWteNEfqL0YiRlH9JtFGBn5MWLWf2m598ysGU4JsJ1kC52vlHIyykiY39hs
	zoK99uHA==;
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIlk-0000000E4ru-28Da
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:37:54 +0000
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gKXX10GCZzmV96;
	Tue, 19 May 2026 19:29:53 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 109BC40565;
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
Subject: [PATCH v3 1/4] devfreq: Use mutex guard in governor_store()
Date: Tue, 19 May 2026 19:32:47 +0800
Message-ID: <20260519113251.3745140-2-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260519_123753_415697_FE03FDC1 
X-CRM114-Status: GOOD (  13.12  )
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

Reviewed-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index f08fc6966eae..7a70dd051644 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1394,23 +1394,20 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	if (ret != 1)
 		return -EINVAL;
 
-	mutex_lock(&devfreq_list_lock);
+	guard(mutex)(&devfreq_list_lock);
 	governor = try_then_request_governor(str_governor);
-	if (IS_ERR(governor)) {
-		ret = PTR_ERR(governor);
-		goto out;
-	}
+	if (IS_ERR(governor))
+		return PTR_ERR(governor);
+
 	if (!df->governor)
 		goto start_new_governor;
 
-	if (df->governor == governor) {
-		ret = 0;
-		goto out;
-	} else if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE)
-		|| IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE)) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (df->governor == governor)
+		return count;
+
+	if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE) ||
+	    IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE))
+		return -EINVAL;
 
 	/*
 	 * Stop the current governor and remove the specific sysfs files
@@ -1420,7 +1417,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	if (ret) {
 		dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
 			 __func__, df->governor->name, ret);
-		goto out;
+		return ret;
 	}
 
 start_new_governor:
@@ -1438,7 +1435,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 		/* Restore previous governor */
 		df->governor = prev_governor;
 		if (!df->governor)
-			goto out;
+			return ret;
 
 		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
 		if (ret) {
@@ -1446,7 +1443,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 				"%s: reverting to Governor %s failed (%d)\n",
 				__func__, prev_governor->name, ret);
 			df->governor = NULL;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -1455,13 +1452,10 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
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


