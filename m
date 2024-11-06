Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEB1D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZrFVIFCE+2ZVecKOZ8L2aVOCyo+e6QKd5kK73pNQH8=; b=mla7iejOd4bRNfce1PFj2/v75w
	MRVbyMtQhtW5Wbt/GuytMd1seWs+ypMmZP23GgONmxxmZ3sJ3WJOzTRuFFzuDgZ/uLLCnPzxG4qS9
	tivYcqE7qaL0jjJnvLZL9TpUkECB4CPxc2szmoT5V8kkvK8E0itwbWJ2Fw/WLbk8+moWzSVzsPj5S
	j3ibbXhhY5V6hErYgEnDuxA3eSCDNmp0udx2jhaXkvnGRwwai/NkiPs9Bzhdbwx07BjzydlfTPRMc
	kFMnoYUKvFiVXVpbwWQJGNRnZXIgdHYAnScTqURM+LgWxvEMRvE9vMLAIifphnBVpOCGUeyRuaYUQ
	AXsvll7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fuB-00000003NQr-1xPu;
	Wed, 06 Nov 2024 13:17:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f4F-00000003AbF-1WjA;
	Wed, 06 Nov 2024 12:23:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43161c0068bso55909835e9.1;
        Wed, 06 Nov 2024 04:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730895801; x=1731500601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZrFVIFCE+2ZVecKOZ8L2aVOCyo+e6QKd5kK73pNQH8=;
        b=M5pzhQqHPquKvTVDP5XHiOsPbHJYyssXeJR8qCBpgNzhANVZ97labna3Wlqo7KjqZn
         5sTdm+quRfU8aSSejli6hYxy4zTKcU+1qrFl42JsS60OLlNtLzGF0nHYy9mf9Mb1DBdA
         o5gw+el0+cFc5gMkG5BTMegqL7piTXcIim3HH3+ZOqiS6Udfh8nMbmXDH9YWf96mGH7y
         rHsiqG4mctKvRXon7YWFwGZKhC7y+XW9PAB/b4szvr1qbA8ocUkc8NEW3ByWRVlP5CDf
         ysmZkD0cDJv/rSe+1wQxsdAJ52OXrbC0HjDpHjhcBldGZq1cT6gU2vesEXYAaM/tiXiP
         3dSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730895801; x=1731500601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZrFVIFCE+2ZVecKOZ8L2aVOCyo+e6QKd5kK73pNQH8=;
        b=oUddsAk6eevTECSMnZeEaXzeBueU6oGFXAL8Ir7KPnLsywS3IwQRCVGC1PA8e4mAHo
         QGkZrgVSSwCyjKr3gpL44gPO+RjcBCEnHv0dwKwqwZQ9uqOBsWKmHwfqj14UkrwqUSKn
         aailPhydvlgY801E270Wbr0mk/do0cVVQhwFu0mSY2k22ZNGMR3b3cAeao0tF2pFG9x+
         HdY9aNSk7dDU+yK051MRjGPbylmd7mYJM6AmTghZrE+uvvL7ZfDPlLjw7bzifTg7SNas
         vwS0LkUXTIwQfbBfr65kluQqu+0yJcoHS88lB86C2/6kSVHwg3ubexm7GWJ9Cogc/wPq
         wCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiokv/yMqy2WolMILJJPdD/zgg+Ycv9wY0ZAVo1USgRePkqMz8KzUAUPHDEmAgEsd/Q2PhOpsZALTgCerkNmg=@lists.infradead.org, AJvYcCXoyHx6qWHXBohEuMEc8qswmhYsweNLQbMue72IEWoGnhjXlmnS5zoUAoLdnZbdJxkHEsGKtWEjQ+1eUieqbqDT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9KNrXjy9oduXiqzwnQiAwmD3IvfsLNEFOL7arlJYDu5KVqsHz
	+XQtx4xEVUxuxeK1OSEltXcavn5MlepDBgVFCCC+lz1OjuP5x27z
X-Google-Smtp-Source: AGHT+IEj6hE+tQwtB/65FRGX1/cBAtHut3RMUlDjObqb+8G6xOtFXmNVjOC60buvXZBrwC+qjVAZ6Q==
X-Received: by 2002:a05:600c:5492:b0:431:251a:9dc9 with SMTP id 5b1f17b1804b1-4328328481dmr178997795e9.25.1730895801099;
        Wed, 06 Nov 2024 04:23:21 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432aa6b60e9sm20444155e9.14.2024.11.06.04.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:23:20 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v3 1/3] dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
Date: Wed,  6 Nov 2024 13:22:36 +0100
Message-ID: <20241106122254.13228-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106122254.13228-1-ansuelsmth@gmail.com>
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_042323_434853_8C20AB77 
X-CRM114-Status: GOOD (  18.10  )
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

Add Airoha AN8855 5 port Gigabit Switch documentation.

The switch node requires an additional mdio node to describe each internal
PHY absolute address on the bus.

Calibration values might be stored in switch EFUSE and internal PHY
might need to be calibrated, in such case, airoha,ext-surge needs to be
enabled and relative NVMEM cells needs to be defined in nvmem-layout
node.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/dsa/airoha,an8855.yaml       | 242 ++++++++++++++++++
 1 file changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
