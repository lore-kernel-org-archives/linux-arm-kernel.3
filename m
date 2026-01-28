Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B21D35697
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYlx7Rdi/PDpBjj0dPyAn++QH+eUFbJyd5/xo7g3/aU=; b=CcXheUItmLSiUmJex4yyEN1T6/
	jV+077j1s8rWOdTGx4MgLzoBoQ+pf1J+Rn+G+eEvyW5I4PD97ZSiBuNIBW55LqFdEPXT3p33QvbYP
	4EENOd5/iITK0phRekNs0WR5WC4HMp8G1SE7/ShflWEOiUeq7DSU/1kYoyx6tXsMRkl2sZ5mnGmdb
	ZvZnjYWrsbN9Hs41910hYBAl4eVJkLFQvyTOcG1yBH+m/z5+tbWMHiHQtwC8i8SJTu6njCBTB3QPF
	+sa0UlPSIFyqhBmmoP9+rWRX8dP+bq672j7JBMGEIOvdSFR+xE8b8P4/EQwHaJO7URrQ8lHQG+evl
	Cqf0DJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Fb-0000000FgrZ-078R;
	Wed, 28 Jan 2026 08:50:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1FO-0000000Fgn3-3wXS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB2EA44485;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 932D6C19422;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590197;
	bh=/uyunbAFyWz73pwhxvZxxjAT7WQI0mMKq8d0GLlcH+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=am1MPw00eiIKmRNswvuatQj+H7O+XXy8Cu8fZ0t9DwalB2lL8pQNfloKhkmeiYNsC
	 YlIOjIlx4TZHo53Om0VJ+o3Q+8xMQo2oLjaExu7y9sL+tLtcFezvjN+vCOrV7ghn7O
	 54IXQw684z7heP+KhFrjpyPyQcxHa0j7LM2rLzr3N/5j/vdsXkicm5pkAx83TGltrj
	 smc8UmucnQXTElKGS9+V1N8nZsUhpqPe4Vn5vsGcqWblV7tnbSlk2kKFdGp7Yxs/Bt
	 jM1jDE4PVCLJXwMLx/ChkzNSeyubnCNKol7HFlyYM+4zt9vg8VtkXNpIGmLg9np38J
	 +GeTaYX+Y6lMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820F4D35696;
	Wed, 28 Jan 2026 08:49:57 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 28 Jan 2026 09:49:53 +0100
Subject: [PATCH v4 2/4] dt-bindings: net: nxp,s32-dwmac: Declare per-queue
 interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-dwmac_multi_irq-v4-2-82fa34fcf2f2@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769590195; l=3436;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=IDIUEAasYnGEnlJkNZygiJ9HZplC9b8+OT2lVVZkZiA=;
 b=moVnyHpZh6OO0BYSd14hEB8pt4RQ5TKjxJaTrx8LJbnNuaf3FBrIIlJweQ8d/4A45x2elNgph
 2h/UQmbGu/YDhbzLPhcqSkfIA8CNFfpAWSw5A0drbrLrkUWeLALb4yO
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_004959_023265_26201D86 
X-CRM114-Status: GOOD (  12.54  )
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
index 2b8b74c5feec..c5bba453bd0e 100644
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
@@ -33,10 +35,22 @@ properties:
       - description: GMAC PHY mode control register
 
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
@@ -75,8 +89,28 @@ examples:
         reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
               <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
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



