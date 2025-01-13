Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4115E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 05:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=; b=jC6hSy0ZmCiJbzGQDS2zUxr5lf
	i3PgpFefRcG/U5F5qSrXAhKSawn/FlMRKeXxA/gOfst8X72HxpVncFSWKI4dvgYxdSk/E4CisHJwP
	a8qA/5UaIWAg6aWfh4LLqr+q1b4gZw2q52CLMOdzyqeMMB/dObK8Te07YiecFtr16wQR8tfGS0Exl
	A3R3oef332NofF2qvMG+WnDnF1BurHPFVsOr8q98CD2yGodwpDGSDL10gG5zUt3o/3EvTFIdCKAgq
	IG+yg6vgLhSF/hDIIUIfUQ6KVba64lSNgcOVEYYYj6N88C5cUNUhcSzjrb9XRMYZqDu0/KCNAiIWN
	0OkWAoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXDTX-000000045uE-1Wvv;
	Mon, 13 Jan 2025 05:58:59 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXDQw-000000045Tg-3qX0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 05:56:20 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so6585391a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 21:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736747778; x=1737352578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
        b=cXsEcFB8IFQusvSkSTvnC8xf9rZrBuAx46yeZUPpSOmRgzY5fTxzXbHpGlz3i3t8eN
         qn90jZETqiesZq9PtQ4wJOt5MZILfiMl6/o9XbQZoK3J7eeLyWjLmdmYiMONubi+/qd1
         Y+7QI9Fc3cQlnGgXZdj/DE7ARpTe5p2GziUCKH1mSvRJhR+PgM6UzSoVOI75egk6mxsK
         YdfUIkL9yzGzTqiYHYUf8IJsJW35col1CbVM3D+aLrQyizhOAOGCt/hEhrqdY6c1kVnx
         XAOBHMhkxMqMrNe8CyXm8Ip72RXHoaOjZLpR8/iOhvO+7AB+VNh3rqnrDO5b00Gfyu5M
         b6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736747778; x=1737352578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
        b=l24dcmUvcVdkmeNtEFCc7wI9gSpaoxhw/PgMyzNe5ROtd1+dIVlXYT8+TwzIG4+VZ9
         qVQWGMSF2C13BpkNE55k/tCLYKWrLgfNAtHZqEl3WAPC4dcZM0NhumKUg/gzcLsH5LW2
         uoiTCrcLOAhm3sciDUIZGYIniVN2e9KSH1BTMNjC5yDzFD3v4pw49V+DxvcdTUsnFPdz
         oO5LQsZDGtTRaAqUIeKxZfwbS09LRa1uZfzm8R+x/29Q9N+6fsBVejQYI7rnVI+9wbdz
         SRejZeojQi2AzZKdmGG/+wcSs1MTgN8LfOdLlNBcsFXwqT57OiK2KwL6fHUnA7Ib4L34
         10Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUlcm6F7D7VbudgDN3nt7Ka+3Y3xxBdqN27EojPbRnr6opR03LvRIRhsts8E2YRJld3/76wiDDXG026pigrrIPi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw828YN1nQVOufSYsOjRZ8XbjsSwivivFMFa0HlYbpCaDtWKxQ5
	DRvIc0oAItvj8qp3ULLmfA1RsG6xPnBKFNGiHA0vMr8VYIAdnEbR
X-Gm-Gg: ASbGncvz8LTgdX22/CsORW1ZX5vja1yKCQNMD0trfrXr4UDI+ISNc7BA4Whas9FHGFG
	0aKCjS0Hppr7vOjwMdAAjCmckl3iXEOqsmcnUpp2PrCJIz6kQVEIgOOPeGz+25wtc1PzjgnifSM
	KopN8oVWmZJYYG4jXo6NTQw5ik/uxw0CE6zWiTBe/eJB7X4sMZ8eXEF4BIREZnsDZcinr5fjaHJ
	wVJe3PTAY/XRXIQDyDWW4ps2WpqIHeDOHDi7SL9Jsk4ONsqreEWF5AtMmAEcuxxxdxS8tPw34ik
	Iq5eNiYxPEz6AhuU+0efnQ==
X-Google-Smtp-Source: AGHT+IELLG1qqRQ+iIq+SIppUMZASouWezROTI1mRuvbXLFmarI2XwZnJBZzTNIbEvSNR3O+6hTwOA==
X-Received: by 2002:a17:90b:2dc6:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2f548e9f9ecmr26288303a91.5.1736747777955;
        Sun, 12 Jan 2025 21:56:17 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55942188csm7768806a91.23.2025.01.12.21.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 21:56:17 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v7 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 13 Jan 2025 13:54:32 +0800
Message-Id: <20250113055434.3377508-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113055434.3377508-1-a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_215618_965190_CF4FDB01 
X-CRM114-Status: GOOD (  15.13  )
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

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..c3f2ad423cc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,ma35d1-dwmac
+
+  reg:
+    maxItems: 1
+    description:
+      Register range should be one of the GMAC interface.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+required:
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..c43dcae74495 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.34.1


