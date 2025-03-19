Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AF1C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=; b=pZGbb33TiKwhMrJHgv2sVGf/Q/
	phnftl+XVdAMle23jaRDM5N17wxMu0cQqkNSmnJIsNN44m9KWVYRKUtt6b1KnPm7m8kXnqgQt2naH
	f0BFcM1E3yO7ud1vKvv7cLvEo6HDAGlBkcpcxTbACn5EjYuzwZKDKg6+45k/NLMf/fUojjyECGGXm
	aPryQqCfwcYUfAIwtXWPwhnioVehowqSV1xJBDWsRptTlqzQ4LrhNqRxY37S2+zRzDclz4763qVQT
	l5hOff4VoQiJhNm5NSJnokJvyOjSovpl/nDLerI6f52/4n19oci4OVXChdVIsRds89QskWcPPrS/t
	/UYkiYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1Vd-0000000AExw-09RJ;
	Wed, 19 Mar 2025 22:03:33 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1Jy-0000000ACPs-2gQg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:51:32 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso235049a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421089; x=1743025889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=XGEGOX135hE47NkJ5sD1Nm3SP6NXQMsAJOp8dxfzZWI7q+N7C8EgS3sXVAMrmscnVY
         MHnNH4NHVqcJWGGucfVWdD3CgHCQSQTNK7l0nSa3I/avwL7X2XjF4C1Or+OkH6riFXoa
         jvy8a+GmkbsXIBQRwFHPKInQItP7GA051mCCnzbTxKQ+4wDGvOtcr6ey3tVFV3REq3/s
         uzXo1nNeAMjau5DJd2cSo1qlLDAvEFq3FI3atRrzdQQ2YQpSjq4kdIRzGWAQmEiVA9Pc
         wx93lbaccIn451rwfOV07Y9IpD6+MBdbMnJVWIB6Ytm/pBr1rYXLbZGsBXQE8PXkOyMK
         SuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421089; x=1743025889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=Bw6F4prZ4n2bpJZkhNctVMKAdSLoavAIU6VUBeVwk64+W2HNiut4/ymMUymbNM+XVN
         RTdQgVK6Cl2nutYWsnmpuXjFaGcHL1YJABLI1wi44Ijvd+01Cj9DmgtDf+ovwoLtQmsp
         cF6tX0j79hcXyXFGtNUF0wu5Yu649l9zZZ/gZakY4m0BTB9ESpRN9vbMkpHnyOHnrMAM
         9I3Oy0/YLQNPsF5i2ulBVMiXwNYX/CJoMggejxFmA8fRtRt1thKcr4pS10MVTOtdv9Ng
         /ptL8C4ePC2bvmNqhPxEyz4K10j0jxvy/mhax3XGfXYfc9YxVleq0rcZGeKYf82cMZKU
         oTRA==
X-Forwarded-Encrypted: i=1; AJvYcCX7WilR30W0rsMJKJxUhNM7EYfSnYi0YnCi/xzvJ/rRLb6M+4KAY35xKDRe4M4BGUN28Wr1h2J82kMm6PPI40PW@lists.infradead.org
X-Gm-Message-State: AOJu0YwWJDDJCuyMM54L2dC6yR6MftJTJAN22XN9dmSQV6tPPvv0p226
	XcbdbKfDGjgwmhpISDbhbn/gOUJ4h5ORRlXVaFs8hu8n3wYt9iyOoBgPN6zYBVk=
X-Gm-Gg: ASbGncsHUInyzlVK/khk+woivOspSRg+PmYXZibvdnUMo51j6CnfjeOQyQfbohcy3Zh
	q9+I44bulsmzJVYklcyho7eF5QM5G0sxaMcrvgLnTrpQju3i65cT+l7dcRN2RSeWPNH7pla8JHy
	Ix+AnueMa3OcFfbrPsgEiKcZv3RIpumU6gv5GESVtR7u1vZ7UkMF087WnfpGKY+5g9Lh15sRU6F
	vcx+tplNuxY+jS+eyGKaB5BAYCXHSb1E9/Ili0Fo4E1+6XmeOVlyWbU0M6DYveyS+Py9s2st0Kc
	juHhPALtW7sioGQ0ycXsfhlyFdhYeayMV58/Ks7hm/FqirIv8LnN5vMsKEqdLDv+qc1BEHo+gg1
	8sesaH8Wvxg==
X-Google-Smtp-Source: AGHT+IE/lWyTKOcI7KzrkoM/2SJgdwEz/B/+pf6EC4EezgGKDC83VB+i8A4JON4ZDoLTQ4SKumy14Q==
X-Received: by 2002:a05:6402:27c6:b0:5e8:bf2a:7e8c with SMTP id 4fb4d7f45d1cf-5eb80d1940bmr4871093a12.11.1742421089231;
        Wed, 19 Mar 2025 14:51:29 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816973fb5sm9602631a12.27.2025.03.19.14.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:28 -0700 (PDT)
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
	kernel-list@raspberrypi.com
Subject: [PATCH v8 04/13] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Wed, 19 Mar 2025 22:52:25 +0100
Message-ID: <e220e2ee4f64d99b44b739f1d10a5a4cb28132e8.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_145130_693125_EA828045 
X-CRM114-Status: GOOD (  15.26  )
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


