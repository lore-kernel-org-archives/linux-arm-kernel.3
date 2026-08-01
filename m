Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED73EC55175
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApDMeM/bjE3TDpuc1mM/C2VeZt90bzUPQWagsmJ3H2c=; b=qv4gvYz2zi0lLitQDRi33A3jzn
	MmdWBb+M1A9g3A7ED+M5yrQWFDuMHUyGf/skrZBK1Bx53b5QfbD/GkBqpNGwGQ//4heJuHx3nMWtO
	OwKYGGO45EvFKczAGeuFVwZbbjZ4LtBQ/p68eAiIHUG/p+aHqHAlYD4w3cAt/+wWUFCGVyTtucwZp
	nju/g5d6xBGzxOIcoYUwvVSfyuioRgXO1A8nrp6wbSWMoQEZRDdI4W5hWtTCWlsmJfqHTF5yX7Er/
	sLVhxKgP975XdcAvmJD5PSWH87pinNxbin/DR2kI/M0hJvDNzvdVpjJrXrDvyb0BiBBFytJmY2GB8
	D6ZKkLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAcu-0000000Eigi-1zaD;
	Sat, 01 Aug 2026 14:23:48 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAcn-0000000Eia1-1OCJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:23:46 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2ccc2e84048so11250995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594221; x=1786199021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApDMeM/bjE3TDpuc1mM/C2VeZt90bzUPQWagsmJ3H2c=;
        b=gjvpghUZS1r+ITs2Sg4NWtdk2Bnbj43zUe7pnoR3YADdNizSSW2w/nduEXkALD6HFp
         atIg+bI/7YFrDAbXMOsnaAejrMQKPRFmYVSVqel/ThX4g0Ed5H7bX0UG8VRdK6AAeitr
         vWQVoecZWYSL/vp+kZu17e+nyGtal8KyComcUQHrWu2ccx/XY7lPdVEn5yR0lZqybTRY
         j0ess1Lh4PBDvnd/VwRLb5VewZkxt8byeDleUukNmpg0oIHmaYoPUjVx/g/zyFxh34bM
         246wx/HPaIx+A02zCxX6M98XTs9R32h9/s+08lHi/y2zHOyFCrLGqJsW1V/2cVKl0CmV
         VagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594221; x=1786199021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApDMeM/bjE3TDpuc1mM/C2VeZt90bzUPQWagsmJ3H2c=;
        b=AB0da42fWdkpwtKuOxdHeHAGwgHm/C4Ja2V04uMocmM1vffBCi+Tui2q8ckfsSWQ9z
         M51WJ3LD7a3Ln7dqIuHaTGPLYLe7FpvzDQw050OB7sbIwy1pLNSOXeGufvmBQvbJTjID
         tLE7BAaK58IphYdAGgw253Xr7fCFrp90N9mO6DNNo96SPzLgjhd/4yDQe5779keifeGi
         6wHZHOCC794z7qIyvI804oOS2nHFReujV8qZQ6ss9sFc72HkDKDETLL/P6XRYvqxBE7L
         ygOd8Pky7rxfHcB0uDLVxnav+L7cTv6OK3nv0Pjn9uNZE5jXWCuJ7n1PdueWa7+6/CVQ
         V2dA==
X-Forwarded-Encrypted: i=1; AHgh+RrN4uiAnFRlcbzLaA3j/ua2wKRYDhXsicjykoDYaesKdv8Q3IrSu1Jm7a+DVRW31lmNMkQOjbsB1c+R1FjiKjUR@lists.infradead.org
X-Gm-Message-State: AOJu0YzceY4QTOrdPSEwMooaB3pF5BRYi+7ZcsGk622wRWxEBNz2h3mT
	bP8U8rY91pfyRlWk0Bbi3N9+WpqvdwsA2CFwW1sZ3wwkM7d6P2NRi7Bf
X-Gm-Gg: AR+sD129gbZzsvxT9AvcmJIzIsg36yArIfuU5vLYxmBOGm87dAIU/vzabKUDOrfCRhq
	8DQxznci5bbPUqyNLcOXZPq9EjfDgqqUJVAvnAozL9gsraQ9KZSd81s05QbTpb/fBy8rQEOW4E3
	pR+JM82WyO0QNHYHe5T/ZxEa72+5xtc9fFuDFPLVA+6Us80cga4sIL7uuRHuVTg+C1Mo50wpMIx
	UCFGLZjUSy0qCsTBS/d1PBWy28kEZjsa2QOEzjG6eXZNsGbFnMzl0YD759neeSliGQl6pKYKZPT
	z4V71m1QPf7ZTlc4gKz+Da4fq612skeaGp9FbVc1CwlxQWJec+yP3F9kRUNzlIvoL89z4oTze1V
	WP7liexbB+EnykA/JsxoAIowT0g/+n0Ocqh9AELc9A5UFoknhoppYQztZXHroeFF0BqkbizLMnT
	5I5G6UyAqlyf/MnyABsjaf3vBH249XLEvmTinV3XaGfaZ8yxlT5CLM6SY=
X-Received: by 2002:a17:902:f54e:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2d05224fa51mr37049725ad.16.1785594220516;
        Sat, 01 Aug 2026 07:23:40 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:39 -0700 (PDT)
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
Subject: [PATCH v2 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
Date: Sat,  1 Aug 2026 22:22:28 +0800
Message-ID: <20260801142244.679437-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_072341_407167_998336F4 
X-CRM114-Status: GOOD (  17.85  )
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

The binding describes:
- Required properties: compatible, reg, clocks, clock-names
- Optional properties: phys, phy-names, power-domains
- pcs-mii sub-nodes for each MII port (reg 0..3)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
new file mode 100644
index 0000000000000..3e3f3a388d822
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
@@ -0,0 +1,127 @@
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
+  The block contains four MII ports (pcs-mii@0..3) that can be
+  individually enabled and routed to one of the Ethernet GMAC controllers
+  via the pcs-handle property in the MAC device tree node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    description: |
+      Base address and size of the XPCS register space mapped over the
+      APB3 bus.
+    maxItems: 1
+
+  clocks:
+    description: |
+      Clock sources for the XPCS:
+      - csr: APB3 bus interface clock (clk_csr_i), required for register
+        access.
+      - eee: EEE clock (clk_eee_i), required for Energy Efficient
+        Ethernet (EEE) operation.
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: csr
+      - const: eee
+
+  phys:
+    description: |
+      The phandle of SerDes PHY (Naneng Combo PHY) that provides
+      the serial lanes for 1000BASE-X / SGMII / QSGMII.
+      The SerDes must be powered on and initialised before any XPCS
+      register access.
+    maxItems: 1
+
+  phy-names:
+    const: serdes
+
+  power-domains:
+    description: |
+      Power domain for the XPCS.
+      On RK3568 this is typically the PD_PIPE power domain, which also
+      supplies the SerDes PHY.
+    maxItems: 1
+
+patternProperties:
+  "^pcs-mii@[0-3]$":
+    type: object
+    description: |
+      One of the four MII ports of the XPCS.
+      The port number is specified by the reg property (0..3).
+      The port is linked to an Ethernet MAC controller via the
+      pcs-handle property in the MAC's device tree node.
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+        description: |
+          MII port number of PCS.
+
+      status: true
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0xfda00000 0x200000>;
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


