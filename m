Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5A8CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94XwXvfhMCWkbglP5C/v6b9K4e8EqHUesAuv7/Cl770=; b=MaCo/9/HWftQ+hIutyfK9uTr3X
	JL5ncdIPR+GFXB48B6ySxbmla/+2OD2pjnBS7xAW8dZVMfuZasCqgYgFYcNipncjWZF/9Q1Y6garX
	cExVV//EDILL63blJqKyLOZXWTu2LR7bu+DOy+6X3gmsNt9IPNIgDNbkDUndHfYpwWTWmpIoBIzUl
	YJH2kC3tGrBgQPRdtqu8Ac+TZdTguHGvSNRGfq9ATPq8UQyofBt9dtXyvhwUPXy0QQt5OloZ+oCjX
	VbgB7xg04wiWdYl8MUy07K5oSkRD0dcCZjg1XOOVNrgAnqKSZZBMrzSm5z/9YpYIeIIkJ4PAQUDBl
	VxmPD1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEV-00000008gq1-3iBj;
	Fri, 24 Oct 2025 08:33:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEG-00000008gUq-1FNO;
	Fri, 24 Oct 2025 08:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294774;
	bh=KptE3Fl//paaLci9LvpaGuEuNS1ETPlL9VS0F53DV0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XMrLkKtnalw4ClHVsZxIz16uu6ttXg+dI1s2uYGCXgBqYBB/YNh3kgMNiXnarNwr9
	 qyizErYYPXWD8gBTNX9308fpRdZ9z5nex9HS8hWICMW6TrYbwBKGehzeqwk/epYA5B
	 Wb4nkGbnvqJOLywrHfXQYY6ymRXc9WKIE49mMf04CMtzJRC8ZgnWucT0qN1S5vVskq
	 skZW6EvxzG95dSbSvVmAIQIIThcOm9sybaInPrJ56+bKcE3KccRHTA4chVjLDbIno8
	 IFdxzbEIvMptrvZ1xHy65L5gKyAwTQojzIN6lAfEbE7p4JGnAu0+qg8niclsw78qSx
	 I7cKjpM6/68Sw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D826517E00AC;
	Fri, 24 Oct 2025 10:32:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v4 1/5] dt-bindings: spmi: Add MediaTek MT8196 SPMI 2 Arbiter/Controllers
Date: Fri, 24 Oct 2025 10:32:43 +0200
Message-ID: <20251024083247.25814-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
References: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013256_498796_8316ABFD 
X-CRM114-Status: GOOD (  12.61  )
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

Document the MT8196 SPMI 2.0 Controller with a new schema.
This is a MIPI SPMI 2.0 compliant IP, composed of a main arbiter
and two SPMI master controllers with Request Capable Slave (RCS)
support.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/spmi/mediatek,mt8196-spmi.yaml   | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml

diff --git a/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml b/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
new file mode 100644
index 000000000000..7a534f0a1d87
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/mediatek,mt8196-spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 SPMI 2.0 Controller
+
+maintainers:
+  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT8196 SoC features a SPMI version 2.0 compliant controller,
+  with internal wrapping arbitration logic to allow for multiple on-chip
+  devices to control up to two SPMI buses.
+  The main arbiter also acts as an interrupt controller, arbitering also
+  the interrupts coming from SPMI-connected devices into each of the nested
+  interrupt controllers from any of the present SPMI buses.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8196-spmi
+      - items:
+          - enum:
+              - mediatek,mt6991-spmi
+          - const: mediatek,mt8196-spmi
+
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  "^spmi@[a-f0-9]+$":
+    type: object
+    $ref: /schemas/spmi/spmi.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        items:
+          - description: controller interface registers
+          - description: spmi master controller registers
+
+      reg-names:
+        items:
+          - const: pmif
+          - const: spmimst
+
+      clocks:
+        items:
+          - description: controller interface system clock
+          - description: controller interface timer clock
+          - description: spmi controller master clock
+
+      clock-names:
+        items:
+          - const: pmif_sys_ck
+          - const: pmif_tmr_ck
+          - const: spmimst_clk_mux
+
+      interrupts:
+        maxItems: 1
+
+      interrupt-names:
+        const: rcs
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 3
+        description: |
+          cell 1: slave ID for the requested interrupt (0-15)
+          cell 2: the requested peripheral interrupt (0-7)
+          cell 3: interrupt flags indicating level-sense information,
+                  as defined in dt-bindings/interrupt-controller/irq.h
+    required:
+      - reg
+      - reg-names
+      - clocks
+      - clock-names
+      - interrupts
+      - interrupt-names
+      - interrupt-controller
+      - "#interrupt-cells"
+
+required:
+  - compatible
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spmi-arbiter@1c018000 {
+        compatible = "mediatek,mt8196-spmi";
+        ranges = <0 0 0x1c018000 0x4900>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        spmi@0 {
+          reg = <0 0x900>, <0x4800 0x100>;
+          reg-names = "pmif", "spmimst";
+          interrupts-extended = <&pio 292 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-names = "rcs";
+          interrupt-controller;
+          #interrupt-cells = <3>;
+          clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
+          clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
+        };
+
+        spmi@2000 {
+          reg = <0x2000 0x900>, <0x4000 0x100>;
+          reg-names = "pmif", "spmimst";
+          interrupts-extended = <&pio 291 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-names = "rcs";
+          interrupt-controller;
+          #interrupt-cells = <3>;
+          clocks = <&pmif_sys>, <&pmif_tmr>, <&spmi_mst>;
+          clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
+        };
+      };
+    };
+...
-- 
2.51.1


