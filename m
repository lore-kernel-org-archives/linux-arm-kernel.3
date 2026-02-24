Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4132FE9B263
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKyVMXkU8eVMnRXROgyxZzfs8lU4JDR8nVIKWksqSOY=; b=TiOrNlfzPMF5/5pxRcphzJDvXn
	TRcxGJxcHFMF87h7Je41Dxl6bbGlj0gjZetFYTU11oybYvN/4kumGRJB/2ue/VkA+a/pmf13alFv4
	0anlA2+f0h8WVxlSrQPusvZcj12ZIulUNfe10gCwNJ9khkcMGQ034xw2EyTG2yrIDpvBfn2e1nDhP
	DagPT79ZoxjttW/nF8iHKHGF3dSsSrHDBOe9r/12x2ry1Jl9dUJX+8R8LN5cEszSuDkLJLxEo/1cB
	rudov1n6ms0r2mok5SWPnEGlmF7lQN/Zpf+gdPtWzRXyn4KyCIjJvXcGJ4a91dPEiw2+exEI8K+O/
	bBCngdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusGN-000000026xh-2ry0;
	Tue, 24 Feb 2026 13:15:43 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusGK-000000026wR-2lkT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 13:15:41 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-824a2888de5so2992230b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 05:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771938940; x=1772543740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKyVMXkU8eVMnRXROgyxZzfs8lU4JDR8nVIKWksqSOY=;
        b=KYz4FPCc8IP+dfafrO8d9uSQ4J18qnFtsnl9JY+Gn0+pyvYe1BRzF1sgT5N++lY6W6
         c/vM0uN/5ExeQWsR1jR0rYGwMgCe9bWqcMjCqd5/ArWSkqzIs7Ghnn555xdeeqT42X0q
         hM4Rp4Xju/CZhoZSZgAC7PqwA3cAEeB5FV50+tn0Y/VmyjOhapGqkYNz7XHMsoE1L46b
         bFUWmBo8U1V7yPWDWPktGTqQ5w4mPNsDb8ZmJc3CXNgYWlmZa38ecu41/w5JVgUd04SQ
         CziPLMtuBsSE0P9U7ElnAB3cWK1AL5ZQHK/+x8gAC84RrAF64PBFwQRuDn8km8RvGqoH
         Nrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938940; x=1772543740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKyVMXkU8eVMnRXROgyxZzfs8lU4JDR8nVIKWksqSOY=;
        b=mPKfTX0uVu0ceVJD36ujqKwdqbi9jezFT90EQpzhmBCarlPo0UXKiolnFOWLtO3N+J
         bwFA01xoq7lpRXmUG1TIJtv/AZt3eqlRfwn3Z9SYNYTVykB9sn9gQeaX4kN8P7xJzz/w
         JW57dMxDAdMTN9TEOsVEQoD7eO5IYtaWSYQ36MtwWOziipGglouJAEfO0P09zX320jOy
         +JN0Clmbeb1tOPOeXj9+2CHGRmpgZ+4cyaXW6pQ55dJh27Sz5YKD3TGsZkD4DgoHQ/oh
         HXv7j8lLvuNjY6tmivYG/zvt83ttSit479ZgdIqepWV67p2/YPxAMcT8fk+008qgw/b1
         2NVg==
X-Forwarded-Encrypted: i=1; AJvYcCVFD1riilZTKycuyZaVOCHMEBAzKJx0BUukIPmmLn4+hWE4xpuvqzKXoBfStD40kvCYPamHykOjYQRBy+jB2rh2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0yjlQe6U1qwp8KinwIis1auZOManrmMKMQ3+ydyfMElV/O+XR
	qmuWShp/kUnh8d3WuX+FyBAD7cSRMTb/rwSVaGknpi1DrWyFOk1YyLsd
X-Gm-Gg: AZuq6aIs2be51B6ulmAWBesCQcsrHvuUDIs1x/5W7146y2d3NepBdcaZ/SHBv18aOrz
	ZbtP1XsZ7bIFyoGjyYaR97Sk8jxc19huDRRbtesioTH+zo8f2UBBuUjnwMYh5MYQ5clhW6bUCQ+
	jQBoMIV6i5ZCklgLMNUQWxUtGRe2uNTOIDGGeUw8YO3OKtUOPd1RU+Lj6C2owTZH6ihT0xmiScN
	TLCFGj5OtX7/gyHIB7KhdZ3qjVF3lbIAEJPGgMCQUVHqoRe8yXDeDw3zBeB3p1BA1Hl4LM3iedk
	RorwqiYdYzJYHF0YO5HK4qOsDhMCfXfCNLzv1ywg5JktblCBA8KzrppZ4gCDVVugmJzDGpBIRpk
	gAyMPA1L5qHmYXC6su//XZA1b6MXIRD0LFTC6MjqqItYIHFBHCAKbwprnA4wPZa4VFQfbq511lQ
	Dm0TM67i4s3+r/sde/RbaryUNlovusAuOI3/0//yvqFw==
X-Received: by 2002:a05:6a20:918e:b0:35e:5055:1ec with SMTP id adf61e73a8af0-395460a1f45mr11049420637.17.1771938939751;
        Tue, 24 Feb 2026 05:15:39 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm10794013a12.24.2026.02.24.05.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:15:39 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 24 Feb 2026 13:13:00 +0000
Subject: [PATCH v2 3/4] dt-bindings: usb: atmel,at91rm9200-udc: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-atmel-usb-v2-3-6d6a615c9c47@gmail.com>
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
X-CRM114-CacheID: sfid-20260224_051540_710319_234349DC 
X-CRM114-Status: GOOD (  14.77  )
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

Convert Atmel AT91 USB Device Controller (UDC) binding to DT schema.
Changes during conversion:
- Include "atmel,pullup-gpio" and "atmel,matrix" in the properties since
  they are required by existing in-tree DTS definitions.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91rm9200-udc.yaml         | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
new file mode 100644
index 000000000000..6961cd5d5d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/atmel,at91rm9200-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91 USB Device Controller (UDC)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The Atmel AT91 USB Device Controller provides USB gadget (device-mode)
+  functionality on AT91 SoCs. It requires a peripheral clock and an AHB
+  clock for operation and may optionally control VBUS power through a GPIO.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-udc
+      - atmel,at91sam9260-udc
+      - atmel,at91sam9261-udc
+      - atmel,at91sam9263-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: hclk
+
+  atmel,vbus-gpio:
+    description: GPIO used to enable or control VBUS power for the USB bus.
+    maxItems: 1
+
+  atmel,matrix:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Atmel bus matrix controller.
+
+  atmel,pullup-gpio:
+    description:
+      GPIO controlling the USB D+ pull-up resistor used to signal device
+      connection to the host.
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
+    gadget@fffa4000 {
+        compatible = "atmel,at91rm9200-udc";
+        reg = <0xfffa4000 0x4000>;
+        interrupts = <11 IRQ_TYPE_LEVEL_HIGH 2>;
+        clocks = <&udc_clk>, <&udpck>;
+        clock-names = "pclk", "hclk";
+        atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
+    };
+...

-- 
2.53.0


