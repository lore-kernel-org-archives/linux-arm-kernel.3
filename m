Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A349C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5HOAmeZSd8XozBfBj4jNyXC9XonCoX2cwbZMmLfFjDQ=; b=jmJPwJy0vpHq2cBs6wOL0KRuvU
	UuIao4D0XhZ/AevxulImXCLUAf6LQ7c0jqEO0ARENOrt0acUl2llNH+CqJPGqi25RoXl0evTD2Llo
	lB/ESw6wl5jCsDrjUkaxPqm1lXEcivLOfF1b8CNiN7VLn6K9XJ5EOZEjeasWp7YKeLNwWqzkL1UHq
	yduCCeJSP5ReCrLT3ueXh0cHWu6/zKJpjscnsBv0dDM1sD3bWYqnuFe0FMCeLRjfDuy9dWuehyfL5
	2ha3/jIqbb/jHY270UI1e39brKqHMHFVLzvDpf3XspTqdcAS+biaVIkZxrhfPxWCX4CXyEFtfgZCX
	t29T+2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGrb-00000008NtF-0c3n;
	Wed, 12 Feb 2025 17:49:31 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGfG-00000008LQK-0pGR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:36:47 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab7f860a9c6so9723566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381804; x=1739986604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5HOAmeZSd8XozBfBj4jNyXC9XonCoX2cwbZMmLfFjDQ=;
        b=KC7WLc/IdNv6Dl27XHVn05L/qYkUAQq0WZcKuqrT9CpFPWTQitan3Bt699Butv4+Pw
         t1Vx108UoNXPLCd1ClijffAkRyKzu7uczwi0BnbUESOlGJvSxSMAycITqtAYgi1MzyMN
         uAgGREAfoGynqDwv+BD4KvpTu7ofrshornDLrWx0lXZwb+TEeIAPc4flQ3s09CFZObYA
         kzFZ0nsyZ8lUtKeDeYipsrvpAhIRcqRZ2cIVbuFuiobwEW4P/FKo6rOBfG5qt0+1LuvN
         WsaCjxsixZzQB30/5x48kl8/piAtpnivc8sDt7n6uPBpDRlk9P55gBJdnVHNQ+kIKcP9
         9oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381804; x=1739986604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HOAmeZSd8XozBfBj4jNyXC9XonCoX2cwbZMmLfFjDQ=;
        b=lFdTx/CH4hph/MwO+CHsnbMSLF/I+UhX7t4/gP/+3V/sUXFo1H7ij+vnNH5cHny9uj
         XJxlX/xRWbn00DX0VFfhWLILYmf/L2KYnkCfnyH2GPgGlRV6FB9PePziKTpFeVJ5BBH5
         2ckM+y3vTDjVDm4m9Cfdhqw6/mt+yTcpBsIpLx5+IQ5nnGR5rIY2iypvWvFsV7HZMIAZ
         Rlku2lWy85+hhFVr3nKQjxpsw8NGx39oY/wPKCefEEuc48Q5msLulKhitJtU36yK4/K/
         jQP7jyM17Uu5gmY6EEBezt0t4ufMGYKMrUu0gjUlhtJ/InTRNwvSfitWHnf5ls2z1UB9
         zUAA==
X-Forwarded-Encrypted: i=1; AJvYcCVHpaFmjWdDp4/OZvreJPdWo6ai4bZx+7FjVcojRR5kLb9dN4CFoLVmE/KepMKUEUGecGpIyeMO1x6cJNcp1inr@lists.infradead.org
X-Gm-Message-State: AOJu0YwXMTL/dROR3b9tHlXWrzS8zVo00d/WeqMTsJm7qbfFHUVsSK3z
	eCT8JkruwmESGbV5p/WiN577cI+pNY5va9yRnsgr4S+P+VJcjIRV
