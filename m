Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20962CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 20:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxe0F21akykBChd9b7ZIMr9bfYgwXWJeztqohM0WWO0=; b=PncUhhIoU1uPwXnnGQI3tFhqyf
	Y2i8WongDQrQ8bjv4nRbw8LaOiAwp+uoba6sQG2yA1l2KDiGWcIcvlriHkTM7vo5b15MZxymVCMBQ
	qUvf06BrVoaEaylEhfGorItus4IygfaTJ9Up6kq7ZhcoI7Wj5VuZ2ag3G48zCiX6vGpW7zZj0QUUf
	Fc/PvvU+X5zPok93/W9c1leGHGqzJpPqA1tENH2W13bDV2JAb8IyE2PsH168EzBvw6PWZ9hhtotP3
	qTqwwEmecbeD3mbEhJtFZCTw4Cy7kU5DIKw2PU8R84TidMR9T4UWasHmH8eE0ApCYPzmKxVbNrEe6
	HpGj/UPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sj-00000003Woo-3NFB;
	Sat, 20 Jun 2026 20:01:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb1sh-00000003Wmf-2FhD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 20:01:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso32088545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985689; x=1782590489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxe0F21akykBChd9b7ZIMr9bfYgwXWJeztqohM0WWO0=;
        b=FEbGrYH40SphcnnVN6vAfTtH8li6HfWpuDwcKlz+Pbp1HYYTLEOyIaFFKO9qmX4HN9
         Xjszef62N+mB4Zs8faiDx0d0xJPg62rHKDncR0uMIxCLIYlwigJF6Mv8FozBIwNQwcP2
         7VRYRp3HKmMRaMhJcnAUtkyRQcxw8Xd0a62thR6zxl+IBRcKpXSVePF10/zh6IUgu4kg
         f2MqkjxFaZv49uxmgSNdt6F/JL4I77fB7fAVF5fieRlIAn3oPwybHGrfjJ3CX8D828hU
         G1OnWwVMfN5K82i7SjyyJ7bhZXBSc+AFwAb4Wjo6pBcpHUQ11X9Wl4YGrJlN9Vc8PRWB
         JWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985689; x=1782590489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xxe0F21akykBChd9b7ZIMr9bfYgwXWJeztqohM0WWO0=;
        b=gvcEgso/4XHCuGewn6w+MRvo5z5ldfJUwepE2G0t/4PEiWN6Z4SY9eP7xvZRWICcOJ
         0/Sebhmyy99oFNzvFZ1NEjgmlGuV5BcUqfFJNm3sXkknJTQ+2tOsFCQuke9X5T0wXIxO
         lLOrQqVRbmzWuS9+UPxeTfbkuGc5NePqIJPveTW56j0goJbVSOKq92VnMZPlOPX5SMdC
         q6KjQounkhjrt1bTLW+7KRdgNryO1EPJ6pqW8vK0A2yaVchogvP6agiT2djgsV6Lqu1F
         OFL0/DA3wZ782wA3JTLT60wcVjywunw8IotvaQGVS1JtXgIL2uFWDScyxvL0dOm1U0T8
         tTNA==
X-Forwarded-Encrypted: i=1; AFNElJ85VUa6/CtYBgmsn0cg79n66I8J8fAdo6hEJMbYEe81VNRId1OkI4bFDgJvkVJrKtzY+gpPCdwQ0YgHRc3+P/yC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8H/ZAIXryOZmYIGoldnfeFNRucY4DZnVx6lt8i/tJG8eetZsL
	E9Hsd7Eeq2c+XQsXc7opS93wUvpmTtbsffXzi+SyHuMoA9Yl6S6ODVTR
X-Gm-Gg: AfdE7cniaQJumfgPeINRiZXcHTQUI+uMex1iGCpDFdr9TJWcfc5VOZx/4w7GprckkFW
	a0LDuvuq2wmJ7gbIlzfKeNCJRL4YKAqgMQURtPTXKXKpQFkKeiqRvRotn0V0IoFAiEc8Ijg/643
	ZACOLdV6lKEMkE/IS6/u9tMxDLYqKuHZuMunRqxbY2jgSjsacmgAMrZO+OWCft9Xa3sFkLlwYRE
	ct6hlKpRp2pK5K/A6iJYX8BDiIeDeDPF1ln0aUuF8iP3wpglW4r704xSkqe6wHX34kpnOqYAgCe
	oy4N5x3I/aBMUdDz0toJqN5NUyMzEXtTH4nP6VMMzMaP+2bYKopSg057iy+8RZGnPnU2vnhRAWL
	aEOUcTU74NESxgPu4ApDOk/GJh7jYtKBnCeJY2ezVFNdUotVgq2eUcXBcl70hfDoRleBPcnlngl
	0a+yQAgQ8/Tn4ybXR1
X-Received: by 2002:a05:600c:a43:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4923ef47dcdmr159838425e9.2.1781985689314;
        Sat, 20 Jun 2026 13:01:29 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:01:28 -0700 (PDT)
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Sat, 20 Jun 2026 21:56:49 +0200
Message-ID: <20260620200032.334192-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_130131_615589_DB8DC4E8 
X-CRM114-Status: GOOD (  16.41  )
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
 .../regulator/mediatek,mt6392-regulator.yaml  | 118 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 ++++
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..f3d5a3498d18
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6392 regulator
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+description:
+  MT6392 is a power management system chip containing three buck converters and
+  23 LDOs. All voltage regulators provided by the PMIC are described as
+  sub-nodes of this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6392-regulator
+
+  vproc-supply:
+    description: Supply for buck regulator vproc
+  vcore-supply:
+    description: Supply for buck regulator vcore
+  vsys-supply:
+    description: Supply for buck regulator vsys
+  avddldo-supply:
+    description:
+      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
+      this is an internal supply derived from vsys.
+  ldo1-supply:
+    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
+  ldo2-supply:
+    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
+  ldo3-supply:
+    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
+
+patternProperties:
+  "^v(core|proc|sys)$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          BUCK regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          BUCK regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+        maxItems: 1
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|usb)$":
+    description: LDOs with fixed output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        maxItems: 1
+
+  "^v(cama|dig18)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes: false
+      regulator-initial-mode: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output and mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description:
+          LDO regulators can set regulator-allowed-modes to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        minItems: 1
+        maxItems: 2
+      regulator-initial-mode:
+        description:
+          LDO regulators can set regulator-initial-mode to values specified in
+          dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 2]
+        maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
new file mode 100644
index 000000000000..2e1f41e0ebfe
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
@@ -0,0 +1,23 @@
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
+#define MT6392_REGULATOR_MODE_NORMAL	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+
+/*
+ * LDO mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6392_LDO_MODE_LP		2
+
+#endif
-- 
2.43.0


