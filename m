Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763E0C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75t1KQGtX7DtR0KwXgxMTDEvGLkyel42aN9/Vltyf4E=; b=foJc570zOMY1/27rUSf1Iswtd6
	PWITZg6C4Q14ekbEpLUr0v/yKL+d/FHDu6a7g3wikwVq74x0HP1XDYiS67mYkT8HQjzB92x8Ruvqa
	OFFhk6ePWQh6IXekwzgstdqJOPcJJUcoOCUv8Mx3o0OoCozJ0plUkelzhVYDMgNrU3p1xTOGajzVB
	c7xRVp9aIEI9YHht+yV58wG174+yxz6yYyrgcq50aVY5dSL6e/LSLaOX5lfSrmv7mSw1I83eJ0F8b
	fbhUNyTH/fGfZrtEFS29c6G/O4j+IvIuvS9MljbQwpWPwLbw32vEa3MBUOLYbHMIMmDpRqacj7e65
	bf9/df0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyaS-0000000BIxQ-1NmZ;
	Tue, 27 May 2025 17:59:40 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyXJ-0000000BIPd-2NKg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 17:56:26 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3dd87535709so3358225ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748368584; x=1748973384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75t1KQGtX7DtR0KwXgxMTDEvGLkyel42aN9/Vltyf4E=;
        b=kSwR5j7ujNCszCaGJAyrLoBYF+0EhHapy97NDV1ZguXwkXSE2F3TDqiPEhCiFKn4d+
         CsHzXUYYzMfIa89ZqgDvoD0aPyVcrBynlKQwdR4y6injNL/3rSwsGUxJLq6GxV2ZJSJW
         K7+DCg9WWgHr8KqAXIDnTG50t1hKGSzqOkU2TDnuj9pDwQ0zAJ3woRyubZNku2WVJ9P4
         qmY8gZSH5IfE6zyWGRxEMwxOWgBjvdCKAGKksOnFMPbjV5kCkq2DxupnV3EFmMDhrjfq
         AV1xk6ECs2sCpVtgEcVWsl14g9KKhXeJcIYobmFcHrEUoqR2VtMg1FpM6IIn8FDQJ9jd
         4v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368584; x=1748973384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75t1KQGtX7DtR0KwXgxMTDEvGLkyel42aN9/Vltyf4E=;
        b=Rf+AF86r2gIfgcZAOnnElCuuf0hCiuHNbu7mwmUqRJEULua+XLXKysw/RB2drg/dD3
         vM2wBiuHFP1LWeZaED/KWOK63fJ4cDxYW97O8TOd6rMgi3WmWkLwvEpnSbzerntwxSQw
         Jw0gSYLJPcETyWXnQiyo5rvFa+Cgta5Z7QeX+Gikq5RWbFf2xK6obYHn8BN7b0a4IJUh
         WvJD6roeSW6WPrMu3nSi+3QeGbgpllkKiJJsp9yV+j14oh0XteNoEGfzi+bTpGDAYTf6
         rGcmwJoowqyuv0CpJoDGtLZub2/ctktVPpumUF2UcyKOwyDP75gwOdukh1ISZOz3tfwC
         1vlA==
X-Forwarded-Encrypted: i=1; AJvYcCXmPjunZR9P6abebbsv5Yw9ISqjgLxSExTft4sl/h2uh0nq9g8AO015ODGnKH5CdYAEfKsTEXs4TTq03kJGQgLL@lists.infradead.org
X-Gm-Message-State: AOJu0YzUN+r1v2Zge0qdTl9namJWlGHSamWPmxT8QvrOoOqV4ueg2NE/
	LfHvssN4+qQCkY3BV6XZchV4t57TFTdHejYjNtQugXgoDV/zsxk8X71DM8e2Mjwwit0=
X-Gm-Gg: ASbGnctRK05RHBWh4UP+kxwHfkWMtP6+RuMA1X77rHgfTy3kKvWV7GXKsgBc4HGVp5e
	qPZKDYNwxyxnxkrBnVc2ExfMi9TBYszCK9KuZ9SjQQRlWhFlSyg6rHzgZm1Q0g4EVdFwnmwBbb4
	TMLREL/Ren15c+ORdS0ggW0Art22utxLNTykv0A+Rqoe9fKg386E5t7PsyOQ+SrVtlumuMRnecQ
	1Ayh9SD7uvfgKDV7Ex+gI0lQ23LSvNmKgkiWR8WlIPKPyjrmB3P54VsBFkqY/bxQbIdRT8WVKES
	mRQIfr8DE4LSaGdbDF/+INvUArvK4IoEsC+VbaeMljGJXgjomQgCb92hDNRdBvKB7TRbbs7P1jW
	3A3Lgf10+KatDudt3fdetC1SvX7q6qA==
