Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDC7E7C719
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XV4nvlQJllxGJymMNGffVCbvnmIzM3P7KoEHXDM6RU=; b=PxAY/3JZQ9YG2aZF9cZoAAYHZ7
	Im99gkNzj2zh1r9fEZdJbzUnL2dRB4ma2W2DH+R7FiC8UTLjF29/cXksdFGVsRL+TtS30OJbK/i0+
	q4sBNAbgWx/IOXoLJVwOygE4+i+lcRa6uL723iOnbrmgMGiGMBw46CmjFsI9AZHCpvpNSoGgOFgc3
	uOo+f552JQ49OPKUXbGY78gVf2rVENVyPLCkJmPJ0deMlf18lh+tSbC/PHXel+MNMMkadIfGKmjdS
	igSOJo5gdicPGDVb6NaQpPt0mfYGnEF51NWjieOTDn9dp0JoBOnLQ3OOZo/mjUwH6hgjwp/ihvu99
	OdeGVZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVjU-00000003TET-2ay4;
	Sun, 01 Feb 2026 11:35:12 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVjS-00000003TDA-0N57
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 11:35:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82310b74496so2033802b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 03:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769945709; x=1770550509; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XV4nvlQJllxGJymMNGffVCbvnmIzM3P7KoEHXDM6RU=;
        b=l1HrROJXK1X727LMGJnKefvmV44KGqHKcnOzr47C07Xsjb6s/tyRVOOf65Y8lDV2/t
         Sq784qF3ncwn8b9qr8QWpC02nEhktfoYcUjXMNomUmVwZJIkM1G1Vx0kfgRgX0pGph3a
         WlFytyWMpcVh5LCZ4jyL/eAo7e9LWGnQDzHdDZjbB++REmyfLOaknWck6jbu8U9Y+eun
         Sv5DT5ZeefNgATz1r73FhZ0q4J4EDpzreCGKA1hAQAnKoog7DeBqNOXYcW2yu71OEv/g
         cNrE8rhq/pm80kU/LykaqmiNDcV3TPuqaX6hzDSFFnJvei3ODa0A9bJqDWp1ZY0D3227
         qfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769945709; x=1770550509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5XV4nvlQJllxGJymMNGffVCbvnmIzM3P7KoEHXDM6RU=;
        b=QtcCFO3xxGcStMwcfTSB8jEqCens7N/ud6J56BXuG6kpRkoJlE+voYaNDsrOBlMaFL
         1L0skuhCDBCI3bfaVspSnqRfDzqABt7cLq7TtCfhOncmKf4Ci0xX7LH9se+qKMazgP9Z
         JTgjcM7qslFaLIBqf51xQObkDngrsA3ZqLSFs0pgZv9NLA8xUM4pnKnxHP0mIfe5bq8w
         Coo0jezcZjsyeUB6SDMZEqxnR8Gd5Pzz5YE2DBELtGmCXJFEcDFwS+7b90wr5WOy6Bz1
         6/9saP5laaamzmST+NheiXc3UGumb3HyvwRDZPhjaMHZxP3kQjOHejk8PeavfZ2/iI+i
         fQfg==
X-Forwarded-Encrypted: i=1; AJvYcCXpuib1Le/DHNpMqcqsnhwADONLxAqULxBP244GlHMxVp61NLQzbU4eoRMWajdkSorVbDqeZlszIczTKcdk7MOQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwwKUWrbMd5WXGsVJIjol8TcSFoJBkqHTlZO1q1GApDbEzVkwki
	eGOCm5xwurxzJ/VogxXnjeJLhxtkUaY82PFYQw5FwxcGkQXLZdVPkeOC
X-Gm-Gg: AZuq6aJxFgA9IVf7QW8DSBYVRdQEClNLVxOqMnojTRdx7qvo5GnfQSqcAKf8OVGgDOI
	bwqUMj+NB5gtdvbEeGhhlcen+NhF0ImWegZGtwyNBOwZ6LGsHmoOQgrQce/tn1BT7mB54tYhV/M
	iT37ESR4hPy5+zAURyTIHSNzdZtgOXr0C1vBhJSUgS7jBUW2WMFnkVuPV0X7c5E1ckunRsbeUeP
	mOQ45BliqMxptBO51Dp24/wrsP3+Tgw6MQIHfxgTlvxzmbkR7IbFwJ56+jDaKn8LYiZB+Y6HTen
	JQLbYEzbrKNA/yJgjBXSiYJ4RyiO94z9h7wnxne+luczFFxYhj4hxJnuSZA7OAuPofk0yFtzMw4
	7Zx1CASQBfSHc+Skf49L0ebkFbU/DWyoveT4xsYbzYPyqSYdfJiqgiLwrBtprwdH6dxpASJJVgC
	WbYMfuEIzJIPWPip24QNRcuXmOJ2cJeNpEFg==
X-Received: by 2002:a05:6a00:4286:b0:821:81ef:5de8 with SMTP id d2e1a72fcca58-823ab65359amr8617021b3a.12.1769945709102;
        Sun, 01 Feb 2026 03:35:09 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.252.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379c24083sm12994728b3a.55.2026.02.01.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:35:08 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 01 Feb 2026 11:34:22 +0000
Subject: [PATCH 3/4] dt-bindings: usb: atmel,at91rm9200-udc: convert to DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-atmel-usb-v1-3-d1a3e93003f1@gmail.com>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
In-Reply-To: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
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
X-CRM114-CacheID: sfid-20260201_033510_166237_4C901795 
X-CRM114-Status: GOOD (  15.05  )
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
index 000000000000..3af267c863e0
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
+        interrupts = <10 4>;
+        clocks = <&udc_clk>, <&udpck>;
+        clock-names = "pclk", "hclk";
+        atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
+    };
+...

-- 
2.52.0


