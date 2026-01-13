Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4A1D0C850
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cw5s/9FXOGo2Nyz/FALWXS9ryiNDWp684x8EGVLsobE=; b=CQlhT22d5MN/fNMX2uNMIFFuYm
	qn2egWRmrbNaqSZMF5/+OUQ5Lp5vm+t6fnOqgQReW/d4PkeB2zDcebq2Nk2zFUmqzu6HGt5tvdStS
	VYCWZzKTUXfxHAQhF6g2tHVN2MUUHZojrU/h3aHI1WBnWSjagT/umhNXsrJuoFaryJD9a+ZwhUfkO
	5BEl8JOCAGcoIPaN3TErych0gXXyLcWTAbt753yTwWAqqOZ90r7QE62S4spZHCq84oqmOmeNPkF9R
	7FLrXjf6d9goTknc2s1e/OqUZ9nzSYVV+GZTS7nmRfOj3hO0OTl8OIKdx8F1UrkJ4dwaHuWPY7HBm
	+R03VooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7n-00000006wes-0Gae;
	Tue, 13 Jan 2026 10:59:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc7c-00000006wZH-2mHF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:59:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so3842547f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301975; x=1768906775; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cw5s/9FXOGo2Nyz/FALWXS9ryiNDWp684x8EGVLsobE=;
        b=PvCZFvkRl/0MmDIzaswKrctmObCcAtbZ9v5I/OEHGht+/aoIfuD0Hwufln7PIBFxkV
         96Mio6CpEyJ+dEIiPx+csl7c/l9HKPX33uVWbxwKBhRbe5Hk5u6BHZ9SfJ7B6Tz4U+sV
         i5DIEkam8SeHUWHgjZyWvVSWPTPMDvDJNO5CoM8SzPLGiLZH+EwKNfCvkRYd76mkIIdz
         a695/3p+CrADCKo0sXK3151dxD64X9ElP8jjt5pFUZUUJD511s3jNEW6yWRWgZ402Iyn
         VgkdAzBNwVTyFjOiDbvPYjKHoSM3JLP1paHWBYFSS4TiNLgtCmB3PjpopRjUA2O06fCd
         1dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301975; x=1768906775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cw5s/9FXOGo2Nyz/FALWXS9ryiNDWp684x8EGVLsobE=;
        b=AoO3QvXkXxmPa53kc5inrcYoxLP9eptZFzZwiSs5hDcxWUSmztevy4qDSRlYChmVsA
         /Lh6pG61mmLxE/5EYtYhMfDjPwV83ioE8D+ow4dNjv+W8UCXMGwXMFScXAs6cfX15kPA
         AT5sdwqjjsFwXvMjjyMZYqspVkgPogQ0tiHFMjjZmvW7iCKy03zVigM1Z40kRWmD6Yjb
         EGEtSH6BYYmI1gZh+syy54JGkUsxLYO8Vy8lNDLxR7BYmsgB69GhhZlN441JylCgsvfq
         v3VPWAfLdOTZBz1uwBj5TTBq4Q3C0bbocPOd3AkZmwHM+MPnxcV/tNm63hwJzq4YLDtv
         GH2A==
X-Gm-Message-State: AOJu0YzgMxF4VMEILMqP6pfGUCePcVbfla1GITnhWynGEiMw47i37K5T
	4OMbJvvNuWUlkDYnhZAKPNcFS8C1tXAetWey398WtnBPCZWjy4oLXaC4nPbkM10qhuQ=
