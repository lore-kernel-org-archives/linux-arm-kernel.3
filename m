Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09E3FD530D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=; b=pqOEfK7Oh/jLazQI3SsZN3dlfo
	eJaPUemjUT5I8xgcwJRb3TMzgnULjnMLk+Tf7NP6R7NfWEu4azgn65XYQn6FF62MB1UAHXb3WffIU
	ZOp9EVLNiw80j1Km7F3as/AJmFBwmnkd8oAPpetv9g20NWgZTBw+gDhE4F0+ZuYWqTFeWPrVlNe09
	8qT3PDNmfSS8LYMPBbQAVYCFBHUJpKA+449fi4iI5sW5RSTk9w9+Wo0QgS2N1csVEEAcZ2iszIxjJ
	RhfflzqrJuewY0zRLNzb2uxjgFWcLLVZ6hwGALahD7JZctAjEt2DxEAoF0Szf7WKHq7rsM/FZiyRJ
	qDavgU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjS-00000007vS8-0QKd;
	Fri, 27 Feb 2026 07:57:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjO-00000007vPC-1IBt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:57:53 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82747396358so653810b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 23:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179069; x=1772783869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=;
        b=dbgVEhin6FyGxRxXLDMdelRhjeDTAi+sdJi5hAwf9jBhrNJYczrqV/f63RAbLAkMPD
         7K7zu0AVXscnun56xByfKOc3JpgzYY00aHa7VXrdUASfy4+vbGnt8Jeyt/L69bbxRgQ1
         dzHag8M1luI8uv33ulJI2xmxdt176/yUIbOt0oG6go5pDnkdB0KQ2bvPfeWvEc7B+AZG
         ktgtGZ2tTU5hBCff8iW7S41B6LmYd1+zCJ7PJVIk608GZh9lNhJimqQzx4Hlmng1GNzU
         iWybi2lTQwuPSeuxOqqzWmSTPqW9abvrabpsSlaQ+2GFgzRgwEwYvBGLZpwpAC475aNu
         cgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179069; x=1772783869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=;
        b=EFTDExJvRqO/rVZodnv/qjhsZW1+An3l8ySXHD2lUadgCwea+1cShecZAJ3Hv4djs9
         XYKTYwmh00C1yQPplixmkmIpMJroMlJPk01LiIIVDZ+X2EjAcm2Tx+2SGHJdpAFaJD8z
         zF2xhl0rMke6UkGxUIUSYB0DEfQtL+HEr51pPgukcCtZ+rij346regqvqRBE/kDRYRnQ
         eIwbaJFsXOTfx1lm61LXCxJU06dI5Fdwe4NUCgwpIQE1a56XQuq2QE+mViQkpmEOZAVY
         c+PcgmagPtCl3T/9W1MNgdQbr1lspZqJ4PFeSUG8pjccYEhbCLjOZBwN370RP+loTSYK
         f9Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX5k4U5VQm3Dk/EFylT5i2ElxbqDm3Ce+oKTDhirCnbF1jitgxLy2hAb0f612G9j0G4fJSz3ueNJ1XTHNjaL9KU@lists.infradead.org
X-Gm-Message-State: AOJu0YyMxMbIP/mxzuTq8pmFor356DS2qwJPqYLc2dbEOhvv6DMGxdyT
	/0V3iV+TgO01iKq+UOSZwfmh3dzVzmnwRPVx3VSdNJ5UkgP5GuYLnw1z
X-Gm-Gg: ATEYQzxZr3u5mb8Sl7XlBx7Iiwvo79UbH7eK/aDQk9yYUGxgzhcsTTjmCBAGkUIidZS
	0cGimg/YPqBaWM0X1jsHP4WxX3H/i1vileFLAZddZXoaFshmyOzLNce0m0k5otnSHtUCoZo+BHr
	owPW8QimdlPmdmwG+E9zfUZYN2PWCzZ3X5a3Tzxit0Ylsu4GwR8lVGC2t0d+h+knIpY6B2+3aTM
	fVGZ2ZTKs7t1R9mv+sjJMMJynOAn5Et74iRS/hPksuoFmYorz/fH1ALHfTouwOAylA+Fl5DkD13
	eziYqAohP0jEY8bDT95vw1wFIfQGk568SzWVBOjNY4mDsXpxF/ylj0xtskdgBnqSgDxtV48arvM
	m1th3chDlMXJVEOTSHp+KYlKNxlAPa08oXWe8New6Aehh0/5Y2adj41cnaOJD7l82WhxYBAQXch
	RB5kApTBEbv0TYrdCgTo/VOA==
X-Received: by 2002:a05:6a00:1a19:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-8274d97a3cdmr1844514b3a.26.1772179069377;
        Thu, 26 Feb 2026 23:57:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4c5e9sm4315422b3a.2.2026.02.26.23.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:57:49 -0800 (PST)
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
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Subject: [PATCH net-next v5 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Fri, 27 Feb 2026 15:57:15 +0800
Message-ID: <20260227075718.2243818-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_235750_351325_EF1EEC40 
X-CRM114-Status: GOOD (  15.85  )
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


