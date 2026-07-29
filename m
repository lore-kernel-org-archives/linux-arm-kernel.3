Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FB2C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfDbg2G3jwEYUR1/vctnjrMKKUXMuSO4M/DF8+zsYIg=; b=LBHs9WLPgcqxGsJ6ICjZJ1J3oL
	20s1j7bqR5B4AfE3Pl13qjhbKDYz4KxW9obuTBthg8/Qp3p0WKO2xduHvwQ95uo18aEdMh9oCUZgF
	aa3rmJbpIBEs+ldyhQVyIwFYDbelzBXN6MrjcJuzw3gbWTsTbmsHjkL6AgpQYoXlIQA55kgiYTx6w
	hbpVuxGHhhoWC4cQZ3qZQ/QwDq7q1Lyd1u00t6c5VTR56iTSk2F7wAxXWvpI9lN4ROAomTG1KKLvR
	truwlOy5yWSGg2kHtuOf0vINB4VINM8LMnj8ltorohXFmbJZUe9ai071Vy8ZHpN4nxebecaQPt5CY
	QpIFn9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Z2-00000007YHm-38NW;
	Wed, 29 Jul 2026 10:31:04 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Yz-00000007YEf-1Plt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:31:03 +0000
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h97fT6vN9zpSvB;
	Wed, 29 Jul 2026 18:21:37 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 5EF8C203C1;
	Wed, 29 Jul 2026 18:30:55 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 18:30:54 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cwchoi00@gmail.com>, <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v4 3/4] devfreq: Factor out devfreq_set_governor()
Date: Wed, 29 Jul 2026 18:23:47 +0800
Message-ID: <20260729102348.3857779-4-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
References: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_033101_708316_46FAFCDF 
X-CRM114-Status: GOOD (  20.57  )
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

governor_store() and devfreq_add_device() contain similar logic for setting
a governor when devfreq->governor is NULL.  Merge this into a common
function, devfreq_set_governor(), to reduce code duplication and unify the
entry of setting governors.

This also prepares for further changes that get / put a module refcount of
the active governor and prevent the governor module from being unloaded
while it's in use.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 128 ++++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 61 deletions(-)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 53c40d795a13..959f0b08ed36 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -318,6 +318,70 @@ static struct devfreq_governor *try_then_request_governor(const char *name)
 	return governor;
 }
 
+static int devfreq_set_governor(struct devfreq *df,
+				const struct devfreq_governor *new_gov)
+{
+	const struct devfreq_governor *old_gov;
+	struct device *dev;
+	int ret;
+
+	lockdep_assert_held(&devfreq_list_lock);
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
+		/* Restore previous governor */
+		df->governor = old_gov;
+		if (!df->governor)
+			return ret;
+
+		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
+		if (ret) {
+			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
+				__func__, df->governor->name, ret);
+			df->governor = NULL;
+			return ret;
+		}
+
+		ret = sysfs_update_group(&df->dev.kobj, &gov_attr_group);
+		if (ret)
+			dev_warn(dev, "sysfs update failed (%d)\n", ret);
+
+		/*
+		 * Old governor restored successfully, but the new governor
+		 * failed to start.  Return a distinct error so the caller is
+		 * not misled into thinking the switch succeeded.
+		 */
+		return -EAGAIN;
+	}
+
+	return sysfs_update_group(&df->dev.kobj, &gov_attr_group);
+}
+
 static int devfreq_notify_transition(struct devfreq *devfreq,
 		struct devfreq_freqs *freqs, unsigned int state)
 {
@@ -942,9 +1006,7 @@ struct devfreq *devfreq_add_device(struct device *dev,
 		goto err_init;
 	}
 
-	devfreq->governor = governor;
-	err = devfreq->governor->event_handler(devfreq, DEVFREQ_GOV_START,
-						NULL);
+	err = devfreq_set_governor(devfreq, governor);
 	if (err) {
 		dev_err_probe(dev, err,
 			"%s: Unable to start governor for the device\n",
@@ -952,10 +1014,6 @@ struct devfreq *devfreq_add_device(struct device *dev,
 		goto err_init;
 	}
 
-	err = sysfs_update_group(&devfreq->dev.kobj, &gov_attr_group);
-	if (err)
-		goto err_init;
-
 	list_add(&devfreq->node, &devfreq_list);
 
 	mutex_unlock(&devfreq_list_lock);
@@ -1380,7 +1438,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	struct devfreq *df = to_devfreq(dev);
 	int ret;
 	char str_governor[DEVFREQ_NAME_LEN + 1];
-	const struct devfreq_governor *governor, *prev_governor;
+	const struct devfreq_governor *governor;
 
 	ret = sscanf(buf, "%" __stringify(DEVFREQ_NAME_LEN) "s", str_governor);
 	if (ret != 1)
@@ -1391,59 +1449,7 @@ static ssize_t governor_store(struct device *dev, struct device_attribute *attr,
 	if (IS_ERR(governor))
 		return PTR_ERR(governor);
 
-	if (!df->governor)
-		goto start_new_governor;
-
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
-start_new_governor:
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
-		if (!df->governor)
-			return ret;
-
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
+	ret = devfreq_set_governor(df, governor);
 	if (ret)
 		return ret;
 
-- 
2.43.0


