Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF9EEF305
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PU4mxk2r95PV9tPzoHDwPxRIhg7ggXYRoeufjEkbG0=; b=Jrjyrovqcq9HesqzWHoUopVfBh
	F2RmEyeDhzw0hAbQV1udJ1sj4SewtlLcCD4WWM+ZADTtQ3FSjbn24Olsgh3KptKwzrhT+PTNktZ/o
	VyMgsqQzNFH/VN83rt7avcM6o1mEGrKIUcybUa6qlz6Vd3ia3d6o8luNUhbXh3jIN3CctXtWJTgQ1
	dc5xl5cyjgjUshKzAx4JVSMHIKX3LdZw3wk36Y9pXC1RNEbckFsJUH571J7WjIvp+Bkk4BahkOq0a
	eHGWRegLJQ5vlZxDpZ1fA4a+KfQ7K1fW88Wge49W4+edS1MtIUfz6AZW2au41k2dZZWZhFJFB0asG
	IMje3QyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wH-00000000yZd-0dXE;
	Thu, 05 Mar 2026 06:12:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy1wD-00000000yWS-3EOK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:11:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b940f962a82so34326366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691116; x=1773295916; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PU4mxk2r95PV9tPzoHDwPxRIhg7ggXYRoeufjEkbG0=;
        b=Eb3HlNqK8bf6MvjyGUywWid8S3MuLILIjn/q67ofmz0ySEbCbcx7K5I9tDdAKhYYie
         fqyVGZVQu4J8EL4JW3gtGepqRFgwB+BWw0632ZZgEEfKfQW6QspgOsXvs1hec/HwVduB
         9hsj1H6Y4UUTUwuYg/kZwELwAZpsxDfoFRpWl4NqKJ+GfSSi4V46zYGGLtAqUlooYdAC
         UJ6r7MOF+RvTnFWnV4STOWeAWgU0/pje7wxXn+Sgim0J4P0yGQIopcZ4r4Weh+RuVY7e
         9UKSz7b9wlM9lDm3k3rEkbfrBBZtiYTNWHs122pWpcB7zed9YScJBEOzNTcZUxrdEYh8
         qeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691116; x=1773295916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9PU4mxk2r95PV9tPzoHDwPxRIhg7ggXYRoeufjEkbG0=;
        b=uQ6YMSKzbOlgwq+s37C608gS+yBtvTUpQl848vYsNUIwV1pA1/ZLCUzQocvPCYSl/8
         kaQj6I5R9UHQQ0jb0Qh4IpZZBQeXPUqtEVQn/zz+zKrLWrHlIE/DXsEE5ZO8KDUAqzvO
         be5NsCCyAgTWhBxE1a2c7qDUIDvCTzvGu0Oe33VqysP3hYpBIOwfVKm5glzpMGZoGtqY
         P/55SiahKDVhx+r4brFtMW+hjW8iez/2To9HX7VM8qWYo7l6l6risqsguK98xfF+Hi9x
         OmrGLOuk+5cofUJGfYW2vhgmuzzW0UMQ673sLF6CoSVUrXqngjtd5PirWBfMF9K59aiB
         J1aw==
X-Forwarded-Encrypted: i=1; AJvYcCXgvpgMrdQwdxBbhAZ9biBilAtVdGPLbgEdCSuiLCEd9mboXmCCcXT6oNI+s0WmV22V3vY9uebgPbkw/xr/qgxy@lists.infradead.org
X-Gm-Message-State: AOJu0YzUG+MkbYiDjgYvM8A3LbBDtVzgHURELt3gCAQp+8Gh7sVegQzO
	DXgXmPo6SisTyl7SVhN6GcF2JoS7wrsPFTfY/9BYX/Ita6d4PNaMYR7KGM8SJ2m0c9s=
