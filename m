Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A88CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l20Ejg3eGN0MMaA6lUsOBsRKWq9HxWnc6pYE73v7Hlc=; b=U8qmWTCfxr3zghtgc9QXRFuR7p
	43p/OefxU1asAT8QIXsgNahZ6+8udEn3geVf94rfJQb66PGR96Y+7E3kGRzE4IUOvkmpCYycDVrj4
	kB6//XqB+XzAExU7dGHfEAkhrpAWXTBTjzxKeNaBBX3Omk2U+YN6qmgjrodj4JGoxQfxAVViV7vKj
	2+/8O64hA2HpJx7sob+AAt3878NoaCo+HA/g4ybzIsvv+qh7Nh3f/cSUz3rBN3S8/wnyH3FKCqAAV
	B2wgztJfnwu0jTlWjQPtr9N+kSDbn/+ZgndVen3i+CA3QDX+TkVr0GHI5IvqhCs+eO2mp3KhxfvED
	wrVxaqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOZh-0000000898D-0UG6;
	Sat, 30 Aug 2025 16:37:09 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usORX-000000088Mo-15bs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:28:44 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-70de042246eso24825236d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571322; x=1757176122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l20Ejg3eGN0MMaA6lUsOBsRKWq9HxWnc6pYE73v7Hlc=;
        b=j1csIPBOpFU946fHHDvn+4q11mmFGXsOeePHma8ILmhII1Q/B+oOVlrF6d2xvpImtZ
         aoKYNE/4/UmJv/ffLmf1KT1qgHlVK2cozlYvZ2yvBsKSk95SX5SSUjbOgoVdsYOF3w4N
         mz11noidcDTH82JcUmnarUg3nMyB7O+T/K54kZZOstr1TI+v7wS8kcT7eHCFKmoXDGsv
         mn9AecJ5bPRPt9t9dCeCX275TRuBCQvBJRitorcvAsURWaf6FPIaY+E6CkAI7PV108EH
         2GBelY/jkgCXwKbPBqlK+2r8hFo8R2EdgeJs3tZKbPs1CzH8k1VmdH1rR3zKc8o7CZ3d
         MARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571322; x=1757176122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l20Ejg3eGN0MMaA6lUsOBsRKWq9HxWnc6pYE73v7Hlc=;
        b=TIsJW75jx8qEniAFjhej96W4WJ/+6kH0EoEnixtPELwyIvVURXCKssa0ESEAHyK3tX
         3Y3tziM+jRZIVYl0VNj8H6B+ggYt16BDIH3EZDLaHIBDb/xbgT5KaAu/pd+vueBnhwlx
         ZMcQIAr+v+Tj25N2YXDvAYmLFBjm3j8EBXnKXFCEDoQjl2/HJsTJp0HDywtYyKR5od4L
         7ITjqR5uNEaN5YArtUeqtc9JKHuRORr9pHJzw5vq/Vljubie2GUJmorr9pDdY6YG7Qop
         dEVPKnI+hkzhf2ouFPhmSWI0XNqnDe+aNwqdUoEF0vebIUXhqGOxKwW/dUqr0tN6GUll
         rKiA==
X-Forwarded-Encrypted: i=1; AJvYcCXPnj3JTnfm2ff1HpfN6H/F0YWCE02ebTu9+aW5zSKbixSGol3JIvUtLimUuSTx9MU/9ChNBzkY0iSG5BWND8lg@lists.infradead.org
X-Gm-Message-State: AOJu0YyMgDIB9DRXForGxbnLpqokmTSBUT7esFeXVtOUXWTvqESVwOu5
	1LJj+OE3aa5A6h44Crp0P0a3Lo5e2CHeY3OpX/XGB1STnysyp5SXSTCB
X-Gm-Gg: ASbGncslXfLopzTuXdyL07dYLSFg7s+DtM2/33u631FlnUIih38B72Cf0jOgi/suT6i
	jDHLOdByPWyw0LkSS9YDAbDOwiXQvalbWeJc9SyG/kNy3k1M1VAqxOdoBmGRgqGN/MdwgfOM2up
	8tC7tAfPIvhfdtpuaeFYxZc2XoCWAbmB9MpfSTnXJpD966no4hUUsOccW6qZHuPbJVA1pOvHEp7
	bjNM/LGsZg4k6XQ82qUPoqyh6H9dwuK+AfJhrAKH2Cw+IBheUnTHbXnjMbVfomyucgxSZ04x+LH
	jRpfPAVJE08WfJBRU27NEM/sZlMqiD4lpltLN00bJKVE8BZrDA/fBqtwIPgEIc09YvU24QDwATd
	tqzmLAyE7tnw2SMQW5nJAb0Np/MdP
