Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4679DD35696
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEOFkSi2N0vtkbtCff5kn8mqsv72spWR8lTmAsEOTX4=; b=G477aWstz0HI8qdFcZWBm4A8vQ
	IjPPCwC7WPnAhJ3JFCghruQh4GSwcOR6jWpTxtub6JPXM902p+nMlWE/H57da4PASpu1hEEPL1y2f
	N+PmKDRj1ZFSLNy1S24PNe+8Q5yvuBb/m226nK2SMG2NOVG3xPAHjusA8eiIBn9A4v9rLo6cXp6Pm
	uGwdyvLHCg17zppRnLoZ6XWnIYjzV1tky+RInSe6qItD81ZE98fPtNv6suKRWrFCZmax+l++J3r4e
	FcWUJDHIMmtnAe6AIaduv9GXn3JpyEnJMCSsMa3DwAb6DjZKbCfwVmK7TyFvNWdZu0dhoXWHTITN+
	lKGWguyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Yt-0000000FigI-06nz;
	Wed, 28 Jan 2026 09:10:07 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1Yp-0000000Fifw-2hZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:10:05 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-11f1fb91996so13730612c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769591402; x=1770196202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEOFkSi2N0vtkbtCff5kn8mqsv72spWR8lTmAsEOTX4=;
        b=iZJYNFmpSNZqk4WAeXaWfmqdjGReScGdkoPo901gnCCggWXkEzAW0aTkY+EyXsTuU3
         +Ipifrc69fwypOOP3lKbjcGgEGSo6N+kb9ssEoojhGPHZOPGT89Nj9uG1NPXr7GIx0et
         /xZw2XzJjNz90Q/m4tjaCDce2MzO3BGTlV4OMi6vFBJ/4rsKQCyb/CAHvogNMv5McudP
         kHFQuNt3B+KLm/y/WMvRcnDxcNl8UTHFWlkBN+gFTwRR1xZLoEDMkJCZ0kO2RAiahBvU
         eQoSBo1rwkzV6v4EkrwvKcoJ9OVY/Aw90CA8q8TjXTOLckHdZnTzk3cDiKwrvDougXqZ
         xHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591402; x=1770196202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yEOFkSi2N0vtkbtCff5kn8mqsv72spWR8lTmAsEOTX4=;
        b=JHJvGiQP2TgHJM2vk323M+SYXWmjB3EyojG5ZVmFm79PXEHuGE5xo6DyBts6z1Dvhl
         Nc74lIPYUbqcE6Dz6hSnBOklntcR5+PjZND/UYssRxbbjwpCEAYJC25sUZpmBWEu489x
         w1OS31hgZUg4ArwWlivKSm9EBX6m+ZqLSv4aFzK0DSAVREeeM0ahCl92zju6Xkp0ih2m
         sYPCMwe/XGUF3vU4NrVIp9SxfgZ5JXa0IpvsZHjfhF39FnZ/cg/9hxVckdnowXip0wuP
         DY61dKuwfBd9XqFvq4qF98rO7vDMkDcRHs8EQ6StPtE1g6UlyW+iugHzy/VG0GoZZjOe
         b8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXjfpmUC0h9CsU/iY/hebc1hmmeZfJnsjmuCwJiP0D/ZlEDCr3CGo32AUlo9ozfbpupmGov+9JiBJqH+WBS9nPN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5xjipcIgwmpOxwhL5qmL3AQMS2jn2hnMVucTRzL6z5BedZVoS
	9hjSoixTnvwARGorakW009ok7e/PQB1B7oohr1FKIR/+aLTxdlZBwpjB
X-Gm-Gg: AZuq6aIebH4uc8VDQrmJkYl45n6cxxoHlimAqiPY+prPR+yD5+VSJxxg19o/Nxe+Ea+
	l9mVcLCW8jOJGK0jxE2fwm2OHlkbhKjVWfVUXf6q0G3tmzRR0jXBDBokir8wqPNrU+dxkbXpV8j
	jYz47fsIgWiT76js+UMS8pAVvjo8NgBHyBcE7mo29zwiBXWyczyvcUSrmK7tdA0GvfWudlkXgrI
	mLWrhHeej0+DHF8k0FczKqF+ozLZrQesO0OrvuJf5EZcluPBlRpqBR+SMp1AjeVXIoOJWaQAhIt
	znlRLGaUAc8rejKNXSoveeip4tWOzRBDwq3epXv+FTifJ0fqaf6xACaCaMLHar8CzQnJvQVPs8D
	LLkbAYCLpwlAkhfSVxKcNMFy7FVhhQ81oSdHNRWrjONDcti1eVeYEFLpf8WdUkCcBWyi+eHzGPY
	1KJVJESYc9gg==
X-Received: by 2002:a05:7300:a188:b0:2a4:3594:d540 with SMTP id 5a478bee46e88-2b78d90178cmr2919827eec.13.1769585396662;
        Tue, 27 Jan 2026 23:29:56 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm1515483eec.13.2026.01.27.23.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:29:56 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Wed, 28 Jan 2026 15:29:27 +0800
Message-ID: <20260128072931.875041-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128072931.875041-1-inochiama@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_011004_047078_D3C98024 
X-CRM114-Status: GOOD (  16.14  )
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

The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
MAC (version 5.40a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..a3fcb9a251fa 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -34,6 +34,7 @@ select:
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
+          - snps,dwmac-5.40a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -653,6 +654,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..fc024a927fcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: spacemit,k3-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: spacemit,k3-dwmac
+      - const: snps,dwmac-5.40a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: MAC interrupt
+      - description: MAC wake interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node which control the glue register
+          - description: offset of the control register
+          - description: offset of the dline register
+    description:
+      A phandle to syscon with offset to control registers for this MAC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+  - spacemit,apmu
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@cac80000 {
+      compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+      reg = <0xcac80000 0x2000>;
+      clocks = <&syscon_apmu 66>, <&syscon_apmu 68>,
+               <&syscon_apmu 69>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupts = <131 IRQ_TYPE_LEVEL_HIGH>, <276 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq", "eth_wake_irq";
+      phy-mode = "rgmii-id";
+      phy-handle = <&phy0>;
+      resets = <&syscon_apmu 67>;
+      reset-names = "stmmaceth";
+      spacemit,apmu = <&syscon_apmu 0x384 0x38c>;
+    };
+
-- 
2.52.0


