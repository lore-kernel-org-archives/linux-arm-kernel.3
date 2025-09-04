Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CF1CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fizy83t1JAhLvYW6Ng4v/axqSLgHAjf0OCGjjfhXeLQ=; b=d2TNLIFY5OiiFPTMhVgHszIAIc
	yUdTu+jl5OSSgFFEoBfAspjZ4rNJBGId424Y79jbEzJK1f6Usmk3VlOdKgVGIKYZLyWh5jt5uPp1M
	ybYmibhj06PcQONA8MTk9Cfb+xQcbWGqp51SW9JcjVz0QlmWmHEq97pWpzgP0wXX+3JWOO5tdhSxO
	fzY5l2QvImW2tAw7JOuH3DCjjWEQQBoenR3RgBwcQ62fOY4oQHd0De4Xk70ca9rPPcgRry5NTnDbQ
	dFym7PMLhDyqZfjJ6U+s0mdOA1qInBKLK7IHkbbu3QY23OMFJjnV+h4hvpYXdtlkj3YMyhxl5tJqP
	bw/CGvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2x-0000000G1Vj-1ZSw;
	Fri, 05 Sep 2025 02:19:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGkO-0000000EKZa-2q4k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:39:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so2367305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 13:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757018395; x=1757623195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fizy83t1JAhLvYW6Ng4v/axqSLgHAjf0OCGjjfhXeLQ=;
        b=GyYR8Haa7UyFnQlTy4n97kfCXiU6kyO1LebJpevAzHAyp3GZSaEzOquSIfAh72ZpGZ
         K9nFj/uEBawlN5QrNUC00uxuqKr0/wz7HMJ2EFX9q6cXYBI6xsmBZrkrEXS8dzBK/wWv
         TtoBATqFEfgBdBbPQAuOwiu6KmbVMOQFW0FB+q4Zfo7jOQa1KkwbLhfJqDsgG6w3COrV
         Bn/y2E8aRnVGpLpHRBW0rKpcNscKnhACyR2C8RN+nqqqWinGqLQOmAqnQenSl5ao74da
         wAk1lCjBtKFWc0+SboP9ycMTZgJe4J0FZFl2R23q+20KHrgjjyB1fHmw0CWALC5k8QsR
         3oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757018395; x=1757623195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fizy83t1JAhLvYW6Ng4v/axqSLgHAjf0OCGjjfhXeLQ=;
        b=QfQwTtb+7IWegBjGmDkMJurkjWY1MlnP40jQYqJFXHp3UJ0AV0oeT57OiZE9I4ldnO
         BditEwIghzvUCYCuCNcF5z5QUJld15bwK/8Bm1ngb6LMvR0Jaaxr8HakL/HRXS3a15J9
         rVnYZc1CUQ7BXxh7/EOY5o5AQnQ7GuULMBealZ1Eq4wlVmGKJv1+M8dAt6nKrsdqGCnr
         g0gsowmRtkPhgo2j8lYJS7U1HBA0bOuLsgF7h/GIK67Gu80YucB9sX12TezaMP5NRVe5
         TuGgYNP/MHZng05QcyC9WTQbvMdXEDCRvbq7Gzfju6nJDwD/qeb346VVx8lx3YW+FpIg
         QU7A==
X-Forwarded-Encrypted: i=1; AJvYcCU61RouriB6TTL9rau0yNXb4Qi2HUFISjrB2M1YvpkCF5Ly5yIdCrj824KFstLTuvRP1GPDJP6mVH5LPO18pBlM@lists.infradead.org
X-Gm-Message-State: AOJu0YwV3SWmh0uEYbTq1o1+nF+CIFfnhPQK6hEhxNx/je9mlHlajFvR
	fYp5N/gou/cGhGpFrdgJNLVynqC807Zo5+tl1L3ct1QSdHMyinVo5hUu
