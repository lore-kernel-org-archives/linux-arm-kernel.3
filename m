Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ECEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuMgAJ1TQNNEGebrmKbN3q99gG91+UBsAYkEU1XoKSs=; b=PPR/kJ9lOy/tS6b51XBJBAWK60
	cLLTnljF/JaJSFLniXQmvPDBSi7MJVQ1CPufYETDYI7WO+4G1fMPeF5BtxOC6+DEcH26brGXY0mLV
	gewZxJGZs+pHRS3bw9HMIe8VuMtsu5aUnmm6/KlxCS9TMZOyFCXf2Z58RLBD0qJ/KUxGbIYxFfjLc
	50jdoK2xd2G0BT4Df9ls680bpQP6+9AdMHsgP3sSUMcl7P22djElw1XCJGR7EerlzATnGw1hyYQNp
	OJnM+CUJTzLAWXmPvqGu7NcIrMzSdL+9A8nW++RtO2I4vwuRqeejYVrPuWjE7nHvhxHXKmIZ6Wkep
	Ijz3egvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsisi-0000000BQ8U-0dsN;
	Thu, 13 Mar 2025 13:45:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsinp-0000000BPGG-00iG;
	Thu, 13 Mar 2025 13:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fuMgAJ1TQNNEGebrmKbN3q99gG91+UBsAYkEU1XoKSs=; b=BOhmXE027Px7ukYx2xai6+DsGe
	K4G8q00PxwOLiaA8cFjKhj9g4mz4rdRZSxZY2i9Jjd+x4ORoeHngeaAqmRAO7yqzBPXwAwPMTtnW0
	msitmgkZ2oG6JJisv20t6hfan7u7gjxdJqQYKvHLopCSyd5tFmMws6Axc50qn3GgrC/+mYdM1G14R
	j3gXWFMt6pbvGasJUuV3V5+gzyxxjFkCHnkT9XHdzDs3IZ+O1lC0R9BjLFU5b58Yx7QYPK8hB4Ecl
	ZVAGxslYmUt+fzIKdiwgF+2dJZZEojfEK1SO43wF0MXqt8U80dahKqe1Lf7RFceeTz+UqNW8se1GI
	iKNSpNzA==;
Received: from [62.91.42.92] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsinf-0008Rg-8H; Thu, 13 Mar 2025 14:40:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com,
	heiko@sntech.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/2] dt-bindings: phy: Add Rockchip MIPI C-/D-PHY schema
Date: Thu, 13 Mar 2025 14:40:31 +0100
Message-ID: <20250313134035.278133-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250313134035.278133-1-heiko@sntech.de>
References: <20250313134035.278133-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_064049_045449_6D7B7017 
X-CRM114-Status: GOOD (  13.03  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Add dt-binding schema for the MIPI C-/D-PHY found on
Rockchip RK3588 SoCs.

Tested-by: Daniel Semkowicz <dse@thaumatec.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../phy/rockchip,rk3588-mipi-dcphy.yaml       | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
new file mode 100644
index 0000000000000..c8ff5ba22a86b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip,rk3588-mipi-dcphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip MIPI D-/C-PHY with Samsung IP block
+
+maintainers:
+  - Guochun Huang <hero.huang@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3576-mipi-dcphy
+      - rockchip,rk3588-mipi-dcphy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description: |
+      Argument is mode to operate in. Supported modes are:
+        - PHY_TYPE_DPHY
+        - PHY_TYPE_CPHY
+      See include/dt-bindings/phy/phy.h for constants.
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: ref
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: m_phy
+      - const: apb
+      - const: grf
+      - const: s_phy
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon managing the 'mipi dcphy general register files'.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      phy@feda0000 {
+        compatible = "rockchip,rk3588-mipi-dcphy";
+        reg = <0x0 0xfeda0000 0x0 0x10000>;
+        clocks = <&cru PCLK_MIPI_DCPHY0>,
+                 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
+        clock-names = "pclk", "ref";
+        resets = <&cru SRST_M_MIPI_DCPHY0>,
+                 <&cru SRST_P_MIPI_DCPHY0>,
+                 <&cru SRST_P_MIPI_DCPHY0_GRF>,
+                 <&cru SRST_S_MIPI_DCPHY0>;
+        reset-names = "m_phy", "apb", "grf", "s_phy";
+        rockchip,grf = <&mipidcphy0_grf>;
+        #phy-cells = <1>;
+      };
+    };
-- 
2.47.2


