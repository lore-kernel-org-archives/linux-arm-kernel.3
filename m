Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7690FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePgSZPRRbECh1C3ufz9sKMRvaR3CgzOK7F/YlViJ0LU=; b=Z4qQKd+GOILTuDqIyukB/2solz
	hpOMNp0b4hxwyO1B+k8Iq52f3649fU+I3m8yi+QNwlCBk80wpaJeBMfkKt01FOC8xtXTkhj/N1P/S
	xVVecFPJ1Fu9T0ozxDZLnBZcPN9XhYyI1vdwyphZW0gV6mNtB9xTJW3WV21hCrNzcfHWXUQ+70zjc
	u+tyCoD4QZAuRaD7sChc4c2NJUWMAuZ5SBcxQ/50xkWhiAhVu2FAg7TbLRxsAUoR8RY6YHq0P055i
	bxxzh6W2lM93cL4kOPPyXWogYvWkLr48i7am5ak2te5ubyZSRgfAc99uosuSnF8HAhohAEmsRaEmu
	i9AFMpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYW-00000008Z9N-1evH;
	Fri, 27 Feb 2026 15:15:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYT-00000008Z6k-24IW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:15:02 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so720092a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205301; x=1772810101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePgSZPRRbECh1C3ufz9sKMRvaR3CgzOK7F/YlViJ0LU=;
        b=hH4IHCLw0bN/34nFaHPWytF+mTJ56FwJR9GqevCyqepjAwi42wswBMAJx+r4YBa8D/
         rgr0ZCRaWN64eiM9OpfULt/xIjkuKhbzKFmbNgIPwfmiQlH8xA5fEc5wHPyxGCPFLpIf
         ka+5VAmya9oLsfaSJHIYf7RSPmSNLjubfHzbQD3qlzKW5EIukl+bHnRm6h9bXiJScm7k
         L8PuCHtwpjyR5dH2B/le8EA4VYPmjKoEANXmojRR8CDu81s9tCdDD8VUlN5r953qj2m/
         6qMq5+qQ+fRBNBkMi+wDDAy0esMdH8PE9TuvV14A5fL0oBDxn9OIOgnShqMV/K3/AJLA
         Xpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205301; x=1772810101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ePgSZPRRbECh1C3ufz9sKMRvaR3CgzOK7F/YlViJ0LU=;
        b=cBfrDV4Pv051qnPisQGo+gwzvSSYNPkV/aLbkQh3+3w2BAfe87k8qoDeXSrndEiWWm
         i62lc1PSuHwu7+WoMLBW4xCgVQEjWwgE/xACsHLF99R0mpI+3cIXuwCoyXNeKA4tlX2P
         Bi8EMLxaAqO1tVlzQXCTbmKkL8O7xdQbyAZKoZonI0wRF/8/Wl7ZoMUvTXoUjdstjgQb
         YtQi0muENVUvnpjGO/6il9IBOzo5jkVl4Fj9tqIOEykaCB3n0CbVEOkkg/iJWVaPRvRn
         6rrGYc6EltjGCtvYr0dq8puoZAg7fgADIK+9UJmM0tkOQ2U2eSi6FujZQMIwGLoblP1/
         E0rA==
X-Forwarded-Encrypted: i=1; AJvYcCUc1Yj92Qif1hpzeF7K+45L07+PBF2dFJElOJDhiOXYFPhwmRFsiyb/E6LJDfhQoNNIgl/Xd4UywljJ/EBD0sIs@lists.infradead.org
X-Gm-Message-State: AOJu0YxcUxROxUOM5cIFtZiyfNlrt7CS2n7/JgE1n+8kBLpH62q2Uszd
	qBADlM0YIqK0h1t/URBYyWvezv63KPXBz/XxBM3iKyYPZRvvfGPr+E9z
X-Gm-Gg: ATEYQzx/8EmguMiykiS2e5EExRemcsteHavTJqBhCwItyJKxWCnxyR86l2a+n6lcEfd
	7Gp+iD7iii4gyuokfR49DdCoByMtLaC48qz4OjXDqO47igGVYLB7lEhiu4dx6vkp4u6hPuoOMbn
	IziKfm6O8w3CtVWdz/355vFqEXT16wrkFpZe9P4FBVEOMTPLyGags2SktQCPiWV5PGBol6fzfky
	8kYMfHubgqMI7m/OL3e2zonkJoZZjV7S9tEJDabU0iX4u25fg82clUV64S45FubHLWTcswizZxI
	YMfGhSOtuuz64Qwf+EiCtlbJZQ3WDnt8X7zaQqht33aI+yw5oFwAVpDik8ORxYOzDc8a3N2snlF
	xA0ckwUZfU9mX/23mXQ7fixnK3/hCtlUEWgQMRQOBqEbgGbyNVf9aDkjRnndf7AY58JY5f2ZpxE
	kZ+mFQ3l22E9zLj5VC2EKSy62MM11Ph1kmL9w3mb6S/y1TB546
X-Received: by 2002:a17:90b:1809:b0:359:2099:da20 with SMTP id 98e67ed59e1d1-35965cd0b4cmr3771969a91.17.1772205300796;
        Fri, 27 Feb 2026 07:15:00 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.69.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5485848a91.8.2026.02.27.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:15:00 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Fri, 27 Feb 2026 15:14:34 +0000
Subject: [PATCH v4 4/5] dt-bindings: arm: atmel,at91rm9200-st: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-arm-microchip-v4-4-7e2ae1c5b5d6@gmail.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
In-Reply-To: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071501_548869_61EF0E13 
X-CRM114-Status: GOOD (  15.66  )
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

Convert System Timer binding to YAML format.
Changes during conversion:
- Add "#address-cells" and "#size-cells" to the properties and required as
  watchdog is defined as a child node to the timer parent node.
- Define watchdog as a pattern property along with unit address in
  examples.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 69 ++++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  9 ---
 2 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
new file mode 100644
index 000000000000..3f6a934a2a69
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-st.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel System Timer
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  The System Timer (ST) module in AT91RM9200 provides periodic tick and
+  alarm capabilities. It is exposed as a simple multi-function device
+  (simple-mfd + syscon) because it shares its register space and interrupt
+  with other System Controller blocks.
+
+properties:
+  compatible:
+    items:
+      - const: atmel,at91rm9200-st
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^watchdog@[0-9a-f]+$":
+    $ref: /schemas/watchdog/atmel,at91rm9200-wdt.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    timer@fffffd00 {
+        compatible = "atmel,at91rm9200-st", "syscon", "simple-mfd";
+        reg = <0xfffffd00 0x100>;
+        interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
+        clocks = <&slow_xtal>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        watchdog@fffffd40 {
+            compatible = "atmel,at91rm9200-wdt";
+            reg = <0xfffffd40 0x40>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index d0561f7f465c..14642384bc87 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -1,14 +1,5 @@
 Atmel system registers
 
-System Timer (ST) required properties:
-- compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the ST which is the IRQ line
-  shared across all System Controller members.
-- clocks: phandle to input clock.
-Its subnodes can be:
-- watchdog: compatible should be "atmel,at91rm9200-wdt"
-
 RAMC SDRAM/DDR Controller required properties:
 - compatible: Should be "atmel,at91rm9200-sdramc", "syscon" or
 			"atmel,at91sam9260-sdramc" or

-- 
2.43.0


