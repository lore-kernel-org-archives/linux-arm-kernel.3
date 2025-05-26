Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6648C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULjqis0u87KSpipZTk1NBKJD257/ZcSGIbJ8awB7PCg=; b=S70XtOWxxRf4gQ6m23pU5UY8nI
	abWVnHe6Sj6470cVbIQAzSwV/I9HLOPH7GxtpPuTEWLUvk9bEgRN3xPNwMMgQuHZIPr2oOsSc/GnI
	t39VX2otLuXFLZQ782vla4WchYYf54h0Tkk5IOVsohiETIkmxgSRly1QIYg7RSGoXZ77MWC3Kv/z3
	g+kRfJ/t5v4q4triJpyzdA8Sp87oksbP4ZLkcMmYh0fBLQcn4GpXBsW+MaARkW6ry2Z/fJkDelIGB
	jA9Id9NTLVQEfpoiW+IGaj74B58vVZIjLdAi5PDkIuZW2fRYy/UNvz+p+ngP7yxcjpFq9ObaV3X5P
	d4aTGq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJcgq-00000009NYj-0O59;
	Mon, 26 May 2025 18:36:48 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJcaW-00000009Mll-48UL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 18:30:18 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-85dac9729c3so191383439f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 11:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748284216; x=1748889016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULjqis0u87KSpipZTk1NBKJD257/ZcSGIbJ8awB7PCg=;
        b=NQPMJ7bG/xdSGIEh+cyGJQYY5Zv6Sok67rsZjdyOWm9XSeoA7LwvZQh4usCZOcgMrY
         84A+uCI3B3a1gH43r+K5cA32k50vJpHdL8RR6kIhCSch8CMlUtAH6VSuyQHPUTjXuJCO
         B/Mv9S9Is9yLL8kP1k3fpjEBO2UqSWRPNqEKQTQrjJBwL0ovI20biu36PksbJYXjUtBh
         9pxBnXTunmHX48qaZuYzW5+sEtOMBPh4MmLcOQRp9ahSvof4zzWReTf/JOzO13qIwSow
         MVXBk9ikJz5GKiSXizD43qqzFV/rRz/Lme66hcYX5S0oZuXNAAK9smQxmLQ62W7Iea3F
         YXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284216; x=1748889016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULjqis0u87KSpipZTk1NBKJD257/ZcSGIbJ8awB7PCg=;
        b=F3tmOweOd6AlkaC+OXfQM9+5POJa8ee9YElatF20J6SvWxsYAH1IK7/jRVtTHKuyw4
         hB0jC/alX8pG0IJ2ZS38hIsdDMq5TXvXAGd2HE3ngE4g8N6l/lkAoB+UCA6vqPvpqkF7
         DMKSEFKct9oDjWItn8J72OdTdeQQ1dVbUC6H3/iWRAewU5pvj1HTLsN5qtvWn3YcLkP8
         hQuH2Zo+h8EtY0yw3xkaci7yVcmP9zovyFawy4XK3bfgir+kPqLbGbui5gY/hIeISW02
         fKHzir3+TbdPF9cH8RsufkViw9TL+DIfUVTfd9/j66TDpW93MImBpZycQg7zH8ljTTRV
         yxWA==
X-Forwarded-Encrypted: i=1; AJvYcCWsoo0y1bK4SKKp4H4Lq+4I80f94z+PRYPwlkft2ZmFEd6aXw2DfP2tdVBtsaza6Ci7pEHAOhYv9FA242H6CAfB@lists.infradead.org
X-Gm-Message-State: AOJu0YxU5VRL+WMCFnQ54Qw/LbLdmfbknCbsC1sHJoHBeHlPvXTiR6Qf
	yJjPTnKqcXUkmWI+9lnycoBVEOYexyegy+hwkbOrMmRiVqadWdADmdl1
X-Gm-Gg: ASbGnctmIH3k+766dA7G2wB5aBV1x1fpUmO+PzumKOppdevykFY+TlVlGPAU5ST+ckA
	08OOToiTrW5hES9DTaL2txt0JR/DFny2kn7F7yXOGUqTuSv3YoFwDpuZ1A3Fj8lq7RSEqboNOrn
	oDbBaG6O07Ly41SrYpWybbeXf96RKRyM674Kv56TXaTZxKb4bQVoQldmSBgzAIaXoNE2utfLu6P
	LIXODyWQkCPJMWOIxaI0n+f8Ak1+fvPI4PXKOpwUOigt9l8poIDZnDtvnO85+6gmdtP7K/fP3yc
	oihHykEnLt3cAxKgO4cMWkkozDn2B+ochB6QhPEQDNayAfY7TFPaL0eziTNjmE1iSRGParTk1CP
	hunPDhIpJS3s3W5dNuEEu+iNFFMt5SA==
X-Google-Smtp-Source: AGHT+IHNnI4y1dgkj56msBwfJyexQj/NA4bKNpsudos+JvpD2sSrSNG4qTOxJTKBL54sr41hgUQMyw==
X-Received: by 2002:a05:6602:4a0d:b0:86a:25d5:2dbe with SMTP id ca18e2360f4ac-86cbb7dcffamr1231342039f.4.1748284215957;
        Mon, 26 May 2025 11:30:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net. [97.118.146.220])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235bff69sm477028639f.8.2025.05.26.11.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:30:15 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] dt-bindings: net: sun8i-emac: Add AC300 EMAC1 nvmem phy selection
Date: Mon, 26 May 2025 12:29:36 -0600
Message-Id: <20250526182939.2593553-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526182939.2593553-1-james.hilliard1@gmail.com>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_113017_022099_B98A8B6C 
X-CRM114-Status: GOOD (  12.61  )
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

The Allwinner H616 EMAC1 can be connected to an on-die AC200 or AC300
PHY depending upon the silicon variant.

Add a new allwinner,sun50i-h616-emac1 compatible and example, support
for the allwinner,sun50i-h616-emac1 will be added later on.

Add nvmem-cells and nvmem-cell-names properties for the ac300 efuse
based phy selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/allwinner,sun8i-a83t-emac.yaml        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7fe0352dff0f..b6bf1718dba1 100644
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
@@ -28,6 +29,14 @@ properties:
   reg:
     maxItems: 1
 
+  nvmem-cells:
+    maxItems: 1
+    description: NVMEM cell with the ac300 efuse.
+
+  nvmem-cell-names:
+    items:
+      - const: ac300
+
   interrupts:
     maxItems: 1
 
@@ -321,4 +330,37 @@ examples:
         };
     };
 
+  - |
+    ethernet@5030000 {
+        compatible = "allwinner,sun50i-h616-emac1";
+        reg = <0x05030000 0x10000>;
+        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        resets = <&ccu RST_BUS_EMAC1>;
+        reset-names = "stmmaceth";
+        clocks = <&ccu CLK_BUS_EMAC1>;
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
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <0>;
+            };
+
+            ac200_rmii_phy: ac200-ethernet-phy@1 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <1>;
+            };
+        };
+    };
+
 ...
-- 
2.34.1


