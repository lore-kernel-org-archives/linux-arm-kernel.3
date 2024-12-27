Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEDFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+kAaC1AoQ98ph6jwnNcppkKlX4Rs9Hgex1b/X1iVho=; b=lvaJ+Yy2AF5Wwn8+lqvuWoZkJY
	eZGaENy+/rLULlNkhLhmi4cdob+kODAY3iHuAUTDN3xn3Zifl25wrARLfKHXHJ+VMDQtfxI5l/hwT
	wXh5RVwZSHEzYweOcBwP3yCBI7oP+PUGaiYbj7joB5OhB+rOE29yuLgxBEztIP9W0ul1R6XYfHiAd
	mwvlCHR/wDd1ql9uWaZ89dxiw8FHPFT3AKo9rzbqrDrDy6XoF3PYUnYfoqn/pPL5xcD7CVLAXu0ej
	BRXmpKjImy5O3QRMzQq8YXCajhlkx8mvqgfnSe6XllGZzPHr5fprP+FUQRPwwRa7zixyHB/PHFKud
	6NAYc8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDyu-00000000hbX-0SeI;
	Fri, 27 Dec 2024 17:18:36 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDeq-00000000eaS-3zhr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa66ead88b3so1373440966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318672; x=1735923472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+kAaC1AoQ98ph6jwnNcppkKlX4Rs9Hgex1b/X1iVho=;
        b=ROs26FDSONq1KQjwFNtGsNHBSEm2LXjKrfID+ZhNivaAU1Lch8ud6u2HTOPjvld3CI
         jrtWl3aj4/SME3eGLmklxvyoQTQvU2R5I0AvUn4KD0HNZObpZpa9W4HNKKAqbIBoJrfP
         06L9Cq0d6B72EOkFE5GBjTQ5lM8vN8ExStx4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318672; x=1735923472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+kAaC1AoQ98ph6jwnNcppkKlX4Rs9Hgex1b/X1iVho=;
        b=PVlnOOgTjGhRatbDwQEWRKirKC5MBC+WH2jCWxPuSbMbXybzvsB9CAUbi9fc5EQfsq
         QtpZlp14qK5mJZtZLoOvV8E8oihezKI44DE/W3uKnUZW1r4Hqwb42o6Gqg9Nwy8detzI
         Sq9BN22rGiKGUIqTX4b3pNqooMjnqOBChrdgooYwFPkTjwhv8jesTRWvgnxDcQFanc7M
         DqmAU87bNvlSTxlDNS2XL9VRTvD1oHb/b6b2A7u9GjmKm1OkIK5RG46aYOcSZj1ALK+6
         L+vEHjjSbBkIuZgvA5z9p0mBIiIoaOJfAIxlnD1t18UPF3Tu7YllP0gHhUr6CYB0DNKF
         CrRw==
X-Forwarded-Encrypted: i=1; AJvYcCWGSDk6NqLCgEcZPUFGKhKz9E32P4RoYjCOG+QT4/AfAHCO0IZqYB7YM+hriCeiqEg+VPsOInxy5P1DGFaDipAc@lists.infradead.org
X-Gm-Message-State: AOJu0YwXSYcvcBYnmdh0ZWj1TmKeGMfdH4AfhqsNYPhdJ8YHSH4XRvUN
	cqGMZltURawyOUYTUlyqml8UhKUC69zlqOwh+3/UmBuaXlzjELMGulYbYVFgKOk=
X-Gm-Gg: ASbGncu6VmaG4p3+e9IzjK/qUS35Q74XEVkxt1aj0OIPW70ZSIJOVMlgKJ/w+81Ba26
	9A/+BEZ7GrqXQ6Y5u7TK3QuqsBnqJ0PbB1SRc+ePaore/KdP58g9fB9XBOi5TWnPDsan5PnypyB
	gToG4cq9T55KRqsULVztupfibegO9JUWw+9NDD0otnXOYkwn7ThgBf5mO4Z1tdp72g46c76zgj+
	NlRg9IH+PW0khE7TxSY4nv4I2Db4aABIauS1BPTJw9gYl2d59IgzqJnr7gGytvP6ufPBEdRIf7e
	lWg/dCGRTvXY3ERCTTB0kw==
X-Google-Smtp-Source: AGHT+IGpyzrWcBX65CdqI/PNJ/Mfz9DLZVEv6Ofyawaq/nCyclfh2gsXwoQk11JSAy6/krhgua1Pmw==
X-Received: by 2002:a17:907:60c9:b0:aa6:5385:90ef with SMTP id a640c23a62f3a-aac34404937mr2534593366b.61.1735318671648;
        Fri, 27 Dec 2024 08:57:51 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:51 -0800 (PST)
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
Subject: [PATCH v7 17/23] dt-bindings: clock: imx8m-clock: add PLLs
Date: Fri, 27 Dec 2024 17:56:20 +0100
Message-ID: <20241227165719.3902388-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085752_991591_305B0D7D 
X-CRM114-Status: UNSURE (   9.65  )
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

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index b23e639e6389..eb2e6e702de9 100644
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
@@ -94,6 +94,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -103,20 +107,31 @@ allOf:
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
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
         fsl,anatop = <&anatop>;
     };
 
-- 
2.43.0


