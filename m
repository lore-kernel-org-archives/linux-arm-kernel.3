Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED34D35696
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fe6kYHPvc/9wdThyoKjIIQiQNyaP4IO4/LKY4IVbW8=; b=4D5+VblCWy+Exbp1AL/Awfkt8C
	u8/29SGayS04UpFr4Vh/l0jLVJ+ZAvAavD2qsdYhy7zFWXIn48wmLXWKyQ+WzBMkU3GA5f7sIhJBP
	Vr6Wvc2yLyM/OQRq60ZdYk5CC/NhWm0mGKflBPND98WAlvxry+xW5C6FxGyC1MXlScfxPCPtfSDaR
	rlPIRSs4dLszZbhYxLJnnI4yGqle6hysxXk3Ck8UammB8Mp/abmU/bcsgZ0ft8wpQzNEJw3d5jFOF
	34N66PfLjXopz2p+x6DlVxyUCFt6EGMYaph+MbNKuZmgnmslNUAyc3y7Pq0birhgbaQe8vG+MwvAW
	oXMidNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Fb-0000000Fgs5-1XI5;
	Wed, 28 Jan 2026 08:50:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1FO-0000000Fgn7-3xyL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C47444428;
	Wed, 28 Jan 2026 08:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8AD6C4CEF1;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590197;
	bh=n9Iorvk8iVt3UkSxca9W0HXO8bsTIYYN0SFfGhp1PmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bALrlQbEMGkAolqBk9DExUb3FBfk1ov2ZITw/sUoCznI4ThO9/XJ/4NlBm13YPqIY
	 t3ExTvN9Dc32S4zyJaiXumqHht/k6o3GhCQbwRtQX1Mr+8EptUMOWKP5xy7g6YBrBW
	 iI8MoWLUj081fdkXAtB1/Pyi5uxUE1yanzXjDfh5YFA0aul3FR/EA9uW/2Nqg34iAV
	 hhaPBq/mqzpXZojIODSrbySkuJ7rEv6zJ4PdCT4aF0z7kXAZnXpAXCwlw+JDahCbNS
	 f4QuTecSIZO4j+NSAilyrcdK/Njc0dmBBr2pnZm303MloSMJFEfg2Urwhjjmm/VZCm
	 X7st+jKcsX0ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71E5D35694;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 28 Jan 2026 09:49:55 +0100
Subject: [PATCH v4 4/4] stmmac: s32: enable support for Multi-IRQ mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-dwmac_multi_irq-v4-4-82fa34fcf2f2@oss.nxp.com>
References: <20260128-dwmac_multi_irq-v4-0-82fa34fcf2f2@oss.nxp.com>
In-Reply-To: <20260128-dwmac_multi_irq-v4-0-82fa34fcf2f2@oss.nxp.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769590195; l=3825;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=F5iLqXdHMZ2qiiJkqKhxBpUsPyBKNhvXgKzEG4aoAks=;
 b=GMmeRxime6Zalz6f8cJNInShlnHl2IGRspApM3aNDxKsncINGGej0ms30rkwEIshXjUDTw4hS
 pLuP9QH+OdyD4LrfdukIsvsC6+xAkZUEhQkih4wlGHMk13XiWnhWw7R
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_004959_027176_00B1B803 
X-CRM114-Status: GOOD (  14.13  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

To get enabled Multi-IRQ mode, the driver checks:

  1) property of 'snps,mtl-xx-config' subnode
     defines 'snps,xx-queues-to-use' bigger then one, ie:

     ethernet@4033c000 {
         compatible = "nxp,s32g2-dwmac";
         ...
         snps,mtl-rx-config = <&mtl_rx_setup>;
         ...

         mtl_rx_setup: rx-queues-config {
             snps,rx-queues-to-use = <2>;
         };

  2) queue based IRQs are set, ie:

     ethernet@4033c000 {
         compatible = "nxp,s32g2-dwmac";
         ...
         interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
                      /* CHN 0: tx, rx */
                      <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
                      /* CHN 1: tx, rx */
                      <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "macirq",
                           "tx-queue-0", "rx-queue-0",
                           "tx-queue-1", "rx-queue-1";

If those prerequisites are met, the driver switch to Multi-IRQ mode,
using per-queue IRQs for rx/tx data pathr:

[    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected

Now the driver owns all queues IRQs:

root@s32g399aevb3:~# grep eth /proc/interrupts
 29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
 30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
 31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
 32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
 33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
 34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
 35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
 36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
 37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
 38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
 39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4

Otherwise, if one of the prerequisite don't met, the driver
continue with MAC IRQ mode:

[    1.387045] s32-dwmac 4033c000.ethernet: MAC IRQ mode selected

And only MAC IRQ will be attached:

root@s32g399aevb3:~# grep eth /proc/interrupts
 29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac

What represents the original MAC IRQ mode and is fully backward
compatible.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..37a5b7b46973 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -2,7 +2,7 @@
 /*
  * NXP S32G/R GMAC glue layer
  *
- * Copyright 2019-2024 NXP
+ * Copyright 2019-2026 NXP
  *
  */
 
@@ -149,6 +149,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 	plat->core_type = DWMAC_CORE_GMAC4;
 	plat->pmt = 1;
 	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+
+	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
+	if (plat->rx_queues_to_use > 1 &&
+	    (res.rx_irq[0] > 0 && res.tx_irq[0] > 0)) {
+		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
+		dev_info(dev, "Multi-IRQ mode (per queue IRQs) selected\n");
+	} else {
+		dev_info(dev, "MAC IRQ mode selected\n");
+	}
+
 	plat->rx_fifo_size = 20480;
 	plat->tx_fifo_size = 20480;
 

-- 
2.47.0



