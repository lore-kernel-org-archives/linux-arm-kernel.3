Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DFDC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lt1iFyoVmOWgdJa6Q9QXH7FhQnE0Gt7SjTwOuCNZXk4=; b=N0YcOaiwHyiJ0AXCE4SsKIzkJn
	cpHIsdRonY5hhUHaZuGWMISuMQ65SI3bUNUBakOgFELdslRG9wJro9/Uzrpm192ixLnF9bYcRKATY
	J9z9I3/EOLgIJvA003NjBCjAHTymo+I7sEB6A8yG+9GNvKC5pHoC2mJx+tKxEVGYB6DZtNXk9qzg6
	8LPYi/9BPrDiZNxpqPa5INJlPb3BuZJtROfsyGcCt7yK+s+aNoBIvZCiC4yJuszuyIbCPEv5zZM9E
	6D9KwNqZFsyyX4VGfk9xjuJ2zvH18Uf/NlFhOng7cyO7/UaLAxO8phIicQUYAeiCwhMIAw0RHPwDT
	IDSYzhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgkC-0000000524X-3eOc;
	Sun, 16 Aug 2026 19:42:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgk7-0000000521A-1lLq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 19:42:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1935946f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909321; x=1787514121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lt1iFyoVmOWgdJa6Q9QXH7FhQnE0Gt7SjTwOuCNZXk4=;
        b=YrmABvgI4H4HO9WH7RgKquzwImaqaNtzwHnh8Npicp8ehGjU2jy0TTwQNALZlzHnhy
         4+fs1TT/Au0Y9Y/QeGnrYvxRvnJaxDpxhQ1A4d5yX0ZwdyYKiPi05hHOLSxfHy0bctig
         r+LjWDQe50/F/wvxg9mour1FL6NOQLW7nL1Zdzogxj/VItePXtd2BPu6qvX0PzEWs3E2
         1M3Pl9ExelT/68xpKnZfQzpckiyVX6KJp1K9pOzUbxAtQeoHQCrwDtZOjonGOdAWKrSb
         Fzi008ky2w4JiDILINckBdhXuGaCP6uzy6aU8v3XOeyNbIs2L0Ksfa5GuTn/iK75Bqfp
         RebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909321; x=1787514121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lt1iFyoVmOWgdJa6Q9QXH7FhQnE0Gt7SjTwOuCNZXk4=;
        b=cxdeTUtpjBGvnB4nY52wpf/coJ9FLlvNpAG8jP/sAIVznoH8J1NCjOhQZ/GBvnySoc
         cttoyQeF5KX2UeLsMrrRonY/IjwRs6YfDkg1PaMYbojfdRJcHHWm/7CMeyqW4K6MrNSC
         iXG8lljXyYSuGjKwOx7Jl5036QRNLMfNcRh+xWGINOvljBagYlXdom78PASqeaegpOTs
         6VtfDykgNm/uBAmWB9xHWzXlbYD0Ymlyezuns9AHOlTVqXw8sTD6EVJyMzJTBOr8jf0h
         jlyEZKcDOACkJipJUUi6/jI7JwcPo0UPuxBtLsr7wurvQFJrENN+9HaKfaezJZZGD1f/
         bZdA==
X-Forwarded-Encrypted: i=1; AHgh+RoQjE6qS9Fe+yJmx9lkfa6B+hNps0ojSRLTkEDhNEma2UZAXdvrq4k/e88XJOwEmLRMExuhASS/LE5kJwryJZpe@lists.infradead.org
X-Gm-Message-State: AOJu0YxAmXRx4JDKQULOYmDjJIqkaEdLc779FqYdHicTavmGpd4Qme+S
	9DZBf6tfE27BZVbzXuH41Cv1Dow6cvWhuY4CUCUSyAGrzKSF2jRnMMMU
X-Gm-Gg: AR+sD11AAAt9qJb+zOVFNm9xTfQhKxpVV4j1zOzOG4tCz58xtbr/P0rqMJeFdmzsr4g
	Wqnmpca44Ubbot+fuV//mH+SKi7N4wmhyDPeL9W+HStXHtNCg4JOd5aY9oDm40VVJT0+wRdnnfZ
	fg31u7r4xlUW+D04QS4dTVNc7RVYQ8TPKlma/XNhg/bWg4YMfHFyKA19UtStESWiPcU0FXggCMS
	chtFEfLLSjbzDJ/JEBctV60Un1H3o0YBkwcml4W86ESLVSLEyB8sgCbQKVsouO0VqBZHcSX8zjn
	OtcJlO479mUmcM1Zh2AzOJpz0HivIsJd3ZKZO4Wmj7evh3u4Bx/x/dpY+1YrN2Xi3k3ylt6JxiW
	S2tXFeh36GYHGZHZrrvzfOSURrqJJZePbqBff5qcDJOPsuQAjdfuwXjg+vngi6DcQN+gcAUo79V
	dqPoF2MYijonDqMwU/4+w35Hq4FrNB8gmQJWLKWWsydV2JSFUwJKPYEyust9kkxgyC
X-Received: by 2002:a05:600c:1546:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49987974700mr299168845e9.14.1786909321442;
        Sun, 16 Aug 2026 12:42:01 -0700 (PDT)
Received: from olympus.. ([2a0a:ef40:f1b:d401:2e0:4cff:fe68:285])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996106c6esm100527875e9.5.2026.08.16.12.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:42:01 -0700 (PDT)
From: Dawid Olesinski <dawidro@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawid Olesinski <dawidro@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588 crypto engine binding
Date: Sun, 16 Aug 2026 20:39:44 +0100
Message-ID: <20260816194112.552100-2-dawidro@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816194112.552100-1-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_124203_479820_DF100428 
X-CRM114-Status: GOOD (  16.22  )
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

Co-developed-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Quartz64-B,
NanoPi R5S, NanoPC-T6 LTS
---
 .../crypto/rockchip,rk3588-crypto.yaml        | 83 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
new file mode 100644
index 000000000000..32d241c19453
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
@@ -0,0 +1,83 @@
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
+    oneOf:
+      - const: rockchip,rk3568-crypto
+      - items:
+          - enum:
+              - rockchip,rk3588-crypto
+          - const: rockchip,rk3568-crypto
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
+    minItems: 1
+    maxItems: 3
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: aclk
+      - const: hclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
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
+        compatible = "rockchip,rk3588-crypto", "rockchip,rk3568-crypto";
+        reg = <0x0 0xfe370000 0x0 0x2000>;
+        interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SECURE_NS>,
+                 <&scmi_clk SCMI_HCLK_SECURE_NS>;
+        clock-names = "core", "aclk", "hclk";
+        resets = <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
+        reset-names = "core";
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c8d4b913f26c..50b77a750db3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23131,9 +23131,11 @@ F:	drivers/media/platform/rockchip/rkcif/
 
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
+M:	Dawid Olesinski <dawidro@gmail.com>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml
+F:	Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
 F:	drivers/crypto/rockchip/
 
 ROCKCHIP I2S TDM DRIVER
-- 
2.47.3


