Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AF9CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xu2Z7V/35MucN60ltV4oxjJ/wVKaDbLfm2CPezooL0=; b=dXHpYniwXKbQqRskVf2wW9QOcb
	4ZQ6hWD9lLrxUDcSLsHJs93IZ284RQJzq1RFTURUNG/RZtDfVdq3hjF/NRBspp7NJsFYo0dRE5R/n
	cIHS1narcjqT5nPpNhqbRCIwklzO/3+0OQ15bBkziToMfCtax5D/dxXoAfvJg6X9hnHyQUOAph8Z2
	l3WKe0U8v3NjK+06ggGxXm5T5mH4uC5ipfANxXMmMLwkqXqXGkn+oC/VNjVTYkxL5kS71LwsJ4eSo
	C9JrL+2QiuIlgcDbpJOaSFn6898YbhwDlOmKB+P1yiX7zBFOleX5V1bRhKkIbKP/Mtr3ooBYjAnKM
	tCOSpK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpxG-000000070DU-3G63;
	Wed, 03 Sep 2025 16:03:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBp-00000006W5D-221g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:06:20 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-U1; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 03 Sep 2025 15:06:16 +0200
Subject: [PATCH 08/11] dmaengine: imx-sdma: fix missing
 of_dma_controller_free()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-v6-16-topic-sdma-v1-8-ac7bab629e8b@pengutronix.de>
References: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
In-Reply-To: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_060617_569140_02C9936B 
X-CRM114-Status: GOOD (  11.16  )
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

Add the missing of_dma_controller_free() to free the resources allocated
via of_dma_controller_register(). The missing free was introduced long
time ago  by commit 23e118113782 ("dma: imx-sdma: use
module_platform_driver for SDMA driver") while adding a proper .remove()
implementation.

Fixes: 23e118113782 ("dma: imx-sdma: use module_platform_driver for SDMA driver")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index e30dd46cf6522ee2aa4d3aca9868a01afbd29615..6c6d38b202dd2deffc36b1bd27bc7c60de3d7403 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2232,6 +2232,13 @@ static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
 				     ofdma->of_node);
 }
 
+static void sdma_dma_of_dma_controller_unregister_action(void *data)
+{
+	struct sdma_engine *sdma = data;
+
+	of_dma_controller_free(sdma->dev->of_node);
+}
+
 static void sdma_dma_device_unregister_action(void *data)
 {
 	struct sdma_engine *sdma = data;
@@ -2370,6 +2377,8 @@ static int sdma_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register controller\n");
 
+	devm_add_action_or_reset(dev, sdma_dma_of_dma_controller_unregister_action, sdma);
+
 	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
 	ret = of_address_to_resource(spba_bus, 0, &spba_res);
 	if (!ret) {

-- 
2.47.2


