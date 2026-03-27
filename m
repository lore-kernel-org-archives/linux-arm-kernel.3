Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A9810F284F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OzEqlfjCP+7hOjyp4vYS6CJ3+BJqvMqcHKBBEUysxc=; b=WTzIJhwcaU2el2aSgroIPS8a2u
	UUGYTc2MFuWORtnRVtr9cTOsBrVALRSxFiQLcYYkmdDnJvDtxVZdkd+XEFvkxQrHHrTU4HcpSrRkh
	PNOGOGfbNZUsZrbH15m4AVSgGSbGfKFw73wh8QXlWGlNf8Gas6wEot21NXhYOyYW0hayw1cuK3f6S
	tICKyl7opzZnZl1yCPQ3+rGnWRmkyoOaNgH366ovtidrwKUjVTIHu8jrnf+7A/Nysbg+mbiVuPXCz
	Jj0zKwNbDPJ6iXtfxeMXYhAudeYz3WIUhkAWT7RISL41Tv/k+YEClfonWsnNY5Vk8VhVd/wkU72bB
	IEFS4BTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AMF-00000007nkY-2aGh;
	Fri, 27 Mar 2026 16:48:27 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AM4-00000007nf8-3yol
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:48:18 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c2af7d09533so1807611a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630096; x=1775234896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OzEqlfjCP+7hOjyp4vYS6CJ3+BJqvMqcHKBBEUysxc=;
        b=cUcdZagb/kSHU14K9hIpgodhQxX6Nc/FFkZ9eGSUbxeq+uLKjWUpQpakDMR6oTNgoL
         Jf0T18Z7iQWAxcI/3ZbLoYx3yfZKFKJ8zQYkRVKsK/aUUGa2GhuX0DCWV3BuGu+c7Xnp
         jTzFZExopvithdjSyFlXO4pNhNYyABC4iY7684xTtOSKMRXkmEJF5X98u9+qwxZ3uldI
         7CSh5dMvsoHMHND9D84q3xBFdnzWCYk4/0m8+znp7ywu3rAQhP8dhxFgC/VEhPBb9Cef
         JFFNSlFCPRoCN1/LGwhIf2aSApQ63+Zer2CUgA8nAA+Usnz57er8AtF5+ip09QvLHfcZ
         mtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630096; x=1775234896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9OzEqlfjCP+7hOjyp4vYS6CJ3+BJqvMqcHKBBEUysxc=;
        b=M0E7RVUqUr3p2v2gvIn46ZbpdA1meCZK9ZvwErFlSTxCXn6P1kLHQUJQBfzkyQs4wC
         ifFUMZLI2WZsR+KYta58vU7jRevWF+h5f2sdxGVPJm212tJ7YdPZPADLO1SQgGVVCmzV
         abXHPqMpBhat1iep6N6IlEdXpJ1zpCpWvyd7e2lLZ1AKnCmm3bKzgywYRG293ktBndQq
         BpOG8STe7w6BOCjrejXjSmnzG7HvlojsMBZNWRFW10kf3swZTTf2D2zFLj0Yl+R9ThHR
         6cN/ri9Z8DXpQklgBUZjWx7qc95WH5E3NnWLNDWFnxVYGmQ2fbyo80ToJulwY8/1Psbb
         YcIg==
X-Forwarded-Encrypted: i=1; AJvYcCXnb55FNqVhK0N1Hab2E6wNW1gUZvHoycR2/10YyDeYrk8Rfov+QCyXEarVqTLWSE1FzG4O+xX4hXvJuCd3jJoC@lists.infradead.org
X-Gm-Message-State: AOJu0YxkuAUj17GuoF8fVfIaOTzAFjBN7szSwWgNjBtYhfRRIIRkxZFs
	qMkcBlTc/cwMxAhLRHkvdCTuLlo0Nu7Qx/MJai1t1wj1HOjB6A5moc/R
X-Gm-Gg: ATEYQzyI8GT8j4d/GqowOs5VsZhD7m8sssMhBTVd2/XZOJ2EDDc9i8Q+1WOpTeIS5HO
	X/2N2Hs5npxu8RKHDSMcdGK90IDYyKxMebftFdu1hbN4g/SgucWzvMwhPrH19hFV3WlibiPUAPa
	6Y5edYfqqHqnm7iYn968L0sVJhN4GqQ8sp/YlsDBx+Smku/RHKNQFmbYPDA+xgiNypfaTxqYumZ
	3Vp14i6jZRWOuL8RNk7VnZ31yFtRtCd7g9hFopikGmwTP166HreP7gl2WM2xu0ebeLKtKrFbwsI
	7dfKOLs4JOJ5YSI+9KsXwUwjjFDKhZc9kUOQzIkkn3IgG6on/bosCxJhKOUPtcf8YMmL6MqEIve
	2iB94q0aNZe6iW3Pcs7o/6VNoFGx3D5uZrP3eON0juwAFtrzzdU1wsFsiWHt8SnZhRZtineGhZt
	kAXTa7QXp+DCUDcdzLN6zeMoWT91k2iSXGkANsVQxjGEtj
X-Received: by 2002:a17:902:cf03:b0:2ae:c529:a13f with SMTP id d9443c01a7336-2b0cdc24049mr35807125ad.14.1774630095953;
        Fri, 27 Mar 2026 09:48:15 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:15 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:46 +0000
Subject: [PATCH v4 5/5] dt-bindings: usb: atmel,at91sam9rl-udc: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-5-eb8b6e49b29d@gmail.com>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
In-Reply-To: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
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
X-CRM114-CacheID: sfid-20260327_094817_031521_9A0DB7EA 
X-CRM114-Status: GOOD (  18.57  )
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
- Make the "clock-names" property flexible enough to accept the items
  in any order as the existing in tree DTS nodes doesn't follow an order.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         | 74 ++++++++++++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 46 --------------
 2 files changed, 74 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
new file mode 100644
index 000000000000..cdbbd17f8036
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
@@ -0,0 +1,74 @@
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
+  clocks:
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
index ab353576d1de..000000000000
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Atmel SOC USB controllers
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


