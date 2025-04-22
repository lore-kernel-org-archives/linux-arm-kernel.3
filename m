Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2522C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=; b=flMnpGzCyqBdnAQJfQivwM89Pf
	8ZZBTJqp0uzNthfiIqruSvQBaeHH8wfeTpMf5wQ4HTbveOWdIWvonBmqojrhGmDnX8pwVdQr5nD4d
	fGqcQPwJZTNAz7vWM5BqmuR1pB7nwDh8j7ZRms5Tm7WUCleFXqjUmDS+pr8c8B7Pv/H3BIvGhmZ3z
	rOtEBBFUEC3a9WKe78TKM1AHsEA9AMDX810RSO/ludMdlwnRTxEzfgva3UMQ3IHYRa9IDdqBayndq
	xyPHii2Z7glbPVcw0pSs6x1RhIIIA79lW2wFhLTQqTS/PJhZjiGIq0C6Lzkd9fKJM6ghBYJEe3xMC
	/DEV7+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KbG-00000008VOV-2V8M;
	Tue, 22 Apr 2025 20:52:14 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ij1-00000008EGy-30Eo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 18:52:09 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so48681965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347926; x=1745952726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=aqFqWYS312lwAbwBqZYKNmCLU5pCx+tYjbgOx9Z+3zZrqKyxY+jdZfyAWcoMZ3bEOP
         Ac3k/JCUbBZpjJ6IKhcMf0MA4PXId3BUQoBAZJBlUeOc+P47aY4I/eX4T4RNF0IUGFw0
         lmqrQXUo+r2Nx8XDCdP7srM7M6jByJAS9GoCu50Xm1+6/x84CyJ0uloN73cCFtDNc8Ld
         RgnOaMsGk2ZHWf0k8WdWB7beDLpV/bd7HFttv/Gdjgq1YPS0mhaFADbFRbXyUbTrsPGN
         WrsdUhVA3WB+MpxiYmnEPLX5k3TZNwIXT6LrutzbeBWzK+fhdRO8UO8VKnIMe/ZpLQaJ
         q9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347926; x=1745952726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=Gd2lTnRtw/eenDVP8xZNig78SgxYJG6vulcT5obgNIM2v6/ubgcqzBpH46iZQAzuu/
         QgRlj4/Hdo8UVEDwVWC0iiM1Pj7vKuNt6eYR6GKPzEM4pl33QW2dF5N2db2TnMLuXPZl
         SK8fb/vlyhihXcgO4Kz4oYKHVaODggZ5N8RcRNnWqY44WsNgmn14MkPlJVTA2VbgCs5t
         1ZaF1I13WxKRI2zzJXb0Hvfw8XgXPRdzAfy5K+AbKgQkB1WmqSWCqQdlUfhlWaJ66H1n
         PDqfBYnzlEGyl225eRYm6wv06e6M5pQKjpyfgxGtwoLqT8V6YEcQJ4HqB/vUqxqy20Gc
         Jwsw==
X-Forwarded-Encrypted: i=1; AJvYcCVx5xInhvzo8NNVs5PKZaZSlGcsySzpJ4eHy1O0sz6O9TP+HIJtCQjRBOZb2ma7H1dixz8mJAiCGRO8huyB9BUV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3F+zXyxFX5KLVvDWnR+6xwT5czsFiEiGmWKjgdo4n9r4UpfVw
	1QLr/FeJ0e3ls02OoO01OOQgyO2fw1hSMHMX5DXIJfjDKMxtnRKJZT267Ybi3uk=
X-Gm-Gg: ASbGncskxqFtPx+wlZzpoEirKuvVgSO4nyuiyuBDZr8tFJFoH4dRO5kg42TepBzpWOt
	iVR4zQh/z4tUrqBqZ1BsW/dODoIfCPW893Sc0Zgltt2leQ/Yhb6MwPGoOOlRd3pBa3hYNxWUgR7
	C6PEVf5sB3b8KXPr/EawJVNlq7cR9Beaeh630+Psc80c0/Un3/OCdL7ZA0Fjlc+fd+U6L0meC3n
	fnHvJ5ZOfDJNdwVLw+JzwK8iyWLCdlsA3DKnhemffO/LxRTE/W0sWhOVxzHatdR5sTTDxw+X6e+
	pywwMWAE+pAp/DMntttl4mW9qTYpE0f38+6zOPwK9cmHM3O3GgED5XlrzsJIRq6tk4M2R/U=
X-Google-Smtp-Source: AGHT+IGL56KtHAwUUJmP1HuSJs07aPFJbC79YLpPa3i5f42XfBP+p5MKhnZ81z6DUwxPJLz1jUiLzg==
X-Received: by 2002:a05:600c:3c85:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-4406ab976cdmr134537415e9.9.1745347925672;
        Tue, 22 Apr 2025 11:52:05 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a49b5sm16062972f8f.86.2025.04.22.11.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:05 -0700 (PDT)
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
Subject: [PATCH v9 -next 03/12] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Tue, 22 Apr 2025 20:53:12 +0200
Message-ID: <adf30a5be7c103970ef2caf5b184d71281cedeb0.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115207_755960_E9859CA9 
X-CRM114-Status: GOOD (  15.24  )
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


