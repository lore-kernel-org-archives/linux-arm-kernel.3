Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2534C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZvQMgr27oYexeTp9Zzz8EXxWgUKt5vomHna8W5DPtg=; b=awW8uJfOVzbcRNeWqoSBSBXWxm
	T9A2rqI/3tb33w/MsIqQpVemaUjA/kZhqUbT5/fcidt8yXdPgax0/W9m/dggRTacdpEvitw02pKGN
	bzXYStFzJTg9lzr2JxZL5b0DxuEsvqAlcbWgUr5bD1VPYlBnWHHJ0u4EkumlhAmFSgde3XHSnfNwa
	F7NlsjGmURdoYVk+vQE8GMjx2exxxEJ/mpiOtd3Wlyl2RbNJxpSTre65zxWpuO+db9xr6eAr822Uh
	Zrn1AIq9plVswUSrLvuXj/C2n6At6DXlImJ60tqD0RRSn0wMcZ3/+4VShiZVZdJfnbg0u1JL17m+l
	+WRdBofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCTT-00000006AJr-400O;
	Tue, 08 Jul 2025 17:51:23 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByM-0000000668o-38dN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:15 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso27567166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995153; x=1752599953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZvQMgr27oYexeTp9Zzz8EXxWgUKt5vomHna8W5DPtg=;
        b=q5xNwoKHqd7URWNwhPSo1+P1NXccc27UgBFZOPUCpQySwMIwd3F7qiS16MEf3ACTJR
         Q6zg56JkgPnuijoe+eHkoPrUTS/oY9GL6MJFMN7HaXg+uTSc5NNAjhTcfa5OjQS2kiix
         gj01aW4JX6v8ADCgHz4l1TogxaQBmyPvF4ot/MrilVz5tIjP6/2bUMbIEBYymqmiPbOL
         SPUH+iXsHA4fCZJCSqs2W6WbbGb4rCZaxut22emqe3w+2i+C/5lYosKNG1AmLmq6wMf0
         OXJfiAdeWDaeX/H2vsQ3pqUy3UkO+ALVXqDPcDyRArwMcjJXS4hNYnkZy6xyFop6NkjI
         +Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995153; x=1752599953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZvQMgr27oYexeTp9Zzz8EXxWgUKt5vomHna8W5DPtg=;
        b=RXsrWJW/mF9f1KlPp9EwZ6OqYXmgvvBGyV4SgIxk9DSuKji6As8vLxgSGmVUA4MLa6
         E8plG7prFMl91sTd4yfONLDbC5f67V3tuQtP9cAIFEyzaIg5XX57sI3/k+FsAFmgCVTc
         DDs9cQ0xn7LHRtTNdcrAgLEQLPa7dM+AUwGJaZragR2f2KokBrdKmlB40HBCkrpu+WpQ
         8B3AFs5MefS41VrLs87CpDN708SherOw3VuIWPA3CpcCkybZGVx1VftwxyKFGR1K4k+M
         CZsOS2+hoVZQ1NSUQPXpa+fVmbs9MKhnAj3UsOS8wlok6DxP4VFydlGc0+QjyJWI6Zj3
         oR3w==
X-Forwarded-Encrypted: i=1; AJvYcCXrK8EFzlfeIYJkDVu8XolUzRPVA4lSa7nBpYk7Fpk25RAnbbHtS9NlfBxYC4bCokf1NvYH7C2Jxo3ky5gxYfPE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+OxXw2CBCzLd4RGK6R0dERoWvciQnetppudfQxkCD8VeKPT9a
	WlRCe3vLneOaPxJP2RL7NgSRoSUoI70qfhAqRU2M+QhYspcF3qcewKJD8nGz328LKZQ=
