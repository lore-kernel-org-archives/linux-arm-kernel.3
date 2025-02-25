Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133F3C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wSzOuuMh4wIYuFeXQ77eGXf1biih2wXTrhbPb4xiDpA=; b=3LUquo2LPnt1qci4NCwUBVpeIY
	XuAZ+Ee13sIj/XNZXT7xX164xNiIx7jyY9a2jo0WgvdYtCkZPyY2Xoxoh08F+bA3+dmUEYGvSPyV1
	rpU7L6FRzf2t5u+oA99QZORtTBWTyZchPsGdX+Cq15bEPFu/TWc5+d7AIIwvZFtoXMJb6Gc6tYPCh
	NjuIQNPTXQYnzBhBWGOmn1bfvbaqAjXkNydROcbnTr5ehi4+iGd4i+feCb3eBy/1vufXs8D2cxKl+
	94dCYSvvP7uaINRxkGDRyY3o4qlcaXtaj/lhx1aI6EVaJ8n6GEo+FITZunIh8NjgjxaBuFD/2vaog
	0TtB/KJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtdt-0000000H88H-3pp8;
	Tue, 25 Feb 2025 12:02:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmscG-0000000Gv57-0ulC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740481004; x=1772017004;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iKEf1m/m6BvXv4+yY+8cnvHqyOnvsNHZ2JRtdjVVX54=;
  b=TjLBUDpV+XxgaGQdsAb98mfbN69i3dBcGIy5QZNgMWq0WHb4t/l+J7jF
   ZAsY/fpoKLBpkwK9uGLlreauihoEcMcys9+pwYqVnWFrWUzgjEXHUObzR
   nZd8797qFzlCiL82aST9QvapxiOhOAzhtQWwxLRFLVpYaTs/f2KEgn70T
   eIgd0dvZStgnXs/vv/Hz0i2/a5V+39Dyc8c3FGGolRhr93u+weKsFBjaS
   QVpd8NZuLaX8nuSNX74PYbTt8WcOBHvTR5q3ckmfEK4OegL5oI/L9WGAP
   j59IoL1ych4Wx7bd75YHUzoruBqXjjDJDgMSMRUYJyOyeuRk+pWQ0FDUO
   Q==;
X-CSE-ConnectionGUID: WaHEjTnNR0qMKpQFgGyzcA==
X-CSE-MsgGUID: 0peESw3nSGiMeEVGscga6w==
X-IronPort-AV: E=Sophos;i="6.13,314,1732604400"; 
   d="scan'208";a="269479111"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Feb 2025 03:56:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Feb 2025 03:56:20 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 25 Feb 2025 03:56:18 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <p.zabel@pengutronix.de>, <Steen.Hegelund@microchip.com>,
	<daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<herve.codina@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH v2] reset: mchp: sparx5: Fix for lan966x
Date: Tue, 25 Feb 2025 11:53:29 +0100
Message-ID: <20250225105329.3037853-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_025644_483154_08D676C4 
X-CRM114-Status: GOOD (  20.08  )
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

With the blamed commit it seems that lan966x doesn't seem to boot
anymore when the internal CPU is used.
The reason seems to be the usage of the devm_of_iomap, if we replace
this with of_iomap, this seems to fix the issue as we use the same
region also for other devices.

Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x")
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
v1->v2:
- make sure to use iounmap when driver is removed
---
 drivers/reset/reset-microchip-sparx5.c | 40 +++++++++++++++++++-------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
index aa5464be7053b..cbe68026adc8d 100644
--- a/drivers/reset/reset-microchip-sparx5.c
+++ b/drivers/reset/reset-microchip-sparx5.c
@@ -8,6 +8,7 @@
  */
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -26,6 +27,7 @@ struct mchp_reset_context {
 	struct regmap *gcb_ctrl;
 	struct reset_controller_dev rcdev;
 	const struct reset_props *props;
+	void __iomem *base;
 };
 
 static struct regmap_config sparx5_reset_regmap_config = {
@@ -69,23 +71,27 @@ static const struct regmap_config mchp_lan966x_syscon_regmap_config = {
 };
 
 static struct regmap *mchp_lan966x_syscon_to_regmap(struct device *dev,
-						    struct device_node *syscon_np)
+						    struct device_node *syscon_np,
+						    struct mchp_reset_context *ctx)
 {
 	struct regmap_config regmap_config = mchp_lan966x_syscon_regmap_config;
-	resource_size_t size;
-	void __iomem *base;
+	struct resource res;
 
-	base = devm_of_iomap(dev, syscon_np, 0, &size);
-	if (IS_ERR(base))
-		return ERR_CAST(base);
+	if (of_address_to_resource(syscon_np, 0, &res))
+		return ERR_PTR(-ENOMEM);
 
-	regmap_config.max_register = size - 4;
+	ctx->base = of_iomap(syscon_np, 0);
+	if (!ctx->base)
+		return ERR_PTR(-ENOMEM);
 
-	return devm_regmap_init_mmio(dev, base, &regmap_config);
+	regmap_config.max_register =  resource_size(&res) - 4;
+
+	return devm_regmap_init_mmio(dev, ctx->base, &regmap_config);
 }
 
 static int mchp_sparx5_map_syscon(struct platform_device *pdev, char *name,
-				  struct regmap **target)
+				  struct regmap **target,
+				  struct mchp_reset_context *ctx)
 {
 	struct device_node *syscon_np;
 	struct regmap *regmap;
@@ -103,7 +109,8 @@ static int mchp_sparx5_map_syscon(struct platform_device *pdev, char *name,
 	 * device removal.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node, "microchip,lan966x-switch-reset"))
-		regmap = mchp_lan966x_syscon_to_regmap(&pdev->dev, syscon_np);
+		regmap = mchp_lan966x_syscon_to_regmap(&pdev->dev, syscon_np,
+						       ctx);
 	else
 		regmap = syscon_node_to_regmap(syscon_np);
 	of_node_put(syscon_np);
@@ -146,7 +153,7 @@ static int mchp_sparx5_reset_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	err = mchp_sparx5_map_syscon(pdev, "cpu-syscon", &ctx->cpu_ctrl);
+	err = mchp_sparx5_map_syscon(pdev, "cpu-syscon", &ctx->cpu_ctrl, ctx);
 	if (err)
 		return err;
 	err = mchp_sparx5_map_io(pdev, 0, &ctx->gcb_ctrl);
@@ -165,9 +172,19 @@ static int mchp_sparx5_reset_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	dev_set_drvdata(&pdev->dev, ctx);
+
 	return devm_reset_controller_register(&pdev->dev, &ctx->rcdev);
 }
 
+static void mchp_sparx5_reset_remove(struct platform_device *pdev)
+{
+	struct mchp_reset_context *ctx = dev_get_drvdata(&pdev->dev);
+
+	if (ctx->base != NULL)
+		iounmap(ctx->base);
+}
+
 static const struct reset_props reset_props_sparx5 = {
 	.protect_reg    = 0x84,
 	.protect_bit    = BIT(10),
@@ -196,6 +213,7 @@ MODULE_DEVICE_TABLE(of, mchp_sparx5_reset_of_match);
 
 static struct platform_driver mchp_sparx5_reset_driver = {
 	.probe = mchp_sparx5_reset_probe,
+	.remove = mchp_sparx5_reset_remove,
 	.driver = {
 		.name = "sparx5-switch-reset",
 		.of_match_table = mchp_sparx5_reset_of_match,
-- 
2.34.1


