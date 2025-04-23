Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF8DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=; b=1Bv4cCoAIukgA/qgQqo7a1tTAS
	p6m6tB6mMPJZ2UjOjaGLqrtHzmNBUBudtkBk/qdMx9Tw7v7rWAG3FiULVdBUmB+sf0yDdkoCBO437
	tvjRzKSYSL+RXLkPP/NgkBcNo8nslo+dmEmXPZijVya5aARRyyyV7uXTj9duYyYbtcxcl2eupOP2p
	nugY+0o8+QngLR/Hs64fsufwUOQAarWp9e+0dMSL3TWRF/me2WhajOAu2MdgUqTY64FZOvubSg67B
	wLBcOnQWuA6gHxywFeZBmNjoOIxBxFSdR52n149KJCIPBENCwzR8qQ4d6juo4couzP9E0WHyhdR+R
	FEZq058w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Thb-00000009M98-1S2Q;
	Wed, 23 Apr 2025 06:35:23 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCa-00000009Hh1-40tt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:22 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so10226835a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388199; x=1745992999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=;
        b=mUy2u4qundWW3A4JYWEE2yrlcJ4JGGqh7/NK7Hq10W8p9TXmfLHNl9wL9ASvz6BPS8
         N/ZXdoyAokuLJDdmknWc0otTO088iu/S061EBCcHLFbdoaHVWecEQEgKQqniqUzNQFPH
         CKbEqw1W094gI1Yy3gZ/g2caDXLa30wkXOcdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388199; x=1745992999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qlcrl/s66F8iW4Dfes9I7PvLNwTvzV7zn6ge9EdXk3Q=;
        b=FP8EIxp1Ad8YoEr2XjguuMJwuOIUDtFdrG26W6p710VVBnbQWJIt6iypWIsQ07QBdZ
         8utoQkxp4yo87kZ2rkan60Xu30NY3NQ9lxqS3EGWWiuUca9TKwfqjksPoFZzKdSgA00y
         zZ//jY7kgBcZdrbgS6nXZu463WYezOFTgeSYMlWYwPQTfSM0xW7rbTLIafmlD342kF0u
         WPA6BbxBFnOHzacxf3WIM3JOdCy13XZln+BJeo1HJXQM+1AFTkXKug+hodu87iVOI8yK
         wWc7e41rcOHZ1sO79zXgytnEhag6v2mjm25PgdgoXEgWPrw7VD+lIHDyRXDCGxMcsfCw
         S2LA==
X-Forwarded-Encrypted: i=1; AJvYcCUjD69StX+SQ6XrMaK5qxbhWDcd9aErm2u8aDQ13yH4DOhsr3UpgyAcxG3/IsmI+rayLX9fluyLM47N7/78X4k/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk/rI4h4dSKXt0sxDvAD2eGUwAVLhiiGMfN3kta2azlOANXMj9
	2z6/LE2sbER3kSYMcUud92axTJ7afGjomByegdy7UCUhb1G0tPRvESJhoz28dP0=
X-Gm-Gg: ASbGncvZMu10O3D4AMIUneTUn13jShw7kz+6qAdISkWF3vqnfgVPFXJXej+dY9zrIoc
	8m7tZ0eLUD5NWk5iM5fNr9x4VTUsrfz1u0pzIDwzpoL1k3tCCKjD+3WP74ux3J128BS7rLzZDxT
	rfDsygd0wWcGAn7E39BIyFt4e/mEAOqBJnUptorAVFPPvuFJTAKag3w5/UKadwl1EDBV4+H+/QL
	92RU8eDySq7y9S/d22n4s0FDu9H6lNTCpjKfJdceraA7mW/tlhMquF5KWy/X6dP3OYs4HT1Fpuy
	tRu/LfPNnurt99up16MJotTLnldB9/7G9cNo689Z/G47OqT90SlPc15GbH1uzHJCRP0Yh9xpmso
	59Wzc
X-Google-Smtp-Source: AGHT+IFXK5t2CjXs/VSaGgLG16geNEJEoOfNTY2wN1N5E9kGgqXmwH2XgsdysdftJFFBu3tzrfnH1g==
X-Received: by 2002:a17:906:c154:b0:aca:a162:8707 with SMTP id a640c23a62f3a-acb74ad9629mr1643817866b.7.1745388199239;
        Tue, 22 Apr 2025 23:03:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 15/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Wed, 23 Apr 2025 08:02:32 +0200
Message-ID: <20250423060241.95521-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230321_000976_641830B9 
X-CRM114-Status: GOOD (  10.30  )
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

Though adding the PLLs to clocks and clock-names properties will break
the ABI, it is required to accurately describe the hardware. Indeed,
the Clock Control Module (CCM) receives clocks from the PLLs and
oscillators and generates clocks for on-chip peripherals.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v11:
- Fix conflict while rebasing on master

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 4fec55832702..e83f08abd44c 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -29,12 +29,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   clock-names:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -93,6 +93,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -102,20 +106,31 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+            - const: audio_pll1
+            - const: audio_pll2
+            - const: dram_pll
+            - const: video_pll
 
 additionalProperties: false
 
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
         #clock-cells = <1>;
         clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
+                 <&clk_ext3>, <&clk_ext4>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
         fsl,operating-mode = "nominal";
     };
 
-- 
2.43.0


