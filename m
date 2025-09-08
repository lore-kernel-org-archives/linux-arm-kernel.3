Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC774CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tT1Xp52aCmTF02+8Ud3J8zJAyZxLoOv8A3lD9qbLto=; b=k/LoA7ehOA6A8thQyo+7/qJlfT
	WLuyelLkT4zqJCnn2TIfKydIsSDiRHc1KZP+hFnnRLmLC1dkYsOgJ1+hq61NtHRKS0koqhw5kzHPi
	28vrDj5PFrGQO2lp5YKKaRb3IPUxXJlUrt7LpTIdj0/01VXxXECXKioCoq3M2p6RXko8QppKn1SJK
	z3rcnszcM7LkbkQElwMhIByamIwA0ltxqHa8bX4HdpRtQtUCCXLd2VorXOT6riMUyN1otTYkUq10+
	dbL4IvDuJqTiGqp9DHnod3sVMD29JvZvPxKdBGqEv4pfxd91xjWiKHObRmrfLjXCp1H1CN1FruFXk
	NDswkV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaca-0000000Grrk-3DMK;
	Mon, 08 Sep 2025 12:05:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZac-0000000GVtK-2qOV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:59:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso23384775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329153; x=1757933953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tT1Xp52aCmTF02+8Ud3J8zJAyZxLoOv8A3lD9qbLto=;
        b=k1Rc+1vv032flgJgQw7A/AUGLzZdPBD1vqGfYhMsW7aZElGJOfOKHMaKJKMkYaOt92
         g8/6kZYGDFnOJSryjDKp5WlkFHa46iZ3YjvRldLmTRQVKL5ZsB9FHEr8fyW+MaOV+fnz
         BUIAwHreTBOU9e3r/WypykeAagWACcMgHhcjYDo7b58Il1Z8LWIIUhAVe3CBZh12mp/J
         vY4kEk3dc5HXFq0oPufj+bxEibPqhq6Xhe8TogVF5b63fFiO7sYVYv1t/G6Ok0GpbDz7
         OaBzTzQsiWmOqFgxksEJlfFBCpxXkRTPXLNoF9ncpVrzI5oVdsvTCKGXYCfrPzhUc/uS
         XgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329153; x=1757933953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tT1Xp52aCmTF02+8Ud3J8zJAyZxLoOv8A3lD9qbLto=;
        b=aBFAOGg41vOe+WWlq7slthpApCDDChuC6i4dbLpPPvDu32Jbx6tBHJbWY1RaPEWehm
         LHcSoNJR33AAvilb/+hqw7a2+xAUrf6C2tveyH/lsJbzzAkU7AAaFepl0BF/UZbdCj9I
         dm4IBk1g292Duct5FwYn3cAeeCpA7Sfhrv04UvvzjtYF8oNRqfHcT+dqyRxeKWPeL7CN
         BwDZMj3AFT6/aG3+DdaYyQC3fw55Arm+jEXpmI+GRKH+6ibEsoJPuk36iPgU+wYlvH7x
         NcDJqY1EDACMpTOG4ez7iJBkm1iYqTYqEj9ljcbaBBiTKrTP7XCtVwIUObYw/SRGwhVK
         ZtTg==
X-Forwarded-Encrypted: i=1; AJvYcCWJDAH3MG8VLxFRZJAC1EhRQ4nSpQipqYZbI7qEYjvqpR8FZ/aLT5T0qwpBT9z/w/aarCV3GjM9P71O6tHa0X7f@lists.infradead.org
X-Gm-Message-State: AOJu0YwDp6me2Skj9tJIXOZUVP7ceDsGZGhQEZ4DLZ8G64lEv5yA1l1H
	68LGpF6DnOLtlwiCtB43ITn2Z05fQudZwKrxS7Ihncma4aEV5KZ0mVd1+pD6pQ==
X-Gm-Gg: ASbGncvSwCqKwrzRZ8f0KgKzSXyOGc2qthJGxvPCQJjv+qUGPB2m2xEKJV2KFRG3lWW
	WGoo1s0Nko30zJnfhh92758/oZtV92zGMf8c3inYBGq0t8IQEqt2uI0ENOI4jF5Jt138SjS6Ol9
	0ATwEbBRBcWQenzsfd4ZSmESDrNnYWfICKj83ATIGjI/jMQROoKNwl6Jb7vFmQMqcFT0Aklz6ox
	Boixt53q83Kr5+ctwAc8N4TXcvk85/Q0WrEuUSZdQg25irUHlUT5HywmHlO3xJc1KBYuQF4pVI+
	vSeSx9Ud/ueB0IGyx/wgkJEsqzXFj5YDx8eisY13P0ybLhPHt4y94LNAjHU2bBthX/t+afkpAnN
	U2ND01o+bwd6y0Sjw1SqzicOWvCrRYcDuci+ZLRFN7qX7XYt3eYhkkps0szDVH84ZgldO
X-Google-Smtp-Source: AGHT+IGEc8edQOs3dhheC9RQKQGoxTtdML+eQP6weXI+CH1pZvzlnV0eMSoMuxHSD+mTWez85Xg/MQ==
X-Received: by 2002:a05:600c:1c0d:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-45ddde868admr61847095e9.1.1757329152682;
        Mon, 08 Sep 2025 03:59:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:59:12 -0700 (PDT)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
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
Subject: [PATCH net-next v3 1/3] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon,  8 Sep 2025 11:58:59 +0100
Message-ID: <20250908105901.3198975-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_035914_718091_77ECBE92 
X-CRM114-Status: GOOD (  16.62  )
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
v2->v3:
- No changes.

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


