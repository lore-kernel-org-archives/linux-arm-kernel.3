Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2343D11183
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 17:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzL62SVyIjejPV0WK5Icvrl5yXIEFUYP1mc1b47FbtQ=; b=jtKy1kOlcfN+WyNxfMxHg3VgPE
	ZmOlzgZuyAAC/uoiWnjWFHDym9kwfhwkwzooE0JTpLoESADeippMYqHlGjs0S2T2sL8cEd+yvSSxs
	91YYQt6fWd87G8aZnZkZGFn2p6qZIEkAiYj8Qeo2iDA9hCpDHbWg5jDsaYviRXo1BAHOB/UTcyd6d
	woRk2SJvCq9uUzo2C3z/7Ak9IXWEne8RGwqEflHBo9nGoWZuKlD7nxGjLXscVSoTSDuUEoko4rRfH
	2lDrzHHU7XPcioBSm4uJvyK48C9Xn8mXzLU2AsATUUqId4VNFJgsjikpraRi29DMcuFja259oA3Or
	/OWkiZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dyr-0000000BjqP-0QDh;
	Sun, 03 Nov 2024 17:01:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dvV-0000000BjMd-3IrY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 16:58:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c6f492d2dso36566985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 08:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1730653088; x=1731257888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzL62SVyIjejPV0WK5Icvrl5yXIEFUYP1mc1b47FbtQ=;
        b=D7mcPC3CXL2VTiLwGw5tytIceudUcCSee5/QRX5Pz4bQs2yFBlU9Fr4z316Chom9zJ
         dUYvEV7YRiUFXIrwAUElH7Kck2PttkfNRaGJuD/UBYB8YJ5Ayk3/LL0UrlHShRdJLRyj
         JWekrYLo+KvKWqYDhQO8y0AOh2h0ddqvgFE4sgz8m5gLG4OQqV8AgQZu9FR8ohKg9YvC
         d54sTeJ2xUJLD9O+eoZ0DqHCS5/kA9NOAS1IZvB2zrAyMSv2FIgLQLeI6or0DIi7oPYn
         Rp6Qdp6ZrtrQ88zHC6S1aRJhNJM9bUaW3VAN/bM4mmPxHW1G7zEgZjIYmEr/y0B8rMXp
         BdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730653088; x=1731257888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzL62SVyIjejPV0WK5Icvrl5yXIEFUYP1mc1b47FbtQ=;
        b=m9XrpcSx/Z14Lv9SZFAs48TiAQQBJtTTtkPJZKTYAeY1x4xLkWEs0geFaW7goIfSdt
         ZSW3rtzTJ6LUhbZBJCOVI5LzDOpiB0ZW8o44/z9cdG+mYnOu94LtqMkt4sEtNLvcMSJE
         VsK2MC1cTViUlP3L037yg2nPjCTUTir/QUWkQM5Orvn7mWAik6HjgcFQhFQT9qhGwkLS
         UUTe/zYkiRCSGtmeJr0dxzxANwDUy+nNoYOaTBIquQj7WHi5ixmTEQii/Hik7vhkMKHR
         ek68hNSMi+/pDomAF1x9H7FYB3oDUbnjLsgHbdrrBLiy4eQz0IToah2X+0d5nhKmMOXj
         KzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/08LdoB1wbexbui7CZiHexDNAJj4gOXaD/KE3WpMgBGLHD7i4qcaVPGzIUQeWGTOnTiFoylFb8jq9/yAxnS3b@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbdx0eoCVhBhuYOPTtEwDIAfeiM+P2H8CP+BTTw8AP4ZLnw6/6
	SOvmJUTgQ+9smh2P/GNVmaKZhxxvNdEPCNqXQY3TlDiRzvhSDuVEo/J+z2oex2o=
X-Google-Smtp-Source: AGHT+IFa5XNytNlWFhmE0DXZf4pmgbvq4x1WDC/qd9g/nrM981EhgPHOC8zQXwTK7AWCgpf8maFo3w==
X-Received: by 2002:a17:902:d490:b0:20c:e222:619c with SMTP id d9443c01a7336-2111af5a32dmr117485425ad.42.1730653088162;
        Sun, 03 Nov 2024 08:58:08 -0800 (PST)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c9783sm47531355ad.236.2024.11.03.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 08:58:07 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 03 Nov 2024 08:57:59 -0800
Subject: [PATCH net-next v7 1/2] dt-bindings: net: Add T-HEAD dwmac support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241103-th1520-gmac-v7-1-ef094a30169c@tenstorrent.com>
References: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
In-Reply-To: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_085810_299725_28DD7BF3 
X-CRM114-Status: GOOD (  16.40  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Add documentation to describe the DesginWare-based GMAC controllers in
the T-HEAD TH1520 SoC.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: rename compatible, add apb registers as second reg of gmac node,
       add clocks and interrupts poroperties]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 110 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..474ade185033 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -99,6 +99,7 @@ properties:
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - thead,th1520-gmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
new file mode 100644
index 000000000000..6d9de3303762
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 GMAC Ethernet controller
+
+maintainers:
+  - Drew Fustini <dfustini@tenstorrent.com>
+
+description: |
+  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
+  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
+
+  Features include
+    - Compliant with IEEE802.3 Specification
+    - IEEE 1588-2008 standard for precision networked clock synchronization
+    - Supports 10/100/1000Mbps data transfer rate
+    - Supports RGMII/MII interface
+    - Preamble and start of frame data (SFD) insertion in Transmit path
+    - Preamble and SFD deletion in the Receive path
+    - Automatic CRC and pad generation options for receive frames
+    - MDIO master interface for PHY device configuration and management
+
+  The GMAC Registers consists of two parts
+    - APB registers are used to configure clock frequency/clock enable/clock
+      direction/PHY interface type.
+    - AHB registers are use to configure GMAC core (DesignWare Core part).
+      GMAC core register consists of DMA registers and GMAC registers.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - thead,th1520-gmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - thead,th1520-gmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    items:
+      - description: DesignWare GMAC IP core registers
+      - description: GMAC APB registers
+
+  reg-names:
+    items:
+      - const: dwmac
+      - const: apb
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: Peripheral registers interface clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+
+  interrupt-names:
+    items:
+      - const: macirq
+
+required:
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@e7070000 {
+        compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
+        reg = <0xe7070000 0x2000>, <0xec003000 0x1000>;
+        reg-names = "dwmac", "apb";
+        clocks = <&clk 1>, <&clk 2>;
+        clock-names = "stmmaceth", "pclk";
+        interrupts = <66>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,pbl = <32>;
+        phy-handle = <&phy0>;
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "snps,dwmac-mdio";
+
+            phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f39ab140710f..72dee6d07ced 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19827,6 +19827,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h

-- 
2.34.1


