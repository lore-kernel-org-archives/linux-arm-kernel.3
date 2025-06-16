Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D871C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 06:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JaHLf9KfRo2VVBm/L+KWAkPFYYQXJ1K4MSPWDgFDkGw=; b=PkvKB5PdPUqHi0rkHnsJFyUqiS
	/xeQ/o+5SRCouFIx9U02xt8UbXW1UYLOnlK0r//LMRMS7U2JKsVVi81/K8kRG7Nhi0AduaPaiWInk
	vj5bVmDpJZpNgB6nMtWFHl11VSt+5Cd8av0omMPVqLB0qJdfawkrCyricDBb5z7wpxG5xJjiby1rT
	FQtdHhT8Fbxr13ZEklCRnFoYLPI9SfditeJ35dZJSop+QxHKUFu1b7SNn4WF0w4V4kY/iO1xi6AW/
	NYm1sNSl4BEvyDGQFRgHfyiUj7waFDs/JdDrb4ZHluW/WYG3fXerlUJkoO6HRPvfvl090/s3kYXlR
	+XdU0+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2xp-00000003TSI-00jw;
	Mon, 16 Jun 2025 06:05:01 +0000
Received: from ssh247.corpemail.net ([210.51.61.247])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2vb-00000003THu-3Esp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 06:02:45 +0000
Received: from jtjnmail201611.home.langchao.com
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202506161402218282;
        Mon, 16 Jun 2025 14:02:21 +0800
Received: from locahost.localdomain.com (10.94.7.110) by
 jtjnmail201611.home.langchao.com (10.100.2.11) with Microsoft SMTP Server id
 15.1.2507.57; Mon, 16 Jun 2025 14:02:20 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <vkoul@kernel.org>, <vz@mleia.com>, <manabian@gmail.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] dmaengine: Add NULL check in lpc18xx_dmamux_reserve()
Date: Mon, 16 Jun 2025 14:02:12 +0800
Message-ID: <20250616060212.1560-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.7.110]
tUid: 2025616140221cf4a46ee16339d92f0bdbd1e77ac196c
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_230244_056309_A7AB272A 
X-CRM114-Status: GOOD (  12.36  )
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

The function of_find_device_by_node() may return NULL if the device
node is not found or CONFIG_OF not defined.
Add  check whether the return value is NULL and set the error code
to be returned as -ENODEV.

Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/dma/lpc18xx-dmamux.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
index 2b6436f4b193..ef9aed4ba173 100644
--- a/drivers/dma/lpc18xx-dmamux.c
+++ b/drivers/dma/lpc18xx-dmamux.c
@@ -53,11 +53,16 @@ static void lpc18xx_dmamux_free(struct device *dev, void *route_data)
 static void *lpc18xx_dmamux_reserve(struct of_phandle_args *dma_spec,
 				    struct of_dma *ofdma)
 {
-	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
-	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
 	unsigned long flags;
 	unsigned mux;
 
+	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
+
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	struct lpc18xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
+
 	if (dma_spec->args_count != 3) {
 		dev_err(&pdev->dev, "invalid number of dma mux args\n");
 		return ERR_PTR(-EINVAL);
-- 
2.43.0


