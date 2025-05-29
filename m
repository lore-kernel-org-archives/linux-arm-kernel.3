Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCD2C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=; b=r7HepnmsArjLAR0qhoypR5+bc5
	JFZPhD9dWvqNjND3gjrPpRtC8+7r34oYyeFWSsjkUzUTPM0cTTcLHhBVfezT7Wm04cUUeaGx/Qyml
	Cwx+q79LjOFhL9iSjXesLivKgmOWk8/V9lZBAnP3mcrfisIbC7qzlMkxtI10oXEzGXE6RyApWgMu3
	DJPvZP6w5wEim/fHDm/OOVGbVbl92oZfJ5Gpman4iWR/4OWE6m1Bx4YU4Qr4BFKkj3lqJ7dpL0r4V
	Uw4LbqBXXAxz07szg6lTJnGO6tdYMNGuMWW/ja4kbXCPH67z2+JNx/QOA6QAV5zhE9azM01QXP+zG
	pr0+5Sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKePn-0000000FzVa-2Oy1;
	Thu, 29 May 2025 14:39:27 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKddJ-0000000Fu1c-3Jrd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:49:23 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso169835366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526560; x=1749131360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=J6htTqka+ZY+N43Im84Ue5REpwTEGz4yA0i6/Ydog9xnucDQNj0iyffGy01Jo8f3tZ
         MEvTFfHiqLblwCBwNUGT8+T0wy8z1tKVHAcLPFPfKJRTuECVD36NfaO2YF0OWmvZYLxh
         LQtyUFu5UWtP5x1nkgi+sivU8LWcWCrCfwPDJj9HPczEcvMJReJjnvBB8LPxNOL/VpFd
         M7NRosWmHOm+A4b9qaHjAg4wJfFsONvya57WOXWgddbQB+YFC5810Ydh0b6VcmlWSQ6G
         lFJ7EU8UIUr7hayUX4h8JhcZwiM/VJM7r3EI7jgN/Sj515W/6UpdLWOsWrp1FrmMZG7q
         +fKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526560; x=1749131360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=gMhwz0HTNBh+AVEERnvXAjFVXTCFBu6H5Mw9L2Z5cAFt2+nbmQYLRN5fLohZAVszwF
         K5/ZJVj/krhINgUF1lMvg+YBQgR1UegiCq2iWXikqOKCXQSlu5oKjq3XDCZd+WkWxczl
         o/Jpy+6fWGwNN329vod6ZA10TkWhsoNpGCZ42+YkhrzNlwXpNBn44ZPdSHc2P3Y9xc3i
         DeET+TlENzpY0X/kMH/zEO71EX0zgdI4bXBwRhVzp1Gu+yCYBegpfOyOEC2l4TIt0EDo
         ydpJR73KpJ4A0EZv/ytSEcSjJIVjrzcu4tQP9P0T+8I+NJ4viwqdqnZ1k3a4lnp9Ybq1
         mzVw==
X-Forwarded-Encrypted: i=1; AJvYcCWUZULqxONPDYRKWUp2O4/PMdsfFacVe8JUfvkE44gQOE5C3VFf9wgpFOxn2HiZkPf5DoswkuiF1hrB/UoqbD9s@lists.infradead.org
X-Gm-Message-State: AOJu0YzAeHUGV00scnCmjsYac2oaFov8JLGWeR4jQY85LTiKHPYm2Des
	h5iIaYXjSMjzZQuBnV0JyKuxW3CQYkK4eHP+/Q8dr5W0iP2FUGZAV8LvoqGnIpz+h20=
X-Gm-Gg: ASbGnctByEOZY0dERtNiT4v2o2sEseTNHTJG6NvSXxiYWhOY5GWebhSjcbBGrx1hnO6
	W+VuVNnV7Ly1b447Gtiem0G4B0h/fsprGTEorwA4B35asppmnDA+iMSQv05U3ZaupwgWKXnxLld
	ofZlunKxOaVHoJIj839QYzVcX81r6/rUaf++ZBiY5yiS6Jw+yQsJN8GFAoPQ6s0gG7KZNMfW4Xs
	OCA1fAgfSbGKKeJ8u/x7dPBHlKKu4v/RK/Lb3LL9kOD5pFJBr5U/gnhZwpt2CYyen7FdcQ9e1fo
	TM9zYXdbmgp/IxquoW501c6jyFIXcQpJm6yAe7HkKZjSsGWr2qbxK/dZXvXP9Dqca1VJY4gS1Zj
	Xa+oxRiYEXe4XTR0XJiQcNQ==
X-Google-Smtp-Source: AGHT+IGKuD+Tth0pJp0gfXI32E+DNNRd4baj31Ji1jfSwplm5ayN10H7Ij1j9C7dYd4j0K2Z/6B/hg==
X-Received: by 2002:a17:907:94d1:b0:ad8:8eb7:1c79 with SMTP id a640c23a62f3a-ad8a1fcd810mr569011466b.39.1748526559822;
        Thu, 29 May 2025 06:49:19 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d74csm146445466b.45.2025.05.29.06.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:19 -0700 (PDT)
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
Subject: [PATCH v12 03/13] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Thu, 29 May 2025 15:50:40 +0200
Message-ID: <20250529135052.28398-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_064921_824192_4E76ED89 
X-CRM114-Status: GOOD (  14.98  )
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


