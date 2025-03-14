Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB82BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeVPzS50yaHINy2hyaHmo427d2ZmemrCtOQyBXxOGLc=; b=cO117Qvd0PEGb8F5pgzeMIvtzR
	nO0agn2CRkVI72g7k7/LYEo+rKaRn4IqfPm5zBtbdizbunCFxK0Dd4fOPg/rk5pJKfRCrfFtgbvS0
	dJXHWUo05J4EATxfzgD3vNfqbeE6XA4+UltPp2hNWOWxsO/bpMeckSEDhB1Z3P/DzdXeMT8VCpCAS
	MIs1GCzImvWPa5jIrdxGAs867A/qLXf/0Imm0pVNn+JPNdzFxGP1bFJiHtn4NgoAP3oKCNty0tdAY
	ba6eFCL0hd/fFb7YBGwXInaTToTYTdOHbdpfBhMil8TG15TCI0GfCk/fnNZSwKdi0weJ/vPTOaX56
	MWTrCRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt019-0000000DNxM-3j1W;
	Fri, 14 Mar 2025 08:03:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsztG-0000000DMZE-3jW7;
	Fri, 14 Mar 2025 07:55:36 +0000
X-UUID: b4dd632800a911f0a1e849db4cc18d44-20250314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YeVPzS50yaHINy2hyaHmo427d2ZmemrCtOQyBXxOGLc=;
	b=uYFtcfRwdxaj2iS21RarYs0NybjH/gJXTkpxGu7gB+bb9CZNKKaFzHVB+8Ok+F2h+55CFTT7AW0ctkB2bYbOhY37wEBhkDtuo6Oq5F4sZ9DbNz95V1gqOobphRk+sfFGgEjR2I/cy7ImCGuGIK3Y+e5odC+iDryIioBdNywiC+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8ea04dc7-641e-4f27-984e-e100741f63e0,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:1c585e8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b4dd632800a911f0a1e849db4cc18d44-20250314
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <lu.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 465315324; Fri, 14 Mar 2025 00:55:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Mar 2025 15:55:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Mar 2025 15:55:29 +0800
From: Lu.Tang <Lu.Tang@mediatek.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, Sen Chu
	<shen.chu@mediatek.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Lu.Tang
	<Lu.Tang@mediatek.com>
Subject: [PATCH 5/5] dt-bindings: pmic: mediatek: Add pmic documents
Date: Fri, 14 Mar 2025 15:32:31 +0800
Message-ID: <20250314073307.25092-6-Lu.Tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250314073307.25092-1-Lu.Tang@mediatek.com>
References: <20250314073307.25092-1-Lu.Tang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_005534_932059_30BDC41B 
X-CRM114-Status: GOOD (  17.22  )
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

Add new pmic mfd and adc documents for mt8196

Signed-off-by: Lu.Tang <Lu.Tang@mediatek.com>
---
 .../iio/adc/mediatek,spmi-pmic-auxadc.yaml    |  31 ++++
 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6685.yaml         |  50 +++++
 .../bindings/mfd/mediatek,spmi-pmic.yaml      | 173 ++++++++++++++++++
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
 5 files changed, 256 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic-auxadc.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic-auxadc.yaml
new file mode 100644
index 000000000000..250782ad7d01
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic-auxadc.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/mediatek,spmi-pmic-auxadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SPMI PMIC AUXADC
+
+maintainers:
+  - Lu Tang <lu.tang@mediatek.com>
+
+description:
+  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
+  in some MediaTek PMICs, performing various PMIC related measurements
+  such as battery and PMIC internal voltage regulators temperatures,
+  other than voltages for various PMIC internal components.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6363-auxadc
+      - mediatek,mt6373-auxadc
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - "#io-channel-cells"
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index b95435bd6a9b..ce760039d4c2 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
       - mediatek,mt6358-keys
       - mediatek,mt6359-keys
       - mediatek,mt6397-keys
