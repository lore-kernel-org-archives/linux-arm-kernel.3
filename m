Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7923C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HgPtV1IXszkLhG6uHST7dgneJNufVJJ9/BLgDeMeRlk=; b=mzDfYbE3ItL0H4mHCUSLDR6wyI
	EpX3vuA/WrBmZSq8XVbWFS2mEACCrWDNcLXDv28FbHsMi98SdS2JIh9Tin4QFOi7AjeOukyN/CZeW
	lLKg8diOafM9r4EfRQRW8uk6bCKg4bv63o4u22XO3Xz7pXK0rtsCnpL803JwBdXGmys/T24F+ygNl
	RaT1SaqXqIUBtPrpqtjwp1PZwKQk4dFyPCzazulQPsZGNFlASGd8j+2mh+Y7HwSoEec2YwPlt+qcF
	Md3PGMWF/Cal7GrtqPoEfRdHdvoICiPZ3Yjt7Vah6A537JJF9ITUFyiE7NCA9ri9HyUYbuEskKPFN
	KcmVoiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TPT-00000009REU-2OYM;
	Wed, 23 Sep 2026 20:17:43 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TPN-00000009RCa-23eR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:17:41 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c254f9f7db0so161721366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194654; x=1790799454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgPtV1IXszkLhG6uHST7dgneJNufVJJ9/BLgDeMeRlk=;
        b=QFYBlpNdhEL9IBbirqkzQZjyh3JPC78IOAkj87hw5E3NB1yzPClifVwcFsSS2Ak4vk
         Uma1WJcQE+ZIw/fFnfE/8/ng+/5kxg5TlatndFY8/1q2gCuShksbNIOrdYTgv5RuVWzc
         Qz3hfVUJsS2vV1PoibtjIS9eKXZHJUHR5Sg1ExsGLSyozH0vS+FXnqUVAMRVyKVU1lxb
         b9tjj8ssJGY85IdTC/yrmSHBsxho7fIfeZGatPQ8QYaNqHd/6I8mts7Lnufk6AlFnq/K
         fucDYhs9K+wSwRrC1LSC98E+eaeYq/YQCE0/gDyQIm5hnSRVYkfBJFzJ3M1e/Jz5ZAPF
         NA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194654; x=1790799454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgPtV1IXszkLhG6uHST7dgneJNufVJJ9/BLgDeMeRlk=;
        b=2X92kmV0wt9u+mzq4UvbxiLztHvmJhKzNXbNBsvSGdQTe4hnwuAcHKrHAKMhS65l0x
         jWf4DkHzkU7SuJ2L3q5KyCW0qTvYJGOK5HK8UFh1tccoQbAFCj3d505Z3e9bBwbZFDBa
         twLybnvooSpBZUVIqJtAWKq7gBIC9JZMbGepk+2d+F1vGfVkg67CEyZ2b9LA2G5AehIf
         3FxNBx8QiREoYDZd5ekYUOdR9ZymU/cWhuMCC88Y3TIBx77EOy59pqEVh+46t2Rm9t51
         6q+HO3B8VOW51duxzHYqEv16r2ESKlb8yshtF2axwaXPmkakukXTnEvsj0TZcAjuwnsB
         x00Q==
X-Forwarded-Encrypted: i=1; AKwUvBwz22FvbQfLtda0C8rTFcfFVdOGlZjj+R2RdqflrPxTWW8K5p7sBelekIhSUuA0X4sioL1eWnPfM7oYUjA/1BxV@lists.infradead.org
X-Gm-Message-State: AFuF++nOJ+oY5Eec0VR3wW1OLBxHdo4ea9Do54M6EUZRqFkioxXnL6pI
	ocYV4A56ECq5nW+h/7JgQO44cEzTE/zHWr8mL0ICgffHRpp/aHI0u1St
