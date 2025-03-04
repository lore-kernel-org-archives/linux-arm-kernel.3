Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEDDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Uy9CppE4fbZwaD1unI2/hAAzqWfqC2phH0FTdQH/0A=; b=xhP+IPVjn5AyV7IHDmcs+lAzQK
	6Ed3c2USra5hJ5gQe+dDrZ0JhROs4nS3CfQjkgODdTKRd83HynNNn28r1YHXNeOIsaCj0faYqM1FY
	AN6YNp0w1/YF2DAKhKp9gvYdS2BgechjoZYTAXdCOMfJDGWDFMJ37BRdVXo86oSACzK0a4B4Tq45t
	S03lroZq01GC5Ejx3Cv4Rc2BTc9aC4WDw7YOND7ZUvK5Dg3xIAb5gWtOvFvrK7LKIZwQArMEx2BPQ
	EMkpZjTKxvs7VX9ur9KMiWFqdTJ+kMhel3lRV6Bqc23moQKwmTgJUxykYY/MoTOYvNjGHyr0wZMdz
	CP9WxN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLig-00000003GQS-3Dgv;
	Tue, 04 Mar 2025 06:25:34 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLe3-00000003Erx-0hMH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:20:48 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e538388dd1so2695435a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069245; x=1741674045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Uy9CppE4fbZwaD1unI2/hAAzqWfqC2phH0FTdQH/0A=;
        b=lREdU3bEADY/TcKYd/C2uynHepgCeymaJcE7LNoVlyGSmzY+7JznFF2ogG0fHuhghl
         8OQ+6/2QRlcf/eMxrqAEj4lZV3nh+TFuRdyAm79MnFqrr6q40cc1IXrvv4q+tfNSE6eo
         GBMx/pQYRkx9HYkqVebEgqiF/jE5K17cEHFjuEEtYksk70KYMcw/mqO6wPzcIv6wI2C1
         BoqMwyc/LzluCSq7FVfJZms/GRdxiYyXtqzRLZ2nd5da0eL8bFlWszL07CNaKUyEjy0P
         Zei2N15PAGDB5wNLDo8ooe1ElThZYUwPq+GvCfbe3Y4UHFqoxzKnB8ZxyXnl/VuzaHoF
         UxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069245; x=1741674045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Uy9CppE4fbZwaD1unI2/hAAzqWfqC2phH0FTdQH/0A=;
        b=SwlBcbtpDXdPq+jguJmd2hCiH7RVQHxsIMHmQIrGtoivvzQdvt78RvvYekSB9SdL3V
         rgM9toDgnowuhMyZt03zhXFR9kKWBV5jmB8182HLg/fJJ3EDlqzCSsYsoSs8JYuKBOrl
         AQgs6EQhdmEa3RB5Bf8OrIzVeUR+2rHOkKFTNuMGR6mEAXUshKC1OFFu7Y7gQ6FGNIVu
         eNkLxSIXqoKuLLr1tKzK29vIPKigUdalE9kjEPGUUZ5koP+rlrsyZHCqgVmwBpFC4OLC
         ioRH8doTHO/zTOig3073xxXsdX8pFtikn5Ww3W/B8KuO8ToMFe6tT9AvkLoLtMB4yVjt
         Aydw==
X-Forwarded-Encrypted: i=1; AJvYcCX3kVJfJXaRKeKM4Oc5n+UCIyTbgxJIANxxtg6LRO2TenkDivOvkzkqz+cYzBTH+cCgM6iSXlV3IoIaEH5/096f@lists.infradead.org
X-Gm-Message-State: AOJu0YwfhothFDkoTY4BRGMGcV4x0oXGwyjzo8i8On8O3rWHQpuIQdCB
	SjY1ymR6HH0+0JPjeDUcXGsbLDiD2wp6jFC2bDDy9pVWvSAX0Q9Y
X-Gm-Gg: ASbGncv6RqYZvus0wMTgfU+ZHPo2qar0OZso15yQSfezWBbJBwCaD/duJ29amPKFwBB
	VG5Z5R/qSoiaq/doqGfUepvW4DWgVauN2l1QK8AX3Bn0AcPbJfjlkbz5UFeBLsld5JBpw4VQq38
	6ZGfJkYE+YbKUvUOO+Tro59d/GIuTIJrOfJAuZHJpbAetH7bZlzjUmIEF80ILnGGvb1wNqaWfOU
	XSatEMk9YtGMSjhieReIbEOI/KavHBhbDVzAEzm6Utcz9ecHJBEs628McKvpUIuHvtnwQxsuoj2
	xPWESRanQ5R7LMKIkECWrE3qAEr29s8YDVAeqfVTsFXssRuVZADqdBi0ApZhOceDISx6PJuGdEg
	C83ibc6EBUYtOX+8=
X-Google-Smtp-Source: AGHT+IGLMAjQYLVLVvGSKN+OkUAaJuck5uuxbpRXNQWss39rcpICZpsaoCC9ihIlGISZaUMMIf1qeA==
X-Received: by 2002:a05:6402:5194:b0:5de:c9d0:6742 with SMTP id 4fb4d7f45d1cf-5e4d6ae8552mr17478973a12.9.1741069245106;
        Mon, 03 Mar 2025 22:20:45 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a663fsm7609036a12.68.2025.03.03.22.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:20:44 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Mar 2025 07:20:32 +0100
Subject: [PATCH v6 01/10] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bcm59054-v6-1-ae8302358443@gmail.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
In-Reply-To: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741069239; l=6165;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=OKN+CN2A+d56Fb66yEYr6DNfAWGIXyqUrcezaW0HQS8=;
 b=Sz/TenvJJpGfls0lmsRYFKWaNtab/Ze4zaOPu0banvBFS64h1ePKoPTxx4EostmqPi9bFbd0S
 nHD58RwkgGED3Mqqw6qt2mrjs70t2+pZPVeCH/IdUZxafLHzIaLl1uX
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222047_216214_DD2E44BC 
X-CRM114-Status: GOOD (  18.90  )
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
Changes in v6:
- Replace mfd/brcm,bcm590xx.yaml with mfd/brcm,bcm59056.yaml

Changes in v5:
- Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
  regulator binding description

Changes in v4:
- Made $ref use full schema path
- Cleaned up example
- Dropped regulator name list comment
- Changed description of regulator binding to mention BCM59056
  explicitly
- Changed "Power Management IC" to "Power Management Unit" to match
  official Broadcom naming
- Renamed mfd/brcm,bcm59056.yaml to mfd/brcm,bcm590xx.yaml

Changes in v3:
- Moved regulator node to separate binding
- Removed quotes around compatibles/vbus property
- Style fixes for example
---
 .../devicetree/bindings/mfd/brcm,bcm59056.txt      | 39 ----------------
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 54 ++++++++++++++++++++++
 .../bindings/regulator/brcm,bcm59056.yaml          | 51 ++++++++++++++++++++
 3 files changed, 105 insertions(+), 39 deletions(-)

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
index 0000000000000000000000000000000000000000..b387ef9885c3ac524e0782545dbca9c0e81a556c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM590xx Power Management Units
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
+    $ref: /schemas/regulator/brcm,bcm59056.yaml#
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@8 {
+            compatible = "brcm,bcm59056";
+            reg = <0x08>;
+            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+
+            regulators {
+                rfldo {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7a5e36394d216232e0a2070fb20d09dcc1ea8056
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM59056 Power Management Unit regulators
+
+description: |
+  This is a part of device tree bindings for the BCM59056 power
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


