Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7229CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=; b=Enm1U3wiA7XUL9/u9SwHqMOa8R
	zLD555fYpUU48EgBGySjRt/cc76aZ0kF/OuFFIi1BEaMjyDlZd90OVbTRHRduxTi09wrHh8IUagUO
	LZkqOG8wdxRDEyX0VbltxvABza1Z+KjEIH0TJWM6vFFxfMD4LkEHTnYJMd2ny1mC6au3bnJ6I0xsy
	gzccEJH/TdQdZVQ7Tlw5kjgrnc3m1W4HCODGKRPc5/H+rDVaucjOdjsbWYcrA9zwtxMRzka9q5N8W
	JnFBoUHFYyLoNhuGzf1/C65/wCViqwWqYfGn7HdJ/GtJ5gnu6w9sSRvE7+1rNOlFvi8dQpmBoP9ML
	0CvsG4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTjWb-00000009lfg-1EzY;
	Sun, 31 May 2026 17:00:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTjWY-00000009leZ-0sGw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 17:00:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so4845545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246829; x=1780851629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=;
        b=YgmebJgQPZmhmLCGGXoBjBcxamW2qbxgRyHSjQEXV51NLBuC5otyZhy4xmBJTLYj4n
         pb/WbEzzlOqGjM6JsS9UcC0B+VrAlY109ljhCxvJPvbPO8o+KuqYVrXhrnYM9cHLyllf
         29080rkl1VzEMTpZy4y21wppID+HK9x8AZB49aL/Rg69xnOeKJeowLt0EZ3SSHFHqd6U
         7dnWHG+p6VScCRWRCWjUVniPCW8FWtFppJSs0T5TPIO7h0kzX8rOR1tVpVSMz5atRbfY
         AueSU0batgiWqjkdF4fyNq3WboMzcVNKUatOVbCU/QXKn/O/VVcE0UEcJafBnR7XsxhL
         v2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246829; x=1780851629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=;
        b=TlS5qcAYzwibsnkwjozYd3/iOZtAf0o4zFX5KGDB7m61IW+MZMfEOkri4R/XCG5JlQ
         8gw3voW2d2CkHBe8KTsnCh0KsQMY8P1ukNG7yfHicegueFGvJc+9L/4cZrKjOjP0vq1G
         RQFNgcH12iUSj29Hk8pvcWJxTTY/S4er/JrDZIXogozJgYC594wqJXEOjkkRO4fW+94/
         A/WgpPE3f21ty2UtJQehLoJAlJJj9ZyT/7zLsrQq+YFNKJhLjzk7akiGBPK5oyCd6JS5
         IamAmLLl+LdBwwLNAqFFT3aT8P38Wy+1Y80lnhICDh3yZztOLellsyxspjtsFKnsZrx+
         ztKg==
X-Forwarded-Encrypted: i=1; AFNElJ+NDshuv0iqlQSkIvxgpCbrhyxLlLkTtUDT0DQlgDdRO5Lo9+xVVVe8/fe03eOFhubBHnpubs4/6IIRWUsvW5q2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9yNLwBA50+zSCcEeN+foJqXCRp555j1uT8Rd7R/NGSPfY487C
	zqxbZBg9N+N4FNsUxoODz/oUN7863rbiVebsTGtnE9tozKPMftUuXQTY
X-Gm-Gg: Acq92OEK7g0lIcSL7NDgvNJoxJXmOPdySGtmotzsmWKwQ1bRuretT4imx1E/lIPJCBz
	k8aDdv4v7aDFxdif92TKE+FsSdmEyUUkmQ33XvFd1g+44/KZIjgxd4hxXRrKUSpW0mmEGsjoUsq
	CEXDRrVW0Cf547O1s0CY8lkPk8Pu8YDUSwMotNi/084C9Fl1uViwzOF/pqPIqyt0NoRo/3O7aX3
	jVAYD4dDdkv66t36zUzX/ft1kjZxCGZB9YYs4akG6C8W9ciINahkraKAzXaUkZ6bROzv8M+LSlw
	tGYBE81zYNnKGb9UJwXogkEqycDi+BQoo+L2uF03hUse7ARo484whQUfafiZqdm44ns+H7xAZRV
	XbpooUfCC9Bv1V+fIIBJLezbaSDOTGGoI5PfID06gIqKec/adPJSIFukvQQUWnrygVkSR3oRrAQ
	32avj/YhzxYH63WDO76N5dYxBgtmryLz7jL8S2xlX58rDoKofLmxtsYl8x8HNzQl1o63qFJVSS3
	Ph7A+ASS/79aLDmoqo=
X-Received: by 2002:a17:902:cf0d:b0:2c0:c8a8:dbb8 with SMTP id d9443c01a7336-2c0c8a8dff7mr27171725ad.29.1780246826053;
        Sun, 31 May 2026 10:00:26 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm99331075ad.20.2026.05.31.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:00:25 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] regulator: dt-bindings: mt6311: Convert to DT schema
Date: Sun, 31 May 2026 22:27:12 +0530
Message-ID: <20260531165712.729635-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_100030_270216_E41D8B17 
X-CRM114-Status: GOOD (  14.50  )
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

Convert mediatek,mt6311 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 .../regulator/mediatek,mt6311-regulator.yaml  | 72 +++++++++++++++++++
 .../bindings/regulator/mt6311-regulator.txt   | 35 ---------
 2 files changed, 72 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
new file mode 100644
index 000000000000..a51db46b0f41
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6311 Regulator
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  The MediaTek MT6311 is an I2C power management IC that provides one step-down
+  converter and one low-dropout regulator. The regulators are named VDVFS and
+  VBIASN, respectively.
+
+properties:
+  compatible:
+    const: mediatek,mt6311-regulator
+
+  reg:
+    description: I2C slave address.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: List of regulators provided by this controller.
+
+    patternProperties:
+      "^(VDVFS|VBIASN)$":
+        type: object
+        $ref: regulator.yaml#
+        description: |
+          Regulator nodes.
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mt6311: pmic@6b {
+        compatible = "mediatek,mt6311-regulator";
+        reg = <0x6b>;
+
+        regulators {
+          mt6311_vcpu_reg: VDVFS {
+            regulator-name = "VDVFS";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <10000>;
+          };
+
+          mt6311_ldo_reg: VBIASN {
+            regulator-name = "VBIASN";
+            regulator-min-microvolt = <200000>;
+            regulator-max-microvolt = <800000>;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
deleted file mode 100644
index 84d544d8c1b1..000000000000
--- a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek MT6311 Regulator
-
-Required properties:
-- compatible: "mediatek,mt6311-regulator"
-- reg: I2C slave address, usually 0x6b.
-- regulators: List of regulators provided by this controller. It is named
-  to VDVFS and VBIASN.
-  The definition for each of these nodes is defined using the standard binding
-  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
-
-The valid names for regulators are:
-BUCK:
-  VDVFS
-LDO:
-  VBIASN
-
-Example:
-	mt6311: pmic@6b {
-		compatible = "mediatek,mt6311-regulator";
-		reg = <0x6b>;
-
-		regulators {
-			mt6311_vcpu_reg: VDVFS {
-				regulator-name = "VDVFS";
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-ramp-delay = <10000>;
-			};
-			mt6311_ldo_reg: VBIASN {
-				regulator-name = "VBIASN";
-				regulator-min-microvolt = <200000>;
-				regulator-max-microvolt = <800000>;
-			};
-		};
-	};
-- 
2.54.0


