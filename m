Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7719DCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 05:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zc0D+AKRBVahZLN09XFTNDxvFlIQ9tA5x14f6DoX6Xs=; b=tZp6m6fBigGOnCAcJJBxlr9BN9
	X3axRYaA01QWACsvgwGXMEpNgwBLo9iO2ygnteXiytYyi5yu4WpJU4Hs6LXqPxn3bcqKbYpF2oqy4
	KmLt7q75f5LvoHC0BOYJ+ejYUkcuMGef1Fj8yDmVlUANvLG860/txZXE/V7+yQrbCDRVvhnwIXOzT
	I7yXkDGEUyqaT8Hl7phq0F5mZPFNG4otvt6/Et/tMmV6rPgLO2YyhUpFw6feE8kOdvB4RN75F6Eqa
	6bXK5Jecp9CLPgaR5YhZfjlICnGsJ140Mm55HDt6Uz/KJrvb5CweAePQM8LLrMaOSv3coBBTQUHWA
	3rmAf/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQC9-00000006zxN-2fna;
	Mon, 25 Aug 2025 05:56:41 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQ6x-00000006zO4-35dX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 05:51:20 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-70a9f5625b7so36947916d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 22:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101078; x=1756705878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zc0D+AKRBVahZLN09XFTNDxvFlIQ9tA5x14f6DoX6Xs=;
        b=CN9MDuPMbR29CF+x/bGNkYQd9RTvxopEg5zjsvBUm1FnlLjSaaGIp6WAFFCcKS2bX3
         Vi6fhDQCeuaTAGyPs6pFBDpR9iR7op0q+db5IZuvV82A/3QWaqlAoyHR/q+RwKpR/hEX
         1yQhBtXe+jWIn9dMbOOO711G0J79x71fycQgRRaeRAMWXjP37lItH7cX8GctEAwXsYMx
         biKAiU4ncBpNi9o0OiPVge3p98buo9NV3sMeaeyQbvrCrEGUWdRR2E541cRquuJGaWBh
         qfK9Gj2LqddAyQ8TAa1exqouUFP1rWx6e2mE8nHD/xjNbPYR2rqWUfLeVLS0b4LGZKQ4
         BCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101078; x=1756705878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zc0D+AKRBVahZLN09XFTNDxvFlIQ9tA5x14f6DoX6Xs=;
        b=tox9qQGXSio87PM1h/yA/NIlIpDmkzCkekUs/WmnVl8OfHFLx3Fia9rm4ebezsL9C6
         9B3DI/w8sjZOYKN84s+DHTNxi6DbhNCsRtj0Imq1+eu5aiVOqfKw16bkCWUtL4uwhC64
         n+ZPrcSxIUnn0Jp0xo/uBBQFJ+TWcqbVDRcmwxOW2K4zO+cMW/Q6KYyO2wa2wfO2T/rn
         ltwQkcZTuR0H5I8IRtpPv5ZyuXH1Wfx0QQaH9Sbzm+tXa0C4dwIldDjfAjAAdRAtPYKT
         NrxXFaXBimEDb/nlhgUZ3ptUCeFilQ0LFSUVSc/dzab33PMgGPlBdggDJGhqNXUJAkop
         8Oxw==
X-Forwarded-Encrypted: i=1; AJvYcCXLgRq7pi+duVcTVaZTq0teRYSKCZWkZry/lHPsoSPocEufyDdooHsiP3OQH3LbjRZFkxxEg7t4x1HJOJWaYTg1@lists.infradead.org
X-Gm-Message-State: AOJu0YxWROVmmh0yLD4UGjS/UyMKrCZySx6NkSHvoDPBwt0BkI96g7uI
	+RkO4scbU0SSjRjQ/GZ3UlvYguKjCn6ttdVdl3T5piF9rxoAXCnWRuh4pBuXYSid
