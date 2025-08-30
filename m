Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419F2CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emZkWDIm/t5c5gZiLUdjkY64mxwXxHIrDh9PX4vUBWQ=; b=OOJhBaIZsYQXWYG78CQTPANQPU
	WX0GGhWqy8gyoWWyOdANAH/bRhJY81NzJY3zH2qlNJtDqvHwZaSiQFY8gXymRIS9HgXioimZ21wYU
	3FQGsgU4mgVK7ta00+t7l5dx705V0Dq9/uozd1iKJntSBtpmrBe1s8ylx+2JLh9hIZG9zETrhbN3f
	OCsn+uAhPbwxHiwEPeKoKwfu3CCKJoEdeM/BdkCg89nsEGBKst1KODr7Rq6y3G2xVji7PNoMahdSF
	9JSKUASR20X/Op4weU1yVJIVKs+EZC7ouw00M0WBKkDNrIChl/B6FeDg5iM5Vq7srYS/3gooSS0fD
	zsdAuQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOhp-000000089q4-2F90;
	Sat, 30 Aug 2025 16:45:33 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usORZ-000000088O8-368i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:28:46 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-70ddd2e61d9so33995786d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571325; x=1757176125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emZkWDIm/t5c5gZiLUdjkY64mxwXxHIrDh9PX4vUBWQ=;
        b=ZnombYPF+XNc1Sk9H+PNsq3Ls8spSbi1OILIB6l8Tz7FvTd501yx2+pFq8CXt7HsWo
         2B12OaU5eOSYsIXZNBIEl6rvaPG/vsRlSVF6AN4478ynHFGEdXe8n47Xq1EPnpc/UYXt
         AcGTgBzrfCOEc2Aeu3fULk7SSqx3G4HKuyP+VxPQzaQ89Wbz9+mammdtuMMwb3nhu7YM
         rtlRpW4ugZbhG5Jbr+yyZdL6rmnAr7dFgzcNaIztgXWzo1fm1sBJSd1pNxU7++yBHrpc
         1K6f+cp7OdPHNyE3FiJAK2gpt9cx6LDgu7xyJSTaIdep/oWpHj6GxiqQnmEGTbyQJ19R
         9ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571325; x=1757176125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emZkWDIm/t5c5gZiLUdjkY64mxwXxHIrDh9PX4vUBWQ=;
        b=hMgkpTn7RoDkMsDMQt/yaO2RQdHVYNedCG5K/2sbz+gCM06Fb+4eDcApvwisOm1bro
         dyYOJljTPmmMTbvzhfHAolH+UVXIOZ/DljUIwzf+asESu/0o91kraPdgBea1XzPFqHmI
         d50PjXUPemkxznnXWeBaZYjxOv+A3THsPviGxcotf5ZE7PYX/s4/AHh3jcVx0T7Q0V74
         9is3FHGTVtD1/hD5LTkcC3ghCe66HGQidaJjko/zvJ/P6Hvgwf2Rv36Y0epxPuyakxb2
         WwZOBbms+P8Nf7I+AfsqoGW0HptWgCUIOgsN6SAyOf2BLo+nPBfO/kBWrRMZLq0i5yo6
         7L7g==
X-Forwarded-Encrypted: i=1; AJvYcCVB+XbzM+dgYJbXCpmARISaaXhu78CY4ZH7cYhLhta5vSOS3hFZWu2QnfJM/tCkErHOZc92bdHiN3/D4pYnnli5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3eXPtIt11bEFAff15ICQIeF7UudTZ9Qa2Waff09evc/fDVEUO
	p9tzE5Uw7N0guND2gBv0YrcGP8EA2FeIYBqr9yDi8Cm+VqDfgnoJz8aj
X-Gm-Gg: ASbGncsTYc1nNP2frDbP/YfgBKoK0W/9ySQZShywQlL1EpPAX0J1EdepZmJdUvO6rwW
	7Eu/XrXQIgZPd37FihGchb0y5gjzehmPyetmRyHv3i1fmQOrSum1YP+tv+YPiUwfCBymW+H1Hl3
	vuhptkM39ym+8zlKftJaPJJ2dqgCV/iERFICU4Qve+bush3EWDwAkRY4S+qg7n9zQkl2KwH9FCZ
	pvsPEbNiumK1/YfzG3iFMrBweTxV9lcrnn4Qm1ifwZG9/BBw1/ts0igHP6TtGGeZ6ibPYN/X7kK
	3TKof55vrn6TwzzME4XTto9KsgQJ7ktkkM/WWXF+SH10W/Q3WidsFbrzLPTKJly6kKFCq+x51KM
	EKWelaj8sosN0f6TMWaQyecfC57+v2ZHuNDWyXDE=
X-Google-Smtp-Source: AGHT+IFpNpM1hvW9chxsQmi7d0czGq1O/qS8qHHkp52KwpLCkNld7aFsu3xbEQ3CJnMfEy0jJkWeFQ==
X-Received: by 2002:a05:6214:5010:b0:70d:d36e:964 with SMTP id 6a1803df08f44-70fac898f06mr30513146d6.39.1756571324515;
        Sat, 30 Aug 2025 09:28:44 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:44 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:42 +0000
