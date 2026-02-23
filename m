Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B39EA4FC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXx151PMpA3t6ycltnQU+8jmyZr4kkVAuBQca2egpDU=; b=YQ3WJwq3zTmr82SwUSBi52bY9h
	b3KaY9upX/0+Sr5Hc7+b5MGl+VkC1gk9lWUncSvs2DHFva16A3ZZmknKBe+HpFDY12+DK4IQUE0cf
	N+LsgzPGhnQjVOz4jZOEMDkm+MLjQyxhPVKGazKn5I3U8M5/Ih35KDZP3hGQ9jj06/zXstfnl1iiV
	KGxtJ8b80n/uNZth3siHhJWnOMtM3y5x/V+TiSnKi6j6utqSfBpC18nf1RyTzlcZ9xbI5czjwzSbX
	GmONu77GxmLUmsSEkhV6jvATXBoYOT8KlrL+8F261xz9lfvypXur8I57jHb8B1X85YfZD515gaSvW
	PQKN9XkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWS1-00000000Qgb-2mIr;
	Mon, 23 Feb 2026 13:58:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWS0-00000000Qfi-0jNB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23BCA60103;
	Mon, 23 Feb 2026 13:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9F88C2BCAF;
	Mon, 23 Feb 2026 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771855094;
	bh=pZOGCtqCdGmQ5EyeK5P9mdp8/Ieo5wfdcMyGgN8hA6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Si4U1+HHGDdwApNgCgBU3L4MQ2WynddhvpJZyvjo+g6J7K+XeplI0CAJOklySfS0e
	 OPl1UUWvRBCi/bsKC+r8PLJN18EjyDWRMa+LewmF+vcojnv3Z1HTOMhYXimj2q8Alt
	 jGP2XSYyzzbvgSU4q3j4j5L66c3g6QkFmjbaI3HWzch/ewOCiVKH9ztWeF18hDafR3
	 awcTse3OCDB61vHADnH8Z1hMgtQWSWyD4kGlzvxvAC4aNRmGOzdhxwlb7PCct7TJpg
	 qbvOxaWBcybn+MPJ49KRTvWMVqqRdEoaoxEZEH10oHtVTiYuuUGM4CfFmBSe1Nd4CO
	 cJo219fdlwUiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B999BEA4FC3;
	Mon, 23 Feb 2026 13:58:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 23 Feb 2026 14:58:05 +0100
Subject: [PATCH v5 2/4] dt-bindings: net: nxp,s32-dwmac: Declare per-queue
 interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-dwmac_multi_irq-v5-2-8fc699a5fac4@oss.nxp.com>
References: <20260223-dwmac_multi_irq-v5-0-8fc699a5fac4@oss.nxp.com>
In-Reply-To: <20260223-dwmac_multi_irq-v5-0-8fc699a5fac4@oss.nxp.com>
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
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771855093; l=3405;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=gQkWPW6Agu54gNIpdO0qRffYb4VG4bnlmEhwhDlFr00=;
 b=jc9lh1vecb9mybYO4ehOuqpkp71pwzZLjz/g/NY9z1MldT2Bur/6GMyRv7wxMXu4VrGEaeWBb
 jr8N9BQM0QlBhsyM8e4wQrE2T2MIUo+l1T72x+rqWmOeTGtl+PggQ8a
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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

The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
set them to allow using Multi-IRQ mode.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 +++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 1b2934f3c87c..3a0e41b63c3d 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright 2021-2024 NXP
+# Copyright 2021-2026 NXP
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
@@ -16,6 +16,8 @@ description:
   the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
   interface over Pinctrl device or the output can be routed
   to the embedded SerDes for SGMII connectivity.
+  The DWMAC instances have connected all RX/TX queues interrupts,
+  enabling load balancing of data traffic across all CPU cores.
 
 properties:
   compatible:
@@ -45,10 +47,22 @@ properties:
       FlexTimer Modules connect to GMAC_0.
 
   interrupts:
-    maxItems: 1
+    minItems: 11
+    maxItems: 11
 
   interrupt-names:
-    const: macirq
+    items:
+      - const: macirq
+      - const: tx-queue-0
+      - const: rx-queue-0
+      - const: tx-queue-1
+      - const: rx-queue-1
+      - const: tx-queue-2
+      - const: rx-queue-2
+      - const: tx-queue-3
+      - const: rx-queue-3
+      - const: tx-queue-4
+      - const: rx-queue-4
 
   clocks:
     items:
@@ -88,8 +102,28 @@ examples:
               <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
         nxp,phy-sel = <&gpr 0x4>;
         interrupt-parent = <&gic>;
-        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-        interrupt-names = "macirq";
+        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 0: tx, rx */
+                     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 1: tx, rx */
+                     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 2: tx, rx */
+                     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 3: tx, rx */
+                     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+                     /* CHN 4: tx, rx */
+                     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq",
+                          "tx-queue-0", "rx-queue-0",
+                          "tx-queue-1", "rx-queue-1",
+                          "tx-queue-2", "rx-queue-2",
+                          "tx-queue-3", "rx-queue-3",
+                          "tx-queue-4", "rx-queue-4";
         snps,mtl-rx-config = <&mtl_rx_setup>;
         snps,mtl-tx-config = <&mtl_tx_setup>;
         clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;

-- 
2.47.0



