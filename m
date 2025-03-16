Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65898C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnMpyxPQIH7YdCLtFOVkIdJffwSUtpS774knyvD88J0=; b=fGKU0/stezo1rvOkl5NtrKRjky
	a0UMH5/4Z4lnTMQE1DoOdZEYTvNqCnHYAWxJ9M41PAt++40z/bAhXA4mLXxkXmvR6YrL3Qs512oGi
	vA3r7uuheMHnXRDL1pYhUFgq0bpyZC7cfnl52akoDNh7FlFtwZnDuK1i5nmGaHwY+HfK/1vmlhp0U
	hIiM9BrvtM0lP4ZufyDTyX5+rn1ws8/CRobOyJxpCVyg0I+N9cgo7WDRGnqTVF2gFaKRuceK+VGUd
	FDnnsNvKOfsuDMXJyk3ANuj/f6Vvx3Pyrs7len10Z3aIG1bAPyOUkcFCDBNCr45iPHfJzcASHQPY2
	xhJy2PWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsdI-00000000SdD-224a;
	Sun, 16 Mar 2025 18:22:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsZy-00000000S45-1sOX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso176019066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149157; x=1742753957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnMpyxPQIH7YdCLtFOVkIdJffwSUtpS774knyvD88J0=;
        b=ZpEhIkmSTVAZO73JJxFADh8H84EyZVG1ApHow6kwrmX6n5LgNIwdwPAUQFMtqXbbEr
         tTyt/mIECuCyzeoznkgXqnHbKSWlvIW46pRsx5odS6ZmqUswJKm6PEUHaptu53JtiH9a
         9w4A5mL0J3CytV/jqhtT7Pnv/AoDz6BbK1eyP4aWYtJUl7Z2NuW1f7YejsZ2fEKJl8mw
         OfXjSK/Fy8bi/FWIgby8dqgxkaZwwXSo9+ocCHfrFNVhX5OKGDAODzvVn+lb7dkJx8dT
         KofjmObXWl+wcecu46fWPzsrOPKKI9YHyf6uMv8uzVbvNQMYn2R3ZZw20q7v/QO4eIKr
         5OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149157; x=1742753957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnMpyxPQIH7YdCLtFOVkIdJffwSUtpS774knyvD88J0=;
        b=RFXY259Wq8NH3JonjmmkgVyS6/fP9KRVGYQcjuyO0v6guC2gESsg9NtQL1/Q380BUo
         c6ZxnfLJiFoxGxqgdt/gXQkOosoQfKpzl0fCE+E9OZKOlWiOkDmy9t6bcbP4bUAk4ym5
         v7k5llW/7JnrIeqE+8kflp6D1VFoOGQV+mW7PW42rw4ptwMraPa7z1RvOruQTxa5Q+we
         fcuULKggfuyvWdri1KjkBPlM99M59fsHNMAAbFG6ZJQaZe8UR43IhUk+VpjXpi+sURwi
         mI4OjuxCi3OoCmNkQrHreGiLeso/T51ZHGAi+8tys2xW3/DcVA5Wqs6cn9uXSEOIku1Q
         M3HA==
X-Forwarded-Encrypted: i=1; AJvYcCW9e+ApGvdllAf86e6tw2ywhqkf3tA0GJfcm4bFZFJ/xTV6q1Jcr776lOiUMr1P17+vl/ieciwlnU/q/zmgGGZ2@lists.infradead.org
X-Gm-Message-State: AOJu0YxaGXnuBJhRwobZfJzA59wS7iSlzg5hwdGaByhGv5lxqQd81Qf/
	oJxl/qhFzLLAw/1w0UlOI5AvrvQFujclb41auvuUF7ik1GtjvgZS
X-Gm-Gg: ASbGncvBDnyrWl1phAdNSShWnZo5GkuPrFptlFFZyRqsmBfDw4sSv/fg4vvoDq5ohzg
	Xb38ZobIeUZ31dRjcliZc1OqXKaF0P7x9yvAMuxxwP6ghor9S0WSRrjpZrFH4mJAMd0GrtvXaJR
	f4DDcng2uxaTu8t/vFX/z9Z28s1HYmRZyq6tzJ0sG1XCVktsIHGrLE80VOJtEKDN7SBL9pBSklx
	pIYCNf/xSBh2vtoeZyU80e4b/VYfdyEK8ydYl1R9haWjAsGIHDJVXzSHW/VNbvWauthwRB6x1J6
	71gB0052tdtvhPsrYZ4GmvupLm1N/fFxOpLFT+44LhfxZb5uSL+8z/Xx3YCbGGSYVvLA/59O6b2
	Z/ExTZnfBeRWJ49X16g==
X-Google-Smtp-Source: AGHT+IFQAhr70MJ4XwZ6DKDUDwIJn3vYtCtIUh7Dn7cupIJ8YeYxNF7Cr6QT7zLTbnqkFB/NFOs/Qw==
X-Received: by 2002:a17:907:2ce1:b0:ac2:ede5:d0d3 with SMTP id a640c23a62f3a-ac3302f37damr1115698166b.27.1742149156524;
        Sun, 16 Mar 2025 11:19:16 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:15 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 16 Mar 2025 19:18:49 +0100
Subject: [PATCH v7 01/10] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-bcm59054-v7-1-4281126be1b8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=6215;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=OAWctLwMdQDVOcNCm5hoBkP7a2fkK16oIvczHEI20U4=;
 b=SYTovKYVmUN/Yga/71mRrYPExyZ0hy2UFA5UVlzIDC53yY67XKpMpsziy/MPtO6JHUGa3dA4p
 rJJ9u9LELjnA/mkQ4cJgKrgYWixfCEf/VcuE2fvhi9avPghRcBfr1Sz
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111918_492910_E7F09B19 
X-CRM114-Status: GOOD (  18.12  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


