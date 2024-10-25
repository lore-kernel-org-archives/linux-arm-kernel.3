Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEB0D149DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE/6bdE82IU4QyzbV1hsrlTmhXugWRMXOJiUEpwCLi8=; b=JUmDNfqlaKBHHNoaTQN5nbJIpz
	Eyak15rxgmTcRiOSDt5ehQrngma0SP+ZJEl68ioqp2iTPW/vrjoeDcxPVLNkU+fhXVhzFaV9lZFUZ
	wadA19kbPmbBQJN+5Fp6x3yPf+bQ/gFSmyy+1y0xK1tRnqstj2BxmoR9ZOrtlZQBZa1UtwXit6qhG
	oAJ9tU65mMPVWMM3LTwFmyJ0Tq3iqXJd93ZIWesc3N08koCavoKEo89ozl/qU9Kam7f2reZq8/kGF
	LFxkldS5eADZ8cJxMy3wQNFOPVgQIasA5RV0mj16DjLdIxNcW3lVFZmpGZ/jat1V3lpzGWTEDpknI
	kuMq3txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4P36-00000004oBs-1UN1;
	Fri, 25 Oct 2024 18:28:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OHn-00000004dxZ-2Xig
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:39:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so1725898a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729877982; x=1730482782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RE/6bdE82IU4QyzbV1hsrlTmhXugWRMXOJiUEpwCLi8=;
        b=dq/Agh33Dwxt2VyM4Gv4njKpFAq7L8Jp+s9al2yGgTMOTE7A01hyJ84trnD+mONwgi
         vxIzc+cuQLHQDkzhFh4kg3SZUZ5mz4LLrY8c8DddTE+ahUMmvIuSA0jRJd7+KsstT9cs
         dhRpIlDKSQRnTPUvySqy0+Pfb9FD4a7OpDLRI/hD4pIOw0y+tFk/npKGdNqDhn3hCYyb
         oAL6MLalVsZ2/ukQZE237z3qAHotQ6TRyqvFCrYA+58Suzq3WbKvmelRpZ6hoOdZnAeb
         2+VqWUIiBfwap5y3ivDKnPHoQVK48F7rn0Go+UTyosxrjzzggZfsqieHyea4SiHQu8KK
         Rmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729877982; x=1730482782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RE/6bdE82IU4QyzbV1hsrlTmhXugWRMXOJiUEpwCLi8=;
        b=FvfZyuxm7yxtTzw7vtYPzdjJh+uZ6p+uo2Rr8hHX+RfNc3pqWGwWBBpjVhLfZTCBsL
         MFMLKP0sg54cg2rosaDmdQcVIOzeWt3rHRqgIRXAHnrb+Bv7QZBe2dd71EdeZqmEZtmC
         pogLzDVFZlDdQsObH8wlAyeKkaK37za8mutyjtIM1T/erHlGxiTqbws21S6AF0o8rPen
         Sc3gTtN+Qk9XwP+WEDkjNPYfE0rnH4VdORdCVYNc6Krxg7Yyl6iyvRG3+hjXZ5aQJahg
         yjvQC/efcxEUZtxhRN9sGthTH773J/rsJwYTiEicS0uSCFratKqH5L0JC2YZmVNOOaRW
         j12A==
X-Forwarded-Encrypted: i=1; AJvYcCWv5ghIU6sz0S1VLVCfM1O+uedCXxzduOLFLUNwWmJrIRueRCmXe0I1sWgMXeOWgBh/3dTtijzCVWB3iMIyxCo0@lists.infradead.org
X-Gm-Message-State: AOJu0YxYeNcdOi/MUC33kvUa5+vnbLb5IL7OvLLVC+Zr/ATR/dp3fSZi
	LuxiCbn34NAoIJRfH5+dvRDB1yWd6jjcxvSEr3Nlt/M5GeaQ2S0tmIp963Z2FN8=
X-Google-Smtp-Source: AGHT+IEVi/JnSEoEmb/oANDw83QHAV0rm+Tjpr64rcE0SEGxppo+dS3Gh8supNN8sTs49Y30HpEovQ==
X-Received: by 2002:a17:90a:fb8a:b0:2d3:cd27:c480 with SMTP id 98e67ed59e1d1-2e8f11bee8bmr150527a91.33.1729877982182;
        Fri, 25 Oct 2024 10:39:42 -0700 (PDT)
Received: from [127.0.1.1] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4ca3fcsm3813961a91.13.2024.10.25.10.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:39:41 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Fri, 25 Oct 2024 10:39:08 -0700
Subject: [PATCH net-next v5 1/2] dt-bindings: net: Add T-HEAD dwmac support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-th1520-gmac-v5-1-38d0a48406ff@tenstorrent.com>
References: <20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com>
In-Reply-To: <20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_103943_834473_F988EF22 
X-CRM114-Status: GOOD (  17.13  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Add documentation to describe the DesginWare-based GMAC controllers in
the T-HEAD TH1520 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: rename compatible, add apb registers as second reg of gmac node,
       add clocks and interrupts poroperties]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 110 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..474ade185033 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -99,6 +99,7 @@ properties:
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - thead,th1520-gmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
new file mode 100644
index 000000000000..6d9de3303762
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 GMAC Ethernet controller
+
+maintainers:
+  - Drew Fustini <dfustini@tenstorrent.com>
+
+description: |
+  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
+  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
+
+  Features include
+    - Compliant with IEEE802.3 Specification
+    - IEEE 1588-2008 standard for precision networked clock synchronization
+    - Supports 10/100/1000Mbps data transfer rate
+    - Supports RGMII/MII interface
+    - Preamble and start of frame data (SFD) insertion in Transmit path
+    - Preamble and SFD deletion in the Receive path
+    - Automatic CRC and pad generation options for receive frames
+    - MDIO master interface for PHY device configuration and management
+
+  The GMAC Registers consists of two parts
+    - APB registers are used to configure clock frequency/clock enable/clock
+      direction/PHY interface type.
+    - AHB registers are use to configure GMAC core (DesignWare Core part).
+      GMAC core register consists of DMA registers and GMAC registers.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - thead,th1520-gmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - thead,th1520-gmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    items:
+      - description: DesignWare GMAC IP core registers
+      - description: GMAC APB registers
+
+  reg-names:
+    items:
+      - const: dwmac
+      - const: apb
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: Peripheral registers interface clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: pclk
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+
+  interrupt-names:
+    items:
+      - const: macirq
+
+required:
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@e7070000 {
+        compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
+        reg = <0xe7070000 0x2000>, <0xec003000 0x1000>;
+        reg-names = "dwmac", "apb";
+        clocks = <&clk 1>, <&clk 2>;
+        clock-names = "stmmaceth", "pclk";
+        interrupts = <66>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,pbl = <32>;
+        phy-handle = <&phy0>;
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "snps,dwmac-mdio";
+
+            phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f39ab140710f..72dee6d07ced 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19827,6 +19827,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h

-- 
2.34.1


