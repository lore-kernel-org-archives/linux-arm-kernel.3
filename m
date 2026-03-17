Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394FEFB5EAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xODpimur1r9OP3ek2cXYFWP/Dj09csJZsnaRTG5cjYk=; b=oBKP+tZdihQRblEA0sbp17/JJF
	vI1HLCjbbPQCX7iuGZwhWqduorhGZ3zjglfEVh4hEW2i35586uHhNv9/nUMhT99ap/xh0yZxhMQXD
	aXrn5HClHqg5U2ac83f+KwlZvqOFkwo/67pcBlZFHjpIhGXjNhS23fc/wj/LLOHRJdBEqidgzvBY4
	rTy6EzdM6d3EdAJnAIal6N06M+rR5ojEY7z3L8pAuF9M6tT4a/yxQxmnKxHAZjJrBrlFfNFKN8YBr
	imvQVPIMT5fzoON12CBQvJ/ZNPi2tFnEhbhqTx5zii0Q+ZMLFYlilADv7qW7Q/2yeeCm34g7Y3ZJT
	bVvYh1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LZl-00000005MC4-1N6l;
	Tue, 17 Mar 2026 03:58:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LZi-00000005MAC-2dTU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:58:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xODpimur1r9OP3ek2cXYFWP/Dj09csJZsnaRTG5cjYk=;
	b=epJBaOfyfng0I0f/avxkG4PfHKnGfLb5E++WLzxsxoqbIvdCec4E1n9ApeHsrtKet25t4xr0V
	q+BzC8xZ8XAYz7HZnRLAHc5BvPvqYBXaEBjr6tP7h/Aed+m7eTfBVFjeD3dwV3B3bpsVDU/8fTg
	bJjk4ZQnRSFILA+wZ/lO9x4=
Received: from canpmsgout12.his.huawei.com (unknown [172.19.92.144])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fZdTD3RVPz1BFwJ
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:57:36 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xODpimur1r9OP3ek2cXYFWP/Dj09csJZsnaRTG5cjYk=;
	b=epJBaOfyfng0I0f/avxkG4PfHKnGfLb5E++WLzxsxoqbIvdCec4E1n9ApeHsrtKet25t4xr0V
	q+BzC8xZ8XAYz7HZnRLAHc5BvPvqYBXaEBjr6tP7h/Aed+m7eTfBVFjeD3dwV3B3bpsVDU/8fTg
	bJjk4ZQnRSFILA+wZ/lO9x4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fZdM3610BznTWY;
	Tue, 17 Mar 2026 11:52:15 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 46BCC4048B;
	Tue, 17 Mar 2026 11:57:48 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 17 Mar 2026 11:57:48 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 17 Mar 2026 11:57:47 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 2/2] soc: hisilicon: kunpeng_hccs: Remove unused input parameter
Date: Tue, 17 Mar 2026 11:57:46 +0800
Message-ID: <20260317035746.1773605-3-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260317035746.1773605-1-lihuisong@huawei.com>
References: <20260317035746.1773605-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_205834_810695_DBA51211 
X-CRM114-Status: GOOD (  11.71  )
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

The 'hdev' parameter of hccs_create_hccs_dir() is unused.
Remove it to fix the compiler warning.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index d6ff7de63836..0cc2953d59a5 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -1621,8 +1621,7 @@ static void hccs_remove_topo_dirs(struct hccs_dev *hdev)
 	hccs_remove_misc_sysfs(hdev);
 }
 
-static int hccs_create_hccs_dir(struct hccs_dev *hdev,
-				struct hccs_die_info *die,
+static int hccs_create_hccs_dir(struct hccs_die_info *die,
 				struct hccs_port_info *port)
 {
 	int ret;
@@ -1654,7 +1653,7 @@ static int hccs_create_die_dir(struct hccs_dev *hdev,
 
 	for (i = 0; i < die->port_num; i++) {
 		port = &die->ports[i];
-		ret = hccs_create_hccs_dir(hdev, die, port);
+		ret = hccs_create_hccs_dir(die, port);
 		if (ret) {
 			dev_err(hdev->dev, "create hccs%u dir failed.\n",
 				port->port_id);
-- 
2.33.0


