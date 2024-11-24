Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A356DE668A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04VCpEllps4mzFE1JH66lv6m6CAwc3CTZEE1ZSgE6sE=; b=sc5KObUBz79xsL1lT0ZrwNUbJw
	c2u+LC3XnzURSyulzUug/1VGMItLzPjc99zxoXLYDfq11Qs9mzUluHgqp0H3jwjtLGaZLQ/WhLb8x
	dYab47V4U/w6vgZpQ4z+Gw0P3NxwNgOIwjrJXnbTDZvvpOYZ4GsDRRBTDDUqSusu8VfGB3CpfTJ5X
	Jaa53G2NYFcUtmPNRd2NeAu2wlohTQQ3u53sKVn4964guNSf1lYxlZcAs9KIv6zu43K6CR0pqSU6X
	adZdNYjEQqFHnc5rLsjZ67tAGn3ih+Ac4MiXNhlPg6gefI+d1lJT1YJWexJKZB8WI4YtgMed1CzTU
	Fcq5pxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAGD-00000005eU7-3uxQ;
	Sun, 24 Nov 2024 10:54:37 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAD4-00000005dUf-2GcJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:51:24 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-aa549f2f9d2so41168166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445481; x=1733050281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04VCpEllps4mzFE1JH66lv6m6CAwc3CTZEE1ZSgE6sE=;
        b=J2gBKZAQNa2F6eGfhgSAH69vKUTXpeudC+zdnf/aJgv3dA+tde/KywzKhbigV/CPek
         8P66EstAjINA5xywf7TOEXu7EW86sF2UH5EjXbGRv11REdm/iVayidUgE512yRlIi1pG
         7EU7JzmA+qMz40kgbr4IKimuY15fVlu9NVwnPIZ6j9U7ey6Yxlc1z1WacIqtedox+Anj
         bGs82dfeImkS1FKPpcYIgN/Hzx+q/VdHkYsK1my0SA0OxeorMKkSaY/fkq6OaOqo947Z
         Q9DsMx99UhjTkBugC0UO3V6hLUeULYO+apARXt7aexcyTwASLbQuZ0zzG0baK9EM8zlf
         RsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445481; x=1733050281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04VCpEllps4mzFE1JH66lv6m6CAwc3CTZEE1ZSgE6sE=;
        b=PblcpuzCQCr7c9gtF9Jtz3LzwdlaoTNNVDu2mUPUTlXUVTYOPUHCh0osSRkB9uaOX4
         OjJCVGM6fe2CNjAsSIFgg2Dr5zjJou8qcK60SGSSfvKrvYCtFEHBtSYh0SDyAZWQekQu
         ctsXpVTwoI2misEIkgIncyYpkNe4lxO4lhVKXgX8XNJroUQkemYT4vW2nh2pYlS/1h0S
         jSjbkCwkyYHsShdztdVVVn1MMe06DKPSe+iheV3n1rzFGoGqLJyH5R11MgW4M3r3ZYC5
         rbiJkPLTAR9SR7RyG3HvbkbrECJ0Zc7kVGTCuUqLsRw2t7dmTMNscQVMqzEqIpj/g/7t
         b3oA==
X-Forwarded-Encrypted: i=1; AJvYcCVaFZ9L0BX3+oM/lBke21s9y5HvhnoQt1SDe9pOwgb0C8DXQ5M6FHyw7i8tbL3fNKgF8Tomq8YK14kPPSbjT0+E@lists.infradead.org
X-Gm-Message-State: AOJu0Yxze27X7UdFplOY/mnsOVsej0KR407XL5uxopo13rNvAM7SCzJT
	exVTTz5A8mgHhz9kzzespARTEgpIeEzQMjZtIW0yqz5HBG00KxacEdMW5u120hQ=
X-Gm-Gg: ASbGncssvd7P0mTd3S/sQ4CBLr8mr+rMhsbSq4WrhcwAtxZsBZlPawRRs51FJVhBiC8
	aQJs9VPfLvILBYffkRzAGUgUpFl/mgk2Qp6opmF8e4iBS2z6yE0U2XeFIBBkkpZ40HePu55qsMV
	TeEKdksZTQOFaBBI+9+6xKhdjlDaiH8/a1iGFVNDAHvLSsAV2eJ37Xddi/6IpfRv4tN3sU8Eakp
	CLNx+JnQ9YGqiViP04xlJ/vMPdejrZyzSVHhFePr6MCnxUKqoVP/GE5c5EqZ9z+xeZaaeP6Kh85
	vgM0az2Dx23YC6TpOe1R
