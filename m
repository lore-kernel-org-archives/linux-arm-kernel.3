Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602B9C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIyMiktGQOab82DD+lDEPRvIY+Sz5pG/d7+Xn0r+ymA=; b=RBewX+iaGMJL/hVIZnZnZbBJ7P
	o/+e3JfTglN9kO3+wLMdA0e9VojQEpZrHlue2DSJqMq1NBLA3cEddACD9zeQhcvMxDAL9V81L/jGI
	DARdYRAHogtNGGgt/Mv6i3Qz0Edwt0gqFLeFzk4ACfTOPchAzOkHAhIKmV0fPQhPqX3E7sQf3URPs
	kyyG6RgnZmyHipWnt6tcVggNYqaZTOC+96lKRFMwqyQL7N9HomGQ+khxaSMf0uHCsVasMRGMWvfWP
	3TVZQL7Z+rzkpO19nFcHP7o6KpUrOP94LOfIeLniU/AjyySunQQf/VHkl0HfH7LpLjqN2EgLCVCwx
	jcQr8Hdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Ga-00000001Fv4-2R0x;
	Sun, 26 Jul 2026 14:55:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0GZ-00000001FtS-0N83;
	Sun, 26 Jul 2026 14:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6000743755;
	Sun, 26 Jul 2026 14:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20FC3C2BCFA;
	Sun, 26 Jul 2026 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785077746;
	bh=iQfA2icI1O6BXv/U+rtOfhtJil4OcTLRU4Xf3j2Mtv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oIFxm4nkFajHdR3e3oc7KwrBNqU7nV1XyLzr/0PjExwOruGnU9jdv31Vp8KPVVlOk
	 HAFJdSnUab3mW2temzkg0UKXB0qHckM3Ohx/yGRflBO0Cw3mumeN1sZmkuMNaNLI0g
	 +iMQHs6jZ8u38IPi0uKwxtTAjpAwrDWzu4W0Fr/R4cuNhpjIsrShFgQzZCIsw/tLHk
	 0dWPzoAWXit3ujDT9vjS/QmiM3RmUU2q+0juO8nCLeNTKqOxttFA880utfa+dFFvbZ
	 4Ui3GxQnx5CW/YKE0gmiyPkT/AToedFzhGcC3Fktf6pPix2J5e43xfYhrU/AGIVKkf
	 wgugpM+r0ZJ7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B43C531C9;
	Sun, 26 Jul 2026 14:55:46 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Sun, 26 Jul 2026 22:55:44 +0800
Subject: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
In-Reply-To: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785077744; l=3309;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=/8pxm6N6mn/e4jHHtvTPJ658FO8+xd4pvisBdnA5CR4=;
 b=Cdtn9owk4gWGJGZLq0wuLQN6uXqC9XF5beS38OR6BJCSWMqUpVLl/Ll9O5hcROYZsGEm+7CHL
 2al2shtaJYeAni07PUWXgh23amReZcUsv9+wDLWoYLk9guNsUzL11rs
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
device trees stay valid; bumping the cell count unconditionally would
invalidate them. A second cell adds the direction, letting a DSI (TX)
and a CSI (RX) reference the same PHY node as separate consumers.

Add include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h for the
RK_DCPHY_DIR_TX and RK_DCPHY_DIR_RX direction constants.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   | 22 ++++++++++++++++------
 .../dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h   | 13 +++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..68a43db9c669 100644
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
+      include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h for constants.
 
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
diff --git a/include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h b/include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h
new file mode 100644
index 000000000000..5029838fa275
--- /dev/null
+++ b/include/dt-bindings/phy/rockchip,rk3588-mipi-dcphy.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Jason Yang <jason98166@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_PHY_ROCKCHIP_RK3588_MIPI_DCPHY_H
+#define _DT_BINDINGS_PHY_ROCKCHIP_RK3588_MIPI_DCPHY_H
+
+/* Direction of a Rockchip Samsung MIPI D-/C-PHY combo block */
+#define RK_DCPHY_DIR_TX		0
+#define RK_DCPHY_DIR_RX		1
+
+#endif /* _DT_BINDINGS_PHY_ROCKCHIP_RK3588_MIPI_DCPHY_H */

-- 
2.43.0



