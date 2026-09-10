Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C03C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zolPHkX75MVfEQoqJHx0lnD2lNS7PbBbxJvARPQA/YM=; b=cgBc406NnU4zEvfB4NHslXrUaK
	ihFuJjAmSFJqUGluuADPXZ9/5XbZmhNfY7GBm1Eb6MZjsMKpmXRfghq02n1V8IfEh5bC038f1heBR
	GnzUkgZFuT8ymEWLNG1sUzyQwX1/QXqpgEHlRlO4w9zIx/40uNlhD0gLjqx4DuNu/E3dWj7cfryaO
	JxCy4O9CGELpyM5ZVzkHzwH6CZLX2A2SE0s738VYo0MKxGaDPSHfEzNRrrRn5c45wZQYznWaOuQp8
	MUjidNFPgxEiu7KZ47m091tlCgb82ePs+u+ZXiHKWNosQIL3uDwivfvC9uiajcVB0OntDyaod5OmL
	gm58kX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4byU-0000000E2n6-3XMu;
	Thu, 10 Sep 2026 10:25:46 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4byQ-0000000E2kR-0Pe0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:25:43 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b91369ef6so8647845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 03:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789035940; x=1789640740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zolPHkX75MVfEQoqJHx0lnD2lNS7PbBbxJvARPQA/YM=;
        b=aQJ0MgaCGTZ8NxbhyI35oZSKHNvfAO7O7Z6HSQqcjwIBBsfmIa5iwnT6LDYiRWs48r
         hwqcIVhOhkZcooRj3sXMAYIas4dtk3mYakw10pgwQXIzKoD90yHrDKy99Jnpq55ok1K4
         MoTmOhNhLMPeT8cu9aGnWnPQJXFklQvDyVaMk9KHVarPDqL+zsB9QepEskHfBv2qLmsZ
         S7izOsUnOapTZD/B/9SJTdToebARcsKWomFa9wnBCyZ0UJUiWUc7ZFzd+J9z2TDRPp97
         6hqYyJ/dJEm+M/UDrY7Qrl9lZua8h2HIitEVOpsIgsspp5IpwIezi926CwzNydnJKz2F
         4mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035940; x=1789640740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zolPHkX75MVfEQoqJHx0lnD2lNS7PbBbxJvARPQA/YM=;
        b=miVKwZb+H5hZSBVe3jx5Kp5WNhkRW6d3woayYqTqzHzOufto43CG7HGaDE800kV3AZ
         HfYfD8QkMhgJpG/cM0IaISR0OJrclyBX/v8V0ylOMZFYxhCvfvXfIXPaFP5t+F5aQDi4
         zwi/rVCdk81obtYvw+dNuEqj/Rk8dXASdcMCo/OyCkIPgxFbxLziqqeJzSXt34wqvQWk
         tEjfp9/5uE1JOs+8/fRBVeAiJL3iGtB1n6CwV9mYdK4bTlR2+pkX5U/yLS0nFQja8Gcl
         r9RNzxHilGNJjFUi7dFE4W4zqSdl/B+nXBS3DwxzVbKwjCrkSSsrPhh72NbeMm+vVYrw
         O5yA==
X-Forwarded-Encrypted: i=1; AKwUvByeXlUm0bypw9Fh35z7PWVINe9MFRYek/GX4YWzk+SDAAThCTUdlZ4t4QbQeinB7Ng7o6Y/YfogyDRtGv7V5z90@lists.infradead.org
X-Gm-Message-State: AFuF++mW0ibJ8RpHZfOluY2rzj0gbXV00MH6G59aCnX/rsggru+dbnlD
	wbTjnyusSGLES+2QfSWS4uLf9Iepg2dBECWEtCiQgA5UpcpZZzt2ZjHV1jq4zZQRe2U=
X-Gm-Gg: AYBFou20qKMin5hTKtNj95cnj/pBwurZGxfHRaOkl6Pzpy2cMayNkPTR9nRn5Og+7gQ
	UgFRwYi5n66NXxSZHTRTYO+fPSbaylL1NaPOYz2mcdw/KxMiHJZd5Cl7Ucamvs9ZAeV8Tjl3bBe
	0TjLQzjvWbMlHC/t89+Kci01kyp6Jo7mg/Exq1Dz82sQ+xS3uoeh58fYOPLF2RPqFwl9zsTbt92
	NPXX7gWOGDMFoQzZaGnfjmAgMunO4MZ0c0Es99ctzFTs9iAH+dRu9xOZVFlFOtSf2IMn2w/+Bkx
	5J5n7SfWZiovgIUVXuln1wSW/KIFIgk9sSpoHH2Fic3p3YnJfEZioEEsKrpdUeXjV32m9ReACT5
	/fx2rbyWFfoNr5ON5HauIwhBr6TmUZXccIaGI+aHbPomXkZKSurPViOAXSFk4eEzTSdt37LT6K/
	wMMjdS1cHf/dJ0ax/7t0xbaE39oRkZeZmX7nSmSNvaWpO2UTSILyA6hXoA2nl15ivB1j2x3A212
	kT/2QyGH2vH+cJE6W3HEKtgHxvu
X-Received: by 2002:a05:600c:5647:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49d259138bamr96347135e9.10.1789035940023;
        Thu, 10 Sep 2026 03:25:40 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c07c17sm80398975e9.14.2026.09.10.03.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:25:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 12:25:26 +0200
Subject: [PATCH net-next v2 1/2] dt-bindings: net: sun8i-emac: Add A733
 GMAC210 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-allwinner-a733-gmac-support-v2-1-4f4a1e520c23@baylibre.com>
