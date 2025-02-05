Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3383C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 05:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KU/O/7ev4fbCeDbK7r0sJts/XxWnwh7KmfwoDtDd6Y=; b=q+QXOPjgCDBPSnAcuI63Wivk2N
	rmU2q7hZMNO542OVqLGfAAWnnuAtuQcqk2cg8xHsu3HHZM1mNgSueZz6h8DiI+I+esBEsVeU70RZK
	0ibpzEcNwSx1DQhbhE2hpffnWuLQzJM9JGEPHG9wuVtsw6ppbZpdAsGrMgd9a7JJ62UXp60PFRLwN
	Rzh1a3h9iD+PiADo+uK07+LBvkZu23YHgGKykXsyzt5bN+RbmRiMRGT4ZeyLglTTp4VLFy/xLhXiZ
	hD0rrlRYewVFbCn66ddqqCMs4Fz9kP+S2XuXKukuU5lkup91XstTvG3oAzT/46Fx3afl57wD+ENDR
	dTKyJ0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYK6-00000002MxJ-2wlh;
	Wed, 05 Feb 2025 05:51:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYGT-00000002MUK-40Mm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 05:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738734478; x=1770270478;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=JsjoMsPukH3T9bblFYEe4cs8XB5AgUk3iFQC9hIrb0o=;
  b=rH1GCTISxQEhMvWu9XbQGB7P55r7GZgOVcCX1sED8uBfHRa/QJiMs5T3
   5yMXJfXnOy1pSEMu5+pnD8w7ATqADpNMYSLJKIVjNmPuUQP3vyzBQ59tS
   gsP17vSVbJCD3HvWiezcqJIWma6TTZxPdMm59iX2D9jbqy6NPmXdE2+I1
   2BiVXqMW/ZlPn7jkkd+efa+EdjwUJ1RXKTHbpszlD/XRQKkHWsfXHxYxD
   qE6tS+cpbmGTcXoHgLVI2WwJNO2Eu80T6TvlSg7uL75TkUtE8ADION5Me
   7pDuOOSX0kz99t83cFrMO6X0c15GiDgZuCzKwrNV80+fVRf8VwemjFkWd
   g==;
X-CSE-ConnectionGUID: a1yIP19sQpy3wWAhZXasEg==
X-CSE-MsgGUID: w4SM+3nqQ7OA++T7fyzE7g==
X-IronPort-AV: E=Sophos;i="6.13,260,1732604400"; 
   d="scan'208";a="268620150"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Feb 2025 22:47:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Feb 2025 22:47:17 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 4 Feb 2025 22:47:11 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 5 Feb 2025 11:17:02 +0530
Subject: [PATCH 1/2] dmaengine: at_xdmac: get the number of DMA channels
 from device tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250205-mchp-dma-v1-1-124b639d5afe@microchip.com>
References: <20250205-mchp-dma-v1-0-124b639d5afe@microchip.com>
In-Reply-To: <20250205-mchp-dma-v1-0-124b639d5afe@microchip.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Charan Pedumuru <charan.pedumuru@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Tony Han <tony.han@microchip.com>,
	Cristian Birsan <cristian.birsan@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738734425; l=1880;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=X9SQwn97RGxJg8ugL0Ib/dqZ8wQ0Ij6oC+ZtdNgnIYg=;
 b=3ftho3/4GdrP6BA9CFwUb30ZhtSnR4DgrScHBRl8xbqlrnW2oEimp6Hp9AZca55l2SCQPVHEu
 wN1IVZvpjyKBlkmuMfPIAgLw/aI7RyH9FxvJUQaIJUegfXltGHOleDZ
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_214758_002695_D7886AE5 
X-CRM114-Status: GOOD (  15.12  )
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

From: Tony Han <tony.han@microchip.com>

In case of kernel runs in non-secure mode, the number of DMA channels can be
got from device tree since the value read from GTYPE register is "0" as it's
always secured. As the number of channels can never be negative, update them
to the type "unsigned".

Signed-off-by: Tony Han <tony.han@microchip.com>
Reviewed-by: Cristian Birsan <cristian.birsan@microchip.com>
---
 drivers/dma/at_xdmac.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ba25c23164e7..f777b0665c63 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2259,12 +2259,29 @@ static int __maybe_unused atmel_xdmac_runtime_resume(struct device *dev)
 	return clk_enable(atxdmac->clk);
 }
 
+static inline int at_xdmac_get_channel_number(struct platform_device *pdev,
+					      u32 reg, u32 *pchannels)
+{
+	int ret;
+
+	if (reg) {
+		*pchannels = AT_XDMAC_NB_CH(reg);
+		return 0;
+	}
+
+	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels", pchannels);
+	if (ret)
+		dev_err(&pdev->dev, "can't get number of channels\n");
+
+	return ret;
+}
+
 static int at_xdmac_probe(struct platform_device *pdev)
 {
 	struct at_xdmac	*atxdmac;
-	int		irq, nr_channels, i, ret;
+	int		irq, ret;
 	void __iomem	*base;
-	u32		reg;
+	u32		nr_channels, i, reg;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -2280,7 +2297,10 @@ static int at_xdmac_probe(struct platform_device *pdev)
 	 * of channels to do the allocation.
 	 */
 	reg = readl_relaxed(base + AT_XDMAC_GTYPE);
-	nr_channels = AT_XDMAC_NB_CH(reg);
+	ret = at_xdmac_get_channel_number(pdev, reg, &nr_channels);
+	if (ret)
+		return ret;
+
 	if (nr_channels > AT_XDMAC_MAX_CHAN) {
 		dev_err(&pdev->dev, "invalid number of channels (%u)\n",
 			nr_channels);

-- 
2.43.0


