Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB58E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=; b=YFzqde8WQBChWrwhEybZPdgJub
	cYWbOyAdzaYYgJgVdoEecB/ZRehNAJkqapQQtFcRHuQGWp71ppy0hOU7j+/i3VfqUmVzolacOauC2
	iHNQZbHGwCluabGOfdO9gjvpQ0tqcpwPzarQbMxRQpMqteu153qQW58hAZKd3LRdJKbDL8dBCKlRH
	vyP9WiScK/uovU2Zraf+z7T4lPty0uF6Bu05//Smx7jZcxNDwKR306TLy0NkKj0RQAvBPIPQxq30c
	6SZmLOMIg0+niG7eS77qArXzs+QNf58tKBFji3/JtCspc2Oy41TO182X3tKEwIpwpNr1c7htzH7zj
	4WZdRuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsWC-0000000GUy0-0no0;
	Wed, 18 Dec 2024 11:47:08 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsU4-0000000GUVC-0Vuj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:44:57 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-801986033f9so3322857a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734522295; x=1735127095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
        b=Fmo0Wvh0LnnY0E5ofh6cSxGGOfOSSqMbHuhlbcjGkTQjlRotam2jkFIQPWb2eMyAVI
         jaL0e9wgJhmrlc1q0/FhnQ3OmaJClV6lZodpTmTS1UgitWkfOcI+w5zaAiZyM1JuL/1E
         PpIAR9Wncyfpswc7FXUn4Y6Fk1w7exZYze6BAHCYKmellxQylG2Xb58j4nb45USTYKlL
         CXP7lOJR+ft3YyIo6n+m35UZ1s/hQXzTauG3nTo3VMJ6eqX8WGPvfVjqlzdEDLK8Remg
         bpp8TdxSeHjEWaVATWPKekxBo6xJUYOYL2FnwajBiTYs6YmpSdjM029yT9gfI1WV9U9u
         BYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522295; x=1735127095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
        b=WDt3jEvPb4vS48KMd86QiyHT1ro/3SZzTh60UoAGfSNVUmrE02Ldygh69YXGG9UseJ
         /IvlAQb6LTJs1y53Dpyg9n2BU9lGrY0GJ4l2v7GgcklGyARvVM5SpEXuaC4FRTnlOo9y
         0262FBF9GheZrEvjQURtfODBXETHfSPMqumq0h4Ek5MttfxYWMCiQZ5rGpGJ6oWMsJEu
         drR0Q2gk88iPRQp/CwVH/qMWgScIXlLVvWl9Nsjk/fzgheYSAjwv+aoH76DHePYKxs2Q
         pw11Ddwl1fjZdC2hcOxDRPSulj9wTca6kDwajYn4/+iBIDvB6ajVt+nCfzAum2Z+Cftx
         sGxw==
X-Forwarded-Encrypted: i=1; AJvYcCW9K4ugn6cLAKugNmPjdB/V3yOMZ2FozJz4RdqYnV5svaYRUcNkbvGSghMIUJlgtfzVsIPMciNnSFyMKuHvJTjJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwLvHN6L0bHPNHOWYf1KZSq9BtJBkvU19mlJvpWcG3mCRDnGoXA
	HFdEIMkXSR5pdIZjTfWd895k07h8lOhqCSqGYECkq7h14mI9AJHw
X-Gm-Gg: ASbGnctF/QQQeqEF3Qm4EP34W4k0V3GLBIX6KAWrvrrHhnuqPGaLgxrYEN8yAVCXG5Q
	nPSukEAYZUsXsFuBS5bo5eTHOecxLt+BCaUfkgi0Ew6uvlb7/TNHm1264PBU8kQwmI2eFT61UJM
	kDhpIyJdYRrVyxYeFTK7Uo7X2EBXYfkmCJ5EDhN5kFEbdqziBW6o+Uv0dtwEbzqpttLKgKCt4aC
	WUedyJBpR1R0CZ5NP5h9dSz2NfzUvVlo3/FdQ9yH8mdqyOPV9ReEz94GJcSXBx48qR+d38yu6va
	UHT2c2mkx4RuCMVfFlzr6Q==
X-Google-Smtp-Source: AGHT+IHONX6Gx0giguOpmTW6fQVk1CaAqSvv5cTzOJz9POkcYbKiTEO3GeqPM6pq2BbnSq8Z/eze6A==
X-Received: by 2002:a17:90a:c2c6:b0:2ef:114d:7bf8 with SMTP id 98e67ed59e1d1-2f2e91c13demr3765154a91.6.1734522295379;
        Wed, 18 Dec 2024 03:44:55 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm1324362a91.15.2024.12.18.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:44:55 -0800 (PST)
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
Subject: [PATCH v5 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Wed, 18 Dec 2024 19:44:40 +0800
Message-Id: <20241218114442.137884-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218114442.137884-1-a0987203069@gmail.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_034456_160235_5A5654CD 
X-CRM114-Status: GOOD (  14.85  )
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
index eb1f3ae41ab9..4bf59ab910cc 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
-- 
2.34.1


