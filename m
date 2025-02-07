Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0203AC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2u7m+BY3w3VxL/tHCl4aR/2M5poaBGOi+Wu+QErgS8U=; b=su1xxMaE0ETnzCzfDT4eiRwIQJ
	cP4wx8s06asnrCnwEeicphJCq76cQqUZZYhNHgPWAyKzRC9nLAuq8JymWxIRTq5EDeXBqUGoYK4mh
	OFgcq/qcPaX4LWnHTfYPNueiVeh0WNdYaAqJMa7GfTk8giDJIU6gapuq4Ud6omYgyPnno926yI796
	pwcu/eLfvZHfDPPOtbI+De9RzReI8tyRAhnmr7bz+mRxyxXdkp7TgowuhEzQdImktH2TAGJuSlVwg
	zpZHVPCj02uDr2LZRuHrwjv/eKET4q3WhxMTkZdL+CsB2iGIVkIkJdhm7EKmdXNjv2Kldi9qKMDQq
	cdk5lN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgW3h-0000000BGe5-0Uxq;
	Fri, 07 Feb 2025 21:38:45 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwE-0000000BDNF-3kSX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:31:04 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-ab7863f9be4so214516266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963861; x=1739568661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2u7m+BY3w3VxL/tHCl4aR/2M5poaBGOi+Wu+QErgS8U=;
        b=FvI5wSXKUxtOwY/6bViHrQ9xJj+KRNPh+fOxkGu/JrmQvoqZ7o9VcSRkcJJLnjZmC8
         U338HtIRtTcNHvQxO5q+piqSPAgmjQWwce8R9Uyz1UaHQSpP3VYnVVuIMtGGdHKkzyPT
         wXgG20l6xec5K7U7cNbq1snaqCt+UixjOh9bSojyHX6lGoSqNIpeRH/q1TkfFej29Pjz
         SuA8uBaJqzk/JXzfqiCWGkNuDOedxRuV/pvTokcE1g5SqaYaz4xtoF7ziyD9GB0brwqj
         GcAtvSlcuDWVnm4jKKsw2BakkGORFKbgvKuU/BJcHl3gLCAeestdLAsbsZew3+qL38AQ
         8TkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963861; x=1739568661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2u7m+BY3w3VxL/tHCl4aR/2M5poaBGOi+Wu+QErgS8U=;
        b=iEQdtk8qb4Wc3mQ8eOKVELL+VitSrzfbWUR9n4ulzvhKxfuCnKNDDYI9jxt2WbfI0I
         BCjdj82a03Fm06LczEOKQpFJOG2fZY4lC1z1y8hV+UgCvuyFvPp7yBmfHQ2r9pJwkgR9
         WueJNUjZ+U7Aj9lCplF9mM9SEupPZBoPwGFiEdgl7UxTpl8xhvRFLEk4XrTfE040JMZu
         J8VaFBUjh8H64LhUm2DfszVFQb6Kg3f7DlY4vntTRU2Pgy4O5EN5ze8kIxOC50ku7Tdx
         EiW++9kMyUH0oDix2US4rjCybET43JpqEehw8Sl41QtPg0qdxRhYVwPuvHeWD2ZKV7hR
         xOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSJurd6vtCNn1hVd0AaBXhmUA3FcVAeP3wdx+t7NProT1F9tWdb+GsJ/ZFxoxsb27FCP5yWuz5iFYZCaVfyBxw@lists.infradead.org
X-Gm-Message-State: AOJu0YxDW47zOsw25g46+Oa5QV9OQdVBf35ADGnhiiXCMAgi3AIo5WSh
	pk/CSYhFuCE4yFLqgMwaOIxU+clNNSSf5CdM5z0FL7eZahN0WJrFV9m5mdjLKJc=
X-Gm-Gg: ASbGnctN4BS2/eh1ly20QApprEDm7lweWn9bwq0HCX1WMRYO4e1g/sGdAS6wKwa/Pis
	brjLXLA9gsgOPFXiJODiKm1FaVaob6Uxj8v4XdvkPHuHgMPRi/dGEChlB3AB2rAeJtL2SyUi8ZW
	Fxs9J5T7KjjNPuItP9NPfLzNzPa202m1XwreNWGqRiJjfAk3I2qeQETiZVe0YsOriEpQnDFmKzM
	0Ueh+9gNrX/cha9TT+gv008ymySE3sE02mfCR2aPsy3cVk1XTdxsvoX7Gj1fTFrUvHhaKESeojp
	Y8mT1367f/8l9thWzXdhSPoutWLV0rDIyL26tYjrXOHPggFF5JRJ6mKzUKQ=
X-Google-Smtp-Source: AGHT+IHhfyOT7I1VHRDWFLLVHs+ggPsVtKzwB58FcZ47OO8AR3wpnDv08wxSk1IkJTpLUDdPe9Uu7A==
X-Received: by 2002:a17:907:c285:b0:ab6:32d2:16d4 with SMTP id a640c23a62f3a-ab789c35448mr490178766b.56.1738963861415;
        Fri, 07 Feb 2025 13:31:01 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365c841sm328702766b.185.2025.02.07.13.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:01 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 04/11] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Fri,  7 Feb 2025 22:31:44 +0100
Message-ID: <06e0bbf443efbf1b1317defebc5446ef06f8ba92.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133102_986647_6234AADD 
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

The RP1 is a MFD that exposes its peripherals through PCI BARs. This
schema is intended as minimal support for the clock generator and
gpio controller peripherals which are accessible through BAR1.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 135 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..034c7077b27d
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 MFD PCI device
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
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
diff --git a/MAINTAINERS b/MAINTAINERS
index af2e4652bf3b..21a818def180 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
-- 
2.35.3