X-Gm-Gg: ASbGncuvl8/KvL48KvgOhWQzjHjsL3jOAoDtcm5k7oLzrJ9HrMvThaXUv53zlfop4es
	L/P+YqyuL7SXVoGgFkAatnudaHDZuFp3wbvFV9gdeuofYEAhvkF3QsK2OdwmFUUGyh4e0rafeW1
	DqRstiFJOdKKg5x7R6cTo1LO8+GatEs5h8x+vI4jk8++P+eshwYZV8LVBi/PchTb9WjxMsPYaWT
	3c8tifd41HsDDKnPdkzKIQpY/pT6WBviPcwLjsWZRhJ35aGGYnU10hZJMGkqzoclojxK4LS6GYg
	IyB4+sBXhnflyNofTJDInpPa2YaxXia1FuX0qa+bzrEC9W+AMBRZ346UAdCqxmvVjU1tT8dnua+
	+0GgxE3KIS0BmSCTsJQqgpkd/E/QK5AUf7OCzBOfOCkVkZ5o=
X-Google-Smtp-Source: AGHT+IENq8QST6cBLls+zIuIq3hvfJjjYPXgjXYTa9U5XxkuNBCv6PPwCKKnufsIwdZ9KJddA59LCw==
X-Received: by 2002:a05:600c:458b:b0:45d:d5e2:f65d with SMTP id 5b1f17b1804b1-45dd5e2f7f4mr6413535e9.4.1757018394763;
        Thu, 04 Sep 2025 13:39:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:39:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 1/3] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