Subject: [PATCH v5 5/5] clk: samsung: exynos990: Add DPU_BUS and CMUREF
 mux/div and update CLKS_NR_TOP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-5-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571320; l=5654;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=5IPuwTPYxNGQIBDJPCqLNlhrVjtDtNs6m7JTklARsrQ=;
 b=CvwDr0wXhmzZT+RELAeJJ1yiEwqe5yMi7s5f4NyHS4xmHtZvt/7vrTANzyvxMaEuG7HHsuMwn
 2NmBW5cswaGDDBohXFGDWB0dI0sOYtTb9DOG5TIzsGVpHBgr+EnMkjN
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_092845_790065_D3FA09DA 
X-CRM114-Status: GOOD (  14.09  )
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

Add DPU_BUS and CMUREF mux/div, wire their registers and parents,
and update CLKS_NR_TOP. These use the new IDs appended to the
bindings to avoid ABI changes.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8571c225d09074cfd1c299879c1e6b4a7322520a..91736b15c4b4a0759419517f7b04dd0a8f38a289 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -17,7 +17,7 @@
 #include "clk-pll.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
+#define CLKS_NR_TOP (CLK_DOUT_CMU_CLK_CMUREF + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 
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
@@ -253,6 +257,7 @@ static const unsigned long top_clk_regs[] __initconst = {
 	PLL_CON3_PLL_SHARED3,
 	PLL_CON0_PLL_SHARED4,
 	PLL_CON3_PLL_SHARED4,
+	CLK_CON_MUX_CLKCMU_DPU_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_APM_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_AUD_CPU,
 	CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
@@ -311,6 +316,8 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CLK_CON_MUX_MUX_CLKCMU_SSP_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_TNR_BUS,
 	CLK_CON_MUX_MUX_CLKCMU_VRA_BUS,
+	CLK_CON_MUX_MUX_CLK_CMU_CMUREF,
+	CLK_CON_MUX_MUX_CMU_CMUREF,
 	CLK_CON_DIV_CLKCMU_APM_BUS,
 	CLK_CON_DIV_CLKCMU_AUD_CPU,
 	CLK_CON_DIV_CLKCMU_BUS0_BUS,
@@ -370,6 +377,7 @@ static const unsigned long top_clk_regs[] __initconst = {
 	CLK_CON_DIV_CLKCMU_VRA_BUS,
 	CLK_CON_DIV_DIV_CLKCMU_DPU,
 	CLK_CON_DIV_DIV_CLKCMU_DPU_ALT,
+	CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
 	CLK_CON_DIV_PLL_SHARED0_DIV2,
 	CLK_CON_DIV_PLL_SHARED0_DIV3,
 	CLK_CON_DIV_PLL_SHARED0_DIV4,
@@ -465,6 +473,8 @@ PNAME(mout_pll_shared3_p)		= { "oscclk", "fout_shared3_pll" };
 PNAME(mout_pll_shared4_p)		= { "oscclk", "fout_shared4_pll" };
 PNAME(mout_pll_mmc_p)			= { "oscclk", "fout_mmc_pll" };
 PNAME(mout_pll_g3d_p)			= { "oscclk", "fout_g3d_pll" };
+PNAME(mout_cmu_dpu_bus_p)		= { "dout_cmu_dpu",
+					    "dout_cmu_dpu_alt" };
 PNAME(mout_cmu_apm_bus_p)		= { "dout_cmu_shared0_div2",
 					    "dout_cmu_shared2_div2" };
 PNAME(mout_cmu_aud_cpu_p)		= { "dout_cmu_shared0_div2",
@@ -679,6 +689,12 @@ PNAME(mout_cmu_vra_bus_p)		= { "dout_cmu_shared0_div3",
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
@@ -709,6 +725,8 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    PLL_CON0_PLL_MMC, 4, 1),
 	MUX(CLK_MOUT_PLL_G3D, "mout_pll_g3d", mout_pll_g3d_p,
 	    PLL_CON0_PLL_G3D, 4, 1),
+	MUX(CLK_MOUT_CMU_DPU_BUS, "mout_cmu_dpu_bus",
+	    mout_cmu_dpu_bus_p, CLK_CON_MUX_CLKCMU_DPU_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_APM_BUS, "mout_cmu_apm_bus",
 	    mout_cmu_apm_bus_p, CLK_CON_MUX_MUX_CLKCMU_APM_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_AUD_CPU, "mout_cmu_aud_cpu",
@@ -837,6 +855,10 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    mout_cmu_tnr_bus_p, CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_VRA_BUS, "mout_cmu_vra_bus",
 	    mout_cmu_vra_bus_p, CLK_CON_MUX_MUX_CLKCMU_VRA_BUS, 0, 2),
+	MUX(CLK_MOUT_CMU_CMUREF, "mout_cmu_cmuref",
+	    mout_cmu_cmuref_p, CLK_CON_MUX_MUX_CMU_CMUREF, 0, 1),
+	MUX(CLK_MOUT_CMU_CLK_CMUREF, "mout_cmu_clk_cmuref",
+	    mout_cmu_clk_cmuref_p, CLK_CON_MUX_MUX_CLK_CMU_CMUREF, 0, 2),
 };
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
@@ -981,6 +1003,10 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
 	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
+	DIV(CLK_DOUT_CMU_DPU_ALT, "dout_cmu_dpu_alt", "gout_cmu_dpu_bus",
+	    CLK_CON_DIV_DIV_CLKCMU_DPU_ALT, 0, 4),
+	DIV(CLK_DOUT_CMU_CLK_CMUREF, "dout_cmu_clk_cmuref", "mout_cmu_clk_cmuref",
+	    CLK_CON_DIV_DIV_CLK_CMU_CMUREF, 0, 2),
 };
 
 static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {

-- 
2.50.1


