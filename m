Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F0DC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=; b=S/8SiU/UDYp4OZJboPdmot80tc
	2swkw+ZwA4yU/hMYgn7i5e3/KkE0wNuLoE7tiFkD2CK+ZF+1HhjIsyKfZL7yvQGmac7VmdD7fukq7
	6CQVu3p4cFCbiyHRrhP3WY0AUpgGnKDq3+Lhup8rlMCb8Q7+tIWo7QaZn+y+NOCs5wPq71deFcn9D
	utOgi4Gr5GgRb4i7Osd/FdAQEbVIdDx7KL7+4Q5ISd6vV5BZ7bWxl/S0xeysvV6qWhCl6NcZpVjFY
	/n5MM1ijUIFb4ccU56TmFKNEzVt0nn0Wast0YHp9im4evC1kXJSPYwo5W1yZ2fAXaz3uCjZfpkVV+
	9YJsFGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uYH-0000000GH6J-16O2;
	Sat, 19 Sep 2026 12:52:21 +0000
Received: from mail-pz2-x04.google.com ([2607:f8b0:4864:3b::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uYD-0000000GH2C-0tcf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:52:20 +0000
Received: by mail-pz2-x04.google.com with SMTP id 41be03b00d2f7-cc4c181b42bso1006350a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822336; x=1790427136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=KsbyX/oYrDWgo0oVtGLWYO5vAo8wD44uSFhAnWOmg9qltxfWCX3CLiaw5Ys/nti2lf
         Kr4tF7iv6NGUhPochxQZBhl+e7YzH4SVKnFZ+cZ4cF3j0v+Lgiudrf0IhRDSbYJMcxda
         YEJOEKu6g7zVdDV6TN2RSr8JlFz8XoFjlytrfK7A5pQjDWkACuiRNRR46DlZr1i51utt
         xSWPO0cXuc41NIR5+r+yWvbKUdECk6O5Xtth7UYXZmWeWfPBoKWdsRUrojRsBXjwBric
         oCHYj1yXxmiRwOjNokfbVvxVS4z/KA7dQ3ovudQ7BBtxknlwh8zqRreaf00ku3jvvPeq
         Go8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822336; x=1790427136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=1T4y6e9Au6Sygw6D0Hf887DnBsy4tZvQPv1AGWt7UNfM0E31kgHRFW04E4QnmwFnO4
         Zw/EPvYVj3o02iMSh3rN54c4uTx4qRGtt30H4YHb/PxLOMg+TqpjDEVdHUk4E4//BGDR
         gZMHtJf8soYnbNeOarTWi7eU2MQNoHoVQDf+Q4SeTM4x3Jv1rT5I9CgR6TQ4RL8LzUBX
         og7DY1HH8bDn7MzSYxanewiAuebwm9vY1rAHuXPaJ8L2OpPD49ZOmc7OtXq3n4Pg/pNm
         dhG7v9zZJlVR+Mwc3DuKwAwMlwCFAMsgzuR3Vy+7ix5qGHU4dfJNoG1p3FZJielylEa1
         yr1w==
X-Forwarded-Encrypted: i=1; AKwUvBxJhZMhN1WZjlmqYlilL668sX0kfaAsxQm3M9oUjcZgSdxac/zf2fpF6jSSiaDOvKAvkPGgUsRNjJw5ubBIsgA7@lists.infradead.org
X-Gm-Message-State: AFuF++nSO9iik5cVd38j1mJ5ONNaAd328ZvAPcbiXHKEkCFVwEnrmhv+
	L0VoQZCP3f1pFsIFqCXSZi7T4lD3JZLU9GWMTSeqv+9jdyqtsSN77b+y
X-Gm-Gg: AYBFou0SWd3rjWz4Wua0Ko1hNpEQYhRNewoPMaIsVJH53H1iz2mXcZE++lsLxrywQ7w
	cffn36lJQYGv94hXYtlNA3hLZHq3BXRmBCWYQSD/fsfIEQ+2xD6ExFB5WKHPrfbB0i8Hwn9G68f
	l5xsVMT0591yIqwhZy2YB1E/i/RlEzgysdRdbnz/UPl5I3b5o2FZBJ+9r9LeI7wRBvk4zvUuyFO
	vQeWMzoSFX1IASjpSKlFvxCKsUO3Q5Qoz9O5R7/WUsHegRFlViYM87GRpO/ACTgb8PMZNxRL2yd
	DePJrp5ryh8wDdehPfYTo+ImbJ6mOlpP/JRbRlwEeN7shgpnuqrhIPvd2xZMBB3ercUQVgPhHlm
	dyHkzXwpgRrOCpd4ELMNE59eamZXvvWOWHA/18yN5oP3SWoAZkl5zuDIVCuj8WAOmn9vx8ToBpJ
	C61CiYBS9DGFwyS739rrTWKsoeT2dXWGgo17e4fBjxLfAUPdSPQBlji1gmI7dueO3Bsw0Imw==
X-Received: by 2002:a05:6a00:39a6:b0:878:34d7:6a35 with SMTP id d2e1a72fcca58-87834d76f58mr1393269b3a.41.1789822336163;
        Sat, 19 Sep 2026 05:52:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:52:14 -0700 (PDT)
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
Subject: [PATCH net-next v8 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Sat, 19 Sep 2026 20:51:11 +0800
Message-ID: <20260919125119.2107089-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055217_262239_ABB3E1C8 
X-CRM114-Status: GOOD (  16.65  )
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


