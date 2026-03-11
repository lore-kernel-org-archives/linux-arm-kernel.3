Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BE8104BECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8nULKK1K9Wu4JwCv+JVy7POUPNII2hRbrIVVxV3nAA=; b=aZNuDg3hrPKsUTnPVda9AJQc/e
	Wt6uWNtEJGwnPML9vmSF29fGuq0kd5tdLhL6yRlchW0mx5hY9+KlIwbbWH81Yo/CPaOx97Lx+S+kH
	2FaBNVkQVP/SNiyV5OLwnCJBSrLUCG+wYKCaQ9TEjT22z4jVzmhxOwgb/yE8QNrzb8OCSKIQcTUPs
	aGHb3zGdfaFumdMqJkFtE20KAW1Ewe5ESAhg42Pam1OsWhgQozVux8Ujr4ygHoB6DRUgZrKKtxzsl
	8702esrhzTJmE/R4a9OvJ28whlZzvKF/AwC2peTQVPEgtQE8D4C1f7ao2I1TTf3zBBRArGoJPugDu
	MyIBvVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gdx-0000000BOZq-0cTF;
	Wed, 11 Mar 2026 10:18:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gdp-0000000BOT3-1QR7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AE634458E;
	Wed, 11 Mar 2026 10:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B921C2BCB5;
	Wed, 11 Mar 2026 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773224292;
	bh=ANam1FrMFFU63oI0nOSdCa8Fd89khskULIR+zSVWT1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OYWpICcQlqUDR07Zli9oBF3WqO5ClEfo9IV+IcjohfjTilMc92+ly33y2oJJ3dGNC
	 cRhiVGXGOoiJnQ6t2azmmBcqZz6a99Fz+dwqnTaXk3fGbNAp+xe8COxBWbQeTwuacT
	 Tt8G0IEeVaN2f9JlQlz84wvK8b/PjVSp38AXpa/mfpdkuAAoayf8texJMFiwBzQG6t
	 fA7WBCVig3BjbLqx5t6s9kgfxoCncPtspGaMgG/YEfHpFEB5mil9RJwMJb0LtrAMFk
	 FXfCWuu4XMngLdhBTYy/Oub5sZaUNP2vV5zjLuZya1gYBgqLRDB5fiJdE7gzHYi0Cs
	 YSoTLVUec57FA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC77104BECF;
	Wed, 11 Mar 2026 10:18:12 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 11 Mar 2026 11:18:01 +0100
Subject: [PATCH v10 4/5] dt-bindings: net: nxp,s32-dwmac: Declare per-queue
 interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dwmac_multi_irq-v10-4-7ab1669759b5@oss.nxp.com>
References: <20260311-dwmac_multi_irq-v10-0-7ab1669759b5@oss.nxp.com>
In-Reply-To: <20260311-dwmac_multi_irq-v10-0-7ab1669759b5@oss.nxp.com>
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
 imx@lists.linux.dev, devicetree@vger.kernel.org, rmk+kernel@armlinux.org.uk, 
 vladimir.oltean@nxp.com, boon.khai.ng@altera.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224290; l=3459;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=QJ1Ygh3VuAWa4/krg9FKkWOrC2vpifkljt9aH+qD0VI=;
 b=H8JG8YXo2iyg8ObBHcPCvGEofdogRu3xjX+KPW12HY5Kfof74FKG1Sn/dsdcEXhfWk3Ag+Cod
 3KPnVppgloKCqfHnWtEd6s9qBwbQoPwpHhIuQAXMGU9idrDiZhklTiB
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_031813_434600_95ED82B2 
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
set them to allow using Multi-IRQ mode.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 47 +++++++++++++++++++---
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 1b2934f3c87c..753a04941659 100644
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
@@ -45,10 +47,25 @@ properties:
       FlexTimer Modules connect to GMAC_0.
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 11
 
   interrupt-names:
-    const: macirq
+    oneOf:
+      - items:
+          - const: macirq
+      - items:
+          - const: macirq
+          - const: tx-queue-0
+          - const: rx-queue-0
+          - const: tx-queue-1
+          - const: rx-queue-1
+          - const: tx-queue-2
+          - const: rx-queue-2
+          - const: tx-queue-3
+          - const: rx-queue-3
+          - const: tx-queue-4
+          - const: rx-queue-4
 
   clocks:
     items:
@@ -88,8 +105,28 @@ examples:
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



