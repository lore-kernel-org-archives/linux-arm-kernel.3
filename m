Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB071D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 05:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMli1N+z0DyyhK39bT3ifRmFqQyEYElNZ9GJSN3gXSM=; b=3L8qPG/0hYxIpbgU1L5zBMcmhO
	3y+9Qgm5xypJMfsHLDYe+Z2Ze2TNimvXweodZC3wsLyRk4K/SA0xqA57IWShrm1xuBNA5NCCPT9V7
	YAf8vbC78k3LNlFehdH6gH3EQF1bdel0LdjFxTzW7NcUdVcFQZtv2rqVTAYLgMfAbNUX8azZ3Sx4+
	JlrSpIrELEtXkhRIWJx1oiTPnOxIx17+N41n5l0CpxuwqrPgd34J+xSMRm7gaQPOPak/xTn+X5rKq
	t1STybPiL/wWbJifRiTyS8nJHYGnrqLGJ05ZEKaNTFS3uOvEpljqmShtcLkX49ryXGv5vBPZcvsfZ
	Cg22C1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5sP-00000005o8o-2yyM;
	Wed, 13 Nov 2024 05:25:13 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB5nP-00000005nRR-3ado
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 05:20:05 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-295d27f9fc9so825785fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 21:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731475202; x=1732080002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMli1N+z0DyyhK39bT3ifRmFqQyEYElNZ9GJSN3gXSM=;
        b=iME0d0kdcweks3k3J8goqyHNAqjlS6cPlZxfbBfvvW/IEytrQLdm4VN/kRZOLhyNed
         OLoH4FQ9Rffcr6bF/lw8PDpjICBUnwUMEd8TepSNrGENtF1sk9CUlA439KUcOCoHYTgU
         BGzODmpjIkwWWB0lCeFqNET3yGTTHoE/EIuRK2BFoBNifb/uWXM23dloyASXaCBamR4q
         Br9kljnhmDYy2ii+Y0+CRrQTH8XF/H7GTjohG08lZ2pN/gWPxzockmQvMxT+IMBFCCLE
         NPUO8fpFVSP33m+KNzNbRWfOJDLlyvXaVNTTxy+eFL6nvuX+cAl+ijREoJ0AqFSf412M
         IhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731475202; x=1732080002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMli1N+z0DyyhK39bT3ifRmFqQyEYElNZ9GJSN3gXSM=;
        b=w7/YiWoLsc0NEe67WhpEvES/cD5OnBo9cbgQhTD3bBVfYRsNBCv8B7+4IXK26Ry1+V
         Q4If4+/7qrhFohkx2dRQ8sSZgz4L7zLmuBbnv7A9+oDh5AGoaMdJ7ZbQ8wp0IesTijOB
         YsPkGTfHbLhMWd0OWxbt86JVrqjt1pcRqDDFeO/CVonmpiqONRXMfHiiiPHZ5m63BOWx
         ePzFZByCBOv7EbGog3atoy2WmYICxyJw58l6Ooeco7MhC17zzFfe+pdRcluqGl7gwick
         dmEz3+XaGGM29w0/iJ7ws0Iybt5z60z0Z20oyTtN1D2Dw6zWBgWmNGKbEcCHKffFxKZ+
         8NoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRZdeMFWnoeSedrmasBy3ftdhnBBTU4aRPgrGOpq8jqb9Z5Ef9GnsKpC+YZEFsr0tU8/cDLw/5EIw+iPCuyeaB@lists.infradead.org
X-Gm-Message-State: AOJu0YyRTrE+TrM/6qqG98NKYalWmc+Wej3m5KUYemhRAyccrxXt07m5
	zvU/F6JCVaWsNrhqPCndjDWjyQhGryzLbaqzHL0bIwCsEgRsg7ut
X-Google-Smtp-Source: AGHT+IFe3VKkmjJmFK7cHt6HbH+71V9EWcoc7te6pi89V3VQcehyCiLGVfV8cx19XT/Qp+l+Gy43rA==
X-Received: by 2002:a05:6870:4686:b0:26c:64f8:d6c4 with SMTP id 586e51a60fabf-2956032f1bfmr14436206fac.38.1731475202093;
        Tue, 12 Nov 2024 21:20:02 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 21:20:01 -0800 (PST)
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
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema for MA35 family GMAC
Date: Wed, 13 Nov 2024 13:18:55 +0800
Message-Id: <20241113051857.12732-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113051857.12732-1-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_212003_925202_29B3D143 
X-CRM114-Status: GOOD (  14.45  )
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

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..45eaf13467b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,170 @@
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
+# We need a select here so we don't match all nodes with 'snps,dwmac'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    - items:
+        - enum:
+            - nuvoton,ma35d1-dwmac
+        - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    minItems: 2
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
+            enum: [0, 1]
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
+  phy-handle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Specifies a reference to a node representing a PHY device.
+
+  tx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+
+  rx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+  - phy-mode
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    //Example 1
+    gmac0: ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x0 0x40120000 0x0 0x10000>;
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
+        mdio0 {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
+
+  - |
+    //Example 2
+    gmac1: ethernet@40130000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x0 0x40130000 0x0 0x10000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 1>;
+        resets = <&sys MA35D1_RESET_GMAC1>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rmii";
+        phy-handle = <&eth_phy1>;
+        mdio1 {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy1: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+    };
-- 
2.34.1


