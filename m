Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0238F30275
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=; b=4xRQ7xcTEWM93tfCS6lZCxOKw2
	zjtpccYzqFqBAhfx89KvOgSt3TH9lE6bMFmLWrsDTIucATmIis7A0eh6x7xqB75EkFIpZzR6avZ8p
	z2BVh9IZzi6ZFZq5/H4PzLzCER4yJn4rQn9Wkai0Nyk/A0L1adkwFptNzqioMFZLuo5qcR8khRdK0
	gIKOj7A9qKbTG7lyRVgzTzKrTBTG9SXtMVZ1UyHbYCPvdSRRF8sQ9ZmDYUXScELoDQtVQ447YK2jK
	bOJ0dVoJ9flOvwipYYKeaYXHmKEIAPGHA9EbvWDO92hR0fpNOM64e8cGH2FSVZBF8DPec5gN50+yx
	VUs+/cRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKU-000000033rA-0y2X;
	Mon, 16 Mar 2026 01:01:10 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKP-000000033pL-2tFH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:01:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82a07738118so2276328b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 18:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622865; x=1774227665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=hYThHjyQxvcIcDWvpbdxfHCnd7E6vNd1Rdv0JP/V8Bp8IsAd1KiNwgvOVtYJ3Dagpy
         MqWx4jZ58VZtzOFt7fsWHoaDgqN8A9zHKfFgoQRQknt72n4twvIK300yumM3oUGg9Bqr
         qHBNnHZDfc8/j9Y/vI8FFdDvrl+U7gVh/Su3djZ2bPf7rlFZLprZkluYMi7jyLwFv2Mk
         fsKsezES0mgQVcv4J47VN+Qqi+wUH43O+J6zGiRItV3RtHVZgWNVrf4fm8Rhut9W+Dfi
         rXX8947V7xwpuntMUz9Xj1orpUAZTgXZcCnvRWGxhNkxa6x3cgcwpdY6Ys6ccrMrNrdo
         UXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622865; x=1774227665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=dLmDUkUq9SBPHuOXerumC42ctiAkuESl7dwowxr6lMTKqeNbY5hfQelj3tMO70k7KS
         xGoO/tPIvfqV2sWE86PAdw0F0dgZfJSmpg1L6IqwiUpMgBn8RtZAxu4sYdrZo3pEEKv+
         /2b+msIYQzm/SzDIFwGmBt9VUVNV2XTM4WufNOC9sqT5dqih/Xr7tlcYfN5viKtvjlds
         o64cHuK6DkuW3p6kVtkMegVNf0xAap/UuR5QcRtFnWztaSBjL3+nI5IuUg/GqmyiN6m+
         XfEHD/g2wv2DO7/04Nwrd+0VDnp6GSMrtuei3mNzb6mUm1VFn8Df/yFnULIRxd3RY5Dq
         2i7A==
X-Forwarded-Encrypted: i=1; AJvYcCWmytdEnF+Tspm7wkWZqc//XXl5BgA3JTDrHoSPE3/ZkYr6M7o+v1Bvhcaz6Y4atYq8ejgThY1hUD3J+WuVMWOS@lists.infradead.org
X-Gm-Message-State: AOJu0YwtsgKc+5B+9BL/NKz8U0K0dPLy4KoHvpCCQIQ7nb1aGK7OwW6P
	DRZLRfp+zAkiOT2e/7hKcVGQE7frxeHBdPp8AmBGolm0MVLTvP8SYoiK
X-Gm-Gg: ATEYQzxsO1y3Cxx0yFzZvU2f+Nm23NIpS3TdHFXSo/RUc8JpoU8j0r2i6IrxqxyaHyM
	2EwK3T7KEkwacNQV/9zYjzMEVbJ88m7Vm3SOTx33riep/ay89SR8NEUU7SPZ3OZ3AE2VlC+TzQF
	EM5CfCFUXk6SeCckDBmYjImJbsNd6CyYk0biPg9FUgPY2ye0frjaGz5DnEF4k3LJw3gMpeq6txm
	1IjmPTCroEGIsIJk0E6PXDuFhtSFXDhjs45S4PJ3R/PJp8EoUjoFjR9pw7hyP2r0NDyCUw69UN4
	PxC8gjpNXJMtwwHVJ7uMzgFEqrG2qZg0EW2yMrKo6eVnvWcyJ2jhJ7/Ig8l1vfxMwFjIuehMJos
	Mc0DGpjSEJ+HyWe9WcBC0S/xUuCtCoYoZTu8teTyYFlhYPncss0U5v4WuYCyW3o4vK0N+RLt2Jc
	swYJKQZQeRfwANdRVKO1qzLRGJSI/6dOg1Kw==
X-Received: by 2002:a05:6a00:1251:b0:824:3670:66b1 with SMTP id d2e1a72fcca58-82a1971ecffmr10178945b3a.28.1773622864545;
        Sun, 15 Mar 2026 18:01:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072414f8sm11598232b3a.4.2026.03.15.18.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:04 -0700 (PDT)
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
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
Subject: [PATCH net-next v10 1/4] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Mon, 16 Mar 2026 09:00:37 +0800
Message-ID: <20260316010041.164360-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_180105_788889_92E028C4 
X-CRM114-Status: GOOD (  15.28  )
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


