Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9C4EC1439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=; b=Su8V44Vme4KPsPdcLbQl2xmrOA
	S3Omym847g3iQqiK0xNRE3OCnO7QG7oT42JC+33T0+5BS50VvbphG8GEDXfdNKcz5ITGTvUB8wlYa
	+lWdzoQIm1VN/qKh4VCyP/9yLLf6cZL9CfDLdreDULmaFwHtZvlkwH/AnwYCGrSP/rodtNV3UnTcG
	jl2/cqbeCGqQo6QGdMKFYaqDyWYfQwg6ijiNnLAhuZ2gm79ILRBw8lrHRVmh5xz7a+xUKPu27GUgu
	1rvogiyvKUZeqTDisi1hGy0tDQaKlrnM5VI0QK9g4ZXgRa1isqg6uYUIQ1yJ/r0V5AePgDouCH1rH
	8WZIHx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGy-0000000Ggtk-1itF;
	Wed, 04 Mar 2026 08:08:00 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGv-0000000Ggr4-0FzA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:07:58 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-359894e17b8so2205536a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 00:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611676; x=1773216476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=XUJx/BNh1QWiOy8GKtj9sC9mD14II/CTu4dd1yayAhvRKozvUg4Ebd2Duu/Rl0uEp+
         7qI8Koik5Nf3dc1SKzr2wkmutLGaxcFZcyIHvpWX4PYGE9uXkXBhgb/NfcKVlHNj1hUd
         +VJreR+H162elSzG/OE1FjWdcIXF9Ocn0Nad8sQwZ79fw8jMPKVH0JtKM0dHHComYIA1
         OcL40b1IgI2s7UsYPGmoEviGOnRIxk3JvBREH1/9eXEhjFMcjMD4HdEorh/UBtv8S9Lk
         swr4fQMAikTv+61n5qReA2K2iEs/FNM4YVYsFujyhVioM3ItWMv5AQOUEngfcPgTm/iu
         YHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611676; x=1773216476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=CEImDfGSN2//GNBbM4EcEo5ETMGtwcD55g+rQov/8R3mck1xMI8ufnjX2x8UIvN08X
         ZZZwvSYBlv8x78OLRhdnZcT9lWc16LRlDsGODQ64Jz/eN46duRg4pJKSPZU5+CSA7XPu
         HRgChrWAC68lJwyh6VGNI/+VrYOHWQjSD/PSu1ZAkWkwwBBIr5dTm2KQIYdpbVQS9xen
         bAOoYZLSqpDjGucr94FV6cbs1i1HLjWurtkAFhnwFZxYMXjtAA5QhNDTDw5CpLVcpGCc
         3af9blYn6cKCSHkKnbF6aiKpffTkYxNhONJBBk1e2Z+ZOnXFZRlzzSpjUAHRlFLwCOhY
         KTtw==
X-Forwarded-Encrypted: i=1; AJvYcCXtBv4bFohEW+3ihFgpC8L9mpZ0Ri513KTslHUxkIaeslrnoT9I0Xjdt6GIJ+TpLDb6VkLncW0x0iHk7q6R8YT8@lists.infradead.org
X-Gm-Message-State: AOJu0YzxT93annzk7qFGqLtkhbfKiPCsXBRoQjgmpKrTX+96b8wJnbpj
	4U4SXUJWdKaMZG9jhy0zN9gmHMr4Oy5sqZe3ENQ6r8Sfipmh/UhA79YJ
X-Gm-Gg: ATEYQzyMl2mOTcmww49z0k4g3GCHDdjBdt9ehGY9atWf80WrjClRv0YWHKrU9nll4/z
	fT7UrqPIU9/Lh3/kBX82YrqWGeZq+TM4fpesf42glW0qHYNolFKiHkQyyEWUSsQita/uVbZ7pYi
	JHu7DV9I+fL7vgjTjOrMSjRM5VBcBlaZ6K52sIM2fsWUSqVeeIU8evgX5rlbKQpezMm7zfvmyyQ
	LJF/akVT5t0b8js2RQgOCWER69JshGQTHN/miaaH6svNrcol0ibyarWimVK6WlVylPoLmhXZY4N
	AdohLjkIsHSQPP3NzI1TqjASXG+VAi6QW0mBBSBTvyQ+8xS8hCaSJwObgnyytTrChz61K0aJ1ox
	NVVw+sCKR9xN7J07H7ENfBNkeGH+yJPT9m8a7N1XU7HZUhcwl/SD1tccPGT4QoaYgy1sOwIYiaK
	YlzmTLRRHvkuRBRKyRf1CrOiY=
X-Received: by 2002:a17:90a:e70e:b0:359:8ed3:8a65 with SMTP id 98e67ed59e1d1-359a6a7e138mr1340347a91.34.1772611676045;
        Wed, 04 Mar 2026 00:07:56 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa84855esm16728289a12.34.2026.03.04.00.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:55 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next v7 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Wed,  4 Mar 2026 16:07:18 +0800
Message-ID: <20260304080721.1658224-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304080721.1658224-1-inochiama@gmail.com>
References: <20260304080721.1658224-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000757_102538_88A71312 
X-CRM114-Status: GOOD (  16.24  )
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


