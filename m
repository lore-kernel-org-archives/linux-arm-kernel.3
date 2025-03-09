Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5CEC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7yydj1tnEV2f65Z5FfShnsABOUAALGH6EGqxdEbm+k=; b=ISw5bjlknOEWhOe2Haj1TC+NiK
	lB8Amc9Y57K3IzJBqUgb42FK/I9CU5vQRdjrQ3oAQHMepdeH7EgBMQgdnq5pANgw7IHqhfTGWg+cT
	Q5O6iIyI2t8SzMzXcBKh+y6LbRQRg1YCl7g2pk6Gd9toiO3K4YCoroHgikOoM4zP5e6Cwu3ifTSBg
	TRHxQYcBbbUhsPjudCCieeNuupOwg+xhWVIOT7FairczWfq0D9clkGB8lcvXN7H287MZNyr+LZjNC
	w+/g0nAsEYee0EoDlvNNZVOzFGf00Yuzb0KlPliMjLztoo9pPK3zJqUAdbnNj7utJ9vXKDUBFJDZ2
	Bo6DnX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKay-00000000rYk-3umy;
	Sun, 09 Mar 2025 17:37:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRR-00000000pqs-33h3;
	Sun, 09 Mar 2025 17:27:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1812694f8f.2;
        Sun, 09 Mar 2025 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541276; x=1742146076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7yydj1tnEV2f65Z5FfShnsABOUAALGH6EGqxdEbm+k=;
        b=g1pqoPItfiowLTRYXoVWFU77k1dTp+yPBlZtveF+BX5HBP7Yipll7BWO8ELueq/mX2
         GTHy99Dy7x/g2yZpQDEdbDKb/pP5k7lNKs2qDWvnjouHA5RQzMAsBZeUouHCtA06WNVx
         8Gd1lNf3gTj9YLYTqVT3gJRVzBoqFEaF5hNfFCG/SObms4EWC2J0Cr6K/dglTpLO4IdT
         nabcKZzeul1mqJ2xTtS5p2IfEklbEUYgwzTWJ8HN09RU0hIeRAZevmN4b15XrU58V8CY
         ov+fk7UJE6kfkTx8Jsx9MpHmUmUaFHzF2xGT0RyY53dpU4IYyoQaP6rxdjWd/+YA0IA8
         rCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541276; x=1742146076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7yydj1tnEV2f65Z5FfShnsABOUAALGH6EGqxdEbm+k=;
        b=D9miel83QH3LlZoA59/ISENmQQOPCFqYcG0y7Z150ksCW1HSLNjfo0Hn52UCBjmUDw
         ancUSmoJNDFxEw28e3DEAuH1RXXhZN+10w3s7+XLr3CkUi3CEWSE6NqtXy6Sv6zcMo7y
         pMOVguQlq49AjtOj6ftzUuGXU0wgOPyAysaGFBZqil6z4mp5xd/+NzNiy1e8/uOQw4t1
         5Vltj+p2vcs6ZIkSK6/JlErpD7c0pPpWA+C84iB3FTvErN18aonDcYfcGe5TlY2ANr+j
         FC2BswZVqJFgl4apGTVf6/sVccnG89VS/RHQHqmflcvXZMwCan2W4VBlV93bIoTBzxfm
         qHyA==
X-Forwarded-Encrypted: i=1; AJvYcCVQFeUQtEHwQMm/WDDR7MGyXB7A9A66m1EAKz49x1EH1cJlvQ/yU1JC856/I+3xsk32AxC2n3bvLLI3cNx+yeA=@lists.infradead.org, AJvYcCXZPDDvRZJAExu3MmS1e/EMrm3Dlo1btU6fY0PoQmde0ZYi2qQ0WWE89IEqP9qS929TdCTJmwX0WKcDs+VMZAzf@lists.infradead.org
X-Gm-Message-State: AOJu0YxV6Go+XB7gX/I/EcVsqpSPakq2BEslkeOyZYWog/Ij1coJQIso
	87R8nHADZcqoWUmcCwszOdMdSBq2qaQ74VRVzeLv7D/lugi35HBu
X-Gm-Gg: ASbGnct8NrG6p6TCNncWCyyRhUqbwuDCyNKrd9wDss8vnitPRJxUnkZ3yClHBssHltu
	wMfxna1ZknpzQPVm7ZIgTfpmgb7mmYR8p3TOh05GCwS/dp9ciBuVrU8f9iEW/m/cJb31A1YKbKh
	MySUmviZ8KbVky1C274Kvk1U7u1Ic6v4+H8Z1AQHfUwY9Sm5H9HJ68qHqdJofbbT4bfdxo7K+iz
	IPlKeYmpPN8oyj2gyY2zM4JU9CtJhmtCM3bqTPeKRTgXcDO7pU3mbRVwTvMfUQCbTHQPr9CAkz3
	TaPmKjqfwy5qF+pmN6KABVMvQCcFwxcIQc+O0/ttSJBO8+WJZBM+zJk0fM1H+OqzGJEnqJpzsCE
	WWNZTy5atP2Bfag==
X-Google-Smtp-Source: AGHT+IFlZZzJ/2lDi2nazTz9VB4iFV4fxHkKIVEqMUgw2V/B7Sug+EjR09i/6XKiZaHhhniA0JfvNQ==
X-Received: by 2002:a05:6000:144d:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-39132d191c9mr6172482f8f.11.1741541275951;
        Sun, 09 Mar 2025 10:27:55 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:27:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v12 05/13] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Sun,  9 Mar 2025 18:26:50 +0100
Message-ID: <20250309172717.9067-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102757_766161_536E7596 
X-CRM114-Status: GOOD (  17.23  )
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
 .../bindings/mfd/airoha,an8855.yaml           | 186 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..4853f37eb855
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,186 @@
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
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description:
+      EFUSE exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description:
+      Switch exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+
+  mdio:
+    type: object
+    $ref: /schemas/net/airoha,an8855-mdio.yaml
+    description:
+      MDIO exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+
+required:
+  - compatible
+  - reg
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
+                reset-gpios = <&pio 39 0>;
+
+                airoha,ext-surge;
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
+                internal_phy1: phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c45";
+                  reg = <1>;
+
+                  airoha,ext-surge;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c45";
+                  reg = <2>;
+
+                  airoha,ext-surge;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 45f4bb8deb0d..b7075425c94e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -725,6 +725,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
 F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
-- 
2.48.1


