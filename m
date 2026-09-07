Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8801EC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6aB1UFx2dxtuDUMhshejketJxUphgoMFv4AnQI5Bfw=; b=kjEh7BX1NxagkvpboWh9bHG+zg
	6N+WTDRoZPzNIN1/kLVhjP/CI87CBxwx5h1z680dSAoeSCfLwhhKeLqOnc52XPjhA3R45RGNqIqEm
	UajvAuVVqXT3DI7vwJWS5p5ZmYD41j7R2DWGhY391QFsV9i13RB9445Wdu3Rox5u1vG16bxICKYmX
	AJ/WW3IC+ykT6Pl117dWaOiybo3QZlKwEsB5s7MHJj0RpzU8ff7TzEkT8SWWZhibTi2PGWqt2mp7l
	GU4y5KHnDGpn4RVOhXEDrDdZo8WBpNYKr1q7iv2qCKVwzBLFTi29GTJkV7yZKrFFbNzeVjrBWXSFh
	l5+PDxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bR8-00000007CF1-3PyX;
	Mon, 07 Sep 2026 15:39:10 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bR4-00000007CBI-2uyL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:39:08 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so1545200a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795546; x=1789400346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6aB1UFx2dxtuDUMhshejketJxUphgoMFv4AnQI5Bfw=;
        b=bpckWL66EAIQvABaMb0gr2sLI9nayjuzxNQgM9NDNLNCaBf1pEgQSccvyXvN7lIPzs
         uKElfpMhpGlFu8nS6aJPf3iXhaIoAI+a64GfVazeBGMC/FpD4uGznFUHfySVNzlBAzZj
         OUvmsvm4lF1sqrXhOC9m5dfTeb2PPBBwaPm4FLJGe/m2scHZubBuRm5epo3PiwfQYuxD
         uP04OMtgnZGjRhIu820VGMoBkoBxe2xfCaKOSv4XfIPTG65RY23GtamZ7R5rs1rlbnQ6
         c0U+U03uvXJw4TF3D9oebFaIDRhbLNdqBos66cJ7Ka0bMkO9CmRWNcTDBfwc6j5WALk8
         qZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795546; x=1789400346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6aB1UFx2dxtuDUMhshejketJxUphgoMFv4AnQI5Bfw=;
        b=HaIMQh3C698M4pgFdvEimlEgJXGSWjDiub/5DOn/S3XMffVs3Jv++K9Wgy3GzwlPPC
         xljuOYJ3G+Bxk/ZWBsWsZ+rSQAOL8wsBzCOX+7kDYWVFtcjLK5RTGzER4suQS8iWa/Ww
         MXdXnHKXLX546aPqqCjs+hj6D06rMqO10jFDAxeG8lU4U+ygISzEhtJpS5+E0mrCDKlC
         QQbSdmkKQTkNsFQVtj0JXX5QcaucTnmNKVDB44DeBVO1ir2V4XYJ7io+udYs6/r8K/W1
         Uke6Xvmx5TflXNv1UEu0D4j7tLNKy0qS0QT5xi4M5SnEBjN4YDAKiysrMMkgxoK86zJq
         fh9w==
X-Forwarded-Encrypted: i=1; AKwUvBwNBSRx7MLeMRJJyjrYhMpfeHkRpT1Pan0Js17UHJapyhcwNOP/bArfhOj3G2nXWrsB1rkkI269DLWOKzf3L3iV@lists.infradead.org
X-Gm-Message-State: AFuF++n6QohP2dfN2Tcb7rT5bfdBK6TmuB4cVIUeFyLPHv6h3+PE5+/V
	S1JL/2vFsSUU0yXCDXJfhutpa1otol8j7avjU2w6ZTINuTAQF0kOvzH2
X-Gm-Gg: AYBFou3nTPhfTPxyujzomrxEfBImdaiD8QBPZcQ+U3b3NxyCld5ZG2A596aLXK8K1FI
	e0UfmyguwmgSD7n2JPJ+GV5u4pfD49xQ8QkEY8GQ9mK1O14zP1iG+qQTljjDReo6+veNpf0UZDI
	/1GUmA1bOaFOhfiBbrXcEQxIu34hbrBkg5+0ivVb9gsmSoAP/rCaiHU541jSloETzhkaEYoWvGR
	NFv5dN7yvHPcg4Ei8Wn1UYJ5U52AuOXQjIg/LWrp0/e1DE2G9oCushpBPqtvTb70vPFsvJaD/8g
	JxohFhPp6Z6BiAABKLKOGthZai6TgFQP/aIfcc3S8rcr5EnQclg+UFvwA45e6lT8FON3iaCv83O
	6ThxULu7hGFC2rVU/kDzT1z5kVllT2cz5KkH/vUODVCg3WMFCkkkKUIkNXoqgZ+nwuxtx9dfMH4
	zHjmtSlA7+SWHA+hEuAIEwK/5K/0fIYFMH1HXiDHOw5gtHvnTLq9l572CZS0g=
X-Received: by 2002:a17:90b:3149:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39b2618060cmr36557328a91.10.1788795545874;
        Mon, 07 Sep 2026 08:39:05 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:05 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v4 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Mon,  7 Sep 2026 23:37:07 +0800
Message-ID: <20260907153713.2572547-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_083906_741513_D32F125B 
X-CRM114-Status: GOOD (  15.10  )
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

Add device tree binding documentation for the Synopsys DesignWare
XPCS integrated on the Rockchip RK3568 SoC.

The XPCS is accessed over the APB3 bus and internally connected to
a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
QSGMII modes, with four MII ports.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
new file mode 100644
index 0000000000000..0852d0bcb66a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/rockchip-dwxpcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
+
+maintainers:
+  - Coia Prant <coiaprant@gmail.com>
+
+description: |
+  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physical
+  Coding Sublayer (XPCS).
+  The PCS provides an interface between the Media Access Control (MAC)
+  and the Physical Medium Attachment (PMA) sublayer through a Media
+  Independent Interface (GMII).
+
+  The XPCS is accessed over the APB3 bus and internally connected to a
+  Naneng Combo SerDes PHY.
+  It supports 1000BASE-X, SGMII and QSGMII modes.
+
+  The block contains four MII ports that can be individually enabled and
+  routed to one of the Ethernet GMAC controllers via the pcs-handle
+  property in the MAC device tree node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: APB3 bus interface clock (clk_csr_i), required for register access
+      - description: EEE clock (clk_eee_i), required for Energy Efficient Ethernet operation
+
+  clock-names:
+    items:
+      - const: csr
+      - const: eee
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: serdes
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^pcs-mii@[0-3]$":
+    type: object
+    description:
+      One of the four MII ports of the XPCS. The port is linked to an
+      Ethernet MAC controller via the pcs-handle property in the MAC's
+      device tree node.
+
+    properties:
+      reg:
+        description: MII port number.
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/phy/phy.h>
+
+    pcs@fda00000 {
+      compatible = "rockchip,rk3568-xpcs";
+      reg = <0xfda00000 0x200000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+      clock-names = "csr", "eee";
+      phys = <&combphy2 PHY_TYPE_SGMII>;
+      phy-names = "serdes";
+      power-domains = <&power RK3568_PD_PIPE>;
+
+      pcs-mii@0 {
+        reg = <0>;
+      };
+    };
-- 
2.47.3


