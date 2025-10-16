Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504FBCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFbyyNjgnPle57Vb/hgplgnkdL2H4IawW/m15NrLQlQ=; b=NSFua5eYAPmOUzueLqIADyMLrs
	YrIsYZn5hD08nPKvMz8PlNvk1ZR+a8SF2EIVOqY6E0tL2DfM+bIjJNVgjeiqUMDGwDcx5oZCg6WQ7
	O6tdrEkh/xdU6Ud0U/zezp+gC0ddgYh6rkzO7V9abH11HSlVp+oUAfj57av2F7yZrv8B8LKBi2QNY
	eu6e644Eyr7d12v7JRrIU3oUsAyoMQ73DStX36cUctpUQeRpulP1obuUzqCx7CHUWHtlYCE27rM9G
	njOqLsvArr5ie0Na9d9Mgvple+bwphRfm5IaqI3TR/m+eZLE1lXOf8AdxsVLkU0l6saSbirSyJcnU
	PWxaENSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNR-00000005IZB-0SZZ;
	Thu, 16 Oct 2025 15:58:53 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNK-00000005ITb-0iFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:47 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so166738166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630324; x=1761235124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFbyyNjgnPle57Vb/hgplgnkdL2H4IawW/m15NrLQlQ=;
        b=TSeJlgEvM3/bvVwqkscXsqIi90lJ7MJCrRpG53+9MXNimLENPPI1xLSCKBn1dbUhhQ
         UKeJtfAA/qeiRI6p6wsHTPDHtI/hhFDtIoWFrCYdaeF+Mj7gc9SDu1dwxK61S8BXuBD4
         r3j9xP8/AR/jLBzr/xVbvIalbHFqnaXuY5K55Pc1FAeM4CdeL/MEv87BNgRekfju69aB
         mxdZz221ZXKQPax63NK88hiHh6/fcxX8r6RN4a6Lq3jjDLWv1dlQH4sgpBbiLLH5rmUK
         AzRSRrcsom4WJyGnAPNdsKZyCG2otrlKIUjvPsxD9njSfXGm0z2mqm2IY4NmOK8adgEG
         szdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630324; x=1761235124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFbyyNjgnPle57Vb/hgplgnkdL2H4IawW/m15NrLQlQ=;
        b=hVlLo6tuy3CP13M375L/oEWZDnrG7/W7zhxREM8AJs0xQTV4BQjRaA6TBvNFGfe/Ry
         bOvZGm2t4ZjLx49gQe/L3aB5AtTQOVzuPDGmgBWOQATLbj+eKx8McsB79meTRl+RZ68Q
         ChNJovzHnETzE3vpBT1+p1xUD7wDGt2TQrdWR/AGWDehDhylH3yVnLLYlnFOGdcoW00/
         P0D5MWvhmoJJgTXRk4v5A+J3NVJ6Ye9CusJsvO0RXvSdbWROFiOMYpkwUX03Qcm2IU4a
         9tQfEFZhxGU/4yHHgmcnvOX/qDgRzBA9koYSeGUPO6IMtd4Qet73xq/p8F2pMoTGs8N2
         Jqpw==
X-Forwarded-Encrypted: i=1; AJvYcCX1vS5wD71PxElTnw2AB8clpb7QpA5xFo9+/lP1uP3kWhN3U+YQaE8PILtnO5AXHqTYM1Q4PXjalLXhjFBoGiRz@lists.infradead.org
X-Gm-Message-State: AOJu0YzYb+/TaJsBksmPjn2FG7jc9Nznopmseyn+u3GZMG/g1bz1KELL
	FH03Nnw7dqLbs9Vk6JYYQBlXAqvyc/YAiVIshGNTomwJ+kJDjW7shUPtAl8DFLhQcn0=
X-Gm-Gg: ASbGncv3Xn2/4YWwQD9FXiraltZmOIy9eB5PU+o8bgTHUIcZoPgeZnHXFxwxCDC80Rj
	8wchXzujHhpTYCc+ppS85zl4GT7ryXVZA2vdPuiT74L/FeJ1w+WDXDCx9UAUa/hUJxnwzBDvnV4
	QHvSrrhHKtbruLI1O6rR2sTUzMr71YYYthV+huyRmtU1K76duEVddgpPaqneAE7IVffAjg4Tq5e
	8cwNvUXrnSIbEWadUThxjzPpHlNMzVtur8dZKqZPNJKvXI7OaCumQB4s4cTx4dMG68K/3C17NkK
	IWDYAI72TZ/Ze9euleMPzSECn2XWBmmIoi7Ai6PtaPLAoi3rjntKGm2qlZaW6z5RN7z2Osdy2mA
	bj1nqeSQZROMu3eFA4gyD/mMXgnKPKXYBodfmb6ojnGk0O0HtE3DR4mimZxA1Zq+oKRR2e3d8ou
	ZIYSKWVkLQ25k8B7CF2zhgQIa3c7NTRMbbpO4rep9SoQU5dHC+iGPRo1vvYEjIPLwC09nBCTw=
X-Google-Smtp-Source: AGHT+IED/FvFffti0T0jCYr1x6YRSUGnajOXW2cxPyV/0xQA94FV6cSMBe/igTzVHYhYkjAYJA2B3w==
X-Received: by 2002:a17:906:ef05:b0:b41:e675:95cd with SMTP id a640c23a62f3a-b6472d5bb90mr52421266b.13.1760630324239;
        Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:35 +0100
Subject: [PATCH v3 02/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-2-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085846_362088_E130A042 
X-CRM114-Status: GOOD (  14.60  )
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- use additionalProperties, not unevaluatedProperties
- fix path in $id (Rob)
- drop comment around 'select' (Rob)
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 66 ++++++++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 20 -------
 MAINTAINERS                                        |  1 +
 3 files changed, 67 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f7119e7a39a3fe0a0a23d1faa251d356f83ba501
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -0,0 +1,66 @@
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
+select:
+  properties:
+    compatible:
+      contains:
+        const: google,gs101-pmu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-pmu
+      - const: syscon
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
+        compatible = "google,gs101-pmu", "syscon";
+        reg = <0x17460000 0x10000>;
+
+        google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..83f18a92fa1c4de75a90f00475cf17d5f0b652e4 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -15,7 +15,6 @@ select:
     compatible:
       contains:
         enum:
-          - google,gs101-pmu
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
           - samsung,exynos4212-pmu
@@ -36,7 +35,6 @@ properties:
     oneOf:
       - items:
           - enum:
-              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu
@@ -129,11 +127,6 @@ properties:
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
@@ -194,19 +187,6 @@ allOf:
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
index 8cb7a124f6e81372060c38ac2b3c9a11505ae004..22573869586eacdac0d0a075d4a691849272442e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10597,6 +10597,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

-- 
2.51.0.788.g6d19910ace-goog


