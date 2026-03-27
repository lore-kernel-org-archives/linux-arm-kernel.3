Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDA010F284E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcCW/GTEnEUFiHAWHz6f8JvJTk6/azgZ2oCG+4+XfEY=; b=QkvDwOy8nVrbf/tvVhqsGGF5g7
	19DqubpK1vB6cHgGFTdItfYws1yLCGmBoxK/855paTFxFrGQan9YkvMPKrgzdUXzCfgPfm2Ugfgir
	wwuw09A6PILnH+VP34uD/akVpxinlyxtoNTiUqVi5X4j0wRU+YJ3XkIzVQ7bWTPvaTuBW9EZ6ew5H
	m9J/BnOnkf5c9+QFYIyyimr0JfO3oEtUtgpk2D2yVCp4HTnjl+pMfz33KcA+ooYujaSuUfXFq3zF7
	JNtVKJ7FvVZOK0N4+azXmAzgg02Iqa7Zwss7jJKWIYa2iBOBld+Y8wH0A/Nr9RNgCJuPzCCTK4VId
	hk85iiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AM0-00000007ndf-2V4Z;
	Fri, 27 Mar 2026 16:48:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ALq-00000007na4-3ZkK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:48:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ab39b111b9so10817725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630082; x=1775234882; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcCW/GTEnEUFiHAWHz6f8JvJTk6/azgZ2oCG+4+XfEY=;
        b=V7GpS14xspQtdKXzggLRjVv2wBSdKD8tYpE8z7EZ/EtFiXXc8jZfJAL/TFFyBiE+f5
         6VMeMk1r1p3CKpxBfpBdDoFda9aNgdAE0zXM8wPm09YAEecTOLinslmmhnn4OenrZA0V
         red5T01bRqh+PuVmOqPxYZBk3JTgtOxn6wWaHhYwbYFFVUxVCRZC8mjsimo5XVVyELxI
         PlG+b1O+F/nW4PNA+KZgCwvs/8osdI1Fu15kd74jnZnWL0jZ7C9/2yitCRUtDZR+04dD
         XE9U9CCFF3CU6bLTLQAG//laeqqoq2+iN0LDMn9o9Rtvbi+nVmIbQWgymk96+qlw/C0X
         qRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630082; x=1775234882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KcCW/GTEnEUFiHAWHz6f8JvJTk6/azgZ2oCG+4+XfEY=;
        b=ruYvgOmRqV2G0+G+fstLZLyJrZUY9sFzjc8BmtnIFW4ohxTstU9f8BXhdRtKbzyPDN
         cDYLUMFuSgPCZh7S0pMSQZT3Vy1DQMkSaTcunDUdJMNaMHDxh144XOAez0CyHtNCCxYy
         agTxvnWmtid3RJxRTbI+4HxfHFVfuJkmxn29K83WUTgLuNiGQnLkncRXQjC8m+Ak7TI7
         KnHz2liS1VUqhcsV08EP/eZIRPF1uRZ8CqJPYiAFQQLvUuGkcT9CIiuQ6Y6bMrSPDTS6
         b7CkvjczkUGTSZoc334TI+U7PCMtNfg60jOklMGa182rdZtHoYQknpo1zu85JjRSxSqq
         mUaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGnaf4WThvJbyYQJCW15gM8l0dWpIGF6fDSwP6XJdtAEnOXsGtj2aM3t04GE4kta8Stavzq3AQnzfb7zMc6Ti0@lists.infradead.org
X-Gm-Message-State: AOJu0YzTqxXPynOXblcQY0T/CHmsU5TZeRQQ/nN88iRwXuPLIKOwEyI9
	g5/ZPEpZcwCIBXW9B14Sj1AIz/WU2fOaXibK7fZdkRUCwHHE67SBr2j5
X-Gm-Gg: ATEYQzykucm4YwlH1RSY7PPP4LSuKjlIrWzfLnRwlHVBMuY5+z2kWYdcGfANon3gcT/
	q5bxk1Tjo2zgfbDqXLZZAdqh/1roG7MeyYxaGDMUrMZ6xcuNaK1JCpWZLse1ctyIMak7ZDRiX10
	XjOfya2MH6LSlnQAFoWuhX19DyLeUrHtnqLPo3PPZ8k76rUrNObR+7DlYGmsDniNnL8rOCiuFLK
	NS+4d9CnoTTgVB2hK++ly5oQL+OZpND6ziMWJAVLZ6OnlmDoWNq+7o3x0IcjiO1xt//cs7uDDKO
	LByKEblHcWlXsdQF8j6k+6GyYNmyOwhC9imzarnKppMgUPAqA+Ld4cV/3gmFKMkwYsSXe6ITAVl
	JWBQi/EPUr/ANbAOzwsq5ipu8MyPe1/hWVkPSwf+IRpgoT6qD3GVVYRnmKmOsys9vINWqlyACpq
	qMTmIRDiSMlOu36NfxjOwzNdgski1SyhEJvVc5VH6q3/hc
X-Received: by 2002:a17:902:cf03:b0:2b0:c451:aea8 with SMTP id d9443c01a7336-2b0cdc2a006mr32092775ad.14.1774630081879;
        Fri, 27 Mar 2026 09:48:01 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:01 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:43 +0000
Subject: [PATCH v4 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI
 binding support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-2-eb8b6e49b29d@gmail.com>
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
X-CRM114-CacheID: sfid-20260327_094802_936189_1CD11B0A 
X-CRM114-Status: GOOD (  15.64  )
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

Convert the Atmel AT91RM9200 OHCI USB host controller binding to DT schema
by defining it in the existing generic OHCI schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/atmel-usb.txt          | 27 --------------
 .../devicetree/bindings/usb/generic-ohci.yaml      | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index 12183ef47ee4..c09685283109 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,32 +1,5 @@
 Atmel SOC USB controllers
 
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
 EHCI
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 961cbf85eeb5..d42f448fa204 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -55,6 +55,7 @@ properties:
           - ti,ohci-omap3
       - items:
           - enum:
+              - atmel,at91rm9200-ohci
               - cavium,octeon-6335-ohci
               - nintendo,hollywood-usb-ohci
               - nxp,ohci-nxp
@@ -137,6 +138,24 @@ properties:
       The associated ISP1301 device. Necessary for the UDC controller for
       connecting to the USB physical layer.
 
+  atmel,vbus-gpio:
+    description:
+      GPIO used to control or sense the USB VBUS power. Each entry
+      represents a VBUS-related GPIO; count and order may vary by hardware.
+      Entries follow standard GPIO specifier format. A value of 0 indicates
+      an unused or unavailable VBUS signal.
+    minItems: 1
+    maxItems: 3
+
+  atmel,oc-gpio:
+    description:
+      GPIO used to signal USB overcurrent condition. Each entry represents
+      an OC detection GPIO; count and order may vary by hardware. Entries
+      follow standard GPIO specifier format. A value of 0 indicates an
+      unused or unavailable OC signal.
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
@@ -144,6 +163,28 @@ required:
 
 allOf:
   - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91rm9200-ohci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ohci_clk
+            - const: hclk
+            - const: uhpck
+
+      required:
+        - clocks
+        - clock-names
+
+    else:
+      properties:
+        atmel,vbus-gpio: false
+        atmel,oc-gpio: false
+
   - if:
       not:
         properties:

-- 
2.53.0


