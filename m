Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB8FC44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJLNhxpUuunLpKkwMWOBq42/DhYih3hY7Y23pMOtVm4=; b=H3IaxEJaneh8i6fv/9xvWB44yi
	fPAoVI3YqqHZdkUHoZp3QVUaBIkO0Ee1RgNznE3ciBiRuVwZVgK/+l11RpQAqz6edGAm9NoJ8EzOX
	bIfYXU2W+QOd40/VBPtuyO1lFroUhLeDoQCC5IAO3b8Ds/rpdwe68YUptsoJPmV0vmJ6xIHqZ2Gpk
	1k5WayVTy/BJ86X6KwB+NzVd1c5l7DybpGUTPRVzVrYB3Jqotv7o/uDs8Hi7psV7eR17PkfO/XGXh
	58xFMKSecFXa9fAwIHoYuEJ8V6pdw89s/C3SDuN2qx24mDD+V8z8apUqFpwMSpmVwV5vnHAhpjNwE
	Xh+oA4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTvE-000000057O7-3Ng5;
	Wed, 21 Jan 2026 08:50:40 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTvC-000000057NU-06x2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:50:39 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso4138056241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768985436; x=1769590236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJLNhxpUuunLpKkwMWOBq42/DhYih3hY7Y23pMOtVm4=;
        b=BboCyW2DkHrakowLJZAmvM8209ztrV3rvuCDrHT6CGmw9AQndv5t2K4ybDJ7P/lUoo
         X2HlpBt0yqcw8dt+PYksQWALjMpNqkM6LrJAmJWBiduDJFfT/mJJ43FGgbPMhjYsljRM
         h5qqWhg3sGierejcDGyABcSU5BMhErwc6H0n1ZFFV6GEee3171RyoCBKT1GSA9WezBca
         w116kMPfNMbzpy9BQrbOKQWRkyj9JfOSSgfC9eQ7XcM+7DGnE2PS5Q82cvTg8TQWRbL6
         SBSFHK8gjHefuoox+ctEd9ed65widKlJe0wY8LmZMGsC21C1G77Cy29XQBCopngtql8i
         Pn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985436; x=1769590236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJLNhxpUuunLpKkwMWOBq42/DhYih3hY7Y23pMOtVm4=;
        b=O2KJKSP8J3N9Q8TyyPNknz3F+ro/8LOClX7o5NzytPqYRdIedZoNYYoJo2J12BRdMo
         vdr1uIkoGD4e9T686qp9Y7Qv5x7nrw7ZtaTmqAbK1m4qe3Ju1vOsotT5HfzHIiVfxn0R
         bVWH9FkifkpJUrPyrQH0gF+92uQXgqFLZ5tKovPNXxrnhXcjhdDb3n0urSlZuzfSXw5I
         P65qJbx2bkL1yYBppsY08V0YuNIfeXvAiMPmB9/6Jba3vtY4x3/ZOxdwNTUaESeAOSJy
         yRLLCs7EALENY3mBfQyO8AHLxSFQcuCdC1Ja+34ZBvFwaHiskYF0Gkm1d+O8c8uzwGnW
         FPBg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Yhc2VHgCRG8GmpzQ27GEBwKU2ewtkZ5FHbqzG5O9j7A2fpAtrRQB8IIMkoccYupnzleFpFOgZJeS2QDj+acN@lists.infradead.org
X-Gm-Message-State: AOJu0YwsVpWJGYXWkV3c0uOrBVUPyHyWdV/QPazW3EVCREXg13NMUlBG
	TkOSZ8/zD5UIgYt5tRl9IJfnuOyN8YdbZ5nqHcksxd4vvE+N3krMPAJfDbg+TvXY
X-Gm-Gg: AZuq6aJ2f95r9e+2Baj/8KFesYHcLI1r3ukIsbqeYtHS9BFzKgAyl77lSMzhRqp3tpS
	aUVZuJc01cC5/+qGdT106GsIkdoXYi3qjl/+lL7KvGvlNTjQ2r3PkIavDC8BPHNhtJj5lTx+DAX
	0OOf/+EBOz50LF1tV8Jo8ipB9a1BCwLVT6Wh9SwXehkj87TaMcd/LV3uRpDxoY3qJpait4JoNa6
	LmGVlZMlvaCC6YsmC0JZpjbDly6CZPuskVcH/Qe/eB89dvn3oaRBH3jsVKRqtCs3dtdRsxLfHyP
	pK8O2Rr1Rlr7G9RDEjYovoxH/4dQpr93ubTpvNdu6YEUaxHty4uQcI0pn7MOOehtKoSRCzjwnhR
	X1GPQPPqhTCjm7ToBxV/oONH3n61/VaUl5tz/TUFZ3WsqEpIA0hYpYNBHyzriFy+j+ZnRiOXBSe
	ozrhkS7jR0nQ==
X-Received: by 2002:a05:7022:1e01:b0:11b:d6f2:a6d6 with SMTP id a92af1059eb24-1244b36efefmr13558965c88.34.1768979613029;
        Tue, 20 Jan 2026 23:13:33 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefac48sm21239676c88.11.2026.01.20.23.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:32 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v2 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Wed, 21 Jan 2026 15:13:09 +0800
Message-ID: <20260121071315.940130-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121071315.940130-1-inochiama@gmail.com>
References: <20260121071315.940130-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_005038_106116_F0C299CB 
X-CRM114-Status: GOOD (  17.07  )
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
 2 files changed, 106 insertions(+)
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
index 000000000000..e69f3b60c51f
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


