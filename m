Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696BBC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NC/npkzttGhkm7/aOaRE1XLBdXNeOE+DBMwptaCSHxs=; b=c6SO98cQtuNUaFbdtjer7eZNRl
	ukqeshN/E9iTUV/lugvyb842L/R7ySvpxg0R9qZUGKQaZUR/2KeLCzbI9HZc0eI0SD78UQXbt5zfn
	xmptL8f4tlLWh3Xe3NeKibJt74q5uMo9OhpQPgrSTD9tdNSNYWg+T0RGrUKLmu9u1DQyh3RCSYTV7
	SUiIRbB56rqRkvIFumPtXcy+lyWbIYNfCTAFMKHcDapo0qRzGNCDHy+d0IE527l/CGC2BzeaAOiyL
	U8k3a7/q/RjTg3lo3+X2yg1FPGmxnCR/enDnhdZ2ZTx0UyFXCr5Rgcp2jXnahTxaQr/WNajM4whsK
	dvWcsV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvBL-000000000pJ-0FkG;
	Fri, 30 May 2025 08:33:39 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKv2g-0000000Haqi-0DET
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 08:24:43 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4b7x4b6grVzQjvN;
	Fri, 30 May 2025 16:20:15 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id B1E8118046A;
	Fri, 30 May 2025 16:24:23 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemo100006.china.huawei.com (7.202.195.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 16:24:22 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>
Subject: [PATCH v4 1/2] PM / devfreq: Allow devfreq driver to add custom sysfs ABIs
Date: Fri, 30 May 2025 16:17:21 +0800
Message-ID: <20250530081722.280776-2-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250530081722.280776-1-zhanjie9@hisilicon.com>
References: <20250530081722.280776-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_012442_241834_8059D1BE 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: zhanjie9@hisilicon.com, yubowen8@huawei.com, linux-pm@vger.kernel.org, zhenglifeng1@huawei.com, liwei728@huawei.com, linuxarm@huawei.com, lihuisong@huawei.com, prime.zeng@hisilicon.com, jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Extend the devfreq_dev_profile to allow drivers optionally create
device-specific sysfs ABIs together with other common devfreq ABIs under
the devfreq device path.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/devfreq/devfreq.c | 1 +
 include/linux/devfreq.h   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 46f3a8053197..59f4656f5ed6 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -831,6 +831,7 @@ struct devfreq *devfreq_add_device(struct device *dev,
 	mutex_lock(&devfreq->lock);
 	devfreq->dev.parent = dev;
 	devfreq->dev.class = devfreq_class;
+	devfreq->dev.groups = profile->dev_groups;
 	devfreq->dev.release = devfreq_dev_release;
 	INIT_LIST_HEAD(&devfreq->node);
 	devfreq->profile = profile;
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index d312ffbac4dd..dc1075dc3446 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -103,6 +103,8 @@ struct devfreq_dev_status {
  *
  * @is_cooling_device: A self-explanatory boolean giving the device a
  *                     cooling effect property.
+ * @dev_groups:		Optional device-specific sysfs attribute groups that to
+ *			be attached to the devfreq device.
  */
 struct devfreq_dev_profile {
 	unsigned long initial_freq;
@@ -119,6 +121,8 @@ struct devfreq_dev_profile {
 	unsigned int max_state;
 
 	bool is_cooling_device;
+
+	const struct attribute_group **dev_groups;
 };
 
 /**
-- 
2.33.0


