Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5996DEC0469
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlyHDmizNIkIW1kEBSDJurvUimBBLmNsme12b6R+fQc=; b=t7U26XUJs/Run28WQVxZhDFBuX
	AiJFPpu8GGKR/njqArkPak+3k4QQ1HbeJPkvYJIdGC/ejZJFGjeEGD2LkInElvWWi4PczMx2hZdX8
	muqihxyhO18W0Fxmo4/Q+DieoyvTvuJ324pJcV3xNw27ABskW+otEKxjSqqBZQR+0QZzb4PZ8kWI4
	jUmKjoq83vuA9ubgxv9BpHLTJ5/ax3pErLnHEKK0TxAufP+4xzaJ2+Vp5Hjxllg7o6RPyc+cWILwx
	mFE2J0PK/rt+RfvzBcUSTrL3F110jo+JtbaKjEUvGNijAjorYaRoWzT9Ikgba7m8I882wg9tip6BC
	yF3BQgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLvV-0000000Er4I-1hNY;
	Tue, 03 Mar 2026 09:20:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLvS-0000000Er3O-2O9m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 09:20:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ab077e3f32so23776885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 01:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529622; x=1773134422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlyHDmizNIkIW1kEBSDJurvUimBBLmNsme12b6R+fQc=;
        b=DClmYnzckfMPaWLq/zbxdXIAHxkshMCH46lKNXT/QRt/t5mBIh0R0YKtyF2298r6hi
         eZT9rbRcpZ6STm29MSux8Chjk3iGxMZhZFkWscdlswDVxLDqpm6VpOTXU8UNkjqwhC86
         cAWhUFj2r+JW337he2ESRnLv9+9Bt0lKVNtxBhL8TGzBSaO4f5zCVXKJwhl4k4ccS4DN
         duL1bfAdEsn+a9nuG8hIBqkOhF/pDl25GUqeE4Jx4A6SgCDDyYCUXTxc0KLfkZnzA8/i
         crGQOdBq7zvqjPogM/csJ6/BupLkM4jD3k22qKCWsDGDDpnvBn9ihwwZws5xSbtMeAQz
         ed/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529622; x=1773134422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlyHDmizNIkIW1kEBSDJurvUimBBLmNsme12b6R+fQc=;
        b=kczvy4feBsgQOhPE+lCiXHVin6+dRGXudgG5NISfQSqrIJLBeM4DvIQZd5dW4eE8MB
         8a4cTrcW6NYpoDPDARHVeQImihnHqJS9w2yyweFTO06MZj9XBBgIk18dMuyqMtwO6XAv
         kHgHssXo4zGHVrmHWQnfxc9LZJKAQATrWF3F7eVsa+oQ1jTQKvTM9W5ALZTxsPV6Vsz6
         pdNLFbHqQrLVarcIyJMzhJvdiMz9oLrTH7+RY3NzlfmeNlclAXp3s7ATAftncDOVR5ag
         biIjxIer+bRFj/trSI6R5ZQI+UbjKM0fQbZTYMJ5LzdauBJ64l23DfFbYR9vV/R6xcXz
         Fa4w==
X-Forwarded-Encrypted: i=1; AJvYcCXst7IAAj7WrzCPMQSyEoIIhSjFlnL6GDYrjTjOXQLLvGjm2a0UUH/eC4vYoIpbl1u03uH1iwNHj/JSYsBV0GQi@lists.infradead.org
X-Gm-Message-State: AOJu0YxoK7xQi9IgINYCKHByrR98kUF38N6vv0i22KL/r0ZcETxB2JKw
	qMtdXmt4lfW32BQNrNyMx8LfDZ6ApiM9ycJjScXVOuf+4oeaWUC5frps
X-Gm-Gg: ATEYQzzZ0zUFFptM9I9DQT5XxBpqZgC5gGNa5SwVF3FUFaJBhexY5gOu0xrMaBKo4Sa
	NG9F80dVGsrecr7w5HVTTM6RINU0hYRTQ93lTF7gSad5GfwzjIPcBzGEawbhTvBuGW/n2lkAkyG
	1apDUBGBQFBqdxoTaJPgC5M5sB02a5R+UWdZZjGv12CyoecyxLugjQJCG6pH0iynBNQ9UPm6E8z
	1MiS4Vl1zJ8Mjwc3XC0ark5xTkhclgDuLCw0tBnpQ5FQng4iAkh/EIpHL49xJJ+m/Pvzc8UPIkO
	tMdOxElBscZ6gLfU2kQMcO9fN6xtrP8JoMVDs8RyUujwJpQMPmrBF1ARlR6XNqQMO1Wk/+spc1K
	uuP8eHYicTg85cbwu8RBvTSVPHoBnf9DfZ2AdYmGdgPagIg+BFT6x702EULV4tjZHiOJwJwC+ea
	gokg62T276FlctO2RDyQIizZ5gACu9v/RxKEykZJW/3baSB4VAsVhZX02VDDwE/zgkhgVWmMlvu
	FeqLEh1TINI
X-Received: by 2002:a17:903:1b48:b0:2ae:5426:da4f with SMTP id d9443c01a7336-2ae5426dcabmr60869725ad.28.1772529621612;
        Tue, 03 Mar 2026 01:20:21 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm158777475ad.50.2026.03.03.01.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:21 -0800 (PST)
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
Subject: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Tue,  3 Mar 2026 17:20:04 +0800
Message-ID: <20260303092006.263715-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303092006.263715-1-a0987203069@gmail.com>
References: <20260303092006.263715-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_012022_613489_134C0B9D 
X-CRM114-Status: GOOD (  15.48  )
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
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 131 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..90c28fb13985
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,131 @@
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
+      - const: nuvoton,ma35d1-dwmac
+      - const: snps,dwmac-3.70a
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
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+        snps,multicast-filter-bins = <0>;
+        snps,perfect-filter-entries = <8>;
+        rx-fifo-depth = <4096>;
+        tx-fifo-depth = <2048>;
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
index 38bc34dc4f09..de04cbbab0c6 100644
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