X-Gm-Gg: ATEYQzy8KekdwbNVTXMsdxE1u9EW+aMX30HqfFOxA1QUf6PPnPOVawnZ1ctjFFqtwtI
	WqAdbzjRpv8OD9DyH6NPTuarwISR91i3CbLMDN95sT8rMVYrHFyTWytZemZqnoIwhEnT4qqkst5
	X+5SCR8QpDF0VvBxVAtnZMZSTxL5GCPLhxXXZoIEJM6260+bYAyIqglnRY+g3Kh0KM6Qr/v9BRY
	aCfjz+GRwWuitPe9XSqL3+xafOoe+W2fMj+Ia8XCTO9euF25TF2DIL9puHzfCIsd4buCKRDq8Fx
	9MYD22FA0UOQf3IycbarA3z3+c2H7oMy1QFake3Wh5YlXKuzCpYV0OF4EjfORghazaLAclygHfV
	Ba8eeD6mvfNyTab0NdvZvzfqvPUuKPAnK1bZRYoI5DiKV262z4B395cj7Qsk9AUSZgACBtQGNwF
	s3sKSCeNxN0cR2pkxT9LbX0j/++PEezq27nVI48+2Xtg4FmUKkrerMXdigIGGogGmM7vmrwQmVV
	pazWdYgZ56a/8U=
X-Received: by 2002:a17:907:97c4:b0:b7d:1cbb:5deb with SMTP id a640c23a62f3a-b93f11d67e3mr345346266b.27.1772691115747;
        Wed, 04 Mar 2026 22:11:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:52 +0000
Subject: [PATCH v6 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-3-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_221157_837455_DE6AB5C1 
X-CRM114-Status: GOOD (  15.27  )
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

The gs101-pmu binding is going to acquire various additional (pattern)
properties that don't apply to other PMUs supported by this binding.

To enable this, move google,gs101-pmu into a separate binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- update since 'syscon' was removed from gs101-pmu compatibles
- update since 'select:' was removed from google,gs101-pmu.yaml

v3:
- use additionalProperties, not unevaluatedProperties
- fix path in $id (Rob)
- drop comment around 'select' (Rob)
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 56 ++++++++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 20 --------
 MAINTAINERS                                        |  1 +
 3 files changed, 57 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
new file mode 100644
index 000000000000..a06bd8ec3c20
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 Power Management Unit (PMU)
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+properties:
+  compatible:
+    const: google,gs101-pmu
+
+  reg:
+    maxItems: 1
+
+  reboot-mode:
+    $ref: /schemas/power/reset/syscon-reboot-mode.yaml
+    type: object
+    description:
+      Reboot mode to alter bootloader behavior for the next boot
+
+  syscon-poweroff:
+    $ref: /schemas/power/reset/syscon-poweroff.yaml#
+    type: object
+    description:
+      Node for power off method
+
+  syscon-reboot:
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    type: object
+    description:
+      Node for reboot method
+
+  google,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
+required:
+  - compatible
+  - reg
+  - google,pmu-intr-gen-syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@17460000 {
+        compatible = "google,gs101-pmu";
+        reg = <0x17460000 0x10000>;
+
+        google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 76ce7e98c10f..09368dbb6de6 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -12,8 +12,6 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - enum:
-          - google,gs101-pmu
       - items:
           - enum:
               - samsung,exynos3250-pmu
@@ -110,11 +108,6 @@ properties:
     description:
       Node for reboot method
 
-  google,pmu-intr-gen-syscon:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      Phandle to PMU interrupt generation interface.
-
 required:
   - compatible
   - reg
@@ -176,19 +169,6 @@ allOf:
       properties:
         dp-phy: false
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - google,gs101-pmu
-    then:
-      required:
-        - google,pmu-intr-gen-syscon
-    else:
-      properties:
-        google,pmu-intr-gen-syscon: false
-
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>
diff --git a/MAINTAINERS b/MAINTAINERS
index 611fa8fb9f8f..6a00d97ccd09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10884,6 +10884,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.473.g4a7958ca14-goog


