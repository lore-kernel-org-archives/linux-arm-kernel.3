Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14BC103E2FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 01:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=; b=wSEIR98kbg9C2XBkstNhlLbZNc
	vMajfY4nlBG6rIjbv+avYWWvxTJ0khhZfIMpOT5ff7nnQ5ETj1/UD8ny823XHgZeKKMQsSlcSrTYn
	KYuFMoYA92eNtDLKE0QfoLo+u8Xqowk6fTcECODwSvOF9FOb86NGnEXGubSdBTPePjsfwiMIgdrPi
	+OaBvArfhC3usVzmpc2xe9KnslgmK8IcWD4nXNWwwUPlyvbHUjr+VwzwQBWXbHMI7ALsmdWFVNXY+
	UiPROPW4PuWrs38DsP2QDQJbyRtzay20cwVvHJ6zoHu4dbwGBmY9dmtXkkseXfF9k9gakNyM8ukGS
	wrUsd89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulp-0000000CzpY-1aYV;
	Thu, 12 Mar 2026 01:23:25 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulm-0000000Czni-1wUX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 01:23:24 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8cd81963e73so47281385a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 18:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278601; x=1773883401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=XbUnSxTv4AlaqYPa13P7/3rT+sNWc+Udu7msr61sV3NzizvhDx6dsL0Crci7qzgr/r
         xemGvwKimiJ/tcQX6nnHRpj4jBB7wnoLo32M7cyxBt8WPLmtNt4MavABVjPreqb7LOTs
         99iX8tp8sDdCFDPvpVZxkyv6c2qn1pOgY9P4Ho0ZXkQX+bTOAXJysJhrJWQM2zBbBcRW
         ZA/NylPj2q5/laWs97v4hmQHSrXtoFxQA9HumRDvn9WpSaLpRhaFaWsvPJOR25Vm1W2R
         S70/hxH2r2fjFyuQtioCnuMy/Z+r1bpjTvkdP9o+Yd2XkK7NVWBgG9l+nNHhs+xzeVYF
         C3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278601; x=1773883401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=IftwSRiwC/6DD9LBT/zoQ8bB4gXa7sL9/5ZUaq7rK60FYB5s/A3XtxkCJ67SM2bLoI
         aTvhggwXFJYBCFiZTQ4dkhkpTMuku0XOrZ2kzINWPC8vwE2Q+Y+sEuvIxNqfMCZz4sQn
         rDOSLBnxFiseooKeiz5MhcZoKlFZ86SNEQEX3fC9hG6hbB6Nr5PYG1dLzolwdhubQPye
         /iZ0IDaiHQ3aR39Opu1qGAaUYWhvJoKmqJA9jZ2q0kRBadwm6iHnMWIJTB9FKUbpuw3Q
         RisLpRPEyBjta+2ZNcXo9m8vdLecVoRB4ztPAzhDRjZGxrmI5CtDHl9hm56o8cN7XtBj
         nY4g==
X-Forwarded-Encrypted: i=1; AJvYcCWjNBs4jTD116LbrUgRssN4vwQzwyBtmxrVde+me0A86s7B3FzMKOb7jXuSY+cDMN1dRkBSyE6Px3D4nQ2plOEl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqk5wzEYZwJCFr754XwT0zf9HOwTagnK/lYVoFbdJuU7SBEEkD
	/wRVCDlLzGf39FdhDq5tise8vEuWkZeXXHvCn/ZsnjgTK0NGxtNgBzlN
X-Gm-Gg: ATEYQzxvz06T5NR+FbgQdRNhWRjOZ7+UtDzl6u9bhCPf0ME2c87jutbipvphz3hAqA0
	ZuA1Oofn7FXx2LCFMJV8t5ACCw6DlIepeehZ3So+cTVoaW21Sn26FNOTepYGkM5PVdj84kg54zN
	G60aJeOKRFSeAgb3bKkyInQ/ZCzHg+PPM1nFSUgO+RXS3355HunTkq1XT/K8wWw/Umr1cIuR9mz
	2GdPBxl49pGsjRlVFHCCGa5zogkXpnx1n6R/8v4nBzuRph7il+eBk4L/KEK0O4uuiBLngbBK5TM
	scCWflurMDDHubG9B24NYzUYssxXYgMuvVgAbrc40f/Kwj5pUfeRJKa9kFv0VYSb3BpDIi2iNCx
	LXWEPseWvdmplNMWt4SfXvvJIP1zR3Pd6NpYyVmnS0hEb3cxsqI/wyqtl+LZnAFqrenZx6Q9sVH
	khXdmeWxo2zNdccIjHJX+V7ZQ=
X-Received: by 2002:a05:620a:2a03:b0:8cd:90d5:91e with SMTP id af79cd13be357-8cda1a1b57fmr588445485a.50.1773278600886;
        Wed, 11 Mar 2026 18:23:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda214be7dsm241131785a.42.2026.03.11.18.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 1/4] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Thu, 12 Mar 2026 09:22:23 +0800
Message-ID: <20260312012232.373713-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182322_528410_871B0B7B 
X-CRM114-Status: GOOD (  15.63  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 38bc34dc4f09..98ebb6276bc6 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -109,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -656,6 +657,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..678eccf044f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,102 @@
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
+      - description: GMAC application clock
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
-- 
2.53.0


