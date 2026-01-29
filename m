Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316BCD358C0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 06:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=; b=tkwUo8QMCdB0UuVVaVJNyDntoI
	WcHMWDxED01X86KcsTFvHLRhk8ET9iK3IEI2EZLQWkeNPC8FYdAYl+5K6c4+mkLOAHlvvQu7mFPuW
	bruvYSzlgZP7CyNuTMSwqzzDuO+j8FvQu9Y9+KRG7Jhg6PVMaZLIJngrdJ/bNwXs7Q6JSPhu6dPkR
	i+GFvSxPpl0rEv+fiPhue5N8QGOHQIF3v0aO2zHpy7XnW/VX75eYkXGLrwbB6gyI+RHtW3aXMlctX
	2k6fVTwPtyx8rtsEKvjmsvl39sikID2DsOtIM5spaukm0M1CI6M+ifugm4kw3D9UaHf01qG2TtYh1
	MkRmmjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLDb-0000000HIzM-30RG;
	Thu, 29 Jan 2026 06:09:27 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLDY-0000000HIy8-3uc1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 06:09:26 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2b71320f501so1123321eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 22:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769666964; x=1770271764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
        b=hSTLo8/QCptgODwNUudetQhAsnkmUPXTwxUn+eV86M1KMFgAfSEFg36WLoZ68/MOTZ
         cy68NOy0mHW+ifnYaEByCufb5z+pt08sY9ovduvBxMeNm/qVghIBLbHViF7nsaeyRW6Q
         Ji+fczChJgbZQSMFbxoTU7IuzQidetrwUr825W3X/y7MQYIsq/bJ8rI5rVeD5hH1wVKM
         c/oahxQDOQzCQVownHALn3vURBPRJNa8bFR58TSmA2yPxThITJkAZamLo1X4KWZhzrgI
         KBS+9nZbEZU6KGnuX9jHA1Z9TqCotrzGkS9AIgKCu08GzWm8TSzPmspEF+N+6qxTrvYU
         2w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769666964; x=1770271764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
        b=YhD0Aws51KM/fIdeG0+qyUKZtf+VBqgihcRUE11kerGTlI2kpCBAvHXfwOo3ONnbmd
         gAFPxJMcjIS6uo1m5gL6qW9j8yBrIVqnMKo/rQNuqM55YUFG61r9xMKBaASGaAPf8yIN
         TpQRADswfKln1I254ufXbllKgX6daTK51voNWJCv2iT6sB/ZPJ42xY1FmfFZjNNGlA2H
         MYkQdsDUX5q3QKMGy1yN4xF3Xx+P4D2D9jSvOC/x4QTy2lUWi7plMHDAlOvIofEHNVRh
         3hJTgyycYm0Ma2Db0r5EjzLyVy/UC7vjF8D/yG/eoS4Vmf98Yea0nEF+JqmasammryEw
         utOA==
X-Forwarded-Encrypted: i=1; AJvYcCWCAfB3oDuRV6HtN3c0Aza5BXE8ITu5xbySnk3kWdQ40V8KXi9WwBrPTzd2l2DBajjNE6O41YOwXz39OmWbS9DH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ACHUbRI3/u5peS7MRXJ1wbc/Fs3dLRymrT4N5lUjhP/KRwSO
	tpngAJD9Kq66n+gUpiGuSuPEoC+QT/hfuoqzmpujbgJYISuttux5+JNALmOPH8DK
X-Gm-Gg: AZuq6aKvbHzajD+md25TCo7XrZT/mn/uNaCTcY0kNCaBij6L3frtSgz/2nZn/ha8NHk
	QCok5SomS2B2ExI8R5/ME/mI9iHj68YgNiOVfXZycQ+xKkOu37gcMD77K+Xw5BA2Q1XVM0sg40k
	UVyQCn0RvXTD6OFv0GPoplmF3r4Aq4prZmhYHUO6zR0L7CT0OV+l064w6x6aHeukMSKmQc055UG
	Ww39He6c+PxL6xjQzT4Gt/fM62m/dqsu4o32IXSNFEjJiyO+cXSTuWIse8mLJaBC4ARwq8MBJSC
	IqphF3wzU8n0hUWepY6u7Yq6TjEJhdQ3elq0RMPjtJVjvPDYS6+yT0OeNkJ79s13d93mS/7AppG
	z8MpCxzKsutDrt/nVLQHAx1d+owXJ/l9X7SEbtCTn5ES//t6qwc2Mbnn42IoUdUBgbevDfs/nU8
	ThmKzDyXsQqQRqMJJEVSHc16xGMou+RFPJXrNDbUQkZkF4Crs768jAm776QkbN7Ian5iguURF2
X-Received: by 2002:a05:6a00:a0d:b0:81f:4c37:7658 with SMTP id d2e1a72fcca58-823692a1a2emr7126239b3a.36.1769665496533;
        Wed, 28 Jan 2026 21:44:56 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c227c2sm4108364b3a.53.2026.01.28.21.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 21:44:56 -0800 (PST)
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
Subject: [PATCH net-next v10 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Thu, 29 Jan 2026 13:44:43 +0800
Message-ID: <20260129054445.416242-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129054445.416242-1-a0987203069@gmail.com>
References: <20260129054445.416242-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_220925_011116_EC31CB6C 
X-CRM114-Status: GOOD (  15.11  )
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
index 000000000000..8eaddfdc937c
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
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..10cb5e555750 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -69,6 +69,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.43.0


