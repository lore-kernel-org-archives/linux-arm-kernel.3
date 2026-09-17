Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E35BC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=; b=iF+tASoqWojk06BzThvacQsiLS
	OHMAjwvPrzBl7MvT1OJC0IHaEZPGSaN8+QkVJ//PqMoqaU+BqMqFpI+ifFRNbVHSxFGE8g9cO+fBW
	/7pT0hRgZcu8+TKGreRuR0wU0f5usvpY48X6yj58x/fLAuONFpDcpvhzroI/hb4YvuhSX3hppceQi
	ZAxzLi5Y8wvrMZnaBFbXiOKLCjSYmmyr7lFpleSIX1WbJTOyXCz6BbdQeeFrzR2E8BSqXymgX/sve
	gbgqa24RGAn2/V/hpF5U5W9Jg8QijKvV9z1FPLlEKraMUqzvVCeukN+yUKaO45yZwJY+6DaDN5QbL
	JdqrtmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J1J-0000000CSr4-12EK;
	Thu, 17 Sep 2026 20:47:49 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J1D-0000000CSlO-2ozU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:47:45 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39e4b1e7d12so128667a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678063; x=1790282863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=WtzwqIodaoS7d3JkiJJo+tmeM/vjlwC98mbqC2B9uKxmJICRXNOvxdWFKBkG5tghvq
         1OPR+daTZP/mr4F4AH9+ccN7lT8KJ4ya6SHxl3+PNeEJWKWoSq8hiSFL5oSkuPDp34/j
         1mDEiVB1CNb2ju2RG7N4H2zPPjIazntIEMY8tbBsFCwAZUVv3gNkQMUEi33KkzWtdlso
         Z6dZGtmAvqMvEfSxiTVqqcgCO2iySBY+Dt+KAD127bk/bi9nH/OKySYo9a/lfZdHaabU
         gQh/GwWGHBrIQfZ/wDLpqZpKnWINZhDyAlvBKgK4Ay/Mg6kdEdI9rB7hcLakY7S1imR7
         WDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678063; x=1790282863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=lINV/7PygCcGSJNCBPZ/fy5Dq5stic6YBk37/Q/jiGrlLD+4zdKl1rmY7tEwqlOSI/
         /AdV1q28JLUGErcyVuttja1vr3ymuTV7W0RatrtZolXw/bzntpLEnaa2eabprSsAUoCy
         FIeaB5tD/F6PQbncBmwQHhpognhcQOgi+5BbASGbW6Ga2neuMEhsolNOi5aTjsdjMXDY
         QZe2QkEaJso38vyCpg2J/KBD/Cx2QHwOChmEtlAkiq99MdF4jofsTSKMencGWXakCxQh
         qQJb8CX72DR0/05GZXRVdp48XEnOLWwMEQuegYoFgRdo5qjQNwddke8ebIZgPbiJzNSA
         dk3w==
X-Forwarded-Encrypted: i=1; AKwUvBxKo7suYpgdQmjTg/2YKH5zPZ5p2rd7XjjbnIxJyuMyawbT2/haoZuOWO4yFAeVfb/7noRi0PElJHYLhkomr1fi@lists.infradead.org
X-Gm-Message-State: AFuF++kaA7enxRNhxhRnsBxF0nSlV9brHKjnWJlMGlcv+nBlDKmsn9+i
	VL21MQiR98A8IJwpbREXAxSnjou43Q/Rtu6AOQGWzp+rIkjDlh9ehxuJ
X-Gm-Gg: AYBFou142Rr0X1n4w1+LldtiGaJb5IhibaM3WLlavrFWCS9wCvDIk3fMYZFaA75OxVB
	mqcl4pfYWd63cW+rBgtf3nyrhC0J63l431veDb8tIuAbXWkRyygpWszYDjKix+xfOeQ5fwe0U93
	LncQNTur2fUY7Ugj6mYRBTSQNT02qcaCXiotaLNFbiN8jnKdLwgBbPbZ9TGTmtXpt9WeG7kPhno
	FxsxD3thVEmvDKZVy9dDfRGlKgYnAoC39pgw/8Ok76ON4htZs4dYmqklDDhfqd9dXD+SJimd6qe
	Aqxg5w/SlFzWS1Of6NDdWEWHUsBU0gRNb17Ir62N0HBi4oxme2aGhzrMRxwz+M8cUfnE83BqLuR
	Rk6QOrwntgF/ZQCEKGJm4EzGcUG+EA6i+shg11EZgBk45OImYM8RRJg43E59WGSH9Tr950ugz1a
	e7jBTOfwyGzVCVmXUo+oI6kZ5imHP4ithJ8wbxf3TMP8L//F210p9oKIEjdqNNsi0hYzDByJo=
X-Received: by 2002:a17:90b:224a:b0:39e:4c81:6c99 with SMTP id 98e67ed59e1d1-39e54fa5deamr672836a91.31.1789678062912;
        Thu, 17 Sep 2026 13:47:42 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:47:41 -0700 (PDT)
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
Subject: [PATCH net-next v7 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Fri, 18 Sep 2026 04:46:15 +0800
Message-ID: <20260917204624.2427486-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_134743_836582_CAB49426 
X-CRM114-Status: GOOD (  15.76  )
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

The four MII ports are described as ethernet-pcs-mii@N child nodes,
consumed by the Rockchip XPCS glue driver later in this series.

phys and phy-names are required because dtbs_check only validates
required properties for enabled nodes. The SerDes link is a board-level
design choice (combphy1 on some boards, combphy2 on others), so these
properties must be provided by the board device tree, not the SoC dtsi.

The CRU reset lines (SRST_XPCS*) are intentionally not described: no
in-tree user requests them, and bring-up relies on the PD_PIPE power
domain, the SerDes PHY and the in-IP soft reset. They can be added
later as optional without breaking ABI.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
new file mode 100644
index 0000000000000..703fcff0e3f70
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/rockchip,rk3568-xpcs.yaml#
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
+  "^ethernet-pcs-mii@[0-3]$":
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
+    ethernet-pcs@fda00000 {
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
+      ethernet-pcs-mii@0 {
+        reg = <0>;
+      };
+    };
-- 
2.47.3


