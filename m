Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C340D597A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UObQQxVp3PNi/U3LeYQmo0T4c/idtN7E2PfgKAA5yAg=; b=AIdaPkS8JZuO+fABQMLoAgbUlf
	Kpf0hr6jBR9OfR8/OTn9Z5bYImO/mAnt0+smhujGI1D8wW51scDO8e/IGnZxZ0paafWhsINWCHawe
	mgarzT2sKuZ9Clj7/fIAXneJelyDujor+tkXQdMHl4JLkdEoOlXL98ZuByqOOLbRunQKpq804yUwg
	B1+B6V+cN0uAjkS+bp03C8qg6ZELDb3rRnl/nSyF6J60zf9XrCk+LZuZZmNsubAP7AhonPDKKYXe0
	9lkch+xlRsHLCGV0KI5kxt0Bs466XUt460y8JigkSkw7rd7NAzO/VKLOdOL0Gff9Z5f2IQfiYLKV0
	aLao7psw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxtd-00000004vqK-0Z91;
	Tue, 12 Nov 2024 20:53:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxoI-00000004usd-2m7L;
	Tue, 12 Nov 2024 20:48:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43163667f0eso52725585e9.0;
        Tue, 12 Nov 2024 12:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731444505; x=1732049305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UObQQxVp3PNi/U3LeYQmo0T4c/idtN7E2PfgKAA5yAg=;
        b=lz2KQdKYKLSJVVWxnaHxGWG4GUL6X0WQl/fd2mQUMvMGjj5QyClgaF5/lohDbEVenC
         1T7yopEGQ3HZBK5xr/m7u0bTOnhZ6q4CcvRTSg5L6OgPrsbrxProvLN/xBQi32iw4XKs
         aWka1jjHs72TEHPCHUSvn8o7mz0TayAFCxWphWk5mwgTjfgQjLB4zySBQ0+xSIopojFm
         Gl0upL1f8YiS+SKf3WWgdESLUBGoLK/YRJaKw2aGlJV5M86ZFQtZ0aUUQANSDrPkIh1M
         ceP1lciowGlkV7aHkiTClgdZl8EvRf8OBs4fRcLIcIf0xS4yrxg66WMvAuUuttSedAAU
         c1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731444505; x=1732049305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UObQQxVp3PNi/U3LeYQmo0T4c/idtN7E2PfgKAA5yAg=;
        b=tFn7gIEMkyEmSVb4DFcJjniTdlJNTAmyD6SuIq6P3a2TquSKng0nnIMwSRokXAA4I5
         BXS0F+YTVc/C3tyOwftsGb7FSVnQCJnBJlXQ+CWbSFxDfjdwXpOtNnjV3eV7jPq1TUo7
         M63c3AsEMQD3TclNuzziUiXRGqnh5WPV/ksZkdYApvRQOuee5hJ0KN2iyAtSCsMY5JAC
         y4EJ3yZPLGONBYnVOqx0JEjP3Ig3AKVUb/wrsgtnvGPlZo4dFAH4VGwxc0XD3rFUIhgO
         ZH/E6x0vwlK+DkF14JPkfyvmGRd6Jf83eo7kA/6FO88F7kwU5Ax+NhU+lHCRvBTFph7a
         hbLw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6/ziBLyGIS8qfmz0PQjon8qdAvlVzWuerWAmZzoqKsTxgd4yIgGYsvp8IEjm2qnobU+K61bE6bRDdPWYNhA=@lists.infradead.org, AJvYcCWMKmwWT4ADjcALVsr25XZRXhMB+DJN4HHhV1j/Vd9xxmxC+KvcjI4bU7TaS8RqI1g3fvKs4yhK27umwoqEHulh@lists.infradead.org
X-Gm-Message-State: AOJu0YwmYbE5KUE6GR7HBrRj8nI66WttQrHM8wfVG8fvGNl1pR7WqIgI
	CUsbiW8Xmpe+I2/MjebAVBoxrbIlWRBok16ITjVpIYTBg98dYpzx
X-Google-Smtp-Source: AGHT+IHIlzHbNYgMBcj9zwy6DpDNvC6DE7ecgVe/IZQZ6oGS7/7xQGTz7mD+rlLS+0H2uFMaOJXzNw==
X-Received: by 2002:a05:600c:3ca4:b0:431:251a:9dc9 with SMTP id 5b1f17b1804b1-432b7518f97mr161840295e9.25.1731444504419;
        Tue, 12 Nov 2024 12:48:24 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432b05c26e3sm225426715e9.33.2024.11.12.12.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 12:48:24 -0800 (PST)
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
Subject: [net-next PATCH v5 2/4] dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
Date: Tue, 12 Nov 2024 21:47:25 +0100
Message-ID: <20241112204743.6710-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112204743.6710-1-ansuelsmth@gmail.com>
References: <20241112204743.6710-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_124826_729674_06B7DBB4 
X-CRM114-Status: GOOD (  18.02  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


