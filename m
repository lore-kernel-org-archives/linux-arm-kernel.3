Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63645C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSkEhYKCv8Go9C/M2e6tKoaoFex90ZI4uQi8Tl4I0s8=; b=4UweefOdPOyiLAH1+ajYfNBrxh
	CVZeUZtU1TFOj4TmwsfqC8vnPa0yQY/6t5wV95h9KpU+ACuOqWks7Cie731qVknk5Oe386tINx/lX
	34CWgrpJXCRw/+uz8dODxtrX1YaEV1HBuszOAn/rUHi8BAkMmo9c7Jd5NQWK8XAqfz7ymkS2j3Cui
	imwG3rKkmSqwxVCMhS9/REpptcXF6HoLMYxeyNRfavKFdKtzx28bQdTV1dU762cy7x7PW/16FmBD6
	KQ0FKYjshO0qnSQ7zb2/pxgAnquJ1C/8fYD8CId+rj2/t4qvlJLwLxafRKBnl6AG9rLOKyt6ZzXP6
	sPnYXL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZWC-00000006lfw-0xcM;
	Fri, 21 Feb 2025 20:21:04 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZRt-00000006km7-39Fs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:16:39 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so4742968a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740168996; x=1740773796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSkEhYKCv8Go9C/M2e6tKoaoFex90ZI4uQi8Tl4I0s8=;
        b=X8Li8TxW4S9gQPzjQ7zjtDyu1xnTUOiEclg13FJjSyP7ZrBOM+1ObCiRuSmPWVM/S1
         FSUFgPtMdv32VF2yNPUfTmuW5BbN0ssvEhxLnNHp8602CWVF7h3E+tN4exzxWRjN1oWe
         +iWo5eqJCduGzsolUxhHuXBkN7qOj+TpxZz4zOLXPwMYBcebQXpD/tr0yX+vdK9mD3Q4
         s+RBRsJwVx0dWN8L8uilzVabnEmWOVBJGq4RTC/Rh9qmpy5Tq5/ZYeuj9FrLtWmHt36x
         oRg+p8tblqTO2+XcYYEHODPgO7YEDsjLTJ5NlD2e9S4eHitsOKS0MTd8q3GrT9tpv0L+
         PMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168996; x=1740773796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSkEhYKCv8Go9C/M2e6tKoaoFex90ZI4uQi8Tl4I0s8=;
        b=DEaXhssHwgxljZD86MQSzaEPqS1fHa7heepc9gd3eDen6YqSFTJ4fH1y1snQzvBsPE
         rX+7QeW/BZQYARgB6WA2W+iqUeMM330nHBT7OgnpVsniMaXyUSgrov8guHWqcuADQ5C6
         DUnGE/oz9T3jsmXQvABBRXgVpYWfVCQucjkNrhSxJ7tdG42KVUWdem4OGMQq1LcSHptW
         CPaKe5d+Jowsg2LD3JHQLmkTk38cgUOAf+a8LPEihJHAK7WaSEwKb7TF3I/pzpKaWsSy
         8KtjfnPXxQaS4WBbinBadohIsQqN6owtuuXBiw9PgDnlKirV2rD88qYhhqEtlxfcgh4P
         X/oA==
X-Forwarded-Encrypted: i=1; AJvYcCXwvomk3fqZKguPA+GP+r4rsvbasZVnnfiZflPQiTEk1UImCLCWjYGyl7UWK2giKZRlICx9Wq4PzAErak2+yUhq@lists.infradead.org
X-Gm-Message-State: AOJu0YwmUkpwtWqPbF8LU/rBaCc5CycYCLgBJIPnNL+69O5uwUylUeTo
	6qWX3dE5YUt5crO7uNvQ1Hs9Zpchdsal2+OewtBtkp3q6ezqDqEI3SoPyf40
