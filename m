Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED8FFEDA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mlws9kV83sZ5c0sE5Qh/W7eCQPao3h3DdhO6uIW9QdQ=; b=qF7jvRNjurzO0Ye2vaR6D83eZc
	s3AXbKlwFIEflWXcAQsSGPBKzvxCYdGDjOYhDWDKhKCFaHiuEhZrdRRoiQw8SdaFEyFGiuSzOYCAg
	B5yBwKnbt0VZhCDwkFlQEHB4YqiOdWtu8DLAtzibfi8a+YPX57H9gHyNeGv8N8pLpdkwmqJH3kaMw
	EUCL51KFjdyQafkMjOm2DlObh0KxBUiB8na/ywy19g79XJKCevpIY+M6piZqJJzu+FNFdDH3LfAvg
	6JK4QXqI+U3btnjVs36FBe66IBncfEoI+qwqaIgLpnfy0XNBT7+WRv99xJ9DtET9yjTQvG5fdXNY3
	6kMkuLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQa-000000074QU-39c5;
	Tue, 17 Mar 2026 18:46:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQX-000000074OS-25OT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:46:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48541edecf9so66533315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773160; x=1774377960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mlws9kV83sZ5c0sE5Qh/W7eCQPao3h3DdhO6uIW9QdQ=;
        b=QJCrH5mjEipYzosC3KZUu5q747WwjIv92WXSWY9OoGucad9u/lFR6bGnw2sjjIc91q
         IOFTo59Gt5K9xfAytYhBn5Ova1y/L9IpbQDjI3ZENIOmioVo+Ss8r0xJphQVoQDBgAVn
         gyCMfPtqjjWG5cwyrdZ6VpT69d9kSPI3wHmciV3n6ZGtUSseG4ucvuBxtjTIfIDInxws
         VkfdxwDZNHCyAjVR+fZQ6wQmiRK361DCIfytyu3tfkeDVM8K23il6LKHckJNh7i9KawZ
         Q8RSKGNdN/9O7Id00AXTIaOw2E7CnMwPecBHMMJYEh6ESiPH45yI6Ac1/EeGnE3VjrmA
         BTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773160; x=1774377960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mlws9kV83sZ5c0sE5Qh/W7eCQPao3h3DdhO6uIW9QdQ=;
        b=cPs5XrHdvAUYEONmwfbMrix8L0hMUvQx1QZ2Kan0Gb31cLwcSlDXnspapjCdWvG8Qq
         Zg3zgB0fsqKD+535OpghSCcjnTZOgO8I3oKhi0djy3oqXNQgYRqVxrkQcnZl4iMGC8p9
         WiKJB9JO2hHAjDE/047X8QwNnfEzBOrOfkNaSnRJMBtynHKxI4ve9DStIZq4o9kvO/hZ
         zy2qt22J3ABG50cKkfRpDzg7UswrHOToUz+pBnTV8QD5ey/3lcxZAkylMgBWw024CNlz
         LvrG27k2uwCSnNc1hRK4dvgsX5P5ldLIn6Zv072inYlxj5XG04dQqsGE3dY1FpR3gOFz
         oFyg==
X-Forwarded-Encrypted: i=1; AJvYcCWXX6763Y9Uq/QwIwIDQCvnbfLR8D2xxKtKaOwAYeQ5uwQpwmUZr8I2UUOMdOnsAKWwOQWC/xViVQE8fs0aDs3R@lists.infradead.org
X-Gm-Message-State: AOJu0YxY+NTa2eR0EkSkYjyhgJXJpYW3b+3iAdC/42JNz5xpojkpRhkM
	zqTo0DSCmUTIoYaKa2p1Akv//MIRy6Ny+YADesAruI/t2K/JdX+fKnh4
X-Gm-Gg: ATEYQzwVCazB/tRc92fOPylTjtRg8b5C0gl0J+PkfIVZB6Ugi9qynKAiWZDmuqFSnsj
	PO5iwlJ5qoNJ3KoR1dGjXl/JtAQUn4Eim2j7EiXBizHXis7fhswbGai7YzsxhARpv3llvg48KFs
	Fi7cZpiUhWTey6xk1OAC53iQa8Y01j0qqInph0NplLOqapuCvhGeTMjgEJBgoRIAYb6iihv8kmu
	RB0urlq9yLz5639VsnpmlzfPgnOt3qH+6Q2NDPcgDZytAtwrh67lqDTVvxV5RAgtutFUHrOsrF/
	tqYOF/H3oHlbH//bncicCHrgSpdu4dmsOzjsY9JHNk9lUyL/A1e4zcw2pF+OgIGpM+WGJbEfsTu
	k1XQ5w+ObpXfVW9eqTKrvp97qURu6u0vZd5XNJ3/KYxjWNSx56r3pvAw6w2obnf4RuVvybRCj8y
	Caz7VN7Mp77kAQP1xV6Bs=
