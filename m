Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB26C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExLehqKRvcjfnLv7M/oInDmYXs2lxlBzas9u/z/Ge4c=; b=e3ztlRmy5He4SUrs5tgMKLewUX
	eMnurRYVc3wfGrC5bs7g8egq9hRNmUBu3+ha20ALop1+TozPvwCsb2MeYBBFkvkJBUCLz5XENPAX0
	ulOb+xksqNvLFhOzQfLS97Y8m8d0fxcURirUM5GExH0kAU0+ondjnDaxtV+yXW0Of6JQbCLAdFGAG
	nmPcsw5GCh1TyqvWN0Ck0x+izEpDxIksprrlPt6T+LrKxjwpVTiZY41lIkpWBH67xbtA2YP+pKJ38
	m90G97a1Mvq975550a9xjseNxHxFciRTBrHmuRi2h7pJoao9qx3i4t8y/e+5QdkMAuuswxkcBRJAC
	0bx9asLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25oP-00000003Z8N-0gQ0;
	Tue, 08 Apr 2025 10:04:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25cy-00000003W5M-1IrS;
	Tue, 08 Apr 2025 09:52:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2905112f8f.3;
        Tue, 08 Apr 2025 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105939; x=1744710739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExLehqKRvcjfnLv7M/oInDmYXs2lxlBzas9u/z/Ge4c=;
        b=YSJJKX8TGsl3NNNHYZdnrs8I3u/UOPilOZdhnE9S5EAXtajG49SndvOcZ9opnvg4L2
         XH+OP/lHXFVAAdXjZ23PAEEVf3Xr8CEb4AFDpw4i5LyVn9bRmtNXTVO2GWT7BW74cZ6P
         QqyM8ZkgamhLigU2OdGCKWPXyPsfkW77sfHnT20BmHd4qJWBM1p17n1g5cEyijA2gE+W
         BWBZaj17fJ58MXaO7lZKJqpzW7cDHl20wYcNObqBJBl1Z26XHpbh+bALHtZCetR4MhX2
         Bs/5OSpbiISnGraWb3FWcVmBLBkvYQlw3SEqDHyoVp6d/RR1tgSVM+mKR8bAoYh7BXJz
         8NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105939; x=1744710739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExLehqKRvcjfnLv7M/oInDmYXs2lxlBzas9u/z/Ge4c=;
        b=Q7mzKAo0O00kV1J4TLb2MvhyTJ2XZBgV1eEcgY7q0AqexDh6tDE/wz5ycy0Oq1+B8w
         ui+RWtyNSEra3+5WxW0li8+w62t60M0hp/XCDYT+XuIIqhKsFI+EET0/5mU23z6woaxN
         lPfmNvFh77nA/qs57qDhZLH3jWEGYN+Ay1fY/iKiBMuLe6Uv2grvQn/nEhaHrDkYtmFg
         ACgEy7aEEWc2rFIxkjS4MrBXZBhswlzTafItxg9H7/P1VU4ZNoEQ1VnjdjCk0M+3aaa0
         zvNdd1HVju5pj48SShgK0OJ30r2xKTWUt5H4ypejlTHrOZs5h3qzTH/jn7hcTvswOTA3
         xdPg==
X-Forwarded-Encrypted: i=1; AJvYcCUawTkSu9n+tlBCeXyuJZ1XCv1iPaxYsV3lOPVxYeyPOZzLMvj3f7VUxKUverRBXoGKPZn9ctdHNCof/ujweDhg@lists.infradead.org, AJvYcCVSFU5TkiOoR8kT0ZHo4sSPevgHWxQduB8BIMgibOhrMrjykPaiDdFV0tM9X1eNiV/AlCcTOmYISS6ZXANskYo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDJb3NGrUeh69EcnXF8f0l3sRJkAp690KkoEPIDELSM44+epO/
	xOn5B16bHDf8K+p+CFDgeqFuk2zPcDo99fVejYSvnqZgplKKcidl
X-Gm-Gg: ASbGncvAq5eqvbeUhfsgxOS9mu0Z80W2TPMSL6dM8X9+LMCHIKwyujlR0/FwAasvINL
	UjQ0phht6IdOPInNsc4P89ajQtqoKXXruK4lQyipBpE+LQg+fCUbXTgICa72nneEbWOTrOsDOdj
	klKzURs0plOFBiMnZHBfmCpbo/HZmshAqM4kxlDMMHnartsZmIMWlniFFw7pGuFkobuuIy0+e+x
	R4GifqTUaWAJK1WU/INxx2GdtASd2eHHbdsUWOjpyuLj+m67hjn5JNNP0tEgbuy5RDt7dk94NDB
	mRCPJ/wr+7MlhgG3uj+jtv49k6oyS9yHEW1/mA43lruvDiVgf0jWQra03Sbz7LQdRcVs2xl4sHj
	XIKwftXsmqUk7Ng==
X-Google-Smtp-Source: AGHT+IEQt71C0WsDeq8ESBHPrPvVXdso8be2LsvN0wOnaKBlrYDbH31KpmHG4v2carb+cHa3zLh90Q==
X-Received: by 2002:a5d:5f43:0:b0:39c:dfb:9e8e with SMTP id ffacd0b85a97d-39cb3575ca3mr12127734f8f.8.1744105938882;
        Tue, 08 Apr 2025 02:52:18 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:18 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 05/16] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue,  8 Apr 2025 11:51:12 +0200
Message-ID: <20250408095139.51659-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025220_375387_D9B4B052 
X-CRM114-Status: GOOD (  14.67  )
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


