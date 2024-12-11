Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104BDE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXcqVV41GkS5OCdhP1LRH9L5Mcp24WkFvJlZaO+kog4=; b=Wv9gwWWy89XMS8qhzSQQnl1jZm
	5seu4iBQgllPLaeaRgG9dl+95J9FC8BG9ycT3Bda1v7WH9XMlnKyYWg4JS2U5ndfjoA8XkIA3dF7V
	LwPKrDQtMQlyf54FbzQGzWK8bX3TuGHQsMCXV5vQSEZaSn+XEF2IT8aINd/JPb96vg8OxkW+AO/3E
	ImXyD57W5oKCmx1DFkqtlXqDA85fVU3alsnlrUq/qZVgXw16+1CowkMsNPsMIOingxS7oEWApjOBx
	P964Jlfc+etLU8ZRO34UpeOoH6Qm4xhJVUrXZMZh0q9R+PEmYi8JYEIxtbseUeXoPXHWujRswRka/
	pBQfns2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIz9-0000000EPrW-3dOJ;
	Wed, 11 Dec 2024 09:26:23 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIy5-0000000EPXK-0m5p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:25:18 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa6954ec439so32879966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 01:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733909115; x=1734513915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NXcqVV41GkS5OCdhP1LRH9L5Mcp24WkFvJlZaO+kog4=;
        b=i57MOlTs9fI0fJww6ySsf+aZPyEh/mXyws0ZzqbFVXm0IwDjU/RHhc7vtUliVc9cDy
         JQFzCGlbwTmm/RA9Qglv7DkRkmbO45kb4K8qfX5srCVOQeEwT/vmZ5AL6suamnuHOJ/o
         Z+TcpCGCFB/E9DX3NmToVOc4hiM78ajDBsuSyjYFsDb61CSXcA04iIY9IBPnllT4DCMZ
         CA0hfBzHsTIr1Nm2q7J0RPpiZ0W+lBH47AXLbU6xpl3dVkUTk2dYBP22ViY2N4gnZOFG
         uii9bMCShrYLGUkJVGllUl8RkXEVaUhXnv8iyxRjQGKawEd11WSs/ptdkNOQHGo886GA
         rVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733909115; x=1734513915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXcqVV41GkS5OCdhP1LRH9L5Mcp24WkFvJlZaO+kog4=;
        b=jE+laRCL9DYsBZ0IE3BLbz6ngWz+JU61ouHPQFkShjJyEo1rdrTOKbJvkIOxboeUtl
         jBwinyz2UurLHzJ7ZtsoYUgM2ABwShYt3vfh5qfRmapu57zmMYbht1rOhxrP8aqxMxTH
         j5IP2vajfErH/ZwYj9whCibCkcJcFjS76Werhuyw436F6dIJczl7bdG8QLnGENi2ZndQ
         ODxuDFa5gf8WJ4LDJhTJjmDdxvQmCi4FsNJs8oldRXA6+LA0KbV+yDcB9vmCPOILYEGp
         IfsgTX9uwyK+v/62rYvMHGFoUEYuOcvgR1P9qzQ1BHrwmR4xuU3Z2LlW6ERyfgXn5pYI
         GtWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8QckvrPNA24Y8W+GJEcvNCw2sIRjbhhfftJNN24uIN11+GaqfEWW2p55LQTJuVtuYj+OfNuJ7W89CpHRJFA07@lists.infradead.org
X-Gm-Message-State: AOJu0Ywek/J9WjllbCE/lFEU6rO1JWBYLSnU6lNqiI0Jw9xKHDCHDORf
	plikrO3BCX1m0yRMG4vjKvPjHu6mzJ+OvmVCBvqGG0kV78bRVGsiT1UIby5e2uc=
X-Gm-Gg: ASbGncuMJ6Wev8NGoM6p8XkMfjeAAXrb8IQY9KBwUyv+f7BY/ooV9hpdOiT/QpPb2sd
	83QvEyKIWzHWwrLJ2DWzvs9fVdcNeGvwmGsaw+DxpUK/1afOxbhWqdFSKJR3q9G4KnwTJ8DadFi
	gJ+NH4JpoUlmN7OSrq/G77ifvDMY8q8dBv20kjr0mNsKZJG4p7f6Yc7Vyr/fpJb98I6+/2eEo4i
	Ac7XK1moaZE6X+cdgIs5MQCQTQAHQoL2gZnd4rOez3+KmQdM7RYQuxI/o4xCiVNjjyv
