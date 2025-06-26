Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0E8C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExLehqKRvcjfnLv7M/oInDmYXs2lxlBzas9u/z/Ge4c=; b=LvAuNM5m/AueX9ykzR6Cdx1oA9
	RioD1MK7/nr/+zcSvik+GhFWAN/jqwgIfMnpbUP466vL4GlCWavbneKOj9bTJQiaa2HJVdqWOxWBd
	YfZypqqG5WykQmiGppD2U8HLd2kVfAPLdirHpFTtUBrKxI11b42QljYOVvKCz3z+A//FxOm3Snyt0
	UckHoU6RyJ/FmrOWceKTQ+PiTa00+MQ6PmObmiOkTDHuleYUJMxKN7Cl+YalLs5exAgKDzXBmrp99
	aSMVfs8qzkkjxjsakAD8ZbaDFVJNWorEp/jjOuF6FUzhwGudZXY0HH4pH4tLXqWZ4Nk/DoVpfqdYW
	tV6vK2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvzQ-0000000D3R2-0YPn;
	Thu, 26 Jun 2025 23:26:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4f-0000000Cp8U-0HwY;
	Thu, 26 Jun 2025 21:24:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso9666495e9.0;
        Thu, 26 Jun 2025 14:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973039; x=1751577839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExLehqKRvcjfnLv7M/oInDmYXs2lxlBzas9u/z/Ge4c=;
        b=lXvBciaXjejNGIPVdvLRrVRA2CDab/q/pYE7yVO/t00IM/8K/vUamJ/lTlB7qp5xSf
         pS68bmO/IKVSN57dgt5NWqBG1yi5SAF4cqLxVswxy+pKzAx71japXGC80alEOlrswjFe
         /ctwcvOd9JjP14JODyNcIA2BX//y1QBzx8/kcbU57q9vEbQQT4RlYlpHYsxzLT3l9XCh
         YoSbSx3grdowKh7c+ptQTLTPEL/5fE5E15hFzO5tOp3txJcMhbGJ+otAP6DDkLhnuOC7
         UTPCWH6rHumhHO2ECyq6Pcs6EfjgX1uenpvr1WJWv3u06FGpUtPC2MpBHZOwMTNrcHPp
         LqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973039; x=1751577839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExLehqKRvcjfnLv7M/oInDmYXs2lxlBzas9u/z/Ge4c=;
        b=gIUhwzKF8+Jk5NAMHV/w6IyKYE+J/x2iuO/BrEtGn9ZwkTXmoVQvOgRPIwAVX58U2X
         K/ONbfsiUYt3VoiA6VTishmkFKRH5tydK0wPtqGhppXymbZyKLCOgXBu9H9P/zyVI8vg
         hmbJvcABa7q6zKZRtDbOGlvZtc2cDAUMatTZEzWk7nTu6iKPKMXI26fF0IuhJ8W81ZQE
         6E1h+UWAvDI7uRzLuHD6NsCsLsioOlUKZVpSG/p7Ozuzwpu2koTothBXfLQ/Xkmij2s4
         LDiMvxExCNYyU0CUGJDqVK552qH+2yHwdNUPIWvhUC6IF5vmVmXmOC/M4NTaJTJ8PdGT
         TJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCWPgGo6NhusFRqh6wgZft7twcHWI7LM05U8Br7xX2xJJQaIoBBKUCbdEfXcCw50zlCu6twW233+QwxMh/yzmpE=@lists.infradead.org, AJvYcCWh9XnGVb6IZSTLSbYkuUGoZIJqlp2E8ogp6YqiSRlW4Y2ZQpIyQfRJtenqV6pZZqjlBmZu7z9GEl0rs32JKZrF@lists.infradead.org
X-Gm-Message-State: AOJu0YwNdyONxg0Tf8HyRu7qNguKALxc3M5kstO4c3fSUP5GNoviP7Es
	s9niI7cgkIrMTXyv1W1Rwu5kVXiELpYC1Y7/cZCiugwfHhfRgDXUep3e
X-Gm-Gg: ASbGncsDSmZwuLjbrBYen587Rof0/g3AdjF2FQw91hGM3ZK1JvEne0orMjDEWESGTzn
	BwSN0U1jwHDzNhruVw8Hfpyss9luJ6B34E/Shb3MaugJHa8QCE6riRY4knpWgazfAbFXiw5532t
	HDR/pSnYmJavWlRwVUigUKDWbIcpEni4T0fRj5Sjcof876L+i2FnPPNdiemi+/+f80IXcKQXtll
	yY/jT18tN+6nM5oRFdvyZ7Ha/F6KMrS9AxaLsiWilIUrUbR4W3oZ0knWKK8laBRDjadHL0WWDWY
	XzBbIFUjmXXzc/nCxuI2WhITywAn2RTBuLo/aLIyhoVaQhiZ5xQwn4jF6PUOV9b9Sg2m1XGt5za
	m9XMH9Fr7olevCbeFzaKlyvvuxJ/KtKs=
X-Google-Smtp-Source: AGHT+IHT3XTc8/cQh1sfuiiz5HzOadFkcJ1uLdBn7TWZuheeMenxiZSw/KTPt6TYLMZ2C4ahDtTORg==
X-Received: by 2002:a05:600c:8883:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-453888abb62mr41014635e9.0.1750973039396;
        Thu, 26 Jun 2025 14:23:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:23:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v15 05/12] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Thu, 26 Jun 2025 23:23:04 +0200
Message-ID: <20250626212321.28114-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142401_109623_A34AA9F3 
X-CRM114-Status: GOOD (  14.42  )
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/mfd/airoha,an8855.yaml           | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..a683db4f41d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/airoha,an8855-mdio.yaml
+    description: MDIO exposed by the Airoha AN8855 SoC
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 0>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                compatible = "airoha,an8855-mdio";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.48.1


