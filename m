Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8B7F01821
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piJ92bCcZbzXtfYOaOOoHhs9Euyr6xn5G8q2SxoNOHc=; b=fB7iycwBBshQAlFz0o7lnhf/wl
	WC8ktY+cnXNn+uNNsc3U5dYZJ0YjxUDKhUSMDxTOTjTtqH6UapjSvPLmeYYIUIpUypTMNw0eMVB51
	MfJ4zIWaZQfP8bSjlKmgjXchAs/bYmmFqhNZx3k6bxfcjaXZayeCW28HAOGwUgsbzJW7WtQ1UYxNO
	cTh5q/gf6LWfRtxpJOMHYBVvT2IMoWMREEunHb7C6X+aIvPlTOIS+P+L08XycyhNQuuQBmJbNxaP6
	Cf1YIJFf3sXZuJJPlXrBPZS6HKSirINSBH6heaLpkGlKZFDEVEwSI2ibwVl3kXxhCojSZvCsvVmJA
	LPAiIlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRY-00000003Sb5-0gaT;
	Fri, 06 Mar 2026 10:30:04 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySRS-00000003SUx-1l3X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:29:59 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so1207175666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792996; x=1773397796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piJ92bCcZbzXtfYOaOOoHhs9Euyr6xn5G8q2SxoNOHc=;
        b=qrAyjbsWodaHYNlq7CgLejXTcyYgWX9ERUFN7+46bRn5lu+UvSV8UeRU+Bo/IRrrpT
         pTkl5cXq9eAPscxXFRxj5vwmdWqCDwMZWsvaRF8n4RophwEeI6ZvMInJYoWO2rr8o7lp
         pRXqwuYLikC0J8aq1AhuRtEuqBb/a1VL7pzQpVk0GayWTdwEsVeLtY1ThOxMW2f3TFyd
         mJuLsA/E7C6KWVLLwNZ+DbvUMq6Mc8rqzRexmF7Inae28DxuHoLHVhMOjb9KlgAN8iE+
         IfCXwnLfJRqCF18sxumUQiCS0oCO/p2sc3lNlmqAp1yYxZ7wHZywT6ED5aNnM5p5y+xc
         vE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792996; x=1773397796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=piJ92bCcZbzXtfYOaOOoHhs9Euyr6xn5G8q2SxoNOHc=;
        b=kxi3Fj0r1FbUXFba3swKJqqb2J37XYJHL0qrPR5IEOuJvLQ8iH8Or8g0ZjXWS5K8Pd
         MNhNfDLex7KJmAXzkQYnx2ynze7RNjsM+qbwrT6EOjOseenmfxLBQG/TpHCe7Iz4vyso
         wAfrwkBKJxrR94MUuBBbtiJ/J/HdLR5BgLHCzWlWCBW5WJTFfY2YMT/pOmADAjJcxRKl
         Go2RqOcye/0lJPwJcFHGCFeVglrgkoGBqTWbG9k3lvPobZ+G/npIT/sM7crJx4REHxlI
         SKOmLG4Ux2pyDlIL6onEMQIfFr1ZxaKgbMWhxdlWyntfiXUaxTRGICajZnVKWg8x23RK
         Icpw==
X-Forwarded-Encrypted: i=1; AJvYcCWP8wbDYTuHGnvMTOVvPTRMpnBz9+BccFl68jkC5QtvgT0ZuZaesXA3A2pCc7jIb0DTdBTH/H29cQ+fibU7LvQX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu1k1b/1bqVAOmov1pE/kDyzIPKETFjL9pI8djoG+DUYAsGVoO
	qKLB3ctlMycjJl4anYt3LQZ1FYHIjNGKpMXLktY90jziNXB2QVdJUbXLBd68c7x3L5Q=
X-Gm-Gg: ATEYQzzQhxcz31v0lZjWczOZEsrsqIytDqtRB2Ktcha5qlUMLFWX2FILIfQSji7qIVI
	ARKIE7lrlEyPtLYf5n9YNoaIte3AM51x99YzRwoKg35e0KvnzWrhRPk0gKdsAZ4EXU/uy/SKR+w
	c3b8L9oNl1pafc2KGRgbRrspy2yIqXuWEomUNpMYekos2RFKIhjvNhQ84I/EJeNklxR6KAKtCUJ
	ZoaWbdnDsRT+ITIkADyDDoH/XjHs91lXvWyZmxgqhWqLFi47y/1GeTl1zFO2/UJwf1Hgn41FbJJ
	H0fjEF0ceD0btnZZrFdUO2+maXwTwok6Ww8Ksp2kdgTMFta1qD+r9dfRd7Z13ZBAAdssie4gjWR
	xvsH6ZcjDG3nC5105WuLbxUC4HZ7+PVqZrYVmhcDiGlzW/CmoFyEE0d0YFgbSgDBJkDOg16uJSf
	nA8/W064n7MApLnNf8wPVgkV7HYGMbk2abwbZJrZSCc4DgbwukJTzy19pTsmOT0lM2e31/37jlT
	LN00vDrKBtNawaVmoG4VziILQ==
X-Received: by 2002:a17:907:6d29:b0:b87:10fd:b590 with SMTP id a640c23a62f3a-b942e05ddbcmr87217966b.60.1772792996324;
        Fri, 06 Mar 2026 02:29:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:54 +0000
Subject: [PATCH v7 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-3-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_022958_484767_5DF7D775 
X-CRM114-Status: GOOD (  14.47  )
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
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v7:
- drop invalid tested-by tag (Krzysztof)

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


