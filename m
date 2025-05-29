Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41BCC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=; b=IFDfWY2dfnbS5ZuNesp4seQBsc
	ItgoF9f6huOGekPEuEFWMmo68gEYzmW9ev6FW4jSpca1OWwsOgUbEryVJZ3eISkzlcTNsiSjWSVdx
	vivM1oQ2BIK6FTXVSXqKf2djRAos2sU/E+yyR5zzk8UBKhFykr9RudvIsSNqJoeQhlpz5xlxQ/YQ4
	3aOWNlhDKv6Ai5a2fHG+glTaC/jkokhDhVYDxBAouqA0oV1Io5MdqLGwFlWpOOXWXIiC2Mxk9YQS/
	3nH1+nuwnPN4CSEvgpn15A8V4wQDJnTeohHHJiAcBmp79rUdNP6/DjsNSxkZ82BK5ko900z+3iUhq
	XTNCT3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKba6-0000000Fekg-2506;
	Thu, 29 May 2025 11:37:54 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbL2-0000000FbCY-0bmY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:22:21 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ad88d77314bso146994166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517739; x=1749122539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=ZM58fVGvLO3nQtGrqlCQGeyB8Sey/4BREnVBJa5NikdFRKFxT7ZTlymjvO1UmYIhAc
         1KWQaZ/+4VyiQU/DruWmNkzCHK9JWTd/qBwbHSv4PUIFVhL3QmyRBU1OzG/I1mpAvQdO
         BLBIRcYz3QoWIDZm6AnAX7NwSIV8lcGkfXfw3YUtil52ppizXNBmjO/4+SQtmL/Vcos7
         NpTgdtDWprIbbDfuQdJYffJTztUkdTnEwOXR+VkIZhOqLd661k5z6wltJrYU4zGndmqf
         aTHmU1qKEkyQi8WJm0Z/eC+OLmg8vZ3vyALMOqg37PGYDDePWdydbvhlrRej1MXDU3AM
         o++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517739; x=1749122539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=Oq+dU9L8Bvq0uH8gGZzILu3p6d4hByAoxCkwoTcedFPrQMB6ooUOnYNpglygXJTfp1
         W89Am/cwsQJisUdoMaSn5aAMDWbYjoBGEqHfEPgt8tyO/2cMQmNsINmz2LeFE8cWl092
         o8+exPvY+ZTEOEJwFSWGlOZ/uxFb1+EL4YWE3KjWUVBhfDAK9K+p+wz4N8zg7j3rK4sF
         u4NLtgLbN+3jcEjKTd4fKMV0aA6ErPB1p842ER5wkxSiYJ03iczr4ZkahBZuCXgKilc3
         Oi3wmlqneDOtuqPaaVRqSiwiqxvM+eYKI8z2Lkr2/vEysCxuPLcVm77Ro9uYMBmtReBx
         /vkw==
X-Forwarded-Encrypted: i=1; AJvYcCWBaGsZfvQQW5dcgUqWZBpkr+JiLg4+eOLIY5oOJ7OVEMxN69TMeg6ulz8r8mRRsLo8bByqSNt3eZrvtEmSKrkR@lists.infradead.org
X-Gm-Message-State: AOJu0YzpLEalV6DQbJolVXu9q4FqwUI7EGYto/2z9Xg01EZxv4ya1pRH
	v4ajMJbGWrNdu2oFC1XGuJl93hqtg6hFOGhfwwvGYNHJu3ZKyt7/6j149qIhxmkXOzQ=
X-Gm-Gg: ASbGncs3vSze6e2Qf4IRs5QlP1sX4TVMNmiXAaPUibxss0ZFKQ93JVXtgkRdlp5KRpF
	e9RiYZU5yjEhB85ZNUNqPxGaZJ9RK6mAoEcpYNqVaI0H6C6U2XNFapPdYof2Rs0d5UcdX06ujFT
	qcbOeyjBvUPt3pbcJUEzYT+BMxEn9g5VdgaTYqij8NjvuaUChUDGaNxwHwolQMcWkw0+DHfOA3J
	1w6HfUGNuNwITaGE93v3IE9xYhUQn2UOAOdU8GwGWDb63DsqKkrR3BYxE4UunZIN6ROP7ze1lSQ
	Ysaa3h+m7snS3n50M6lobhxwK9rcrrX5FCjl5E3rIp5fr/zNE6gsS76iKAQY5l6icGxeC8RBml5
	xrW9Y0PWVydHR2XeJcqCx5g==
