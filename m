Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A3CECD9B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i16W+jMqGdPhRLNJH4hwpWkbVoIp/hK7lVmz3Ju6fWY=; b=BZ8jHB0Y7+BF1OvrNZcb9Kj/Si
	tlXvr/Q8cY5asAxkx15Uc66V6x5Nj48qg95s077zWMq3Bz6wuju5bhLAUv6BauTHPG7ndiyh4CIrc
	ldOTaXsZgfbHX5MAYLo45Q1og1fpdelnr1Gca3zGjlDXGIFzz+8Wa0g1BoIrAJO/Kgbyg623P4Mf3
	/G1KKFJMuWuB6FDXFRj0OeuYAbPQNcPB5fxqxpSWrpPGvSCUq2Mf4uGyoknS8wkcyI48MQKte7GZy
	dYIptwiyym+J6niiJw9A4s++R5uQtiltOpPVmky+D9umNEF/S1uV2IsAESHDh6aVT8Er4y3HYUuqX
	YKAylrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77a-0000000AWvu-0YPM;
	Thu, 05 Feb 2026 21:42:42 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo77T-0000000AWqB-44ua
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 21:42:38 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-b8871718b05so231139266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 13:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770327754; x=1770932554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i16W+jMqGdPhRLNJH4hwpWkbVoIp/hK7lVmz3Ju6fWY=;
        b=ArbYuIHqQRR2IeHt86DNdGPAeMlBD3SdbBUHviU2mGDNhKC9fqImZmM3G7HmPiBmvr
         7STIMxjEKR6gjFlpEsx7eSxEsJ4FwUhTFy7Uik2Y13ujGT6GqOlqDI1GQRfgtyJ8bALR
         tCPZ5ZQTEnG6Z3Fm50pKvJRj7VInv7EIYaJn/hBTmjPsy5dO1u8WqbAxIj2mfzCDox6w
         yPa9hs3ZvmZhiYxtUk+RqWVSRsIuPvAjp65UKmv1lIEkyhga/7P/rmnTl/jePx9rMOEn
         xHFE9Uz2t3ZyzGiWz6OGIDjNwefp9ZM19yhd/DIpptq0NzPyACYpbEfLxij9kOjLaaUx
         Ac6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327754; x=1770932554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i16W+jMqGdPhRLNJH4hwpWkbVoIp/hK7lVmz3Ju6fWY=;
        b=air2N97SsfclSJ68M6wyAPVhXuHMThM7v944E4YwisvuM9MK3wHeroVPtRcwShyb/u
         o7X8QFNBbkanHZSNhz1B4Jgohqx5ffirz//Ubh5rli7rpA+ZI8Tno6U1cr/IUYHfoISW
         tuNKqd8UyL+YslY0FhsSof9TI/F3RF3SOBtzjphHDgXMKA4wZpRp7a+yICOeBnGyE/bb
         ENuBIXruYLCzs9VFwObKsmQ/Zn3QcXQ0Y0XIb5Ew3QEX1BI0yIPeg3bH2KkrL+WGnDMO
         KqAMk6f/FJml32GZa2fETosVsHmMl71FKnalOia3U/THNoAubQVI6OKAQtHMAsc65kCs
         TtAg==
X-Forwarded-Encrypted: i=1; AJvYcCUBYSdHtiR1A/f3XgNXOeguu5lZfnsP/dhBL8putjmX74FQ5Swde/oyfJ05m7mjw5QJLjttueg38+kVLc9R3XH1@lists.infradead.org
X-Gm-Message-State: AOJu0YxUexJLx6wnGCw8YdGXsggYj029BpBZ+cX4rKazw485II8b5rsK
	rC7d9W4O+MY2dcJezbsnV2xfS4vLXq2kXhDEMjJHeznKZS6eG/Xr1G4FElXd/R6gy68=
X-Gm-Gg: AZuq6aI7htReUqW8fNwCO4MexylK1Au8fvrIlHdXiETKjpVRPNjgK9xSdvzjCpQPYFV
	JIfHG6V0mkK0fhQQS7iWWBIxxW3jGnPOazP+QHpdphJcAPCtjn9NTHm8QO6A1wHV1S4orWSLnNn
	9tRtzhH2+NdPCHl9/7FpEfEw69z7qmr9b8Qd+QhyYKW5P/1WW8PkizOUlLv7V+wfzp+9pGdzypV
	OhnRZhSO0lw4rHJNM8FRj7AYvallN/Pr8ReJfBi/TCzcnzGBsKDskaiFtOG5DpsGgc8qJIRxsde
	m9kJY6q/XaGkDQuC9QJwFzt/f0t5wXzbhZRgh9fvpaXBejq3jr5lkkYkkPkeCTjtrU/UkJKbnRQ
	tsM+J7245bl7CJB1NbpisjxNB18T2cFRFfQ+di1GTJt1Jah9w8QYshGAgRgQ/JWsN9h+whicjQn
	JKxLERUNQBWqA1xkvW528sRgmIGjZAF0fRV5wM8FaC9NWZ+8ov+NDTAuYAjDjsw+vp73q09VrSq
	ASWmg==
X-Received: by 2002:a17:907:9486:b0:b87:115c:4a2b with SMTP id a640c23a62f3a-b8edf23ea6amr25429766b.25.1770327753822;
        Thu, 05 Feb 2026 13:42:33 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a0074sm21859966b.18.2026.02.05.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:42:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Feb 2026 21:42:31 +0000
Subject: [PATCH v5 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-gs101-pd-v5-3-ede49cdb57a6@linaro.org>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_134236_036399_68CD8F07 
X-CRM114-Status: GOOD (  14.93  )
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
index 0000000000000000000000000000000000000000..a06bd8ec3c20faf0b364d3d3ef1763502c2b09cf
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
index 76ce7e98c10f3738e7de5579904260dd906507c9..09368dbb6de6898e2988c398b2506f2c2b4e73bc 100644
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
index 7fc1964b6beaf835a398a9bcee4ded191034d2e3..212fa7ca48b8272ebf189fa1d105b319a849c5c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10856,6 +10856,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.rc2.204.g2597b5adb4-goog


