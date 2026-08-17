Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB98EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MN0cvyBLl/Yf0HEK0e3keV9BG5lWd3AQZRn2j6pmwM4=; b=PrQ4G+Ei713EZWBpl4n5zOYKai
	YBFXLDYAn3ApYGZgTEgRHTNbq1HryO/VmbsE3zPc4oYQBnXnzDNrpGZJpNi8uMVNnaQCP0xDqVv+L
	xMvsqK7FwisCQ2gj3B+TSOm17kZq1/AszsOFVVxRPjYx10hOjLJcTaqBXg0Jhnpdi1UXhZIH30vi/
	xdAmrQb9o8y5xjao4qxbSYfPWEf/vNODksIHt9Va3Ghzx/CHqsvamuIQe1poAsTRqXh9CtpfLCT8P
	IzmG/Lb1NxPP+/TNw9VVjMuk+rGBT2WxOBLNVjveozv+zaEx9pjBsJ9ZgIx3K9wZMhcxI9yf3Qtp9
	sE6sa0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaY-00000005eaw-3QaJ;
	Mon, 17 Aug 2026 08:20:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaQ-00000005eQB-1NJr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:20:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso39385095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954848; x=1787559648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MN0cvyBLl/Yf0HEK0e3keV9BG5lWd3AQZRn2j6pmwM4=;
        b=Kdb3rn0KzPhrFWUnLANezMwYW3Wvqt1wLD1QJhQ5oxzvRZcPQ8K1K6EZ6N88zMROa9
         o+Hg2HF98Xl6q7DICZKU9rKkqnlPJQXO1+coWH5/CrVac5Xn7AizdehBpo1slRcFHC1r
         ho2ctoG+K7Blw8+rN29Cu0DUsdDYxBm6aUEPGo5Yeqq3eL6eolz1jPwCT6Qv+WutBrkq
         8hIpcnbjKlOvufksuzuND0mCFBTSmKHbDm+ffda0M92KSssO9XrJ4lP2MrIivUG+5JA6
         lhb/w9wzwbsbSoPjUKqam5+Pbj3fkC5kA5qHsT0ykBxS2EMWPYchhepZHshjBnxLrpYB
         RBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954848; x=1787559648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MN0cvyBLl/Yf0HEK0e3keV9BG5lWd3AQZRn2j6pmwM4=;
        b=JqYNaSvH4TiWzXK+5FCUgynCfeLjAhr+jf0sKGFmsjFjnG9PNjzXIhTmsArSLhtdFq
         mxHgoXIs//ribNuMehfpNfus+ntzC6DMeXku8sqHyBxFpEXEDMnuQxeqRKHrQOvRSvF+
         8biWqwtZNK6havbtxyn3qD8LE0KbYQS1p4Y/rufZq2BBsKem8Zwxt2DgoEtdvtM88r46
         6AoOOBRmxPUEfWCClDMAKMt7bJ4bU7bNtLKiOrT6PdKzl9xzjld8nYfDmb2uS5ehjYUP
         /jsrQFT8W3RsFFMkup2ev00bV1L6z296ChrOEo6W1vvhqMtb3+rT9W6BOSd13FBYg1eZ
         sQtA==
X-Forwarded-Encrypted: i=1; AHgh+RqGybeL4vmlao1FliUtzNvY+siFbN0QZ64zKnlZ8GjUsmNx3zHUFB1F1rinfoUq/m8g0CA5MgyYKymLkeJRnC2z@lists.infradead.org
X-Gm-Message-State: AOJu0YyAhoq9vG3UOGelXo8/wNASePkr1Ooxm7jPRfnwkAJbR7q/SlEd
	OIXClzaFWpJFSLLAV131WjJAQKFXE1YO1FLkoyP5PkfeKl1+5A8ePWSN
X-Gm-Gg: AR+sD13jJb5pBUqKngPY5HqjDlVZ1U0ywZrh2vl4wg+Zz7s5gJfmOlMykXaL+hqKrHm
	nD2Q0+q/r7oOkC14BKWHnHoggQx6wzB1EbCTdUE73N2FXCoGtKeOLP/iUYKtPjWao8WFIa0QuY6
	i6lscWweAq8KG+YJamgxXDeFjZCKcshY9pFMkOinu/WPkWBUvK0jfJWFvda2To+zO5yujPcOdAJ
	WH340V/KkxJ8oymwItL8YYsaV6bJhRe/HTuSUWMCoORj729fIHl7SAQY6+x3LAPLYCM70GRywYz
	mN4S9+dCU3vz9/L00zB4S0HISYnVApkUpkczbXZEmOtSDmGukJf87txlwrKb19UHea1ajsTms+S
	doP5y/P5O3MKwAbNW/2ysWhtKxgB2Zw+6UGHBA82/4gsqxJNpVZk8VC+gmWhulne1Z9CbmM+QHd
	fmmyRXC/c+2NT6lvRDGkJzSZ+tYXicdPQn9tp3Z2G1Cs9sALGzvVt0vdgd/Mwgy+Al5QiThzm0w
	+e38C0+A8yvE1dX/8DfdKRC3BjVIIglw11uI0nSW7RTiFLHzev2VCue
X-Received: by 2002:a05:600c:1c22:b0:499:9a29:583b with SMTP id 5b1f17b1804b1-4999a29588bmr67529265e9.19.1786954848286;
        Mon, 17 Aug 2026 01:20:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:47 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v20 03/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Mon, 17 Aug 2026 10:20:24 +0200
Message-ID: <20260817082034.20326-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012050_400206_F3664B17 
X-CRM114-Status: GOOD (  14.54  )
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
index 000000000000..472da8384a30
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
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: true
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
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
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
2.53.0