X-Google-Smtp-Source: AGHT+IEG1Ty/l3Gh00PtWxsgabl40eUie4mjzIcYjsL+B8so87NPY18sPvIj6HQRx+VZNV4Xgx4J1g==
X-Received: by 2002:a05:6e02:144d:b0:3d5:8923:faa5 with SMTP id e9e14a558f8ab-3dc9b6aa36dmr108298815ab.10.1748368584073;
        Tue, 27 May 2025 10:56:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc82e014f4sm38082275ab.40.2025.05.27.10.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 10:56:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	James Hilliard <james.hilliard1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1 nvmem phy selection
Date: Tue, 27 May 2025 11:55:56 -0600
Message-Id: <20250527175558.2738342-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527175558.2738342-1-james.hilliard1@gmail.com>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_105625_607753_58A95386 
X-CRM114-Status: GOOD (  15.44  )
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

The Allwinner H616 EMAC1 can be connected to an copackaged AC200
or AC300 PHY depending upon the variant.

Add a new allwinner,sun50i-h616-emac1 compatible and example, support
for the allwinner,sun50i-h616-emac1 EMAC1 MAC will be added later on.

Add nvmem-cells and nvmem-cell-names properties for the ac300 efuse
based phy selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix dt_binding_check
---
 .../net/allwinner,sun8i-a83t-emac.yaml        | 75 ++++++++++++++++++-
 .../bindings/net/ethernet-controller.yaml     | 26 +++++--
 .../devicetree/bindings/net/snps,dwmac.yaml   |  2 +
 3 files changed, 94 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7fe0352dff0f..3a8c31dd9ae7 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -18,6 +18,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -58,7 +59,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - phy-handle
   - phy-mode
   - syscon
 
@@ -73,6 +73,7 @@ allOf:
               - allwinner,sun8i-h3-emac
               - allwinner,sun8i-v3s-emac
               - allwinner,sun50i-a64-emac
+              - allwinner,sun50i-h616-emac1
 
     then:
       properties:
@@ -189,6 +190,42 @@ allOf:
             - mdio-parent-bus
             - mdio@1
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - allwinner,sun50i-h616-emac1
+
+    then:
+      required:
+        - phy-handle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        nvmem-cells: true
+
+        nvmem-cell-names: true
+
+        phys:
+          maxItems: 2
+
+        phy-names:
+          items:
+            - const: ac200
+            - const: ac300
+
+        mdio:
+          $ref: mdio.yaml#
+
 unevaluatedProperties: false
 
 examples:
@@ -321,4 +358,40 @@ examples:
         };
     };
 
+  - |
+    ethernet@5030000 {
+        compatible = "allwinner,sun50i-h616-emac1";
+        syscon = <&syscon>;
+        reg = <0x05030000 0x10000>;
+        interrupts = <0 15 4>;
+        interrupt-names = "macirq";
+        resets = <&ccu 31>;
+        reset-names = "stmmaceth";
+        clocks = <&ccu 83>;
+        clock-names = "stmmaceth";
+        phys = <&ac200_rmii_phy>, <&ac300_rmii_phy>;
+        phy-names = "ac200", "ac300";
+        phy-mode = "rgmii";
+        nvmem-cells = <&ephy_acx00>;
+        nvmem-cell-names = "ac300";
+
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ac300_rmii_phy: ac300-ethernet-phy@0 {
+              #phy-cells = <0>;
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <0>;
+            };
+
+            ac200_rmii_phy: ac200-ethernet-phy@1 {
+              #phy-cells = <0>;
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <1>;
+            };
+        };
+    };
+
 ...
diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index a2d4c626f659..710e651851e5 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -45,14 +45,6 @@ properties:
     description:
       Specifies maximum speed in Mbit/s supported by the device.
 
-  nvmem-cells:
-    maxItems: 1
-    description:
-      Reference to an nvmem node for the MAC address
-
-  nvmem-cell-names:
-    const: mac-address
-
   phy-connection-type:
     description:
       Specifies interface type between the Ethernet device and a physical
@@ -260,6 +252,24 @@ dependencies:
   pcs-handle-names: [pcs-handle]
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+          description:
+            Reference to an nvmem node for the MAC address
+
+        nvmem-cell-names:
+          const: mac-address
+
   - if:
       properties:
         phy-mode:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..a6dfed00c48f 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -56,6 +56,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -620,6 +621,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac
-- 
2.34.1


