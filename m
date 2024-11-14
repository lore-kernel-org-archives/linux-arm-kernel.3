Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93874D65C56
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bNkA9+McOFr4dA0w94szSWPTGnjmhGVcIjLVtGxtAME=; b=cKl//lpmte/sTdDGu01vm1JF8Q
	qukrv3tEICfy+UbS4L4ZHxt8x9Oc122W7LT+oGPLnfDnEoU7wVwqK53ENLGEn4ebo+b6GFWGeyeSm
	EC9cmuMPbfXfg/SUBGWVE5Dhd/oZnp8mhx+6BDoJdYQZyIAwvRGZ4PzM247qX0FWFFpa8RGTUDC9x
	ZPhIdRJ9fP8YtF54SHzBaHjQ7p1gLXlEyOD1ReVxAPRIYDNyOJyGPD9DxAF12TETxE/koyqwjytw0
	7ThWfkyhjsJGy7x6FUu9ixZ6BpdhEVXqMTSKDi/TtNF1J7WdqUX++Uzx+cQJ7PfNfBTklzZUWhIof
	T3nAPPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUGm-000000095H5-0viH;
	Thu, 14 Nov 2024 07:28:00 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUEy-0000000953i-14DP;
	Thu, 14 Nov 2024 07:26:09 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so378260a12.2;
        Wed, 13 Nov 2024 23:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731569165; x=1732173965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNkA9+McOFr4dA0w94szSWPTGnjmhGVcIjLVtGxtAME=;
        b=M+Es+1K6rzJMknY+NigtUjZ/K1Yjh/15hbk6MSUxNfnRuUmqDWCfsCbgF07117PzOc
         tJ85ufw0XhyW66u4LsO3zGaeJOYGEUbk3daesCXIPODJFREVZDSPPBEBKI3a4qRuwSFO
         /fFbkrgvEnZ60J7MEPSgjBvMzqWGdPzyprlnuJRlt6phAuwZkPyfrybH0fi7M79yd67h
         4Z1dgYsVC83DAyh5I2aKFzu3wmrXAnBhPBB7WoZAyk8uqiaR9ubUrjDounCKobBCreE3
         /P9c7TCBvvCtsYzGp2g8jpSa8rspTP2F9i3ebi8VSM3Cd+93IlA4//tqRXLlVCO9THvq
         lVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731569165; x=1732173965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNkA9+McOFr4dA0w94szSWPTGnjmhGVcIjLVtGxtAME=;
        b=Y1NzIuiG+jQgKLp/pU3UOQF8ujck/QC1r+B+c6c64hg3aOM8r2AumK4373Ox3sLyF8
         ADQIpAIvWLn++2TKtaBQJSuL5cTSMUozl1Ws8QVn6RCjeDaeQD+Np28xfe6d0l5426tc
         zTIcsi69uueXCBjB5fSoDzJgFshY/6euOh8a59lCzFaQUacw2gdZHHQDBpdFXBQmcwN0
         GAgwob7JUJJP/Jr8Pfhqn85Y9gdWrlfih77smeHjoXDvNq7y9dlKFonuf6bPqKDBGYNg
         Dyb7I+wXQVCgRjiTgCS1kAxHDXR+AcOqxGn/DdSgfeTAfiIzE1y7vrHyF7J80n9P2vOP
         Es7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUL2DN77jFV0aKG/Y0drrKVyOdHXwyzqXCECKKiWHtdPfN6I5X7AWHR3smN0rHqoQte6YgXqO/0X349RfUJkSA3QQ==@lists.infradead.org, AJvYcCUbrkcQrO3CNc3zZ9x6a57SuIbREiRAyUjUEFaeNTPk31T1Yj1pGUP+uQbreN26Z7kbgYUlopesDw5CqXLM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7PXj2+ccvpTEdsDrpISZM0p5r7FJckcI9bbZREKIYyGNHG8RR
	6J9E1JVL32ieOl/i+5t0No0Dp8T/QN0gYrXpjP4R/2KJiH9q7Yy0
