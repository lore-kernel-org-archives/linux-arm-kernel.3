Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85508CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etFKt7+tWRxLPhUeF783JanGoHY0JOZ/EUy1MnL+9k4=; b=BMCXl/Z12HByAjaMD23QUd0ZPJ
	zRLN8vBJJXjIN1u65Qd9fBQFLo4eij1gX/jKpL/D0FbPKu0fRsugIBhGEQOt9NHqaonspk5i0Lsnk
	8IsHTIbuY1n9HwvzNGFNYrWQ07CObuxO0ROfZFzKj+vyzmWBVJszcikOpcvIbpl86rj3TK4LnGEL8
	TqH7UtPNLNRXdrcWeZYQghiAngPKHBcoNQL9JYwAI2lYSvUb6/QDgqtdEAS+/wnZh2ydTMoq5fs/U
	132raLJ/pzzOn0QkjL+ni9pB2lfO69XrXWxmsz9BCTrbO0b/3xA1hekxKH4ydeczFm+NroQj+c1kI
	9ZnhG6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFI2-0000000EbXa-16jt;
	Tue, 02 Sep 2025 00:54:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utEe5-0000000ES8S-1ecU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 00:13:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3cbe70a7923so3735769f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 17:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771988; x=1757376788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etFKt7+tWRxLPhUeF783JanGoHY0JOZ/EUy1MnL+9k4=;
        b=hnirTIYN8XBXP7OtgLvnkOSy1wX5ab2x+lVj+S5cBxBnTR8FtR1BzvO5YFSwnoTfuv
         xmmQHIGKcElHLxM5aY92Jlp7hv160iGkJc+GNvAY8YnDgLb3ZbzceHOB8Uk9GcnKhNs2
         /K5KIKuPU8hxG+RkvYfsIKsaxpuaRZeBS3CCHUvsp0WeuO9+t7B+a3Y8ZdvCtv/cgvU7
         Q6jnFboIq+c/qICVNAkXPCvGDfUZQt+Pivqv+y3neKSH16gDAKEAtUSJVnUtvyv6OXE5
         o3aZ1kDv/p7r4QVWcCpSkTkxEMGzMvfvkKeNOOJWx6y0W/9N90eiM8TYh1E3NR69Kalj
         6LnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771988; x=1757376788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etFKt7+tWRxLPhUeF783JanGoHY0JOZ/EUy1MnL+9k4=;
        b=oDTWVfj13JNldMdzcEP/x6ThWUHJPMb3xL8BppyBY6cNC6ba5LKxhhhaQqfcfp1+2R
         sm/Xav8p1smXBJeLqFCvhlqY9N1wvZhoNhHIPsAu/SH7e5bfQyWj6lVmOROKyxJZPhsN
         uCViN3Z/QdDXaizk79v2z8KJA1ts1ow/R/0Kg9qRceEDFyhy/Z7Eh7sdVWAfKbN6gCkq
         Zsnn7731+Y2yfN6CQLxvgF97oNT2iCN++frsY5WDB8W+BLkn1K/k4LwLs/74EBMQEQwx
         +Yp9NHOA+cIalYJKpbjRmO+vGs8fT7MjN7oqONpy6H5jU3CDE+FhGaTdJr/L9ARhkpCl
         1+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU1aF1Gb4z9vt9ZG21kwQaAzXLBaWGcR59ZGe8kilENJO6cTr/d71s3UFYjEgrPXwCn/BIAHwxTz1bOW0hQqq95@lists.infradead.org
X-Gm-Message-State: AOJu0YzKREDt0WvdenWyUmR880MOf1I1IfvqY6HhIJ3MA7cyVrMOXQGZ
	I5WN+AaCwa6tg6sh2d9cRs7XU4OFi8b9hOyqX1pvgStgP6BcRGW7iiLU
X-Gm-Gg: ASbGncvYi4HLbCp1xpgCqrUwNii35Sx//zhTvEvH+7zDrKCRxrKYuFczjp8qLmSvP8K
	sTgDmI2U9Q6PyBA5ARheEmrIeBnI7yTUs9RaNQAOWXyL094xV0dz4qX3LUO5F0uXXTeaHrSak0Y
	SYZqQc9WlEONMvI6W34Llj1HzJGgjUuFDJJeWyrp5fEp8kfC68/g9RnRIPs0tnJdW5Joy/bbrb0
	a+gSRMNeX283mCQ4yhFpbBf27X5j3nVuJMj9vidACa0JICW9YTHsitAhI/ezfqbGFhOT5LhZMRk
	3z/vLTGC/zGUuilA53MZG3QHvxI7rpI9ax3aGRXl38bNzbYBzHBzA/RcMUgJkQyBMFmOPbCqBsA
	8W2gC059hcH0h4PjrC06sBow58H7O+bwukMCeiL4QIYxHz3YHzcK6g3Wn
X-Google-Smtp-Source: AGHT+IFPGTlk+evyu+xtq0waHE/04booU4YiDIt+L0pMGxGvKONa+Sj6VFPE3ubiKF0MVGHEbhBjNA==
X-Received: by 2002:a05:6000:2387:b0:3cd:cf31:d77b with SMTP id ffacd0b85a97d-3d1dfcfb96fmr6542569f8f.37.1756771987739;
        Mon, 01 Sep 2025 17:13:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:07 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 2/4] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
Date: Tue,  2 Sep 2025 01:13:00 +0100
Message-ID: <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_171309_437898_A6BF48B0 
X-CRM114-Status: GOOD (  14.59  )
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

Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
identical to that found on the RZ/T2H SoC.

While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
DesignWare MAC (version 5.20), the hardware is synthesized with different
options compared to the RZ/V2H(P):
  - RZ/T2H requires only 3 clocks instead of 7
  - RZ/T2H supports 8 RX/TX queue pairs instead of 4
  - RZ/T2H needs 2 reset controls with reset-names property, vs. a single
    unnamed reset
  - RZ/T2H has the split header feature enabled, while it is disabled on
    RZ/V2H(P)

To accommodate these differences, introduce a new generic compatible
string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
RZ/N2H SoCs.

The DT schema is updated to validate the clocks, resets, reset-names,
interrupts, and interrupt-names properties accordingly. Also extend
`snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 138 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index 23e39bcea96b..e01763389164 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -17,63 +17,112 @@ select:
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
+
+      - items:
+          - enum:
+              - renesas,r9a09g077-gbeth # RZ/T2H
+              - renesas,r9a09g087-gbeth # RZ/N2H
+          - const: renesas,rzt2h-gbeth
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
+
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
+
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: tx
+
 
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
+
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
+
+      - items:
+          - description: GMAC stmmaceth reset
+          - description: AHB reset
+
+  reset-names: true
 
 required:
   - compatible
@@ -87,6 +136,54 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzt2h-gbeth
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
+        reset-names: false
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 578553840c9e..14be80fe9c82 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -77,6 +77,7 @@ properties:
         - renesas,r9a06g032-gmac
         - renesas,rzn1-gmac
         - renesas,rzv2h-gbeth
+        - renesas,rzt2h-gbeth
         - rockchip,px30-gmac
         - rockchip,rk3128-gmac
         - rockchip,rk3228-gmac
-- 
2.51.0


