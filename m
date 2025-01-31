Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC69C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faHjqb9bX1ActelU1HLJ2Bi1CB5Zkv+nbfbnT4awVJ8=; b=Tei6/jd2jGn9wdIQ3WdvgqhOWd
	g0pg2evp9kviXAPYhnfH7OEWNe7Y/0ZfFyA/1XfCzFOfQr5sLpKTR+Q5Ftjp+x+/HL6Hb/BkRwC/C
	zEeRXxSf30g75jkdBXc6OnRseQA3KMbW9MJqeli+SQQG7pXMhgP4UPly2Hf2q60blgMGfFRCCDRr3
	WBp0qEuA+hO+VG0uj31yBPD3/dwIlmaBzP7Cklv+/m0H69OJWj87lnKUV62yvHilCSB6OwUaA2Vc/
	n5qdC6OiNLKiMEIKK0/IbeLLASKzSRPwmNuCpCcQGNtsh48p00HPGVvrTnarrRMv0RN7nXfWt+Ng9
	zqi+BlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvZF-0000000BBmC-2amH;
	Fri, 31 Jan 2025 18:16:37 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvWf-0000000BBFJ-1CYL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 18:13:58 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5dc82e38c10so1971968a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 10:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347235; x=1738952035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faHjqb9bX1ActelU1HLJ2Bi1CB5Zkv+nbfbnT4awVJ8=;
        b=bQINwLZkH+89NGFibKi6VVoe/HLlk3chnW4zIHXii2BSIM8P3dMiGq12UHvUfY4h7M
         lCZZv5EkorpgxBeYZb+THSqaegjTnLU6C5mNoUFNK84+Ukn8w8J9ECxJUCO69/r/eFSm
         sIolByjzQ9lUDDCx24th6l3Bi6eh05TOHAWAaolb7dFFiGf7P+LHBoEa4cnT+LEEGKnx
         UBpslGzN0anPFkUWSk6xHJRiY7xV/NRO6mpCg9bUX02FNfL/Vadf6BUh81X7sIAZzW5N
         rSyInrixLoQWs3UfkhsDU+uGKjtDG8QHNGtiyUUFeWGJGCoF9B9+GMgqrbtqzl07jkBt
         52Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347236; x=1738952036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faHjqb9bX1ActelU1HLJ2Bi1CB5Zkv+nbfbnT4awVJ8=;
        b=nnXP5ALglQHWzfEtM15E0UrMCbjn84colHhu4Sh00g8rfApvFZmvBlNW55tji0ZpGg
         XZGq4uEBFEy5ENtNn6Pix7iNGpJxsViyLu+sba66lgWevcsXqLem8+F2IuJjKc/2ymQe
         6IG5kM4OVs/LMux7gQ6dNWFW5JvyUFR+S7ViDjcbTJv4/XfxZwnTtubvNi8S1E+XLPWx
         wHo0TB05cjZGCDNHznaWlnHZGGyeXF75OiL/gh/aphRw9Fw2sEhrGfBqw0U2h3rsWE2h
         ldVTk1x/WdqkzeYrCZkCs70dxtum0JJG7nw0cGeOxRCBN6x/g4n45mU1HAlL7bsdt0UI
         TTcg==
X-Forwarded-Encrypted: i=1; AJvYcCU047YOXc3lUHrrMQOCUkVg19oN75jTafbRNQkxhNdasCEBJANjmbFtwOUv55J/tm2p+Sha62R6UzDz5tQq1Azv@lists.infradead.org
X-Gm-Message-State: AOJu0YwZdtqUVtbXZxMAwh+UX0xnPokVcaLwj768oqxE+1kofr5Dd4Hm
	H2ksXYKw3xNEC3/xD9nJFLez9e03zoYQvMOAidr1d/RUQwTShYhG
