Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AAACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITm/rliZZ4vKFqE8Q2m0VW/KoZX/Qmydgiqj5QqzbFw=; b=QxeqnKOCfPJ1DBifX7c3tT0TcH
	VH16eTn36Ylzw5yxiU2JbYKV/J5iEn5ApmpkPuNCOsREtk285rt3vv7Ysf47X3997EIevFAttaOmE
	A0qpxZRDaaGICukXaMqcV456DqXhJMirEAgsc7GxBgDSqXLfN8+Uvs7Pegov0EZyh61VPrz99QE/n
	//VSMXovxiRLGX0pPO3Iy3BEFWUq+5+66Ln3Kn7aQsvQWOMqz8pbzOFY/v08nK5W9P0GshxhlJiFW
	yN73eGWx2WKsy1xkpKkKptRKGDeCokBk0v17QQeRN82uYRY52Hj8eGlHMXj3l0Q4ky0mo6yLq1WJU
	j+ueqPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9DlF-00000003ILR-3Wq0;
	Thu, 16 Oct 2025 02:30:37 +0000
Received: from mo-csw1801.securemx.jp ([210.130.202.135] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9DlB-00000003IGM-2iZQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 02:30:36 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:Date:
	Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760581818;x=1761791418;bh=4eMEvvInNJVezn6qKbiFKfyhSEC25c8IQvCxXUyLOzY=;b=aVH
	zry1au3936erVN/c2lpUwz7FOopKQqoeojGkhqYGyyoGJPTEt0Ilo5IEhAKrZO86416jxiQRqS58F
	b1i8WaAOxl5WLXtHhvEDhgzfk5kZH2HTVvwBfEJxnH0Xc4RYJjlDYqJcVn9tokZOG4B65aF5jsXob
	Gs5aSrx2E7rOjMgPJkt51d5+mKva/bbPqJGRMKlXF6+I6k/MVFZWzQJXZ1qglO8f5zzScUJcdhMWb
	/5UVV9fzf/kf+q4N6hgF7YhOXfAi6eCDq1IOf8sCbVr9OZUCr+nnnNbcTie4VOFls4y0sOb3VLyIg
	W45xUWSNSqHqap3E8fyCjgaOibh+UXQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 59G2UHnN1823703; Thu, 16 Oct 2025 11:30:18 +0900
X-Iguazu-Qid: 2yAbDoX6m4uSGDnER1
X-Iguazu-QSIG: v=2; s=0; t=1760581817; q=2yAbDoX6m4uSGDnER1; m=IDxflAj8nPPKWdhIPiFRPmkpXWRzuaZN/qYu0wh2ay4=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkd2DzQzyPd; Thu, 16 Oct 2025 11:30:17 +0900 (JST)
X-SA-MID: 53072906
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 16 Oct 2025 11:24:38 +0900
Subject: [PATCH v13 1/7] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-1-ceca656b9194@toshiba.co.jp>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
In-Reply-To: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_193033_907686_391A4ED3 
X-CRM114-Status: GOOD (  14.01  )
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

Adds the Device Tree binding documentation that allows to describe
the MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v12:
- Newly add bindings for CSI2RX driver

Changelog v13:
- add entries to MAINTAINERS file.
- update email address of Nobuhiro Iwamatsu in /maintainers
- add Yuji Ishikawa to /maintainers
- change /properties/compatible: toshiba,visconti5-csi2rx -> toshiba,visconti5-csi2
- change bindings file name: toshiba,visconti5-csi2rx -> toshiba,visconti5-csi2
- change node name in sample DTS: csi2rx -> csi
- remove "|-" from /description
- update /description
- add definitions of clock and reset
- update /properties/ports/properties/port@0/description for better comment
- update /properties/ports/properties/port@0/$ref to specify full pathname
- remove /properties/ports/properties/port@0/properties/endpoint/properties/data-lanes/description because the default text provides enough information.
- update sample dts
---
 .../bindings/media/toshiba,visconti5-csi2.yaml     | 125 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
new file mode 100644
index 000000000000..21fb46de5b6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/toshiba,visconti5-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
+  - Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
+
+description:
+  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI CSI-2 video
+  stream. The obtained video stream is used as input for the Visconti5 VIIF.
+
+properties:
+  compatible:
+    const: toshiba,visconti5-csi2
+
+  reg:
+    items:
+      - description: Registers for CSI2 receiver control
+
+  interrupts:
+    items:
+      - description: CSI2 Receiver Interrupt
+
+  clocks:
+    items:
+      - description: MIPI DPHY configuration clock
+      - description: Register access clock
+
+  clock-names:
+    items:
+      - const: cfg
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, with an endpoint pointing to the image sensor.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port node, with an endpoint pointing to the Visconti VIIF.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/toshiba,tmpv770x.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi0: csi@1c008000 {
+            compatible = "toshiba,visconti5-csi2";
+            reg = <0 0x1c008000 0 0x400>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&pismu TMPV770X_CLK_VIIFBS0_CFG>,
+                     <&pismu TMPV770X_CLK_VIIFBS0_APB>;
+            clock-names = "cfg", "apb";
+            resets = <&pismu TMPV770X_RESET_VIIFBS0_APB>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    csi0_in: endpoint {
+                        data-lanes = <1 2>;
+                        remote-endpoint = <&imx219_out>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    csi0_out: endpoint {
+                        remote-endpoint = <&video0_in>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..e4634a0aad74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25979,6 +25979,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA VISCONTI VIIF DRIVER
+M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
+M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1



