Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA399CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOwFRvCEdZzkFfvfdm8z0oYu/8qYTs1V1OQGGoFSV3M=; b=i8GkZfjcqPoKIeSSoSBzAv3kBu
	iYAaen4its46HksyYjsooIZABmw6YmWrVim80mZTSbquAsVD+qDwKqRNFuRVMZjnmkjbym0bROJOH
	TFEeYMyw65bR/FQkkK1trCu52bo/qqFXsbEEtJHn/PsW2Onc1ClhQ+i5HtbJlM1Ez6G6S4h9pFV3f
	oyXXDg0A+KSpsenNYQliCESU4niVEwS7+mqEbg+7giaXczTUvqN1EpjV7aLnUMu93ySI6IrVZ76wi
	PfNBCYin1n7IsknCNOHkOrdS9zWIDtG4kTkPd12NlQ9jQ1meXRLRs1HRFK7MSmK03lHKBnYnBNv4X
	7s55U26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISmS-00000005ZTT-0Cuu;
	Mon, 10 Nov 2025 14:22:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISmN-00000005ZPb-1xSk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:22:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477632b0621so20907725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 06:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762784518; x=1763389318; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOwFRvCEdZzkFfvfdm8z0oYu/8qYTs1V1OQGGoFSV3M=;
        b=cJYl5JYMyR451+T1kF91VW65m10YO+86SPyt11NyaKhDhFO3BlzZJ+lcBsGpCrMk21
         VBCEybAgvuGnr57tdzQxkZMconTpeig9drTBCENMII3CCjCBFY0Ya2tTe5flynBK8GmG
         12w+tJ5gvkF7cW2oO7CQuU3FlggSCnC/qUQ2jQjS5SXyJ7/frmsyggRlG52tTN2LC+F8
         +sR0gRfoWxd/Vh1CJOHTiT91aZT7rWVn7pWNZKcF/xGXflfXgljHsPBQjU/dHJ9KembK
         OZPXqq+le2WaOJ4XQqzp3Krk2rmomKuYjERU1ha5C5hsYN55xUDJ92qZpeQyGR+jzXlV
         jfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784518; x=1763389318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOwFRvCEdZzkFfvfdm8z0oYu/8qYTs1V1OQGGoFSV3M=;
        b=W9DQ7XTFsxfCZfkSYfl3sGpYIHqUihjuiGD2ZQnx7hAT1E0rdwpyICsKRoiHWCyv2j
         U+q60NC94lutW9OWtgN80qSHEKQ//qiSXuAhrbeQ2ADNK8rHuY4AzkXS1BS1r0BsLuP/
         elcn+RExxR6cKZlWrjlj9Os51hVFd5PonquRu2aPL0qFIV7gS+abFLT3r3VMF9znNk69
         rSmiJmU11u1AQ8DwRpOM7JAshWLo+iB2EFvUU1mOSqBpb7MJ0d+tOTUWp0dCWbtKo//3
         24gfsGWg+gFTU5redu2dYLLc+arR+osj97ypMZtzcpc39UswXqccbzGV7oMvZ1phCzud
         lw0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG0heoRrZTDjWVAQUz1Mx4xRUbTbbA6Tom9LI5hhhwzEion3GRJpsTjNh8KEfl1Qvf9z75NqGOnmlCQGmjMUVA@lists.infradead.org
X-Gm-Message-State: AOJu0YxjzUXFXysoHelEhlNKBmkwnaZhWS7kQh+OUU0HXxiS6qlbFq0o
	Zts7VDpXZKqDofMoiD1Hx9BZ91lj8Ik9tNQiVmnnR/PML84Bf9HxmIScBrqvIhdjUC8=
X-Gm-Gg: ASbGnctYrPSkPsESKqvuwTlfzXlMBlmABgjT/WitUtJiW3GZed7Mtp5pQXTuk5aQGRp
	SXwm+7NoQAJ6B+Ef4vC+AhVaWKlGjad0uCiYwbY/OWBV5R8ZQhK6T/zdbviB6/LyZNGZIBAgrMS
	snsSfAalQd8Nn7KKgCjxNerdhFv30L2DBAYR9gdI4/XfSUJ7UgcnAiRfFBx8KNAMtKr6j03TOTi
	C9ehUGiG9Hu6jmf7wTsIdFmuau3YRC4DKZb3C1CYR03xRRPHegWvN20nu+kVeWi/HbpCToQq4Vk
	aHU8y98DTgHHSrBM7UPzXnQI+PEfbkFMaLjGhrllPqA1M6V3IZXcU8wzpw88wRkwFjNq7PvpyfX
	aRCAwvW5DDgA1u768EN+vexiSdCh37xMIwRf9K4fqEJeAjc9sffrBkIww6Xaf4wtP/h/QfSwd1V
	TsUiaGUUELtJQ2soCoWszlTBZcFKn/mbgtQZ/R3rSk
