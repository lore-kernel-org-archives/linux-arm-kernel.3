Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510BF10F284B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcW5pwvFh1W3aCrl8ykkfzRz1WOtzWb7PvDwxuJWqOk=; b=sMav0D+HpZN10/sUuzYv7l7CAg
	rvz/fpYt/4A9JjDF+96rGHBx76qYlda3LL4gisKESr4X2ecCf6uNvvtFmQw9QKFsq1C0+fgG0yuSn
	a1RzFnzURiREIbCYBgBduIeId1r5Qq98tBDsb4WFshwkC0OHRTHqlVney6ai9hr8AwBLIIplhbUI6
	dvgTNgewb9ViCaVLQU88kdgzdcJGGZuKjtgndE1oQ9KbNoKRrCThiMbhYJwKTTkRYi72Z64EUneD0
	Yiyld2uEnGLOoWKXWh+OXfxi6QFc0mgmEF6gLki02AtCK3KejHJZpxxnqn82oxSfgf23RnIeqbSB4
	V6+7TmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AM0-00000007ndz-3vhW;
	Fri, 27 Mar 2026 16:48:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ALv-00000007nbw-2A9k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:48:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b0c8362d93so11774365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630086; x=1775234886; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcW5pwvFh1W3aCrl8ykkfzRz1WOtzWb7PvDwxuJWqOk=;
        b=YPe5y+hXRd4laL2QfbKwqjiCIxj+Toh0pgUi5EENC/kn1H3RdAkfGXf79B5BzDs9R8
         QDkzb46CZRRs+JeefyyF/6qOM6LVyJ4yxqbxV5ycTq0UUzCDIXFBr129TCde8Shvvvve
         gFSXvU1J8vdlmTjHoIgE+c/K6ACUEMQJ06hMOgLo6h0hmbboOF3H2RJdWy4NNDLKFZ6l
         osOJuyGR6mtFG6MvTYFyIihxzLTiheK2IGRMhEVRonxoORx9sAv+6icUJ8QeUVIS7bkt
         ++dEvKt97Cs9xO+LFgZIuyjPBxzgblJYsVbVPo5UUuCsSBh3Peppzpt/sbL9JilDkCgF
         ndqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630086; x=1775234886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CcW5pwvFh1W3aCrl8ykkfzRz1WOtzWb7PvDwxuJWqOk=;
        b=JmvOsZoT3fWrJQ0n+hSsul4g4Ao+GQDqj74+6jjdjvbt37No1/i+gK2yTaIS2108Tq
         Yu6TbOthulvaKtYyKAPr2jRwQ22woxGDU89BWdDRydgXY61rHBAnlCyYBqcaGhohNrmS
         FMb1F+pt50hFC4Xii1zp+iDxnTfEaP6Oq9JPstfDrneUY4J8bpCGoYBJVog8rVjh+kBd
         aXPHKxuf6kBwr4IscB5x2IZoZoAtj1uK42lDhhGa9p7PusVkn8gvXDH1QrtTy0NDRdwk
         WoUvqhDdWWKWtHEAyaia/LVBvIAvvLxNpWQpluFKIAK8oNWPP6wQezarX3rhSiO9m3mq
         Xrjg==
X-Forwarded-Encrypted: i=1; AJvYcCVi7JDquuuMGXwqfT0t0/j3dA9rcI3WzLSb+SucrJacaZZwtpdZ/Jejiuva1CekAQ4YeDzPtS0WN7iQay5Lnakj@lists.infradead.org
X-Gm-Message-State: AOJu0YyAtAP4aW+asBpEA6Vrrlk7lLsQzefPL0kmURQAXNzMqR9BVh64
	Uz2+8NYsi1dCJbq84/jvMysBf43xpznplc3PgoaJzwb/9J30GxvaO44h
X-Gm-Gg: ATEYQzwYsu25gI4sdLKogT09LEDMlc7j5r2kydz6mA58TFJEgRe6fAMS0kg6DFqwRt6
	A/jsPuI6//qsj7mzwHge469NC8fQNrURO4Ny4HulkA3zaoukXW/iKKNJD8TfF+qUwMaG1t3qcye
	IdUWmvotLqx4wcvsn0caw5wbznbgvws/CJ4XaG8YwgohK3jIr4DHtTCEoNtwIA4BOKtyye8DEXj
	x1nndShrUKXSWIJBnMgOZfgXiy37UdLYllhklxTQRs0/wQEomGiILwLTCxVUlU1iUQBI1imdzqC
	LHLJL0yifoMThJ//THTlQtRdYn5DaTBhAlHjDmP5pEasZE3mQY45Nhk3YEUIrX9OPPBedA7kMmr
	2Lp5Pznap/ulj9vsCYxNVKkngJFnsKZXS/3EjVZYOWCzlqbsa7mti2MxsYGjy42KiCXYFSH4LC9
	zfeWnAY2ztWqN380zkELLS6K+O4st3JBPBUEuFN1fIzNpqSSbFFQSwbcU=
X-Received: by 2002:a17:903:a86:b0:2b0:603e:e13c with SMTP id d9443c01a7336-2b0cdc9eacfmr33580145ad.33.1774630086351;
        Fri, 27 Mar 2026 09:48:06 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:48:06 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 27 Mar 2026 16:47:44 +0000
Subject: [PATCH v4 3/5] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-atmel-usb-v4-3-eb8b6e49b29d@gmail.com>
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
X-CRM114-CacheID: sfid-20260327_094807_574587_74EDD123 
X-CRM114-Status: GOOD (  12.17  )
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

Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
the allOf section to fix dtbs_check warnings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/atmel-usb.txt          | 24 -----------
 .../devicetree/bindings/usb/generic-ehci.yaml      | 46 ++++++++++++++++------
 2 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index c09685283109..bf2149e5f0b3 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -1,29 +1,5 @@
 Atmel SOC USB controllers
 
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
 AT91 USB device controller
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 601f097c09a6..55a5aa7d7a54 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -9,19 +9,6 @@ title: USB EHCI Controller
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-allOf:
-  - $ref: usb-hcd.yaml
-  - if:
-      properties:
-        compatible:
-          not:
-            contains:
-              const: ibm,usb-ehci-440epx
-    then:
-      properties:
-        reg:
-          maxItems: 1
-
 properties:
   compatible:
     oneOf:
@@ -167,6 +154,39 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: ibm,usb-ehci-440epx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91sam9g45-ehci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: usb_clk
+            - const: ehci_clk
+
+        phy_type:
+          enum:
+            - utmi
+            - hsic
+
+      required:
+        - clocks
+        - clock-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.53.0


