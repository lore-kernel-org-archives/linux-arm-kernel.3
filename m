Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F4FCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFsC411FoFwa7HzstTnYY8q7c/bVTqUdSeT+q9H/GKs=; b=sskxmyynXKKPoiqATZK9maW/oN
	AkBh4Ttn3oiQtOusykZJBhW+dHiZKzrHmSMvJfWxt/Za+AphUUbmfTDgfps4QQgfMiaMt3GCLz7jj
	rGk8TYdbcLbLtFcM7xLk6Ty6d1vd1viCkHZ4xrgm7IQrbYWcI8/SF72qQuDKLXUtkvjyIyWNDqIKE
	3+kJSkdhUN2LBqTO3FqMe+PLvyvwmOU2d2m95cTmxZvgoQUU7DYErEAvxHaHuxCFq2Suv0RGwZ5Qa
	KRd6c22Bo2cFYPXenTD+bQQV93e26Uv462RuG/J51oeWqmWGQ248i4kMqPSdrG1xe5xhT/ny/V8L9
	3irNzzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1bX-0000000DlVG-163w;
	Mon, 15 Jun 2026 07:19:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1bU-0000000DlTK-2Pay
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:19:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490ac10e337so20069195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507967; x=1782112767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFsC411FoFwa7HzstTnYY8q7c/bVTqUdSeT+q9H/GKs=;
        b=MzylaqOX5/+L0k3yYRdJLU8YBtM4iha5kir8bkEENlDbfPFnWE1QI4WYnsC6jThCTp
         zakwtKJkBa+nlatvss2BEeiG5CtGnaqStK9Y/BGhbUc7kwhFvprrfmwswYMRSfgzU0f2
         nybYsXLYscgxfXY6Sp3gog3Fs7RNH5tM3x0zJDhEyqW/pIWYE48x7g7KOcK8WFBIrD1e
         76M5U/XvPvDc5TUkt8VYl1ROJPW/30oZ7HfxR6kf4CWVLeaqz+v/m5mD7t7clU6Py0Fg
         vkqZ1xKVP4OEucIHKKEUnvsJBK06FLWAHa8fhZWphXNFgRXH3GSpxMFkJjYO0NPm/uT/
         1irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507967; x=1782112767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFsC411FoFwa7HzstTnYY8q7c/bVTqUdSeT+q9H/GKs=;
        b=VYaSzd62IAEuuJn8FHY6Yl8YuMVAOYmdMGi4OMW/vVszWVwMzhkqTN0EJ18Svh4Bcz
         4fDb0o48x8bfy02ZJxRcU7hTQMWJ5JhqLbLQmqgEZr8zJM/pNMKklbmsOeXsavEUuXii
         YjeQnRqi/qCJqGYRYhBrkg80XNmH8NysVl09Yg8dCZrMxGQxdQ8l0qM2A+FM2xkibt2H
         Aa1JSBomhp3XplWbwee9dYrJED0dzMrsZutPBMTje6YrIW6QFb6M/3tl9idAwoH8cnF2
         09jsNpTPgEXt1756UdrH/YHXqDG4HqzorCvuRyygV6467w/i+Yl2ZwQEGPgWEvWQNCKo
         MaaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ecToCO0t7FozKjg/QIXDBdRX1kvErZ5kwNcCNB7xQt9GcnBcP7/w3Ly2L7GRQ/Kc44/P4My0vII+xczMxC7Uy@lists.infradead.org
X-Gm-Message-State: AOJu0YyhMwBoblaEcp1DAkNlsYFf959HQKlE/lSuPVtL2y79UpnQERui
	OzGP8WSF3VHPd24HXiqY1VdRNXC4TmY1e7ZP1O2cSwBPBwsIVaw75sx9
X-Gm-Gg: Acq92OGqpU7gPCKiCYM97giTUbp2buOWff38b4lBoxK9r7ZShSmaSCUHpmI6x2Y9GZh
	ml896vsqFTxud/ULq+vQZNlhWnM98ul1Aa17NXcJhDUjB939WGdlOyO9qv0FIB+tCUna5A8fC2i
	itEMYdxj5UtP65UYfHGqLx0tTwho554hTRLhF+8qG81hnhsD/moJmr6zf/s61jTlIUgXnw5ySkd
	QRtJwjSpBs+YjjOAuxIgVWGtpPF0Qw/7W6uZ9A5qge7/fD4/vb4NjUkSW3JVp83VjyXvp0FyMw+
	U4UsDE6oG/SCppWvraKlpwQDpkOBbilzuNbBDQ46XvsACa+pOdlovECd1cUr6P1WrvYDQQwfz8L
	OKEBqkWF9r78+69BgMX/77lcV0qFpGuIhvpZG8Zw814T0Yci7wvybyrPVAa7NaDXU+GX4QoBBn6
	JLKMu/7dipkzORpX65
