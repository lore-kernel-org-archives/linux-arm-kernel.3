Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D79CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 02:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSA9xG82troa9yY24wx3bt6Js+CygEc1emHFBUCpFMk=; b=spLczbDDWYwWJdMA6NV45FIxWt
	KOwGzpcmKlgsCrTKvGuz2/1obPOUuw27K1gUNh/uZMIhmrs088bekb6QeH/UrDoTmIEGyqATkAYKh
	vu8JoD9rxAcd9rmLwi1oWS7pkHhQvlrYtJR/DTi5+RK+NWqPFq0wiUtiVQFiaI5bU4J2PeJJRTK3N
	D8i0+e9jNjSFaxzAXJ9dcrXYS37PspJsX5g2D57XiiTric0RzPD96OEuR0LSpQ3stBN1rQmbCUUqY
	dAMHubzyUcJzLjYmcroBWfnnNa1xDjGPfOydstehp1k4UQMmx8+tOorjkTxhwPzhmAsvnG378bcua
	LCzYr2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utdMT-00000003HlW-2djd;
	Wed, 03 Sep 2025 02:36:37 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utdJk-00000003Gvi-3Ksl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 02:33:50 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cGml03k74zPqLR;
	Wed,  3 Sep 2025 10:29:00 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 16DEA1401F2;
	Wed,  3 Sep 2025 10:33:37 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 3 Sep 2025 10:33:36 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <maz@kernel.org>, <lpieralisi@kernel.org>, <tglx@linutronix.de>,
	<wanghaibin.wang@huawei.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] irqchip/gic-v5: Remove the redundant ITS cache invalidation
Date: Wed, 3 Sep 2025 10:33:19 +0800
Message-ID: <20250903023319.1820-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_193348_982938_006C8DBA 
X-CRM114-Status: UNSURE (   7.06  )
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

An ITS cache invalidation has been performed immediately after programming
the L2 DTE in gicv5_its_device_register(). No need to perform it again
right after a successful gicv5_its_device_register().

Remove it.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 2fb58d76f521..554485f0be1f 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -768,8 +768,6 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(struct gicv5_its_chip_data *
 		goto out_dev_free;
 	}
 
-	gicv5_its_device_cache_inv(its, its_dev);
-
 	its_dev->its_node = its;
 
 	its_dev->event_map = (unsigned long *)bitmap_zalloc(its_dev->num_events, GFP_KERNEL);
-- 
2.33.0