X-Gm-Gg: ASbGncuuKT6IQulMsstKSBYfIMAdUm5GzHdGHadzbAFbSb+LwMqXLqtQ+yzK3QRX/kH
	7bJL6m0Id0Fc6efJxp1RlGhGiIqXbHEwmMTF0nMy73hTXyxwNkLWZXot+olxfJl+8Nc/BEIo56I
	MvLPuX2rSAU8gsTBQzQ9oATQk+SXmbAADle23jS/eMgUmhGOZ6r52k0HsKAatQSrFUL11epN8YI
	awdE2Nn94jHp23dLaIW4/Ug/78R6nPcS+L8sm8aszu8E0YZy+EMdUowenm0GGeazg3vA4UR8gjK
	aRdIFlNo3wddZyTakubzwbb124xYA850fTBqt1ZxKHzY05rv/FPcMpJTb8OwdQ==
X-Google-Smtp-Source: AGHT+IFspwDCIn1E1Qiowgf07pW+ZtusY2lwLx7GBUQapWj2b5B69a3dlAFjE22iArENaT+MvWn16A==
X-Received: by 2002:a05:6402:254a:b0:5d9:a85:1a59 with SMTP id 4fb4d7f45d1cf-5dc5f0331afmr13746615a12.27.1738347235545;
        Fri, 31 Jan 2025 10:13:55 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:55 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:49 +0100
Subject: [PATCH v3 1/7] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=5927;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=it+n+q4v8xX5ycZK7F7lG+eJksUO7QTkZaWRNpCMKQM=;
 b=6mwnvMHDWmjEdJqGc1hOYTBsP3IP/edVdX1DxnIUKaNoazJR9utYdWiZ7hrIANJsgshoIExHi
 QxVSpRc990CCbEGhArmhTLnPz+WQFB1Ik3dIyQyNOHDt+4JUdxhjNs/
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_101357_332818_A631BA02 
X-CRM114-Status: GOOD (  17.78  )
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

Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
TXT to YAML format. This patch does not change any functionality;
the bindings remain the same.

The bindings have been split into two parts: the MFD binding and
a separate binding for the regulator node, to simplify the addition
of other models later (which have different regulators).

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Moved regulator node to separate binding
- Removed quotes around compatibles/vbus property
- Style fixes for example
---
 .../devicetree/bindings/mfd/brcm,bcm59056.txt      | 39 ---------------
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 54 ++++++++++++++++++++
 .../bindings/regulator/brcm,bcm59056.yaml          | 58 ++++++++++++++++++++++
 3 files changed, 112 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
deleted file mode 100644
index be51a15e05f926913b3a473648d977b25f1a2fbc..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
+++ /dev/null
@@ -1,39 +0,0 @@
--------------------------------
-BCM590xx Power Management Units
--------------------------------
-
-Required properties:
-- compatible: "brcm,bcm59056"
-- reg: I2C slave address
-- interrupts: interrupt for the PMU. Generic interrupt client node bindings
-  are described in interrupt-controller/interrupts.txt
-
-------------------
-Voltage Regulators
-------------------
-
-Optional child nodes:
-- regulators: container node for regulators following the generic
-  regulator binding in regulator/regulator.txt
-
-  The valid regulator node names for BCM59056 are:
-  	rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
-	mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
-	csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
-	gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
-	vbus
-
-Example:
-	pmu: bcm59056@8 {
-		compatible = "brcm,bcm59056";
-		reg = <0x08>;
-		interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-		regulators {
-			rfldo_reg: rfldo {
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			...
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3296799eb452fca2a4b03699fcb5aa27005a8e8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM590xx Power Management IC
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm59056
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: Container node for regulators.
+    $ref: ../regulator/brcm,bcm59056.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic: bcm59056@8 {
+            compatible = "brcm,bcm59056";
+            reg = <0x08>;
+            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+
+            regulators {
+                rfldo_reg: rfldo {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8939004d5a3f079c05d313bed4a2f07fbc473bac
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59056 Power Management IC regulators
+
+description: |
+  This is a part of device tree bindings for the BCM590XX family of power
+  management ICs.
+
+  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
+  additional information and example.
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+# The valid regulator node names for BCM59056 are:
+#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
+#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
+#   csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
+#   gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
+#   vbus
+
+patternProperties:
+  "^(cam|sim|mmc)ldo[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(rf|sd|sdx|aud|mic|usb|vib)ldo$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(c|m|v)sr$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(io|sd)sr[1-2]$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+  "^gpldo[1-6]$":
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


