Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E68BFEFB5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4E6HXkvhuNIpYntCK6bZF0992wJwuTJEJOmXq3XUUw=; b=1267ro1/sF6B/XYJicm5b+wpDK
	Diipx6V7JL9U2jeBHq2KExdqGVsl06dNS/apBwqFwSkB9z6OTXungxelQoTTOUkIikW4/s6wL3lhT
	pqEb4pYHS/RN+R4LZprSZNVMJNwIteIUrNCHFyNL0DDdH3U6TXU2I1hOg1HAJ/U6mq3aHhJbwrG8F
	dC2c+JsBgDQBLl0WxdF/j2B74qUVmfaV9583G8b9J3JIBQoaIp8hKOQH0bmPKwztcroKxP6En7xV/
	cqSrvtq4tXhzzcJt7E4BO6JTQpGUqT/BAs02IirIxCHiGi3g8lRohIi1nseWnbQJSL9bh+2X9wGfh
	Tlja5clQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYW-00000008Z8r-0GxC;
	Fri, 27 Feb 2026 15:15:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYO-00000008Z3A-3wak
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:14:59 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c6e3e4e7388so834954a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205296; x=1772810096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4E6HXkvhuNIpYntCK6bZF0992wJwuTJEJOmXq3XUUw=;
        b=csuRHru2kESkAeuK2GVxyzJL9OSC65W1vnlZe1k0hPJfinD0fEd5MKzscbRJUpPlcd
         TKTXyZHGDdB8Uh9RMpBk2pY62V/LIOdXN/LA+PQYZ6uKlFedRuyEcojo0drHaeK9Rkny
         o2pY2e9r9gN+cDqK2SUk+zVq5K0KYNPIF3+u5zOS/62bSCOcMk2GWSI7EoWogwsLSxx5
         Hzw/EYJBu3gi1PwtIOQa17lBEP6FoIFkwN9jcy5IshWHa2YQpsZniwXKUfVGE4rgc/TM
         uADHL+Y38veDltqdjh+K+0sbmvrDHkdsvgcfqAQoR2o0XYwnm/OBiCJns7PPjVCXJLOY
         VaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205296; x=1772810096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f4E6HXkvhuNIpYntCK6bZF0992wJwuTJEJOmXq3XUUw=;
        b=FvFpZTZs/8ss7caBiQFtrX3OkJAbEi3O9F/iQze+xi+T0UmthmQWEB4FkMut8I6uU+
         EdMD/XA9UiBnJ49+ulNhHtzu12t82xstVJrkntTM+F9/K6I8oADoaa11JtmtoDX2yIhg
         O+3rmfu2WdqpJaChK6rwSgEE9mAbNBgsjEM1wTYPgfjWz+FZ2obILiFmSk6qn8KQkxl5
         NjAdYOtHRWUyXExjiTc8QsZOHiInAnNFoKdBX9Emp8+8kdMphd4b7J81H6tiahLOLYKF
         pyVQaNxZMYKnpFdkER+anju5YVucoF4vDaD1OERF0KCGE9Z8rGAVWuDQ0+zzHL6MtkTv
         z0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXyVZO4HrdhH7T7+0krB2D31HQuKXcv1ecXllQ5t8t6XGEXINmimkpROwxMf2wPboSKaPAnBJ5+R9/mNhRg7/T0@lists.infradead.org
X-Gm-Message-State: AOJu0YxW2N/K6Bn5i4yFMlI+oF1kt25rmhrBgq6t4D6+sUi2+FbjsLdj
	1T51Ihz/OaQ0hc60gcfRWCr8QkQGq2LRXQUrlBjlKRpIzIbGFWVoOgIx
X-Gm-Gg: ATEYQzydeeeW3ZFaU3lKSM9zJCVmw9mYcQ7VjptxRItVcVCbIlDQhvcJRHLt8zdcdHp
	lXkQJJ+FqmZlvgMJjqI92rco/PqaVzqRH7VzuCNN/d6YYfD20Kwlm91wWLPjTzUVxu895GdnuBR
	2JXWm+lm1OWFKs0QF5ppDh82tBwPx81eEGLd0zC2K0yDdSptz7Fjr0xO/BsmM0VIgMa3Ky/K3Hh
	wUb45WDLemChdjgjsXh6ZotJyxyq7eOpDjv2I5UQmOyL9tbi7clFsEwVbc1fNW+1BBrC97pPx7t
	EBAXlOls6VBAIQKIILn4R6wqVXdvZ8+p74CGYAcpZH6i6d1fmcjJEDF10UXQGmDFSQO/xN8FJiC
	OSKw9FTK1L5kTNcOdSgKjkCBulrmKYPAcOZBpSlJVQqnyjMTDYjUjeCLLoZskG0bn2ivgHiME4t
	BBUJOkN/6KwzpA9jOlMMMDFl13GIUbJ6Ghf19ey76hMjSO7g5AXvk89aKwQgQ=
X-Received: by 2002:a17:90a:da85:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-35965c93b31mr3629448a91.16.1772205295979;
        Fri, 27 Feb 2026 07:14:55 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.69.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5485848a91.8.2026.02.27.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:14:55 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Fri, 27 Feb 2026 15:14:33 +0000
Subject: [PATCH v4 3/5] dt-bindings: arm: microchip,sam9x60-pit64b :
 convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-arm-microchip-v4-3-7e2ae1c5b5d6@gmail.com>
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
X-CRM114-CacheID: sfid-20260227_071456_992518_8623AFC3 
X-CRM114-Status: GOOD (  15.34  )
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

Convert Atmel Periodic interval timer of 64bit (PIT64b) binding to YAML
format.
Changes during conversion:
- Add missing compatible "microchip,sama7g5-pit64b" along with a fallback
compatible "microchip,sam9x60-pit64b".

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  8 ---
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 70059f66f2b4..d0561f7f465c 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -1,13 +1,5 @@
 Atmel system registers
 
-PIT64B Timer required properties:
-- compatible: Should be "microchip,sam9x60-pit64b" or
-			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"
-			"microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for PIT64B timer
-- clocks: Should contain the available clock sources for PIT64B timer.
-
 System Timer (ST) required properties:
 - compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
 - reg: Should contain registers location and length
diff --git a/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
new file mode 100644
index 000000000000..f00ac7e858d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,sam9x60-pit64b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIT64B 64-bit Periodic Interval Timer
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  The Microchip PIT64B is a 64-bit periodic interval timer used in
+  several modern Microchip ARM SoCs including SAM9X60, SAM9X7 and
+  SAMA7D65 families. It provides extended timing range, flexible
+  clock selection and supports both periodic and one-shot interrupt
+  generation modes.
+
+properties:
+  compatible:
+    oneOf:
+      - const: microchip,sam9x60-pit64b
+      - items:
+          - enum:
+              - microchip,sama7d65-pit64b
+              - microchip,sama7g5-pit64b
+              - microchip,sam9x7-pit64b
+          - const: microchip,sam9x60-pit64b
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - pclk
+        - gclk
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
+    #include <dt-bindings/clock/at91.h>
+    timer@f0028000 {
+        compatible = "microchip,sama7g5-pit64b", "microchip,sam9x60-pit64b";
+        reg = <0xf0028000 0x100>;
+        interrupts = <37 IRQ_TYPE_LEVEL_HIGH 7>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 37>, <&pmc PMC_TYPE_GCK 37>;
+        clock-names = "pclk", "gclk";
+    };
+...

-- 
2.43.0