X-Gm-Gg: AY/fxX6ZRaLavZAJ0bLDGHksxxdxvLXKb/yiGMXdbatu39qgd2DgUUzEkd36EYK6htJ
	9NMBuZDJj8EU4NVzik8zKZtCbEse3VDExC/06pkRL8q7uf/YRfEbH5wf+kch7IdIGiutY3jPKNf
	Pid9jJUIixlSwqjttTOvoBFDL2LBth1rEZcbYLmlYoJSoTIMH3/3UR7nW2lwrjTEoI59R3SY1Eg
	dkm1cgDl0kdsyPu1QfTpxO4rBJSD0WDgb2I/+dT+Q732Uq7Zc9cagKiAfhLUV0L24OcPtsxAClw
	nrMISJfbsbtnPe/VSDab73ejUwRMjTg2rwVpxTQZ6N1rlA1CEjZ/dn5pz37txL835QOvJMMtUzg
	M3mOl8D7ewgAFMB9o97GgIGc6SnX2x2LtIEptveC48Bj4s5Oiqa3rSHrXbincqjezUJ5ng9GIp6
	dpx1gZQ7okoLPL04YchyQEvKwZEI25xNAn6zDnkc+Y3ic=
X-Google-Smtp-Source: AGHT+IG0VvB51tTkViTjKtTdpRRLg7r3B4Zfjz/bkpAr8Hvcc49TpG2HCfoV8lLSNUuGQRCVDMzTIw==
X-Received: by 2002:a05:6000:2509:b0:431:327:5dc2 with SMTP id ffacd0b85a97d-432c3761063mr25033030f8f.51.1768301974596;
        Tue, 13 Jan 2026 02:59:34 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:33 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:59:01 +0000