X-Gm-Gg: ASbGncu5pCg+sr95vq1p9AAKxfc7iyVtQjJ3KSLh8z+A9IaVAIBFYIQXJyfUTewRygR
	hVkerzZ3Sh707T5mXDf9JQQEypuNb4Kppcj0It8SFtTNgw0n3o1JZBU5m3JmJykpacjvUJaDKIj
	Z3N+i2f5TsjS16M019E/2daw/5CNVv0eJlN1OQFu6wuMCV7CP8ClnScctiHasV1TAORR1yv2B19
	lPLa+pQFx4QyFqEpuLUrkU5Njsmk9rF9ADGYa7VkMytqq+LKTX0C9EV/22W9HqYDm5KLFJavCR2
	yjUci/aKInCrU5GwYNHJvhFju5gEEMWN0oG1USKkjHoDTaVnASGA03qOm4vjE9Lr/Gl4rZ8o
X-Google-Smtp-Source: AGHT+IE3uy7e74Z+u31T7KVhBW39R/G/jwJ66ELMVXMdLTdk27vCWM5ELOuSEcxzux/nU6WaQzSBgQ==
X-Received: by 2002:a05:6402:101a:b0:5e0:40e9:2383 with SMTP id 4fb4d7f45d1cf-5e0b722a4b5mr3770628a12.24.1740168995996;
        Fri, 21 Feb 2025 12:16:35 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm14127594a12.12.2025.02.21.12.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:16:35 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:16:24 +0100
Subject: [PATCH v5 2/9] dt-bindings: mfd: brcm,bcm59056: Add compatible for
 BCM59054
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm59054-v5-2-065f516a9042@gmail.com>
References: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
In-Reply-To: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740168989; l=4358;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PpEuTiDGyKp+riMoN5kE+7sYmjtJ+zWPti/YD+YCl7g=;
 b=Gmgtbs2dSEuOcE/E/9neeGN7eQA4y5mZYwJNY7hTrjcBSfGkknk3ODpPp2cZR3RQsCkS/Mprs
 UU4jA7rnGQ1BMt7AlEVlDfAKZR4LKTlWuP/KVKJJOMCTBbItcnOuDB3
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_121637_793155_144CF8ED 
X-CRM114-Status: GOOD (  16.61  )
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

The BCM59054 MFD is fairly similar to the BCM59056, and will use
the same driver. Add compatible and specify the allowed regulator
nodes.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v5:
- Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
  regulator bindings description

Changes in v4:
- Fix yamllint errors (missing unevaluatedProperties)
- Drop comment with regulator name list
- Use full schema paths for $reg
- Change description of regulator binding to mention BCM59054
  explicitly
- Drop quotes around vbus reg name
- Change "Power Management IC" to "Power Management Unit" to match
  official Broadcom naming

Note that I did not end up moving the regulator refs from
allOf compatible matches; I explained my reasoning in [1].

[1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/

Changes in v3:
- Split regulator node into separate file
- Removed quotes around compatible
---
 .../devicetree/bindings/mfd/brcm,bcm590xx.yaml     | 26 +++++++++-
 .../bindings/regulator/brcm,bcm59054.yaml          | 56 ++++++++++++++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml
index ec02486978efdc66846b33963f075b79184425fb..d9977091e9da2055c7ee1187210aa03844385971 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm59056
+    enum:
+      - brcm,bcm59054
+      - brcm,bcm59056
 
   reg:
     maxItems: 1
@@ -21,7 +23,6 @@ properties:
 
   regulators:
     type: object
-    $ref: /schemas/regulator/brcm,bcm59056.yaml#
 
 required:
   - compatible
@@ -30,6 +31,27 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm59054
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/brcm,bcm59054.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm59056
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/brcm,bcm59056.yaml#
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5404a15884ebc910924614ea49d18ec87c8638ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59054.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59054 Power Management Unit regulators
+
+description: |
+  This is a part of device tree bindings for the BCM59054 power
+  management unit.
+
+  See Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+patternProperties:
+  "^(cam|sim|mmc)ldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(rf|sd|sdx|aud|mic|usb|vib|tcx)ldo$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(c|mm|v)sr$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(io|sd)sr[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^gpldo[1-3]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^lvldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+properties:
+  vbus:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false

-- 
2.48.1