X-Gm-Gg: ASbGncuDgbODLtuWXDKcEqym0KP9rgbyFbE4G8UA935tZhxhmOLFkPVDd1voLXEZf63
	5r7eeQSyWqEV/lft7j64CsYyWrGdo/ywcuyNGw5uddfcRHjIONz/lJZuyuSN4OuTXd/3MAEH1xM
	vWqfPBP+kYL2dFQDNQRnXHKM0xiB2bFdYfJibyxEZMJjYtiytBBvGg+sTTzbU5cxsSPjRByDSMV
	wVsRpHhz4D0KmNZkoBtHASW5mm7lSEryWAhXS1j0ny8BHClC7SPCpQUzMQrvJz4z4H8RC23UU/4
	ZupXdvBEvJo4lzm8ofo/AH0WkxFx2hg7XD4IzKX9yA0zYbzJFGbadgp872QsM8A+ue9X/VTRsdr
	tSIch9LZVqw+iQ1m7fgkkmYw9yLIn
X-Google-Smtp-Source: AGHT+IGZ+K1pCuPEayZnFWGSN9yqttQ6jjfQTfQ8iw0G3/mWnEpYr+4MB2ym0NC1DtSHzl9Md0DtGg==
X-Received: by 2002:a17:907:2da9:b0:ad2:e08:e9e2 with SMTP id a640c23a62f3a-ae6b2b38bedmr368790266b.27.1751995153065;
        Tue, 08 Jul 2025 10:19:13 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f66d920asm935799966b.12.2025.07.08.10.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 7/8] pwm: mediatek: Lock and cache clock rate
Date: Tue,  8 Jul 2025 19:18:37 +0200
Message-ID: <087a968c4a444c91d2845c47ad19b67d74b76769.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5481; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Io0EKeB0lpsfngcJKqLCyAVcz95XvCycJ3iO9TgYbfs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVL7lTJ58f6EVjYr2LNUdDZHYgPwXAhqRSNtJ st8kaSRFmGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S+wAKCRCPgPtYfRL+ TuklCAC5nKWvv0OZrIF43FGcTpxy2DJXR3LA6Bu4yGFNJT8ar4BIROO5P21ny5KAE8xe2FjVk+K UplmkW6BrsfEFBhp7kSqNnTlL/S06gjeGjO5NGATcSf0B5+AWeQJPnH7bO+nvOTlbs9q4eNDzyY DZH2msg6g2SGqxBEfTR2ldGGn2+nKHzX0ckx0NeoogyXRs2iacZ63q2skBAF6AxmdcOpI+cPfvF 4m+uCZsGUrKdOsMZbe9EDJIW3W/4qWQk1a/4odlObrexLLlxM7/i/hIlTlNrj8JeW6hI6EmkWkG XpTVJBuLoNvPwtwn8A+IeRnuHDj6YiPWh8p+hRO37HWkst6f
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101914_783043_2302BF08 
X-CRM114-Status: GOOD (  22.69  )
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

This simplifies error handling and reduces the amount of clk_get_rate()
calls.

