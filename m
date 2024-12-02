Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25EBD49794
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 02:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GG94va8ypf99d2NskGYXMHjsD3eWiwiqY5c/5WU2nZg=; b=rd4GwieRO/my1tIJDKIoTVY0lc
	Ghahan+v3YVF1GNgaGHNXKZa8RPNwBsbns7oRJKxG6uYigNrJ0/+wDdJt12Uf1bfrEt7BH71ConpP
	xCF++PtyuOWQBRc3CeLLwFPWDJEZQJhUE2j9d5HlbQuER3MdC0xCWr9PSNpef3QGpPSY4pQKdDoIK
	ObiFirbQo5+sXIv9xMEBt6c/OjHdInum+onKM25DeLk81GRB+BsnUtqNNYplSXu6fmlxYgTU/kfCk
	Ai9TKyURobpp2nVcOPpKWvsSibR8nikBDde4nEzQkJVG2nqSekXz7Kdn/VUu3SOyIiQx55ke9152c
	8kYUKtIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwL5-00000004pEr-1m4F;
	Mon, 02 Dec 2024 02:39:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwJD-00000004p0g-08DK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 02:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GG94va8ypf99d2NskGYXMHjsD3eWiwiqY5c/5WU2nZg=; b=m2fQh5NpRb0guAh9s+/hjjvy53
	mxz9/VvvdjM3s+yW19fTDkTlBFL8JCxCZyurqVfhDeN+5a6AGC0ahtnutsrH6jf0MFd52F5uM07wr
	msEEG08ho4DKAb/S3lbK1Mk1BEETydZgp1QnbE1HYBIKhsU3I6+8dp2kWOoEN9ntp7MyS9swVrjFa
	TpLkYn/xqNJ4IkcrmDN5YFDYLrSxNaEVO0fUhv3FQSeIAUdFylcozSYHL6h++Ss3EmDysdE7gbMZV
	mi052NGkDa0eHhCRYuNuu6P2UVXnYStuTL7FbIuwosRgvuUKbY2CsE6ebpIBRy4HjWy9Aj6PtNK/j
	+kaoL0wQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwJ9-00000002647-1Ypl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 02:37:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-215770613dbso5425695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 18:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733107025; x=1733711825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG94va8ypf99d2NskGYXMHjsD3eWiwiqY5c/5WU2nZg=;
        b=XjQtph+BjgQA3anv7T4/ZpTInguexkWrH/2Fo7Mxl9S0xPlUAD0GEjMkLuW/CXq7lM
         Yx4QsvzmqPjU8zeMKB9E/4szKcSOVKxfxbGfb19uJJMyIcE5rTTzsetk/m+TNXCjGcWM
         6BAuHQMMk+B6cUaS29xPWdOM9vnU8CDHbTh3LvlPBtoYNMUnKcB21oLe8vDmajRg+eSY
         Q21GKpj+3iNBRiaHFIk20CHcc8cobNSD+82lLhnXQBq9ZD7FxYN0GmrBQWn/bV1q1IWn
         H5w5kFwqpyTzDNhcszNdBG6MOlVHiSffD17dfwjhtJE6B+Kx03pWAUYJATVg25+BIwY6
         yFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733107025; x=1733711825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG94va8ypf99d2NskGYXMHjsD3eWiwiqY5c/5WU2nZg=;
        b=KiqesszE7ml+7VSsBKB61/4hoprNoghZp+w9jl+aQXdnzgU7zuIFSwg9vsX6EextH8
         MDP1H52BIffW7pgfTp7pGBD9q82De2zjq+SxeOit7PZGqJKDLAK4iNWjXSkhFN3QHLkE
         7l1j/g2Ci2WKxMZmFJphS4HvMmaLNwNLXHhIJSON08DSq8Zqtvf2glsXlrl/y2TYwL4b
         LfgzKatfqZGY4LyHwF+of5UggmRWoLsNhn9YDoWpPxd6Dh7SjLEAFqcVuvJkiTVuQUzn
         rHFvv9ckjmrfcukrsbEH5S9eB8FJrw9KvR5iIIWdmYwybcyLrKJrA5HT13uWDET8SyT3
         5mpw==
X-Forwarded-Encrypted: i=1; AJvYcCUgsVD0a+JE6Zuin/XZgX98IFspMpYRC4B+F4ZF6KVkASy0EpcMG0MTDBHJioW58S4kikW0eZMnhGRDMDBn1axj@lists.infradead.org
X-Gm-Message-State: AOJu0YzUEqnAzshlFU67M88QCeGcSNM6/tAHNUZDUjN3ny3OLJBUV5nX
	x9FVTm7YUOtlyXg3UsAOCYb8m+HLQAj+Nfxy78Kxx7btUIKazBOt
X-Gm-Gg: ASbGncs2bOymMF7TlVSe+yU/Lyf5k02GqNusCrykTSvS63AkX1f2BRd34aTUEWRN/Iw
	0UW0O6lDzjriQ7K1Wf3lTiwKxgqZL0URiN8U9bLDJkE5cqUVUuJJ2OEAgZRK2/clB6zIIVZoPyj
	xBf264FsvMJLGsk2L07diDKwuBFC0itArd5jUwSyXlG5ZWvpvOxGqFMUtAVtwWmzVhrG11TXGH8
	2J3vJjl1/OaeNTgv4i/CEZ2Z4mIxhoa5edMH0jqHtNWkGUg+S3UjtN8Wy5Wb3TgL0l9Cq3cDLnH
	9b1i1GXs183v4yA=
X-Google-Smtp-Source: AGHT+IGyPeW7JXPciQ4EHmDYDKeuvpqZEgyqs8QENTRM0ZvMM7Orzqyw1FSYyWgIqIU42eiZfyWhgw==
X-Received: by 2002:a17:902:f60c:b0:215:8103:6339 with SMTP id d9443c01a7336-215810365demr56187415ad.41.1733107024763;
        Sun, 01 Dec 2024 18:37:04 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159ebee334sm2306375ad.67.2024.12.01.18.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 18:37:04 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon,  2 Dec 2024 10:36:41 +0800
Message-Id: <20241202023643.75010-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202023643.75010-1-a0987203069@gmail.com>
References: <20241202023643.75010-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_023708_130537_06620BD9 
X-CRM114-Status: GOOD (  15.01  )
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
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..e44abaf4da3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,134 @@
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