X-Google-Smtp-Source: AGHT+IGQE6v7az3F7eG37+YiLYVejzaNRHdYZyYAeB3vYXSjFWlp5ZvBEPVy62Z6p0EeXfVETVGQvA==
X-Received: by 2002:a17:907:7f1d:b0:a99:dde6:9f42 with SMTP id a640c23a62f3a-aa1f8105b9emr569468366b.47.1731569165173;
        Wed, 13 Nov 2024 23:26:05 -0800 (PST)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e0869cdsm28700466b.192.2024.11.13.23.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 23:26:04 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: clock: actions,owl-cmu: convert to YAML
Date: Thu, 14 Nov 2024 09:26:00 +0200
Message-ID: <20241114072601.265011-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_232608_320949_019097C2 
X-CRM114-Status: GOOD (  19.21  )
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

Convert the Actions Semi Owl CMU bindings to DT schema.

Changes during conversion:
 - Since all Actions Semi Owl SoCs utilize the internal low frequency
   oscillator as a parent for some clocks, require it.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
v4: change double : to a single one in description
v4: add tags from Dooley, Kozlowski and Sadhasivam

v3: list the headers in the description
v3: match properties: order with required:
v3: add clocks as a required property
v3: drop unused example node label
v3: use the preferred four-space indentation for dts example

v2: drop address and size cells from example
---
 .../bindings/clock/actions,owl-cmu.txt        | 52 ----------------
 .../bindings/clock/actions,owl-cmu.yaml       | 60 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 61 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml

diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt b/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
deleted file mode 100644
index d19885b7c..000000000
--- a/Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-* Actions Semi Owl Clock Management Unit (CMU)
-
-The Actions Semi Owl Clock Management Unit generates and supplies clock
-to various controllers within the SoC. The clock binding described here is
-applicable to S900, S700 and S500 SoC's.
-
-Required Properties:
-
-- compatible: should be one of the following,
-	"actions,s900-cmu"
-	"actions,s700-cmu"
-	"actions,s500-cmu"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- clocks: Reference to the parent clocks ("hosc", "losc")
-- #clock-cells: should be 1.
-- #reset-cells: should be 1.
-
-Each clock is assigned an identifier, and client nodes can use this identifier
-to specify the clock which they consume.
-
-All available clocks are defined as preprocessor macros in corresponding
-dt-bindings/clock/actions,s900-cmu.h or actions,s700-cmu.h or
-actions,s500-cmu.h header and can be used in device tree sources.
-
-External clocks:
-
-The hosc clock used as input for the plls is generated outside the SoC. It is
-expected that it is defined using standard clock bindings as "hosc".
-
-Actions Semi S900 CMU also requires one more clock:
- - "losc" - internal low frequency oscillator
-
-Example: Clock Management Unit node:
-
-        cmu: clock-controller@e0160000 {
-                compatible = "actions,s900-cmu";
-                reg = <0x0 0xe0160000 0x0 0x1000>;
-                clocks = <&hosc>, <&losc>;
-                #clock-cells = <1>;
-                #reset-cells = <1>;
-        };
-
-Example: UART controller node that consumes clock generated by the clock
-management unit:
-
-        uart: serial@e012a000 {
-                compatible = "actions,s900-uart", "actions,owl-uart";
-                reg = <0x0 0xe012a000 0x0 0x2000>;
-                interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&cmu CLK_UART5>;
-        };
diff --git a/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
new file mode 100644
index 000000000..28396441b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/actions,owl-cmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Actions Semi Owl Clock Management Unit (CMU)
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  The Actions Semi Owl Clock Management Unit generates and supplies clock
+  to various controllers within the SoC.
+
+  See also:
+    include/dt-bindings/clock/actions,s500-cmu.h
+    include/dt-bindings/clock/actions,s700-cmu.h
+    include/dt-bindings/clock/actions,s900-cmu.h
+
+properties:
+  compatible:
+    enum:
+      - actions,s500-cmu
+      - actions,s700-cmu
+      - actions,s900-cmu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Host oscillator source
+      - description: Internal low frequency oscillator source
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@e0160000 {
+        compatible = "actions,s900-cmu";
+        reg = <0xe0160000 0x1000>;
+        clocks = <&hosc>, <&losc>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 420d06d37..652c9822a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2016,7 +2016,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/actions.yaml
-F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.txt
+F:	Documentation/devicetree/bindings/clock/actions,owl-cmu.yaml
 F:	Documentation/devicetree/bindings/dma/owl-dma.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-owl.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
-- 
2.43.0


