Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82A1D58B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEh3nHbL/FUSvLsKsp4r0rwLAFQj7UgdMNRgMCRNe3Q=; b=dFccV/0oaFbDr+dsoICCnMhN7t
	SmjQmLkF67PNVh76+2o18jLworuhxEbwroMJO0lMABSQNa50xnDgzijyjGfNK6wlaEnbXHX6Qcm8u
	RRuf8NExa44l8UQXsC7ugyTAix5SkjxZXeFly3mO6od3V1xK/ZspgI3+O+H9ym5EyXw5DxA8Aqu7X
	R/sBTUX6ZfQ+vP5FnlS72fEr2VX0VCtbSOwjJ+6yUSEWNEw4v5BAlmeaVk2BTbL2kJSP5GAUxztIV
	3K2jb4uRAQz34w7YZMgz4pqdtwv+2GWTrAPHZeJ3B7zb6JvYBEB6TrUgjz9yjMlWkstkNIAMn8puA
	06j7eVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20uZ-00000003My6-46L4;
	Mon, 16 Mar 2026 05:54:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20uV-00000003Mwj-30nV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 05:54:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-356337f058aso2570416a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 22:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773640479; x=1774245279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEh3nHbL/FUSvLsKsp4r0rwLAFQj7UgdMNRgMCRNe3Q=;
        b=CkUG37iVfti9KIZljfWkjz9a2xlB6ZkukI3KeYkm4NXRH2kyhwUaQYYgKzYbc/OxNe
         Xx2/GUKiMrKayR5/E81FpQPRHi7UTNpaAmaMEXIQjsz5UmcwgcaG7UVHGyutKdOmrpAZ
         40tUskholgpdrZkeopd+hUkJZiG2+0MTy7nyZ9Y9ABC5uwL3owqn6y8eZm0hTrAZ0Uy2
         CFQtyqjHUzYlZNm3duu17jNE0fgAq//ftd9GLj7yRmTLLevbGh5RMV3DwTTaB3V530FJ
         tjsyQCimxLQIB3+5V6bsiBooEjVWBA79Sl9GEkWREUXJVLYB+pQ2djz0V1uj15a5gSwj
         sQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773640479; x=1774245279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GEh3nHbL/FUSvLsKsp4r0rwLAFQj7UgdMNRgMCRNe3Q=;
        b=m0QpC7dKe3hdfby8Bl1gUruNFU1QJIhFZ7ObDkU9RmR972i8aeMN7WIuQFmgGad7Wd
         J+iN6t9pml8DaRo3nTnoFJczCv6Sps3fpZ9UHT5o+pNtMdF+kMrzLAHCxlwaMV+JJPmc
         y3c6/5UBAaILegEF8J1QIeh4K2W5vlEvmm4KKNCWkeEVWkgyXzdUGWwL3tfdRwHKj/zR
         kH4u2r9IimupU4jht0pAtRK4BjJAg5br2mn1G9r2az6hXpCbH56RCFi6CI7BGg241qvu
         WpNtV1SG8Y2peqTXz+fhXVfx0RjhSam+AXf6RouwEjKfC7FRcTkoD/S0kpgtLe4PNoY3
         swwg==
X-Forwarded-Encrypted: i=1; AJvYcCVrt5aepXBDjk6E0LAzZ2i1pfO2s71ZA92u1mVPQBizSsT0gSU2FguHrzks4vyQqzDXgr28BF7QXSiyWbQe1UHu@lists.infradead.org
X-Gm-Message-State: AOJu0YxDZr/ninpdzG9f7yo1IvDBH7cxaNnVAFYQTnh8tglVFU2bJ6jm
	Nb2iKAPlHEBUjiR8SU1pqSS9Fh+ZlAMatf64zVogcia2oSe2oGq6xvmk
X-Gm-Gg: ATEYQzzQ7IOqpLjTW0B9kWPDTfhQPtO9ziLAd+T1+hdJKyraEwxLvmXepLL+qHQwttK
	7utjmhNsRIJCV9WkTus/3R6Zq6lfwlGzLE6k6UMHY7WLnp+WJ9iPB6By29dblrwTFREMiwbGCMU
	ifbCDkM30bnURqaQx7QNV3eO6cwSjzt6HOgKaFVVzlGLFlQWA+z4vbwQtHiAFjawCS9wLbbh7sP
	UV/WNP93Oha++uefLaNoB/Qz/GjXUHgGm/gLmjs0plM1iBbUk1zmPdKaDE35gIX/0V3nYQmLB3U
	3z2hqwV5uzjp21JrGZ/SEUKSEJINpjYLPOPqYTBX0E5usNE7rk9x88xuumAp86KUraYnu4TBDGM
	bOiYACzAq0AzgXxaQ3wKhaMjXMoE2BDegEe0daxHtBEnbLdvi9GXUHVfL4Vm8/cdobNKexAK2zd
	NGMM9kUu8h9SK6REbcQ25I9vhOt0H61Q76XTGuoQQR5m2Oh2AXadbOPIFmviH5qtBqzVPeflvE0
	Qiov+L7uqMe
X-Received: by 2002:a17:90b:4a47:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-35a21f007ccmr10901351a91.2.1773640479016;
        Sun, 15 Mar 2026 22:54:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9db7dfe6sm2166285a91.8.2026.03.15.22.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 22:54:38 -0700 (PDT)
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
Subject: [PATCH net-next v14 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 16 Mar 2026 13:54:25 +0800
Message-ID: <20260316055427.1310569-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316055427.1310569-1-a0987203069@gmail.com>
References: <20260316055427.1310569-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_225439_766856_286445DF 
X-CRM114-Status: GOOD (  15.53  )
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
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 140 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..ab18702e53f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,140 @@
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