X-Google-Smtp-Source: AGHT+IHtQ8V3zZ82EbRVUVWDntoEvriH/KeWpohUpzL1oe+KVdFUjDS2eiOcuyuyFfHY6VCDhaaxqA==
X-Received: by 2002:a17:906:32cc:b0:aa5:2e09:ff0f with SMTP id a640c23a62f3a-aa52e0a191cmr398676666b.37.1732445480976;
        Sun, 24 Nov 2024 02:51:20 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa540e64209sm106287166b.184.2024.11.24.02.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:20 -0800 (PST)
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
Subject: [PATCH v4 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
Date: Sun, 24 Nov 2024 11:51:39 +0100
Message-ID: <9b83c5ee8345e4fe26e942f343305fdddc01c59f.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_025122_614938_04BE5D1E 
X-CRM114-Status: GOOD (  18.42  )
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

Add device tree bindings for the gpio/pin/mux controller that is part of
the RP1 multi function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../pinctrl/raspberrypi,rp1-gpio.yaml         | 193 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 2 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
new file mode 100644
index 000000000000..21923d39c1bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/raspberrypi,rp1-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 GPIO/Pinconf/Pinmux Controller submodule
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description:
+  The RP1 chipset is a Multi Function Device containing, among other
+  sub-peripherals, a gpio/pinconf/mux controller whose 54 pins are grouped
+  into 3 banks.
+  It works also as an interrupt controller for those gpios.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-gpio
+
+  reg:
+    maxItems: 3
+    description: One reg specifier for each one of the 3 pin banks.
+
+  '#gpio-cells':
+    description: The first cell is the pin number and the second cell is used
+      to specify the flags (see include/dt-bindings/gpio/gpio.h).
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names:
+    maxItems: 54
+
+  interrupts:
+    maxItems: 3
+    description: One interrupt specifier for each one of the 3 pin banks.
+
+  '#interrupt-cells':
+    description:
+      Specifies the Bank number [0, 1, 2] and Flags as defined in
+      include/dt-bindings/interrupt-controller/irq.h.
+    const: 2
+
+  interrupt-controller: true
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/raspberrypi-rp1-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/raspberrypi-rp1-state"
+        additionalProperties: false
+
+$defs:
+  raspberrypi-rp1-state:
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    description:
+      Pin controller client devices use pin configuration subnodes (children
+      and grandchildren) for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-5][0-9])$"
+
+      function:
+        enum: [ alt0, alt1, alt2, alt3, alt4, gpio, alt6, alt7, alt8, none,
+                aaud, dcd0, dpi, dsi0_te_ext, dsi1_te_ext, dsr0, dtr0, gpclk0,
+                gpclk1, gpclk2, gpclk3, gpclk4, gpclk5, i2c0, i2c1, i2c2, i2c3,
+                i2c4, i2c5, i2c6, i2s0, i2s1, i2s2, ir, mic, pcie_clkreq_n,
+                pio, proc_rio, pwm0, pwm1, ri0, sd0, sd1, spi0, spi1, spi2,
+                spi3, spi4, spi5, spi6, spi7, spi8, uart0, uart1, uart2, uart3,
+                uart4, uart5, vbus0, vbus1, vbus2, vbus3 ]
+
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      slew-rate:
+        description: 0 is slow slew rate, 1 is fast slew rate
+        enum: [ 0, 1 ]
+      drive-strength:
+        enum: [ 2, 4, 8, 12 ]
+
+    additionalProperties: false
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - reg
+  - compatible
+  - '#gpio-cells'
+  - gpio-controller
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rp1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rp1_gpio: pinctrl@c0400d0000 {
+            reg = <0xc0 0x400d0000  0x0 0xc000>,
+                  <0xc0 0x400e0000  0x0 0xc000>,
+                  <0xc0 0x400f0000  0x0 0xc000>;
+            compatible = "raspberrypi,rp1-gpio";
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+                         <1 IRQ_TYPE_LEVEL_HIGH>,
+                         <2 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-line-names =
+                   "ID_SDA", // GPIO0
+                   "ID_SCL", // GPIO1
+                   "GPIO2", "GPIO3", "GPIO4", "GPIO5", "GPIO6",
+                   "GPIO7", "GPIO8", "GPIO9", "GPIO10", "GPIO11",
+                   "GPIO12", "GPIO13", "GPIO14", "GPIO15", "GPIO16",
+                   "GPIO17", "GPIO18", "GPIO19", "GPIO20", "GPIO21",
+                   "GPIO22", "GPIO23", "GPIO24", "GPIO25", "GPIO26",
+                   "GPIO27",
+                   "PCIE_RP1_WAKE", // GPIO28
+                   "FAN_TACH", // GPIO29
+                   "HOST_SDA", // GPIO30
+                   "HOST_SCL", // GPIO31
+                   "ETH_RST_N", // GPIO32
+                   "", // GPIO33
+                   "CD0_IO0_MICCLK", // GPIO34
+                   "CD0_IO0_MICDAT0", // GPIO35
+                   "RP1_PCIE_CLKREQ_N", // GPIO36
+                   "", // GPIO37
+                   "CD0_SDA", // GPIO38
+                   "CD0_SCL", // GPIO39
+                   "CD1_SDA", // GPIO40
+                   "CD1_SCL", // GPIO41
+                   "USB_VBUS_EN", // GPIO42
+                   "USB_OC_N", // GPIO43
+                   "RP1_STAT_LED", // GPIO44
+                   "FAN_PWM", // GPIO45
+                   "CD1_IO0_MICCLK", // GPIO46
+                   "2712_WAKE", // GPIO47
+                   "CD1_IO1_MICDAT1", // GPIO48
+                   "EN_MAX_USB_CUR", // GPIO49
+                   "", // GPIO50
+                   "", // GPIO51
+                   "", // GPIO52
+                   ""; // GPIO53
+
+            rp1-i2s0-default-state {
+                function = "i2s0";
+                pins = "gpio18", "gpio19", "gpio20", "gpio21";
+                bias-disable;
+            };
+
+            rp1-uart0-default-state {
+                txd-pins {
+                    function = "uart0";
+                    pins = "gpio14";
+                    bias-disable;
+                };
+
+                rxd-pins {
+                    function = "uart0";
+                    pins = "gpio15";
+                    bias-pull-up;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 75a66e3e34c9..c55d12550246 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19384,7 +19384,9 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
+F:	include/dt-bindings/misc/rp1.h
 
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
-- 
2.35.3