While touching the clk handling also allocate the clock array as part of
driver data and lock the clock rate to ensure that the output doesn't
change unexpectedly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 64 +++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index d7801e6df6ba..c48d46124059 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -49,15 +49,18 @@ struct pwm_mediatek_of_data {
  * @regs: base address of PWM chip
  * @clk_top: the top clock generator
  * @clk_main: the clock used by PWM core
- * @clk_pwms: the clock used by each PWM channel
  * @soc: pointer to chip's platform data
+ * @clk_pwms: the clock and clkrate used by each PWM channel
  */
 struct pwm_mediatek_chip {
 	void __iomem *regs;
 	struct clk *clk_top;
 	struct clk *clk_main;
-	struct clk **clk_pwms;
 	const struct pwm_mediatek_of_data *soc;
+	struct {
+		struct clk *clk;
+		unsigned long rate;
+	} clk_pwms[];
 };
 
 static inline struct pwm_mediatek_chip *
@@ -79,12 +82,28 @@ static int pwm_mediatek_clk_enable(struct pwm_mediatek_chip *pc,
 	if (ret < 0)
 		goto disable_clk_top;
 
-	ret = clk_prepare_enable(pc->clk_pwms[hwpwm]);
+	ret = clk_prepare_enable(pc->clk_pwms[hwpwm].clk);
 	if (ret < 0)
 		goto disable_clk_main;
 
+	if (!pc->clk_pwms[hwpwm].rate) {
+		pc->clk_pwms[hwpwm].rate = clk_get_rate(pc->clk_pwms[hwpwm].clk);
+
+		/*
+		 * With the clk running with not more than 1 GHz the
+		 * calculations in .apply() won't overflow.
+		 */
+		if (!pc->clk_pwms[hwpwm].rate ||
+		    pc->clk_pwms[hwpwm].rate > 1000000000) {
+			ret = -EINVAL;
+			goto disable_clk_hwpwm;
+		}
+	}
+
 	return 0;
 
+disable_clk_hwpwm:
+	clk_disable_unprepare(pc->clk_pwms[hwpwm].clk);
 disable_clk_main:
 	clk_disable_unprepare(pc->clk_main);
 disable_clk_top:
@@ -96,7 +115,7 @@ static int pwm_mediatek_clk_enable(struct pwm_mediatek_chip *pc,
 static void pwm_mediatek_clk_disable(struct pwm_mediatek_chip *pc,
 				     unsigned int hwpwm)
 {
-	clk_disable_unprepare(pc->clk_pwms[hwpwm]);
+	clk_disable_unprepare(pc->clk_pwms[hwpwm].clk);
 	clk_disable_unprepare(pc->clk_main);
 	clk_disable_unprepare(pc->clk_top);
 }
@@ -130,15 +149,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (ret < 0)
 		return ret;
 
-	clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
-	/*
-	 * With the clk running with not more than 1 GHz the calculations below
-	 * won't overflow
-	 */
-	if (!clk_rate || clk_rate > 1000000000) {
-		ret = -EINVAL;
-		goto out;
-	}
+	clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
 
 	/* Make sure we use the bus clock and not the 26MHz clock */
 	if (pc->soc->pwm_ck_26m_sel_reg)
@@ -180,7 +191,6 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
 
-out:
 	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 
 	return ret;
@@ -266,11 +276,7 @@ static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		u32 clkdiv, cnt_period, cnt_duty;
 		unsigned long clk_rate;
 
-		clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
-		if (!clk_rate) {
-			ret = -EINVAL;
-			goto out;
-		}
+		clk_rate = pc->clk_pwms[pwm->hwpwm].rate;
 
 		state->enabled = true;
 		state->polarity = PWM_POLARITY_NORMAL;
@@ -295,7 +301,6 @@ static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->enabled = false;
 	}
 
-out:
 	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 
 	return ret;
@@ -359,7 +364,8 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 
 	soc = of_device_get_match_data(&pdev->dev);
 
-	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms, sizeof(*pc));
+	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms,
+				  sizeof(*pc) + soc->num_pwms * sizeof(*pc->clk_pwms));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	pc = to_pwm_mediatek_chip(chip);
@@ -370,11 +376,6 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->regs))
 		return PTR_ERR(pc->regs);
 
-	pc->clk_pwms = devm_kmalloc_array(&pdev->dev, soc->num_pwms,
-				    sizeof(*pc->clk_pwms), GFP_KERNEL);
-	if (!pc->clk_pwms)
-		return -ENOMEM;
-
 	pc->clk_top = devm_clk_get(&pdev->dev, "top");
 	if (IS_ERR(pc->clk_top))
 		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_top),
@@ -390,10 +391,15 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 
 		snprintf(name, sizeof(name), "pwm%d", i + 1);
 
-		pc->clk_pwms[i] = devm_clk_get(&pdev->dev, name);
-		if (IS_ERR(pc->clk_pwms[i]))
-			return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_pwms[i]),
+		pc->clk_pwms[i].clk = devm_clk_get(&pdev->dev, name);
+		if (IS_ERR(pc->clk_pwms[i].clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_pwms[i].clk),
 					     "Failed to get %s clock\n", name);
+
+		ret = devm_clk_rate_exclusive_get(&pdev->dev, pc->clk_pwms[i].clk);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to lock clock rate for %s\n", name);
 	}
 
 	ret = pwm_mediatek_init_used_clks(pc);
-- 
2.49.0


