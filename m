Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8992FEFB5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCOf+ZmqqtgPwlWCtohRjVDrXj8iEckMKHZrGnl9m9E=; b=t5WB1cHDN3cEcLW6O+3z4aT8F+
	seST1yv3B9YpsSgHNCegnk0X+eEzGBiji6AhEbtzTCaCf7BhG9mMF4epxhFParTIfJY1MFKif5RsL
	y6ztPXLlyOXkfoXQY7JtNGSpynaPtvAyEnlytkfhFNiuGk/Ei6CtwoJJQ6kIBHztMWFqFAralU2zX
	B35oY7sDUgG+H0jup51Zrhqrdz2cNOrIkscGPd+0Mv7B8mUkx8MyRuv5gucWpkhBIR9eYyBEImMa7
	fK2x4fun3sB+wIhGj9yBy7srmYBYxORIcZYpapvTleJ1Z1Mxa5hYyqcb2NgnBi3HXtmMPwWWElYoj
	/p6sTyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYc-00000008ZDk-2wYn;
	Fri, 27 Feb 2026 15:15:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYY-00000008ZB5-3hC4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:15:08 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2aaf5d53eaaso15358035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205306; x=1772810106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCOf+ZmqqtgPwlWCtohRjVDrXj8iEckMKHZrGnl9m9E=;
        b=mS3OlmEbFw8BJUCEMit8a1FCeu/1o0GZ7Dc4k20B2GMYHgcFwNRKL+yJ26S4+DPdne
         44oPHwAHQkC7e4zsGO1hbZIsDWaS7EADnKuZjMW0PdXVID80un2p5x/zwkkXglXErV59
         UEV44RmnqHpbtvivYCf/uycvFFI4ogzWfOYREl2pJov9kfFIZ3j9f+BtiJJZM1l4nvRJ
         huSGW9NTinmw9+vU64yl1SGVL6kh4ovx8+jw2KSktUJMT1x52CGPRIleauf5oEUbb+jx
         fJSeDd5/uNC6CXU8YTfex4l98dMzNS1d5vmNsGnXKt/a+fbJZZ+37LXOLZaJJwIsAyWC
         Kvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205306; x=1772810106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pCOf+ZmqqtgPwlWCtohRjVDrXj8iEckMKHZrGnl9m9E=;
        b=rb44p0P0Uva76FZyNZzb4fcfB0igBPp8ABew/JYbYWjsSS94OdYvAiBgHWKJ6Rh0DN
         wt4mhxBKNaTvj5WkkPeaDbL/fxx5a4y4m0E891Eb9S6N/JqiCQIgkFxhm3kDa3x91yZE
         odkGyeCSrGRxc86ru5Mwi4Qy2PoAhec3QIr56yeC8zGbvekODzrUBAaMxvD/Wo+4/dhz
         U5wWyE/8qLLBi07QlxtKWaKPfGqjOjCJaKjqZ5N5qJOO+N8K6DYCdJylWu5uW3Uugny2
         k4BUNJoEIfEj+CGxXw89yOaNQKEnFaJJBMQpFf9hn/OTCh+QEhXnZcYuP/CFmeKcDHQd
         rX+w==
X-Forwarded-Encrypted: i=1; AJvYcCVVGsLUWmsiLwIxmIaPVwvEkmJ8cGgWQSCNxEgAH9K5AiQAPsxAZ515KTHgxmmEkNNyRByWgl2gs0Kqkk1RjPZ9@lists.infradead.org
X-Gm-Message-State: AOJu0YzI+YP7vQkerXj6Hf6f5g+2ujQIAXb1AfyDGQkmUYVTo57zoFWN
	3hSlBShu4AcaxPah32EMGx7eMDfe7wa9N979TiFOQnpUQ07me2lWgrxp
