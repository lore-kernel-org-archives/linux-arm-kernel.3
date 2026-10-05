Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A757CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=; b=loshT0qSStS48WamDa+1mZLQao
	61fEv14ctoRUaf42Hcj2tsNpkczJOhPzkN+qbKjfoKt3V5Kc+MPxnnxqVH2VQ2Tctnd8F+TNlgNfo
	ISgkv7E1wIC9DK7qK5eR80vvXYOnfMkUBZzPL+pejPMIFo47hm9RKg/oQmd2KoGDvkeTrP9TUHdum
	1Gm/doZPxXkoIT462fHFh7YxIjOpK/ZpNEqtfTeV4IHH5syGyaTuM4PbIV3hHhKWapR+du9ckD1Cg
	w49w2rHvt+ncWgy1CiSO5nWabqumc4pGGev4chEZot/qax3xvkhwq7U7SNyjAJH4sJceDQ0YJqebr
	//pQltuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrCn-0000000HG6B-02Q8;
	Mon, 05 Oct 2026 22:30:45 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrCj-0000000HG4H-069j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:30:43 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2d561173f9fso14938495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239440; x=1791844240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=XkDbP9/j186UW3AhnSnOQ/kC8LdhWnUDzwJgG7C3fxPBVjyegXk/n7bBRdzeB7XV5O
         uhziou3p1Mf5PfY+U5AAfcsUYDdotOYmRXpNQAqAzJhNU7P1whuPldfQrWGmbHVJ1Ui1
         XIrHfU3Cs5snRrvC4JaO5ZzkQQ9kXrdYAMcLoksLttupX63RtZiftKB1hPHw82oJC2X6
         C+TRjG9NAmQIUgvgAK3Z0+kkvzqQ+Sptmz3skWklw/IQQfB703I0vkHjPDiXrYU/C8W/
         dNUP/7jVGtUyfy4crnKxdij4YbU1rbmuRZwpW+fcyuzoHRQWKYwHbj5g1thelgTfId6S
         +5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239440; x=1791844240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=Q0YdanUNw+MDYLxEI7tD5BAYIhn9rs3NsDnQiTirFP3cHV9YsU4r/inXqLLwQU2Kdz
         7DywbLguE9COa26lvVcGPllzLEvRYbgW15waRzRcBXe/hp8YlDUG+8P8rVntFCukZ8KO
         ol6mo42QrYe/i4fkJbRcOT8ZsEptqydbORqLRFefUzqgDQkvI1Z59g+UacVvPjJE0TxN
         QfpHr1QTwAmd5GgyqQkM8WcoVqYe1oBimo6hWNFN5Di+ASkenmd00b7rcv4uQwSPPK2m
         GAln8Qo/DMJ+gDiB9DsLJ2zolfvVPI3G707B93dmvjhM6OeD//6UT2pNzC6bDR4jTUVi
         s2jg==
X-Forwarded-Encrypted: i=1; AKwUvBxGfDmJaJnaPGpwmQ9EEiseVjaoPPf1XTu6jJVDNZ+b+lYc3K3aiFs0rg4Gmo5aZvNLEC8p4gp6u1IjS8qFUTKR@lists.infradead.org
X-Gm-Message-State: AFq9FYI8zr07fkEx53VYX3MAKP4/ZY0llXmSkhsqaG2hud6wPn2yJJM8
	pFeA/qBXAfazOPytRId2G/oa12gTKC2WYOZ31XkdV7tMxVF4YOVFvBjf
X-Gm-Gg: AYBFou1UUNm/chtf54FiDn488NOs4IG7SdbIPEBZq0XJlNcEVA3BEAEsLExYAC3wqlp
	BVKpNEHDCygBYn/0rIkXhoSHb++3KtchAOfsL23Vy0140tBYBaETSm7orxwIdprV0YqK5tIbowM
	v+tvegj31d/Cn12q47Sz1T9xCxMBWmpIjhmq0cAVYlXxXoJk+UYKOVVhNfQFAK7PB3aIkE+U43G
	2cDzspnhu1ylrnS5kHvBsEsgqP9+lCHSw634ijQvFH+/+/LXdUnRDXHRUJIaU0o1MuFxbZF7UO0
	wPmRvo9HJn5iVOLFGupi9S4kXutxLvzQumFLhxSbjVOQ4XS5FqbPEYBxNClhqGsglFGjr1ms6cw
	i0O5IGXj0tC/2F7/oG58wYBYapX3DP0W8FhtaXYlnR2thviX2TVwokFv5pZXlFXYnddKYuXxUiX
	Fp5WIaB1nfUz4qMS47TXN3cq70vOwc+DpIhWqUOl0KuaYlQSsumkLu9IgjOOVC3MZ4wzTGmr2Yi
	7k3uzjB
X-Received: by 2002:a17:903:f8e:b0:2e5:397a:b70 with SMTP id d9443c01a7336-2e5397a0cffmr76287505ad.56.1791239440308;
        Mon, 05 Oct 2026 15:30:40 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:30:39 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v10 1/6] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Tue,  6 Oct 2026 06:30:03 +0800
Message-ID: <20261005223011.1124347-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223011.1124347-1-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_153041_094702_0F5CCE2E 
X-CRM114-Status: GOOD (  16.23  )
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


