Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6F5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=; b=zsgod7p/42KhdGFe8EgNv/5BNm
	BJA8CDERg1bCGYS87coA/ABPPZNY44xJKQ5eOnW8m40x2C6IuzJczeIx1Q1ZVgn1ks3v3Di8g1CMv
	iOU30lv1Ea2n3LwpKeKajLh+LuG4PB6O1D1/LlhFnp0Lz4z8KIGtUyl9Op0Pvbk/sBoXKT1IGR3l/
	5MFIhK5D1DZHvGtTnRSD2Mlo0JmhS1vM4R+dx2psJMTZD1Pf7vqogaeCenvoC3XyFTQhfjKpIyX/X
	xtQMc1TpmJW4Uc48xbvogjOllmWOM1SUo56FXN/D5Dc0V6/gRC96ZEtgoXjLFjt5eDptb9OCtbnZi
	r50QpMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbOg-0000000CFFp-1Gkp;
	Fri, 03 Jan 2025 06:43:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbFA-0000000CE6N-12IU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 06:33:13 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f441791e40so13563350a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 22:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735885991; x=1736490791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
        b=MVFwi1l6FD6jyy9jEr8MCTJEe4RmJuM3fLuinmcrRXMtss810UKUVcLlx1cVLHK5Fv
         Sf2JNv4jSgRpMyxIUnue8ykzDCGCU3qRAyINexMuCK/pOC3uqIekn80cuEaed8lHdATY
         eLCckOCA0jIExYyplpcDevd0nbcVg/Tvbm7BNvti/4V6p2VeG7c8QYrLC1u/n26gwUNL
         8S5aDguzE6MHQPTQVQ1H8MLaOnPkl8qRiqJu5RjH+nYELOn+D3S1Vk7wQsB2KjOibIIN
         uSPyinZHID0X8kNHWmPJ45TaujKPX/CmO80jnm+KFWNRxldtdL9+IJQ3kzJCd8Q/0DbA
         nmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735885991; x=1736490791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
        b=nde5IGbHOGIpMSBoy42vpE4LweaH6w5D9xEH9oEXlhQkw2taNsXMtAd7MrJ6oqIjTX
         zuYuYuMn2q6xaJV8kfGajSY1eTeR5gjZ64IqzJu+46LoCqWrnnfDVpzHzkCKA/UL2n5B
         UAz7j19abTnvTSKOSxsaYir9BTtkwzmziAIbf9xY/1QEc7T4JNv3pbQ40JkKMcpeGSE5
         qM0/Qcjt946RnXWa6Q+AHsE0N9Qe6OwI2JPRoNd8t8bOfDLGoFz5LIIt7Crdn9k8GWf8
         u3UAdvH9IteWcqfNV27vSG/QOnYYV7pszRmVZIEmeH1VPdSeeSPTtSPLE8MVHAs3CzQQ
         lRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdO2AAJ8nxn2VWdbDizRBnI3Hjtyl6E/dF4MtteDL0fVQrvuj66nuoRIR4ybd10fpoVvT3a55dITHpCHoTG4zR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3deExBGFSzNvERSI6AxDowrkKAT79C7n6bTb2uYuZT96EkkX6
	6n/x4f6vhquMed9qc2Vd8B+k5nTgtiM09KffYJfimesia9H9jLRn
X-Gm-Gg: ASbGncv08LC42bQBr78q2rBjU8oh/2ZEVjYpyiN8I2WayjnJATUMeSr9sCgGHp7Z80E
	s9nAGx89QuVqBsfzxMdIcT5QiJC/LJczVbkLlXOwrKQoGuUSb17nXgHjt8PFmH4z19XhmlJ7U5V
	CZHc8B6RxMPLuEPNv6nFYpGFd9AOQamRviPwZMCkvGs4ifab04/zH8W6jVqKpzjUzDpHBQf7DDD
	lSnWQJ1hseps7Uqs1WVA5f/RTzOyDChkzZMu8Hv5gjm7uQtClOyhpAYjUzWzURvdojFeremnZFZ
	zBILmsHzLqZjeI62T+rmMA==
X-Google-Smtp-Source: AGHT+IEiOFe4evfri1nnuFO6yzTBznHLXu75pnxX+t4aHQDSqgiu6wv6g4L6GtYLrIIjCWk7VdcMRQ==
X-Received: by 2002:a17:90b:3d50:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-2f452e458ccmr71154893a91.19.1735885991475;
        Thu, 02 Jan 2025 22:33:11 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 22:33:11 -0800 (PST)
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
Subject: [PATCH net-next v6 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Fri,  3 Jan 2025 14:32:39 +0800
Message-Id: <20250103063241.2306312-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_223312_288477_E17C9C20 
X-CRM114-Status: GOOD (  15.05  )
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


