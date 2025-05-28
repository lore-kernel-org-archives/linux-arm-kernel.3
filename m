Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC63C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 06:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0h2GSbYno9GnN+SE7DSago4DWsquREdEphyEsb2V8jU=; b=hTMb/UJ6UVUMdand7eEZQ9D19j
	GqWUeTdr6D+C3cDcyjjS0XjPogAKEkjacpm8WXJXUqzEgqYGFNAzHak9hyweA+MgToSGMujkh7lTi
	nmNukXZAefcV70h5Zr7cDbVWsMQrcpsHW9hSuoJLr+4Wt0V7IDZfiyeBZEags0KWGZ3h/MLZurCJe
	Y12YR+3DZAI3Ot1EZwUT7bo/aTZuM89Vtiupf8u+qmGDZoZpGE3IJ8oN8BJy4p5yeOKJ6sciA8+hL
	RLpdo4kdnxmFluWZiIZBox0zts9zVzHrP6aODUy+3uyzSCpF/teDJIUAPv440GrQWkhwoKeA8GmXm
	99VWnieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA9I-0000000CHeY-3hAR;
	Wed, 28 May 2025 06:20:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA3T-0000000CHAc-1elD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 06:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748412863; x=1779948863;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=TktazPySSKGEf/0fslH0MvDKjlP70/UT5hkBSp27kl0=;
  b=Dg0UZRlZiau9QwNwFHUW4gn6WpjzvSZZW3oBab0o3BpRzkfpMZNHi5Y9
   wErRjkMnnxLOiMnuucIqRB/kLbMsZBIIeZ/AFhaLzyz1IOcHfeG30DOmI
   0L29st1CxpZE/z0+cQxr31hYUnH8qkIaFTbDbOLBGPWjxbHaNvKnEOq7D
   HmklUV+ryVmCWpxDjmr42ywGtzJTS0ja12T9CCp8T732gd+0oFOdT7Z6F
   zmYq4rAVB2jhJJkq+DBJARDv8NEN+g+m+oKQESyxi64IWqNRTyPXpMdnl
   CnZFRjH8Vb19pm1JWZsxEjKM2lj6sWLbR013mutn/mm9HzSI8W63i5zOW
   A==;
X-CSE-ConnectionGUID: eU1T+fZHR4iBV5joZbGgXA==
X-CSE-MsgGUID: 73BKs1QST4O0fd8eBA9Lwg==
X-IronPort-AV: E=Sophos;i="6.15,320,1739862000"; 
   d="scan'208";a="209641304"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2025 23:14:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 27 May 2025 23:13:19 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 27 May 2025 23:13:16 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Wed, 28 May 2025 11:43:04 +0530
Subject: [PATCH 1/2] counter: microchip-tcb-capture: Retrieve and map
 parent base address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250528-mchp-tcb-dma-v1-1-083a41fb7b51@microchip.com>
References: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
In-Reply-To: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748412791; l=2336;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=TktazPySSKGEf/0fslH0MvDKjlP70/UT5hkBSp27kl0=;
 b=EAc2uHlbuqLve1VW5JZDmKi9XT9LMUfU0eHvGLFn/cY0hKmuGha2kLctmQ9DuSGgrd5GAJjeq
 iCD8XMsq//NDmlAV08a/pEX6qXjvlt8leFAbv+5H2ySrbly0AgOMCte
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_231423_499820_F2EDCA21 
X-CRM114-Status: GOOD (  12.67  )
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

Retrieve the parent TCB controller's platform_device and map its MMIO
region using devm_ioremap_resource(). This allows direct register access
through a base address, which is required for features like DMA that need
physical addresses.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/counter/microchip-tcb-capture.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 1a299d1f350b..9634da75bd1a 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -12,6 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <uapi/linux/counter/microchip-tcb-capture.h>
@@ -29,7 +30,9 @@
 
 struct mchp_tc_data {
 	const struct atmel_tcb_config *tc_cfg;
+	struct platform_device *pdev;
 	struct regmap *regmap;
+	void __iomem *base;
 	int qdec_mode;
 	int num_channels;
 	int channel[2];
@@ -479,6 +482,8 @@ static int mchp_tc_probe(struct platform_device *pdev)
 	const struct atmel_tcb_config *tcb_config;
 	const struct of_device_id *match;
 	struct counter_device *counter;
+	struct platform_device *parent_pdev;
+	struct resource *parent_res;
 	struct mchp_tc_data *priv;
 	char clk_name[7];
 	struct regmap *regmap;
@@ -491,6 +496,18 @@ static int mchp_tc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	priv = counter_priv(counter);
 
+	parent_pdev = of_find_device_by_node(np->parent);
+	if (!parent_pdev)
+		return -EPROBE_DEFER;
+
+	parent_res = platform_get_resource(parent_pdev, IORESOURCE_MEM, 0);
+	if (!parent_res)
+		return -EINVAL;
+
+	priv->base = devm_ioremap_resource(&parent_pdev->dev, parent_res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
 	match = of_match_node(atmel_tc_of_match, np->parent);
 	tcb_config = match->data;
 	if (!tcb_config) {
@@ -563,6 +580,7 @@ static int mchp_tc_probe(struct platform_device *pdev)
 
 	priv->tc_cfg = tcb_config;
 	priv->regmap = regmap;
+	priv->pdev = pdev;
 	counter->name = dev_name(&pdev->dev);
 	counter->parent = &pdev->dev;
 	counter->ops = &mchp_tc_ops;

-- 
2.43.0


