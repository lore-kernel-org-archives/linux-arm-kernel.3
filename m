Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6420EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 06:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gflhu1bWtTuver2SAemQHT0VTVk7DgnlQ/aWJMNvXnM=; b=CaSC2w2VcGzsxGPdpjXWOtPeU8
	MDkSv/+Lxrhi4hFDuigQR4fmKA996LduJHPqhlBB1kbggirr94+LDwFAO01lUOMweapuD0elnEqP+
	CV9HbYJmZWYNa7ghQt935YWzpUQFOkNLNjgst4fsCHb3VUrF5saJnGo1Khqu7UqQ65F9gqtx/ZPkM
	iZ2iEy2LH+M7iMAIwUaYl3yQLOLetIFUbZpf6sLZRjFoaTjJjJZgN21iA9+UEX3gdyFI2+pobEesz
	jVff6iRnbVw3MmYLJddaLbpcxIAwsD/zbky+rOW0BU3pevLq8loEbISBAzxkYgBDa8Xlvb78Z3FEK
	GmVzlD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7Xw-0000000Dt6U-27IG;
	Fri, 11 Jul 2025 06:47:48 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7Nm-0000000Drrx-2jLB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 06:37:20 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bdhlw6PS6z2Bcp0;
	Fri, 11 Jul 2025 14:35:08 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D308140119;
	Fri, 11 Jul 2025 14:37:07 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Jul 2025 14:37:07 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Jul 2025 14:37:06 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH] soc: hisilicon: kunpeng_hccs: Fix incorrect log information
Date: Fri, 11 Jul 2025 14:37:06 +0800
Message-ID: <20250711063706.3121253-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_233718_878121_2564ADE1 
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

The hccs_get_all_spec_port_idle_sta() will tell user which port
is busy when firmware doesn't allow to decrease HCCS lane number.
However, the current log prints the index of die and port instead
of the hardware ID user perceived.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 7fc353732d55..65ff45fdcac7 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -1295,11 +1295,11 @@ static int hccs_get_all_spec_port_idle_sta(struct hccs_dev *hdev, u8 port_type,
 				if (ret) {
 					dev_err(hdev->dev,
 						"hccs%u on chip%u/die%u get idle status failed, ret = %d.\n",
-						k, i, j, ret);
+						port->port_id, chip->chip_id, die->die_id, ret);
 					return ret;
 				} else if (idle == 0) {
 					dev_info(hdev->dev, "hccs%u on chip%u/die%u is busy.\n",
-						k, i, j);
+						 port->port_id, chip->chip_id, die->die_id);
 					return 0;
 				}
 			}
-- 
2.33.0