X-Received: by 2002:a05:600c:6692:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-49220061acfmr124397735e9.9.1781507966741;
        Mon, 15 Jun 2026 00:19:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:19:26 -0700 (PDT)
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
Subject: [PATCH v7 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Date: Mon, 15 Jun 2026 09:16:09 +0200
Message-ID: <20260615071836.362883-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001928_698815_95148C97 
X-CRM114-Status: GOOD (  17.74  )
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
 .../regulator/mediatek,mt6392-regulator.yaml  | 234 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  24 ++
 2 files changed, 258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
new file mode 100644
index 000000000000..197041df4ba1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
@@ -0,0 +1,234 @@
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
+    description: |
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
+    properties:
+      regulator-allowed-modes:
+        description: |
+          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|usb)$":
+    description: LDOs with fixed output and mode setting
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
+  "^v(cama|dig18)$":
+    description: LDOs with fixed output without mode setting
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
+    description: LDOs with adjustable output
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
+    regulators {
+      compatible = "mediatek,mt6392-regulator";
+
+      mt6392_vproc_reg: vproc {
+        regulator-min-microvolt = < 700000>;
+        regulator-max-microvolt = <1350000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vsys_reg: vsys {
+        regulator-min-microvolt = <1400000>;
+        regulator-max-microvolt = <2987500>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vcore_reg: vcore {
+        regulator-min-microvolt = < 700000>;
+        regulator-max-microvolt = <1350000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vxo22_reg: vxo22 {
+        regulator-min-microvolt = <2200000>;
+        regulator-max-microvolt = <2200000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vaud22_reg: vaud22 {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <2200000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vcama_reg: vcama {
+        regulator-min-microvolt = <2800000>;
+        regulator-max-microvolt = <2800000>;
+      };
+
+      mt6392_vaud28_reg: vaud28 {
+        regulator-min-microvolt = <2800000>;
+        regulator-max-microvolt = <2800000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vadc18_reg: vadc18 {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vcn35_reg: vcn35 {
+        regulator-min-microvolt = <3300000>;
+        regulator-max-microvolt = <3600000>;
+      };
+
+      mt6392_vio28_reg: vio28 {
+        regulator-min-microvolt = <2800000>;
+        regulator-max-microvolt = <2800000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vusb_reg: vusb {
+        regulator-min-microvolt = <3300000>;
+        regulator-max-microvolt = <3300000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vmc_reg: vmc {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <3300000>;
+        regulator-boot-on;
+      };
+
+      mt6392_vmch_reg: vmch {
+        regulator-min-microvolt = <3000000>;
+        regulator-max-microvolt = <3000000>;
+        regulator-boot-on;
+      };
+
+      mt6392_vemc3v3_reg: vemc3v3 {
+        regulator-min-microvolt = <3000000>;
+        regulator-max-microvolt = <3300000>;
+        regulator-boot-on;
+      };
+
+      mt6392_vgp1_reg: vgp1 {
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3300000>;
+      };
+
+      mt6392_vgp2_reg: vgp2 {
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3300000>;
+      };
+
+      mt6392_vcn18_reg: vcn18 {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+      };
+
+      mt6392_vcamaf_reg: vcamaf {
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <3300000>;
+      };
+
+      mt6392_vm_reg: vm {
+        regulator-min-microvolt = <1240000>;
+        regulator-max-microvolt = <1390000>;
+      };
+
+      mt6392_vio18_reg: vio18 {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+        regulator-always-on;
+        regulator-boot-on;
+      };
+
+      mt6392_vcamd_reg: vcamd {
+        regulator-min-microvolt = <1200000>;
+        regulator-max-microvolt = <1800000>;
+      };
+
+      mt6392_vcamio_reg: vcamio {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+      };
+
+      mt6392_vm25_reg: vm25 {
+        regulator-min-microvolt = <2500000>;
+        regulator-max-microvolt = <2500000>;
+      };
+
+      mt6392_vefuse_reg: vefuse {
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <2000000>;
+      };
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