Date: Thu,  4 Sep 2025 21:39:47 +0100
Message-ID: <20250904203949.292066-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_133956_732586_BEF701D4 
X-CRM114-Status: GOOD (  16.46  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the Gigabit Ethernet MAC (GMAC) IP
on Renesas RZ/T2H and RZ/N2H SoCs. While these SoCs use the same
Synopsys DesignWare MAC version 5.20 as RZ/V2H, they are synthesized
with different hardware configurations.

Add new compatible strings "renesas,r9a09g077-gbeth" for RZ/T2H and
"renesas,r9a09g087-gbeth" for RZ/N2H, with the latter using RZ/T2H as
fallback since they share identical GMAC IP.

Update the schema to handle hardware differences between SoC variants.
RZ/T2H requires only 3 clocks compared to 7 on RZ/V2H, supports 8 RX/TX
queue pairs instead of 4, and needs 2 reset controls with reset-names
property versus a single unnamed reset. RZ/T2H also has the split header
feature enabled which is disabled on RZ/V2H.

Add support for an optional pcs-handle property to connect the GMAC to
the MIIC PCS converter on RZ/T2H. Use conditional schema validation to
enforce the correct clock, reset, and interrupt configurations per SoC
variant.

Extend the base snps,dwmac.yaml schema to accommodate the increased
interrupt count, supporting up to 19 interrupts and extending the
rx-queue and tx-queue interrupt name patterns to cover queues 0-7.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Squshed incerasing interrupt count changes to snps,dwmac.yaml into this patch.
- Dropped un-necessary blank lines.
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth" and used it as a fallback for RZ/N2H.
- Added pcs-handle property required for RZ/T2H.
- Updated description for reset property.
- Updated commit message to reflect changes.
---
 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 178 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 2 files changed, 143 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 23e39bcea96b..bd53ab300f50 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -17,63 +17,111 @@ select:
           - renesas,r9a09g047-gbeth
           - renesas,r9a09g056-gbeth
           - renesas,r9a09g057-gbeth
+          - renesas,r9a09g077-gbeth
+          - renesas,r9a09g087-gbeth
           - renesas,rzv2h-gbeth
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a09g047-gbeth # RZ/G3E
-          - renesas,r9a09g056-gbeth # RZ/V2N
-          - renesas,r9a09g057-gbeth # RZ/V2H(P)
-      - const: renesas,rzv2h-gbeth
-      - const: snps,dwmac-5.20
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a09g047-gbeth # RZ/G3E
+              - renesas,r9a09g056-gbeth # RZ/V2N
+              - renesas,r9a09g057-gbeth # RZ/V2H(P)
+          - const: renesas,rzv2h-gbeth
+          - const: snps,dwmac-5.20
+      - items:
+          - const: renesas,r9a09g077-gbeth # RZ/T2H
+          - const: snps,dwmac-5.20
+      - items:
+          - const: renesas,r9a09g087-gbeth # RZ/N2H
+          - const: renesas,r9a09g077-gbeth
+          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
 
   clocks:
-    items:
-      - description: CSR clock
-      - description: AXI system clock
-      - description: PTP clock
-      - description: TX clock
-      - description: RX clock
-      - description: TX clock phase-shifted by 180 degrees
-      - description: RX clock phase-shifted by 180 degrees
+    oneOf:
+      - items:
+          - description: CSR clock
+          - description: AXI system clock
+          - description: PTP clock
+          - description: TX clock
+          - description: RX clock
+          - description: TX clock phase-shifted by 180 degrees
+          - description: RX clock phase-shifted by 180 degrees
+      - items:
+          - description: CSR clock
+          - description: AXI system clock
+          - description: TX clock
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - const: tx
-      - const: rx
-      - const: tx-180
-      - const: rx-180
-
-  interrupts:
-    minItems: 11
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: tx
+          - const: rx
+          - const: tx-180
+          - const: rx-180
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: tx
 
   interrupt-names:
-    items:
-      - const: macirq
-      - const: eth_wake_irq
-      - const: eth_lpi
-      - const: rx-queue-0
-      - const: rx-queue-1
-      - const: rx-queue-2
-      - const: rx-queue-3
-      - const: tx-queue-0
-      - const: tx-queue-1
-      - const: tx-queue-2
-      - const: tx-queue-3
+    oneOf:
+      - items:
+          - const: macirq
+          - const: eth_wake_irq
+          - const: eth_lpi
+          - const: rx-queue-0
+          - const: rx-queue-1
+          - const: rx-queue-2
+          - const: rx-queue-3
+          - const: tx-queue-0
+          - const: tx-queue-1
+          - const: tx-queue-2
+          - const: tx-queue-3
+      - items:
+          - const: macirq
+          - const: eth_wake_irq
+          - const: eth_lpi
+          - const: rx-queue-0
+          - const: rx-queue-1
+          - const: rx-queue-2
+          - const: rx-queue-3
+          - const: rx-queue-4
+          - const: rx-queue-5
+          - const: rx-queue-6
+          - const: rx-queue-7
+          - const: tx-queue-0
+          - const: tx-queue-1
+          - const: tx-queue-2
+          - const: tx-queue-3
+          - const: tx-queue-4
+          - const: tx-queue-5
+          - const: tx-queue-6
+          - const: tx-queue-7
 
   resets:
-    items:
-      - description: AXI power-on system reset
+    oneOf:
+      - items:
+          - description: AXI power-on system reset
+      - items:
+          - description: AXI power-on system reset
+          - description: AHB reset
+
+  pcs-handle:
+    description:
+      phandle pointing to a PCS sub-node compatible with
+      Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml#
+      (Refer RZ/T2H portion in the DT-binding file)
 
 required:
   - compatible
@@ -87,6 +135,56 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-gbeth
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+
+        clock-names:
+          maxItems: 3
+
+        interrupts:
+          minItems: 19
+
+        interrupt-names:
+          minItems: 19
+
+        resets:
+          minItems: 2
+
+        reset-names:
+          minItems: 2
+
+      required:
+        - reset-names
+    else:
+      properties:
+        clocks:
+          minItems: 7
+
+        clock-names:
+          minItems: 7
+
+        interrupts:
+          minItems: 11
+          maxItems: 11
+
+        interrupt-names:
+          minItems: 11
+          maxItems: 11
+
+        resets:
+          maxItems: 1
+
+        pcs-handle: false
+
+        reset-names: false
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e3cbaa06229..658c004e6a5c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -75,6 +75,7 @@ properties:
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
+        - renesas,r9a09g077-gbeth
         - renesas,rzn1-gmac
         - renesas,rzv2h-gbeth
         - rockchip,px30-gmac
@@ -118,11 +119,11 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
 
   interrupt-names:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
     items:
       oneOf:
         - description: Combined signal for various interrupt events
@@ -134,9 +135,9 @@ properties:
         - description: The interrupt that occurs when HW safety error triggered
           const: sfty
         - description: Per channel receive completion interrupt
-          pattern: '^rx-queue-[0-3]$'
+          pattern: '^rx-queue-[0-7]$'
         - description: Per channel transmit completion interrupt
-          pattern: '^tx-queue-[0-3]$'
+          pattern: '^tx-queue-[0-7]$'
 
   clocks:
     minItems: 1
-- 
2.51.0