X-Received: by 2002:a05:600c:3111:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-486f44435bdmr12289585e9.20.1773773159683;
        Tue, 17 Mar 2026 11:45:59 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392 PMIC Regulators
Date: Tue, 17 Mar 2026 18:43:06 +0000
Message-ID: <20260317184507.523060-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114601_614979_94227944 
X-CRM114-Status: GOOD (  14.89  )
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

Add bindings for the regulators found in the MediaTek MT6392 PMIC,
usually found in board designs using the MediaTek MT8516/MT8167 SoCs.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  24 ++
 2 files changed, 342 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..fa4aad2dcbe8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 Regulator
+
+description:
+  Regulator node of the PMIC. This node should under the PMIC's device node.
+  All voltage regulators provided by the PMIC are described as sub-nodes of
+  this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+patternProperties:
+  "^(buck_)?v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^(ldo_)?v(adc18|camio|cn18|io18)$":
+    description: LDOs with fixed 1.8V output
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^(ldo_)?v(xo22)$":
+    description: LDOs with fixed 2.2V output
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^(ldo_)?v(m25)$":
+    description: LDOs with fixed 2.5V output
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^(ldo_)?v(aud28|io28)$":
+    description: LDOs with fixed 2.8V output w/ mode
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^(ldo_)?v(cama)$":
+    description: LDOs with fixed 2.8V output w/o mode
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^(ldo_)?vusb$":
+    description: LDOs with fixed 3.3V output
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^(ldo_)?v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with variable output
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mt6392_regulators: regulators {
+        compatible = "mediatek,mt6392-regulator";
+
+        mt6392_vproc_reg: buck_vproc {
+            regulator-name = "vproc";
+            regulator-min-microvolt = <700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vsys_reg: buck_vsys {
+            regulator-name = "vsys";
+            regulator-min-microvolt = <1400000>;
+            regulator-max-microvolt = <2987500>;
+            regulator-ramp-delay = <25000>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vcore_reg: buck_vcore {
+            regulator-name = "vcore";
+            regulator-min-microvolt = <700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vxo22_reg: ldo_vxo22 {
+            regulator-name = "vxo22";
+            regulator-min-microvolt = <2200000>;
+            regulator-max-microvolt = <2200000>;
+            regulator-enable-ramp-delay = <110>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vaud22_reg: ldo_vaud22 {
+            regulator-name = "vaud22";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2200000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vcama_reg: ldo_vcama {
+            regulator-name = "vcama";
+            regulator-min-microvolt = <2800000>;
+            regulator-max-microvolt = <2800000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vaud28_reg: ldo_vaud28 {
+            regulator-name = "vaud28";
+            regulator-min-microvolt = <2800000>;
+            regulator-max-microvolt = <2800000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vadc18_reg: ldo_vadc18 {
+            regulator-name = "vadc18";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vcn35_reg: ldo_vcn35 {
+            regulator-name = "vcn35";
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vio28_reg: ldo_vio28 {
+            regulator-name = "vio28";
+            regulator-always-on;
+            regulator-boot-on;
+            regulator-min-microvolt = <2800000>;
+            regulator-max-microvolt = <2800000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vusb_reg: ldo_vusb {
+            regulator-name = "vusb";
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vmc_reg: ldo_vmc {
+            regulator-name = "vmc";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-boot-on;
+        };
+
+        mt6392_vmch_reg: ldo_vmch {
+            regulator-name = "vmch";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-boot-on;
+        };
+
+        mt6392_vemc3v3_reg: ldo_vemc3v3 {
+            regulator-name = "vemc3v3";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-boot-on;
+        };
+
+        mt6392_vgp1_reg: ldo_vgp1 {
+            regulator-name = "vgp1";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vgp2_reg: ldo_vgp2 {
+            regulator-name = "vgp2";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vcn18_reg: ldo_vcn18 {
+            regulator-name = "vcn18";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vcamaf_reg: ldo_vcamaf {
+            regulator-name = "vcamaf";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vm_reg: ldo_vm {
+            regulator-name = "vm";
+            regulator-min-microvolt = <1240000>;
+            regulator-max-microvolt = <1390000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vio18_reg: ldo_vio18 {
+            regulator-name = "vio18";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+            regulator-always-on;
+            regulator-boot-on;
+        };
+
+        mt6392_vcamd_reg: ldo_vcamd {
+            regulator-name = "vcamd";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vcamio_reg: ldo_vcamio {
+            regulator-name = "vcamio";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vm25_reg: ldo_vm25 {
+            regulator-name = "vm25";
+            regulator-min-microvolt = <2500000>;
+            regulator-max-microvolt = <2500000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+
+        mt6392_vefuse_reg: ldo_vefuse {
+            regulator-name = "vefuse";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+            regulator-enable-ramp-delay = <264>;
+        };
+    };
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..8bd1a13faad8
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_BUCK_MODE_AUTO		0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_NORMAL		0
+#define MT6392_LDO_MODE_LP		1
+
+#endif
-- 
2.43.0


