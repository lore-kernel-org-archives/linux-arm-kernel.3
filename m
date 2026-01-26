Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378B2CF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=; b=JVVr24/uqfDqWntjqThsVQk3Er
	+4vVWT5k9D+92lfjhMYasSrsjDdywgPPSZ4czm8kwoBIpeSKsucOq5CrV+7rCjKayHyIIgbTSxehi
	xw2KnscMYaOI0S79EfzNjnC0OufqbwuiZmkqPdmajO5An7dFJPAFfv0eS8KmCmS/d2wFyx4Ar9dXI
	cZzla+rrZlGrm306/oI1jMsYlW3CQH+paH0usYlt+5PkgtDhI/p6/wM3Y+XCak5fPjdA0QcsMPgxp
	1c+wUtnmXZdngQSEed6MLvfCrRjY6GhRTlWh6Md8Qac2cnBtlQOro39WGu6+GkQ30m9Z2b6+nPm7o
	iGIpaNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLPa-0000000CULN-2KGI;
	Mon, 26 Jan 2026 12:09:42 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLPX-0000000CUKz-3AqT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:09:41 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-5f56066aa01so1546835137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 04:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769429378; x=1770034178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
        b=I46BNLBI5sDjURSaWZ9U3moPdGXPx9TgNUsK1t6bU3nOs+fBj0QrsiIvtHaCIRIbKN
         iqbp6ewfB3r3OL86rfPLD+3b0ZxHKrBL/fz/bTJ6nOTNHvEK8w7NbUCwVzt5Ox6/ac2D
         lqHZ7gqGaxuQNzYi1VhhY7DMGPJYz25eKX5Mf1Ox7fCmnjI50rQm3vXQI0gO6dtVcN6k
         SULbqS3qSkooRBzUKi1Jl4Kp4HcSeK500q5XDPA21GU4cFABW6TLIjjxqIgS/OkVvCmq
         2g5/MWrbLIyFghPfpsf5zTjSmnIE3UJqNOivW4Unoti92tXuzskHKz3afHpKN99T4Zbs
         Rq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769429378; x=1770034178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
        b=nPclVFMxeHSuGFPkoPP0ibNDvHmc73ad4Y91UzyT2SUC9aMg73MrJVGZAk6Q0yWP46
         Jcju531yC5cZObRNDXhUOikBI7cr3R/Wtplfl9LMSZb/aGIbcUm4BpkoGUiYcWQKARrW
         8jcSB7S4vn/nuQAWuZGedkCm3VfyxtoxGeeHoSBf86XaHjBZfwY7IQtxHYrx4CwqcTCM
         HSB9RaRMUZVJiRpTCGtKMVrInJaKr93JAjilfCWZ9KnQO0uJQK+TVzDK+AixTpjU72D7
         O2+mtzPi7Dc8nPaIZZToqS/XMrPi3Atn/rkIZH62zTSdCJOL/cCvHzDee/YAB6HH88Xz
         /afg==
X-Forwarded-Encrypted: i=1; AJvYcCVMBSUB4oDh1Fap9IDqlynpItbiKBlhJBqbaRdEEVHpeK8+xvaP1F8rrjD8PhgKanAUviXP6J+03h6jLRQYvdpD@lists.infradead.org
X-Gm-Message-State: AOJu0YybNmfc60E7SGQdC8R5jV3z7XaUOjFvX2JvMOSu7z4A0PW8VvyH
	DvJb5OwhdY4huyV5ujW74bXKHllGxbQl134M+P46KDfG1BgkbgdjACwL
X-Gm-Gg: AZuq6aIlvPqXF3l8FOK95d+wr+9BCHC3XSfuQo5uEn2suHQiroMlD4Ksjjy0ILnBh9Y
	YKDIAvUzosakvvyxMyhvQG9cEHJZCgVCPvRKTWwGAWzQPixg/pfc9WJUziHXabpWA3UKDXO00Gz
	u/vA0SD9njthniBUoZ1VgZVu//CsiOLT2J1yPTjgBvSwZR2z0FDzUOOSF6pxy0y3faLzQQsu6l7
	zYvhCWzagjqz4fOcBxQICgxukAGVsE0i7ctt5vLidvhZYyNg1emjh218EqfpNorqRci/cTSfs9e
	MK+7EYV1oDy5tPgp72/HIRs+o1JmoLPLhjV/i73V0gZ6xba3nX8ViAgVc+qaGjyYT/n4/DBTjDZ
	YDgD0O16Z3rFNZHCHl8chFtWUn81OvXsbLfh1AMx3Z1QLfV47L6v5QmbxIIRtFSu9QKQvb1wDPq
	SNHhmiwisiWS0b5FgjtsMauFWTrcDKOaVXKeCA5J9XL2fJ7DVx3xNZLsfY4g28axmY7uiM+Xk7Z
	oy9JPvcCh0=
X-Received: by 2002:a17:903:2f48:b0:2a7:a9b8:ebae with SMTP id d9443c01a7336-2a84531819bmr42437665ad.58.1769422988504;
        Mon, 26 Jan 2026 02:23:08 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm84958275ad.26.2026.01.26.02.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:23:08 -0800 (PST)
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
Subject: [PATCH net-next v9 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 26 Jan 2026 18:22:55 +0800
Message-ID: <20260126102257.2619862-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126102257.2619862-1-a0987203069@gmail.com>
References: <20260126102257.2619862-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_040939_832513_9A4B2418 
X-CRM114-Status: GOOD (  15.57  )
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


