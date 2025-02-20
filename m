Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F484C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExfFdnElv6RE+Criap0BQCRCLdiCh0cHD/QHqlYNoyM=; b=Nbid46OZfvRNwZlfcgNVaF1DYZ
	Ba2r+zhWmsCa0+j4GcWqc3Fy11Wn8+AvW0cM5xEbpCFeZ7phP5mhUZkRKV/jWDEDPQfXJhDGpbzEN
	p8k9vKNUE2wxc1ryFG+qJmg9VH3tD/BBWoAOWDlYld9euYGkQETwKG2//Hr79kA3vPlZWCkr9rd5A
	p6whwGkgl5wsKWNaOU0hB9KlASGOjRVy7id+9w/eOvSqeBLT6VgoUxz1M6Fs6vS3nqNQBi1tzCKdY
	hC4VNxyvp0I9UfkyA9vXPS5Hun+EDA+KjHTNrMbQ7tAtHSvlklRihJwY3DrexjGjtGnIShR99+f/L
	r/XT/K9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4vq-00000000bwP-1EJW;
	Thu, 20 Feb 2025 11:41:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4sx-00000000b7Y-40QH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 11:38:33 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abbb12bea54so167892666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 03:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740051510; x=1740656310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExfFdnElv6RE+Criap0BQCRCLdiCh0cHD/QHqlYNoyM=;
        b=PJRWvQrP/TikbXOBWHr6smiZ8Sv0h2SXnrcBLLM5VgmbH6yEtpxr1EAEtaeS4mk+KK
         ZztLFsniSTrz2cXGf2ObA6H9gaAjT5MpLNc2Uu9BBSGCaY435mRu62/qJjNQ3snFdMf1
         FFbP12YDnXHq0Nd/nobhKE+i54QM0u0ayurHwl+X56uATLTd6359xI2qlZPgYQ2PDCNb
         DPV3fgM9sp6Pj6FQgHmkVmfJUexBpa9V+Q/8JIv1jTR91gaQZl2dPZezChKkejFAUUNA
         jwG9mMr35xA+Vw56taihbmFQAUPeLvmZCDgeB9G2U8pTCePhJJfqC4mch+5uPpIpe9ew
         rQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740051510; x=1740656310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExfFdnElv6RE+Criap0BQCRCLdiCh0cHD/QHqlYNoyM=;
        b=eHK8SOLPjV1iFY6hNVvQvCnDbYTUeLVUufwlpRlc95TxPXXcvADlMDFZZCsgwyHHgU
         TrZtR1rGmf1nICQAi3W7cMAJVCy+Cs4cAdQvL9NhBj8wmOfDWHU+2gX+D8O5TgxEJaW8
         aNr+kq1H4cX2Ly9g1qi6nJ1HlqjNsARHj6MvyKirU4LJr4w+jzhpVIY/uXMbxZE+AJ9C
         K/E7PD8YNltyAlH6DO+M+3EBavFoUVga5VHmZKqLO9PysRfQdxZmM8xV5Nm4ZU+8VhWh
         9omweHXlVxEvg7PGbtH7txeyJp1QhGL6Wqkr5JLoMviTcSN8jQ5IpNS9cY6rFB3puoKg
         jUxA==
X-Forwarded-Encrypted: i=1; AJvYcCV7UJl/mHO2wNNJfmMXOh4xUgmzLR5RPQEUQOda+wn1ADnAP8fP9ffEwD4sgMNavTH+sshS2FpkQcGu30jA/K2Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm8d0ZQYzH4/AX5yA8oFhAWgyiaX8AjR/jy1H+re6P2TxpSC2B
	g8Fh70OlFI620dG/rMZSuSHYAgnNVV7lh64C4dK6qbMDbakeTq67
X-Gm-Gg: ASbGnctKtZLbMmSfdRXkO6f51azTICDd/FQnRY8tJDbdQkbV76iy+0TTDw8/bWs7B7D
	foIo1ATFmSGxor0OelKG79NPvFR2euwLqnzb9itSJUKTF84EeG3gsaOj6m3M3Lcl3rccUxRcgTE
	L0BIYcgZYc9LUv1zgU6VZQKwTrF8Qtsr9C+hFwS1q7yFPQ1brqgGetDywtYk48RY1J7dW2EidSi
	9ZXvBGKWkF7PiHAng97JMXOzw3Kwq3Mlyie+jKDFFZPqEV/hNNc4QZ5g/2cUG0ucRPsdXX1+8gu
	MNflqxXR77jWvzd9ThsC/ojE5sewyNV9X63n2I5w6nKCAnBDO6oGgZVjgjb/6LoCJEOXXXUJwDk
	NXw==
X-Google-Smtp-Source: AGHT+IGjGppdPvcKBaNnCyGcV/by69IhzWTFcP15FubbfmQQ7R/MJ4PUeEtgq7WsyithVWyBUUJNNw==
X-Received: by 2002:a17:907:c02:b0:ab6:d575:9540 with SMTP id a640c23a62f3a-abb70df619emr2280560566b.50.1740051509436;
        Thu, 20 Feb 2025 03:38:29 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7200144fsm1047675466b.184.2025.02.20.03.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 03:38:29 -0800 (PST)
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
Cc: Philippe Simons <simons.philippe@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 1/1] clk: sunxi-ng: h616: Reparent GPU clock during frequency changes
Date: Thu, 20 Feb 2025 12:38:08 +0100
Message-ID: <20250220113808.1122414-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220113808.1122414-1-simons.philippe@gmail.com>
References: <20250220113808.1122414-1-simons.philippe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_033831_995978_FF7C6901 
X-CRM114-Status: GOOD (  19.46  )
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
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 190816c35..6050cbfa9 100644
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
2.48.1


