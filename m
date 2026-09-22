Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120E4C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=; b=nQpNQyMVBIOv4KsmqophjJaiJV
	EpSH+qKh3aLqhNCa4ATSm7jDcCiCyd5GHBmTYDkSRObKyMiegxAlnz5cNCtr6pEO1dS8Bz3ydhXFc
	uYAQiLNVVfetR4IYEr67YlfgDOhb77EXNk4KMGG7joUBK/ClXw349Y6Svsx2HaXwx0Z7cOXiNJf//
	6Rf3vCC0Q5SRxnXzGu0QHzR3Swx7zI75BMX6itv10yLnNABu0vlzdxwrroxBp9gsllfAbGJDePFPt
	kbXsu2uT6VnhoBD4XGAgYNPWKS76gJvX7skQFligyqPSsm0x3mK7trlMNDBw6q7vXBKKXMZVdx+ve
	Wh/q535w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96j1-00000006U4a-3Ibx;
	Tue, 22 Sep 2026 20:04:23 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96ix-00000006TzQ-0QUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:04:21 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso498485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107458; x=1790712258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=qrAIG15g5A5mGd66/9zK1H549hg4FgxsFuIqgGUx1RLouZsK7O57UlLJVzaSDKdWaO
         MMy7ntaYCxnq0jtNz6Y82Uv7SnUK1VDMcDa5p9PFxlnkUWucgY+bHev5czMW8PX+Wza/
         TtYW/0rxBj0ZqY/Kqvj6FqTf3ZvsIK5p2H4xgCunPtpeQtdRb5SqR2F8CoecRdVeaWdN
         jJA15+OnNfpdQBFb0Q0T+J+xCchNepUWLMS1+Yezr4AGu76rY1+oaUMhKxKEuP0/fC87
         J6gcSRH5YUm+ejVfLvBd5akiRGyxUGWSaKMAxqn8f8rgYTCBfJf1U6Ucm2OXcXl7Axvq
         cnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107458; x=1790712258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=GZIquv2PYWRyOaipEebTPgPho9snifMK/Pc+gGx7FXhxjwiZQy34furef845ZdYIs/
         0FajZkPgonJfZMGQFDr+NdCBrJAx06iNK5M1bZGbcn+QX4ErEB7tfK4flP3YISiOY+9k
         jhaX03XtYUtZ6mumPGxuSPL5AdtwADaieLh3K5zSsPLpde7ML9/UnuGkIJigMsMllaiR
         viBjZYeBwXE/5VIXjt3zkqEJw+Y4vO1sLO91XyAv698HNzwhA0+eM5v7Q+V1NuCwRfQ9
         smedTNbJYip4NkBR0QQwjqNe3RTLO5dvIU7vZoG2a2La5Z4Yj+fGB2zOEfdGgFH//plE
         ry8g==
X-Forwarded-Encrypted: i=1; AKwUvByCtHH4V6XYJtG5ITe81ImypRhgj8WmSSVJCeetAB4CI/u7C/6e4VF8GMRV3KSkzsJ2tWLLEjM4rAx5bC+tKgya@lists.infradead.org
X-Gm-Message-State: AFuF++keKJib+hzoiCtRta5w10m98Cibd4mUZp+ew6/QRlTPSt2sTQor
	+zdXp8f6Ho533y6BkqI+v1DTj0+YATGKqnDxeTHbQaybIN3LbYomNVSe
X-Gm-Gg: AYBFou3f4pY6vkT0soeAbL+OgycHi0lAX/0fGP8lkLtQqzywPWvCwJrZ978qITuuhbV
	RIygsTVeR2UYpi7stFV495cuXQxBMSwjezglVQ09STJcWBrVVXHS1AaNN/GZMXYE6QuWKyydmep
	DYI/owZePwfZFrp7+avyTYHv/IX94/3/955bMx4v5F4VEUBFL7GHZbBx/n1P/5kJJjDhg8B9n3Q
	mo0r1DIQGUorfteUr7do1QeD5eSvDWV4HUdPfb6ltfkdatyoSejhO/8Bqk3useJnwD1/klSHGs4
	d4laJmWWXclZ82+QyUD1OxocoIPp3ZTDQxWEUrxjFfz0WTEZkbsRbmWID1JOW87K9KL/zS1srNd
	SIxKXsACzs5TtbL9uurP9QZeHywRUby2/BXWvpR5pO9vKd0JnXrijegZ7yxu7ob4wU37PhGeEKG
	fR2gnIVj1vKYCBcEmN6EA9SZfbddPJwWjUS4NdMIEJj5nguP0gCDse+Ox/Ve8wd6Htck7a
X-Received: by 2002:a17:903:2350:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2df69d689a1mr3760135ad.22.1790107458354;
        Tue, 22 Sep 2026 13:04:18 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:17 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Wed, 23 Sep 2026 04:03:28 +0800
Message-ID: <20260922200336.2201212-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130419_409426_B1621D18 
X-CRM114-Status: GOOD (  16.57  )
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


