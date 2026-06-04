Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9722CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=; b=iw1jmEGKxIAuoi2ig93TC2Xm4W
	qm0Yx5AiEn52Mil3/ZvLD4mjY4Rx6DXo4/alxV9sJPcDgg/ktTvG7krv7NgTmiDKxNXmakObc2qnV
	vpzDcPFDTClUu7c1pZ6mmf03RUP1YGJo5ppd42IDvE/ZLYGnztkrswWoxQAXjZV/QljDN/UorblQY
	BlN+E6Je/zltYlpIrqrK7Fk/8vtVEbiA+qzAXQIlKAoavINW6uKH2UadS+4klCr6eAA33rM1bdP0f
	RfvazFfoNYjD16tbNlc+OPFlp6D5l5CPbK2yi5acoSyTXV3YaHL3b5qJFEQC9UtSQliTgbRY2/8Lv
	00LWG66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAwS-0000000H4EV-0coa;
	Thu, 04 Jun 2026 16:29:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAwP-0000000H4Dz-3414
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 16:29:11 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36b9033d230so552761a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780590548; x=1781195348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=;
        b=FGUEYtVGrp4ywTcmme1Bv3CJgIjU4LhfByo1tbYIjRWUn27mjM8vnvIllf73n/fN7F
         Xi+5rM+KF0u+B+5gS+LN3FnQgBL6JCo29rYjVV+CWlT3RNBYkQNgjNEPa9QqeK5SMCaK
         ZWmj91fV4QV6k3kdJXymsagOzLKEZYQYC/yXeDqQqaG2ypNl0ZVHcDWqRNEhQfAdmAPL
         bbYrZK3rY7740i/UKH1S1+Ca0oMEebJn+K5xi60WXiK1MR0Ki65EFG6Q+sSZ0vfgQuMJ
         mYvb+Qc3bvw0l9pjib25u8S6HTWEXivemj9uOiOso6Qf9UHZvTvPVFZtZix1hQ2OuSzz
         /ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590548; x=1781195348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=;
        b=CCrwrw5KqAv573VJduaFSzkYSP10k/YK8yPE+zpMNlqK/FQQgltjvZZO6S91vqRUn7
         60z0vCsc0uRF54efWqBsX7rITyWdpHzf0LwI+xsPH1+F6YMTwRQHEqEIs9gQdSk4X6gK
         ENX/O7Y8GtGxXs/xMSHDssp7AVHvGBsi9l8mncT+1j+Ov6+dQuKDsQ7QwVMipVEpNcEl
         cROjBHUV6YXmtIludk5VCSKNxZ2/4jududTgheIKF9KjwEZ+uIqJYS6zmk6qQhOr5FA0
         v7FLcT2En+Qp0vsR7eeAwRmdyLh9mkmC4vyfAHEknN0fN3s4DWcExSlkjezY9h7A79LS
         gx9g==
X-Forwarded-Encrypted: i=1; AFNElJ8KHoDmyfLH0bYPPhMJSS9WmmJ68PpspiO0S8gky7T0d53qlxXbGxrMpPgeOkGgcpHaz4omSflMgk/6SYm58ET6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3SKU7Qx5H28UtNbCiSPeZWNcOrooOrRA8Na0oJMir71KDoot7
	UGP0XaGX1GgRfKPfs1MPzKFC0ml27Q9uG6+l4pIsaFU1rwbWipQPLqij
X-Gm-Gg: Acq92OFl1oKlFbWvSEy02xMvxSpqzHzuBtwzpjqpUTtvfEiNW2FLKSGDNgJgxsp9Kb+
	uqGtcgAETFcz3arlwzjoCkddXMCsoqYcp3Gg+t6NHRVm+c5wDCC9NhlhjuDvamFso9fPMmy1I6J
	QecKTTfOZd/SQooFjhXpSN6rqAWA1nj+/xtJ+tUmtLStM0vr47oEZXhs+yrk/xVobpWxiWlKWfd
	mOpW+g1X80HGiGbuSRcb78ZzGo/3L6ZsvXfjAiZSlirlelmCSW3u0OY5S7yhm2w2cavl+kYWBoV
	rLoHGq47ge5RCxcxpHZsxaX3/s4tRWh0sVQ0sMEgeynOevGhPSLbpBzBJrflGv5HX+lSsKvORBW
	C3lm07MpVSoMQwGusGTiPeoB3l0xn02QwkwSRIecRd4uBraN0GuVQencgyG/DGOTwzqdJBZSGqi
	o9OfV190hMzu/4Dk3mocIxOpk147cJtjev1RyWyAg4ivd4aEBMmN5sD6GA3GAQzqiZ3XXT8aDYv
	64e2DgZ9R0h3QRQviAKyjGlDBt1
X-Received: by 2002:a17:90b:2b4b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-36f781bded1mr3553423a91.15.1780590548307;
        Thu, 04 Jun 2026 09:29:08 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm3670255a91.16.2026.06.04.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:29:07 -0700 (PDT)
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
Subject: [PATCH v2] regulator: dt-bindings: mt6311: Convert to DT schema
Date: Thu,  4 Jun 2026 21:56:24 +0530
Message-ID: <20260604162624.644241-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_092909_805331_804E4E53 
X-CRM114-Status: GOOD (  15.12  )
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
Changes in v2:
- Correct "MediaTek" in the title.
- Drop "|" in the top-level description.
- Remove unnecessary regulator node description.
- Remove unused labels from example.

 .../regulator/mediatek,mt6311-regulator.yaml  | 70 +++++++++++++++++++
 .../bindings/regulator/mt6311-regulator.txt   | 35 ----------
 2 files changed, 70 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
new file mode 100644
index 000000000000..f65ee2c90298
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6311 Regulator
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
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
+      pmic@6b {
+        compatible = "mediatek,mt6311-regulator";
+        reg = <0x6b>;
+
+        regulators {
+          VDVFS {
+            regulator-name = "VDVFS";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <10000>;
+          };
+
+          VBIASN {
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


