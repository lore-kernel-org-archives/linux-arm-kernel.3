Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024D6D7830D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loQrYUxNweXqAyZ1T5b/kRAgnD6/0M++W+eoOapwQak=; b=oBUv0LT2/lVvRAkcqy863j9zqx
	FLth5t4hV/+lrkemFGlrMB1OJ77G58vgOSEAHCmYk4mMMgRvjIbYvE+JC47eK6/aNy+6C5sloa4vT
	gXKn7mzzC5hmPI1LG86XMCygxjWwitm8pbAnUkC8+IV4z8QAxUe9Ssj0AybUrmNOPurgxXzFV26zy
	2LApvNk+JN6M/GJDVJbkqz6Jo5b2MHFojLfBXkBxvVVYV9ZsMM3CgcE63gOnDcwkysSf8qFDgSHLk
	/KUe2TPL6EnFRfUQFzKlonfVkpQRPZQR2KqOPcaWcYQyWM3IGerGYKJZmCDz+fccpfF620l8hsclj
	tWYOUZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4XF-00000005sbx-2eJs;
	Mon, 02 Dec 2024 11:24:13 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4SL-00000005rIT-0NQF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:19:10 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-aa549d9dffdso675451866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 03:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138348; x=1733743148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loQrYUxNweXqAyZ1T5b/kRAgnD6/0M++W+eoOapwQak=;
        b=T16BEXzp5Im1Vh3valvyQ92gLEAROM96HYRfi6ubPVQqYOIFEzB2uNg9VubgMO0qZS
         gZEOROqUgFCfVkBvizBLH8owNYAnJlZzB5mbIL9yRhiDSHiF9HH9AhzVpliKZCud1F9W
         IX3Gv1jnPEQTA6KlZ/n+D+x4ng17qX8fm0x9bJ0ERiN+kY+vbp4VpXUV61xenBTlIBqe
         9Jdz5ImBALcMDw8jpdlnkFv809XMlpjUGjASTMK8VW6ADlefrffxDpesfIvAAaneMWkE
         6Mj0PpOUlmeU3oG73SY2TwBLeH/JdQV6sHcaTPZiL1uq1cOCk0kWTDjTMycMpvp86t48
         sTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138348; x=1733743148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loQrYUxNweXqAyZ1T5b/kRAgnD6/0M++W+eoOapwQak=;
        b=K4CSsLMa/h45eEBWZeP4nqLSh9JSUDfN2F05RrdM94Nr0A+G8NW6enEuqbWvxwiAAU
         k8p0dc/D9XYkyL3x3A3Exkrn7tqq48pgHRQDpVJj9LX7xxOSqmWCMLSI77rIZPxF/BBl
         nh3V6+KNspXbgwuqXyo1gyUL+uxPGIr73FJ3hsXgTUAHhxngaZyH284Swy+Tw/fU8HXp
         cR1HJxYboeTWfoUQNyy0CCZsRICwd4t/+7MtrJwkMd0Up9KaHZa3gNshV42i0+/WVjIC
         l8lH1b2YT+jMDdAk3I9aaowwMnZJlKMocGTVon+l2/VyMmIV61PHnzNmrFdVkzfba4Ok
         cayQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAMgd4shzTC0KrTsO0hTIhBQwFObUBj1TrPDvg6DHwuhQdvnSKSAu/vYAh5sfzeBb9lPWlmJR5fMPrQ3KIrjCB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk4+ZiItqkPeeHyBuK+yg57u0I7hkPgutOA2rssbBSiS9s3cZh
	IpjJXV5P8G8if6OylG6Yiq/b/4yvg1kn2sdh/eZoF4auDxEBwR47lRVL7j5fsxs=
X-Gm-Gg: ASbGncskUgg7IgSW9+5d8WcGTGBZ+o0yGgK4B5xK1PoRre51R0k2L8xE5H13qAFMduC
	VX9zMZz4cm0K4VWt/Xp5k0Kn2G0w492AHc67+DtZWjqIbgVBvx6+7qsNYeA4zYd0mq4D3VIzAyf
	oSPn9FsnnK2jdzTxEau7DEwhcblbv4p4NT2erhNTMZV6tuosgx4RxO0WBC3akT61JhELqGsIuEa
	FFynZBAplly4ctDwL+knsjINqJPJjCu5l3vGMplIXGFVhjMo2G4O9+UAn5GJAmEksQwYatoaRH4
	jgM2tiOfY+gbvTkmTiiU
X-Google-Smtp-Source: AGHT+IHaMO/Y8CrT5Mz8+G51hTZ3C+GNozU6Gp6b679Vc5uJseM64hrcEXJ4+2CIlMnmRdcAGAynUQ==
X-Received: by 2002:a17:906:2192:b0:aa5:2855:7817 with SMTP id a640c23a62f3a-aa580f72e6fmr1623926366b.35.1733138347771;
        Mon, 02 Dec 2024 03:19:07 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996ddbfbsm498998666b.51.2024.12.02.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:07 -0800 (PST)
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
Subject: [PATCH v5 04/10] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Mon,  2 Dec 2024 12:19:28 +0100
Message-ID: <99c23bd584d7b1b998d2cafb7807e0650db73f20.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_031909_191927_88CB3724 
X-CRM114-Status: GOOD (  16.64  )
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
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 73 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..5171a949eda5
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,73 @@
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
+    description:
+      Specifies respectively the interrupt number and flags as defined
+      in include/dt-bindings/interrupt-controller/irq.h.
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
index ceed86755da4..4bc77e3fa80d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19578,6 +19578,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
-- 
2.35.3


