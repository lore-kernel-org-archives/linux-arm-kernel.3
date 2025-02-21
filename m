Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF657C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zE4KND447LgUw6NsxZh9MwKO2XkGq/PSQxxIzCwavvs=; b=1QxlpPVDLRev9lHQouRstBJdwb
	h+XQfow/ikbJ2oSSiV632RmBmXTuApeMS59dMVZOwjuwKU0zZ7FZPSl/CisKwUE8ZWNDcr0gFovEw
	7uoxO+ovrzXVr4pTZogYjtjjnrt2cdKZw25BUvJ9bsuOzXiOKs3zM2y0fVWnMvCRTD1qNJL4H7FRS
	py8xxKpS6GWMrquNnGDBO58IoZHAGM6n0ltYsdql6H9cmxwhOSAkHmnyi6wm4AANxprQ0u8EwfqYi
	poXCkUPA5ATaMCBFTyD+XMoiuslnEOwNBWc6ceTaNCjAbtwXd9VVdgN2zkad79UxO64sCvfCZ4UKL
	Rntjy8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZUk-00000006lOG-2QGe;
	Fri, 21 Feb 2025 20:19:34 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZRr-00000006kli-41c4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:16:37 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so4641545a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740168994; x=1740773794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE4KND447LgUw6NsxZh9MwKO2XkGq/PSQxxIzCwavvs=;
        b=R+Kh41OwJER0Dz54IIDxnO2JYTPEX347E+mdChkXhlaOVnJcWgzaAkeGQpcYZXQSWM
         8XkXoW9IvT37W1+zadF9Mapk7PM3KUn9zsxib/czwXPN964snQIlDjTxhDX+FSfuFv+E
         wgNALyw0HkJLZ+YoAaRxXgWLjxSeXX2vJx/2cF257MEQ2qg18DPiA++CRnfQzxAsy2yf
         eNkEOzusIxYg8ubLkHTH8vdgj/UWgmRB6QLcz1MzuJDwwAkSMFhNFEwbr4MlPVcym5tx
         SJyACFUfo92q7tzimn47TxPlvxIPCibswYXtnVuBZILEF/bCkKfm1wjHYPQKnLeNiuWC
         roTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168994; x=1740773794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zE4KND447LgUw6NsxZh9MwKO2XkGq/PSQxxIzCwavvs=;
        b=OYvJRRQSQD6nMVksQ+gOgxJJ81frBpctpaHW+LqNtftrVAbFltutfZGo1oZ5cIlIwS
         euq/2o+fGj4Zg5hhwsDs8WU2VfeamJy31NnNsWS206DfG/HnpjIHlYMOI6YQxNVXEIqk
         cJoyHzJ8rvIHmwJb2wvlLdaTlhO3pon6dlfbl8O5yqKasPLtsqYrr9qU+9CRUpfGQzYB
         BK1gOxTm2YAwpOeadDSRpUHVYAEErE1xORuBCkJHkrM4fJWgakZ7JKrCh/6FKpMmJZQt
         055m5Yt2ckSv7cPTOzNsPbjVySO0zCmT5ZVkadMN62L6Ed3jpBwvI4YaRO5jxPkSIik5
         DqFw==
X-Forwarded-Encrypted: i=1; AJvYcCVokKxavQbRlfYaQjNnKIvbtyzPWxv9s0Z+qJ3uP8Kc0F1NHpyntkt5Y6m099EydVZQshhOuXVpS9wX/DqxFtZK@lists.infradead.org
X-Gm-Message-State: AOJu0YyLU7BOeTMpj7zuREGPzZPyLV00uYFsPFtiIXlSds7RYPmUa01Y
	JKmvNSuFv+JjDU1dzEARKkZ1Fu/McWugX1FmhIwiWgjCmmMcjQ9r
X-Gm-Gg: ASbGnculMjvwV812oCPeG/Fl0l5iD7JvM+uz6EuUHBfVQEPRO5STOb7Ot0XuijZPjH3
	ivUgWsRm/FyyyzePegqX26ZpfjpO/ni3SpuOW7A49mNvXUx0hXDnClmRQE185e5i3fNoNWNLJep
	W69HzmRH1O2YVT72o3bPayRAuPodSkhS9YX7SO/kenwr4EGFlcIqiLrlGvbJzLKPDcMkhGceTGP
	4veaRBLqRiMAbIdMnlxrwDXCnNqAeD+NIJc9mn4HUtpt1D4v3Anrq34luhjTCgFPVk9RN7Endsv
	i+MADs2F1aFaEphZHfKTAZAz6ow8bmCZ/G6aJpEoDHKmmNgGwlrmDBbPa2BfUGBWia4+84X3
X-Google-Smtp-Source: AGHT+IFX05K/jG+cWowFunxMbqT7q2fbRvvwU1JNDBdJ/7CLMJP5qJ37WUbt1Vd9vQQuR8wQXi2hKA==
X-Received: by 2002:a05:6402:540c:b0:5e0:7d9b:b15d with SMTP id 4fb4d7f45d1cf-5e0b70e9cc6mr3954275a12.9.1740168994066;
        Fri, 21 Feb 2025 12:16:34 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm14127594a12.12.2025.02.21.12.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:16:32 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:16:23 +0100
Subject: [PATCH v5 1/9] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm59054-v5-1-065f516a9042@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740168989; l=6085;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=nmZOfdFUCwQJVeMBIfyxFyv13V4skfJRGlmbbAjd1jo=;
 b=kV88aRiFrJaiMp2uj3F0vpqgIlO/PTVpbJafJAesj1M/RWXR1sSbCcvfXaY7USoPvz9fR7pLi
 T90ssPdZH6DCMPrUWi8yxGYWVFMypTQhVoDEUyISfk9hVsmQmJPhDr/
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_121636_007820_AB6C27AB 
X-CRM114-Status: GOOD (  18.48  )
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
index 0000000000000000000000000000000000000000..9e0cddc0f1116bbf1ec03826ca7758f4311a67c6
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


