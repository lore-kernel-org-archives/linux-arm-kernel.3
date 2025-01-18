Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F0EC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=; b=Y92UObLiMaWqsohJ1G0gwpjs8Y
	hMhOERP8R5mcDsQHJhHZaQs6MxfYUcUEY0CgL/py5FbUbVqaiZvdhYVgZc1YDZl418P8CKcVKndHb
	lGMciXaWHJbkXjt+8kOw8A+zjsa9zebQRGLbPMO2AEatMWicMmg+sFB3ugtGbFI8e8f5l4DAiyObf
	IJF55Cn29aI/2YQmtwF29gIyPuvJuXA51CN/hAw1on+nPMzeq/UvDhxcclUkcMFlT4VbG/3XBmZ3w
	wXMvH7iNIRrfGl4+mtfU0ILGG4cDF0Eqnm0sS8MGmqm+Q6+om7vbvHWXs9Qpo03YdJ4zbxpMeOAon
	ftm6AD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8OQ-00000002PtT-198u;
	Sat, 18 Jan 2025 12:57:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ88Y-00000002NDI-1AT2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:41:15 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso517021766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 04:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204073; x=1737808873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=hRsTtOUNAuWzizyCSk3b/soBLpjH9/V8n3fuuRpl9SR1NxHrOq64Z2bEMKMrMb1Zjq
         DChNqFSDNxanFYJniw50oqyAAK/ZbwmH/a70nPji+uRedtqs5ai6Q67uYVGdMwOr4C93
         HgJtZN32pLwb28qFJezM/zzlH55eAH+snmeuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204073; x=1737808873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=l00ZElLIMIxK3VvmPyJCSGrhShMhovEdmgnwkLgSLAc50ZcICbPaZ0n1iHeiOSzytN
         Xcd5w+B5IP5NuB5hMCCcAGTBU22uL0e1eUZv2AoCd+eGoSR2cP3BbD1N4SATeawoY2g2
         JQMebGOhPsBktGHgDiZQYWQOCVsQ7d/oHJsYlYdVyFB1ZNHsvioMaseBGXt7DqNivyCR
         ObwG1YBkshyjSUEV0DkFSxk7bc5KfZHruK5MtDVZCFWy5RMn20Hle2D7KXAED6y90zzD
         HwW8lOwXjwmYy7mtLBtRh1Fip+i8zdO85J42BqrKOyrsu/tnNf2HEOwyMRCom79qEE4W
         frIw==
X-Forwarded-Encrypted: i=1; AJvYcCXVWLfB3VxWMjNkbCBMWSXTk9ktRKJTsrfMeNqPzvf4A5h/YINSOyHCehStUKrmI/602dkvq/iu2PcNq8L9gQ9y@lists.infradead.org
X-Gm-Message-State: AOJu0YxHyzZkSD6hzg3u5q2c6NWgGlMI/GSn2R8uNqnqPd7dcXBwcOPE
	OFAp6lJLmWhXTVaaE+7zGz7NOIVz+0En97cI550ysxSurOzxL8SGYhtePfISVSk=
X-Gm-Gg: ASbGnct/G1iP53rA/pKvd1AGluG1O0AhVKUwFOqaDx6DjGVvYLRSx98ZAclMB0POxAy
	nxBrukEQPpObTR+xWeM5eo/Ce/z/Xv3OuvoTLXYHfLyHr1G7NvP2drjmCdnWekGK9uANWvo2B29
	Q/XsJRceBAV54NBDZJ/qkQAe+ukNLNVBiguyK0AM0Kzye1cirKaQFysFFaoVYrhaAi6u3C3Lm3x
	bNOekSTUA8O/mRG/31VxITK22EtGazB2UR9uHVRGnRZiIoT7NvDepOKyGwLFps/cF6k3yZmwJBb
	k7LltP27FQOI3eSU/DF/xZueh4K3fN82D35MiB6MQFQqC9S/oUxbyS6NvIqF9bHhbblOJJsiRUo
	jnFtwJDc0WqVljZAqI+lO7AAJzUHBTPmZVeRi
X-Google-Smtp-Source: AGHT+IGaQfD+XOUXbE+BkfgW/kdqk8npbiYgJKweh+ryekNShXVP8/4p8gDEZxKuRlimfmswkORPdQ==
X-Received: by 2002:a17:907:3f28:b0:aa6:79fa:b480 with SMTP id a640c23a62f3a-ab38b0ba07fmr581216666b.10.1737204072939;
        Sat, 18 Jan 2025 04:41:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 12/23] dt-bindings: clock: imx8m-clock: add PLLs
Date: Sat, 18 Jan 2025 13:39:55 +0100
Message-ID: <20250118124044.157308-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_044114_348847_B26B0DD9 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..d96570bf60dc 100644
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
@@ -86,6 +86,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -95,20 +99,31 @@ allOf:
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
     };
 
   - |
-- 
2.43.0


