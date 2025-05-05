Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E47C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLnMVVdgegXq5d3xbWyt/czGHwUjdgL8FHmNBWBCjrk=; b=BGPp6V9xqLU+MOe8tk3Y29sxt+
	saFhW9mFDpON4fxkTaduVsRnXFgtG+z1qfQ6iQcs/FZKfdL8jxf1oRS/a3mWd8oq5ALwjhdEOkfhh
	LadgnGWSQswaA4URdbEgQMmwXL0YVlF1l45qujYNQbobdO1ndnmPQpr2fQO79bXf3t1nCrt9cxn97
	c10Ie+x4kIskBtistMSHqnqG1ABGrykuy6AA3R4ubos1vdgqGnKPEosxIcOIkFIKSvqirTLExtb0p
	SU4CWUqlgDtOfwcdwjMYQ7y1/KmFeiAPPGxLeomKrgAKX832Ur9MShe7OiOj1ScdCsM2/kqpTT+aQ
	WGWOpOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5kB-00000009BJ8-1p1v;
	Tue, 06 May 2025 00:01:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4IG-00000008lcP-0D4h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4F5D629C6;
	Mon,  5 May 2025 22:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFEAC4CEEF;
	Mon,  5 May 2025 22:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484091;
	bh=spRrkMeD8zKbNalNxXQx8E7VWnNwVyeo4rqtJcNxQws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4eHk7ItwqNo6a6Kde/otUIOe7yqUZ8vM68T5b1/Vl/bOm8cvN/jFVVFV0CyHLQOf
	 TDYvE4Y28kyoYCzo7LDqfe3upbU945gGZrRLyMkpTO5cU7TsxsJdTK+L+LAeR0eH77
	 SMrmQ4T5FFW3PsWJbTgOU3WKi0B6MBRivqJZR4UebVhFw209ygKDy4JVhc3fx6w3bf
	 sRAnNj5HGNp84IZuOE9JrHAK313DqDAIEG4yYtg28HHtT9FkQsWNaDd3IpITeeoW+O
	 Gcbbps5eOQsu71HUkRpJb9gjjkkSoqNz5c5ABKBtM2d8ffWALUsDlyDnweWfLSd42h
	 iJNHwT7cb86rQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philippe Simons <simons.philippe@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	samuel@sholland.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 6.14 346/642] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
Date: Mon,  5 May 2025 18:09:22 -0400
Message-Id: <20250505221419.2672473-346-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

From: Philippe Simons <simons.philippe@gmail.com>

[ Upstream commit eb963d7948ce6571939c6875424b557b25f16610 ]

The H616 manual does not state that the GPU PLL supports
dynamic frequency configuration, so we must take extra care when changing
the frequency. Currently any attempt to do device DVFS on the GPU lead
to panfrost various ooops, and GPU hangs.

The manual describes the algorithm for changing the PLL
frequency, which the CPU PLL notifier code already support, so we reuse
that to reparent the GPU clock to GPU1 clock during frequency
changes.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Link: https://patch.msgid.link/20250220113808.1122414-2-simons.philippe@gmail.com
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 190816c35da9f..6050cbfa922e2 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -328,10 +328,16 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", gpu0_parents, 0x670,
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
 				       CLK_SET_RATE_PARENT);
+
+/*
+ * This clk is needed as a temporary fall back during GPU PLL freq changes.
+ * Set CLK_IS_CRITICAL flag to prevent from being disabled.
+ */
+#define SUN50I_H616_GPU_CLK1_REG        0x674
 static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
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
+	.common		= &gpu0_clk.common,
+	.cm		= &gpu0_clk.mux,
+	.delay_us	= 1, /* manual doesn't really say */
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
+	 * Set the input-divider for the gpu1 clock to 3, to reach a safe 400 MHz.
+	 */
+	val = readl(reg + SUN50I_H616_GPU_CLK1_REG);
+	val &= ~GENMASK(1, 0);
+	val |= 2;
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
2.39.5


