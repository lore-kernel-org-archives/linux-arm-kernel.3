Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0CDD2ECF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=; b=p0nUHA7mMfS8m+4W+uRa+Y3RZe
	UgVDDCjK7KUr8H8JKJF0PoJu25yIqIDvbq/V3XrxI1IFUubZkOEGiFhvGEq6XdrDsQLzK04/jJug4
	uNu6BqCq/nTbTalwcRh/LVDTky2biBxxzmgDbbIPtKPnriXKPrarsvF9AbGSGJ5WWmdh/K4ZpdUAZ
	wcYfDvMVlXd5wr6pEU4NgX2EocB8tg5FZmgWQlMON2PYLuykrkY/v2r9GN82PXjBZ3ZkrEXCVEnIp
	jP0jWNNL65Mne5D5SoQkw+1QOjmVKzCvJVVA2U/46ZekapoFTDUvEoZnSG+jmDx2o45PtnMxYVipD
	U+a4J/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5FO-00000003GrK-3a4o;
	Tue, 20 Jan 2026 06:29:53 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5FF-00000003Gp9-1Nia
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:42 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-93f5729f159so3207630241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 22:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890580; x=1769495380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=;
        b=FF7tot0iCWG5+VzmpSG570p58JcX6d8lB266j3vvLHujHDJZDwX7ySQjgqFYD2wAOH
         SNtRiFFzcgQTZAekNs+hSZ4yd7wpiCPWK00dNEwWPMR9yHXkzF5F9WWNM0oLJLW3IU3a
         oJiG8ZBa1ZkNDX9EMkK8uF/yF7qMLyAkJlGkvIu/AsbHeLZbIbabkLBo2Qny0u/YpQyV
         vHZ6ghgi7vTkRCy9Byd7VI/vwsiaazHpo0cv6D8FR1XJiFDVa3z7DoP2UhFc2kpqOqQd
         eASD/FwObQr4TBhgIm/ylqP0BuZkJos+2H3sZBRyIluFYY+vg6zSOZtmwWDWITCCnFHl
         DuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890580; x=1769495380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=;
        b=I6jT+2icxmRnWaMd0oZXidg1QqCSdGy2u3TBmuoJdDw7wL068zt+O1hMRPNWG0VDJn
         qJvx5mG3lg2VxqF6rn41PK2HJ6oP8YFPVuJFWFtBn1Q9uWYva2pty45JOCZ3Ag7N1PPZ
         mcKRRWLp0gsL4n6+Mm7gkpsTamHV0BuFz7x2HjKgpO/QudXDMIKeu/HYVn13DgA11nq/
         cT8OrkKyxZx4HpXAIKVKzLiAeXaFrtyggznC8kmd9JtCqNU2zW8j6IyM5b1jvWzhIxaW
         oR7H8qVRmVGe6eoxEPDNn9Mk0t2VjS5b0Uc1wzZpBSFSDsxWaXJ2XY63mY2eh1j+lN1z
         m7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWAuRKa+UiL05kVA5ICN/4RM57rLEygQdzuoeZsEqTqr3TODJtB/hjcPLPfZ1Hr3feLr+e5at1k6ziSw+eihibM@lists.infradead.org
X-Gm-Message-State: AOJu0YzOW7KOjN1pl2W91p355pgJibckmuOb8ZMDMjCOApEyjun8nMjy
	h8sonbUIFUnmCfuWPJegnWTrtUntzXz1aFwykhjZNFE5V9UhCPaVzXKX
X-Gm-Gg: AZuq6aIqDa1cjfQX1OIMTh9lutu4/IfXhVrXKxefYvNLTVDR8EwV6U85Q9q55owvOKM
	tY1zyjI5MerOFxFz+gl25eZfcjfCG2Mwul1HVBCiWyfd37XNrkq4yCRLL/FC3Kkl/3GrLwXpSDI
	WU7/y2boagYntghlVSvvWayWkgD//Uxfvf4kfB0gs4EcXFIfc8sM6RX4fdQ8rG9r6vfAjZbrV4v
	jLg1FJ/TY0ntddcawyrZ0kR5fjqtxCJ94IKFrNTiBehnYcGyjJXx3k9oIsEe31dZOuYY1ljqpnO
	DU0SKLHANwsJxV2+4ULVO9WNb4RjMtA1d+F57AzXOJoADtFJV5MyNKvfrtMoD7L0dOd+Db3drY1
	Gdzz1whfgyjJi8DiF3iYqwIw7pMzsd7Pih3A+x4aO9fPqDgV9oRImvG1ARiL1gr9V3fxq7YVe81
	u2rPaL/7SKTA==
X-Received: by 2002:a05:7300:6d1f:b0:2b0:4e86:8157 with SMTP id 5a478bee46e88-2b6b46eb100mr10720484eec.17.1768883786512;
        Mon, 19 Jan 2026 20:36:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15459859eec.9.2026.01.19.20.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:26 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Tue, 20 Jan 2026 12:36:06 +0800
Message-ID: <20260120043609.910302-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_222941_379693_B8C4D012 
X-CRM114-Status: GOOD (  16.48  )
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
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..3c2c6cb6b10b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -34,6 +34,7 @@ select:
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
+          - snps,dwmac-5.40a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -108,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -653,6 +655,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..58dd98f79e8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,107 @@
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
+    minItems: 3
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+      - description: PHY clock
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+      - const: phy
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
+
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
+    eth0: ethernet@cac80000 {
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


