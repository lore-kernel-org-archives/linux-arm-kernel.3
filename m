Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F22C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrXQvrzz4wmn33In08eidQK8XMAndmPCx4B1Koh1dGU=; b=YZA7LcY3S6eseIZeKicJIN4JcO
	PjyN94KQvIkWhX9NA+hBUoMEoDWGnS7lD7pIvEvSKqVNrEh05+ZF+vbyTBfcTsAVm3PWpSM78okPN
	+0Vx4lRRff2tACvN85y+YroMfZim9D6QOGp/eLAl/NE+SEszcidU9xd2oFgUih/jd55gBG+PQ/IQN
	/XTojGAJYgPJFTW2Az/BQ79QY+YsZQRBsPkzHiC166mY1xvnZqlOasDrze9IoKfw7VNpPL2fc7Hv4
	2OlCnj1A+M+7wD85/brF2SMm10nPowXLCgsgWNMF418YNEV5t6xS7uPr/QooJlnw+sUUeV7QMAh7H
	eqOMMuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZRz-00000000rgy-3jJj;
	Thu, 15 May 2025 14:20:43 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZO1-00000000qvI-0dw0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:16:38 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5fbda5a8561so1469440a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318595; x=1747923395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrXQvrzz4wmn33In08eidQK8XMAndmPCx4B1Koh1dGU=;
        b=Q+E5LWAbtU56kdtFM0Wi4LXhGF+D4OcSSK6hv4EhV4BYtjaXT0w8yGuOrNiXFZ8hE2
         FdwLFALZunHSOK95TDxX0jhWOvP1GrakxA6EAnzA2bkRMZChoQCpUxeie7AMSSvNO/bH
         C1x0FLy4+G7m4Jq5kWSqa4/pViKuOrvC8ff217Dc3IhD9kPWJo6tmugi2neFZB7CNXr1
         xfRkBDRC3HhyEYPa4AuzuIWSWTxBi2rcW1RpnuYBzTOv7JK8CDMhmDtb2RVfPrRZZGiW
         Kn53Y4tdP+cr/vE4WQz/h5W9VMTKwKESvfmhn/mukaRTBjQLloHQko2H5U6aKo2jDa/J
         mbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318595; x=1747923395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrXQvrzz4wmn33In08eidQK8XMAndmPCx4B1Koh1dGU=;
        b=Ol3FLrFzrMlD2Adl3tNvcGHyu6hwRZCU+KDGgWTWw/mRiNLy5DSuxpmnT6Bly+yviX
         KosAUNHSVt05/2qYhcP6wLIiRNvHtyAh8vEoSx7EKIQDWU9xNCwybSiLfq+HjalXOnui
         kI7kVlyMspmrs2LOtJHZSYYWdnpGV6OyyVLB3OfW6V2hB944I6yNLzwy50dtPDVeoWO2
         N2uPZLNkbFSlaQZlzzFrISaizpFewsuly2NSi6VJsssvjwOR9NWcX1UKTMppBIVmQKoZ
         W5Fwec778X8Jg5WeMrs7vpSvgRh6CSsqEwiWrHqjsdCyGsYbvMdnnpx+Hw6x/3vviZHN
         7DsA==
X-Forwarded-Encrypted: i=1; AJvYcCVvbCK+6IcozLINSdp0su44y8c2OjwZ2LxZO1pL8cQsqTxARw1VR/VxIrkJParbm6QpdbAojwyLkv4sQvip8TVu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4JySLTX6YEA9Pl5JNjbFew3sIAe/KsBGIlXoXeWxrh9wRKt2a
	qW7GCu8vJjlk86FhjKSbsDlnaShDfqJUvNyRJz4M9AB0gc5jX5B4
X-Gm-Gg: ASbGncs9KJNYKmTY7U0pCj0PJjfyHfBaYzVIGl2a91NZKjzw9Zq52CMR6sguIIMic9K
	RAYv6DLlBzR8CXLBJ0fZ0jNLXaJ+uqnj8srVBHdeUN18YU6N2jmvJI8l98wirKqGW9X0dTZRRx8
	1TU0cxG0JdteqGThXh7On84LgpW1wnNWUjwKHtWoeC+CBub59K7Cys5DXhKoxVQFQjgwOtXxdfF
	fPhgmbpHK9uynxfJcynprB575PQclEx7KTvLXHyJyfyrHMS9RPMKqX5FIjXXCSUbkRgQi28yVzI
	TN0+8BdJXhFeTdc4LZOq03jptr5PjUSEeZYQQP0hkffuJm/Am56lisq6tB4YtGCMqD2zOPH26Hr
	FHVJBGTlr64K7DpnAl+GeDcoH2yrcoeCD
X-Google-Smtp-Source: AGHT+IGbmyTHM7gplHRzsl/8w0L/RRE3lEU5OpbaQhIBucqVAwxjQkQCfBm6MLGwXU/E8+zetovORA==
X-Received: by 2002:a17:906:6610:b0:ad5:1bfd:30f0 with SMTP id a640c23a62f3a-ad51bfd3405mr169244366b.18.1747318594963;
        Thu, 15 May 2025 07:16:34 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:34 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:28 +0200
Subject: [PATCH v9 1/8] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-1-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=6273;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=GnNWfEJsCM4fk/ThPv4LmkyHVZB29fZrJcJDfdBbv8c=;
 b=CuJGufesEzghWquaRYUkNGPi5EbqTvTTnxC6//qtkZmdzhLdbTJKHRCE1frU3P85b+fgG8ijv
 NdaSLmIWfnfBqOSH5xee8PWHVqhW5EElltBbu0YvJe6CiVCqjZ4H+OI
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_071637_198130_6EC8E19A 
X-CRM114-Status: GOOD (  18.63  )
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
Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
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
2.49.0


