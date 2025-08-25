Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4102BCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4xVVBNbCvZyFgmzMZLUAZ6NjigcGGJxO5YEWm1N1LE=; b=Haxb50lnCvcoZ243UVq7+W+UKu
	zR8CfIf88vV9avOTWyCKJ6BKOfJfy75zC9skEzZJx9ndHFfhy3uazwIRRi3+WQO8/euv154MzBcdF
	thxmYVLlZE4vZx206JxEaXFrGIC55qTA1Cv9rBNNBtOnlNv4kTGHkACCq118NM0NR2SHcvWiqctns
	Jeu9bUrZ96KGZnlwa/AiEvzjtl68FE6RrwBuJbarc43HHsI7ua8cM5ifnePWl4AjdYq1h7xs9OdTT
	MotGCfqVaX0L6lkRHUoR2++zBOPEzRY86pvyTEY/aqdwuzujpp0Xu3HpREy+g6dw5sCaJgDv9ayNO
	Nzn/cD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQJu-000000070f9-0QiB;
	Mon, 25 Aug 2025 06:04:42 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQ70-00000006zP7-171e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 05:51:23 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-70d9f5bdeb4so19056506d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 22:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101081; x=1756705881; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4xVVBNbCvZyFgmzMZLUAZ6NjigcGGJxO5YEWm1N1LE=;
        b=nckGiozp8SUsMHFe8VvyRYefPi3BO9/7Pk4lRF+eIMY3fl10rCFNMDjpIpSHSSe8KN
         j7BopXy3h1ig4tCBgv+WJDrdNvsYt0goLSLlhmaYKx79JOeociFtgrdzKFEpMC+XbSRC
         YYGa98mP7JMSjjo1MNy8Hom6KpWUQdXh4snDxZq/pynIVD6HAcbd/8azHiVbrc6fxa6b
         9glsMUVH8sft6wW6YMP+cyQI3DHWi6bt3iyFr2nVjCvUncDxoj/gBj2juvie6L4fS3aR
         U6dycKkItE82/2FbaJWvxsyYITPl4YEF8bmp8OvoVKOgDOJMQxIq6pxAghzTVOSADoia
         JGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101081; x=1756705881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4xVVBNbCvZyFgmzMZLUAZ6NjigcGGJxO5YEWm1N1LE=;
        b=FJWADY7HaOWbB9scEIvfnmTKfodAYANczzim/nKnHOPUYtEMl3gQjzLzY42qSEZlMO
         y8M6Fu4vNOH0MQ3CYhedTVn8msDeysFKew8Yjv3hdgWCLnFFgwlVxCOIbRaFi5BIhRjY
         zVu901DrqUJZrwmNuQurc9muEn2e+xXm5pKoiqAP8PbWPlxCZhUeKGb1ZIbelaQziu95
         BEIlHDd02d6w0x2MOgkZQsPXMBiGy5hPoeh+976WpTDf1AGcyxhtRl+I1RjUS0+IZRUZ
         UXeVU/epZ7rEW+mmbwzMGIJYK48SXZazIVkdtQ4KZRfmfdWG4NiOYoHPn/lEoC7bBLWq
         yjmg==
X-Forwarded-Encrypted: i=1; AJvYcCXU7V4klvP7i1y4JH4rwp9D5eZEBJk9fux+tz/j7WQjeJk8F1fgVLRNsyVPPBO3+2lMt5xBtGgvW3x+oBMxMR5s@lists.infradead.org
X-Gm-Message-State: AOJu0YxZeFgooU6XLgumhumksgWOwBqjT1I3BZyzu3FBU+ZXeuIUJ0py
	kNBSuKn3kiBrbg2gQdJbQFg3pGIXMQHBm5VxGac/WZ6l2d8JCvLlBnDAl61ZUk5Z
X-Gm-Gg: ASbGncv+yIoLzlCF1lXW5tGIOiTrAFGgNvOae0gMJrjmN9CrvkISHbAqBIG54JEcmGK
	N6Llzv1wGGtgNludtp0tfwW/QwSP+wSTzSRBYNyhLxOFUrWSr8baGaWBj+9kgg+l4epvBb49w2q
	J6C8rT3dI2NWQsaMPWPtsmt1v/YohRQ5uyBxUHP6qldaUJHGvv19rBufk6IppudiLl1FbshdSxB
	wKV29/wm0MQ9k/2AkoF45eXD7SN4kkBXqbMG9lebfp9S27/ZE7hriKq1xCLtgXpe1Y8btfpRlRK
	/h1CHQPFQQRInjF0QbrvHqaTBbiJXllK5WcEIsgadd6+4TGkUSadacb76XQXBQn3yPnewlRPgFv
	erdgTcHfJnIow4p63V1uWBlwi7k4h2w==