new file mode 100644
index 000000000000..8ea2fadbab85
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
@@ -0,0 +1,242 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  The switch node requires an additional mdio node to describe each internal
+  PHY relative offset as the PHY address for the switch match the one for
+  the PHY ports. On top of internal PHY address, the switch base PHY address
+  is added.
+
+  Also the switch base PHY address can be configured and changed after the
+  first initialization. On reset, the switch PHY address is ALWAYS 1.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      GPIO to be used to reset the whole device
+    maxItems: 1
+
+  airoha,ext-surge:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Calibrate the internal PHY with the calibration values stored in EFUSE
+      for the r50Ohm values.
+
+  '#nvmem-cell-cells':
+    const: 0
+
+  nvmem-layout:
+    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+    description:
+      NVMEM Layout for exposed EFUSE. (for example to propagate calibration
+      value for r50Ohm for internal PHYs)
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      Define the absolute address of the internal PHY for each port.
+
+$ref: dsa.yaml#
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        switch@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+            reset-gpios = <&pio 39 0>;
+
+            airoha,ext-surge;
+
+            #nvmem-cell-cells = <0>;
+
+            nvmem-layout {
+                compatible = "fixed-layout";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                    reg = <0xc 0x4>;
+                };
+
+                shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                    reg = <0x10 0x4>;
+                };
+
+                shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                    reg = <0x14 0x4>;
+                };
+
+                shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                    reg = <0x18 0x4>;
+                };
+
+                shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                    reg = <0x1c 0x4>;
+                };
+
+                shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                    reg = <0x20 0x4>;
+                };
+
+                shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                    reg = <0x24 0x4>;
+                };
+
+                shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                    reg = <0x28 0x4>;
+                };
+
+                shift_sel_port2_tx_a: shift-sel-port2-tx-a@2c {
+                    reg = <0x2c 0x4>;
+                };
+
+                shift_sel_port2_tx_b: shift-sel-port2-tx-b@30 {
+                    reg = <0x30 0x4>;
+                };
+
+                shift_sel_port2_tx_c: shift-sel-port2-tx-c@34 {
+                    reg = <0x34 0x4>;
+                };
+
+                shift_sel_port2_tx_d: shift-sel-port2-tx-d@38 {
+                    reg = <0x38 0x4>;
+                };
+
+                shift_sel_port3_tx_a: shift-sel-port3-tx-a@4c {
+                    reg = <0x4c 0x4>;
+                };
+
+                shift_sel_port3_tx_b: shift-sel-port3-tx-b@50 {
+                    reg = <0x50 0x4>;
+                };
+
+                shift_sel_port3_tx_c: shift-sel-port3-tx-c@54 {
+                    reg = <0x54 0x4>;
+                };
+
+                shift_sel_port3_tx_d: shift-sel-port3-tx-d@58 {
+                    reg = <0x58 0x4>;
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    label = "lan1";
+                    phy-mode = "internal";
+                    phy-handle = <&internal_phy1>;
+                };
+
+                port@1 {
+                    reg = <1>;
+                    label = "lan2";
+                    phy-mode = "internal";
+                    phy-handle = <&internal_phy2>;
+                };
+
+                port@2 {
+                    reg = <2>;
+                    label = "lan3";
+                    phy-mode = "internal";
+                    phy-handle = <&internal_phy3>;
+                };
+
+                port@3 {
+                    reg = <3>;
+                    label = "lan4";
+                    phy-mode = "internal";
+                    phy-handle = <&internal_phy4>;
+                };
+
+                port@5 {
+                    reg = <5>;
+                    label = "cpu";
+                    ethernet = <&gmac0>;
+                    phy-mode = "2500base-x";
+
+                    fixed-link {
+                        speed = <2500>;
+                        full-duplex;
+                        pause;
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: phy@1 {
+                    reg = <1>;
+
+                    nvmem-cells = <&shift_sel_port0_tx_a>,
+                                  <&shift_sel_port0_tx_b>,
+                                  <&shift_sel_port0_tx_c>,
+                                  <&shift_sel_port0_tx_d>;
+                    nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: phy@2 {
+                    reg = <2>;
+
+                    nvmem-cells = <&shift_sel_port1_tx_a>,
+                                  <&shift_sel_port1_tx_b>,
+                                  <&shift_sel_port1_tx_c>,
+                                  <&shift_sel_port1_tx_d>;
+                    nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy3: phy@3 {
+                    reg = <3>;
+
+                    nvmem-cells = <&shift_sel_port2_tx_a>,
+                                  <&shift_sel_port2_tx_b>,
+                                  <&shift_sel_port2_tx_c>,
+                                  <&shift_sel_port2_tx_d>;
+                    nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy4: phy@4 {
+                    reg = <4>;
+
+                    nvmem-cells = <&shift_sel_port3_tx_a>,
+                                  <&shift_sel_port3_tx_b>,
+                                  <&shift_sel_port3_tx_c>,
+                                  <&shift_sel_port3_tx_d>;
+                    nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.45.2


