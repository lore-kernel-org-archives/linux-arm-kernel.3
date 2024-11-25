Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4DBD3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTCiIjP5WUtVlfWdpGLS44Qm+WOjxHYUNSodUPricsE=; b=bSvzRPaLxfjkMjjzoooOkFwDWt
	MyjuTVlxMfMyCSYKISiFHe/7CMwZocDLw5gYlEkE5bu/wRkXkQmBuvz1oDp5oEgrmw18aN0jziU5D
	cZz7uHntmgcznITG/dofI22znthtAskQJllJU3iwWb0Tn9qZ4OIyd/Qi1QW+WR4pH5tqiNJPmCsOw
	xWlzqf37SrHCYHt5kyms2LzX5we15GVumP0X77f/cqmeec8gnfcPDldKF9KbXa58Kd/RisWXsLE3M
	A/aUC6fwVkwOflG7IsPyQUQiBa7HqvRNnAhGx/lcv2NCRdRGk4b4W0g6OB/IMO15UXH7YZALPF6ac
	MbovJf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVSF-00000007ZaS-22mU;
	Mon, 25 Nov 2024 09:32:27 +0000
Received: from mo-csw1801.securemx.jp ([210.130.202.135] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVNb-00000007Yip-15Ny
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:27:41 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526832;x=1733736432;bh=s2QBTYvjALWbK/9t34XSfK/DRgxA5dhcbwCLcFUYzbo=;b=pty
	ofG6gvZXuTXmZGloaGRHFDN5vnjmOEroyjENtiofn8xO4VTjp1TLme5RC2i6D8x3XF0t0m8T9w7Ax
	eObOVKuKAH7pi/SsJ7ANV+MV6BWFBqbouVlZj4HaG8jW+vh1YfDx9t1jImAXui5x6rX/G28eqTtRy
	5ez1eumDiY5rFvYCj/es1wcgnRSm5/M6LTcL00EIdz1d+wSL2X9qcV4TGJzIAntKwhmHyrsf6Gsx+
	9v2kYeJIQDRaI4j+xqsjjoWCbhpo3v0VKpvpXsC+SmUdq1Mr/0VCfB2Xd/96ZHRXWL1/6z7D0dLY2
	gWYDXlRF9EAjG51TwXKBuivXBa19y3A==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 4AP9RCWA2549162; Mon, 25 Nov 2024 18:27:12 +0900
X-Iguazu-Qid: 2yAb1JZRvDQIMBFaAK
X-Iguazu-QSIG: v=2; s=0; t=1732526831; q=2yAb1JZRvDQIMBFaAK; m=N3BxzmwQ7zs0tp7sqbG9wCdMkvuwdICtP93CLzazhJo=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1802) id 4AP9R9Gm4129038
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:10 +0900
X-SA-MID: 32872668
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add Toshiba Visconti MIPI CSI-2 Receiver
Date: Mon, 25 Nov 2024 18:21:39 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_012739_495975_0B415BA1 
X-CRM114-Status: GOOD (  11.66  )
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
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---

Changelog v12:
- Newly add bindings for CSI2RX driver 

 .../media/toshiba,visconti5-csi2rx.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml

diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
new file mode 100644
index 000000000000..5488072bc82a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/toshiba,visconti5-csi2rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description: |-
+  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI CSI-2 video
+  stream. Use with VIIF device. T.B.D
+
+properties:
+  compatible:
+    const: toshiba,visconti5-csi2rx
+
+  reg:
+    items:
+      - description: Registers for CSI2 receiver control
+
+  interrupts:
+    items:
+      - description: CSI2 Receiver Interrupt
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, single endpoint describing the CSI-2 transmitter.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: CSI2 receiver supports 1, 2, 3 or 4 data lanes
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
+          Output port node, single endpoint describing the Visconti VIIF.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi2rx@1c008000 {
+            compatible = "toshiba,visconti5-csi2rx";
+            reg = <0 0x1c008000 0 0x400>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    csi2rx_in0: endpoint {
+                        data-lanes = <1 2>;
+                        remote-endpoint = <&imx219_out0>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    csi2rx_out0: endpoint {
+                        remote-endpoint = <&csi_in0>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.25.1



