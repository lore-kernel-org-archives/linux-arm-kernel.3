Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE592C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4eYU3ZxSfWYfJjXUT/OLYA5z9ysbFLl37WGlaPE0afs=; b=mXiqWzHzgtV37l3V+GKGnYU7zI
	jHe2fUFR9yl3ziML6oVOl4vLZD7CPcVpOHJZu9uAi9HECxa8LywRvT24RLOIxiNlcAaV0D1/uYPum
	uO5gPZteh8R4i4tl8CIHOWMPdYU7Fy4aU/8ad7C8H3P+/d8DN5IzKJE64g7IoES9T7wQR2YCAcqE8
	GH+uA9q06Y9fwCSJsPQDVMlq9PTT1hAkS2d3Y0lJXFookzzaxhvDbgVwj2UpNA3FdP9AGC0qUMpor
	pUsZXrfLxAZBpYdp+KeuFjrG+FFNW8WXqUOnnOs591dIPk+3ZNFL2bskxJe9yJOVp6Z0D5Cm8Df6x
	DGXB8TTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8YA-00000004IOv-0Fme;
	Mon, 16 Jun 2025 12:02:54 +0000
Received: from ssh247.corpemail.net ([210.51.61.247])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7MS-0000000474w-3TGI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:46:46 +0000
Received: from jtjnmail201609.home.langchao.com
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id 202506161846428300;
        Mon, 16 Jun 2025 18:46:42 +0800
Received: from locahost.localdomain.com (10.94.7.47) by
 jtjnmail201609.home.langchao.com (10.100.2.9) with Microsoft SMTP Server id
 15.1.2507.57; Mon, 16 Jun 2025 18:46:41 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <vkoul@kernel.org>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] dmaengine: Add NULL check in lpc32xx_dmamux_reserve()
Date: Mon, 16 Jun 2025 18:46:39 +0800
Message-ID: <20250616104639.1935-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.7.47]
tUid: 20256161846422d0a45c691b7d8b77f613f0ad9ce8be6
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_034645_125275_25F53067 
X-CRM114-Status: GOOD (  12.44  )
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
node cannot be found or if CONFIG_OF is not defined, dereferencing
it without NULL check may lead to NULL dereference.
Add a check to verify whether the return value is NULL.

Fixes: 5d318b595982 ("dmaengine: Add dma router for pl08x in LPC32XX SoC")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/dma/lpc32xx-dmamux.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
index 351d7e23e615..6dc67d2f3335 100644
--- a/drivers/dma/lpc32xx-dmamux.c
+++ b/drivers/dma/lpc32xx-dmamux.c
@@ -90,13 +90,20 @@ static void lpc32xx_dmamux_release(struct device *dev, void *route_data)
 static void *lpc32xx_dmamux_reserve(struct of_phandle_args *dma_spec,
 				    struct of_dma *ofdma)
 {
-	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
-	struct device *dev = &pdev->dev;
-	struct lpc32xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
+	struct platform_device *pdev;
+	struct device *dev;
+	struct lpc32xx_dmamux_data *dmamux;
 	unsigned long flags;
 	struct lpc32xx_dmamux *mux = NULL;
 	int i;
 
+	pdev = of_find_device_by_node(ofdma->of_node);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	dev = &pdev->dev;
+	dmamux = platform_get_drvdata(pdev);
+
 	if (dma_spec->args_count != 3) {
 		dev_err(&pdev->dev, "invalid number of dma mux args\n");
 		return ERR_PTR(-EINVAL);
-- 
2.43.0


