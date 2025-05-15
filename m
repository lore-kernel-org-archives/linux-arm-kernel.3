Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F6BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUAKfGSHAephwzkvvqYScDjeaSuBh+AeZg+JkcSpqSc=; b=L/awLbRF7DVaWKp1iKXg8bxWBu
	jMFGOPSZM4C8gPsRBRbF0hUJbGSCqa0XT9t5nlk2xqgjpqdYEAWPQd+bRWXhsMXFEsRo2tT1NiVgZ
	LZ9x+DvO2YGTDF3YhEGDz3LIjxPops6KtQMYjPldCn9HxEb71RhoU7KYXHouW1bQiD+LF6aw5jLj5
	QSAf+9yp0LbsBkURVpC/B5YqhowvgEpypBdIljRFQt9MhP5cy/VlfK2GPLpT0iRUuX1N4Q1J7M1v5
	YHtCYdfEtjLC58zn3QgHX+XIhbtuFln1+rFw2IHyNLHp76Ye0cVQAfDRk+Df7c6AFBh+5PAXhhGWP
	M+0EpNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZTz-00000000s4P-2Lsl;
	Thu, 15 May 2025 14:22:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZO2-00000000qvf-38RI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:16:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad2414a412dso180680166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318597; x=1747923397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUAKfGSHAephwzkvvqYScDjeaSuBh+AeZg+JkcSpqSc=;
        b=H/+G+FkCbRBA52G3pPR5NYM+Y0NZUp0b8K+vqZbbQhiy9Vd92inO2k/1mCfBJbVq45
         bEjKjzzQU2pjPzpDrkYJWJqxDD23P3wPrX6L69wn0vXPfiHp6WLLSO2GiSKPmu+LkUDO
         y7S8chZGMJJmY4S8Zc2XJYEgrRSV1hjMFYLntsoRFnoovJ7YvzAEZCMWUDQ8exqheQi+
         0IVRO2VoXc4RDFv/G/+h9Uj/+qp9c64/PfcHNCZxLKjcd8mbyXWVuedFFe+fwN1/Tb+n
         +p7DSjMyAl5aKhm9ZGLZ0Y7bkn7O8WswTijrZU1rnpNLlzsuHNkpWBRJF9oCGdOZH0HL
         8CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318597; x=1747923397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUAKfGSHAephwzkvvqYScDjeaSuBh+AeZg+JkcSpqSc=;
        b=A7gz0oYauG+NIfSXi9PgJGM2G484u8E3vR2RqnWab8w+03vo1Oeq/QPhl5521Io/Wa
         F1sOirYfLSmgHd21y/5La7nI5QCy1hCQnMpq0eoHI2MHBH0DI9Pt74/WNxa1DGrc+Ku8
         3WM+nN8Bb02nwgdjuSSfUKBuuZSRkvV7zvvTNdJNFOxVHOy0fJcEHwFz0gB03U9NwfYW
         aZY/X7tPOOczDdRQHgpo8mraQfqpOHcRTxREnXea4YsRu7wks3tiiuyGk3zW6ygCzLZW
         4NL3iFYrAhaLJKtsXoW6kMazQNuA/MsUmk+b+oTJ3QhPyfIY7DusxHmlnzgzjLXcDLYh
         bP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeRITrvzBWosBJeb7DUkvhUJYJ0GOWx1GBHZVXU+7fCBCgmNVX8idNvq1McuOd2rHByOsc3ptrgO/7ID6iBy1p@lists.infradead.org
X-Gm-Message-State: AOJu0YyTxXGxyqIyh6zYMDHKsLZzuWIieg0w8l1Hqz+VBecZoErUOyaO
	uR8c2TXZEQQvV4mQA4gE5HUwSHiF12vN6EvFeMuo+3/GD4/DmQd0
X-Gm-Gg: ASbGncvTT0x6QyazAjKkJGmGjtGGLAPh5nAPPaYzbJa9eutJN8u3bheLALs2KJ1Pu/J
	YhXJtYWlzIYwcKPCBTjwD+x7zaihI691typS9sLaMMf958ElmHPrkmodBdnI+CuKMMkmkULNJlV
	fZg1CPY83k/Ywz1iKWASbTk/d02aozaCunbTGCNWGmwwWmACphEBNBcYuLxRirCCJuVy9rwydq0
	jSeDREYVlgLk8HjZF7UGYrCgDt5hrW+iuBmEMJLV+aKxzSo6AjrroltwxGlOzQyMGGzNlrWjakx
	oqHz8n7ylHJ3MMIsED1AAAjInd5+XI9yHKiut5AxZrzJnUdJ0vg+H8LubfEXahmSvFu2gOfdje/
	26OBNuYSmFtPUDJopIXN52g==
X-Google-Smtp-Source: AGHT+IGH4uAijkHrPJ8SE6urjZ2Hq8G2vtE100Phz8L83U7VYNex0D/QaJL6ECz27Y2hKGs1s+a+Aw==
X-Received: by 2002:a17:907:268d:b0:ad5:2260:e02d with SMTP id a640c23a62f3a-ad52260ea7bmr138931566b.42.1747318596371;
        Thu, 15 May 2025 07:16:36 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:36 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:29 +0200
Subject: [PATCH v9 2/8] dt-bindings: mfd: brcm,bcm59056: Add compatible for
 BCM59054
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-2-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=4546;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=pl2HEbe+CyuHOD3OyLZCSAaiFxQmceMkPEwlgJ22HCI=;
 b=iMNOwu9LI02MG4hZzFjCkGpeQJUyEniAZud0282jaff5Atik+g2EuLWpiaVkmoevA8XzZBt5p
 F5Uf6QtbylhBiwaFdr8jeo96Z+Xh5JPog+Ch1DNXMiJ2fbzxsI4eLLa
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_071638_790147_383C07D8 
X-CRM114-Status: GOOD (  16.84  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Replace mfd/brcm,bcm590xx.yaml with mfd/brcm,bcm59056.yaml

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
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
 .../bindings/regulator/brcm,bcm59054.yaml          | 56 ++++++++++++++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
index b387ef9885c3ac524e0782545dbca9c0e81a556c..b67d7a723fc242869e5bdc6b3602785f62af45bd 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
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
index 0000000000000000000000000000000000000000..5b46d7fca05e21aa1eae991b5f9f60b444f20c1c
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
+  See Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
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
2.49.0


