Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC08CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 23:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkq0pzcUOmJj4u6sdt3L7jO6dKHmpCQKHQSOPpZvKhI=; b=2e6R60rINoKpf4JEi4rMwhqyN9
	xatBguN15fS5sL8l7jv+wHdvSqgX3C1nM018J/CkWPc7RVnMwNA0e8DQSNl+Z0N7r/2c0w8hYIZjW
	ee04l4Yv9meEfPrnvlBg+s36mx+Q+qVUj6jZsn2kFvxLBliKWMtfYk4ZK1j9WITH28avN+l1UuSw7
	R5gYLqw6dNZhvu1jvf0VRTOJFO/beYY93lJ3I2PvNbQuGUaeXyL2s2IaBoQvH6z+SxI7ViPDp7UVh
	YsPK9ZWhuSnmHXrEktA6xQ1ZCr5np4TNeg5J5Q9X0b/s5rTSsKYqSwTDK0a5REEWpzS7MD//CgiHv
	WiTeawmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVqt-0000000Brc9-0rYU;
	Tue, 19 Aug 2025 23:34:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUgJ-0000000Biog-0hbb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 22:19:52 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76e2e8e2d2dso3774259b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 15:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755641990; x=1756246790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkq0pzcUOmJj4u6sdt3L7jO6dKHmpCQKHQSOPpZvKhI=;
        b=aQq4SI4Jbsqj2IzJKb8FmBqOXwI0iEoSZgjxSKpMzO0oDrptTLLucmNfu9HHmNQ49m
         wKq33rNEb9so+EALNoSTdYajYWOelglVNDruxNleZevWWPkFHkT6WkI34zgW74ulyN+X
         Cha6ukzX7ke7/28DWFAwuqtOfzREo9hC3GRCTrtJMrP4aFN5rbb1IMsdNunsuQMtkpFs
         qelBvlrLTVBy1kJhdNuSlOYVqnpnPyGDhnZYgiCrRpKj9ihQiGnDaXZjXmu0hvCqmTWM
         Ettyexl9VQ5uV4KTWYlZaXPIZHOnZCbZ9EVLErwaHlCiNJ0uNrj1pZu1JRS60jJtZt8n
         LlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755641990; x=1756246790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkq0pzcUOmJj4u6sdt3L7jO6dKHmpCQKHQSOPpZvKhI=;
        b=QgktJSxK/tPnN1WHAEJNnAHXT6cNh91VAhMRvNeboE4xkiR+BfCMnAPTeqA8bIi66/
         9DB1toAuX8Eu81HcTFWGTwF0omhKpcGN7bg2Kg1oGewLByvUoMOLodFASgbCCaq2+fY0
         QDZp4b8W6Q8pTRc3kBDilkQMtmIaeZ9YCN2xTVHxv9e6EhD5A8ySFwShRGHWYdGN7Ac4
         Zgr6QeNEPcu98Ew+gPdg6pKaZVJKlPtbfrgBPz8NVUOQEybN8hd0iCD8ncyiyBZ+NtYK
         zH0RvW6zICx6hu0FnTo/WrKorSFO6uy96wEFvzy47N+YlqW5UDgM8dtV2kLAKhYik7uD
         i5RA==
X-Forwarded-Encrypted: i=1; AJvYcCWGPbGyoQvazKTC6Z0XmseNbW+eGuvP50jiFcYUKe1q8IbyfRZ5JPjcV8i7eQeLB6DEqzw+B6oCBJPqkD3BMRzm@lists.infradead.org
X-Gm-Message-State: AOJu0YyCplaYJJJ8EPn+ZgNfBi5MilYe1eHpSIYfN6R+SSLLWq/3A/6L
	UgN6mprD7oNSpLcm7Vq+EjLeZ6DHXSwZHaMaVfS/hX1DrfZT99i5aLVh
