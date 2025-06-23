Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82569C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec2JA3or6dFFIMkxox5Q3lrfsEbAcsv8QEtHFcWkvTg=; b=LHVyKt7GBkXZ2/KrQvSDo/eUfp
	WQnb1mhcIPm0pvXdqg3ZCO6oOVnUNbpvbZlPuKxoN74jcL3lcCWlQff95r7Nj9yde2zhkCiT1Eue9
	rPO0nd0yPZbXFeSZx/yd0p21mJE0aXrAD3UyI/WkGBzLoJh7sJcHllhkm2G/IqojqkNHRBHCab1s+
	8lPzpCyXNv6kfnsgv2v18gwy0MYWV/HgSdUbXpVeXwER3C+owp6uDlPGWNLAZKvtsfy5R1AHqDyLA
	StXManWE8z80sNFRhph4achYPqnc9VsQwARi/LJTY0ngLIetBVrxLV09AOF/AvHiBfA7+5CRwDabj
	cZPsqE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlcc-00000003eQU-1Fu7;
	Mon, 23 Jun 2025 18:10:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiM3-000000035d1-2GOM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:41:06 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bQrHT0l0jz10XKW;
	Mon, 23 Jun 2025 22:36:21 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 99E851402DB;
	Mon, 23 Jun 2025 22:40:57 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemo100006.china.huawei.com (7.202.195.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Jun 2025 22:40:56 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <jonathan.cameron@huawei.com>
Subject: [PATCH v6 1/2] PM / devfreq: Allow devfreq driver to add custom sysfs ABIs
Date: Mon, 23 Jun 2025 22:34:00 +0800
Message-ID: <20250623143401.4095045-2-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250623143401.4095045-1-zhanjie9@hisilicon.com>
References: <20250623143401.4095045-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074103_764403_9643165D 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: zhanjie9@hisilicon.com, yubowen8@huawei.com, zhenglifeng1@huawei.com, linux-pm@vger.kernel.org, liwei728@huawei.com, linuxarm@huawei.com, lihuisong@huawei.com, prime.zeng@hisilicon.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Extend the devfreq_dev_profile to allow drivers optionally create
device-specific sysfs ABIs together with other common devfreq ABIs under
the devfreq device path.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Huisong Li <lihuisong@huawei.com>
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


