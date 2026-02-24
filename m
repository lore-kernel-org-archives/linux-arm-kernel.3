Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCA4E9B258
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/4bQ4PzNfjZtRfxhU1Dhe4G6PTYYpxaIPq8BE8Sc+E=; b=L8VjstpEVJl7poo5jv8gRsLAFw
	3PrpmTFXsIpFXL+Kx4qnMSQk5CV2HeFLOe6GoARjdzKI/HaeKCPkgaZku8wQ+DlwStd0Wtfram76N
	UuMDbKfZNeBdbrenP+NpZQo+K5WLqADxjN2M1irIGlkiLuwa3/SK2jcRt1HBuESYFop9WgSuQZBk0
	JofBHJDKDCeKQvfjwCunHLBLTwWYgh+VVTfbtGfwEvk4PyoEn9DK8vsdfjl99WlbVrSnOVjX05x9a
	+0ciutaSvzv6WYtrsIBYv+JDVYil0WmdgwQOEdDbHMD0sTw2av3Xb2dPitJyxeK3UTRVqcFhSvFx+
	5xwO5d0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusGR-0000000270o-2FWZ;
	Tue, 24 Feb 2026 13:15:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusGP-000000026yr-27Ck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 13:15:46 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c6541e35fc0so3378331a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 05:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771938944; x=1772543744; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/4bQ4PzNfjZtRfxhU1Dhe4G6PTYYpxaIPq8BE8Sc+E=;
        b=RSmMEqNuxkps+nq8yi55HK7MdH3NMyJRsjD2Azp/aUKIa3M08mKAdJVJ7ZHrExOe9r
         4DU8MWgkPGIcc7t9UAYllXEQflIfhNX9/qkSYiQ+Y/SnxB7GkHNauvrVREMq8F+U9eis
         w3Fd7NpsFB/HCEI6aeGC8iIkY+zaTny+7JsO5l0FFm71NdddNi76D4TrdAadniErpk9d
         IsKJztkxeFNujnynk2zKag31E9TD4DdduSV0X0EUd6J9RUawJRe0feOWtOlzrrBgAcit
         NdtjBADKBw0dfnPaSeGyWd/LpXXgl76lZIjYYNIOFNp4I4QsveiY2DYOcXTXx48aXeVK
         4tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938944; x=1772543744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o/4bQ4PzNfjZtRfxhU1Dhe4G6PTYYpxaIPq8BE8Sc+E=;
        b=Pm3rwFys2MG/0uZk3hZXM1LejadLMHwzIH49/tEyLlPSde6RxH0ZG/5zHhQFiuP95Z
         LvqQCVQ/HIUIqlHmQHliv6cA+yZyDw2Reg2beubH2mm6iW4q35n53KL927OTbrbVzbSm
         Fozg2nHSc7zhhdaRV9xBHaoBQglLWAxWbZua4ssQ+wAhsSuuzsljvLn/iJW8w+l4VXTT
         gpHltTx4dKzT9YAnxdjVc+/y9OZX5Lz3ze5iYBk4xMeBa/cG7oHop7J6H6OUOJJZFM8B
         0GEK1DxbGWreJ86Anaduk6p0MNcy9k0cx1R6440U9DpIDbb0utJJGZuHuuiP5sxBnp9B
         tjNw==
X-Forwarded-Encrypted: i=1; AJvYcCWMXo1E+goaDMZZ/OImqfr2YLzNXxa1h/ZzhaoX1L2GAjDOx/uR5IhtjO/QVxYGV0qRw7QPwlsqwRWOgZE20L03@lists.infradead.org
X-Gm-Message-State: AOJu0YxhRH2tQKBl0wEOehPO0NE1s670QPLyX0vw1pedtAPq9lxXQIz3
	hUtd83BHdUFSub8rPacUR42yTlwJX7eDQOxLkAbXZSdefzlOTBs41X8a
X-Gm-Gg: AZuq6aIxTe1cYsuMeF1v54D7x9RQOVHg56quXaA/8X3EMG0llDGllsQquw7gI5VfA/f
	tz9UwezhS7HyVTU0/ppEYrlU8y/kUtQiIoIDPJjL4TowNGWh+eAKjO/hbT3sSfcr+DEEGxzA4Ay
	+2rACfj6QdXJ7bb7Q9RF0ki17Dba2atMHDlvJ/CAYlgfsL+50m85hAiYSqHVsTr7fMfCA/zsr9V
	hkGMFSZle0E1hWEGPS+WedHRNc8KXstaZvZUZWoTpGjc4jZrKpD219CPdr27eAJKD0AQvjrT24V
	gg2X3HtyxcVEG0Ko3yip2KIQWRH3FmQGNmu/2UG2KaJqsURcEL+xJ/z4iwsLczkDo9853AU/60d
	NEmexbbIzaujg1eGzcW7mg6ao9jcjQ9Ps/2y3sPhPVSXZzVTEFlocXUbFsPm87oQeFGZxhUp6JM
	1eh/MGMiDxavRvLX5FDLlstl62SqtEFHkjIAd5Ija/GA==
X-Received: by 2002:a05:6a20:c989:b0:366:2360:8f7 with SMTP id adf61e73a8af0-39545dbf191mr14435962637.14.1771938944327;
        Tue, 24 Feb 2026 05:15:44 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm10794013a12.24.2026.02.24.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:15:43 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 24 Feb 2026 13:13:01 +0000
Subject: [PATCH v2 4/4] dt-bindings: usb: atmel,at91sam9rl-udc: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-atmel-usb-v2-4-6d6a615c9c47@gmail.com>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
In-Reply-To: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_051545_579527_BA395D28 
X-CRM114-Status: GOOD (  18.59  )
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

Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
Changes during conversion:
- Include "#address-cells" and "#size-cells" in the properties since they
  are required by existing in-tree DTS definitions.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  81 +++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 2 files changed, 81 insertions(+), 125 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
