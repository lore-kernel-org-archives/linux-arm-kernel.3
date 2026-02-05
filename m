Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE358EA7951
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 01:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=; b=gr8KSnEj7P8p9nQ6bSRrlHMYdv
	f26YnTV/xZ9Ocdj9ArPbPMbw0msi6LW410KBxCFLDrPEX/Vquqpa+FfJiIsl29UMOLRywkmRRff9H
	AK//Sd+zBhzS2R9C28uHgNJ1XXFhQsJWIfsnc3jHJKqLCjB0pm3UqmXEKM5dVfcRxn0cUksLoBNnW
	IvpgHufCc5+SOtjfIdg1pGV3/eeLND26wPGxcP2M8hRAl8kEK/rYbzEWDvB1BsqaIrbynKvWcWipL
	9Jc5V+bRf+jY2pGAnGuZYIbCc5kZCq/g79ePkkdBuO81h6oq+dxIsq/I1ZW5GMwRjtHNuaGRbFwaF
	Mm0liJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoLz-00000009Gzq-1VVA;
	Thu, 05 Feb 2026 01:40:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoLx-00000009Gyf-1CaN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 01:40:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-352c414bbbeso801744a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 17:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770255616; x=1770860416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
        b=ZmYJhgncNt4LysObIdi0twPrmZJPwd+R5Mpj1C1jzeJNI/0ZgOOrHIo0mAgsVuwKa9
         5Cat7LHULYU4bN/0sIqczUL55aHWX0MWBgPsxv2kzJeCpK12GI8X7BxAb1bcw35Ymsfc
         +VBgrSUCpmBi1ikgdB6G1ePM5fCN0m87Q9FC6aDE3KO6l/BT5GO9Q4eRgCYj3U0TS9mD
         uOEdMOUChRoNDl+vJqNExVuW4TH6fSHRyl2xFEPOF5LSsiidz6PaPJwC7HglIQ07mVFA
         Y8uT7pEd5Q+GftQWL+HgBMqNLRLmBZZ618p58x10djUlY61AqRoCFd5azG5ywVW1z4AQ
         ZfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770255616; x=1770860416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
        b=TKXLlKEu/QSDjsDd3jMmQ8t5sTV63o4QBWh+gxuCP3nAPQEKNjPFdR5mpa6Fy+ceR0
         tAqp0jlvyLKM+FXWXdcXIG2s/vfrOwBeCjQZTCEFwdGiZewYmFAs6YD1LXm7wtkzqaVn
         b5iUDSW3Nwa1x4fWFWF2N33LQpe4x5GuKR6HpwOPmGKlRVjjjqfpO8mZeD6L52nuKDUK
         6JW8ZVPjZ1+nhRpPp4PDDVBJdVBHF5VWBiH2IoSsNpzCQKadH26lXDCbHFPg1FNfWyeZ
         mwTux35tGwqY3CJlTLIT9TIGlx7ucglLVljd0F+ecfP7+nrjNrvpqj7xJwPpoNnPtYB9
         T3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW5qKBIdXP1SQ1/suKxngrZrmPe/Xhon5EBqOJYMc/Zw107Tw0tPuBWubUb2VlaczoORS9kHeGZ5ATrJNq+Zd3m@lists.infradead.org
X-Gm-Message-State: AOJu0YxUT0kC47h1ND05qB9pchT2AaCcJUnwZZmyXPbaXZr9fc1bhqov
	45A9WiYSMJQFxiN94G7NFUQuSgNlC+VpLSZSoFs3Iei4/ZwIMwgpOz81
X-Gm-Gg: AZuq6aIZ2TI+MK/kgePUa1OZfNB0uYxjrKhwQrDd3FnR6zzjObGZp2IO+KpKvUY6jKk
	jNgNTYbCjYCnHl/5J0NZQ162Qcq09JbOXVmLgHQCgTLkDRBHzMK6sVOWCcq8xybOk+J+3pZGC+r
	Yq1cLGgqrNeL65LMexAooht1FhpvrVCZ0Q/Wq8J2KmWPtXmKykFQ2Gw+2rbrgjzho/UxR3LfYyK
	AJw8cKZYGO/k/W8ZghW/O9uSh071O3qP4aJoQeA9VkzC/RgRgSoIff0KvT6iRrTK0PPh3QADOKq
	A/FmpE+jcnUzaIG5eYrCCIPWDcyQKaypnhbVNDhZ/2UpVZwaG7M8toI0GjxXxFsrBMH0wWReGmO
	KdOYTyoTvwoAAoZAZr9R9aWEJ8XVJFqdlG+sRz1aWV8NKHwZ1ecRA6NY/BYCcJvZnzObvXnq9fF
	/wY7exfWF8SEE+UyzohU452n9QgQjBk60NFepEE8gUyNeG4LDM0kT7VY0JKraXMbfV8ZdGtTxo
X-Received: by 2002:a17:90b:51c1:b0:340:b501:7b83 with SMTP id 98e67ed59e1d1-3549beb61d0mr1038013a91.10.1770255616232;
        Wed, 04 Feb 2026 17:40:16 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c487a7bsm673571a91.16.2026.02.04.17.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 17:40:15 -0800 (PST)
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
Subject: [PATCH net-next v11 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Thu,  5 Feb 2026 09:40:03 +0800
Message-ID: <20260205014006.735408-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205014006.735408-1-a0987203069@gmail.com>
References: <20260205014006.735408-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_174017_349703_5B0799D1 
X-CRM114-Status: GOOD (  15.46  )
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


