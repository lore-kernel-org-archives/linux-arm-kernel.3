Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD37CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xf4pKdf8gGKXDod7yewRCS/fMPBhP66Q4FQzfjWxYTI=; b=Gvgd1ssJ0Yi5I/n51LUWVjjMaM
	kPcOSRPfFRQthjeOeJQVLdniqZbJK630BfavOQ3zdlJetg+86rLBo5Uglc7wtu4Rba+smlq7HSlS2
	H20yCt9dK9Y6rNLyqunZqXfUlEngJ2N9aB5EFeueijS8YT7veR8/F9uKpyztPBoaaaBd6sm1hdrgn
	lSD+LVfB28BOdHPuGOKlv3GEU644IgC8LScA3wNCRXJWOpAsrwTH43BdQhmb2+g/1/tVXg9wwfbRg
	2ghjwEuh0hOw1RiMs8fEzZEFymHONLG2bGSDGCt989JN6tAKrN3fhyFwlqG32cfnRL0BYSHQNFhaO
	blrMHOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNeU-0000000D4hO-26Pp;
	Mon, 11 May 2026 10:14:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNeL-0000000D4ZX-2nPI;
	Mon, 11 May 2026 10:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778494447;
	bh=RLK0bmNgqkncwSjSF0auY09mTQs7f3xCWXcuesgdBPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lU4KqCcJZX8G3At4cO1r3SSkQx1+pUMqkCOgRdJYGKkrqDr9wNcTCbsbEU/pNSuFV
	 UjgK0Pz2L2kFky+t63dQ7WKgQCOCzZ8l7O37kGhTS8JJ8lZngjyaPnngB+sOvRHNWf
	 IkXkdW2MuRtzyrSiznqfmGE5uLtQlvI86+iVaOeR5iZmlYVs1GIBuDrDDWlnon1oBO
	 0S5ayWA02flmEmddBPYW+QiFzdYsS0tAJQqtVJMzU5NS7mEmiXoIF7x5bKnBxMAcYM
	 nbMTcldC0xNEPgmVePe4i7l7N7CQ6dkre4BTq9y+mhVn7iG7NasVJUtjXAV7a4jsSh
	 weUy+fZelPFBQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEBCA17E040C;
	Mon, 11 May 2026 12:14:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v12 4/5] dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
Date: Mon, 11 May 2026 12:13:54 +0200
Message-ID: <20260511101355.122478-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_031409_874571_765E9253 
X-CRM114-Status: GOOD (  13.24  )
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

Add a binding for the MediaTek MT6363/6373 (and similar) multi
function PMICs connected over SPMI.

These PMICs are found on board designs using newer MediaTek SoCs,
such as the Dimensity 9400 Smartphone chip, or the Chromebook
MT8196 chip.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/mfd/mediatek,mt6363.yaml         | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
new file mode 100644
index 000000000000..ee90d16053e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6363 series SPMI PMICs multi-function device
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  Some MediaTek Power Management ICs (PMICs) found in board designs with
+  the Helio, Dimensity and/or Kompanio series of SoCs are interfaced to
+  the chip via the System Power Management Interface (SPMI) bus.
+
+  These PMICs are multi-function devices with various sub modules.
+  For example, those may include one, or more of the following:
+  - Auxiliary ADC Controller
+  - Clock Controller
+  - eFuses
+  - GPIO Controller
+  - Interrupt Controller
+  - Keys
+  - LEDs Controller
+  - Regulators
+  - RTC
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6363
+      - mediatek,mt6373
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 3
+
+patternProperties:
+  "^adc@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
+
+  "^regulators@[0-9a-f]+$":
+    type: object
+    oneOf:
+      - $ref: /schemas/regulator/mediatek,mt6363-regulator.yaml#
+      - $ref: /schemas/regulator/mediatek,mt6373-regulator.yaml#
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@4 {
+        compatible = "mediatek,mt6363";
+        reg = <0x4 SPMI_USID>;
+        interrupts = <4 64 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #address-cells = <1>;
+        #interrupt-cells = <3>;
+        #size-cells = <0>;
+
+        regulators@30 {
+          compatible = "mediatek,mt6363-regulator";
+          reg = <0x30>;
+
+          vio18 {
+            regulator-name = "pp1800-vio18-s3";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-allowed-modes = <0 2>;
+            regulator-allow-set-load;
+            regulator-over-current-protection;
+          };
+        };
+
+        adc@1000 {
+          compatible = "mediatek,mt6363-auxadc";
+          reg = <0x1000>;
+          #io-channel-cells = <1>;
+        };
+      };
+    };
-- 
2.53.0


