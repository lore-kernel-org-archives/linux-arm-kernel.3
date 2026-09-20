Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBAAC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=; b=ZJjdAjGaB/WbzsZm4kaCbvhS94
	Juv8uAJ0PMMJVxbr+Sw4RvQXCdw6EEYeGa6U0tuUhwtcK0r+fcTIfrfDry2/kVOf5cbgjUNjUL/p0
	Db3+hEx5s3aAtphKiPJrBVfl0QQz7ZqTIfwuyn93surgLuZoG3/O5TGXG0nKC5+Io0ofuLzOHWI7i
	NRzWJsd+JfL3wqD52a8MNE7nJvs02T39QJnF06JZxXI2+XW6VVi+CKfZLIW0cXNt1PiFTl7ZrB7LK
	uHS+GprUX+o+9r1mI63KMiRhY3i6LabmIEpLMyvoP86tJwTN8s5ieEY8syeqZNXko6aBSEBHO5+VM
	H/9gHIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8KwA-00000000901-2nFJ;
	Sun, 20 Sep 2026 17:02:46 +0000
Received: from mail-pz2-x06.google.com ([2607:f8b0:4864:3b::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Kw7-000000008ws-40fA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 17:02:45 +0000
Received: by mail-pz2-x06.google.com with SMTP id 41be03b00d2f7-cc4b14f0364so950315a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923763; x=1790528563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=marh/kybHuSy/3e2CSP2r/HPza6FbeSEpVJhRxgckLB/SvsSh9+XO88ckz/ukySOWN
         A0IQEJGi4SlAZn8rmFS53xluZoNWawDeeUg9XWm4XopUkJ4aQxM6YUy2gJhdv4Oft9dG
         4C5j9p5b/sHqWqi2szATZ9q+SS9QCfdj3i63US98yopstnuZHDhr+9ezF58OxvRzwCkv
         DJfzX7gBZmOHlZQtXuBLJkUkxTbjT1qi+xkdUpmBNWmdfDv7aL+epdLAfXyHn1/kUga3
         hMcomCjtT4cPp6+2fU9mo33JI/bFEpvqJ4ZUiTV4k17R+9D8XJa4DcIJBce95oxHEmtV
         gFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923763; x=1790528563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=F2vMezsn3bOBxR8ayQzT6yV2UBki7Qmj02GGsYwtB0y708nmzYBzyToXJkRHWSsV0H
         IQQDJI8O8+e+paLDquZXYfTCk9XDvbWK4QzQD/7Uqf5Z1/tXCBLdjCwYAx7uN4eGunFu
         AIlBI+FxUeYCY4Nm4mOwOOuF6508qF2+YhyvWroGAux+IdcXKeQ6kOw9oDy5Y7gm+yjH
         1QxCA99kGCl1V9SiwO0Z4JONihqKX+Ny01+v+7W3XmPzsJ9WlT1IANoe628h7tirCGaP
         0+Xd0cdkBjhGmZKacVxuEFeV9iGIwPJYJcBjJNaMZWfP6V1AA9v78gtwTO3JAeX2s/eX
         T+PA==
X-Forwarded-Encrypted: i=1; AKwUvBzWEGvJQ/KOAELbvUWSmy11dYuDVRa8bPVvw1Ur+ihHIah8gy8bfrpItzpGM++a4rljwIU/85bsbqtMRfVbdCL0@lists.infradead.org
X-Gm-Message-State: AFuF++ndLaZAie9hQIFGOvqVX3ZQSdxF/eWR6Dwbit7KRbLkDHXen+e+
	X7YK7XAQAFClZ3tSDC2WsnkRwYLm8PZ3KIcA4tTkQIVd0ElYuDesJ94/
X-Gm-Gg: AYBFou03p798BWKKWKlQb73yBJ50MZ4cqKaMfjsuofTKDQGyhJLoLfC8/+tcKUNs2SU
	993iI3rODQpQIOt+VvvLIjHoCJDWmrosT9yhT6glJuOM9yJiZI/5zCDj87U2jBNyHeoI5XTr5Rt
	TP4n1RLjEs7oR5WMPEszdzlEdJp3W6a2uPmRzUfIHSR0RGS47ozclFKF600/4b1Lt9fXDEWr4dO
	fTmRbOuXa2FBdgRR8spCLhGEReu5LJz3f0ZBlQ6yJEa7WiOWQdh9VdqVErKf8b2X343LWGqAkNP
	uWETVtPtRqlkR2OTWjtd99igb5AtR41GgzoBI8VDMcqQ4bfkBJevd5WO/XA6zL9rCU8pVn2jDaI
	9Cp5Oobfmo6NyXcdyIP6D53HvqOxnUPCBMoH0+m70cLC8T2c3+a4Csbaq98CZ8Fq6Q9ypxXoWvA
	3OBpLCLRtcklqQYMAdNd51uTDm6Qs+lK0uA94SWJ6JOiWNBkctr5NqonT6EuYrdUJXX4L7rA==
X-Received: by 2002:a05:6a00:8010:b0:874:706d:856a with SMTP id d2e1a72fcca58-874de307e79mr11865330b3a.27.1789923762894;
        Sun, 20 Sep 2026 10:02:42 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:02:40 -0700 (PDT)
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
Subject: [PATCH net-next v9 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Mon, 21 Sep 2026 01:01:08 +0800
Message-ID: <20260920170116.3624104-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170116.3624104-1-coiaprant@gmail.com>
References: <20260920170116.3624104-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_100244_047656_1A670399 
X-CRM114-Status: GOOD (  16.18  )
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


