Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1601FC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsdoJSin8peETgUZX/EH4A7o3cuAiQtJzSEsM3DCxTg=; b=wFURz1hIXroyEDJZMpL10NYSfc
	Chg5IZLIwf21uYaLb3fmX4NTc5Cg0XHQbzRhi0uCeXDarvoGXKZdzMuHT9Z1c52FeTjjnZ/70UIjQ
	XWxzZDKzd/Akt3NfRdpDaJUL04U2VHbJWsK3/FzTA2KPPOiDXfU2pijShRV9Yg2RryRS4PdHLjfDP
	dlBMEWOTHLEuiqh2WEoLN2J9NVHGHN+8IUfVLaWhdBYj5tj9R184kWQM8xqXnCD3uzo4AE3ypFAXY
	rIPg4Vq7P34Mk79fP3f9Ms5iTspmNOSGU6Gf+rACJr8FyMIctdKFU8GgW9ful6zCMmf4nF6mQCdEc
	RznPGr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1f0-0000000BxXS-2uhb;
	Wed, 30 Apr 2025 07:15:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1XR-0000000BwT1-2x12
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AsdoJSin8peETgUZX/EH4A7o3cuAiQtJzSEsM3DCxTg=; b=oRHTRCwXKuNXDSK0mSXGV4MzkU
	599cMhtrFVNfvFtU/4Iyu2jJgkZIkw3svjn21wkMG0SEtPCG7in8m8bN4ZslMbysIRM4DHk9pWu9g
	Zll6Rm3PXbPEEFo0hBIVw0EjhPWwx7qjWvQ1oq/BfdHyM1cT0a8se6oMEPe5EVwjCGaO1IN0DFIF1
	Qx+kCqRGYS1fUe4pb9ZMsTJcGHe/vTpigjzdSM+DkkkWzaY9eZJmaMh9PStIaasfXPiAQ0fzV4Zac
	KsZweRzoxa0DkbwUBpBdnbIhrCYBLtLL5SJZ11qZYOIHt2joBmYQzlXNFNGq1z8ypdcQUoxNvjuvD
	4oUSYUGw==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA1XL-0000000DiO3-36qH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:07:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso13452119a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996837; x=1746601637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsdoJSin8peETgUZX/EH4A7o3cuAiQtJzSEsM3DCxTg=;
        b=MoMigMplJey75B8cA2xMugAW5pq8s1NkWxGrh3BgtBtcBCRTzDOXzFKQ7qW6t6Z4qW
         oRvZU8m2rtxqhdC3IsYlKsOc4x/3+0I5TmExV7BgSs8UB6QPmNz5liuUvdiyHew55p3l
         kl0dAz7coe/ePL3l9sJ6g1REfnn77XgF1j9Uiku3/tz3w4xCzNntBB5i9thiXkgW81Hu
         iHGutOim8hoFNPmh1DxLV5i9jEY0Z40vLbrd8uTGT1CoZOJrX8V7ST64hqAsJSIqbpVP
         d2nYZ03VsgPQNcc2YXmztytAy5F1vddt5dkWXIwx7vGrm4jsYTHHfTi85nspRznu5E8p
         yHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996837; x=1746601637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsdoJSin8peETgUZX/EH4A7o3cuAiQtJzSEsM3DCxTg=;
        b=GQXc2+unzochkqO1rz173la71+cg8NRH/iPMde5/kKdnJm0XmazIWTznL4kcbCcuIm
         qKFOphzNoyjE95EToACJDQN6v80CMKlj5p1L/q/yYHKenFtZtIZvYUAhGE2HoYZPyWz1
         QM6lar7W+1UvAiD77dCdXBbnZvRD1XXlSk+Xpnfg66zDYZNLEqXG+LAXysNhdmMrFPjU
         v1wOFDJhC6WsEVaW0GcKxVZQlMyVdOkPJfucmsLC37smZp7yJv5pjsKUjf+SWNVA1YYn
         GM+a4uK0cW8jHgaPfuxsYjyeQGJ4bXk19YXDWiOls6nED1FQgetGD65RBKbZ2pWiV3RE
         Jtag==
X-Forwarded-Encrypted: i=1; AJvYcCVl24wnc719xEgJtJug93B/OmoF6hPcn12eJ/Ft/hMRHYt4IbJCPayiJkb2kEBI0nKFI9YqUSB3sPFZSf3Jc4tM@lists.infradead.org
X-Gm-Message-State: AOJu0YxvjJ3SJc9edx18P4MolphLijirLj5nNLp2wcU4r/YH735CcfOA
	yyTvpRX1ZNO+ZgI4M9/dMEhZ5EloFFYCw2KBroOzCoF4ZyHgowD9
X-Gm-Gg: ASbGnctNvCCJxlN3g1XBz9jtnX5qe7/b6NszBD21kk/WniMKJyz8JaAOYDSPjH7hFYV
	OOciQwi2apSsKhmwT7wKkFSTT9/2gx5+xpu7u3BJs0RoxcEJYI26eILyYmb1akLU+haCkI9Pf2E
	+eEmUo6b/2TMsNxsbAU1CZS64A5HvGXc/yJOHWwGsBI/SpQC+N+XDsVx0eMLoD5/kYFcaXSEkhI
	iIHMachew3JkfZBLHjmgXrQtSALeGN0ckRkwvbubWvT8UnmveFZrJzX7jOVz3Atsjzz5YnTBafC
	NQqI+QxHBMPDkFSbJ+eqESZV96E1gFZ8UsdU6TIvHLteWd3StGLKr8ngKvS9JAMPO/6GwugE6oT
	1RcAZ6tWv05OED1cNalwKPg==
X-Google-Smtp-Source: AGHT+IH7C3G6uB8DnhJutIPeMwYVSq5CWSioYsidNZcpPZr8cTBg9evZWDUTGYfQNanBPXB4XkSYMQ==
X-Received: by 2002:a05:6402:50c8:b0:5f5:f890:3dd5 with SMTP id 4fb4d7f45d1cf-5f89b254ac1mr1398704a12.15.1745996836582;
        Wed, 30 Apr 2025 00:07:16 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:06 +0200
Subject: [PATCH v8 2/9] dt-bindings: mfd: brcm,bcm59056: Add compatible for
 BCM59054
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-2-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=4488;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=C0axKSujZ/Zy3i7sWIyGn35sKk7Z8FY2faVK4kpx4RQ=;
 b=ZjctfsXHvdz8eCGR8T1uMb9UeGC0Dtwn8c4b/zVMbMkqpVQdFUZo85lGKSMxyKnvJ3f+6tKV7
 NZhT5i8hmMjCYU2eQJV+z92eomdu6uKk5snBgSNrjU5BIAvwB/BH56d
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_080721_366395_DAA6768E 
X-CRM114-Status: GOOD (  16.83  )
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
2.49.0