X-Gm-Gg: ASbGncsGW8RYEh/2n3bHJR1DYqDF/FMgSXh5m8UpdjFlqfEz5VYt71cN4TCg176K+X/
	EQ5LyuXD+2lpNgiHexQ4DllCLxEgMr3F+NA0FohNxLBv9mTEwGwvUdxekP2VhkqZ7CLNNTudDFg
	kf4AqMzfoY6RCsLpmr1UH2R5Dnki9qSr3NonCSUQDaBX3NgH7M3p4BHTHcjbn9G7sFzbjf7wlOd
	ePA8gCN+fWqC6n2mLQu2Xd/pUCcBPnht3ybvBqbT8O2FZMSmkzyoOCKLvYa+3xr3ljD1rnqvM3y
	voRqLNQOJNskqow1iYAPjfbhtWDo2ZTd08O6x5pEGTnrkryCOjOOJt/h8WvCARdTivkD3f65hnd
	kW9ALQTkEAZoygUf8LlOHSqAKr2Ph2Q==
X-Google-Smtp-Source: AGHT+IFQlUtFOy5uV9bcc38nkfyLfs6R38ntew/7v3Vz12/PxTN8KVE2tNFunOishso8IRIS4DbLcg==
X-Received: by 2002:a05:6214:e81:b0:70b:a2b7:21cb with SMTP id 6a1803df08f44-70d970a5f43mr120868536d6.9.1756101078397;
        Sun, 24 Aug 2025 22:51:18 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:17 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 05:51:15 +0000
Subject: [PATCH v4 1/4] clk: samsung: exynos990: Fix CMU TOP mux/div widths
 and add fixed-factors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v4-1-71d783680529@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=6467;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=20mWLZEGgEbpDt41ggUQHBXHpARZ9CqTlFdX4+rxceg=;
 b=Zri0g7KTRqMlS6NXZPNPZ2GsLp22QhlEGJhIAojRC7rJQvKzBzlzXB2Hhzt6LVv14Vxw22iGu
 Zh1DMhIjqkPBVXfKgGtLVZwq2cp9QQpmGEbBdIjw5tvSITyd+NIoPPq
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_225119_776743_F1B59137 
X-CRM114-Status: GOOD (  11.27  )
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

Correct mux/div bit widths in CMU TOP (DPU, DSP_BUS, G2D_MSCL,
HSI0/1/2). Replace wrong divs with fixed-factor clocks for
HSI1/2 PCIe and USBDP debug. Also add OTP rate in ffactor.
These align with Exynos990 downstream cmucal and ensure correct
parent/rate selection.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8d3f193d2..105ba0363 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -759,11 +759,11 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_CMU_DPU_ALT, "mout_cmu_dpu_alt",
 	    mout_cmu_dpu_alt_p, CLK_CON_MUX_MUX_CLKCMU_DPU_ALT, 0, 2),
 	MUX(CLK_MOUT_CMU_DSP_BUS, "mout_cmu_dsp_bus",
-	    mout_cmu_dsp_bus_p, CLK_CON_MUX_MUX_CLKCMU_DSP_BUS, 0, 2),
+	    mout_cmu_dsp_bus_p, CLK_CON_MUX_MUX_CLKCMU_DSP_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_G2D_G2D, "mout_cmu_g2d_g2d",
 	    mout_cmu_g2d_g2d_p, CLK_CON_MUX_MUX_CLKCMU_G2D_G2D, 0, 2),
 	MUX(CLK_MOUT_CMU_G2D_MSCL, "mout_cmu_g2d_mscl",
-	    mout_cmu_g2d_mscl_p, CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 1),
+	    mout_cmu_g2d_mscl_p, CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 2),
 	MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm",
 	    mout_cmu_hpm_p, CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 2),
 	MUX(CLK_MOUT_CMU_HSI0_BUS, "mout_cmu_hsi0_bus",
@@ -775,7 +775,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI0_USBDP_DEBUG, "mout_cmu_hsi0_usbdp_debug",
 	    mout_cmu_hsi0_usbdp_debug_p,
-	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 2),
+	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI1_BUS, "mout_cmu_hsi1_bus",
 	    mout_cmu_hsi1_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_HSI1_MMC_CARD, "mout_cmu_hsi1_mmc_card",