X-Google-Smtp-Source: AGHT+IFq1Jb8t+w87/ycZlD1k39ZYjAnFBNdEL1nkS7Ue5uRerNHMkkJvsKWPWp7+9a3mSJZBw4y+A==
X-Received: by 2002:a05:6214:2242:b0:70d:ac93:74b7 with SMTP id 6a1803df08f44-70dac9379cbmr53563026d6.47.1756101080953;
        Sun, 24 Aug 2025 22:51:20 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:20 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 05:51:18 +0000
Subject: [PATCH v4 4/4] clk: samsung: exynos990: Fix PLL mux regs, add
 DPU/CMUREF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v4-4-71d783680529@gmail.com>
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
In-Reply-To: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=10122;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=Y0ZxxBRl7hBkknwka1s15x2LVpNvmBcxzcvftKRpm/g=;
 b=liCYjLIFmRRNjhwysuxkUrfhv7gc8+SYJvbDaFtvIffmfcMtJpj0+W+4PxprTsM5hgB+6wcTX
 lVutLYLS/LnBzlvICefssfgepEpNYljd+bmQryRaqOnO6CaXIsz4HfD
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_225122_309415_931D6A06 
X-CRM114-Status: GOOD (  12.96  )
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

Switch PLL muxes to PLL_CON0 to correct parent selection and
clock rates. Add DPU_BUS and CMUREF mux/div and their register
hooks and parents.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 97 ++++++++++++++++++++++++-------------
 1 file changed, 63 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 9fcdad7cc..d1135708c 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -45,6 +45,7 @@
 #define PLL_CON3_PLL_SHARED3				0x024c
 #define PLL_CON0_PLL_SHARED4				0x0280
 #define PLL_CON3_PLL_SHARED4				0x028c
+#define CLK_CON_MUX_CLKCMU_DPU_BUS			0x1000
 #define CLK_CON_MUX_MUX_CLKCMU_APM_BUS			0x1004
 #define CLK_CON_MUX_MUX_CLKCMU_AUD_CPU			0x1008
 #define CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS			0x100c
@@ -103,6 +104,8 @@
 #define CLK_CON_MUX_MUX_CLKCMU_SSP_BUS			0x10e0
 #define CLK_CON_MUX_MUX_CLKCMU_TNR_BUS			0x10e4
 #define CLK_CON_MUX_MUX_CLKCMU_VRA_BUS			0x10e8
+#define CLK_CON_MUX_MUX_CLK_CMU_CMUREF			0x10f0
+#define CLK_CON_MUX_MUX_CMU_CMUREF			0x10f4
 #define CLK_CON_DIV_CLKCMU_APM_BUS			0x1800
 #define CLK_CON_DIV_CLKCMU_AUD_CPU			0x1804
 #define CLK_CON_DIV_CLKCMU_BUS0_BUS			0x1808
@@ -162,6 +165,7 @@
 #define CLK_CON_DIV_CLKCMU_VRA_BUS			0x18e0
 #define CLK_CON_DIV_DIV_CLKCMU_DPU			0x18e8
 #define CLK_CON_DIV_DIV_CLKCMU_DPU_ALT			0x18ec
+#define CLK_CON_DIV_DIV_CLK_CMU_CMUREF			0x18f0
 #define CLK_CON_DIV_PLL_SHARED0_DIV2			0x18f4
 #define CLK_CON_DIV_PLL_SHARED0_DIV3			0x18f8
 #define CLK_CON_DIV_PLL_SHARED0_DIV4			0x18fc
@@ -239,13 +243,21 @@ static const unsigned long top_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED2,
 	PLL_LOCKTIME_PLL_SHARED3,
 	PLL_LOCKTIME_PLL_SHARED4,
+	PLL_CON0_PLL_G3D,
 	PLL_CON3_PLL_G3D,
+	PLL_CON0_PLL_MMC,
 	PLL_CON3_PLL_MMC,
+	PLL_CON0_PLL_SHARED0,
 	PLL_CON3_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
 	PLL_CON3_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
 	PLL_CON3_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
 	PLL_CON3_PLL_SHARED3,
+	PLL_CON0_PLL_SHARED4,
 	PLL_CON3_PLL_SHARED4,
+	CLK_CON_MUX_CLKCMU_DPU_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
 	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
@@ -304,6 +316,8 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CLK_CON_MUX_MUX_CLKCMU_SSP_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_TNR_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_VRA_BUS,
+	CLK_CON_MUX_MUX_CLK_CMU_CMUREF,
+	CLK_CON_MUX_MUX_CMU_CMUREF,
 	CLK_CON_DIV_CLKCMU_APM_BUS,
 	CLK_CON_DIV_CLKCMU_AUD_CPU,
 	CLK_CON_DIV_CLKCMU_BUS0_BUS,