X-Gm-Gg: ASbGncu/Fdmss3arHhA/lbK5HIxBzvu8EHzAqmBfkD09jJtc7yASzPaWD58sBn7fchY
	m41hg15JWFmILnxBvoOI/AWh0P9coTmMZVFFsKFeV7z2iP8OKmboWXcbzXQhqX1As7wP+dK8uau
	6OEZ6lz1HWq+VpYSAXvMypaUgwR/fMI1v1RbAlO9KForDvIYBQxK4rP74hJWajxqsyyFPfzQrYF
	fU630JTCkb/yGHOx+5IdlF1Xk8xWXBtxsnLv6YuhCpfT0VdEoyE3ykPB1I04ldevNqjiqV2XN8M
	M30LWZ4HfzvR4jFIjzaYf6UUvsZtgQKHRWtr7HIsUp4lLhtuRQPWhUnK5AtBcFkQUdDSqx8cfug
	Vig==
X-Google-Smtp-Source: AGHT+IHDCBgJfM+/ys0ROHnLWBIi5z2k0taelB9+5yUdQur2jxtf7oYUmNm/5oCfY1oM9+jShWu3Ig==
X-Received: by 2002:a17:907:971f:b0:ab6:511d:8908 with SMTP id a640c23a62f3a-ab7f34a0f04mr350523966b.40.1739381804140;
        Wed, 12 Feb 2025 09:36:44 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d18e006csm500162466b.52.2025.02.12.09.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:36:43 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH v2] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
Date: Wed, 12 Feb 2025 18:36:39 +0100
Message-ID: <20250212173640.396404-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_093646_243666_4DE27EE4 
X-CRM114-Status: GOOD (  19.01  )
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

The H616 manual does not state that the GPU PLL supports
dynamic frequency configuration, so we must take extra care when changing
the frequency. Currently any attempt to do device DVFS on the GPU lead
to panfrost various ooops, and GPU hangs.

The manual describes the algorithm for changing the PLL
frequency, which the CPU PLL notifier code already support, so we reuse
that to reparent the GPU clock to GPU1 clock during frequency
changes.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 38 ++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 190816c35..884f9a6b5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", gpu0_parents, 0x670,
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
 				       CLK_SET_RATE_PARENT);
-static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
+
+/*
+ * This clk is needed as a temporary fall back during GPU PLL freq changes.
+ * Set CLK_IS_CRITICAL flag to prevent from being disabled.
+ */
+ #define SUN50I_H616_GPU_CLK1_REG        0x674
+ static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
 					0, 2,	/* M */
 					BIT(31),/* gate */
-					0);
+					CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
 		      0x67c, BIT(0), 0);
@@ -1120,6 +1126,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
 	.lock		= BIT(28),
 };
 
+static struct ccu_mux_nb sun50i_h616_gpu_nb = {
+	.common			= &gpu0_clk.common,
+	.cm				= &gpu0_clk.mux,
+	.delay_us		= 1, /* manual doesn't really say */
+	.bypass_index	= 1, /* GPU_CLK1@400MHz */
+};
+
+static struct ccu_pll_nb sun50i_h616_pll_gpu_nb = {
+	.common		= &pll_gpu_clk.common,
+	.enable		= BIT(29),	/* LOCK_ENABLE */
+	.lock		= BIT(28),
+};
+
 static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
@@ -1170,6 +1189,14 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	val |= BIT(0);
 	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
 
+	/*
+	 * Set the input-divider for the gpu1 clock to 3.
+	 */
+	val = readl(reg + SUN50I_H616_GPU_CLK1_REG);
+	val &= ~GENMASK(1, 0);
+	val |= BIT(1);
+	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
+
 	/*
 	 * First clock parent (osc32K) is unusable for CEC. But since there
 	 * is no good way to force parent switch (both run with same frequency),
@@ -1190,6 +1217,13 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	/* Re-lock the CPU PLL after any rate changes */
 	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
 
+	/* Reparent GPU during GPU PLL rate changes */
+	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
+				  &sun50i_h616_gpu_nb);
+
+	/* Re-lock the GPU PLL after any rate changes */
+	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
+
 	return 0;
 }
 
-- 
2.48.1