Subject: [PATCH v3 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-dpu-clocks-v3-4-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15918;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=+hjXnWtL9eYvFwU55PqJXTaPNxFUodr0OSJU9u3SZPo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWOwebFW9w7/CE2ug9LmOAuUjLUpZ1rSPOue
 9BXJP63fAWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljgAKCRDO6LjWAjRy
 upX/D/43eognDr7nmS+2Bu0xOR8ic8e0adpk8biRtkkWXthihn2130c7Q1+c8two4yaWe2o9CNZ
 c5dNYYdl+LCT6WPGKP20XCP4lgem6HNAcTGPH+47GovczHhIQRUO8NEtyRiedfzq1fTC4ab3VmN
 majn0MfQjhkbm1PkV6D9PgGrCNh1XloMdVXQZoAOU7OPIVlPkPSqvTRI7t4hYlBk0K1pjcaGMIa
 goICtsqGV0wu3WFfnHFIYTqQnY54AjkD2XWSkvH7+BRytdwHPIUAyIta7dbvHjzv/K5yqpLNqoN
 KZsbTEXA2a4OjKtOUWNl4XzifdDpAFrzfQAP8Ts+kkoqZdpj7D21F0XPMQKi8V+NbFDyHWJTiHe
 tR3aG61guKwzyb/kxnfcvSOJmchZtzXxFw9E/lN3W3veCQeOlYAuOfhhoyqbLFs98eC7YV1SbW+
 2/06uPPnHBVomNKVF4qJpidKo9BE3UkeLWkjOf5gS0hBykzebU3E++ttYeoWdlmJwpGsZ0N4tLq
 Ef56s4bBlUi42j6bMUkoCuonK96/SWfUpUCbY4GBFq6suJ9ZE6ETEWtRIqlyeJ9e5WOHbb7cfy6
 jWui/81cbasysyfOO/soN8oCBQ68wkODAki0dp0avTYcOBPkGb+2ttbl2Iyu4SQ+J+hovPs2p9z
 LPwH9X2ca1q5/gQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025936_853311_B1ED2ED9 
X-CRM114-Status: GOOD (  12.75  )
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

cmu_dpu is the clock management unit used for the Display Process Unit
block. It generates clocks for image scaler, compressor etc.

Add support for the muxes, dividers and gates in cmu_dpu.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3
 - Alpabetic ordering for all cmu_top children (André)

Changes in v2:
 - Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
 - Fix dout_dpu_busp parent (Peter)
---
 drivers/clk/samsung/clk-gs101.c | 283 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 8551289b46eb88ec61dd1914d0fe782ae6794000..44a8ecd332fddce7d4e162219528462ce3c8c03f 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -20,6 +20,7 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP	(CLK_GOUT_CMU_TPU_UART + 1)
 #define CLKS_NR_APM	(CLK_APM_PLL_DIV16_APM + 1)
+#define CLKS_NR_DPU	(CLK_GOUT_DPU_SYSREG_DPU_PCLK + 1)
 #define CLKS_NR_HSI0	(CLK_GOUT_HSI0_XIU_P_HSI0_ACLK + 1)
 #define CLKS_NR_HSI2	(CLK_GOUT_HSI2_XIU_P_HSI2_ACLK + 1)
 #define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
@@ -1932,6 +1933,285 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
+/* ---- CMU_DPU ------------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_DPU (0x1c000000) */
+#define PLL_CON0_MUX_CLKCMU_DPU_BUS_USER					0x0600
+#define PLL_CON1_MUX_CLKCMU_DPU_BUS_USER					0x0604
+#define DPU_CMU_DPU_CONTROLLER_OPTION						0x0800
+#define CLKOUT_CON_BLK_DPU_CMU_DPU_CLKOUT0					0x0810
+#define CLK_CON_DIV_DIV_CLK_DPU_BUSP						0x1800
+#define CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK			0x2000
+#define CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK	0x2004
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM		0x2008
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA			0x200c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP			0x2010
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK			0x2014
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK			0x2018
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK		0x201c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK		0x2020
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK		0x2024
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK		0x2028
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK			0x202c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK			0x2030
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK			0x2034
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK			0x2038
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK			0x203c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK			0x2040
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK	0x2044
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK	0x2048
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK			0x204c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK			0x2050
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK			0x2054
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK			0x2058
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK			0x205c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK			0x2060
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1		0x2064
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2		0x2068
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1		0x206c
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2		0x2070
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1		0x2074
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2		0x2078
+#define CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK			0x207c
+#define PCH_CON_LHM_AXI_P_DPU_PCH						0x3000
+#define PCH_CON_LHS_AXI_D0_DPU_PCH						0x3004
+#define PCH_CON_LHS_AXI_D1_DPU_PCH						0x3008
+#define PCH_CON_LHS_AXI_D2_DPU_PCH						0x300c
+#define QCH_CON_DPUF_QCH_DPU_DMA						0x3010
+#define QCH_CON_DPUF_QCH_DPU_DPP						0x3014
+#define QCH_CON_DPU_CMU_DPU_QCH							0x301c
+#define QCH_CON_D_TZPC_DPU_QCH							0x3020
+#define QCH_CON_GPC_DPU_QCH							0x3024
+#define QCH_CON_LHM_AXI_P_DPU_QCH						0x3028
+#define QCH_CON_LHS_AXI_D0_DPU_QCH						0x302c
+#define QCH_CON_LHS_AXI_D1_DPU_QCH						0x3030
+#define QCH_CON_LHS_AXI_D2_DPU_QCH						0x3034
+#define QCH_CON_PPMU_DPUD0_QCH							0x3038
+#define QCH_CON_PPMU_DPUD1_QCH							0x303c
+#define QCH_CON_PPMU_DPUD2_QCH							0x3040
+#define QCH_CON_SSMT_DPU0_QCH							0x3044
+#define QCH_CON_SSMT_DPU1_QCH							0x3048
+#define QCH_CON_SSMT_DPU2_QCH							0x304c
+#define QCH_CON_SYSMMU_DPUD0_QCH_S1						0x3050
+#define QCH_CON_SYSMMU_DPUD0_QCH_S2						0x3054
+#define QCH_CON_SYSMMU_DPUD1_QCH_S1						0x3058
+#define QCH_CON_SYSMMU_DPUD1_QCH_S2						0x305c
+#define QCH_CON_SYSMMU_DPUD2_QCH_S1						0x3060
+#define QCH_CON_SYSMMU_DPUD2_QCH_S2						0x3064
+#define QCH_CON_SYSREG_DPU_QCH							0x3068
+#define QUEUE_CTRL_REG_BLK_DPU_CMU_DPU						0x3c00
+
+static const unsigned long dpu_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_DPU_BUS_USER,
+	PLL_CON1_MUX_CLKCMU_DPU_BUS_USER,
+	DPU_CMU_DPU_CONTROLLER_OPTION,
+	CLKOUT_CON_BLK_DPU_CMU_DPU_CLKOUT0,
+	CLK_CON_DIV_DIV_CLK_DPU_BUSP,
+	CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2,
+	CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK,
+	PCH_CON_LHM_AXI_P_DPU_PCH,
+	PCH_CON_LHS_AXI_D0_DPU_PCH,
+	PCH_CON_LHS_AXI_D1_DPU_PCH,
+	PCH_CON_LHS_AXI_D2_DPU_PCH,
+	QCH_CON_DPUF_QCH_DPU_DMA,
+	QCH_CON_DPUF_QCH_DPU_DPP,
+	QCH_CON_DPU_CMU_DPU_QCH,
+	QCH_CON_D_TZPC_DPU_QCH,
+	QCH_CON_GPC_DPU_QCH,
+	QCH_CON_LHM_AXI_P_DPU_QCH,
+	QCH_CON_LHS_AXI_D0_DPU_QCH,
+	QCH_CON_LHS_AXI_D1_DPU_QCH,
+	QCH_CON_LHS_AXI_D2_DPU_QCH,
+	QCH_CON_PPMU_DPUD0_QCH,
+	QCH_CON_PPMU_DPUD1_QCH,
+	QCH_CON_PPMU_DPUD2_QCH,
+	QCH_CON_SSMT_DPU0_QCH,
+	QCH_CON_SSMT_DPU1_QCH,
+	QCH_CON_SSMT_DPU2_QCH,
+	QCH_CON_SYSMMU_DPUD0_QCH_S1,
+	QCH_CON_SYSMMU_DPUD0_QCH_S2,
+	QCH_CON_SYSMMU_DPUD1_QCH_S1,
+	QCH_CON_SYSMMU_DPUD1_QCH_S2,
+	QCH_CON_SYSMMU_DPUD2_QCH_S1,
+	QCH_CON_SYSMMU_DPUD2_QCH_S2,
+	QCH_CON_SYSREG_DPU_QCH,
+	QUEUE_CTRL_REG_BLK_DPU_CMU_DPU,
+};
+
+/* List of parent clocks for Muxes in CMU_DPU */
+PNAME(mout_dpu_bus_user_p)	= { "oscclk", "dout_cmu_dpu_bus" };
+
+static const struct samsung_mux_clock dpu_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_DPU_BUS_USER, "mout_dpu_bus_user",
+	    mout_dpu_bus_user_p, PLL_CON0_MUX_CLKCMU_DPU_BUS_USER, 4, 1),
+};
+
+static const struct samsung_div_clock dpu_div_clks[] __initconst = {
+	DIV(CLK_DOUT_DPU_BUSP, "dout_dpu_busp", "mout_dpu_bus_user",
+	    CLK_CON_DIV_DIV_CLK_DPU_BUSP, 0, 3),
+};
+
+static const struct samsung_gate_clock dpu_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_DPU_PCLK, "gout_dpu_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_CLK_BLK_DPU_UID_DPU_CMU_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_OSCCLK_CLK, "gout_dpu_clk_dpu_oscclk_clk",
+	     "oscclk",
+	     CLK_CON_GAT_CLK_BLK_DPU_UID_RSTNSYNC_CLK_DPU_OSCCLK_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_AD_APB_DPU_DMA_PCLKM, "gout_dpu_ad_apb_dpu_dma_pclkm",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_AD_APB_DPU_DMA_IPCLKPORT_PCLKM,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_DPUF_ACLK_DMA, "gout_dpu_dpuf_aclk_dma",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DMA, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_DPUF_ACLK_DPP, "gout_dpu_dpuf_aclk_dpp",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_DPUF_IPCLKPORT_ACLK_DPP, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_D_TZPC_DPU_PCLK, "gout_dpu_d_tzpc_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_D_TZPC_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_GPC_DPU_PCLK, "gout_dpu_gpc_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_GPC_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHM_AXI_P_DPU_I_CLK, "gout_dpu_lhm_axi_p_dpu_i_clk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHM_AXI_P_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D0_DPU_I_CLK, "gout_dpu_lhs_axi_d0_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D0_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D1_DPU_I_CLK, "gout_dpu_lhs_axi_d1_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D1_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_LHS_AXI_D2_DPU_I_CLK, "gout_dpu_lhs_axi_d2_dpu_i_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_LHS_AXI_D2_DPU_IPCLKPORT_I_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD0_ACLK, "gout_dpu_ppmu_dpud0_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD0_PCLK, "gout_dpu_ppmu_dpud0_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD0_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD1_ACLK, "gout_dpu_ppmu_dpud1_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD1_PCLK, "gout_dpu_ppmu_dpud1_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD1_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD2_ACLK, "gout_dpu_ppmu_dpud2_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_PPMU_DPUD2_PCLK, "gout_dpu_ppmu_dpud2_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_PPMU_DPUD2_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_BUSD_CLK, "gout_dpu_clk_dpu_busd_clk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSD_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_CLK_DPU_BUSP_CLK, "gout_dpu_clk_dpu_busp_clk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_RSTNSYNC_CLK_DPU_BUSP_IPCLKPORT_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU0_ACLK, "gout_dpu_ssmt_dpu0_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU0_PCLK, "gout_dpu_ssmt_dpu0_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU0_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU1_ACLK, "gout_dpu_ssmt_dpu1_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU1_PCLK, "gout_dpu_ssmt_dpu1_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU1_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU2_ACLK, "gout_dpu_ssmt_dpu2_aclk",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SSMT_DPU2_PCLK, "gout_dpu_ssmt_dpu2_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SSMT_DPU2_IPCLKPORT_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S1, "gout_dpu_sysmmu_dpud0_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD0_CLK_S2, "gout_dpu_sysmmu_dpud0_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD0_IPCLKPORT_CLK_S2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S1, "gout_dpu_sysmmu_dpud1_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD1_CLK_S2, "gout_dpu_sysmmu_dpud1_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD1_IPCLKPORT_CLK_S2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S1, "gout_dpu_sysmmu_dpud2_clk_s1",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSMMU_DPUD2_CLK_S2, "gout_dpu_sysmmu_dpud2_clk_s2",
+	     "mout_dpu_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSMMU_DPUD2_IPCLKPORT_CLK_S2, 21, 0, 0),
+	GATE(CLK_GOUT_DPU_SYSREG_DPU_PCLK, "gout_dpu_sysreg_dpu_pclk",
+	     "dout_dpu_busp",
+	     CLK_CON_GAT_GOUT_BLK_DPU_UID_SYSREG_DPU_IPCLKPORT_PCLK, 21, 0, 0),
+};
+
+static const struct samsung_cmu_info dpu_cmu_info __initconst = {
+	.mux_clks		= dpu_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(dpu_mux_clks),
+	.div_clks		= dpu_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(dpu_div_clks),
+	.gate_clks		= dpu_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(dpu_gate_clks),
+	.nr_clk_ids		= CLKS_NR_DPU,
+	.clk_regs		= dpu_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(dpu_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= DPU_CMU_DPU_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+};
+
 /* ---- CMU_HSI0 ------------------------------------------------------------ */
 
 /* Register Offset definitions for CMU_HSI0 (0x11000000) */
@@ -4443,6 +4723,9 @@ static const struct of_device_id gs101_cmu_of_match[] = {
 	{
 		.compatible = "google,gs101-cmu-apm",
 		.data = &apm_cmu_info,
+	}, {
+		.compatible = "google,gs101-cmu-dpu",
+		.data = &dpu_cmu_info,
 	}, {
 		.compatible = "google,gs101-cmu-hsi0",
 		.data = &hsi0_cmu_info,

-- 
2.52.0.457.g6b5491de43-goog


