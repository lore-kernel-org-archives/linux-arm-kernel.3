Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DD710A3D8F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5T3dqUIFdk8oflPCpdRg+ZYT5yYTDnqVG3b3eZtqqH4=; b=zNl3IKNs0NBetcolM6axnOIyj7
	sJt9Pz4njpM1XOmAjNAvc937VrKDTl6RaUdunW/2sqS4ZnlR/5GEHhEKkrma44vITCQ7rPvX7rIzi
	SJwH7Ahe55IllW3CgLu6Gbd4BYnhAsMwPxMb/inaRShfzFpzhOCOB8bouu5wr7pr5f7ttNRvJtA+e
	kmFDnNC0Ms4Mn5OLFyQ8ttyCNnVL5mWUTXsabRiI+0tcjUKCmzQaCrM3u9fj1kTrM4PiwngU9GgfY
	tccW+jt6MP2Q3LJD3XM1odMw5A2LooCa8kdld+ZIFaUAaD45SRvxYTrgrCFwRt6ZYpbFS2v+95GYH
	WnfaFqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k0L-00000005Su8-0PyP;
	Thu, 26 Mar 2026 12:40:05 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k01-00000005SkG-0uRh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:39:48 +0000
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fhNVC5nLPz1prKM;
	Thu, 26 Mar 2026 20:33:23 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id DA90640569;
	Thu, 26 Mar 2026 20:39:32 +0800 (CST)
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
Subject: [PATCH v1 04/10] devfreq: Factor out devfreq_set_governor[_locked]()
Date: Thu, 26 Mar 2026 20:34:22 +0800
Message-ID: <20260326123428.800407-5-zhanjie9@hisilicon.com>
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
X-CRM114-CacheID: sfid-20260326_053946_092303_B1C996B3 
X-CRM114-Status: GOOD (  18.71  )
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

Factor out common governor setting logic into devfreq_set_governor() to
reduce code duplication in governor_store() and devfreq_add_device().

Additionally, devfreq_set_governor_locked() is used when
'devfreq_list_lock' is already held by the caller, e.g. in
devfreq_set_governor(), to avoid an immediate relock after unlock.

Note that the new functions support setting a governor even if
devfreq->governor is NULL.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 129 +++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 66 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index e54e3092e0e0..378a01f71165 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -313,6 +313,64 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
 	return governor;
 }
 
+static int devfreq_set_governor_locked(struct devfreq *df,
+				       const struct devfreq_governor *new_gov)
+{
+	const struct devfreq_governor *old_gov;
+	struct device *dev;
+	int ret;
+
+	old_gov = df->governor;
+	dev = &df->dev;
+
+	if (old_gov) {
+		if (old_gov == new_gov)
+			return 0;
+
+		if (IS_SUPPORTED_FLAG(old_gov->flags, IMMUTABLE) ||
+		    IS_SUPPORTED_FLAG(new_gov->flags, IMMUTABLE))
+			return -EINVAL;
+
+		/* Stop the current governor */
+		ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
+		if (ret) {
+			dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
+				 __func__, df->governor->name, ret);
+			return ret;
+		}
+	}
+
+	/* Start the new governor */
+	df->governor = new_gov;
+	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
+	if (ret) {
+		dev_warn(dev, "%s: Governor %s not started(%d)\n",
+			 __func__, df->governor->name, ret);
+
+		if (!old_gov)
+			return ret;
+
+		/* Restore previous governor */
+		df->governor = old_gov;
+		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
+		if (ret) {
+			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
+				__func__, old_gov->name, ret);
+			df->governor = NULL;
+			return ret;
+		}
+	}
+
+	return sysfs_update_group(&df->dev.kobj, &gov_attr_group);
+}
+
+static int devfreq_set_governor(struct devfreq *df,
+				const struct devfreq_governor *new_gov)
+{
+	guard(mutex)(&devfreq_list_lock);
+	return devfreq_set_governor_locked(df, new_gov);
+}
+
 static int devfreq_notify_transition(struct devfreq *devfreq,
 		struct devfreq_freqs *freqs, unsigned int state)
 {
@@ -936,22 +994,11 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	}
 
 	mutex_lock(&devfreq_list_lock);
-	devfreq->governor = governor;
-	err = devfreq->governor->event_handler(devfreq, DEVFREQ_GOV_START,
-						NULL);
-	if (err) {
-		dev_err_probe(dev, err,
-			"%s: Unable to start governor for the device\n",
-			 __func__);
-		goto err_init;
-	}
-
-	err = sysfs_update_group(&devfreq->dev.kobj, &gov_attr_group);
+	err = devfreq_set_governor_locked(devfreq, governor);
 	if (err)
-		goto err_init;
+		goto err_devfreq;
 
 	list_add(&devfreq->node, &devfreq_list);
-
 	mutex_unlock(&devfreq_list_lock);
 
 	if (devfreq->profile->is_cooling_device) {
@@ -962,8 +1009,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
 
 	return devfreq;
 
-err_init:
-	mutex_unlock(&devfreq_list_lock);
 err_devfreq:
 	devfreq_remove_device(devfreq);
 	devfreq = NULL;
@@ -1409,7 +1454,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	struct devfreq *df = to_devfreq(dev);
 	int ret;
 	char str_governor[DEVFREQ_NAME_LEN + 1];
-	const struct devfreq_governor *governor, *prev_governor;
+	const struct devfreq_governor *governor;
 
 	if (!df->governor)
 		return -EINVAL;
@@ -1422,57 +1467,9 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	if (IS_ERR(governor))
 		return PTR_ERR(governor);
 
-	guard(mutex)(&devfreq_list_lock);
-	if (df->governor == governor)
-		return count;
-
-	if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE) ||
-	    IS_SUPPORTED_FLAG(governor->flags, IMMUTABLE))
-		return -EINVAL;
-
-	/*
-	 * Stop the current governor and remove the specific sysfs files
-	 * which depend on current governor.
-	 */
-	ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
-	if (ret) {
-		dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
-			 __func__, df->governor->name, ret);
-		return ret;
-	}
-
-	/*
-	 * Start the new governor and create the specific sysfs files
-	 * which depend on the new governor.
-	 */
-	prev_governor = df->governor;
-	df->governor = governor;
-	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
-	if (ret) {
-		dev_warn(dev, "%s: Governor %s not started(%d)\n",
-			 __func__, df->governor->name, ret);
-
-		/* Restore previous governor */
-		df->governor = prev_governor;
-		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
-		if (ret) {
-			dev_err(dev,
-				"%s: reverting to Governor %s failed (%d)\n",
-				__func__, prev_governor->name, ret);
-			df->governor = NULL;
-			return ret;
-		}
-	}
-
-	/*
-	 * Create the sysfs files for the new governor. But if failed to start
-	 * the new governor, restore the sysfs files of previous governor.
-	 */
-	ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
-	if (ret)
-		return ret;
+	ret = devfreq_set_governor(df, governor);
 
-	return count;
+	return ret ? ret : count;
 }
 static DEVICE_ATTR_RW(governor);
 
-- 
2.43.0


