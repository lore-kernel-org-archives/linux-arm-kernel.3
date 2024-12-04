Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E85E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UObQQxVp3PNi/U3LeYQmo0T4c/idtN7E2PfgKAA5yAg=; b=rd2nG0tMGac0UPzZLUFF2O+/Zx
	cOZ4/V1U8p03eiTyXmgefG3l+Ns1HStOxwjIKCF/A/eZJLBawHXEsWBPBfv/A7zVfPooV9gIz+lJH
	KHxSzUdXciSYvV1J1LNpNcquOkDDwthXZAwMnCPzJBNlQucv0pNfv7itP1uUeoIy8V7sbrqVDNPyd
	aumfu87B740QwWWhu4rHvInji7IRzXnfs0a/ndQh+rCFPQ/IsAp8ENAcTUzkWY54LPCncEBwCfH7G
	pWSNMsb+15BM/JoKjw/EgPJIEBWUDmlh6INlGsEzEI+VfAtxMIVdxac/Zt9Qp0nqomf4lH5648Prm
	HPvG0j/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjo6-0000000BiTb-0ap1;
	Wed, 04 Dec 2024 07:28:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIjlB-0000000BhrP-1MeJ;
	Wed, 04 Dec 2024 07:25:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-434a2033562so52972155e9.1;
        Tue, 03 Dec 2024 23:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733297120; x=1733901920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UObQQxVp3PNi/U3LeYQmo0T4c/idtN7E2PfgKAA5yAg=;
        b=YbGauGajUQs7L03mCRjRlEa+h/wwAmmpkqhttJCJ4MlwJVRiQPbqw5EEfcejybN686
         qcPrU8ep2SaQJ1USuPMg4ztnpvo8/mrSG0Mag1qU0sSOPRuy2gBmMAHYd2g5HXBFub5r
         s0nDZAB39eXwEBti/dUQyJV8joTGX8auiTci5fhT3IkRsBRd8T2QmT9uKbCP+aEtYwEx
         PHovv/2j8wGlctkfRhjWKXN3CKAs+vwM2srMlXVEF4gBXRMqG3Aaf7XpkwPdmD/Rxm75
         GqDTizXkFSWx6Va6MjjN5ZFpST13yxhfadHJDxaVR0m8YcEmqgiMPkTk8rVHj9Ma74fI
         D/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733297120; x=1733901920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UObQQxVp3PNi/U3LeYQmo0T4c/idtN7E2PfgKAA5yAg=;
        b=gKfA639bEDOWo80q0WNKYxP+zzLHSMKf+e/MQw5wKgcqE76gtTjHjYpvmbUC0ISbxB
         RmyNBNfA77OCUrxX7yoJQSK9Dyl4I1St08IW6fFOJ19cGab/xhKkVMro4I/4sZFwR2Kr
         QGSRlyr1ba8K45B4Au4r67DWJdsHNuiZoct1GvYIIMuSrRXmL0APZESFZ+jCaDKuXF4y
         MStCy07PL97KwZtFS2YEWBv98lEH0gvpgZsNajlJURLwLfXQ+8NSuYbZ55rg1JpY3oeP
         ZULbFPnnpA7/GQiVYKybMcIRLt2Vqe28a4yp7MWhtdpcOSNITsWiHxSavnq+vfTmy6t4
         znqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC29dO3rasCqENGlKTufJlSTtiPD7NvAX1ORDbAv8uikfH9JHC43vdnVtW6TIjyx9Q8Ubtu5F/M9I6r719e4NE@lists.infradead.org, AJvYcCXkjo8lfqzaYMXCH9cbLvTv/6j5lX9e4lucTdRiexaXC3q/+r3POhoYqVlySP7AsO4cHwCJvSWaVUTLqPR7Ajk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3bTsgBosBVZuQPdVkfNqlsZoJhF0o+BugLwz3VAdxXobbIUbL
	d4TJKPIW6+hE6LIb3uieiWqmynxIfp6rjno1kPBpeKcImXxuBiNs
X-Gm-Gg: ASbGncs5vp7qkn+nRhgDgURHxZsy1sOPqxvYW4D4OkzKCOe/WjEmyke6Spo+blJxNX8
	YSBL/+W4+JNZGVyv+0yb+psfCfMSN7dQBa0NcL0hUNI5fKmvkLdsVzd0J9L6YArV+jwZP/Be0LY
	GCBRHKxuuGquBH44jcxw8P2cB8qGWBTPlHgNuN/re4vp8tS1SIERIyumpobW1kIUxijAPYsl9QC
	xh+lG5gPl/wL3wRaEbO9MmehGL0DdBVtASmYRs65gm/RSDJG38NsNZ2gBlP1nTIGnHNA8soAj+h
	/kjAw1wQOdx3GbjVwSs=
X-Google-Smtp-Source: AGHT+IG6GiOU8xXTwVBff1NMq8Zq0Y8B2/QsfVDLRgbuHim2FUJK1hmA+W5ob0jF5AAiiOWuiHlEzg==
X-Received: by 2002:a05:600c:4f12:b0:434:a962:2a8c with SMTP id 5b1f17b1804b1-434d0a03abfmr44310995e9.22.1733297119576;
        Tue, 03 Dec 2024 23:25:19 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434d527257dsm14396655e9.1.2024.12.03.23.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 23:25:18 -0800 (PST)
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
Subject: [net-next PATCH v8 2/4] dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
Date: Wed,  4 Dec 2024 08:24:09 +0100
Message-ID: <20241204072427.17778-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204072427.17778-1-ansuelsmth@gmail.com>
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_232521_408902_E6F0AE64 
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


