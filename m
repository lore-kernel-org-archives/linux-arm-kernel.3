Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3FEE668AF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=; b=i5rbcWQGMyJwgoz41CPkhUu1u1
	B67v4tyJjPfPpYNg9cs4kZL7OSg8QNpPsF9vaMOiUQsQ6ohbs6lXw4L9sIN3mUvYX8lnj95kA0+w7
	LMmKByyPV/s3j1NF0zDH3+eUUsU/fR5JdYQYjQRKxjbrPSf7vfVBYJlN4+VrmXjHZrjh7ltpJU53f
	JGfqYVw2/JUkh40TaqPXTdqbobjf2onEUGBWPsgOFxfCLGyTDkzjh0cPJ4I8bXMavyM7RBl0GOrlg
	ruPl+44ukJ8xc2Q96yCvFa7RqduliYvMgQ2ZiJBnakO1zQy1TRD2grQPBGipbxR12rydvnQW2e2l3
	JZ1kWx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsuc-0000000BRTu-1uJw;
	Sat, 20 Dec 2025 09:06:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsuW-0000000BRRR-2bft
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:06:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso18059905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 01:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766221559; x=1766826359; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=dN2BITRVpS9kzmHC5XrF7i/89B9CO2RTseF/3MNByZzcKZhmyV2KozWEghp41/S9w2
         2quBJrA8FaN8e952Jl1jHtb2eWkaatBqmgZopM9kZpe3Z7ThhUBJcxKyTfMX0QRqusDj
         jZTPocWFIaynikLFLNqEx/xC9yp/bYRPxWpxtvtQb068rmN+FTqY60U9y4jfjCobj3O4
         aJqtbtU1UI5oZM6tYw63hNVZIIxnZv4mJbu8KS2EYPCTapGJ7hv2e+CDlWieBnJs79hV
         UXyq2A8UX1sOVc5tbR/7By2dDLAq20AIxPOakZwjf1LMQ0DYhdvSIJvJ3TYNQMtzecFA
         pyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221559; x=1766826359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=hCaEvTIdipVjRDX7e9ltAcuudO/Eb9cjOFXeim7/MVwvBu5hsYbgXdrHlNaQcfbczB
         W1y5DuZ5ECaG5W+1RedX5HilAXpPCk02RI+KUksPkIZHll7jpCxAmPigaMaM6cC94XMn
         n7psvzYU3+8VWunITQFAsXMF5LbnTFpXxUIyO9xeNGRZxj4UCbE06eXknSm3vSsEUcLR
         5+yUSyrFOfOcJTKwj8tD2abzupd8x6PNrLplu0/3NO354H9MgLo2yq286+3Ulng2Yb2R
         zJynsSGiUTF+eDIBHF4OB8Dw4vSb6Lv1PBP6PfIdzc/zheOjSnifnhfQ+tOssWOPaOHP
         k5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYF65EKung3a43iM8M1c9mUJskPPA1oFWegUvwA8OQ4cPDUmzENxfX52LR50QpuJ6Atb7C6xJv2d47KbAmAwj+@lists.infradead.org
X-Gm-Message-State: AOJu0YysQe9o1eapjx/uWdLeKin2PDBvmUum/e0SQFPq6NBo0hk54kc2
	gRcSUqW62HaygtlV0Exwfiico1gFVFY7LF458Cq7K70QgeiF8aZx647KELFnR0UfZEg=
X-Gm-Gg: AY/fxX6icgV19wmOwEQCzganS1fNlKEN952cdjG2ZsI9oMOwU8m2FvZ7Op0f0L3fowS
	XUn+xE1LMQ2O1hUEZsTgJg8oG8iuuMrtoSF8MSGhrlarGU3yeW1yTRJEDnhRgCLalP0p2wVafsH
	XWv0691M3R/SO2xWKDkRPGNqLJ0UaT1YBAUcIszCV9bNMXJ7yHHIjOpOeIJgECKb45vkk7TXY+7
	+GofQEcpQgol0IxG7dU69ZjFkAeevdSBJDz452tCuyucXL74tccoZRIgXr7HA6E/DrEDwmQ3wAk
	5gjTNS4eh24Sm51B/Wv+ciPj/J3yiVE43Yhe6zHzoKv/vCwB4db+R8hFkQhcLmyf/oTlqjf2Aod
	utM8XthShsFfchoYh9gXOL8RPpJSKViWyww48P4w4DbuyL6QYGjvG6siV8ZhHLTZFy13jofOkcv
	7ylkmEKV4jGGk3TgnX+4N1HChBuMsNONsksdubiIQ=
X-Google-Smtp-Source: AGHT+IFCUXWI6aw3Mi0uQPnoiCABpAeI+lRIlbv8QjWYLfVthEPpi5pHmK0OXgUKHYpht3AdIb214A==
X-Received: by 2002:a05:600c:470e:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47d19589469mr52722335e9.26.1766221558592;
        Sat, 20 Dec 2025 01:05:58 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm88466685e9.8.2025.12.20.01.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:05:57 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 20 Dec 2025 09:05:42 +0000
Subject: [PATCH v6 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-automatic-clocks-v6-4-36c2f276a135@linaro.org>
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
In-Reply-To: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6078;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=/Z6zZxIOHE0bexMt7q7vSkBhyGsyTsuiXJos9cuRaKY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpRmbuBqmDI4GAqQs79cB1AkMOySGopviN+P3hb
 uecIYdF8IuJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUZm7gAKCRDO6LjWAjRy
 um/vEACicphWUljDI3ykObAXL+bUHs0wN+2joaKqvPwVqdTWr6a25rNAvmK3kwjLayHZikDoLTd
 9TOeYdv8s6+1+g5zXx5RH4TtF+KNUlZpNkri3jjQKxWBLf0awRS/FVYr0rX+/+f8ECt92C81q95
 MMY8xU+jGvZ53TrxVmfSsnl/Wots3TaO9Bk499iz60mLtg/p1otQfObAeCBdL0XiguSEVQRBmIC
 k49HVnccEQ8k4lQagnSqG/V9YQ/PHYcMF0c4AAdBTvTKIgDBLN8bwiR/XR/49eBQSXIu7y44ok1
 Vrjf53DKBHZ9QNCAaVTS3qLRnXbPPrim7jUhRuLpo1SAMDZTejpfZRe+HTj+Fcio/tz9V+Au/LV
 R27RI11sZeZonax2PEHqRYlP/Z9PC1lGodEIOCs7y4YIaUy20zfevGfXJyPJL2Vqlq1hu2g3bt5
 e26Ss7JlxP1Eq+G/VVjx2rEK3HoaWe5Qrbib80x/oJs5K27+26PrVXeH3Fl/h/JAFY01/jtc2ad
 VZujbRnRRbK9b3e6c6kQ56v95kftLQIzUH3hsuYO3cr1A3BqiNyVmFNQJ5XJ4PldhvID8Egj9et
 wJJF1hAIHd7iDYaECNe/mSGc0MN989glz6BeSgMFTfivQnJOuSC86d4Y4DQ/Xbitiq6ZEL+Wc4W
 rgbbAo4+V6U6cYQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_010602_602031_869F2F15 
X-CRM114-Status: GOOD (  12.89  )
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
2.52.0.351.gbe84eed79e-goog


