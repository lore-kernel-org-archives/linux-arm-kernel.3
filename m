Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97401CDE009
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1nW/nmFOqYMEtyYiZrpJrEw0myJ3BtBDyAkNbadcU4=; b=HGD3FeSAF8tbvCvxwM4f9vSqTA
	4c7gzQ/Q0YW3x0UOOWUrLc8gM+vwQ3RAJH47kv2v25Xrf3NYzBZF1tTPMLRk9M6qi4ojJAptL9VbH
	Ft5Yv7J0z4dn790d3SUKUxweGr8b06z79XSPieuXBfB9vXTeJV1pRFZhOgrfoBAT9JeEyoie8JIjm
	X5thzL5Ims2BqymR/w0EBE/ky9rrNrE3rxtwLd4S6UsH6KoPqglyFvplf6j5pgra3UeDtkQ2b2FDH
	o6BKfNw4DCRR2By/DJHzc0oUyOoUtbBwF06GUIMKqVT6JsXkFb2qXu0uvgh77jE8jnwhRG8TRHm5h
	z7csKIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchv5-000000094AC-3Kky;
	Thu, 25 Jun 2026 11:06:55 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchv2-0000000948Q-0sD8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:06:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8452a597afcso1493342b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782385611; x=1782990411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1nW/nmFOqYMEtyYiZrpJrEw0myJ3BtBDyAkNbadcU4=;
        b=JxzrJOFIXwNXBmNxO5gH0HcgGoX8Tbr66gvbHTQ0E9EQXfedO1tC+bSQfxMSMLDIIi
         O5zHYiKOjbzG51Ow03dXNc+ghgeWZU4W8h5x2TF7vxTWdtSasDL3heLIPfsFFG9kjeKX
         2a5Y7Cu3Wv4qSBvbBO3x17+aBl/nno04nIG+VjuMHQjHvKM/BmJP2somAz+SZtaw4Lbo
         wsM8ZY0m+a10dw9m9V3orNWcHQXyLxGWzw9eYXPhxr5o+unbweaZGU7NcO0eH/ZM59HA
         hkfcua1lhaj4RrL+xr7DE/duS72kaKBffvECRL8i5m9kymnJZ5NsWZIc77KifZUMzyVb
         hP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782385611; x=1782990411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1nW/nmFOqYMEtyYiZrpJrEw0myJ3BtBDyAkNbadcU4=;
        b=LPejnskaiQz2M+ObzOTZibNfZzz1RR1zb6VSN9vKA+uIKlYl2VPzC1nLmIigD5KYob
         iu1AUFjzVrMouhs0LT6O7cT4tiGa6C7KTyP3wTpeiE2bdia06BImUbkFLYqcCQMg033x
         Q4AvZKDYiaHCx89PO5dCP8M1r95+dbfEKvStJ9tAiq5CTgUq/0ncZE4/DUeqmf1FfBuA
         llB3xUk1bYDQgcu4CxD/DdMNBP3HqlD/Tvna7H2tcqWhHQh38nmpFAdzObyZUZdZ++d6
         WSEKgF5SEXj3cV8X45T+xjMIJwRsUO3FvHyHEhtbHPW9SmJVDbUwKCkI9vVRdh/qk5LT
         TuAA==
X-Forwarded-Encrypted: i=1; AHgh+RqFxKN65dTmQMzZ2cL12FArnEYIyhM9pc4MGTsnuq2GQj1H9HU9WAoogdmtoK+QKlH1T06Lw6Tzfz2ZIa7OQ0do@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhx7euA9Zina9w93At8+It9SD0roIj5wXtwWEsI9pNfIytJ9IE
	Cf74H+8ywlJcKiq7WfCr2/IUJ+49trd2f5Lh+LXt1EZS7xMbg7bJxLRp
X-Gm-Gg: AfdE7cmhSGGoPjzYyzA4S8bPOtaUg9ziQoGEnkcLqJeMnlOMu9AXW/naZnvzonSPkvy
	1IYo6pGzbNeopIXXT1B+J0hDVxwmkCJTCkko4CnLHbEfRO8HEc/UX4qbD0Fngw4h7LBJ/s3JyYL
	2IAy/J+S5DoGgZqOb3l1qX/n/bJryYXMPpSaiwN/DyKGmbeYc+jNVXjOhrUt8Jyz/RhrsmZHrg0
	uuW4/iJegQfkckrwAbraSgWgsGccHa2hH545x0J6js3rawKeQgO3+MpWGxq3Shn3qWAb/yAMBYl
	+qWGwJTWseM+d20GlsyvDLoGoMQuiArVWCk/4/KstFWpGl+lhO2y9ssASbNp7B4elAVnp82+Lej
	cpc3zt9u+SUk055IhiHsdgWBNaU8/+FAVnpBSPXQGUm9ExW7ds5iItyk0RzQ7U8C2ORUoLCokiE
	rC45wR2gIPkSDMH1vOk6HOD5EycjPPqJSobkvhJNG8nEALEHzQMVsonZxgdA6dhyCEX6U6bb9RR
	xQ=
X-Received: by 2002:a05:6a00:3984:b0:845:a24d:9b65 with SMTP id d2e1a72fcca58-845b39e6b71mr2663793b3a.14.1782385611082;
        Thu, 25 Jun 2026 04:06:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fec0f7sm4412759b3a.22.2026.06.25.04.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:06:50 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Thu, 25 Jun 2026 19:06:37 +0800
Message-Id: <20260625110638.38438-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260625110638.38438-1-cwweng.linux@gmail.com>
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_040652_254705_F58C2D42 
X-CRM114-Status: GOOD (  13.07  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add devicetree binding for the Enhanced ADC controller found on
Nuvoton MA35D1 SoCs.

The controller has one register region, one interrupt and one functional
clock. ADC inputs are described using standard channel child nodes,
including optional differential channel pairs.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..ae7ad0f7689a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Enhanced Analog to Digital Converter
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+description: |
+  The Nuvoton MA35D1 Enhanced Analog to Digital Converter (EADC) is a
+  12-bit ADC controller integrated in the MA35D1 SoC. Each enabled ADC
+  input is described by a child channel node.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-eadc
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^channel@[0-8]$':
+    type: object
+    $ref: adc.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 8
+
+      diff-channels:
+        minItems: 2
+        maxItems: 2
+        items:
+          minimum: 0
+          maximum: 8
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adc@40430000 {
+            compatible = "nuvoton,ma35d1-eadc";
+            reg = <0x0 0x40430000 0x0 0x10000>;
+            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk EADC_GATE>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+            };
+
+            channel@1 {
+                reg = <1>;
+            };
+
+            channel@2 {
+                reg = <2>;
+                diff-channels = <2 3>;
+            };
+        };
+    };
+...
-- 
2.25.1