X-Google-Smtp-Source: AGHT+IGgD56T8rFSPjDXiXJt9jRvp9L/KlBHuDxS4C1LX1Fq+IuTna6soZQ73OXkifSOFU1gsKQr4w==
X-Received: by 2002:ad4:5aac:0:b0:70d:ea79:b37f with SMTP id 6a1803df08f44-70fac940ad0mr26642316d6.62.1756571322175;
        Sat, 30 Aug 2025 09:28:42 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:41 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:39 +0000
Subject: [PATCH v5 2/5] clk: samsung: exynos990: Fix CMU_TOP mux/div bit
 widths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-2-7c62f608309e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=4124;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=eG/sqPWtkgzTsSio4RUmLrcfnT+7wa1K05i+7zQ30C0=;
 b=FqjDR3kxtVKWkMfPKMbdpzUivCRJC3agpWnZo2mbw7MmxwpKp79EfVLlkbkY6Ra3EANpcmECo
 VBq21rBMxfvBgeU+JMbz66hcgPA7l2PO7aR/GL7yTt0oef4SE7Q2n7n
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_092843_304210_CAA130CA 
X-CRM114-Status: GOOD (  10.53  )
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

Correct several mux/div widths (DSP_BUS, G2D_MSCL, HSI0 USBDP_DEBUG,
HSI1 UFS_EMBD, APM_BUS, CPUCL0_DBG_BUS, DPU) to match hardware.

Fixes: bdd03ebf721f ("clk: samsung: Introduce Exynos990 clock controller driver")
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 12e98bf5005ae2dc32da0da684a15133d64ed305..385f1d9726675b37a901e1bb6172dc839afbb209 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -766,11 +766,11 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
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
@@ -782,7 +782,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI0_USBDP_DEBUG, "mout_cmu_hsi0_usbdp_debug",
 	    mout_cmu_hsi0_usbdp_debug_p,
-	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 2),
+	    CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDP_DEBUG, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI1_BUS, "mout_cmu_hsi1_bus",
 	    mout_cmu_hsi1_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS, 0, 3),
 	MUX(CLK_MOUT_CMU_HSI1_MMC_CARD, "mout_cmu_hsi1_mmc_card",
@@ -795,7 +795,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI1_UFS_EMBD, "mout_cmu_hsi1_ufs_embd",
 	    mout_cmu_hsi1_ufs_embd_p, CLK_CON_MUX_MUX_CLKCMU_HSI1_UFS_EMBD,
-	    0, 1),
+	    0, 2),
 	MUX(CLK_MOUT_CMU_HSI2_BUS, "mout_cmu_hsi2_bus",
 	    mout_cmu_hsi2_bus_p, CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 1),
 	MUX(CLK_MOUT_CMU_HSI2_PCIE, "mout_cmu_hsi2_pcie",
@@ -869,7 +869,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_PLL_SHARED4_DIV4, 0, 1),
 
 	DIV(CLK_DOUT_CMU_APM_BUS, "dout_cmu_apm_bus", "gout_cmu_apm_bus",
-	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 3),
+	    CLK_CON_DIV_CLKCMU_APM_BUS, 0, 2),
 	DIV(CLK_DOUT_CMU_AUD_CPU, "dout_cmu_aud_cpu", "gout_cmu_aud_cpu",
 	    CLK_CON_DIV_CLKCMU_AUD_CPU, 0, 3),
 	DIV(CLK_DOUT_CMU_BUS0_BUS, "dout_cmu_bus0_bus", "gout_cmu_bus0_bus",
@@ -894,9 +894,9 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
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
@@ -986,8 +986,8 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 	    CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
 	DIV(CLK_DOUT_CMU_VRA_BUS, "dout_cmu_vra_bus", "gout_cmu_vra_bus",
 	    CLK_CON_DIV_CLKCMU_VRA_BUS, 0, 4),
-	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_clkcmu_dpu", "gout_cmu_dpu",
-	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 4),
+	DIV(CLK_DOUT_CMU_DPU, "dout_cmu_dpu", "gout_cmu_dpu",
+	    CLK_CON_DIV_DIV_CLKCMU_DPU, 0, 3),
 };
 
 static const struct samsung_gate_clock top_gate_clks[] __initconst = {

-- 
2.50.1