X-Google-Smtp-Source: AGHT+IHFyHBEA5HZHRpwyOqKtZhm48a+yS1LNgYQVR3j87nj6Xk8rdjKvJ/QyHwbpikKDarceoIpOg==
X-Received: by 2002:a17:907:3fa7:b0:aa6:79e6:5b03 with SMTP id a640c23a62f3a-aa6b116dff6mr82732466b.6.1733909115063;
        Wed, 11 Dec 2024 01:25:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa698a9b74asm333831466b.140.2024.12.11.01.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:25:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Shijie Qin <shijie.qin@nxp.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Emil Velikov <emil.velikov@collabora.com>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] media: dt-bindings: trivial white-space and example cleanup
Date: Wed, 11 Dec 2024 10:25:09 +0100
Message-ID: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_012517_223279_8CAF6BF9 
X-CRM114-Status: GOOD (  12.58  )
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

Minor cleanups without funcitonal impact:
 - There should not be an empty blank line after SPDX tag,
 - Convention is to indent DTS examples in coding style with 2- or
   4-space indentation (4 is preferred),
 - Drop unused labels in DTS examples.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending second time, because I missed previous Rob's review.

I added now also Bryan's and Heiko's reviews from last resend.
---
 .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -
 .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
 .../bindings/media/amphion,vpu.yaml           |  1 -
 .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
 .../media/mediatek,vcodec-decoder.yaml        |  1 -
 .../media/mediatek,vcodec-encoder.yaml        |  1 -
 .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
 .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
 .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
 .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
 .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
 .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
 .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
 .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
 .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
 .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
 16 files changed, 42 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
index a4f06bbdfe49..8ba5177ac631 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml#
diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
index 377acce93423..6da8a6aded23 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#
diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
index 9801de3ed84e..5a920d9e78c7 100644
--- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/amphion,vpu.yaml#
diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
index 84a5e894ace4..3f47744459aa 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index b401c67e3ba0..d726d141a434 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index b45743d0a9ec..110e8f5f1f9e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index a500a585c692..5865e6f0be89 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
index 59b805ca47c5..ede086d55add 100644
--- a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#
@@ -36,12 +35,12 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/at91.h>
-        #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
-        vdec0: vdec@300000 {
-                compatible = "microchip,sama5d4-vdec";
-                reg = <0x00300000 0x100000>;
-                interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
-                clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
-        };
+    vdec@300000 {
+        compatible = "microchip,sama5d4-vdec";
+        reg = <0x00300000 0x100000>;
+        interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+    };
diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 3d58f02b0c5d..19528262810a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#
@@ -44,26 +43,26 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/power/imx8mq-power.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu_g1: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu-g1";
-                reg = <0x38300000 0x10000>;
-                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
-                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
-        };
+    video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g1";
+        reg = <0x38300000 0x10000>;
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+    };
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/power/imx8mq-power.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu_g2: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu-g2";
-                reg = <0x38310000 0x10000>;
-                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
-                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
-        };
+    video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g2";
+        reg = <0x38310000 0x10000>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
index 9cc0a968a401..3469a43f00d4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
index 5cb0e337ea6e..644646de338a 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
index 584106e275f6..68d8670557f5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index d32daaef1b50..289494f561e5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index 06db2c1e6079..a372d991e652 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index 947ad699cc5e..d246f5d38427 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/rockchip,rk3568-vepu.yaml#
diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index 719aeb2dc593..8c2501634080 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
@@ -92,18 +91,18 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/rk3288-cru.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        #include <dt-bindings/power/rk3288-power.h>
+    #include <dt-bindings/clock/rk3288-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3288-power.h>
 
-        vpu: video-codec@ff9a0000 {
-                compatible = "rockchip,rk3288-vpu";
-                reg = <0xff9a0000 0x800>;
-                interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-                interrupt-names = "vepu", "vdpu";
-                clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
-                clock-names = "aclk", "hclk";
-                power-domains = <&power RK3288_PD_VIDEO>;
-                iommus = <&vpu_mmu>;
-        };
+    video-codec@ff9a0000 {
+        compatible = "rockchip,rk3288-vpu";
+        reg = <0xff9a0000 0x800>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "vepu", "vdpu";
+        clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
+        clock-names = "aclk", "hclk";
+        power-domains = <&power RK3288_PD_VIDEO>;
+        iommus = <&vpu_mmu>;
+    };
-- 
2.43.0


