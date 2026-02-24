Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B3BF3C985
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjdpMyB6qGuRoWUV7GpKDY315X8Hm3FSv9zQSVKZysU=; b=iZGnfYzRjd9GKG9Ds7dY3EQZ7e
	fFHCeRZTKtsN2ViOtAdeNH1gHmRMYCp/blStl68zcfDSSx4YIaCuAlC/PX55RPMa1WNig2h17ehxj
	4z14KW+AkKtEtaIaXuNiaRf5LNrx/xdKXEmrAfjgXlbz9ms4rkYI3VAniXKUDEvw0whA5K6+VFp4B
	TVgqoqS+aAwQ1fHaAlLcStORK1AI9yGSKg6QN52PpfIkB7f05M++JiMq577tLDqHM0qhgj1SadB7w
	clklgFPSP5rA6Wtou+Z17HKNlbhNJ3g4z2fvCAlhyov8wgeGMsdooSqSklbSJ1q7Wq27LNLEdtODD
	UjAEgcEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuth7-00000002GR4-3lrc;
	Tue, 24 Feb 2026 14:47:25 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuth5-00000002GOr-0OCV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:47:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82418b0178cso3344614b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944442; x=1772549242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjdpMyB6qGuRoWUV7GpKDY315X8Hm3FSv9zQSVKZysU=;
        b=gXmLmynxVoFLLiFcTE7yfh6BrK1tc9l6OB0sgrcV+X3CH/hEDiA2KmnhhsPKHnTlbv
         v+v8adoJ1Nd6Vu2n2TqRKF4FSf/V2N9Le1SoeB1zF7Eedc54fOxjW2RiYft/CsFvMHtt
         VbIYKynd0NjIvhr1Wy0GXKbpn4Xjlf+nUBcBYgyeIRqO3mJlyHcF6yje+CA0/1at019L
         movazpQNcHbHSGO/+KlPxvu6vbBZ3JDKNPXjM130lIwjDat2E+ascammZMmygZwGmf9Y
         LtkLMbe14m1wX9wwgQBd3ZvsNensXqHHfJpRKGY9p7hZfgBnCHI413GIWwWKSIUzzBHC
         99PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944442; x=1772549242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zjdpMyB6qGuRoWUV7GpKDY315X8Hm3FSv9zQSVKZysU=;
        b=sXwZgtxDUwUsPyoMk4hF8NgmMf+uexWIWJmjs7r0Iog4tQp/ZRjfDbQCbY47Mq2qJi
         Tvou2GMA43TaX8kXl5oXv6p5tSkA+772lHXfvKy7FXHOLUqnGubT3XVJcyf3jOZ9UNdE
         HQF1bBEREZY4GdA68N93bUtbBrIaUMKHEuH9A2hoMxWXsSBkbeRnprfLhoEcaKiVVtDi
         tas8Ek48+Pf6k5lt6CGwxkelL+vu+2B9lgw84v/tBxZ1snnEpyovJvcBqf6BHrx2es7P
         wXtUNhlYi2WR7aLdDw38wdwtn+ideLE/++VAIOO2qy5NTQ9OE7zNTmuGNy2suKcw7ZEd
         CivA==
X-Forwarded-Encrypted: i=1; AJvYcCUynZV+C7+MzjINMGYzZ25mRlbaTi4Ndol4iN+j/9A9fjb2CJjKe8S0B3taV+Vg2cPIqjOa7Do3QsP2YlSUrTKt@lists.infradead.org
X-Gm-Message-State: AOJu0YyFLVAMtIpk3o1gYo/PrEEIDLeTIAan7VfduVPx8GYff7d7d9yI
	8MvwzvS/yXFVKp/oBWWxipbO+U7sNbtVIsVTurvo2ZkrcnwK0+fZCWdP
X-Gm-Gg: ATEYQzzhewdJBNdx0hRFmaSCDW+CkaB4nLwMxoG1Z0fxaLAihc1eHKloY/ncRrhUYWs
	6RBMbJEv9N1pO0d6628s+ZRMrMv3ZOegITpM5bjP4aIKmpNGNuj9wsgKViQxXR0jyHpv9eelCJX
	Clp0/7F9faaKZK0vLEIdcrSUkDdv76LPozIYfVVAfqYEmOXWFww8IJE+fszOtp1ET9913PFEf3l
	jpWGdFN67/P/syFVypFlZQfOzabfKB/CT2DVMKn3qyUgAvxfMFGTRoLnJ2rjpBZnKBRWzSMgldu
	9GZ6pPRMvGGvQxFjMBho/EzEkkh2pNWA1MIvu5EZ/44hraJSrCXqy/T/er1sfBXbxBt62zAkGQv
	vqSqfLZSB1o9DctlxX6EhyubKeyZ22QO3zyZOuu0dQ6Jq2a1hrBOg+x7UWjy0babzIVBiPvMkTo
	YB6cmpyJpYlKHx7KTW0HdsyOY5eEJBxJsXHNf42+uLcuowE2j1
X-Received: by 2002:aa7:9a87:0:b0:823:9c0:47a8 with SMTP id d2e1a72fcca58-826da8d7c65mr9910568b3a.9.1771944442106;
        Tue, 24 Feb 2026 06:47:22 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.64.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-826dd64367bsm11149895b3a.4.2026.02.24.06.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:47:21 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 24 Feb 2026 14:46:50 +0000
Subject: [PATCH v2 5/5] dt-bindings: arm: atmel,at91rm9200-sdramc: convert
 to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-arm-microchip-v2-5-8bedacd2cdcb@gmail.com>
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
In-Reply-To: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu@tuxon.dev>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064723_149482_4ABDD5E2 
X-CRM114-Status: GOOD (  16.10  )
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
 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ----------------
 2 files changed, 67 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
new file mode 100644
index 000000000000..2cc07a772063
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
@@ -0,0 +1,67 @@
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
+  - Claudiu Beznea <claudiu@tuxon.dev>
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
+      - items:
+          enum:
+            - atmel,at91sam9260-sdramc
+            - atmel,at91sam9g45-ddramc
+            - atmel,sama5d3-ddramc
+            - microchip,sam9x60-ddramc
+            - microchip,sam9x7-ddramc
+            - microchip,sama7g5-uddrc
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
index 5ce54f9befe6..000000000000
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Atmel system registers
-
-Chipid required properties:
-- compatible: Should be "atmel,sama5d2-chipid" or "microchip,sama7g5-chipid"
-			"microchip,sama7d65-chipid"
-- reg : Should contain registers location and length
-
-PIT Timer required properties:
-- compatible: Should be "atmel,at91sam9260-pit"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the PIT which is the IRQ line
-  shared across all System Controller members.
-
-PIT64B Timer required properties:
-- compatible: Should be "microchip,sam9x60-pit64b" or
-			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"
-			"microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for PIT64B timer
-- clocks: Should contain the available clock sources for PIT64B timer.
-
-System Timer (ST) required properties:
-- compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the ST which is the IRQ line
-  shared across all System Controller members.
-- clocks: phandle to input clock.
-Its subnodes can be:
-- watchdog: compatible should be "atmel,at91rm9200-wdt"
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


