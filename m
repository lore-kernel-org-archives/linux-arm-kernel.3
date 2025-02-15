Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80084C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBy5hLuEmKlC/echdm6iJKgyIGv/+KLaA0/xc/ZzmQQ=; b=MmaB0D+S9bt0FV2JpXWkpi9bgn
	YfdAkjh8hvFldQ4kaNcGW/1R+Y1wKb/iw0KvWu2O2ULP5+pkcJAaBThirCZ31sCj74nXeZtCBNkMQ
	TJqDzwREWLnaOc9jMZ41iz+Wh0cWilYBTJ5X0HMLyymIet8aFmCh349OVP4MpP8UHNZ1d5dtPkblJ
	iIe6MKQDqYkVlTUcDtYz3YkFitDcGVGyMWg2EctJd/9O4QR4FvfQFC/+iEltvFVwl3ohrUkArm1Ir
	vtjfz8yniLwq98UdoewjY3PWL9PXL/yHmELmTHAllx4uCjCFe0YrxwUJkrMpZKHJbxgPKP7q60fRY
	iRqflwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEhB-0000000HMFh-3AnV;
	Sat, 15 Feb 2025 09:42:45 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEeK-0000000HLaK-0lAU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 09:39:49 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5de3c29ebaeso3687103a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 01:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739612386; x=1740217186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBy5hLuEmKlC/echdm6iJKgyIGv/+KLaA0/xc/ZzmQQ=;
        b=kS1dW52gjvU3YUJU2nWzhFaqGqhNNODegTN7sWLpDOwGzU1r3rcIpY7ptvgdVfWTzA
         nHlAWczcjJQrFHr+8sMVvEscD0MTe8+YDD0CVHZ5QLCtgjh6CGzqRAYqEF9mGnIMsdkZ
         Yj5tuSWau9yiLvqHn2D0ZWcbwfdcUMobmIVgRjXIHmcN5rG5nBqkvv8/O7M8ZaKSL6bf
         c0OE1Nttda+BNlkKh698Fv+yPNcEDtzRoHIR9Pte35CTur9DSer+UJsSJ3xvxnzSARTT
         df2atmwY+j9kNQWQwIq4XzXZrVS31nEPkzM//cTZZzDf7R7ZJNVkUcfRc9xWEqmSaT2M
         q8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612386; x=1740217186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBy5hLuEmKlC/echdm6iJKgyIGv/+KLaA0/xc/ZzmQQ=;
        b=L2+kTyED6lDdv0VuTHuhsJb6EatTmSt36AeLgjwN8dKSvT/MOjKPlGjkovFZYrRlJK
         dIAEAux6utEn/YDXLTDG6WQC9/8wk/dw8hNAZnrA9Ki9wnq+rceNm+sXIFf5aGNv/1P9
         hA5PGJhWamotdujssGTIoNfxIVLsMAAgMg8aovGQxdXWwdcDR7zPbVJ9Dk8ZfWhGKfhD
         sIs2QBmqGwaa322PRYvNY/6IpfEQe6XvS+nFwL9TwGpgIPz8aElJUNLkt6YcMfRymMAs
         NybDVVyjfqEAKjJzBxb8/YJbr0WFVScSX2TGL0f48H1Tm5znxbXQX2URHn3WheXlmjRe
         dSNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK8Mt+ISlF8vciyCLdykeuBzM7+c63aGRRP9Wl/OX+OxG4IIcRqXNfQvidIFbWqPaH7DzMiJ/K2++fNgvLGmoe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzut+uwFrfROmQN7FdNjlD7MqICptnh4Ck1tcxyRD/0itCIrcsH
	o8uOecpTTOuqef85XlYwLhl06BKRhvMTJq6rlR5Hqhi/1y46qOXp
X-Gm-Gg: ASbGncuxtAhNyEZBaiDnoYyVqQNKFJ5t+DHQ80S3p0Lzt3CQXqp91GYbnOYA7v4vPqy
	K3+BCSR81a2PZcdJot61uOmnAuS9qR1qM27WsEqkdJyXbSz7X7SFO40axnmP5m79Gx9aPe/WFa7
	A6/1DcXqNlwfc7qH59csNbCc7VA5lA4R+JrLhauhz0Ad6qSrFZECEOnjoPLdoV4iWF/nWNN4m/k
	fug6jK1KeJLNPiRJo1x5nHcAPYNWNtskmkJbE+PT2wpFMckakcqCbd5Pg1B8xaCkeKH3dkJMA+j
	eqNiUlk7JDNDgNEEGcjzToH6Gj/J4tRygboKRTqy/TVtQXxU/skxKKAEodqVrg==
X-Google-Smtp-Source: AGHT+IGSYJkhJaodpX4MgIKP7KaGkoGAYEgkdgutm+iExs8hhepyEeN6TVJ40HgRYdf+U/gPIzi/uA==
X-Received: by 2002:a17:907:7fac:b0:ab7:cc00:4d4a with SMTP id a640c23a62f3a-abb70d95cb3mr188795166b.35.1739612386292;
        Sat, 15 Feb 2025 01:39:46 -0800 (PST)
Received: from hex.my.domain (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7aecd3d5sm69698966b.148.2025.02.15.01.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:39:45 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 15 Feb 2025 10:39:36 +0100
Subject: [PATCH v4 1/9] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-bcm59054-v4-1-dbfb2d76a855@gmail.com>
References: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
In-Reply-To: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739612381; l=5969;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=IcV7ywoevjGD2Ny/Tny5tgvm+/Z9vNz3mjswQsgUrAc=;
 b=S8zVcz8GHgsSLyd5yZzQ07s18OFI1j29J+V4Py9MMPHcU4NHAsLt9lQ9GhhXaxGOzklJH5o9c
 zDTC1K3oYroCJRxHPpEujCsVulhKCsphpPEnTuNzf/TStByuEnEYwvc
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_013948_228196_FCD8B80D 
X-CRM114-Status: GOOD (  18.51  )
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
 .../devicetree/bindings/mfd/brcm,bcm590xx.yaml     | 54 ++++++++++++++++++++++
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
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ec02486978efdc66846b33963f075b79184425fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm590xx.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm590xx.yaml#
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


