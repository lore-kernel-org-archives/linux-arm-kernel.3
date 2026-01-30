Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30DAD73EB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 04:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+T2Zlo06xiXQn/gacLojfwLwZ7jz+x2wxOefgL6ljo=; b=EsEE5GpGxtoL7XOmBVLDg7uNko
	Rjfe6gkWiIhWpcNPKQzo7slCJHMczedgSkTupX091uOlSIonoc+DmsagAAz5kKhFaG2F5eLLeq4A4
	Iddb9i+QRYWwUdVe/pMfBo/paFlOJ+3RZ4aFpRxMRLPd9DaFACvuEQdYvOWDItOKZsr3gHsNvssdM
	oUbvtf6Rh0NBcn6oQqlqnrUU3Ryf55LFuu7AQw+THYAePNoJstxlWB/eSGck9yI1U3psdbWkL43bH
	m2JxkKgEPjhL5eBduzTAOgwhhuEP/FhFRlNfWBaW1FXyYkPSEAw6ThJcAXLDhbcfwoAujs8By4ZVf
	RVTCQtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlfu8-00000000zm6-2cKL;
	Fri, 30 Jan 2026 04:14:44 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlfu6-00000000zlm-08zu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 04:14:43 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8c7146b0854so186664385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 20:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769746481; x=1770351281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+T2Zlo06xiXQn/gacLojfwLwZ7jz+x2wxOefgL6ljo=;
        b=FdNXr7nZqFE7XMv+6zwTrc3i1Fa5yVE3qRy+7RAlKNRq1F9Ko/DpLSIFeaP/aV9RXt
         mAButIDAPlfEoqVifSSDdgC1PkXfLKxiIwyDxhyr2Whu2QXlnAAHi53qB9wFI9+HvNmz
         YFMf18GpB/dYQfbYUCBKo2mLUe/NoKGjO44VcO5A7Zva2c7MJOJI+DKBIUAD6GBBjMQk
         16pM92L3sDRE+3Mr20L+WWzF+Kn1dNMHq5mwmnKte4LPqSQpDW+97klEPleRj7o96laj
         YHgKZ2H778X0CsBGhi/nfHYNaz3jXN0K+vKcUW8IcAkQT5izNXQt3AtKL34OPzBhCe+D
         MM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769746481; x=1770351281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H+T2Zlo06xiXQn/gacLojfwLwZ7jz+x2wxOefgL6ljo=;
        b=t0cPZLTppiWm1D4Bblep55HO6xdkS42AZ2zdlvfFrdqL9Abw7KVYoPL5xOyj1LLZHG
         olyKLB0MPT85XrABSQwWzIuMe5EH/3vkPavwgtoWm7pNY5nzHa/v+I3ACgK11ChMtHmM
         UccG7TZTwT1nXmyZHmfTgdI7b6hjGzIfRLtQfuOKVSz2WC1GhsVx2VIvCzVLW6VzzS2J
         LWiWWJVmnDeeLtplfQtGY9emet8N3kfk63Y2LTAk/w5btc6GShEG/9Eux+FDtvKM1z3T
         QxY6jLwQ2JtWFz5D0Kiu4IwLADaY1/nfyC9s1XWTxdhAneG3EZwKZQq1Pa3aIVtW3lNF
         gehA==
X-Forwarded-Encrypted: i=1; AJvYcCWgewiwOt2F5s0qeF181COOOxnDV/yzpDRVK2mnLp6PURCiu/mtROB/t/Vapfq6pWpTJUmusIF0TROfFPjAgil2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3YQRWm91RM8fMDYTctyH4KrFkk9tkycyTkBhJpRIZi4pdSmlo
	tol6Imo5Z5Yt5N7zhilopdGgujPOyEadwfOB0Tr49VQEKTIhQv1B1Y25o6fbpYfQ
X-Gm-Gg: AZuq6aLUOCs6s89l+QRJ3VDkRQpsiunDHijcIup0XtnlzRBe1YwEJY+UqKD01kf7TEg
	RqbnMCzMGKMD2gtehUbqcXH7r7/qi1p6nNmmwYXXhGbMaK4ovYWP6dUIwJkzHOGDuvIUNvA3MMl
	jDzyD3llJIuXqN5z284olFVdL3sQkebZyPvnnonnjC/H1ooJP64dDenPwkcCqSOOsdgQuvic1Qp
	cmlaMma2S36Zp8E3d+9Hhc1B3Eq0NE4/K7D3KLicE7A/xN0obVZKtSoMTn0fVa/WK2S6DAVhIkl
	8aVgQSHTQDg2FYQTUqALfyYhiYaveafF/wAFdNNfIHjJx+IF6zwJZhLLAP5tUE3i/iaUlkNKaxY
	jIWjo1QMzj6rswGbjX6RqOD4jUpStJiqoHnt9LlndKNv+/I63OA3wXZn29NqdBdAjvqsj/z0R1e
	7vLdj4e1VX+uY8LAxARuod
X-Received: by 2002:a05:693c:2b08:b0:2b0:5834:44d2 with SMTP id 5a478bee46e88-2b7c894932cmr655603eec.39.1769740049721;
        Thu, 29 Jan 2026 18:27:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7bb9ca10csm4119874eec.30.2026.01.29.18.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:29 -0800 (PST)
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
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
Subject: [PATCH net-next v4 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Fri, 30 Jan 2026 10:27:02 +0800
Message-ID: <20260130022705.1059214-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_201442_076988_DBA80E69 
X-CRM114-Status: GOOD (  15.86  )
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
index dd3c72e8363e..faa598c19bf7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -108,6 +108,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
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


