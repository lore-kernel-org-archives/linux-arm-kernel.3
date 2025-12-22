Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08033D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=; b=w+/oJngI/qx12e+yTLnN98H5yY
	ou24iSQAXWkoQgmk6GfFs5a19zau8aI4tsLvt3skTYZO14IwE14HnhOYsP4gxuR60TBSMx5TzZP/A
	HQVzm1dV4baEAhFSqsYNPX5MxCSLVP2t5qbKk2FoKkn9KQgzj9g/MsnOHOWeq9gMVKG7osdB6MQTF
	7PUMJRZxO3cfvNSHK0rN+gC2MoXHsnxFYW3c0Nrkry5gPqO6Ha+FTH5bfKWR7X82YXlB1SFRDiWtq
	q7MvAkxvWvUwzMsgMYBKvEj00oY2XIbon0PmCzcZa35k7ViURotKy0K1yexlfYHl0boEFOJPBY2ot
	EA33yilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd3m-0000000Dc0Q-0xAF;
	Mon, 22 Dec 2025 10:22:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXd3g-0000000DbxJ-2QMF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:22:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso2475961f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 02:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766398951; x=1767003751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=smkGsKGJd1Z6CH+f9+NLrF6Jt78YZLYzmEann9vSXBKoe0JVn2GpshzOfDHzNwUyEp
         tk6/esOWawgI0kH6M/ZirZLxs385YQdpDEQn4ayyjiQGz/LZ1KQEaMq5pGZksIZwDRXg
         Wh3oiVP5UhrEa3DkcP3OqmD/sb8gb5uyKzz9Off+g/5mIRQaQr94tYJR1+RZ71BB31Xz
         YWdPbRbLwCk1/wByZXzUczx/yVTB6fOKycMWG4gT+y4GkZj+CVwWuPv9YJXIbbuG8qNE
         o+01TL2kvpzoaRuEbqi71TGksXCtdl8XhplnjynrEXK/kNpU/yhtsIClwxex+s5me0Zg
         gwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398951; x=1767003751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT6Q5dW5KkgWP7tZaLfWqSYR2o+Foff/zTHPq2XLG/U=;
        b=HUeveC/AK8odazcMqYEXgV2eXxYonah1zNwbnQ6Fj7VSawdOw9fBb67fBjfR65S2hn
         fHdFPzQRR6VTYaIztKbDii6u882t2Cr/h2cN2I5qFgfD0UGIn1KjqcQo2MPnaLOjE6I4
         036lmp2eTzA/m+Wria3KUqaNTGzBAKHq23MB496Q5qO7elrW6XZmbdeI1ar604kTojpn
         EM1G9ZFgSq9v7dDjvNe/vJQkhpOF9mFgJrIRJFKiWGY2UmIyYHWdcYWfqd3StD/yBHiF
         KkZIU9dTF3jHT/3dXBEDxB3eKvo255MFWXmzWRwLrx4vBQPdPYzPAOlsKD4hngYka6IC
         4O2w==
X-Forwarded-Encrypted: i=1; AJvYcCUCCPGBKLQCv9tLa2Zpe6Z01DEPsBZXrmvWTjg3M0hK6qP6F6l6L7PP8OQ1c1tXZzAlzxINlgND6P+Sr5rmEWeX@lists.infradead.org
X-Gm-Message-State: AOJu0YwLo3ZnMCbuXraep8yWTsTzycom64OfREloX4iO28PhkELTD4rp
	bcN/HQ7bcZ8p7r2CK0tRr0HlCP68VlrS1l0DuduN+U/96IRcnIfiDqRbmpQSMIduwBY=
X-Gm-Gg: AY/fxX5hjMJkmQksznGqyR1JJ9uC9X28fOetIMQl8nIIH1a8YTG6S5XFox5EkYlqgOn
	eRyUPvmuz+pXabayTUuSHxkRXrEeg8wMFUbxNXLVp2SsW0HHkMKUveWGTswxERommcaUtiWaoJx
	GO5R3FtVZixD2CpzIgwUVQsHQnECgSY2OsDYykjVJkdyx1knzSxvmAQ0aauJdSPEGh5T2saaGXI
	DgG/fWOiP0D4/ptjJ4D73hJhFmBaqP/+dcUuvRgFkpigyAXZbyfjcZOGuNH4b06934Lpnc/Jrb9
	TvqB4siaLRYWkvbYm7kgbJcSG8dbhyh2RoRCz1SGDrS2DE128INR4k2HDz0is65HYPZtK+6yI9r
	gLiPkmbuQrFSVScy1UVjReJt8zeUBlA0Qvjhq9vaNHk4zRSNhCSjdEqwL+3E2gxGCwWjNo495eY
	plTzJXJ0WmoQ8r76rYSK9B+lUZy+oK6j1n2U/Z0nc=
X-Google-Smtp-Source: AGHT+IGxik5wZb6PJ3ZvxaBK6HnP18pgqXLZsVTlxUcURxM01dwk5X4GOejTSgcqBo9Mh0RevTTv5Q==
X-Received: by 2002:a05:6000:2203:b0:431:4c6:724d with SMTP id ffacd0b85a97d-4324e4fdb00mr12420505f8f.29.1766398950600;
        Mon, 22 Dec 2025 02:22:30 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm21082813f8f.24.2025.12.22.02.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:22:29 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Dec 2025 10:22:15 +0000
Subject: [PATCH v7 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-automatic-clocks-v7-4-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
In-Reply-To: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
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
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpSRve79sRE6Wiibe1gwos813YqTCmnceQ/Jgxj
 ODyrBDXma2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUkb3gAKCRDO6LjWAjRy
 up+3EACCbn7AeVJ7SP/7s4uvGaRUCmaTr06pvM6zozJEYE+UeOH9TaLN9jslCVOvFFCAwS8b8tf
 NjFfpkUdp3yqWM6Nq0k79AKldDt85/ay/S8coqz4d/HxeJizxgKnnXUes1aYZgPk3Gj6qsCDzjP
 WigzwpGEZGeUWlEng5E6AX1p/GDo38haM4tasUTJSKJ9fIub8K3+HrMur/vncCKwR5o0Y/HQuPS
 I/1cNb559uo+JhGUmkpoMZFprCBxZquuOxL/YGas0tv7xP+rKXT9PhxI9Rn8YDh+TTAfc9C/X+t
 jCBIKqNUq4seCMq0JQsnRIKWklAmMvysUBZii0rTk1e2G6zKUXfmjEbplMIV+Y5ko6oWXTX7Rk9
 FeSvR7UAGlBM2zOgxAXszmYI6uOnIBL01bV7nE1Bc93DtbH1N8G9kboJcOiwzz/eXdD1kxEc+cC
 yAig1+wRjENdZhs9fTx4Ugmm+FhOR28v3peBDOZBi7XSgAxNKYgqbStE67MQxBjYT5/kt+beTlt
 7JXRW9/792mhNEBAL6VN+daYxGsD4gpJ8iCuO4FIHabBNke+wTv/35hZfI6HLy1WbprqkP3mp4P
 +22N9tplsARHac5+SPa1Pq+yW3EFdM0erf1ZuW1RoG3P3G4J5xpdJ8imcy758Dxo0iJ0YIQPWqV
 RZM4gcywVoUk0bg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_022232_736631_12C81C21 
X-CRM114-Status: GOOD (  13.32  )
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


