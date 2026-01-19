Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7AACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwRM1gGaHi8PnymUuB5O39xP4xhmWw83uFj1UvSjw/w=; b=lARHW9exK1yQbS0Xlv/JtNEpVq
	nPP0D/WxTUZJMjnm5CPC+u35RO1JZ/q7On3QeXCHQKUtn8zXpbI6MiQCipoKBji3kuSCdzKDiaZvo
	grmXdT1nokNnbdx2UZPmghzhqCNfNdIXwSFXYBV82q1FG7Cmj0TPCMdXZoHLYygr45h6iNjTarwkt
	0WbCAiYtFCPReW05AjF7H5qeLCb8gEFGctvJ0mSyAcDezsYSH+6P6EVLDC92Yshtz+iCFvErNB3o9
	gjb2sW7K4XMZdOawbS4A/4G0T7taP3dNXHrLBX1o2A8kYfa3FWjH7vXKDsKIDDfyueCUk5tYuwmK1
	zbuxOHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjlv-00000001UxY-3wQl;
	Mon, 19 Jan 2026 07:33:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjlq-00000001Ur6-0xqf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:33:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0d5c365ceso30623755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808033; x=1769412833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwRM1gGaHi8PnymUuB5O39xP4xhmWw83uFj1UvSjw/w=;
        b=SlvXPfGZtePn8a14CNUmeF88uaUi0nyrrfA/2UjNczCkYNNq+b4NMdlwa8S3EKIAxI
         w7ZDNZphkl9+aGNKiycUoD/r6XcvAX5qgf8MBoMK4LC1TioVSETthcpSQVD2mlkND4Cw
         uYlDzwmU5nZqhT+j5rWY5S0OoGywe4ZjFCh7Uk7diLJMr1m91To5hIogLTkRprBa+DqF
         adzJ19YoJT6wkhFKomZWMkukHePllFo5YSyk4SGxk3d5YFr32gJBgZ2hKMPPiB0T1GIM
         QLI2GONtlioZe0O1+MV49ouFxRV0Y/Wbm5IR/j0QtCKQYJVbZkyTs/TAnStlg5fAhBDq
         ksdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808033; x=1769412833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwRM1gGaHi8PnymUuB5O39xP4xhmWw83uFj1UvSjw/w=;
        b=TcrTun9AuYmYUySHJhE6EHkfL4EIWbVRKKRFGJ4LBBPn9riEKrSpMym0B6tKIARDef
         HHI+Fq2jTbNGJwCREjCbxL5KgBNEeC9P3jzxVyUKzApBdRQuEXVYQILtGsn3BaZxg1sg
         gnIS2ovbUVUV3cMc/y/09gwoUxcI8EnWnHZERVlvQm6QvcgEv6hgnsQp0gZRrw3J0Yf4
         QkdkNq9vbNwX+wjxIIzHoRJ31QYt5im/QNLchMfULoq2cMby0w8jzF1iUNgrL2K1nHGt
         hMN/SB6ffWBI/rWLUNiyx/YKdDKtDZH392dn9cXAjQVMgJPGoiIY+V5eu77gLivwVW3o
         RB3w==
X-Forwarded-Encrypted: i=1; AJvYcCXG6VlgqIgdgz2XqyCVLm3gWKvuNhB6UXP+HQy/3DlwyjA2e8XHXsf9A17oAQppH5oDnBqLfENil3IhPIVFX9/U@lists.infradead.org
X-Gm-Message-State: AOJu0YxgRqTkWskp51PxgTFZHfxoBewkgPc51W5dv5TPDVsLGebvbS0j
	Ce08FfdOIHaBHXrbrsX0zSdjXvxBhyiGnE5D++U58ipfjBY8uGZq+kBa
X-Gm-Gg: AZuq6aL43Gd6xPxUgEHV3VUim5LzuPWKt0eeLMnzft7+p7nSisgBIIZZQtJ4djWjpqp
	e+7sR5r5RlYvGADhN5yk4gfwfZ/lnCJ4HUjedOY3Q2X7XXEADv/hFTWosplGck0Y2Ll7vPmSuV4
	95yawmMaCL41WrAjxCFvbxHZ8OhpXepM3+Nrkjkb7G4aKFx04RTJtpS/XfJPtcsrSqP0679s/xp
	cInJZg6lzadxNLpx3zovu+k7locQX3QcR0tIffUDtoDKITOw0jkSg4HVqf9aDrD2f4dMjv5Rp87
	VOkju1auZ2zCGxmpeCG3iuIaj7vj0USqlkQnMkzs5DkJeDNlHMhfNBOlU6iON0YdwwEpcD+W8xX
	dtzVBpo9yA+WuOQxABeVJibuo9xkAAmXeEIXSnxdlvoQPAd6oBlKCGr7xHo7fm6jTYjGjka4DV8
	pDIPdkjY3FEWkBkjwjCHNTq3pycnG9rkzd6M6sZ4D3CRxLiA8oqd8rHXK+qoYFPDny+LuM4B5LW
	sKM+MtpOQw=
X-Received: by 2002:a17:903:94f:b0:2a2:c4b4:f72d with SMTP id d9443c01a7336-2a718928be5mr113594955ad.30.1768808033242;
        Sun, 18 Jan 2026 23:33:53 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:33:52 -0800 (PST)
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
Subject: [PATCH net-next v8 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 19 Jan 2026 15:33:39 +0800
Message-ID: <20260119073342.3132502-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119073342.3132502-1-a0987203069@gmail.com>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233354_405592_D6825A07 
X-CRM114-Status: GOOD (  14.66  )
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
 create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100755
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


