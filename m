Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB8EEA3F00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d/cFKA/vHONwGYm1eYXKmqTtAs5FXpy1bdrgoO/Zug=; b=XMOURhTcktj15rRlH2K8+AvWbY
	qrmfLC40GSCcEUUaphbi7eY+zieYf5iMCmtttLLMis4bPzULybS/Ne5reT5Qea0a7EhTT+3qEXtIz
	ZbmwcBn1q+um0jjGg4GF/qag0lG0LYJbeXTK8CBSJtartrXGw72Sw/UrrNxBfsRb6fDut/yy/kuj3
	GIbU/VcwBU5/23vtmmVW4JEwRkdhbTOvfcQ2T+EwyC+iJmWMhrX9JW0WeQ91qwkeidjQNizYioiFw
	MqpNxKGJ828NZ2tJ157zEVTa17C+MD1y++GLvI1NjmMx8g/4r+wp67YS64fj58PXM6+xnkNETqiKM
	zf2xxykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgCz-0000000GSsH-0uje;
	Tue, 10 Feb 2026 05:22:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgCw-0000000GSqt-49iN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:22:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a929245b6aso32584165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770700962; x=1771305762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d/cFKA/vHONwGYm1eYXKmqTtAs5FXpy1bdrgoO/Zug=;
        b=V8lm5uZADh/xxeNs0cMM4UoLrrUeCST/hpvXY0HDGHLQiP+wTNxDk85cz5ik3XWXhB
         3OXz9VN3JfERFqWYTkybp+5GgjHVjx1WSMPT5eWp2ZksCn/dk4KGsvnhdOB4osEwDnXd
         5Kxs11LleOXOmAsYjh8okYuAlty45x/DrHs9TehHeSOkKH4z6cy/YI2yb50v6p8w7ZkU
         JmU2sp5oPyU/JtixAW6eCrwSgMTAhKIxvbkUCZRJbCbnW0NQ/N32VS4vGE1Im70AJxI7
         t5u5jOxXl64zNk1lE3QDYPWaN8j3za6wTHGKS9ALmeVg1ZQFpbTwhvAjVidrYmVRRLru
         5sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770700962; x=1771305762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3d/cFKA/vHONwGYm1eYXKmqTtAs5FXpy1bdrgoO/Zug=;
        b=lhhKeGhpWL0BBXLV5AwyJtIT2GD+dd6GnAA1X8AaDbAcooFUnvYyVHHHplOWjGUsVW
         pvToWlHSoA9DS43/rGGYs2fPiHRvyx+EpouQDXJYyd7UjY8aGx15U1y9aniBtvNWXrm1
         YboHyib5fv285sYXd2eltBbA0ibbA4gnb2zbwb5PtOp/FCitD9IP6I4+LdBz6a7Xgmhl
         t5vYL3aPgcivbUjcAdq3Y4C9TFwT5ook2xSAI1hq5oyLnqsbVVQXi9Zk1V00e1x+BGy0
         Y39OQSl9ibnq9Dy0alFLG81PnUf6ouAgeUG0fbOvTRRpwy+f4Y2uQ74IC2Io2nd5sLQ/
         HqBg==
X-Forwarded-Encrypted: i=1; AJvYcCXzu1CgZsD/ywD3syMC6S8dGporJy65my5X+Qwf6aU90RHtfiZ0N1f3de7Xa49gcZiM3ax0uq2y6uOMpkniIBE1@lists.infradead.org
X-Gm-Message-State: AOJu0YwIVJebUVEbnO8wnHC/tmK61GZb0kq3yMs6nSOythYMHKzDIAnS
	pm+ttzPNnh9Mc9/DSrEfaXrGnRBYNjAVxAXnxAskfbb8z36ge17t767T
X-Gm-Gg: AZuq6aJBYFwJkGHcy61I0Nd5Yt946ikwdEJaxQ2nJiryRrzFohkXWrnLJlENUYRlhkU
	rse6Y1w6f8OAxZLvEyhZKLJrlCp6/2amp/kIjR/uN+FVXe3gyYS053UnTtD7pZAQ2Pyb6+BbFmR
	N0g7+fVEgezWinB8t7jef/2871Zf3VQ8SxPgffDCUWiAuICVDod1BRuIznff0hfNKUBlyc4Uptm
	yG9Ba65Jq60Nb8GVZ1rPFB0YHH4F9qrvPlGWD7ku2yUJoYlnwmyK1jA5PrDoAYfZxmt1+HbD/hI
	N+JDkFkW2YxzYp1iVJRdwu763vNVs3tILJNaWL4g4nuzawRNjP74loCnOi9dYPCuYrNQeIr9eAC
	UQ41SIKKXx8scoMk7NT2TvLza6IpSfM9OSzwgGBibXhSiI+bOIwF1f8SXbkid2jGRB3kJeyA6Rz
	qUqsL7lOB5jf3Z/b9F5sO0MsIF8yNlvaGj1kGZ/QWdWqxMC6imw/a/YcnbOExP27GGFaSekRdGX
	ITkkXt4NJnn
X-Received: by 2002:a17:903:15c8:b0:2aa:e21e:bfc0 with SMTP id d9443c01a7336-2aae21ec7e4mr68077905ad.47.1770700961945;
        Mon, 09 Feb 2026 21:22:41 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951ca59f4sm122114275ad.43.2026.02.09.21.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:22:41 -0800 (PST)
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
Subject: [PATCH net-next v12 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Tue, 10 Feb 2026 13:22:24 +0800
Message-ID: <20260210052226.3005666-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210052226.3005666-1-a0987203069@gmail.com>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_212243_031446_EEB00635 
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
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 133 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..4d9e06f2dc26
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,133 @@
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
+      - enum:
+          - snps,dwmac-3.70a
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


