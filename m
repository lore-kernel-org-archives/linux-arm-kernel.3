Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18210C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=; b=DkyUTA726Q+mBqQLRY2ofLAEwX
	VmrPSsyychdxHpvYOuicBSBSiSBI5PnFXKOZMzogSalydRvzu+NZlV712FIHBDa3L31Nfsap5TFGs
	Kt/hWGtqo515sl//fz8Y9LDl0gbSiaU/anvgGnarD0swcuOve6wzl6q0ZY4MfpPShcBvVmBaVy/fu
	DFRRixV1ycvSaE/BkOzcvQe+BaeH3aSeAeogARsrmjJ8mk5ZpSw/qdXI76Sj87I9hd3Qr59sWVObX
	yJ6LLrh0FM/OLoKR+4tjiS4Lw9EG5pntR5hk3XHOK+NZ00pdktcAPraCNUCHd8ssQWfH/Eac4Xf4x
	jTIfMFxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUm-00000009RqV-2eM8;
	Wed, 23 Sep 2026 20:23:12 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TUZ-00000009RkS-1nUC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:23:01 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa663bfso237980466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194978; x=1790799778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=;
        b=S/OHQrw7DiLJrF/CEbOrZ113y7Kr52RM/hMr5QzK8ROU6hcbRy9dzxBM8iIn/LGiUL
         0af5m8QX3X95xrvAbdcUBWvQpMDmNNOrr1k1/qWIVsymcf+0wNSeWJKMTawbDhUp7cu3
         EnRuYRW7foprDP9z2ElL4ksJrchBOLwroXiaLlzkgkOXq4nRzMMf/smq/ZgusRj8mFv2
         6VNONs9OsvQ+sq7H5Gtc51lAE9lofJWcpQr882qhPE0Zb2Q+Wg0t8NVwkCQLcCpMu/Hv
         itaOCdGxmjiLsIX1l2SG4JZ0GGLDDpysTFKwkeurgYEX7T87LktNDHMkv8K/A2LqOcwt
         oX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194978; x=1790799778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=;
        b=AR7CXYeXJYkZhSxqv+jFp1OQ7/WKjv6Hdht9ofO5bLP5f+mb3PGZs2VuRiaSSil4kF
         uMdIrK6SX3mb++KlKVlKtDtUQtH4CT2q5J9375yRDRHk3T09jnfuL+w1aPBLwV3GMot7
         JI2l69ep+yKDu0wnurJ+W/u1rrAK6DNI4p8g7plchojcIRYtqQibM/apfc9BWuKmOT3/
         eDHojCmIvNT7isLTPxPRtxBDVY3iPZ1Pnx73dY7vy6GXUg29OIOIzieZjPoy+MsllH4i
         U1nsFv/3JpCgp0KB24m2ww2xOtJ9lDXeJfcovOHBBu2O/ssfAuamA/BMyyFqETAW0WEm
         QHFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaEmsqRBUUMvNzLBMliQ0c/aSRrk/JwbJSR0z/YfmKpwkBlupnURIYuofVG2sRpDxwGHexoBr4nVcX8sRAn6lL@lists.infradead.org
X-Gm-Message-State: AFuF++nlAeoj6Wdx9f1tIPeuQtIDOyMPVM7o6jlSCj9sWmgKVhMeGzqL
	j5D5iDEBJbMRoPKz3VAPEoZWWzLZYAK3B0EgjHAGFWLOShpVaLKsf7i2
X-Gm-Gg: AYBFou33KjIuB74HElZfoOOJ9148OZh0zUfUV4RqVhnIkl0UV0ROj51A3xMjqmU1TSj
	NlWxG962tlnjC7QVfxSziVHGpD1QJ8j9Cb0F0hjuTqZf0x+Oai5kqBZZv721/t1I9deTweNDsNy
	8ly9SQy1KY94uZQiRaku1Pc1Lu+q2FSuuqvYq9NV9QHY0GmMP5kjj/C2h8+p2As1yHHK30IBRtd
	vQJLS/RhQcZFU52sV7halNdIjjL437hpTwD6VQYvIO8d83Zm+CP9i/3elT7inLf6qX9Vn62zKHU
	Wcs515Y3P29TH8Pl2ti7bOyxo6bbZtkQpAFll3TQ4uK6mw65CDoxFFp74ZCOuqwLyTCwhY1fBZe
	n6mIUXKu0XfeKofAgv0EJb46oPh+6arIXB1gwtUtGYX/KqIrJ8k4MCWW20OQQO7ZN9HOX5+vgvi
	P3HU7pUf9jZvhbNj9E3WJXsMF6ooK3D8aF0of+l4VDRqnt8xmWi8RLFdDVau20ACbNUzrJWIEbP
	GlNAOmVe7yhs/NkxxoXtn3zuW5J1Tlhgtj6AYkt0gcJ
X-Received: by 2002:a17:907:d24:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c2ac2106076mr27276466b.0.1790194977830;
        Wed, 23 Sep 2026 13:22:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:22:57 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
Date: Wed, 23 Sep 2026 21:16:53 +0100
Message-ID: <20260923201701.43391-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_132259_577598_D0BCD1EC 
X-CRM114-Status: GOOD (  14.32  )
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

One controller at 0x01c20800 with four external interrupt banks.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
new file mode 100644
index 000000000000..806da97ab708
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner B288 Pin Controller
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+properties:
+  compatible:
+    const: allwinner,sun8i-b288-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      One interrupt per bank of external interrupt capable pins.
+    maxItems: 4
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: apb
+      - const: hosc
+      - const: losc
+
+  gpio-controller: true
+  interrupt-controller: true
+  gpio-line-names: true
+
+  "#gpio-cells":
+    const: 3
+
+  "#interrupt-cells":
+    const: 3
+
+patternProperties:
+  "-pins$":
+    type: object
+    $ref: /schemas/pinctrl/pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      pins: true
+      function: true
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-disable: true
+      drive-strength:
+        enum: [10, 20, 30, 40]
+
+    required:
+      - pins
+      - function
+
+  "^vcc-p[bcdfg]-supply$":
+    description:
+      Power supplies for pin banks.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun8i-b288-ccu.h>
+
+    pio: pinctrl@1c20800 {
+        compatible = "allwinner,sun8i-b288-pinctrl";
+        reg = <0x01c20800 0x400>;
+        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+        clock-names = "apb", "hosc", "losc";
+        gpio-controller;
+        #gpio-cells = <3>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+
+        mmc0_pins: mmc0-pins {
+            pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
+            function = "sdc0";
+            drive-strength = <30>;
+            bias-pull-up;
+        };
+    };
-- 
2.53.0


