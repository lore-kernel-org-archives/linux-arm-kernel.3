Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7723CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnyuHEM+lsiHCfL6IDRN5IyrCB7LqRf5MK311Pq4COY=; b=iYX42Bkp93ccpxL2w0XJF0bwdh
	j5EOFGZeDO/YZQq2z/Q4fnJ+DSjbD4EaAQXou+iO+Mj/4LNwOSBegJ4gHNvHFKkqp5RqpLC7pgbre
	6gprGUWWmoUdqM68PuLV3p/Frxc06t05iEuEElSms1Qm42jQnjb0dwW5oND11JSB1a0WfQWUls78s
	ItqPSv/DSFdt2LoqU6TsBJuRY2X2xNX1XBOZrkgn20ZRGlMUFE4oyGbQO0h7gsGXqJhycmnYiRZWI
	X1ofogqh+bk878WZYkch1/+pyNGjqBB7JGDuH6hlBY0KQKptOZZCuuDex8UDPU0uktq2xAdF4fHBY
	wcn+HMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW1-00000006TyF-21Qs;
	Thu, 09 Oct 2025 15:25:13 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVv-00000006Tr8-3d2L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:09 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-639e34ffa69so1578130a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023506; x=1760628306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnyuHEM+lsiHCfL6IDRN5IyrCB7LqRf5MK311Pq4COY=;
        b=vcD/eHpO9Xn2ITWr1HT7KJ3x7aMpuLVcSxCvce3uQ35/hFeMxp3FL8L8KhSv98z+MU
         ClzWGIf6BTbzGlHmGa2n3z+sYUZJo38iMy3iVNir21obtDntkLEsznlf/S9bhfn4Mlgb
         WCvCcLDGpapOPBM5ZI8gEByc3fZf5WtDmmucZCaIUqT864FHBiLkdQ3Eh7d89XTMCCu4
         pqAESvmzxOA8npITe+fD94CURpgmTSDjlj/phaZys3xbKnEnAyCxC8Lb4g7ntLNiSyGU
         TEwHLvEABmE4v9wMmfLhPDAZeS3vzWPWBLRVSDNuXfpVuTnVbaxoargRIJKgj8eXy5vK
         /Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023506; x=1760628306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnyuHEM+lsiHCfL6IDRN5IyrCB7LqRf5MK311Pq4COY=;
        b=A7tfF1jtWvEX8F0bqWAxpeSbiYufTt8KV9cOv6auggPR56/2dkz/cbyCSTL70cCpN7
         9hOp6NPraYt3pmKChz/ZvCC9bdJkCJ8NmbFHb4uUd7vztl2Sg4qT4B2HSh2pPi+PWesS
         10/cYR9h32EmsyRBoyf/oPPjWO5szOdkOWiiqs/Xpy6haqhHDg516uOQ/UBcwj9EgLd8
         f/IBxTh0qdYNq2tEXwrxOS03yOHUvRRc4Ej8kSrVLIl8w2XwlPx+zcZMp2BWbL9uBRzd
         wRsOdvGyE3yeLEJUXqFT/UNqUMjMwa0KKnYmOThrVxZq/87r80CJhX+R6720O9eYuuFo
         s6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrGI0+pdOn2rkF3CLUa34FOaWRscKhWVwR6AqGbJpGGylegWMzu0ZsA6rHeIqN3afeEyYK9F1GNWNNne1g2OyC@lists.infradead.org
X-Gm-Message-State: AOJu0YxjoNXJvkkxoPPDXFEaOSzJnwKI2WSe9i2oIwwDjanEe+AQPSUX
	FC4B67kXYTxV52lG1B2919HS9qPwUbDfk4eiN3/9nMwvSm1XxJHWtWtRJONtiUpY8qo=
X-Gm-Gg: ASbGnctBdElrZv21UhdI3uXeiAp2heK6A8EPRJLr7ndES2yBCARI7iXyQ6R40YGOdFd
	eYIfB1vgOM/M5LxUxKAy1Fdc/kzU6ljKxuNEF5WJp9cBIfE01eU6xYwlkDFy9sD1O0phff3TnyV
	DzRAk5USTx8r1EQwUoMNvqnBwYCPa+0AclBe8wuf2WrGvuLCuJoi5DCrRYlmRFRm6kQqoQPMeos
	RVxSTOlU4Leo7vbeqFgueKb78KJOEF7dJhbbQyJX9513U/A1wO8Zkhjxpj6Het2T6Kombu4cjgR
	2rgvcZ7hbQ5IulzLU7JhxL+uRNS9SVx+gm7dIgXOVYDzzNlnDfUCW/n6OTGeX6KKwYtz3LpvvUn
	qdSMmDW8cyBakk0zj+qCEA74XUPRYkRu1X1xqHU/IuPRehNYeGeyG+6lH8Ke78SQAcZ59MEtIga
	/eo/uIat6rJMVkDa2HHIVn2w3yuNLdlTwQ7ItPtLCK
X-Google-Smtp-Source: AGHT+IH4Riik0fnXmeV/DELQ8JjDqdvmxMdv2ShW6jNS8r7k8K/9xDWa2qfNhUPNms6YJU3aaNnQ8w==
X-Received: by 2002:a17:906:d54e:b0:b3f:e1e9:22c1 with SMTP id a640c23a62f3a-b50ac8ebda2mr933717066b.53.1760023505945;
        Thu, 09 Oct 2025 08:25:05 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:04 +0100
Subject: [PATCH v2 02/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-2-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
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
X-CRM114-CacheID: sfid-20251009_082507_931603_6FA3D6D4 
X-CRM114-Status: GOOD (  14.53  )
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
 .../bindings/soc/google/google,gs101-pmu.yaml      | 67 ++++++++++++++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 20 -------
 MAINTAINERS                                        |  1 +
 3 files changed, 68 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..209ee2f80d449c3eec568188898b3c6f7ae0ddd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 Power Management Unit (PMU)
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+# Custom select to avoid matching all nodes with 'syscon'
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
+unevaluatedProperties: false
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
index 3439485437117aaffbe61b709468348231ca3cc4..9cf5b9300d4d96bfed8d1a75cc806925a884744b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10596,6 +10596,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

-- 
2.51.0.710.ga91ca5db03-goog