References: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
In-Reply-To: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6093; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=dGwRU59pe0sF4kjsOhQWQNnHY2FCR9s7ump401KQyLE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqooWeZxMiwo0um19rhs5hPFUy/F70TN34N0ekt
 c3qzsdT2TaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKFngAKCRDm/A8cN/La
 hZejEACg/bnxpg1KnlHEiJc1VDPDY/+8Ow0tT+fJQXkXgHPAU+MRARUHKSaHbj+FMtI5pbY64+b
 UkybYmYJ9kNkhCCZqTa3/mp9jzot/dvYXHo1H0FwBgLVmEa2h73TBHdkAjG5xD+OkyCXXU7GmXb
 HEzv8RGdsYOdTX/ixDdAEAnlwNs4yHRQmCGGXZtIwKDQPXbt1I+LT53o5ybGtdPsO92fx0Aalgo
 9bNcYqKqYAOffOjVIekKYLXlND4noSrjNk7qTpOffkNxApJZceY/jPhVHnPa/A4UpAQ4npCdvw0
 q90kfKOaPWDj2dmWKAtODernP/0mY+4Ahp1z6Rm4ytDnQ2z+nk6q6kjZh3iB1SjDF/CC0yueScx
 qXFJluTkuPAS/1mgYmwlhQhduO0oehARz+k6UUwJygDhgeQtdVR5pS3Jpb2dg7ECCxAqMoOZzJ7
 BlCrQUuX30rB7xmkBRhBf1V4iF9lUOr3P0wftVWp3W3P8+845yd/7fwVelvJOkIST8hN94YZ2EB
 o2Zze9jYQDRlvmtiy745TjgdrCArVVZt/DuDe6unpPK27lLul9wAU3I8aHV0bW8n24c7kHADMzW
 x3PvX0rb7p5jFJntcdzqeBjvYoQYzb3Iodqa9A2Rbn29RPtMbAQB7rRfOjr7VWQofw3W/OAjcc/
 UHMDa2b4r0x4qRQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_032542_207570_D83CFEB6 
X-CRM114-Status: GOOD (  14.18  )
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

The A733 GMAC210 is a DesignWare MAC 5.20 close to the A523 GMAC200, with
the following differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register, so a second reg entry replaces
   the syscon phandle.
 * The DMA channels and the LPI event have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * Unlike the A523, the controller does not appear to belong to a power
   domain.
 * The TX clock delay field is 5 bits wide, allowing up to 3100ps.

Add the new compatible and describe those differences.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 ++++++++++++++++++---
 1 file changed, 115 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..fec42f46378a 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -22,6 +22,7 @@ select:
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
           - allwinner,sun55i-a523-gmac200
+          - allwinner,sun60i-a733-gmac210
   required:
     - compatible
 
@@ -44,25 +45,38 @@ properties:
       - items:
           - const: allwinner,sun55i-a523-gmac200
           - const: snps,dwmac-4.20a
+      - items:
+          - const: allwinner,sun60i-a733-gmac210
+          - const: snps,dwmac-5.20
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: MAC controller registers
+      - description: Glue configuration registers
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
 
   interrupt-names:
-    const: macirq
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_lpi
+      - const: tx-queue-0
+      - const: rx-queue-0
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     minItems: 1
     items:
       - const: stmmaceth
       - const: mbus
+      - const: ptp_ref
 
   phy-supply:
     description: PHY regulator
@@ -87,7 +101,6 @@ required:
   - reset-names
   - phy-handle
   - phy-mode
-  - syscon
 
 allOf:
   - $ref: snps,dwmac.yaml#
@@ -219,36 +232,94 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun55i-a523-gmac200
+            enum:
+              - allwinner,sun55i-a523-gmac200
+              - allwinner,sun60i-a733-gmac210
     then:
       properties:
-        clocks:
-          minItems: 2
-        clock-names:
-          minItems: 2
         tx-internal-delay-ps:
           default: 0
           minimum: 0
-          maximum: 700
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            Internal RGMII PHY TX clock delay chain value in ps.
         rx-internal-delay-ps:
           default: 0
           minimum: 0
           maximum: 3100
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
-      required:
-        - power-domains
+            Internal RGMII PHY RX clock delay chain value in ps.
     else:
       properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
         clocks:
           maxItems: 1
         clock-names:
           maxItems: 1
         power-domains: false
+      required:
+        - syscon
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun55i-a523-gmac200
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        interrupt-names:
+          maxItems: 1
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+        tx-internal-delay-ps:
+          maximum: 700
+      required:
+        - power-domains
+        - syscon
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun60i-a733-gmac210
+    then:
+      properties:
+        reg:
+          minItems: 2
+        interrupts:
+          minItems: 4
+        interrupt-names:
+          minItems: 4
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+        tx-internal-delay-ps:
+          maximum: 3100
+        syscon: false
+        power-domains: false
 
 unevaluatedProperties: false
 
@@ -412,4 +483,33 @@ examples:
             };
         };
     };
+
+  - |
+    ethernet@4510000 {
+        compatible = "allwinner,sun60i-a733-gmac210",
+                     "snps,dwmac-5.20";
+        reg = <0x04510000 0x8000>,
+              <0x04518000 0x1000>;
+        clocks = <&ccu 58>, <&ccu 59>, <&ccu 60>;
+        clock-names = "stmmaceth", "mbus", "ptp_ref";
+        resets = <&ccu 30>, <&ccu 31>;
+        reset-names = "stmmaceth", "ahb";
+        interrupts = <0 175 4>, <0 179 4>, <0 176 4>, <0 177 4>;
+        interrupt-names = "macirq", "eth_lpi", "tx-queue-0", "rx-queue-0";
+        pinctrl-names = "default";
+        pinctrl-0 = <&rgmii1_pins>;
+        phy-handle = <&ext_rgmii_phy_2>;
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ext_rgmii_phy_2: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+    };
 ...

-- 
2.53.0


