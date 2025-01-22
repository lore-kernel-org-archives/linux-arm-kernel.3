Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820EEC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=; b=NGiEQ9OyJzROIx64V4ufzLNlvG
	15Npm//KywDyNbRNswxDSsXUVeZxz29HkEvI7GiAMxFfaO0DLDPq5KuNZSxLwIpk5d4PedOb2OizI
	ugdhVGRNuqt9Vq6VkiWEF6HbzK6hhRi6vm7V+nHyQGmi6ea2TYO0fvI5MSoQHxQVH0R0EX5p8x+uH
	36D1tIOhPIPa5Rm0kAl2bK01VMVw5C6Ju5R20kPI0s1Zn6gEfCCRD+5gcBfzEdaGz6L0GKkI7hD/r
	jD45WGJ7p8tV59Ohw7fSJWTg/bYC7Y5GyFLkfd9Q2OlmY0HGrqG7Swj7wJYA3JJcLjS1ntic+SXRS
	Uof3hKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabIo-0000000AMX7-1ZAu;
	Wed, 22 Jan 2025 14:01:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabGG-0000000ALu9-29YI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:59:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3748340f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 05:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554355; x=1738159155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=;
        b=UfAVpeYCsBmUZT2DbawPB+JAhnNueEBta+Jh+IyX624zUDAN+NTblCDhdNloCo0WEv
         3zMAkeApEUktrYt+QPKmJWBetnwSRE5HGIUToNF7tBdBRLRJSENm5T9ebXXyCHU9/gFl
         zWdMLIkoW0jlgcIXk2J5nZz0TbHnbnX4HPCOnTxnc/MlG1GLhcXLYmpgJH9LZt3xmY4z
         wtS8qeUtIc15c+z3DWrcFCw9UHBl/TfmPswn+WBlr0/hdXYza5xOozLV4YPlM/3r79Es
         a9G6mdPPC1A3P4uVHi7zONjCHHOeGvfErYw2BuY8KusD2KHHT1H09IWvVGo7GjDfU+8f
         Y9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554355; x=1738159155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=;
        b=Fi9aQasi2zdnIY6hdavS1JkWpfqxPSzZpMNL7c0KmmYE2hET99Pcd+BtidLJHLXT7O
         bkiytFc5CmocFRmthC9GzP4777E2dexkuxAh3XhoyLF6E8Wo1kLVPVfvCoRIbYqFaYza
         P+Ufrsq4B0gvmH66OWDizCtXXLsMUyszBUmwsF+xIwogVSQTeA+OB3rUuxPIH6b4wG59
         2ATFx17IiBic5Gs4JVYa53yYHnGWRTMv5mWkIKFgd4dSfYb9HknsTBeuJApS2x0DpDG4
         Q5hSEuSGqECxOWoQBB5XJK5XJSfZ8AOz4yOP2yPJ3jUTFJTYXhzYJ1vmVBYBg0Zdqd2+
         SbYA==
X-Forwarded-Encrypted: i=1; AJvYcCU98D9DZcctf58A1NWl2z/bVmWIOkLT/vBsj9r7NZ9VNuKclv4CKLmIe5CavszbjhtmPpW+sbgNoUfRYa9/MDXz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi1UudsmVpfSeb9k8FFNkPyyIFNOe+wN0NNaaFjTFrnMHeFlkS
	enrES1WRH0ChXeltlxxWM7vgbcIHykbavijoPQSeWmaAqDAOqxfb0Rtt4wC/QLQ=
X-Gm-Gg: ASbGncvYON+G8P9UXkgOBivclWkpWY8cbInqurcvzTxm8MFyhk+beVh/X0TQbdji8hr
	e5mtRnRZW+9WYK34CVkwbbrS83N2Fr9ZFOSMMJjOIFJlyWo2rlgu09LLRtdczpYp0Dxa3h1kaTd
	yCoXJ2CK3urjX7JZxXTUyVHSgd/GIAY9Qbd8NtNYQ7ffiSgZnewU7tPapVwEWWWcb9ABxfvOpKR
	UIs6MeR9oQSEwrFxXU8EHk3ZYclWPnxwMZ4HUyYbJrNusa49VGx9fbjtpF4AI98yi6uST0d8MTK
	OoNqCgTiQtxcrdJTOQxdEem8xk/4hpu4hf7VpdLbSBUkyrvw4bJhZPrengkcbMAm
X-Google-Smtp-Source: AGHT+IF0hy1W+aOU+17Gl9ZkkzxB9r26l+V6pkPB5W+gpNC11wIBBPbUVioMHG0KQW/1aZTkvVvKsQ==
X-Received: by 2002:adf:f1cc:0:b0:38b:ed88:f045 with SMTP id ffacd0b85a97d-38bf566fb1bmr17093395f8f.33.1737554354727;
        Wed, 22 Jan 2025 05:59:14 -0800 (PST)
Received: from [192.168.42.0] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm16418985f8f.70.2025.01.22.05.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:13 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 22 Jan 2025 14:59:11 +0100
Subject: [PATCH v8 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-add-mtk-isp-3-0-support-v8-2-a3d3731eef45@baylibre.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
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
X-CRM114-CacheID: sfid-20250122_055916_558745_DE9D137C 
X-CRM114-Status: GOOD (  16.83  )
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..723df7c1a900ff6b72be084e09dfcf0190dee62f
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
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
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
index a83db41ae0e9427e983e02f01aecb08193da3cd2..93d59c24befd990abd96ef585607992a6b231b72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14759,6 +14759,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 
 MEDIATEK SMI DRIVER

-- 
2.47.1


