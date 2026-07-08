Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0DCC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANaeyZnIlvUZuUb+qcVD79ri5D/Hu+DLtzSwYPDFNAo=; b=vJ3kdK1189IAcZEbZvN7Xnxg6G
	LA+3Lmc/L1SWyRWGltNX7uw6Vjql+RpchX7z/CzyHc26+7LbHXLR0BcWJRqHb62M6C8tLEAviPIbS
	Wak7c2MVmdZySxO9uAanGDCgJ24HhQ3sCIJmuq8HeNtW1ba1afiI1CkB4CLJRgL9DQmEnWhul63qs
	y77Hd3TnWwC0ltOiWrahMeHAdR52MfdY4GsDKFgRw333j69+ADX6Uck49qYX3cckyda4yagfdwBUV
	RKLhvxeFupulzkH30T+jlLOsoQpMRMhMhMZPt27CfKlOUNJ2h2w8IL/DzN25Lc77s6X/kIfzSt/HY
	qkxHHVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWY5-000000008hx-3TLw;
	Wed, 08 Jul 2026 17:59:05 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWY2-000000008fV-2aAn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:59:04 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c15d111ca99so93090166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 10:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533541; x=1784138341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANaeyZnIlvUZuUb+qcVD79ri5D/Hu+DLtzSwYPDFNAo=;
        b=hRSQQ0PZjPfy5u8nrhriqspABANkyMRA3nbV5vLCMBUAdUzZgeylMvmKIPO1dXd9ft
         saXk2LosAXQyqz4x7XF4rbga3beXmwpP4vlHQeokBYKu73KnQXLYrqp100wFavGsBLVA
         r2Sm0fzhYjz+0jKEQ/9JUI6B2fXwboK1dpsK8sXJigaDrGIPOtVDMnvLDwo5TvG9Uqyq
         xzPvUcqfGJ0BURqGbftH2oWSH0SNkQGgSObJ3ZZbd4aOWdAj3js+yix5zScwKDdaqBlT
         E7a0QnZibhtperlL5un45jA4Xe7Wn2yr6aNjB63BW/DHQTZGqvvJHVd+PyWh/oMWEco7
         lqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533541; x=1784138341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANaeyZnIlvUZuUb+qcVD79ri5D/Hu+DLtzSwYPDFNAo=;
        b=nxZOLK28qzWHZCzh3O7yerv1qD6ibyBzdXafpbByF77u/rC75wHoZ2ycw/dDI/fq2i
         n6Z/u1YzsDuYMGgonQFnfLEEXCv5kgfp/mhO46wnG4CEIpnHBx4ZemmmNqN+EV5FFSLZ
         jPe6g45lBIgbdiCq7FXjUrW/WeNcvFwSALPzH6tSe7uhYGpd/GMjOkHiJqTvNHkcBwAm
         t6P7PXu92KrNeIVIWsG6p8M5bnkPkfPH1E8O+mwpF+dvXBnbx0bG69DxtSiziOTMKKAg
         3c7xn3zJBkhlL3aHcwqm3w9Thkn1CDqDGXkzT17txRmWZ4VZrlis1jWJ9nOx6EJ7xk54
         THHA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ6zV1+guLvbj2WEeryDDKR9X0Sf3wZSM3vppWOCIBK0PuvIVQtHI6NkHA0sme/sZpIssYv4BeHREnKR/AzFGq@lists.infradead.org
X-Gm-Message-State: AOJu0YyNO2m+lChBQg52ALCWPo2XPQHDuGnpbxGMD63HI5yvaSX7vB6Q
	wUXWreSFDHTkjfBOl1oFAx5nXcyB+LO/TMSW2Q7Ja8N+nHzYGKZfdnmQ
X-Gm-Gg: AfdE7cm0L+UeQjZl5TlX+AQxaKL7nJa1Q1ReVPE9PRW7beKB6F/Ko3sitSgTpNUCYtH
	nrMgUD3JNPZ2bCLpA6oxWkidM65U43r6mtPvrWsxi7kdXJ1ex8gGQ20hwQu3inAR0JCQrOprZeg
	MNtH/ldw1RCAZJeBreuSifKjBhEETgt+tuLcm5VdCJJn136UhZk858g0kX/m7VTkdw7vXoght94
	WNOpYDGn6eCk+yUKycFgbitCX9bGbMKfXH8gkSg/AYbHoYzAUaSBCfx156rO12seYskPypgmsST
	iSSy2LbInZw8wys/9B054W0dEQQxuqYOXtBX8Ta4e4HRhyjZOMB1rCL/m1Adf/dNHLAsRPvj3lN
	4BK+tcDYP0ookvpuSHdRPXHGeBfbQPT9T0Wdr+CwxLVpCWt5EQB4LBBAAGbayiV9cAcX2sKfGcw
	xgFiZ6Dg==
X-Received: by 2002:a17:907:a286:b0:c15:b6bd:cbb8 with SMTP id a640c23a62f3a-c15ce121a12mr164929166b.50.1783533540594;
        Wed, 08 Jul 2026 10:59:00 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:ea3:3f01:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcc26sm357653666b.34.2026.07.08.10.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:59:00 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
Date: Wed,  8 Jul 2026 18:58:22 +0100
Message-ID: <20260708175837.1718437-2-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708175837.1718437-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_105902_674038_1F7601F4 
X-CRM114-Status: GOOD (  15.26  )
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

Add a YAML device tree binding for the Rockchip second-generation (V2)
cryptographic hardware accelerator present on the RK3568 and RK3588 SoCs.

The IP block exposes AES-ECB, AES-CBC, AES-XTS block ciphers, SHA-1,
SHA-224, SHA-256, SHA-384, SHA-512, MD5, and SM3 hash algorithms, each
with a hardware DMA engine controlled via linked-list descriptors.

The binding covers two compatible strings:

  - rockchip,rk3568-crypto: clocks and resets are driven directly by the
    non-secure CRU (accessible to Linux at EL1).
  - rockchip,rk3588-crypto: clocks and resets live in SECURECRU, a
    register bank sandboxed to TrustZone. Linux must request them through
    the ARM SCMI firmware interface (scmi_clk / scmi_reset), as direct
    MMIO access to SECURECRU from EL1 triggers a bus fault.

Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
---
 .../crypto/rockchip,rk3588-crypto.yaml        | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
new file mode 100644
index 000000000000..fc09f21b0654
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/rockchip,rk3588-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip cryptographic offloader
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+  - Corentin Labbe <clabbe@baylibre.com>
+  - Dawid Olesinski <dawidro@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-crypto
+      - rockchip,rk3588-crypto
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock for the crypto IP internal logic
+      - description: AXI interconnect clock interface
+      - description: AHB interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: aclk
+      - const: hclk
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: core
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      crypto@fe370000 {
+        compatible = "rockchip,rk3588-crypto";
+        reg = <0x0 0xfe370000 0x0 0x2000>;
+        interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+                 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+        clock-names = "core", "aclk", "hclk";
+        resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+        reset-names = "core";
+        };
+    };
-- 
2.47.3


