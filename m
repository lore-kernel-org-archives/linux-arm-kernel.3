Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B8CE9A020
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrbi/BNck6gogzlmgUXX3Bih1hj4rkVvdTxnIGaO4yo=; b=ZD0nSYVK/yNZn6sj7D8lPnQgs9
	jHjZt6Lhrfe50I5HnZMZcH9D9SoewbxwtsmPv8RdYdLUABhOdc5MoVkbjLU3o1ORvtrNpS+dxIWX8
	Gqj5ZUHfYnkL2gAGZzLwCZDOavfkDtnO9zk2NHD3+IAZCzTu24ERPCoToTcsORR2ljhSVn0ArA/ZN
	SlNyi7FQ7TyylursoTd6qtcZdEsrW1Jfgwv9P1MbixnNrZ/cTI9nQjqLcYM/x9+OdzL+OL3L4ypl7
	xJkLSXLIOWqP+/XO+B6cgYL3+4ybqI3GrIjKZACXLVCIQ0Qh4sjsLNMI9us4XtUfR8Xg9NaxkbCZQ
	RKTic74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoX-00000008eTk-41mS;
	Tue, 17 Feb 2026 17:24:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoV-00000008eSO-1Kcc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:24:44 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a7bced39cfso46159915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771349082; x=1771953882; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nrbi/BNck6gogzlmgUXX3Bih1hj4rkVvdTxnIGaO4yo=;
        b=euChbzBJ1f8cz+HXndwPXncOweAMACwSfd4gu31ok8ll/Bzb9Jy9V0vimEpEyIkNOJ
         NcmGH3+vILGEOjST4I7qGL9DOVwIR0BbRgo5rKlGXOIfC0KI2/WFKYXRPvUSocCgDgYZ
         k3CGPOeqqYBBkVhkCygHxLxmjhAyhcGvKAxr77HR5ztrysRFA324tlB1p46mdlwl7a1b
         lZ+w07AFbAaWz/o3zvnHyDOBQ88wGvvgqvsb+p1Tel/DAvBL54GLBQeCU9bGMZrgmySn
         417uy/GsG2ncXxS+ocMPaqv/1kU6u6dUcKy8SRKm5LltukvfwWErnbb3CbKih9+55ldw
         0TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771349082; x=1771953882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nrbi/BNck6gogzlmgUXX3Bih1hj4rkVvdTxnIGaO4yo=;
        b=ZcdmsyoO3gGcnnrAZybf1cxDm8LUi9xdCvRrf5GcchTMbthRvJhI9ghyjrRIgxFXd3
         YOYpR8NVUw75zO3k4ra4BDT4hPqWP6N7BFOd+H8W3kuEP1T+6KO1ISTMfR2UogghCuXe
         GplTuKmkBOMOmktNeuP7tzZ1j4boD+CDPeLBAlddU5tXdJVw3lEs92yzOdKYf+e9t1KM
         jjWU4PpYbZCz5rZ9y9lDxTDWMIMa5BL9/6LWexXKeQtI6mcSx/3kNAHLW7I73ncfyc15
         RsONP4LVl4Ae38UAvQ+jc+B7IpZExliWzWaZz/oAfREB3bA/3Gw+j6MAZmK/WtUvZ/MA
         G8gg==
X-Forwarded-Encrypted: i=1; AJvYcCW0GTPaKQ32VCKjtHd32/dNUVp2mnuNsYZPti1sqeDdaaEyKgJuODsHXJPHzieNNnKho8MEcGjfIorCxdZOTKKK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9GdEuV3o6W7/6KmWYXvFqB4/CnTKq0kv1rbt674J3qN3VB3fl
	mHPemZxmcp35DgR1yWXpHwp8hrvvxy0aw1hbL4Ps4aEaU8vbSS53y07/
X-Gm-Gg: AZuq6aKCURR3jkN6m3g7/ozmyG+ZgZ9VKEmUnyv/7XufSIMxK4nsnKlHjOJYW2UzGWq
	/Uuo8tYSxz6zOcAVymbJwIYTZHvVZlJNt85kZzkV6/xKhTTB5BcvdvfRqB9tsgyOtJhruSOoYRk
	VPQDaNBktduVVD+WBfKUFBpBa9oj888AfF/gxsOo203keQf8hXv+hht+DiatRQBSCjIkzH84vSO
	3V0gPLptwZWOpSeuhuvbSUhUWIbHfxtci7CZ+ucJB441h/4wPysAdVQxDr4cvJb9fHFO5doqM+x
	vGozlhVEuY3HllzYvRtrXjrSnIQx3V26cXBBi2yosRdYKCizUNMblTTzQnrsfKAr0Qd/txoGdJ/
	zqJl125A+fp0pp4Smvy6RGfV0URZFVnwOADiGk5/yeWcXmJXNguUj0Pmiwa7lGIYIXVy/T/QQw0
	GHAdZd8HJLbwxQjtXLPMXqw9i4URnsOrtY16H/LUe4ybDXy6ho8xm2b9VlZSQ=
X-Received: by 2002:a17:903:1b6f:b0:2a7:5751:5b27 with SMTP id d9443c01a7336-2ab5059ac0emr180983385ad.39.1771349082331;
        Tue, 17 Feb 2026 09:24:42 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.109.65])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ad1a7145cbsm146880305ad.30.2026.02.17.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:24:41 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Tue, 17 Feb 2026 17:24:21 +0000
Subject: [PATCH 3/5] dt-bindings: arm: microchip,sam9x60-pit64b : convert
 to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-arm-microchip-v1-3-ae5d907e10e3@gmail.com>
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
In-Reply-To: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_092443_691260_0A413F7E 
X-CRM114-Status: GOOD (  13.33  )
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

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
new file mode 100644
index 000000000000..6bf8e81d4c72
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
@@ -0,0 +1,71 @@
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
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
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
+          - const: microchip,sama7d65-pit64b
+          - const: microchip,sam9x60-pit64b
+      - items:
+          - const: microchip,sama7g5-pit64b
+          - const: microchip,sam9x60-pit64b
+      - items:
+          - const: microchip,sam9x7-pit64b
+          - const: microchip,sam9x60-pit64b
+
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
+    oneOf:
+      - const: pclk
+      - items:
+          - const: pclk
+          - const: gclk
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