X-Google-Smtp-Source: AGHT+IHU+6oQQTZ9UxWnG2j82M6XQTTflObv2BAkZ6txTGshS0NAeFEuAAS0pUeMB5MtDHKwkQcnlQ==
X-Received: by 2002:a17:907:1c19:b0:ad8:a935:b8f7 with SMTP id a640c23a62f3a-adacda5d3ecmr160376166b.12.1748517738653;
        Thu, 29 May 2025 04:22:18 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84e72csm124424366b.76.2025.05.29.04.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:18 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 03/13] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Thu, 29 May 2025 13:23:38 +0200
Message-ID: <7564a3bb528f3ca965e6e88b435aa8815fe0c2ea.1748514765.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042220_191254_C26C0470 
X-CRM114-Status: GOOD (  15.17  )
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
Message-ID: <20250529112338.x4GAzGxRGbIPIdKIV5ZZTDJKtr5Rv1lZNMlEig_ReuA@z>

The RP1 is a MFD that exposes its peripherals through PCI BARs. This
schema is intended as minimal support for the clock generator and
gpio controller peripherals which are accessible through BAR1.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..2f9a7a554ed8
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 MFD PCI device
+
+maintainers:
+  - A. della Porta <andrea.porta@suse.com>
+
+description:
+  The RaspberryPi RP1 is a PCI multi function device containing
+  peripherals ranging from Ethernet to USB controller, I2C, SPI
+  and others.
+  The peripherals are accessed by addressing the PCI BAR1 region.
+
+allOf:
+  - $ref: /schemas/pci/pci-ep-bus.yaml
+
+properties:
+  compatible:
+    additionalItems: true
+    maxItems: 3
+    items:
+      - const: pci1de4,1
+
+  '#interrupt-cells':
+    const: 2
+    description: |
+      Specifies respectively the interrupt number and flags as defined
+      in include/dt-bindings/interrupt-controller/irq.h.
+      Since all interrupts are active high, only IRQ_TYPE_LEVEL_HIGH
+      and IRQ_TYPE_EDGE_RISING can be specified as type flags.
+      The supported values for the interrupt number are:
+        - IO BANK0: 0
+        - IO BANK1: 1
+        - IO BANK2: 2
+        - AUDIO IN: 3
+        - AUDIO OUT: 4
+        - PWM0: 5
+        - ETH: 6
+        - I2C0: 7
+        - I2C1: 8
+        - I2C2: 9
+        - I2C3: 10
+        - I2C4: 11
+        - I2C5: 12
+        - I2C6: 13
+        - I2S0: 14
+        - I2S1: 15
+        - I2S2: 16
+        - SDIO0: 17
+        - SDIO1: 18
+        - SPI0: 19
+        - SPI1: 20
+        - SPI2: 21
+        - SPI3: 22
+        - SPI4: 23
+        - SPI5: 24
+        - UART0: 25
+        - TIMER0: 26
+        - TIMER1: 27
+        - TIMER2: 28
+        - TIMER3: 29
+        - USB HOST0: 30
+        - USB HOST0-0: 31
+        - USB HOST0-1: 32
+        - USB HOST0-2: 33
+        - USB HOST0-3: 34
+        - USB HOST1: 35
+        - USB HOST1-0: 36
+        - USB HOST1-1: 37
+        - USB HOST1-2: 38
+        - USB HOST1-3: 39
+        - DMA: 40
+        - PWM1: 41
+        - UART1: 42
+        - UART2: 43
+        - UART3: 44
+        - UART4: 45
+        - UART5: 46
+        - MIPI0: 47
+        - MIPI1: 48
+        - VIDEO OUT: 49
+        - PIO0: 50
+        - PIO1: 51
+        - ADC FIFO: 52
+        - PCIE OUT: 53
+        - SPI6: 54
+        - SPI7: 55
+        - SPI8: 56
+        - PROC MISC: 57
+        - SYSCFG: 58
+        - CLOCKS DEFAULT: 59
+        - VBUSCTRL: 60
+
+  interrupt-controller: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+  - pci-ep-bus@1
+
+examples:
+  - |
+    pci {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        rp1@0,0 {
+            compatible = "pci1de4,1";
+            ranges = <0x01 0x00 0x00000000  0x82010000 0x00 0x00  0x00 0x400000>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            pci_ep_bus: pci-ep-bus@1 {
+                compatible = "simple-bus";
+                ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+                dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+
+                rp1_clocks: clocks@40018000 {
+                    compatible = "raspberrypi,rp1-clocks";
+                    reg = <0x00 0x40018000 0x0 0x10038>;
+                    #clock-cells = <1>;
+                    clocks = <&clk_rp1_xosc>;
+                };
+            };
+        };
+    };
-- 
2.35.3


