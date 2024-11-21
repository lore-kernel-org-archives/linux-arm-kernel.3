Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A9DD75BD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDQsEsIuIG+15FFvp5RFf0/w51W8dM3c8wZ8eGx3or8=; b=Zm/RFuataM9wHC1KH9lKzZCGd9
	vPDrly3iZ0xyTmbDWOwB1ib72r/ZZeZDzGAuR0aKYSZxWnzw4pq7nsXhATyS70ivlCP9Ohr+ejlAs
	zX5ZMjRAZ1zbYXkuNTvYrC2zfsksN99eN691NyDq5V0+jhfdA4qOC9V/Fhn+recqrrx2LtQNY2V99
	ThxGJABpiyTlSZu8mzFyJrO4z8TZEp2Tn3+MikpBu+t3U7uJBklo0SLaxaFcYrGi+GrzErEySkyvW
	ApqF/oLZE4LlHxyz8jswc2GTLq8MN71RDS9auwMaRfXa8ot3V2NkTwDRlPpwyiOheGy0PCxbmZ+Gy
	IFI7Abiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2yy-0000000H9fv-3t8u;
	Thu, 21 Nov 2024 08:56:12 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2wB-0000000H8vc-30N4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 08:53:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38231e9d518so439760f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 00:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732179198; x=1732783998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDQsEsIuIG+15FFvp5RFf0/w51W8dM3c8wZ8eGx3or8=;
        b=dXYdPc2ZFADyZsoWTdI63vNTPYxkwugUt+gdrMKAKbaftX7DnNdaLUV4+rqyz4710t
         sZhnfdFWdEVcUI8xJjkjY+jJ9l0aizI5JhNHPmPoCJeByIQoDHvSnsMYGu6srFj325D0
         Hw08UHsjqHp6MBZXpiGI7kYGJgn/B1rthyl7YRk3inmjOz5oHzZKMjO5SCp10eBXJiWh
         6n8sSTFOkAW4+TMJLtiZKRS/bOBRoJrgkB/ClBzTQ7JaBnjDcMgDu/hsRxHR8WGvSyUg
         FYXSfgpbm2rSRpFzOEcm7cM5Ja7OgTfZxNeUou/qgz156fUlCeo3zGXHlAgstIR6IG3D
         MjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732179198; x=1732783998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDQsEsIuIG+15FFvp5RFf0/w51W8dM3c8wZ8eGx3or8=;
        b=OOPLC+BZWIwyXoKPcwU+FcVPJpFoRuoz0IBmoIKHEBJOvBvp29gTwrRmV+tAKFRijl
         8lFN5SBr3bXQoiRHfoNz1m2KgawTCFzptsP1GrAlJu9+zL2RcNNllXgioH0hqdmZtvIP
         rcjKhMa2neU5XRlZAWYLq+lLbf1LulX+2ENveW7l6HdBaQnDtqqx08Q5qs2bgnCIBQzX
         GfWeNRX+uAbI1XqEkNdP0fAODU1AeWQoSo2slqSbsuE0LBN8NDDoERLVccBR5UOg97c+
         HgKLSN6Tq0njvoyH2AKW4VYXn6/zaujd7i3+mbgTAsd3aq3la4STBzLQ21kXBReCae7c
         tN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXC0SAOtdIh/mtKauLPKV25ePSDTQTBo2xKoThoOi7RpAjPAWjTyrwD7RMOmp1ezmW5/FD9UQ7weQOqz1odt6oI@lists.infradead.org
X-Gm-Message-State: AOJu0YwNEONpablt74aKjLCu9hLbpDFmAQhX5qFnFD/xnx3gttWWKGe1
	3SuMH0yMKxJQY2BLGkCOF+p2qI6COmTYmIX8M4uhixyx4zkJadc1X/0lTkQDSzk=
X-Google-Smtp-Source: AGHT+IFBXGEL/v3q5aubHnM8Fav9mx+Z1bn+z8Isj/XnwmhflIinllJom4TbpB46wOLK9/cU6nIV9Q==
X-Received: by 2002:a5d:59af:0:b0:382:4cc3:7def with SMTP id ffacd0b85a97d-38254adf651mr3994848f8f.7.1732179198364;
        Thu, 21 Nov 2024 00:53:18 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549111fdsm4219900f8f.58.2024.11.21.00.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:53:18 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 21 Nov 2024 09:53:16 +0100
Subject: [PATCH v7 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-add-mtk-isp-3-0-support-v7-2-b04dc9610619@baylibre.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Phi-bang Nguyen <pnguyen@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_005319_778708_F56A1EAB 
X-CRM114-Status: GOOD (  16.58  )
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

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This adds the bindings, for the ISP3.0 camsv module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fdd07675645917fbcd692606c836efd07e50ac0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek CAMSV 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The CAMSV is a video capture device that includes a DMA engine connected to
+  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-camsv
+
+  reg:
+    items:
+      - description: camsv base
+      - description: img0 base
+      - description: tg base
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: cam clock
+      - description: camtg clock
+      - description: camsv clock
+
+  clock-names:
+    items:
+      - const: cam
+      - const: camtg
+      - const: camsv
+
+  iommus:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to the SENINF output
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camsv@15050000 {
+            compatible = "mediatek,mt8365-camsv";
+            reg = <0 0x15050000 0 0x0040>,
+                  <0 0x15050208 0 0x0020>,
+                  <0 0x15050400 0 0x0100>;
+            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM>,
+                     <&camsys CLK_CAMTG>,
+                     <&camsys CLK_CAMSV0>;
+            clock-names = "cam", "camtg", "camsv";
+            iommus = <&iommu M4U_PORT_CAM_IMGO>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    camsv1_endpoint: endpoint {
+                        remote-endpoint = <&seninf_camsv1_endpoint>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 242c54c88a4a22fc0cbe5c4fc5d7b0d0f84b329e..6147629405c8d40b00c4755a4ee27a746b26f782 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14570,6 +14570,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 
 MEDIATEK SMI DRIVER

-- 
2.47.0


