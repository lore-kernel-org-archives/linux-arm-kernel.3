Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E72CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 21:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFhpMv0TS5z8Ka1Q09jnxxHQC5OXHmjo9VvdfZH94aA=; b=HGpWdlZm0F2Nbfh/bpNkYUiXoj
	xpsFSHjk8xKGx+0GRcYt+Y+dkQpz9K4nyBz69cJO2zk0r1is+zAhr3nEplcdxoLT0BvmNgwoiCeJT
	SgoP9ZBx8SFO5LPLwCUAckTf6VOM/9nbCvG09YcLxWDlJ77XYuhf7BzSXi+AChevsFPvYlDJwGkkF
	uAHW8Q9Iz0pcxTFybNz/s30qQ0I4a6ZWwBcmSXCX+7B9WugO2472R1ogHYpfKvS7yZ2QBgRoUQIW7
	dOICcuE9BfSB5jhSJOqkRQB4f9zDP36fl0KzwHUVoOkAO16uUt1GYK273tKgxcI581BVmZu7ABEOp
	VEzN42Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDkm-00000002xzj-1iWY;
	Wed, 29 Oct 2025 21:30:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDki-00000002xxv-3nGD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 21:30:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4270a3464bcso239867f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761773443; x=1762378243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFhpMv0TS5z8Ka1Q09jnxxHQC5OXHmjo9VvdfZH94aA=;
        b=sHDwiVrKOgiHaRD7YJcUEK0NA9R315BiJ7e3Z59rMlbDVQTZWat9eTRBPsmqj/WJXO
         rfjOPD630LH5iiif9J2x5lRG1J8Y5SD7RshkNJga2q425F/VhASV660L/hsGVKb0ngr/
         GY/b9j7kM2u7n5bdWlVPh969Qou6Bq0qcKk4mB5gwPBnilM0zHsy9gaz3BjAp4wGyMPP
         i8HSxMVLSuXdw9hBzH7n8zz6Ot3AQJw0qjelNLpiflsXrUYqY164PypVCLX2/X80LNEZ
         RTI35zm6CvxUf5HcxPTMl7o6CPcUMXCrwTT2fQI1T6WzX+xZuAv+pGMlWJYszlSBUyGR
         MN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773443; x=1762378243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFhpMv0TS5z8Ka1Q09jnxxHQC5OXHmjo9VvdfZH94aA=;
        b=dRIYFf4kfuASclgD7D9z6o+VMxyQUTZLHtuWTHpjbW8RYIA1vQofHWc4mxuad+LLbf
         cPnv4BTrdnoh+ceow+Tx6JAPbTkb4Os+T4JUh0Fxa43Re3Aink7igHae67qGHOxd8j8Q
         5uBlTXNZx0lb/Hx49LTLz8LEMxLhKwdd+qXcH4aUQ7ikCic17s3qH8QLu4mY5lE6xrYc
         OBy0bxpG6YURoEL6V3MdMSyH7wkpqjI8Opun38f2LKXmqpj1sToOvrccgWfLt4YnouJz
         X3A6W46L8/43RLXFz7DrIGWmO1A9wPc437tb0F1H238Gknrdh6yqWfUOqMuURkcdk/oD
         UX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjnvmlj5H+B4HWkpGLWBBFMMKTWHCsPob1IyKEV9xaegvaHdmTM00XuZHqqhnKIRG+nYPu3c3DOk33HwgetVHo@lists.infradead.org
X-Gm-Message-State: AOJu0YxRLe2TIIqRjTOTFdzmTE/HRQ1owosmRAolQ2591JiPjlRIA83u
	KP/etu5jRcZIOPsDoodzy9nwuGi2xqfuhD5B8YobAddiRWRwWvLQxsOemSad2hMMkKU=
X-Gm-Gg: ASbGncsClUbdxXoQfWXWXFDKoHICvbZXJXTIqfWw3wYwvZDIrSccSTfUom6EilPrVI8
	qzb3Yp+hqWF4X41E1XXAECaf+BdmDgu7oJi0D8tdW7jj4Dkp6o5JMT688W5FzCNJPedr6YMd/7D
	1HVUiMBov9h9CQHgZT3qmnjF9Slrk5Q6kaQ4UknOsKbzb2CcU1pBcvW0YYRdasLaCr4p6whvV2k
	t5KqDyyTpHFAz7F20sQxTM9UZOFTJo8+AwB6Rkym914iyyliyJvUUfqMShezCNqqQZWzeeyx3i0
	gNZbV/BjicTCEq4yqqFs4VN0XtdPN983/wn5HpYjkLpJd7o7ADUWWtJ6tBj0JJRDcrH2Nrs+1Pj
	5LaIEoQh0E/PH4ZCNMU86wkNxeINN2nv1/MpJJheGOmEi1J6UN6kFKGyFlNXw/yNE0i3LWTj0nS
	T1Nn0L99f70C6dqFKcd84RcyGXYO1/Ng==
