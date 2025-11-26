Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A370D1038C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFLEfYAYFrOaTSfjRn6pWq/oFrmnU+L3G+p2MzgqcCA=; b=OmJ43Nrj5R8Oy/emnpgTdwH8U+
	P4ZWY9ijxWpsEOKDmmRS7HJya1ynu32hodJaZVNUjApl62nNnB5Y+3cokNElX+U1zHQDV1aZ6RQ3p
	rHmBuoloSUsZJp1m7cuFnBEfIRtyzxO6NJNDv+56IoLxeSx8GUK9KQPhswTXqgbeigpIXbA5XrzEb
	stycknuu5XlJUh/GsT/8+8gN0PCd2vjbfTFnv0ph44UX8ef1YDwfW4crkNgMHmNG7DAmGuA+ngt6Y
	QFnrraFs0MZanFTGjKx+DixugSiR8tNqz4sgi3RUpptxOUKPly6bD54A7xkY+/7Z4nEVFBRWR10fd
	5kkQOP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOArV-0000000EbNO-10w6;
	Wed, 26 Nov 2025 08:26:53 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOArQ-0000000EbKy-3wis
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:26:50 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 26 Nov
 2025 16:26:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 26 Nov 2025 16:26:30 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 26 Nov 2025 16:26:31 +0800
Subject: [PATCH 2/2] usb: gadget: aspeed-vhub: Add ast2700 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-upstream_vhub-v1-2-910709937ee0@aspeedtech.com>
References: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
In-Reply-To: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764145590; l=3392;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=XJdF9MCn8Pm6rI4iV4Bh37iuRCq4FiLatSLLzYg37h8=;
 b=k2Ze75FXE2h0eA718POum8cFam+q5CvdRbLXHXrZ3VFlrEZqA1dLFcckFGktL/yhO3sXIbFYu
 Lal8osCN+tjBimjMMpnDxxjN9PZx4aAkXNr62u+2hzruinIdUVSm0/V
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_002648_984360_A2FE4DDF 
X-CRM114-Status: GOOD (  17.11  )
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

Add support for the AST2700 SOC in the vhub gadget driver. AST2700
uses a 64-bit DMA addressing capability, so select 64-bit DMA mask
for compatible. AST2700 vhub also requires an reset line, so hook
up the optional reset control and assert/deassert it during probe
and remove.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/core.c | 30 ++++++++++++++++++++++++++++++
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
index f2685f89b3e5..19c1849ae665 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
@@ -23,6 +23,7 @@
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/dma-mapping.h>
+#include <linux/reset.h>
 
 #include "vhub.h"
 
@@ -280,6 +281,8 @@ static void ast_vhub_remove(struct platform_device *pdev)
 	if (vhub->clk)
 		clk_disable_unprepare(vhub->clk);
 
+	reset_control_assert(vhub->rst);
+
 	spin_unlock_irqrestore(&vhub->lock, flags);
 
 	if (vhub->ep0_bufs)
@@ -294,6 +297,7 @@ static void ast_vhub_remove(struct platform_device *pdev)
 static int ast_vhub_probe(struct platform_device *pdev)
 {
 	enum usb_device_speed max_speed;
+	const u64 *dma_mask_ptr;
 	struct ast_vhub *vhub;
 	struct resource *res;
 	int i, rc = 0;
@@ -348,6 +352,16 @@ static int ast_vhub_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	vhub->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	if (IS_ERR(vhub->rst)) {
+		rc = PTR_ERR(vhub->rst);
+		goto err;
+	}
+
+	rc = reset_control_deassert(vhub->rst);
+	if (rc)
+		goto err;
+
 	/* Check if we need to limit the HW to USB1 */
 	max_speed = usb_get_maximum_speed(&pdev->dev);
 	if (max_speed != USB_SPEED_UNKNOWN && max_speed < USB_SPEED_HIGH)
@@ -370,6 +384,12 @@ static int ast_vhub_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
+	if (dma_mask_ptr) {
+		rc = dma_coerce_mask_and_coherent(&pdev->dev, *dma_mask_ptr);
+		if (rc)
+			goto err;
+	}
 	/*
 	 * Allocate DMA buffers for all EP0s in one chunk,
 	 * one per port and one for the vHub itself
@@ -412,15 +432,25 @@ static int ast_vhub_probe(struct platform_device *pdev)
 	return rc;
 }
 
+static const u64 dma_mask_32 =	DMA_BIT_MASK(32);
+static const u64 dma_mask_64 =	DMA_BIT_MASK(64);
+
 static const struct of_device_id ast_vhub_dt_ids[] = {
 	{
 		.compatible = "aspeed,ast2400-usb-vhub",
+		.data = &dma_mask_32,
 	},
 	{
 		.compatible = "aspeed,ast2500-usb-vhub",
+		.data = &dma_mask_32,
 	},
 	{
 		.compatible = "aspeed,ast2600-usb-vhub",
+		.data = &dma_mask_32,
+	},
+	{
+		.compatible = "aspeed,ast2700-usb-vhub",
+		.data = &dma_mask_64,
 	},
 	{ }
 };
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 6b9dfa6e10eb..aca2050e2db0 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -388,6 +388,7 @@ struct ast_vhub {
 	spinlock_t			lock;
 	struct work_struct		wake_work;
 	struct clk			*clk;
+	struct reset_control		*rst;
 
 	/* EP0 DMA buffers allocated in one chunk */
 	void				*ep0_bufs;

-- 
2.34.1