X-Gm-Gg: ATEYQzwsUuy8KC5c6s5YMG23cG0+9Hqlp2yBFlRHErL0+uwDgrcbD4OO74ZJN6LTfyF
	rPrwMGHPVAyP8uOjsBRdxhMil/5PGYXeG7AAyEJTwbLkHluUhDyCxeAPKtaXVFCEViQ/OOFy1hp
	HXpTh2TlQZZMfOD9hl0P7BLMzLQD9ouL9CQ9k/o+avR3lbx/6/Y372uZLdnmyziui/DaHB3QY9o
	SvD08V/BKxM5GS0i4w4aREzKwuv8WTD4D/MRs9BnsgGeU05KW3Ffdf3gTM5khLUhLKAU0W+U6SD
	Pcw4QIgYJVfobAZMbQ3OKKe+DhJufed7VREwnYanDmkpRD9OSqxUh1bcuksHFnP71fbUT2REVoS
	Wnbhhxn4xry8pOcXZegOG/FAh4bcPCKY7kecShb/jFo8eas8DdFYb2JYAAhrTGpGdixBnQ2L+TB
	xGdtaxvM8dlaK4y1nQiBL6UmXIkp09douLuhxqlmv+WhcGgt+g
X-Received: by 2002:a17:90b:6c5:b0:356:1dad:1b07 with SMTP id 98e67ed59e1d1-35965cc9b4dmr3070943a91.23.1772205305387;
        Fri, 27 Feb 2026 07:15:05 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.69.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5485848a91.8.2026.02.27.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:15:04 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Fri, 27 Feb 2026 15:14:35 +0000
Subject: [PATCH v4 5/5] dt-bindings: arm: atmel,at91rm9200-sdramc: convert
 to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-arm-microchip-v4-5-7e2ae1c5b5d6@gmail.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
In-Reply-To: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071506_929142_00C67805 
X-CRM114-Status: GOOD (  13.96  )
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

Convert RAMC SDRAM/DDR controller binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 66 ++++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 20 -------
 2 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
new file mode 100644
index 000000000000..ac7e0f454a34
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-sdramc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip (Atmel) SDRAM / DDR Controller (RAMC / DDRAMC / UDDRC)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  The SDRAM/DDR Controller (often called RAMC or DDRAMC) in various
+  Atmel/Microchip ARM9 and Cortex-A5/A7 SoCs  manages external
+  SDRAM / DDR memory. It is typically exposed as a syscon node for
+  register access from other drivers (e.g. for initialization or mode
+  configuration). No interrupts or clocks are usually required in the
+  binding.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: atmel,at91rm9200-sdramc
+          - const: syscon
+      - items:
+          - const: microchip,sama7d65-uddrc
+          - const: microchip,sama7g5-uddrc
+      - enum:
+          - atmel,at91sam9260-sdramc
+          - atmel,at91sam9g45-ddramc
+          - atmel,sama5d3-ddramc
+          - microchip,sam9x60-ddramc
+          - microchip,sam9x7-ddramc
+          - microchip,sama7g5-uddrc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ddrck
+      - const: mpddr
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    ramc@ffffe400 {
+        compatible = "atmel,at91sam9g45-ddramc";
+        reg = <0xffffe400 0x200>;
+        clocks = <&pmc PMC_TYPE_SYSTEM 2>;
+        clock-names = "ddrck";
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
deleted file mode 100644
index 14642384bc87..000000000000
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Atmel system registers
-
-RAMC SDRAM/DDR Controller required properties:
-- compatible: Should be "atmel,at91rm9200-sdramc", "syscon" or
-			"atmel,at91sam9260-sdramc" or
-			"atmel,at91sam9g45-ddramc" or
-			"atmel,sama5d3-ddramc" or
-			"microchip,sam9x60-ddramc" or
-			"microchip,sama7g5-uddrc" or
-			"microchip,sama7d65-uddrc", "microchip,sama7g5-uddrc" or
-			"microchip,sam9x7-ddramc", "atmel,sama5d3-ddramc".
-- reg: Should contain registers location and length
-
-Examples:
-
-	ramc0: ramc@ffffe800 {
-		compatible = "atmel,at91sam9g45-ddramc";
-		reg = <0xffffe800 0x200>;
-	};
-

-- 
2.43.0


