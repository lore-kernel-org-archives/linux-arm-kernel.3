Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663A5C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXK3NWYi082LyOZjH5CFEpjpWT9epWTpuRaVAOKU4cw=; b=Sp7DKXfYmvggyMDkZn+ZH68NJP
	nQwWRQfeHtaFuCjOJE2I+yUMG3Suchrb51kI9QVPH2Px8fYwEaS91mgrlWeWENe2JIxFoBsoWBwvQ
	Lp5cOTHti2dkyVmI+/vKJcedDMVde4G1uXaD51FdIQofJiRc2b/HCGQSX4Z/90TbO4kQEL7UNlBLF
	MV/tTgWEkKaXlYQ4zBGmhax0HpckK5BeODIhV1LSjDBav3lVtuKWn1Q6BuLSpulMxC4DrEqOtN/4y
	kLrW5AfjbirPwdpTJE47guuGMdYY9TuKC1WD5reKJszKTNizWGfAkEMpAeOZwolTvYdHa0s1BNARq
	qQWsBEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq8Z-0000000D8MU-1zbg;
	Fri, 31 Jul 2026 16:31:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq8M-0000000D8HO-1uOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:30:57 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47f7872abb6so888936f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785515452; x=1786120252; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXK3NWYi082LyOZjH5CFEpjpWT9epWTpuRaVAOKU4cw=;
        b=DuDG3kLvsdC1DerPARtw0oa9CSK3wIHGI4p97WlpxUM9TfAJEKkQmFrEjz2gTGmwMx
         1ehj110GzHyJkDrqry3X5jMDoWPzUPN2CBPPxK7iSw/CJfIjx1ww55xvusMwiXlJS90P
         ub0Dq1RNOiUOi/+tO6veOp/wubtdaehrHS7LOA+Dmd6g8XtPJgncSHAszTd0IccKB1vp
         fA/uq4z0pZXdLbWt76jhDK3Bf87TlLln4PY8hRKIuk+96xEqgbO6xGxlRrHO5XEfzl2w
         YFbkcHlfL362+ooMAtNpnMgT48RNDy2fpygmTnD7zAZ97i0OHe8WZ34dt4GGPiaWhNge
         oirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515452; x=1786120252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXK3NWYi082LyOZjH5CFEpjpWT9epWTpuRaVAOKU4cw=;
        b=HSq63ISaysgaEhdDFlVhzDo2ILtBU/On8sPD4lW16njfxHmBO+k13yezpDZCnZv9Re
         naDvv3hqGIsDYSCbCyNg2qG8oAWVKtXBrIABe/9FBDLU0P0ek4HlUuuHXlG2caMDgtL7
         Y5jY9/7dl+EWZNbKxEqLacSceWfrdtsGWyR0sD0tUG8OK+BHLrX03zVoPFUEfgKSVbiy
         vN1JNuxuZ3LUkBdY+4jzVJ34mUNgdhkc9cZV7Lq5MwFyFq0R6MK8gQj36f6QCTG8Qw9e
         51qw2DGnbi8tRvGqV41+TsAoQAQn3pkXSfrRkBToJOYbI0s+0YnTKp134Uz6CrD+3TYA
         xPtA==
X-Forwarded-Encrypted: i=1; AHgh+RrIy5Zze37r7c6hx/yDvMcceR689ojsi4SglE2i3UxeeOAtPCdJLU/ompdVw75NGruaRraHv/5Vwb0SwGgzUqH3@lists.infradead.org
X-Gm-Message-State: AOJu0YxRBvZtEI6s2utPDiZtGTSiGoi4w1N3mFOe974fRTCcU5ew0uH2
	KRGbAZHQe+0IoSrwhElrLJjQJvaGjmxjUe9urKvt3Yp4L32Da92V41FFY3TL0sTol2o=
X-Gm-Gg: AR+sD12uMZlkWc1uUjsxteUSzWaPfCdcrkm7/Mi+3epRmwcXYFIctBhklwfA8rWvsLV
	OOavj9dEpba9OualB+w6NIQ4NFo44kxEiOzCQHuvXQDBcUw5vG5P5W48Md97NrxNTyZCUHUBRCX
	UXXvO164qH3zpOY1hbp3RIMr8jahQfGrl6bpDetTrL4K8+saORnIM8Jf9jNVu2q8v3u0K61UDEi
	BmkA/ETVQM2w2+SMq6Tpal5Ey25CSFUUXAungb92EuBB9lEiUs6iLN0kLsM+27wMyGb0JCFUfvy
	MSVKCd6moQyLh0bffIe0Bkd5jNQVqTlr8kwengM25SYIyOVRGFBwXxdupqaxBpurcQmp/g8hXfK
	53bDd/YHm4hfk2gFddpDPPA+uzIalypiNyhO99BABdZJ1x+XsXZlsdu1iKHJDFSJvsN5lrQPMP5
	gjgjpHBRZLKcVS9OXvUFq9OjBtEySYn9CdJb4qo+LqLduFNNZOnceXMTwIJQ==
X-Received: by 2002:a05:6000:983:b0:47f:8f54:125f with SMTP id ffacd0b85a97d-47fd72a9038mr642064f8f.7.1785515448372;
        Fri, 31 Jul 2026 09:30:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd41e296csm6513850f8f.12.2026.07.31.09.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:30:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 18:30:26 +0200
Subject: [PATCH RFC/RFT 1/2] dt-bindings: net: sun8i-emac: Add A733 GMAC210
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-allwinner-a733-gmac-support-v1-1-d0a8732bfa82@baylibre.com>
References: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
In-Reply-To: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6093; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0KxQNfxHtgxVP7p+J7kLnmloyIjqtkqU8bi4/9D5Pn4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbM2xquVAc309vSgKPGdFcjh7GkmzmsbHShAaG
 2+Xz5vdSoWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzNsQAKCRDm/A8cN/La
 hVYjD/4h49mYaowx0kPXeu4N+tawC2LKn/y5trYsXdnPdHmdfzHZtHE1sbRZCKd4zo3VNEpCkUz
 3ZEyvd1719+F3UGAqXAndBPgq/sN0WCV7/9y6m8XRfeJWGXcljWdJKIRPMme3g5XzvoyGUDCPAn
 aQ25LXLBhtvnGX5DXbWYSLrYr2lPMu6w1ZxqRMg3eBfZbOBvnwljx2Qv7GDAHlIrvGb3Kgj0AsM
 FOgHmSnW8iSWx/NtDXciYBKu5P4cgv+c20KktVmdANY27RVQsfkeb/ozqs972CE4uTNBkuaEMB0
 ygkCAj2lRmHFKpVxapgG9YD4/UE5zwxVzKQaAzLHOjwVazmXCWdB9tPTUoyaAdAkkTnyqdoEail
 k6iP0hNqNcGam9TmyMkEJkNaHOdswDX/D+H6bHN5lBeUzEoz1AHaAXZi/iDauKKV3tooyukOuGH
 nB2hz5KVP8+VG+vwRZTZZKLsXQQM8568MopRMKciRUtT5HLwjRItUVwVpHwqlmroVhRYyYfwCMu
 49z8l+11BmRDapU7WzzqrQXCoTfTpsTvHwUu18vrpQYAJbnUnkS6fRKbG0l3Hv2DiPncxZeF7Y4
 xma9MDf3jBOllSMS4tgfuAK60M+ntQPUI+mO7GkQdc2RO6qfmwpYuqR5FccHOg2MZU6H0CxAQqr
 OgQSoMmlrTaSxNQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_093055_580656_D01B39B0 
X-CRM114-Status: GOOD (  13.46  )
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
2.47.3


