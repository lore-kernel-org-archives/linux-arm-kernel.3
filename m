Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D4EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2a5kh801vl9iToE3scZElc09JqjoduUAaLOK7aaGhA=; b=r3q1AiMjQ6bWMB0HurAwXq06bL
	/0BHrY4CDE4vvYgLacc0AMi+Sc4PnvxgJTLkw/kcDtzjn7BWnTfA7qGa0hPdGHMBZKklKT/MKOFLY
	mWDfsF8D9OhDwWqOxjTTwi5Fhc0Pw0JGBFSSZsyf1ZS4DNQeoEiH3c2Ws/ASnmvpNriOXPLT1QfMP
	rdRj/HqPLfxWNA6lzKWxSOiyO/V+FBudN7ZRUBpvOmYgQOzLXYcfsR/ZVhovIZsYoK/oHKINMZV+4
	Iv5cGif4KbUJcNFQwZf+bGWMhw+JOR0rLw0NKzYPZHfavs13TbBhgclFvaaK8YjNhCQwTjkGbqeqK
	ZEb5FSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsew-00000000SjB-0mCR;
	Sun, 16 Mar 2025 18:24:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsa0-00000000S4R-2mij
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:21 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so533242566b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149159; x=1742753959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2a5kh801vl9iToE3scZElc09JqjoduUAaLOK7aaGhA=;
        b=dZi51rzSlF0Je09SN13F+OB07ZyeQQyDOWqnisJjzZ7apbqofHEgdoq7MNplVipdcG
         b5+3nq0flskgbCImtffM0N1xenjmyeVC5pT7tH0A/fW0oCsOyo0EiHOS0f3/cFdUfiP2
         GIErFmvtRPfosUdMZ8QqC/BL0tFUkq/1i7g59r6yDPjpYktapUix5BhDLpNG5wjmJstu
         R8oEyU51JljyuRwCO/Na2fegTEMybuLwd3CWPC89yANDOs5fifQcF232sRaAtjqmTjn8
         UlWTiMkjshe28HRRiEZGJ8GcPDTVWh4QVoShSsNbjfd9Qbs1Eume4sveTohHuqCx8nOw
         XC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149159; x=1742753959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2a5kh801vl9iToE3scZElc09JqjoduUAaLOK7aaGhA=;
        b=mCvSZLHPJoPfqgH2760HDIpw83OxLDttGbQzPCGRCHLHL6ML4dZB7AbNUxdE3icG5B
         2MhV+IO8t2K9Vuxij/f8r8FBZrY9koI5deena85bCIMPdyv9OpnMc9xsoJE1bRxM35Iv
         GRURR9co7UQVpjsONsojyHfjYsm4jORX6sOoptX1rMXkUG96/Y82RSVx8tunIt4hBqAJ
         P2PN/PKeKy+ua0pohIScEgUBEejE+bpEzYSuTNJH2UfJtkXAcCk0DeQGI8jBoZCeJsp4
         ZM4gKK9AOeVRzwYVW6xtMvTL/3cwjKRzkiEfhbjBLIH3WiWIP7zoMkJwBMpuqtFaUUm4
         RwYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZuzfBXlZ1R7F1Nu9/UwF/ZaBndGrwDcdos+65s/00rO1WCiKmDjsJfA5TZc3CUUAl8LQq22MbilTyfqqeVI+c@lists.infradead.org
X-Gm-Message-State: AOJu0YzpQiiJX9FhChGbmGWOEBP/KnBBrPbTwNErK3DBAwIPNm3NpWxl
	qiKuxUuPJ+5VSxCkV66RZKWT27kPJxYyzk3Wxwd41VStvAkDzjXt
X-Gm-Gg: ASbGncs2azTwzmJ4uhQRtzqgh2ysjrKKck9Rf3tF1a6PYms+ZU4D4rVwkxojIhv/Jhw
	bqpypy7rVyKwtu4rHtkndiZey8jgVPHlwbNwprKOvqunloulGM+Jq1wQ699yCvC+DWjagJyTpXK
	YkVGHq4aIuhGlzcuaGqpB1rbPEZjK38O/02I7FxOWIexjS8Frawu12CpXzezrA3aPG39PHKV8sY
	dxl390kOkK8gJcMPks7ZAwaQ54RaIDCcS3Mj9dBEhVI4bI13aqD50h1FL1fF5w+FL6PEfm+UcGR
	xJHrU176btaPlhqIGUEk9pOd4A/TdVZCN/WeBS9vWuaFe86RBT4CLu8pvesjFaEL8IcCEzHAyyG
	gV/7N09NyNVhiCdEyNw==
X-Google-Smtp-Source: AGHT+IGTb97sCzpYsDhmihcnk9Aluh4vlMNE+WF/B/S4d9ZBrV6Q8S6OHoKG9rtKiJt+ZbLxdPSc0A==
X-Received: by 2002:a17:907:72cd:b0:ac2:6837:6248 with SMTP id a640c23a62f3a-ac3301e8dacmr745340066b.30.1742149158591;
        Sun, 16 Mar 2025 11:19:18 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:18 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 16 Mar 2025 19:18:50 +0100
Subject: [PATCH v7 02/10] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-bcm59054-v7-2-4281126be1b8@gmail.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
In-Reply-To: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=4488;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=dm7aREBrSuogWhHL7IYSSu3jO/9Oq8Tet0hiRF+dXhE=;
 b=BNVI0vy3mD8vTpNEq1/ixssqPwEcWdvXJtBIodlHWEgY3UXpyNC+0tDbUipAzCn6j1Pk4sRzP
 8IME8svoMkSDR5V2lL5PggUyCBWMHc8pg1hoK8l6ZvPkouu27kMK1dh
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111920_720553_A7592C0C 
X-CRM114-Status: GOOD (  16.23  )
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
2.48.1