+      - mediatek,mt6363-keys
 
   power-off-time-sec: true
 
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
new file mode 100644
index 000000000000..d3276df8952b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6685.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6685 Clock IC
+
+maintainers:
+  - Lu Tang <lu.tang@mediatek.com>
+
+description: |
+  MT6685 is a clock IC.
+  Please see the sub-modules below for supported features.
+
+  MT6685 is a multifunction device with the following sub modules:
+  - RTC
+  - Clock
+
+properties:
+  compatible:
+    const: mediatek,mt6685
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spmi {
+        mfd@9 {
+            compatible = "mediatek,mt6685";
+            reg = <0x9 SPMI_USID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
new file mode 100644
index 000000000000..a8f1231623cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,spmi-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SPMI PMICs multi-function device
+
+maintainers:
+  - Lu Tang <lu.tang@mediatek.com>
+
+description: |
+  Some Mediatek PMICs are interfaced to the chip via the SPMI (System Power
+  Management Interface) bus.
+
+  The Mediatek SPMI series includes the MT6363, MT6373, MT6316 and other
+  PMICs.Please see the sub-modules below for supported features.
+
+   MT6363/MT6373 is a multifunction device with the following sub modules:
+  - Regulators
+  - ADC
+  - GPIO
+  - Keys
+   MT6316 is a multifunction device with the following sub modules:
+  - Regulators
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt6363
+          - mediatek,mt6373
+          - mediatek,mt6316
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  regulators:
+    type: object
+    description:
+      List of child nodes that specify the regulators.
+    additionalProperties: true
+
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6363-regulator
+              - mediatek,mt6373-regulator
+              - mediatek,mt6316-regulator
+
+    required:
+      - compatible
+
+  adc:
+    type: object
+    $ref: /schemas/iio/adc/mediatek,spmi-pmic-auxadc.yaml#
+    unevaluatedProperties: false
+
+  keys:
+    type: object
+    $ref: /schemas/input/mediatek,pmic-keys.yaml
+    unevaluatedProperties: false
+    description:
+      Power and Home keys.
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
+    unevaluatedProperties: false
+    description:
+      Pin controller
+
+required:
+  - compatible
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spmi {
+        main_pmic: pmic@4 {
+            compatible = "mediatek,mt6363";
+            reg = <0x4 SPMI_USID>;
+            interrupts = <0x4 IRQ_TYPE_NONE>;
+            #address-cells = <0>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            mt6363keys: keys {
+                compatible = "mediatek,mt6363-keys";
+                mediatek,long-press-mode = <1>;
+                power-off-time-sec = <0>;
+
+                power {
+                    linux,keycodes = <116>;
+                    wakeup-source;
+                };
+
+                home {
+                    linux,keycodes = <115>;
+                };
+            };
+
+            mt6363_pio: pinctrl {
+                compatible = "mediatek,mt6363-pinctrl";
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            mt6363regulator: regulators {
+                compatible = "mediatek,mt6363-regulator";
+
+                mt6363_vs2: vs2 {
+                    regulator-name = "mt6363_vs2";
+                    regulator-allowed-modes = <0 1 2>;
+                    regulator-always-on;
+                    regulator-allow-set-load;
+                };
+
+                mt6363_vbuck1: vbuck1 {
+                    regulator-name = "mt6363_vbuck1";
+                    regulator-allowed-modes = <0 1 2>;
+                };
+
+                mt6363_vbuck2: vbuck2 {
+                    regulator-name = "mt6363_vbuck2";
+                    regulator-allowed-modes = <0 1 2>;
+                };
+
+                mt6363_vbuck3: vbuck3 {
+                    regulator-name = "mt6363_vbuck3";
+                    regulator-allowed-modes = <0 1 2>;
+                };
+
+                mt6363_vbuck4: vbuck4 {
+                    regulator-name = "mt6363_vbuck4";
+                    regulator-allowed-modes = <0 1 2>;
+                };
+
+                mt6363_vbuck5: vbuck5 {
+                    regulator-name = "mt6363_vbuck5";
+                    regulator-allowed-modes = <0 1 2>;
+                };
+
+                mt6363_vbuck6: vbuck6 {
+                    regulator-name = "mt6363_vbuck6";
+                    regulator-allowed-modes = <0 1 2>;
+                };
+
+                mt6363_vbuck7: vbuck7 {
+                    regulator-name = "mt6363_vbuck7";
+                    regulator-allowed-modes = <0 1 2>;
+                };
+
+                // ...
+
+                mt6363_isink_load: isink-load {
+                    regulator-name = "mt6363_isink_load";
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index bccff08a5ba3..bf3ba58a7705 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt2701-pinctrl
       - mediatek,mt2712-pinctrl
+      - mediatek,mt6363-pinctrl
       - mediatek,mt6397-pinctrl
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
-- 
2.46.0