X-Google-Smtp-Source: AGHT+IHVKBgjvBcg1f/6q88hadZlvNZkx1IaeehmFQmwK/82FK+KqLJA2Oi5GwkBpiXwwokUglXnGg==
X-Received: by 2002:a05:6000:2006:b0:427:847:9d59 with SMTP id ffacd0b85a97d-429b4c9ee68mr1094202f8f.45.1761773443210;
        Wed, 29 Oct 2025 14:30:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm28573457f8f.6.2025.10.29.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:30:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 29 Oct 2025 21:29:25 +0000
Subject: [PATCH v2 4/4] clk: samsung: gs101: Enable auto_clock_gate mode
 for each gs101 CMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-automatic-clocks-v2-4-f8edd3a2d82b@linaro.org>
References: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
In-Reply-To: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6237;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=oM4kL/PXCK2EPatzGpk867zg8TyU+43TUg05bDgKThA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpAod4kOXb2zATBSZi/XvWQU+uUmKxKhl+dduVU
 SSmHS8LRxaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQKHeAAKCRDO6LjWAjRy
 uvt4D/9OY4nx/ssfdyJfQsLWXa4i/pTsHM7F9uszUzRBnrjQQ8G6kzTI0gS4k5L+My4tHiYMzIg
 IB9D9hhN9dLM4lhsnR+cQDd6A8yFp5izu78n0pVC93sJe0ESdXmVI/0eEkHB9oCTcvhyPp8smOl
 j/tgdTiLclBB7KnLoe6bBRZTfy2Y6b91xIoyaDLuE1jRdln8b2h5zlE2XubIUqitTFSXlNacfI0
 r7PoQY646CnLo51RpsRpPsKDXqwEqegI0o7/0St4GPkXiKq532mUyegf89RZJe3SdfPUJFqZfN2
 5hRgje4cyWgXU1UDlbhUW4rkToPhpQODp4Aqp+CSa+yY+lutEFmNMpuYGMyLPHLzwzTY8Ek98it
 lE7IfuKN2+nKIiGyWsNjvSGHlLj8qNEQoBezUGShZBcecEHf+lddPfohia2mYmgka0LH6guH/c5
 J0wiZvDPJkGkPK7f2T87KG/8UEqYxpKbQJhWQOm3nlC7/SS+fbLcmalHoP2t0pAOTLr3+gA+w4B
 nNyBRayv7yVqytIVVDpX1FMkL2OR+FKX3BaW3eDS5saHqVp1ReNDyuaN4vEGi9E9rNANrqZ4xiB
 NgV+ZVB+k4exZjd6D4sJQyZJcavHSJhcLX7jjaHLTs67kilnRJh9Iu/ksj7enAiNZ6igT/vA4v6
 bTu4W3eS7BVVodw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_143044_987752_9EE9234E 
X-CRM114-Status: GOOD (  14.55  )
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
 drivers/clk/samsung/clk-gs101.c | 56 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 70b26db9b95ad0b376d23f637c7683fbc8c8c600..68c5ed8f0fe1cac5169313b6ec705f9eec44ff53 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -9,6 +9,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/google,gs101.h>
@@ -26,6 +27,10 @@
 #define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
 #define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
 
+#define GS101_GATE_DBG_OFFSET 0x4000
+#define GS101_DRCG_EN_OFFSET  0x104
+#define GS101_MEMCLK_OFFSET   0x108
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x1e080000) */
@@ -1433,6 +1438,9 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= cmu_top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(cmu_top_clk_regs),
+	.auto_clock_gate	= true,
+	.gate_dbg_offset	= GS101_GATE_DBG_OFFSET,
+	.option_offset		= CMU_CMU_TOP_CONTROLLER_OPTION,
 };
 
 static void __init gs101_cmu_top_init(struct device_node *np)
@@ -1900,6 +1908,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
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
@@ -1912,6 +1925,12 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
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
@@ -2375,7 +2394,14 @@ static const struct samsung_cmu_info hsi0_cmu_info __initconst = {
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
@@ -2863,7 +2889,14 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
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
@@ -3423,7 +3456,14 @@ static const struct samsung_cmu_info misc_cmu_info __initconst = {
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
@@ -4010,6 +4050,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	     21, 0, 0),
 };
 
+static const unsigned long dcrg_sysreg[] __initconst = {
+	GS101_DRCG_EN_OFFSET,
+};
+
 static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
@@ -4020,7 +4064,13 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
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
@@ -4368,7 +4418,13 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
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
2.51.1.851.g4ebd6896fd-goog