X-Gm-Gg: AYBFou0kdRbkrKj/TJ8HoPOypi218vX4c+wVXYXV7PIJb1qeZcsD5vcJ7CFY0j3wFEd
	GDViOcAJmWG/15fYI4AueyARz+qrjfOBLqZyPmW1xqVZGEIepi15Ixeb/du09hRqbRJwYT6tQ1b
	IbGBEVzOJasmLknaunLf1+FeiEJSAHrv0esvBEKF5ygPWT4G+N0ZfjSbHBUjPgOre6qMEWfhbJN
	twbQV0IJ+/Nj0KALV0YX26V5R3NdSVFLpUYVL55+dMe1L/KwoPZm4w4vRbMLK2M+v8FwzG7O1+1
	MXO9GilKk4ugVFCZwmAcAb+zJZih+xrzLtltuXoxGjnvMKwty6t2Fbm6IFdzXS8dAleMmTa4gEp
	VQg01kAXZP9i13JHRRNRz3c9BrGG3e3eqPbTUWlbt+zOojZU1i+WBj8EVZ9ImZ6o0Hkcg/+snpr
	x7IVzrAOdiqkh7w7Hy/SXMpgXD0u5rFi7z1oPPdlnj8xR5KId63LQfGK0n3gOCVblV11R04out9
	+UhUeUsVf08nJgBKDNwTfp1cVctocyi
X-Received: by 2002:a17:907:9452:b0:c29:4b79:e41a with SMTP id a640c23a62f3a-c2ac24cf5c4mr18473566b.20.1790194654447;
        Wed, 23 Sep 2026 13:17:34 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:17:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 01/11] dt-bindings: clock: add Allwinner B288 CCU
Date: Wed, 23 Sep 2026 21:16:51 +0100
Message-ID: <20260923201701.43391-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131737_578995_79283EBB 
X-CRM114-Status: GOOD (  15.16  )
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

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../clock/allwinner,sun8i-b288-ccu.yaml       | 55 ++++++++++++
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 90 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
new file mode 100644
index 000000000000..22b59d5b652c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/allwinner,sun8i-b288-ccu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner B288 Clock Control Unit
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  compatible:
+    const: allwinner,sun8i-b288-ccu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: hosc
+      - const: losc
+
+required:
+  - "#clock-cells"
+  - "#reset-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    ccu: clock-controller@1c20000 {
+        compatible = "allwinner,sun8i-b288-ccu";
+        reg = <0x01c20000 0x400>;
+        clocks = <&osc24M>, <&osc32k>;
+        clock-names = "hosc", "losc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..3dc1704d001e
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_SDMMC0_BUS	34
+#define CLK_BUS_SDMMC1_BUS	35
+#define CLK_BUS_SDMMC2_BUS	36
+#define CLK_BUS_SDMMC3_BUS	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_USBOHCI0	46
+#define CLK_BUS_USBEHCI0	47
+#define CLK_BUS_USBOTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI_S	52
+#define CLK_BUS_CSI_M	53
+#define CLK_BUS_CSI_MISC	54
+#define CLK_BUS_ADDA	55
+#define CLK_BUS_SDRAM	56
+#define CLK_BUS_PSRAM	57
+#define CLK_BUS_DMA	58
+#define CLK_BUS_UART0	59
+#define CLK_BUS_UART1	60
+#define CLK_BUS_UART2	61
+#define CLK_BUS_UART3	62
+#define CLK_BUS_UART4	63
+#define CLK_BUS_UART5	64
+#define CLK_BUS_TWI0	65
+#define CLK_BUS_TWI1	66
+#define CLK_BUS_TWI2	67
+#define CLK_BUS_PIO	68
+#define CLK_BUS_GPADC	69
+#define CLK_BUS_KEYADC	70
+
+/*
+ * mmc0 and mmc1 are v4p1x controllers driven in the old timing mode, which
+ * needs the sample and output phase clocks. mmc2 and mmc3 are newer blocks
+ * that do their own delay calibration and have none.
+ */
+#define CLK_MMC0_SAMPLE	71
+#define CLK_MMC0_OUTPUT	72
+#define CLK_MMC1_SAMPLE	73
+#define CLK_MMC1_OUTPUT	74
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..675145654548
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USBPHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_ADDA	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.53.0