@@ -363,6 +377,7 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CLK_CON_DIV_CLKCMU_VRA_BUS,
 	CLK_CON_DIV_DIV_CLKCMU_DPU,
 	CLK_CON_DIV_DIV_CLKCMU_DPU_ALT,
+	CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
 	CLK_CON_DIV_PLL_SHARED0_DIV2,
 	CLK_CON_DIV_PLL_SHARED0_DIV3,
 	CLK_CON_DIV_PLL_SHARED0_DIV4,
@@ -458,6 +473,8 @@ PNAME(mout_pll_shared3_p)		= { "oscclk", "fout_shared3_pll" };
 PNAME(mout_pll_shared4_p)		= { "oscclk", "fout_shared4_pll" };
 PNAME(mout_pll_mmc_p)			= { "oscclk", "fout_mmc_pll" };
 PNAME(mout_pll_g3d_p)			= { "oscclk", "fout_g3d_pll" };
+PNAME(mout_cmu_dpu_bus_p)		= { "dout_cmu_dpu",
+					    "dout_cmu_dpu_alt" };
 PNAME(mout_cmu_apm_bus_p)		= { "dout_cmu_shared0_div2",
 					    "dout_cmu_shared2_div2" };
 PNAME(mout_cmu_aud_cpu_p)		= { "dout_cmu_shared0_div2",
@@ -507,7 +524,7 @@ PNAME(mout_cmu_cpucl0_switch_p)		= { "fout_shared4_pll",
 					    "dout_cmu_shared0_div2",
 					    "fout_shared2_pll",
 					    "dout_cmu_shared0_div4" };
-PNAME(mout_cmu_cpucl1_switch_p)	= { "fout_shared4_pll",
+PNAME(mout_cmu_cpucl1_switch_p)		= { "fout_shared4_pll",
 					    "dout_cmu_shared0_div2",
 					    "fout_shared2_pll",
 					    "dout_cmu_shared0_div4" };
@@ -577,7 +594,7 @@ PNAME(mout_cmu_hsi1_bus_p)		= { "dout_cmu_shared0_div3",
 					    "dout_cmu_shared4_div3",
 					    "dout_cmu_shared2_div2",
 					    "fout_mmc_pll", "oscclk", "oscclk" };
-PNAME(mout_cmu_hsi1_mmc_card_p)	= { "oscclk", "fout_shared2_pll",
+PNAME(mout_cmu_hsi1_mmc_card_p)		= { "oscclk", "fout_shared2_pll",
 					    "fout_mmc_pll",
 					    "dout_cmu_shared0_div4" };
 PNAME(mout_cmu_hsi1_pcie_p)		= { "oscclk", "fout_shared2_pll" };
@@ -672,6 +689,12 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
 					    "dout_cmu_shared4_div2",
 					    "dout_cmu_shared0_div4",
 					    "dout_cmu_shared4_div3" };
+PNAME(mout_cmu_cmuref_p)		= { "oscclk",
+					    "dout_cmu_clk_cmuref" };
+PNAME(mout_cmu_clk_cmuref_p)		= { "dout_cmu_shared0_div4",
+					    "dout_cmu_shared1_div4",
+					    "dout_cmu_shared2_div2",
+					    "oscclk" };
 
 /*
  * Register name to clock name mangling strategy used in this file
@@ -689,19 +712,21 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_PLL_SHARED0, "mout_pll_shared0", mout_pll_shared0_p,
-	    PLL_CON3_PLL_SHARED0, 4, 1),
+	    PLL_CON0_PLL_SHARED0, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED1, "mout_pll_shared1", mout_pll_shared1_p,
-	    PLL_CON3_PLL_SHARED1, 4, 1),
+	    PLL_CON0_PLL_SHARED1, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED2, "mout_pll_shared2", mout_pll_shared2_p,
-	    PLL_CON3_PLL_SHARED2, 4, 1),
+	    PLL_CON0_PLL_SHARED2, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED3, "mout_pll_shared3", mout_pll_shared3_p,
-	    PLL_CON3_PLL_SHARED3, 4, 1),
+	    PLL_CON0_PLL_SHARED3, 4, 1),
 	MUX(CLK_MOUT_PLL_SHARED4, "mout_pll_shared4", mout_pll_shared4_p,
 	    PLL_CON0_PLL_SHARED4, 4, 1),
 	MUX(CLK_MOUT_PLL_MMC, "mout_pll_mmc", mout_pll_mmc_p,
 	    PLL_CON0_PLL_MMC, 4, 1),
 	MUX(CLK_MOUT_PLL_G3D, "mout_pll_g3d", mout_pll_g3d_p,
 	    PLL_CON0_PLL_G3D, 4, 1),
+	MUX(CLK_MOUT_CMU_DPU_BUS, "mout_cmu_dpu_bus",
+	    mout_cmu_dpu_bus_p, CLK_CON_MUX_CLKCMU_DPU_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_APM_BUS, "mout_cmu_apm_bus",
 	    mout_cmu_apm_bus_p, CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_AUD_CPU, "mout_cmu_aud_cpu",
@@ -830,37 +855,13 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    mout_cmu_tnr_bus_p, CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_VRA_BUS, "mout_cmu_vra_bus",
 	    mout_cmu_vra_bus_p, CLK_CON_MUX_MUX_CLKCMU_VRA_BUS, 0, 2),
+	MUX(CLK_MOUT_CMU_CMUREF, "mout_cmu_cmuref",
+	    mout_cmu_cmuref_p, CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+	MUX(CLK_MOUT_CMU_CLK_CMUREF, "mout_cmu_clk_cmuref",
+	    mout_cmu_clk_cmuref_p, CLK_CON_MUX_MUX_CLK_CMU_CMUREF, 0, 2),
 };
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
-	/* SHARED0 region*/
-	DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_shared0",
-	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
-	DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_shared0",
-	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
-	DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_shared0_div2",
-	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
-
-	/* SHARED1 region*/
-	DIV(CLK_DOUT_CMU_SHARED1_DIV2, "dout_cmu_shared1_div2", "mout_pll_shared1",
-	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
-	DIV(CLK_DOUT_CMU_SHARED1_DIV3, "dout_cmu_shared1_div3", "mout_pll_shared1",
-	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
-	DIV(CLK_DOUT_CMU_SHARED1_DIV4, "dout_cmu_shared1_div4", "dout_cmu_shared1_div2",
-	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
-
-	/* SHARED2 region */
-	DIV(CLK_DOUT_CMU_SHARED2_DIV2, "dout_cmu_shared2_div2", "mout_pll_shared2",
-	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
-
-	/* SHARED4 region*/
-	DIV(CLK_DOUT_CMU_SHARED4_DIV2, "dout_cmu_shared4_div2", "mout_pll_shared4",
-	    CLK_CON_DIV_PLL_SHARED4_DIV2, 0, 1),
-	DIV(CLK_DOUT_CMU_SHARED4_DIV3, "dout_cmu_shared4_div3", "mout_pll_shared4",
-	    CLK_CON_DIV_PLL_SHARED4_DIV3, 0, 2),
-	DIV(CLK_DOUT_CMU_SHARED4_DIV4, "dout_cmu_shared4_div4", "mout_pll_shared4",
-	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
-
 	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
 	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
 	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
@@ -974,6 +975,34 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
 	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
+	DIV(CLK_DOUT_CMU_DPU_ALT, "dout_cmu_dpu_alt", "gout_cmu_dpu_bus",
+	    CLK_CON_DIV_DIV_CLKCMU_DPU_ALT, 0, 4),
+	DIV(CLK_DOUT_CMU_CLK_CMUREF, "dout_cmu_clk_cmuref", "mout_cmu_clk_cmuref",
+	    CLK_CON_DIV_DIV_CLK_CMU_CMUREF, 0, 2),
+	/* SHARED0 region*/
+	DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_shared0",
+	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
+	DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_shared0",
+	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
+	DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_shared0_div2",
+	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
+	/* SHARED1 region*/
+	DIV(CLK_DOUT_CMU_SHARED1_DIV2, "dout_cmu_shared1_div2", "mout_pll_shared1",
+	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
+	DIV(CLK_DOUT_CMU_SHARED1_DIV3, "dout_cmu_shared1_div3", "mout_pll_shared1",
+	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
+	DIV(CLK_DOUT_CMU_SHARED1_DIV4, "dout_cmu_shared1_div4", "dout_cmu_shared1_div2",
+	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
+	/* SHARED2 region */
+	DIV(CLK_DOUT_CMU_SHARED2_DIV2, "dout_cmu_shared2_div2", "mout_pll_shared2",
+	    CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
+	/* SHARED4 region*/
+	DIV(CLK_DOUT_CMU_SHARED4_DIV2, "dout_cmu_shared4_div2", "mout_pll_shared4",
+	    CLK_CON_DIV_PLL_SHARED4_DIV2, 0, 1),
+	DIV(CLK_DOUT_CMU_SHARED4_DIV3, "dout_cmu_shared4_div3", "mout_pll_shared4",
+	    CLK_CON_DIV_PLL_SHARED4_DIV3, 0, 2),
+	DIV(CLK_DOUT_CMU_SHARED4_DIV4, "dout_cmu_shared4_div4", "dout_cmu_shared4_div2",
+	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
 };
 
 static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {

-- 
2.50.1


