Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F7ED3F091
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdKVOkYHieKbKrsTLXtUc+V5Iw2Y7K5R7/tW5O3XgDo=; b=pszlSulrkRIQjE9fsBS5BCChZH
	Ct9s6LpD0Cw4Wkqgtt9nXAyv5xFvaOSbT8IjluWv8gY8VQHM3pQn0iEZ2PkBrrO2C6SL+oQusEPHS
	DsnLAtjjoxA4ZqszqFIAGEK+gOn0gaSR4CAu47cmaed35XEvxQqZe+jKSvue8YStHEHfTIKaFZ0sf
	RIrFu571v/VKKwOkcJu3TLX4Vpfz9F25YI5y6kI5LmXz1wAzExJcP5/LSg9GY/6u2qSGP5Mdv0PLC
	G48iMkMh75EVg0+SMcwWsmlJIvuNFWz88KWUBkI6ZUBEdCuEKQDb2uIZWm+lPq7T1BkItFDMMbIS3
	YeWILAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl88N-0000000GLwf-2ude;
	Wed, 28 Jan 2026 16:11:11 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl888-0000000GLql-3BkB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:10:58 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-b883c8dfb00so2075466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769616655; x=1770221455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdKVOkYHieKbKrsTLXtUc+V5Iw2Y7K5R7/tW5O3XgDo=;
        b=wnKSdQf4qT7G+m1MlFvKHLwAD0EcgtGHVuR4bATOaJmruerCFiRpm5jPOfAJZFboES
         7xIxzcAQbCCOjV7UIiF8H96Sx0pk2vC1JA7IWQsw8hNhtYzvepDgFYKzYVCUMGGUcU8B
         cy+LVlovveyhGGp8LaRfToaJFfelNMFN/2XVqhhKskztNTF/O9+EkXsHSbb9G9YVF3fx
         hQmNEGjJrwPzCWJ5OlB3Ahqvov7W93ARWoiAQ4Fyfd2+a2QxoM9kLKBtSVnrPVhGxK3I
         OkXpaAr6u1SSw2UzNx99oizZsb0fI/j5GiGnyTMy1wkoBNnb68Kk0zvwXuNg2dmiABpB
         gS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616655; x=1770221455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdKVOkYHieKbKrsTLXtUc+V5Iw2Y7K5R7/tW5O3XgDo=;
        b=kFYOn3dtBeCHHy+tHLvCXyNPA9t4RL+CwS394o3ogpe3/FVbNe1z9Did0ec0K6Vt2z
         BF57CmK+LFPcWOtHypfZA/UgTBbrGzfap1mWNwKEA+iX0YTEFLIKRUFX3sFWrqkZY3ZT
         u2Wmfdm3XzSrGfn5ezYdRJeHNXOyO7rdF2sf5XIUOYuTWyYjwONnpa5uKj/C/B+7vHDf
         a9y6JbveYZFPDVf+sXs0BUkhjUaAN27SUrKff/4lJxk8er9zDlCwVMqB2MBpYMQ1kG5v
         gAOs5m/UVPk1wqZRNZSk9rOc6K8Q3ghHpYD143QP+qkQATOsy2/SP0gLzvRGiDbpY+eR
         8EiA==
X-Forwarded-Encrypted: i=1; AJvYcCWxg6ETi7noM/L3NT2xRXdD1aLzwifwLq8hmsmgPttiMaei8GH9tSFbvbnWdmKnnCjFHaCx/fDM4D4+SY2VtAP/@lists.infradead.org
X-Gm-Message-State: AOJu0YzHwWql+5+XlSmOOVVTswNOigAIsqk6WoFtQoACBnTaaaiPMWsf
	ndi/dtS5R9ra0ueSvYq2N9CJqQFuxxKM3c2yEl5cQTFXoBO7xfgWbSYWL9NVWtH8mn4=
X-Gm-Gg: AZuq6aIIPqek8BLzaxIFbjKEYc6MoRa+CPVIpL7aVUBJ0xbIYbO5aj37ZcQPBmhHYIM
	NRGRvuOS9Or49bXorVyUVUSL1+yb+X79gpRCb96g75lSNLv5p+yRwoAU7nDYzUKRf5u9iHhlK5k
	FPCOd8FND9KsatJtTeysCo/72fQSiKsALF6FOJ+KWbHxNBDsohZCRlMdFUekK474UBVz8UCdLzj
	08E66t1xiJXfqQknOlEiVGYhQK9xNJVJ5DlA5CajJd8j6KZh5FOE9Kbboi/2s9VQrKtxFlom2zU
	IsraiNZ2lnys9inUa80giCzf6b2ng/W1MJk5Bptzy/h+cWT1jOXF4QIhaa163Hm9zU0Bv2yN/Zy
	tRWqmqFvxMA1hFEVvIBFUF9TMbJLH3gkYckZQ2hGJCXLAaQ8tMNERlrpOfFFHMv5lyqmc7ZWamj
	yGAlOODlTzJY1WRC0BfoF7vrefl5ByECcBdF3rspnlKo9lYxECY/nTnZ/PpoWn10O1OUw4OYXhQ
	QKUDA==
X-Received: by 2002:a17:906:2083:b0:b8d:c595:828 with SMTP id a640c23a62f3a-b8dc59517edmr136595666b.14.1769616654759;
        Wed, 28 Jan 2026 08:10:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c021fsm148553366b.49.2026.01.28.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:10:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 28 Jan 2026 16:10:52 +0000
Subject: [PATCH v4 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-gs101-pd-v4-3-cbe7bd5a4060@linaro.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
In-Reply-To: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
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
X-CRM114-CacheID: sfid-20260128_081056_823602_3EBE6C16 
X-CRM114-Status: GOOD (  14.70  )
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
index 98b2ef47c809ac0232e6941c9483b19d7c798bb4..79a58769e9cb33d9bd6190c74d55461e77965af5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10834,6 +10834,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.52.0.457.g6b5491de43-goog


