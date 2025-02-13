Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301B0C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 21:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsG0d/imTYQP9d0JqoCLk7g5rxR8R590EgJ5QvdKLdI=; b=Vk7cSrBtv909Bm1Qjls7X5bNp0
	ri9bKKFv/2ih5L4+Scpkl9tXwD55qTfEfQNWLONxN971Njak/eBB0eG2HEy77BQHJ5dNrq+luNslh
	7HEGjxDfayetlbUwhFswU/rIo7RjsB67OtwC2DPfgLvblP6QnChrWTAv79dY8LJfHp5Ii10D43kAR
	V7KdCebUGmU3KqiURzCeH8rSS1TWCTVqPTW2mIj+QzlqttIf0TPAFsspmFwcQJDtUYc59bSYQxS0c
	yqH1sN49YZF3wf5qh+qo1rGwXJ41LMVbjNYWBt/IYmvc419rngGXmZ28rksONwGZEjk6nDsAighoR
	jtpl62kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigR5-0000000CeMW-2Ln9;
	Thu, 13 Feb 2025 21:07:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigPd-0000000Ce03-3PAP;
	Thu, 13 Feb 2025 21:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BsG0d/imTYQP9d0JqoCLk7g5rxR8R590EgJ5QvdKLdI=; b=UyWQrri0zUMR9lDhNQsvt/azJI
	2CITNHmRV/+cuqTK42hNM9ncsE9O4F4CDPRB6KdRMACnFSG54xM/V71fYNnkpNFWTiy7PpYxnwFUx
	XtAGr9tfb8s70MNaecdycwxPcep9Qp8x49xibhQD7vUPLOaOYrAMlpsE4RmKaBekJGQ38ySvLMSNU
	pKWBO2pC+Nodbs1J27xmWIieZecrbYmvA27K9rfDKPVNHVGfpFxmnALHUxCJW1ZqEd2SKlKiYimeu
	+ITGretgdOUTgeKv2CkLeyjH9QLD+9oHpscAggwyOIsiw4UPkU7bZtjwibC07eNkdoD94eGajhBe6
	us85BrmQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tigPZ-0006WG-KN; Thu, 13 Feb 2025 22:06:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: phy: Add Rockchip MIPI C-/D-PHY schema
Date: Thu, 13 Feb 2025 22:05:47 +0100
Message-ID: <20250213210554.1645755-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250213210554.1645755-1-heiko@sntech.de>
References: <20250213210554.1645755-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_130621_870887_495542F8 
X-CRM114-Status: GOOD (  13.70  )
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
index 000000000000..c8ff5ba22a86
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


