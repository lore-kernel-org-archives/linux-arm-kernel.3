Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD583EB3641
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=; b=x8fU8zuGGRAOsuDfwGdsAPcO+F
	fNCuzh2M58vNb0eZ7j0vipRhBNMwdXpSdXkLwi7loPck2WnNMs1QsHD1Y9eGZg0U3PF0Lp+8/xO9+
	6perLQzV+6GbHSTvPu6Sdwu5LO7QBYOjgILQGK2+edKb4D4v9s0+gRm490djF5qWk8new8IIFSxf3
	7XI0+IjY0gPLEb9EBlNYzvTZ1CFQ6cw3jQmmZOpoP9KhSl/2TI0gmJ00MfaJ2QDTFRvdaPxFCXEtt
	fQVAa0DqjaMFhtyfFgIfyYoKUsD++48nhjeN5fRqZsYS75n81lmTzVnHLRNN9uyrd4/j5oSZN8+b5
	wJ9H84WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEE-0000000EJ4h-1R6O;
	Tue, 03 Mar 2026 01:07:14 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEB-0000000EJ2w-38oj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 01:07:13 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so2678679a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 17:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500031; x=1773104831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=;
        b=iNrK24hiaOQdz8TeBypYT+WQRZSlSC2wTUpduEoQYiv4vOWWeSDoTqJykGd8d0b1FO
         d7XWaR+jQkVP7+XTY2Qhk6r7CECxFFBOGYQl2XMv91qsP5oStw8DUyvaH0T7xNECR4Ra
         sw9ur3WRLokpl+x2r/zM/SL5Rl9hfPCkEEpMXPcZrOz1vK6T/xndJwAk4v0904CqfKU/
         9IkKniRf9ndrfOqSNba2OKpEBiz2Hb84IHVf7sbV+ag/jPIRgkpkERM36Z1AaiuecW3d
         D+ixC0l8VjLXl43DRP5dBmhBisoTZwyWI1OmrMkgOSGUjWcuX9eBU1q4KPpUOxXaF/rN
         MN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500031; x=1773104831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=;
        b=PDeNsa8B8orwR4EvJ32TvOi89UxtNk60kNUOZpbNLUHHlaLcVxRF+kx9xlplUtjCcP
         OsAPkgnz+m693HIHVvlmchmurhlpXQB9dgZFa80vVq4d2qTiBkxt1b1MP8UMDVtNDUef
         PG9tTsNIvcphQnvglJQeoJYnFiqFdDkgfoy1I8nKagCkB9cJ5S1ZQnVVNv1PGE8LxGLO
         8vk3umY2ScUDrNrvE9L79P9j0Kn3le7K6ZL2jtTDJ706SDNRfUm2kSm02s6BI4pJXrmj
         oKusLQXCpTHWhnQTjh353ZM/PSt95e5FJ1HQLda1RoS0sLrC3stv9g7Mkdnf4mDv2nIg
         Mc/g==
X-Forwarded-Encrypted: i=1; AJvYcCVQDs1LEjhdmAQk9gQKpyft0Rz8AT3LYAAEL5WPneN1VDoYGtCuLTtBjy9Hg8yxkqkSKyk89eiyEYv8FPKyGzu+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9hgADnBvl58CzwBZ1bDfX3ZwqO4W1+PYnJInZzRRPv4LIfF2T
	tvNG5gmRdyZcepwMBj7A+dgR9mO+Xl1E1YwirUCHijFSgyw93TdyWubX
X-Gm-Gg: ATEYQzy5WbSptwt8ojoi/r9janNbu65jBpUjP0IuMNH7Cm01xdB0Lv1NC+ETQuq5Ddo
	ylv+tV1VmOjLfuOSC2lOXxY0kT75EM7bqTsp1gH+k1SZclKo3xeqYJD47PeGkfj8ZbPhFvvVVam
	UEjzcaHC/6fPckAhr82t5Gk+jrJgaJZo2gTnPHvV8hxH69Vdq+qnRAz0S5kLGDAYC4Cpx9tJE2N
	Tn6wYqXN4UkEkurEjRqoP5NRPdHIEWQjGkm3ecbqJ0bZQzzDei1DuLm3vthxmYKNALu9GWLaHsM
	QkcZedIn2NQKCBawbYmhNqdTIHczFNenv+x7vJIEM/jGZyNnkBgnj6IIfGG1SETilkVplo7S44B
	jufi7VMe6DI6qsgRnijYfuJBelcR1aBxrCkcfabDFfrKtQdS8qU+9q1Mz9WGY6Tw2XVtd2zWNSa
	Pig1KpyFbM6Q0TXBuud4juqw==
X-Received: by 2002:a17:90b:5282:b0:355:35b0:8b83 with SMTP id 98e67ed59e1d1-35965d02c06mr14789519a91.33.1772500030814;
        Mon, 02 Mar 2026 17:07:10 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c07d40dsm403270a91.2.2026.03.02.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:10 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v6 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Tue,  3 Mar 2026 09:06:27 +0800
Message-ID: <20260303010630.567674-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303010630.567674-1-inochiama@gmail.com>
References: <20260303010630.567674-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170711_812306_7A2104C3 
X-CRM114-Status: GOOD (  16.36  )
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
 2 files changed, 105 insertions(+)
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
index 000000000000..274f446b5e5e
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
+
-- 
2.53.0