new file mode 100644
index 000000000000..6f5710cecaee
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91sam9rl-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel High-Speed USB Device Controller (USBA)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel High-Speed USB Device Controller (USBA) provides USB 2.0
+  high-speed gadget functionality on several Atmel and Microchip SoCs.
+  The controller requires a peripheral clock and a host clock for operation
+  and may optionally use a GPIO to detect VBUS presence.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - atmel,at91sam9rl-udc
+          - atmel,at91sam9g45-udc
+          - atmel,sama5d3-udc
+      - items:
+          - const: microchip,lan9662-udc
+          - const: atmel,sama5d3-udc
+      - const: microchip,sam9x60-udc
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [pclk, hclk]
+
+  atmel,vbus-gpio:
+    description: GPIO used to detect the presence of VBUS, indicating that
+      the USB cable is connected.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/gpio/gpio.h>
+    gadget@fff78000 {
+        compatible = "atmel,at91sam9g45-udc";
+        reg = <0x00600000 0x80000
+               0xfff78000 0x400>;
+        interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+        clock-names = "pclk", "hclk";
+        atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
deleted file mode 100644
index 12183ef47ee4..000000000000
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ /dev/null
@@ -1,125 +0,0 @@
-Atmel SOC USB controllers
-
-OHCI
-
-Required properties:
- - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
-   used in host mode.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain ohci interrupt
- - clocks: Should reference the peripheral, host and system clocks
- - clock-names: Should contain three strings
-		"ohci_clk" for the peripheral clock
-		"hclk" for the host clock
-		"uhpck" for the system clock
- - num-ports: Number of ports.
- - atmel,vbus-gpio: If present, specifies a gpio that needs to be
-   activated for the bus to be powered.
- - atmel,oc-gpio: If present, specifies a gpio that needs to be
-   activated for the overcurrent detection.
-
-usb0: ohci@500000 {
-	compatible = "atmel,at91rm9200-ohci", "usb-ohci";
-	reg = <0x00500000 0x100000>;
-	clocks = <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
-	clock-names = "ohci_clk", "hclk", "uhpck";
-	interrupts = <20 4>;
-	num-ports = <2>;
-};
-
-EHCI
-
-Required properties:
- - compatible: Should be "atmel,at91sam9g45-ehci" for USB controllers
-   used in host mode.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain ehci interrupt
- - clocks: Should reference the peripheral and the UTMI clocks
- - clock-names: Should contain two strings
-		"ehci_clk" for the peripheral clock
-		"usb_clk" for the UTMI clock
-
-Optional properties:
- - phy_type : For multi port host USB controllers, should be one of
-   "utmi", or "hsic".
-
-usb1: ehci@800000 {
-	compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
-	reg = <0x00800000 0x100000>;
-	interrupts = <22 4>;
-	clocks = <&utmi>, <&uhphs_clk>;
-	clock-names = "usb_clk", "ehci_clk";
-};
-
-AT91 USB device controller
-
-Required properties:
- - compatible: Should be one of the following
-	       "atmel,at91rm9200-udc"
-	       "atmel,at91sam9260-udc"
-	       "atmel,at91sam9261-udc"
-	       "atmel,at91sam9263-udc"
- - reg: Address and length of the register set for the device
- - interrupts: Should contain macb interrupt
- - clocks: Should reference the peripheral and the AHB clocks
- - clock-names: Should contain two strings
-		"pclk" for the peripheral clock
-		"hclk" for the AHB clock
-
-Optional properties:
- - atmel,vbus-gpio: If present, specifies a gpio that needs to be
-   activated for the bus to be powered.
-
-usb1: gadget@fffa4000 {
-	compatible = "atmel,at91rm9200-udc";
-	reg = <0xfffa4000 0x4000>;
-	interrupts = <10 4>;
-	clocks = <&udc_clk>, <&udpck>;
-	clock-names = "pclk", "hclk";
-	atmel,vbus-gpio = <&pioC 5 0>;
-};
-
-Atmel High-Speed USB device controller
-
-Required properties:
- - compatible: Should be one of the following
-	       "atmel,at91sam9rl-udc"
-	       "atmel,at91sam9g45-udc"
-	       "atmel,sama5d3-udc"
-	       "microchip,sam9x60-udc"
-	       "microchip,lan9662-udc"
-	       For "microchip,lan9662-udc" the fallback "atmel,sama5d3-udc"
-	       is required.
- - reg: Address and length of the register set for the device
- - interrupts: Should contain usba interrupt
- - clocks: Should reference the peripheral and host clocks
- - clock-names: Should contain two strings
-		"pclk" for the peripheral clock
-		"hclk" for the host clock
-
-Deprecated property:
- - ep childnode: To specify the number of endpoints and their properties.
-
-Optional properties:
- - atmel,vbus-gpio: If present, specifies a gpio that allows to detect whether
-   vbus is present (USB is connected).
-
-Deprecated child node properties:
- - name: Name of the endpoint.
- - reg: Num of the endpoint.
- - atmel,fifo-size: Size of the fifo.
- - atmel,nb-banks: Number of banks.
- - atmel,can-dma: Boolean to specify if the endpoint support DMA.
- - atmel,can-isoc: Boolean to specify if the endpoint support ISOC.
-
-usb2: gadget@fff78000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "atmel,at91sam9rl-udc";
-	reg = <0x00600000 0x80000
-	       0xfff78000 0x400>;
-	interrupts = <27 4 0>;
-	clocks = <&utmi>, <&udphs_clk>;
-	clock-names = "hclk", "pclk";
-	atmel,vbus-gpio = <&pioB 19 0>;
-};

-- 
2.53.0