@@ -788,7 +788,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI1_UFS_EMBD, "mout_cmu_hsi1_ufs_embd",
 	    mout_cmu_hsi1_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_UFS_EMBD,
-	    0, 1),
+	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI2_BUS, "mout_cmu_hsi2_bus",
 	    mout_cmu_hsi2_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI2_PCIE, "mout_cmu_hsi2_pcie",
@@ -862,7 +862,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
 
 	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
-	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
+	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
 	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
 	    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
 	DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
@@ -887,9 +887,9 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_CMU_BOOST, 0, 2),
 	DIV(CLK_DOUT_CMU_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
 	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_debug",
+	DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_dbg_bus",
 	    "gout_cmu_cpucl0_dbg_bus", CLK_CON_DIV_CLKCMU_CPUCL0_DBG_BUS,
-	    0, 3),
+	    0, 4),
 	DIV(CLK_DOUT_CMU_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch",
 	    "gout_cmu_cpucl0_switch", CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
 	DIV(CLK_DOUT_CMU_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch",
@@ -924,16 +924,11 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 3),
 	DIV(CLK_DOUT_CMU_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd",
 	    "gout_cmu_hsi0_usb31drd", CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
-	    "gout_cmu_hsi0_usbdp_debug", CLK_CON_DIV_CLKCMU_HSI0_USBDP_DEBUG,
-	    0, 4),
 	DIV(CLK_DOUT_CMU_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus",
 	    CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 3),
 	DIV(CLK_DOUT_CMU_HSI1_MMC_CARD, "dout_cmu_hsi1_mmc_card",
 	    "gout_cmu_hsi1_mmc_card", CLK_CON_DIV_CLKCMU_HSI1_MMC_CARD,
 	    0, 9),
-	DIV(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_HSI1_UFS_CARD, "dout_cmu_hsi1_ufs_card",
 	    "gout_cmu_hsi1_ufs_card", CLK_CON_DIV_CLKCMU_HSI1_UFS_CARD,
 	    0, 3),
@@ -942,8 +937,6 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    0, 3),
 	DIV(CLK_DOUT_CMU_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus",
 	    CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pcie",
-	    CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 7),
 	DIV(CLK_DOUT_CMU_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
 	    CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_ITP_BUS, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
@@ -979,8 +972,18 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_VRA_BUS, "dout_cmu_vra_bus", "gout_cmu_vra_bus",
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_clkcmu_dpu", "gout_cmu_dpu",
-	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 4),
+	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
+	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
+};
+
+static const struct samsung_fixed_factor_clock cmu_top_ffactor[] __initconst = {
+	FFACTOR(CLK_DOUT_CMU_HSI1_PCIE, "dout_cmu_hsi1_pcie",
+		"gout_cmu_hsi1_pcie", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_OTP, "dout_cmu_otp", "oscclk", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI0_USBDP_DEBUG, "dout_cmu_hsi0_usbdp_debug",
+		"gout_cmu_hsi0_usbdp_debug", 1, 8, 0),
+	FFACTOR(CLK_DOUT_CMU_HSI2_PCIE, "dout_cmu_hsi2_pcie",
+		"gout_cmu_hsi2_pcie", 1, 8, 0),
 };
 
 static const struct samsung_gate_clock top_gate_clks[] __initconst = {
@@ -1126,6 +1129,8 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_mux_clks = ARRAY_SIZE(top_mux_clks),
 	.div_clks = top_div_clks,
 	.nr_div_clks = ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks = cmu_top_ffactor,
+	.nr_fixed_factor_clks = ARRAY_SIZE(cmu_top_ffactor),
 	.gate_clks = top_gate_clks,
 	.nr_gate_clks = ARRAY_SIZE(top_gate_clks),
 	.nr_clk_ids = CLKS_NR_TOP,

-- 
2.50.1


