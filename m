Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0547210F284B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBHc0eO3/NbG1nFm7mct65bznXsLp+shsTmz7+UdJu8=; b=A51W6VB5BX152gcehnCvWTJB20
	SRa9oRvZxbiZwyRpO8FKvEINgOIUba5hrXQZGObvdceN74wzb8AjDQrpBJ3gimnjUcM/yl38t8eQy
	mrpxBNSzOefTHlr7CKqfDIMXpIfi862pYLJRXrblAETVghN/eRhet2ZdHFvV4vXcj5SuF0IvfqDrO
	LapNYyey4XMle+urZN1vaoImQI4LNpo5QfqU5Nx+GeAR38MQZLoWuja4IITngyZwAKCimSgt/rZj8
	aD6HMh/bEKKqrAOf6vyKV8IbDDDmLgB2SSbFWksl7M5Kw3qR6PHKer+RBZBrfU8/9oVo5XhyUwENF
	gQ/saHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AMF-00000007nkD-1CAK;
	Fri, 27 Mar 2026 16:48:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ALz-00000007nd1-3dxH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:48:13 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a8fba3f769so10016075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630091; x=1775234891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBHc0eO3/NbG1nFm7mct65bznXsLp+shsTmz7+UdJu8=;
        b=KuoOoGJKe0sEUN96YwmUjSr6SsAfE5IgYSmQG3cbgywF9tFWj+aFFjKrodZmnQF354
         aKOoUroOXWiuQlPNsc4nxr4kshTwA571e4XLrEYiMt89no/b4fj8bgayB/SJIqkfbqZN
         GQVfHaus97FIclgDlXpvEdfuUITt46AbPBdSNZ9jNzNXplOkkZEd4eKXOaAxW25gAB+7
         dZ7SDQ231iFrnfBAKe5nP26LYAzrbRdJD4UDwEzkqi9OYYePUawThVYvkzweTiidzH9R
         xbL8v0NgCapIGyWJxIPNPmWvgG44o/OMykurItvRlvBPK0eca3EvZvsMBUOasfpmH9ld
         oz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630091; x=1775234891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBHc0eO3/NbG1nFm7mct65bznXsLp+shsTmz7+UdJu8=;
        b=WHE2r5RCm1v5H0mzKkwsFW4oRK3dhRyPtpAJZqsTFJmvxdgUNf7DtOzkZA3qVQbRcm
         BJ+KPMU7LlgWpp3D1XEUZ8K7xhRi/zEZQ7ci64UtEJ/rjJyQOZ7RGOGoe61EeiW+7VxI
         WOLowDGZt9jHGRXmf3Ta6u/bnRmtcdC3NVgzXUqEZfJQ4Hw2w/7I2NLtR8yPTvDLKxcm
         f4MsB8ibWNOaqnla7rapvmuYv8kHI6Tzztl6th3qU/RZ2KoNF9SVr9KF+XSUF7rc7vgV
         juU3GTow0mlFPdUISFP0sKEHmrHwy6AdcDIluM3YEAmyx8rel9WUmGjgWGvq9u7xU6/O
         dQpg==
X-Forwarded-Encrypted: i=1; AJvYcCVVm1sWQkb4XtvoWijAOCfs3v8tKSK0oyeBrveaKQCjRfY7yAHqgZVIU+ddliu4v+rlOLetihbuPsE/OYSCT54g@lists.infradead.org
X-Gm-Message-State: AOJu0YwCZWTZZ5S1WePe8W7W3n8ZhkzxlLDN6XZsBjb/8rD1ohwG800y
	tNVOu8VfrBQpl1A4cM1E/GLmzDiMfASLgsKCWxuEGdltHaq0yzKy73bFtYIksQ==
X-Gm-Gg: ATEYQzwf4ouwRoblI56MCXDVLrOVRT4gpgc2smlS9mIZUGTeakf8eByRBBmETgZHhNA
	AJA0lA7kcGvnQcslzq3hQOJtzXQQu/yuZlKbi7OAlaFjtKTKCPVMZYywa2HiEdM0b7IlzOvUo33
	HPZn0qJ4M4OFdBPQRINLTNUZFHE0uZBbIF2TEEpDGmruj99ni/taSgpFeQ3/dD22tplRrQAuDIi
	C9ZxDjQwQxAu1bOIOJgdlkRlMcGi8Ks8RY8uiKfve5x4T1PO8UMoSyPg96SnmH29zn0zejtaUHR
	K4Hxb/+HTGwuO/d0DowfHI9n4iSxaJJRwJZXMUuT1zUDhs0EPE9+bWAM9zrFSuShHKuUx8ivoI4
	rYdxzGh/nrur9nrjwLB2ZiNXGgiAVER1CmQdGZBoV7Oj8jRFyzJMg1ksV6WzfUWrdURcD8WUuJy
	lqor6mqwr9Ad4XSR1pgpP6aJmTRK8zh7ETnJHSHNpgk6Em
X-Received: by 2002:a17:903:228e:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b0cdc28166mr35337035ad.20.1774630090965;
        Fri, 27 Mar 2026 09:48:10 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:10 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:45 +0000
Subject: [PATCH v4 4/5] dt-bindings: usb: atmel,at91rm9200-udc: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-4-eb8b6e49b29d@gmail.com>
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
X-CRM114-CacheID: sfid-20260327_094811_925979_D9E40AEF 
X-CRM114-Status: GOOD (  18.39  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/usb/atmel,at91rm9200-udc.yaml         | 76 ++++++++++++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 28 --------
 2 files changed, 76 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
new file mode 100644
index 000000000000..a4eabb935e6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
@@ -0,0 +1,76 @@
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
+additionalProperties: false
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
diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index bf2149e5f0b3..ab353576d1de 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,33 +1,5 @@
 Atmel SOC USB controllers
 
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
 Atmel High-Speed USB device controller
 
 Required properties:

-- 
2.53.0