X-Google-Smtp-Source: AGHT+IF2FY+sfpra6zGaJJU5705lujYWG3mUN0dR5cqOL38u/TK/JHtBicpV9yf2j7aNAokYl58Mbw==
X-Received: by 2002:a05:600c:4448:b0:477:7a62:9e5e with SMTP id 5b1f17b1804b1-4777a629f9bmr41454755e9.29.1762784517602;
        Mon, 10 Nov 2025 06:21:57 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776a953414sm104369435e9.0.2025.11.10.06.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:21:57 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Nov 2025 14:21:43 +0000
Subject: [PATCH v4 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-automatic-clocks-v4-4-8f46929f50b7@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
In-Reply-To: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6079;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=jIypiDUl624lNEyYLbun0Yh5DHuTSkotJxPTbp5HxfU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpEfT8e0Iue7MCveOT7FhgBeWjwRUZfaZbi9SGQ
 Owj5idFyl2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRH0/AAKCRDO6LjWAjRy
 uk7vD/93ZXmcGiRvOsKCrysJwj+fxuO+fcvsiFohPcxKlt3+A/McbgRi3oHMpg9lWgOWTu6e1Gv
 /tB6Yozt/J76iYstqgp6TJ5wGwCdloW73ctS72pQfUn8t9OrD19P065p3CyfXlU0uKFoF28JBlD
 o39taPk6KhsI5lOnS5fEZKNswPy2ao1eBxgo79CuiGk8Y/8LuWbzY68ZoDeOKqX38lgRUgue4cz
 hgbBwgAzaxHbbxZXHJkfnvPgm/q3fXgCXsvzXUOiJUTGzyykaAtK/F4y7TcsvgcX5U2xpyYq1Ap
 jcYXEBYjz/aA+p3bxpfZmBOofbnyBffw0jULPHIOdeUZrdH1ilnFq2jRf5NHnIjbRELI89lWdDl
 hZ/ozZ2oXGF+gNaKABGf2kFGPYYmRpJHG1oliFfS65/LdmLQVEIb7zxs4aPuWAT3OrHqYYlRskr
 SA9YXPepfCQpY5ef9ylXq2k555mdlKXtlrYwGlWIwdYtefxAzPfeGqlEmbwjyfpPW0OzNb/w5Jk
 5mUu/Swq3m2FmbJGUJKnN40FTEqViNN5zSoH91l60g0CC12UxpMouPBwL9jfJwj/9EvJypa1znI
 Iuyvce+nC5/6ywmLPGgREt43uu1+HvB1KiYr7sN1Vz8nABKYdIHFNKO/Oz2V/IfIGpKrmCQ5ttd
 Jq/m3267ddOcdlQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_062201_185928_957E9989 
X-CRM114-Status: GOOD (  13.87  )
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

Enable auto clock mode, and define the additional fields which are used
when this mode is enabled.

/sys/kernel/debug/clk/clk_summary now reports approximately 308 running
clocks and 298 disabled clocks. Prior to this commit 586 clocks were
running and 17 disabled.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Remove unnecessary header of_address.h (Peter)
---
 drivers/clk/samsung/clk-gs101.c | 55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..8551289b46eb88ec61dd1914d0fe782ae6794000 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -26,6 +26,10 @@
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
 
+#define GS101_GATE_DBG_OFFSET 0x4000
+#define GS101_DRCG_EN_OFFSET  0x104
+#define GS101_MEMCLK_OFFSET   0x108
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
@@ -1433,6 +1437,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= cmu_top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
 };
 
 static void __init gs101_cmu_top_init(struct device_node *np)
@@ -1900,6 +1907,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 };
 
+static const unsigned long dcrg_memclk_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+	GS101_MEMCLK_OFFSET,
+};
+
 static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.mux_clks		= apm_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(apm_mux_clks),
@@ -1912,6 +1924,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_APM,
 	.clk_regs		= apm_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(apm_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI0 ------------------------------------------------------------ */
@@ -2375,7 +2393,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI0,
 	.clk_regs		= hsi0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(hsi0_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI0_CMU_HSI0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_HSI2 ------------------------------------------------------------ */
@@ -2863,7 +2888,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_HSI2,
 	.clk_regs		= cmu_hsi2_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_hsi2_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= HSI2_CMU_HSI2_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 /* ---- CMU_MISC ------------------------------------------------------------ */
@@ -3423,7 +3455,14 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_MISC,
 	.clk_regs		= misc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(misc_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= MISC_CMU_MISC_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
+	.memclk_offset		= GS101_MEMCLK_OFFSET,
 };
 
 static void __init gs101_cmu_misc_init(struct device_node *np)
@@ -4010,6 +4049,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     21, 0, 0),
 };
 
+static const unsigned long dcrg_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+};
+
 static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
@@ -4020,7 +4063,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC0,
 	.clk_regs		= peric0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC0_CMU_PERIC0_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- CMU_PERIC1 ---------------------------------------------------------- */
@@ -4368,7 +4417,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_PERIC1,
 	.clk_regs		= peric1_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
 	.clk_name		= "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = GS101_GATE_DBG_OFFSET,
+	.option_offset		= PERIC1_CMU_PERIC1_CONTROLLER_OPTION,
+	.drcg_offset		= GS101_DRCG_EN_OFFSET,
 };
 
 /* ---- platform_driver ----------------------------------------------------- */

-- 
2.51.2.1041.gc1ab5b90ca-goog


