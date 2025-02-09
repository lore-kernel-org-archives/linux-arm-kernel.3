Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCC8C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 18:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++ZfHUQ0MCm0RP3ofnBUH+oOmt7UhXpK/206QQBmZmM=; b=yx/Ngd2gflhb6jx5Pi3cQPFpdY
	dU3csQjj6dePS3gggy4eECPAcmGbwVAElreHFPDdGNB8aVY7p87O1Oo2LlNd5r+97RveUuLWh6L2r
	hqJnqNVEmpVsGEIq6sk5238emgyq1hqw+wD878Ns8To4ur4HzL7b/TDAnnuUkWAhZcGeIASnVsgvm
	rb1n9kkq3IMeIiJ6rKH/6pokLzUW8RQSgPs9b6nNO7JlG8qG0C/i11brPJKFMkMVFMOHYfVIwDqzl
	YXbJWaEq+RCeoM+PBnMzYEJ6MP2TD1RIXsWvzRpO7F0aYvldDtk4KCN4/Hbpd2wm6SVQ9cPQ4u8Rj
	2ufUETgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thC7e-0000000FLTP-0qzr;
	Sun, 09 Feb 2025 18:33:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thC6G-0000000FLF7-1BQI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 18:32:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab744d5e567so714049666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 10:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739125930; x=1739730730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++ZfHUQ0MCm0RP3ofnBUH+oOmt7UhXpK/206QQBmZmM=;
        b=bPkvn+BOhB5XP9Iq5vYpo+kFHIT1XA6pk9b7PP473E2tl7FFVy2tIEOVbbx5u4BYMK
         anunnBuDutk72ohrr7+WWxvmZUitrKQiRcUT7Qb+fRKCEoLq78c3ZiQZmdriWzBRV1Vd
         w2zvJvYatH48NQ0XdqbKRSvywFwOD5/MgiZVYDBazWiUlwbEe6AA5aotvHVFIklN/Jni
         27nmpzpUTQzl9KK/h3kyMyV3m+17xqywZ82W+dEX8CP8Xd0wOxf0GixkBDOMIvAO+OUk
         SzJZjeGiOyMTRUpBxbNSAmngIuxmhPNAEvhAPbh7KFGIwFXpBbHNmGqYD3R/kPM8+zK+
         vTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739125930; x=1739730730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++ZfHUQ0MCm0RP3ofnBUH+oOmt7UhXpK/206QQBmZmM=;
        b=rEsjiLMXSTV6N9MfDfAnhcJM4og90Q4rCC+PILVhTD1VJ9iHSHpTeQGERl4iAaNFpp
         F8Gks/o8CU5SlipmdpYuoDKE/aMf+Dz/DvA2AYmiRQstFM71nG90CN3DWrkp5Osq+AHK
         tqPnPptOOtUk29ooGoWAOTqF49QPDz6Qz/SMCZvgx96sSqEwTtcm4/4YHkKY7gjr2UkX
         xUTKwyvIoTHReLngcYrGd3buz56R3c6pdAHbAWXazRRNkKi+verZvCwqNudo0sDc+9iM
         4ryKcboFSkPjdMJiQ3tKuaXzWo1i29zW7yKkXkKzCK2xyC4fYrS4hTcm14wTLG78+yBG
         Uu4w==
X-Forwarded-Encrypted: i=1; AJvYcCWDFt7WHegdPGYO2oyE2shweDs05c0c8Pky/xbdSTXvConJ374xX6z7UCh7zm6qRsfJyxC9KjDG2TEabSbtAfdH@lists.infradead.org
X-Gm-Message-State: AOJu0YzTjjE0Icf9PAMpmg/CHgkrxYn8wsMfvb1A3xZWijHcv9UGRGs4
	PyrGihxUhhMNp392BaPp+SalZ+oV6G+zuA6jROxeQoWpN5b3qpjU
X-Gm-Gg: ASbGnctNXziDXrDWlvuG1CrhYboT2kx9flnzkaP64PbEiG2yOJ5wrJtB9oY4wthKh0w
	nCkKf1CQLgKXz/2j1OKmX5TpW123vN8jH/6kDaXc3LtGCgx24l+nAsGsz1RTIGcrHjLYVVe6Xl4
	bayKT23TdZxsEfuKUNQ+ISlwrP9vgIya/qHXnBJuo2M5JgtO43q5seD8khsrU7BJI0v1QmVaYdG
	kWsJyj66GqUrALDdyNSsCW/p7ViEXlNcudtSmof5qMUTqtSnn7BFlLmqbIi9KXglO9Z9ZXorrlY
	j4wMX1NXl8cvrnKlE42CZ5LQ8JLgws4J6mzxBBCoUERZC9aomSNsVL+jMMLXy5LC1JLPDDxdNU/
	Lmg==
X-Google-Smtp-Source: AGHT+IF25eWQ1V7Er7ceH3ux4Wlw0217IKgZ/NViSm8RTCNQK2c1ekJ42OKIsci8kDQYLk4K5IBrmw==
X-Received: by 2002:a17:907:1c0f:b0:aa6:938a:3c40 with SMTP id a640c23a62f3a-ab76e9dad88mr1610005266b.24.1739125929258;
        Sun, 09 Feb 2025 10:32:09 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c4da47f5sm33658666b.70.2025.02.09.10.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 10:32:08 -0800 (PST)
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
Subject: [PATCH] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
Date: Sun,  9 Feb 2025 19:31:42 +0100
Message-ID: <20250209183142.97671-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_103212_338761_CA5F6DED 
X-CRM114-Status: GOOD (  16.95  )
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

Re-parent the GPU clock during frequency changes of the PLL.
Also it asks to disable and then re-enable the PLL lock bit,
after the factor changes have been applied.

Add clock notifiers for the PLL and the GPU mux clock, using the existing
notifier callbacks, and tell them to use mux 1 (the GPU_CLK1 source),
and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
correct algorithms.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 33 +++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 190816c35..e88eefa24 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -328,10 +328,12 @@ static SUNXI_CCU_M_WITH_MUX_GATE(gpu0_clk, "gpu0", gpu0_parents, 0x670,
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
 				       CLK_SET_RATE_PARENT);
+
+#define SUN50I_H616_GPU_CLK1_REG        0x674
 static SUNXI_CCU_M_WITH_GATE(gpu1_clk, "gpu1", "pll-periph0-2x", 0x674,
 					0, 2,	/* M */
 					BIT(31),/* gate */
-					0);
+					CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
 		      0x67c, BIT(0), 0);
@@ -1120,6 +1122,19 @@ static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
 	.lock		= BIT(28),
 };
 
+static struct ccu_mux_nb sun50i_h616_gpu_nb = {
+	.common		= &gpu0_clk.common,
+	.cm		= &gpu0_clk.mux,
+	.delay_us	= 1, /* manual doesn't really say */
+	.bypass_index	= 1, /* GPU_CLK1 */
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
@@ -1170,6 +1185,15 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	val |= BIT(0);
 	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
 
+	/*
+	 * Set the input-divider for the gpu1 clock to 3.
+	 * Also enable gpu1 clock.
+	 */
+	val = readl(reg + SUN50I_H616_GPU_CLK1_REG);
+	val |= BIT(31);
+	val |= BIT(1);
+	writel(val, reg + SUN50I_H616_GPU_CLK1_REG);
+
 	/*
 	 * First clock parent (osc32K) is unusable for CEC. But since there
 	 * is no good way to force parent switch (both run with same frequency),
@@ -1190,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
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
2.47.1


