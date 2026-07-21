Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B561C44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKfvOV5byydammEhDh6NVDdNoNLt2ig+OA7x5OEBrak=; b=gPwCbS28rv/CV4U6Wf2wnAIMsg
	U/seSiwRW3u8rgSBdtOX48cAb7P/rQhwui5DuglCly7CH6+QtnvwGFeo8FRMyFIoccRzZd0Pv4HFF
	LjcSjXbUAINgDuHCby1wZbjEFilBTUx0RmmK9BZyQ2FEkWKn7q5HbTOIL+UGfXKD1PBqEOlofVzP/
	zB9k0esfnAJhK2SxIAMXF58iSFM22cMupHZK6yddFHpwj7iaKKMbRuE/h58/iy3X8R+AEILb3vGXd
	DDG8EUFKuDCMhpTS1hJ3n/hidapn/XaLmOgGAo9ffPSuXDjUGJuFbl7h4qlqGqWDHRqp55gGVSIxQ
	/5fMU7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7op-00000009DHC-47hD;
	Tue, 21 Jul 2026 10:35:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7oo-00000009DG6-3iEl;
	Tue, 21 Jul 2026 10:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A311543BE0;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 748BAC2BCB8;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784630122;
	bh=JV00sjmhquXboKON+JjhU41ZdESA0A3y8urFRlEdNU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NiO41nuWWBZngmxJJIEebm1oddpO3QqlHSYM1sBxdafID57RgEdL4vx8h1Ffspx4W
	 ZZoWLk0b7AjMEn/YQuW07XtbfnF2yES6DzD0Or/Ors3QLMNnbBy0ZUaRu7XaTiTJsv
	 eeV4hehdbB0BdgVGcS+Vud8YyKoL0KYa4Eh4jZhR07SgfC1cKKGTBsRMKkd2460mJr
	 rdYv0nExbAhhG9XLt70W71JkLH+2f/gUIRWcQUVxFknE1V4QkdNbGqahuRWKUeRjFe
	 T78uAU6bMiyX9GX6QBJjLhD0Zs7RhpVuwu2+pF9vo7ceaQCWoEJk1gl4q9/8WQ2zy4
	 RnHRKX6S1g8gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638CEC4451C;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Tue, 21 Jul 2026 18:35:19 +0800
Subject: [PATCH 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: support
 per-direction phys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
In-Reply-To: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784630121; l=3235;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=qKIkMZo6/4E4nSFrHbQ73C4ZiCIq+4PFw3ZZsww73IM=;
 b=geNFFEuGY+1qt+RJXr7yo9Fj8vo+15a4R78etc9erRBw+z48QFkH6TiN426oNaMWSYTA7yfvZ
 Xkdya/bcYdoA0mT85vIjQ0ZF7sAkM2soLtzXNt1CYE+0YSmOEbRjbGo
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jason Yang <jason98166@gmail.com>

The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI transmitter
and, on the same PHY, can receive a MIPI CSI camera. Describing both as
independent consumers of one PHY requires the direction to be expressed
in the devicetree.

Allow "#phy-cells" to be 1 or 2. The existing single-cell form still
selects the PHY type and refers to the transmitter, so shipped DSI
device trees stay valid. A second cell adds the direction, letting a
DSI (TX) and a CSI (RX) reference the same PHY node as separate
consumers.

Add include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h for the
RK_DCPHY_DIR_TX and RK_DCPHY_DIR_RX direction constants.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   | 22 ++++++++++++++++------
 .../dt-bindings/phy/phy-rockchip-samsung-dcphy.h   | 13 +++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..53d695137566 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -20,12 +20,22 @@ properties:
     maxItems: 1
 
   "#phy-cells":
-    const: 1
+    enum: [1, 2]
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
-      See include/dt-bindings/phy/phy.h for constants.
+      A single cell selects the PHY type and always refers to the
+      transmitter (DSI) direction. It is kept for backwards compatibility
+      with existing device trees:
+        - <PHY_TYPE_DPHY>
+        - <PHY_TYPE_CPHY>
+
+      Two cells select the PHY type and the direction, so that the
+      transmitter (DSI) and the receiver (CSI) can be described as
+      independent consumers of the same PHY:
+        - <PHY_TYPE_DPHY RK_DCPHY_DIR_TX>
+        - <PHY_TYPE_DPHY RK_DCPHY_DIR_RX>
+
+      See include/dt-bindings/phy/phy.h and
+      include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h for constants.
 
   clocks:
     maxItems: 2
@@ -82,6 +92,6 @@ examples:
                  <&cru SRST_S_MIPI_DCPHY0>;
         reset-names = "m_phy", "apb", "grf", "s_phy";
         rockchip,grf = <&mipidcphy0_grf>;
-        #phy-cells = <1>;
+        #phy-cells = <2>;
       };
     };
diff --git a/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
new file mode 100644
index 000000000000..60f6630f58b3
--- /dev/null
+++ b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Jason Yang <jason98166@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_PHY_ROCKCHIP_SAMSUNG_DCPHY_H
+#define _DT_BINDINGS_PHY_ROCKCHIP_SAMSUNG_DCPHY_H
+
+/* Direction of a Rockchip Samsung MIPI D-/C-PHY combo block */
+#define RK_DCPHY_DIR_TX		0
+#define RK_DCPHY_DIR_RX		1
+
+#endif /* _DT_BINDINGS_PHY_ROCKCHIP_SAMSUNG_DCPHY_H */

-- 
2.43.0