X-Gm-Gg: ASbGncunmnu0Yae9chWGchuF3I9Yfhlo7y39tQCVW0xGzQu5J+UUJeI3zNgYpeAEoJy
	jdQdgSoTZJanZXfveN9IMetULWlN9mqPSmOlSi2DlNHw8IEA4kSImvUr3+MYQ5J1grsA1A0izuF
	Ybo9LzF9lTHGhJZlaeFM9TdS97VUa45TvFheI+qOj/rRELMVCBKCKrvlRQCxP8eIdakSL46UHrQ
	iMY0oyfLduNJkUoEKOGVi1FFbN4gr6iSluOsvYhCTdDhv9CPA96w5JNUsLcxzJzVF7h7JSUyj0/
	hkJo90ER+R1+wsWO9IrrnQB2hE+X1eoxdEogB9Mw9dm6XzdLj99E+42hRDdpP6koztztbmKI/yh
	4HB/dF2cdASRoJWK4ObZBLss1oHzsgLQeygiu4Rk5r89y4QHeutO2oOo72A==
X-Google-Smtp-Source: AGHT+IGcPQQ5Lnmcph7eecNE9Uv5mWy4z4P8pOTvFiPP9MDuOO+jMuphebVbEiXw1XRDeaUc5z9QrQ==
X-Received: by 2002:a05:6a00:3c85:b0:76b:cadf:5dbe with SMTP id d2e1a72fcca58-76e8daa1adfmr936224b3a.0.1755641990472;
        Tue, 19 Aug 2025 15:19:50 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f76b5sm3431545b3a.59.2025.08.19.15.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 15:19:50 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Tue, 19 Aug 2025 17:19:36 -0500
Subject: [PATCH 1/3] clk: samsung: exynos990: Fix CMU TOP mux/div widths
 and add fixed-factors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-2-v1-1-e84b47b859ce@gmail.com>
References: <20250819-2-v1-0-e84b47b859ce@gmail.com>
In-Reply-To: <20250819-2-v1-0-e84b47b859ce@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755641982; l=6749;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=EgjV2IN3BTxVAhU8sWcO6A242l1zwL+tm7uc6WZdAWo=;
 b=1QCh90rN56p6R3kfiHTGSpY6hHK3WN3npDGcpi8QPXQxfS8xLeM9psBkjjolDUnpuTcef80tv
 vZoVjZHo/fPAb72zRjwwy9x6xrSj3o5Nl8jOV229WYu1DAPYpDMPYts
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_151951_214428_08C1EF77 
X-CRM114-Status: GOOD (  11.33  )
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
HSI1/2 PCIe and USBDP debug. Also fix OTP rate. These align
with Exynos990 downstream cmucal and ensure correct parent/rate
selection.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 8d3f193d2b4d4c2146d9b8b57d76605b88dc9bbb..57e26c4d1f39cef838f3201956762a0c242f726a 100644
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
@@ -837,7 +837,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	DIV(CLK_DOUT_CMU_SHARED0_DIV2, "dout_cmu_shared0_div2", "mout_pll_shared0",
 	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
 	DIV(CLK_DOUT_CMU_SHARED0_DIV3, "dout_cmu_shared0_div3", "mout_pll_shared0",
-	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
+	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 1),
 	DIV(CLK_DOUT_CMU_SHARED0_DIV4, "dout_cmu_shared0_div4", "dout_cmu_shared0_div2",
 	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
 
@@ -862,7 +862,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
 
 	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
-	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
+	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
 	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
 	    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
 	DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
@@ -889,7 +889,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_CPUCL0_DBG_BUS, "dout_cmu_cpucl0_debug",
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
@@ -980,7 +973,17 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	DIV(CLK_DOUT_CMU_VRA_BUS, "dout_cmu_vra_bus", "gout_cmu_vra_bus",
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_clkcmu_dpu", "gout_cmu_dpu",
-	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 4),
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
2.49.0


