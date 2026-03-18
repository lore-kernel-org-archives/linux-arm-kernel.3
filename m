Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B42103E19D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76ew0Aox6hZpcoaCX95kIQMvXTcJq4g+BOpg4Kox4lM=; b=ceiyJqEMD86X1AR4Qd7hdp7obb
	ZzFmPCB+RLIOopJA/tUePNlHjOyYmErKJ/Zo0W5J107X4wB/7vWIHMae93lFt2ME1nzIFoE0kFvW5
	UVVukUmaoaDRk4tZj7JIWfzFAyxuoXnFBvJlfbhNxynmX/2M4aQDlSBdOn8i8aDpx5GOGDSjqh7B7
	pKjb26WPfExQH8Vqfrc1s0Z/3d0leOgbOvKYyYPkkkP6EYWztfH4IOhvdRsAksCEL+DtdKmc6Si5i
	dP1e+SPukndVNcJn7XLDUUI2RFaEgv05xYiafTrXvcXN1gnoW9wRiswt9DlH30RKJYAfiAqsbPB7C
	K2HAJkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soc-00000008hde-0xct;
	Wed, 18 Mar 2026 15:28:10 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2soU-00000008hXX-27Y4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:28:04 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b980785a0bfso91571566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773847680; x=1774452480; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76ew0Aox6hZpcoaCX95kIQMvXTcJq4g+BOpg4Kox4lM=;
        b=HhkLuB5Jv3p0/tzq+MzML8/bhXWTAZkHGb0yzOBANhHLaVdUQfe7ercNjv4Gcx8lVz
         W/gXI82hpJ/vPJFJm9BbEizKnEUnceEB0Zucx4mqte2lQIJzherEwKupuZiEYe8vgHfP
         mp0ZdU9YvJIJmtz08V7flTjPabyawgFMDUKWjhAb5zErUNWXubo9JS5jG6pCqCbUxobM
         Ae3Xf6jRxRmLJWT2gwCd/ODYHoSv4J15yf37lk6rbf/wMx+xOtSkbzz9TDtxLe40lyLG
         ce+/TFM6RyaFLJjzQ1INzOhtOtB6M5+2HFiPeKYIeDSjEFmc/ndlKq+hVhrp7su7bOU4
         sAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847680; x=1774452480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=76ew0Aox6hZpcoaCX95kIQMvXTcJq4g+BOpg4Kox4lM=;
        b=n2X79l2vm1mqzKophPc4xa90cEYTkkEAhU49sNwQ1Pyaims+FhXKydjIeVy3G/C8ns
         B6AWfKjzWIzFvQUuR/OF2JTX0wZhXxYbEBDv9e44RowGLQsG+BlBoNIyYrLs6iz65LJn
         9mVHyRMJCVvNF/N+91+IUyZ0Z6CuH8FqM0MXa3cK9SLfBeSpezwC7d/lzQ+08Idy/TVG
         ach0BVjayRZwzGCX/BeV2XufgUIpPlJChdfKkhfQRRcrGIXzQQvd9Ei3YT03d7rKFUwV
         g0XDOHYM2Tl36KfO59RhYMGVzCfelIKs1XICo4DH7VlOu/ZLQdxXQHp9KMt7NCV/KNjo
         8HmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEXCYttpAu6HBsG3OR/Tk7TCz6mIUcuUBv2GmQiH9o8yy4zDGoe8+FRRCOoHknaUQrrpslRPrIYkX4qkWZOJ1e@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+2r1+F1qeBobl1e00dkCKWhu12AvvRnKKD2DNJBpKS9hda01o
	OpF4pu7WetBbhOx6LPAPDmlq9Sjzv8ftOqJssam/EV4nrJTbDoyHFhjGqrdvIjSTzG8=
X-Gm-Gg: ATEYQzylnOQPolioAzpLzdgHRxQwi6vsr7Qw+8N6Abxc4YaDQ8RkB9yfrXuwL78a6/T
	QKQsuJlien3K5+A/fOQwyqYBtcJ28UPLcQv2J4TbxKFeTOy/IU3P6wh/BzS8jd8wNYTiG5EcdOT
	HC+44tFevEYsAuwip+R5pccT7CZRTe/DM2RW7MvSEwh9i6NY2cenVcVb7CMQbylLC7L8eusRcx2
	Dt086pxtTdAJeiIyxmDrDWBLMa20Xa9MtdI4ijyQcSpf7ZrG3ksCOlSirJ13kWZN/LAV8Uvb8xT
	7ug4dPXbvvRCvrkHnRxcAgN9OH91m1I4xqTQQJKS4Yp2g8iPX6vn6tAIM9ifazJUL4X0scpJwVO
	XLOBGyWUOe0xbP91B2SaFkK7jifwI0uDKgQfTyfgIU+40XAIskViae0VDPzgtunU7rmp2Xc8fC+
	CEtiAodJuR3JVoZwK/8PscquLurGZhV6b/A07wr+V7L/mWgTovVeIvtRapAUGugaCrwh4qFhFOY
	v2AjjirMZugBfU=
X-Received: by 2002:a17:907:98e:b0:b97:1d24:bfd1 with SMTP id a640c23a62f3a-b97f47c86fdmr235982266b.13.1773847680401;
        Wed, 18 Mar 2026 08:28:00 -0700 (PDT)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3e3sm226989566b.61.2026.03.18.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:28:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 18 Mar 2026 15:27:48 +0000
Subject: [PATCH v8 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-gs101-pd-v8-3-241523460b10@linaro.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
In-Reply-To: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
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
X-CRM114-CacheID: sfid-20260318_082802_579506_73444BB5 
X-CRM114-Status: GOOD (  15.02  )
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
index e8376343935f..60da52c420d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10906,6 +10906,7 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.851.ga537e3e6e9-goog


