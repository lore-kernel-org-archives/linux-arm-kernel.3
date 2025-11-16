Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107ECEBF8E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 01:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KAnQqWtXYZwJC9EQtUBJRb0+BUWt7eHcrQ5Io35i/mw=; b=Msonwgsh1hYFwNnO7wUeRbMNV+
	jDybZZseqcC8Rvo5Z2nMj19DIuPvRZJgJXCEUr8w6KiGGRSvEXRoFwezmG4M1MamrAVKUWIfCSFSL
	y+vdXtCWbW4F+1qB40jMeQtZoG30B0qIEGsls1qh+OdIktqAzRkbCsS0qIUNJTSXFFl4hWtm3S9bF
	z/QlqrzLvqYYCXEOerztZMs7MkAI2yEwPkGKWNnjnpyq+kWgxDsVajwhaQujj0O0BKxN5d1zRknfT
	I7xT2hPMQPkgAWbEvQGvA/EuZOaVuuowyPfpgGOWw1wOPBSWT8LGOGQpRn36g6psmufIjph25FqlU
	C6n+QY7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKRu7-0000000EHlS-1yBN;
	Sun, 16 Nov 2025 01:50:11 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKRu3-0000000EHl6-3tbl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 01:50:09 +0000
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-03 (Coremail) with SMTP id rQCowACHD9K9LRlpsrLqAA--.8809S2;
	Sun, 16 Nov 2025 09:50:00 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	make24@iscas.ac.cn,
	arnd@arndb.de,
	stigge@antcom.de
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: [PATCH] USB: Fix error handling in gadget driver
Date: Sun, 16 Nov 2025 09:49:48 +0800
Message-Id: <20251116014948.14093-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowACHD9K9LRlpsrLqAA--.8809S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF48CrWxCryUAry7Gr15Arb_yoWruryUpr
	18GFWYkrWDGr9Fkw17A3WDuF1SkF4Iy3yrtrZ7G3Wqk3ZxZr9rJ3W8uFy2qF4xJF97Cr4f
	Aanxta10y3W8urUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4
	vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmQ6LU
	UUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_175008_329185_B66E3FB0 
X-CRM114-Status: GOOD (  15.77  )
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

lpc32xx_udc_probe() acquires an i2c_client reference through
isp1301_get_client() but fails to release it in both error handling
paths and the normal removal path. This could result in a reference
count leak for the I2C device, preventing proper cleanup and
potentially leading to resource exhaustion. Add put_device() to
release the reference in the probe failure path and in the remove
function.

Calling path: isp1301_get_client() -> of_find_i2c_device_by_node() ->
i2c_find_device_by_fwnode(). As comments of
i2c_find_device_by_fwnode() says, 'The user must call
put_device(&client->dev) once done with the i2c client.'

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 35 +++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 1a7d3c4f652f..b6fddfff712d 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -2986,6 +2986,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	int retval, i;
 	dma_addr_t dma_handle;
 	struct device_node *isp1301_node;
+	bool isp1301_acquired = false;
 
 	udc = devm_kmemdup(dev, &controller_template, sizeof(*udc), GFP_KERNEL);
 	if (!udc)
@@ -3013,6 +3014,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	if (!udc->isp1301_i2c_client) {
 		return -EPROBE_DEFER;
 	}
+	isp1301_acquired = true;
 
 	dev_info(udc->dev, "ISP1301 I2C device at address 0x%x\n",
 		 udc->isp1301_i2c_client->addr);
@@ -3020,7 +3022,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	pdev->dev.dma_mask = &lpc32xx_usbd_dmamask;
 	retval = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (retval)
-		return retval;
+		goto i2c_fail;
 
 	udc->board = &lpc32xx_usbddata;
 
@@ -3038,28 +3040,32 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	/* Get IRQs */
 	for (i = 0; i < 4; i++) {
 		udc->udp_irq[i] = platform_get_irq(pdev, i);
-		if (udc->udp_irq[i] < 0)
-			return udc->udp_irq[i];
+		if (udc->udp_irq[i] < 0) {
+			retval = udc->udp_irq[i];
+			goto i2c_fail;
+		}
 	}
 
 	udc->udp_baseaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->udp_baseaddr)) {
 		dev_err(udc->dev, "IO map failure\n");
-		return PTR_ERR(udc->udp_baseaddr);
+		retval = PTR_ERR(udc->udp_baseaddr);
+		goto i2c_fail;
 	}
 
 	/* Get USB device clock */
 	udc->usb_slv_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(udc->usb_slv_clk)) {
 		dev_err(udc->dev, "failed to acquire USB device clock\n");
-		return PTR_ERR(udc->usb_slv_clk);
+		retval = PTR_ERR(udc->usb_slv_clk);
+		goto i2c_fail;
 	}
 
 	/* Enable USB device clock */
 	retval = clk_prepare_enable(udc->usb_slv_clk);
 	if (retval < 0) {
 		dev_err(udc->dev, "failed to start USB device clock\n");
-		return retval;
+		goto i2c_fail;
 	}
 
 	/* Setup deferred workqueue data */
@@ -3161,6 +3167,8 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	dma_free_coherent(&pdev->dev, UDCA_BUFF_SIZE,
 			  udc->udca_v_base, udc->udca_p_base);
 i2c_fail:
+	if (isp1301_acquired && udc->isp1301_i2c_client)
+		put_device(&udc->isp1301_i2c_client->dev);
 	clk_disable_unprepare(udc->usb_slv_clk);
 	dev_err(udc->dev, "%s probe failed, %d\n", driver_name, retval);
 
@@ -3170,6 +3178,18 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 static void lpc32xx_udc_remove(struct platform_device *pdev)
 {
 	struct lpc32xx_udc *udc = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct device_node *isp1301_node;
+	bool isp1301_acquired = false;
+
+	/* Check if we acquired isp1301 via device tree */
+	if (dev->of_node) {
+		isp1301_node = of_parse_phandle(dev->of_node, "transceiver", 0);
+		if (isp1301_node) {
+			isp1301_acquired = true;
+			of_node_put(isp1301_node);
+		}
+	}
 
 	usb_del_gadget_udc(&udc->gadget);
 	if (udc->driver) {
@@ -3189,6 +3209,9 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 	dma_free_coherent(&pdev->dev, UDCA_BUFF_SIZE,
 			  udc->udca_v_base, udc->udca_p_base);
 
+	if (isp1301_acquired && udc->isp1301_i2c_client)
+		put_device(&udc->isp1301_i2c_client->dev);
+
 	clk_disable_unprepare(udc->usb_slv_clk);
 }
 
-- 
2.17.1


