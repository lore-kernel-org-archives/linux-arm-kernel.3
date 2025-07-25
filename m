Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9A2C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imtw8Gx4ry64i1JxbY02DQ6xhqBG4Z3YKMzGCpocp7k=; b=UXCsnCnf2ZUvqxyq2XYZ1NCad+
	do0Qnvc5PJkTW8EoRlKrX581fftPxVzFmHBmvqZ/1Dw7BsaN8aiSE7gPM3oLSJR9nc9KYWyBBY5HB
	76zSwqaXdavGrYcwkuqu5OLY/e3zN2sTIMwkV6cjLYPLkX1ZWAFYu0ZXtx9shbrq/jr6g+lIjbbCz
	eBfF8dHuJGMOv+BqypZooa/fSbsWEhCbuwHBjJSUOx2bkTzSJgLGmIYI180CkhFik14qiMgSejEQc
	R1t6zm616UeLPSrIv11K/GqQRl7Q7L8l8UPhokag993OHq7KLPfNq0ed4bQDaCg52jNOY0mEt5xBq
	kdMunXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKu1-0000000AAmc-3uTY;
	Fri, 25 Jul 2025 16:04:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcH-0000000A8YB-3Mvk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4561607166aso17330425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458348; x=1754063148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imtw8Gx4ry64i1JxbY02DQ6xhqBG4Z3YKMzGCpocp7k=;
        b=kMCGSy8g+CL2tHC6gz0kWeCqazNi3cXKZ06pWPf1ZY4uvEIenfHrNZTLX94lz57Lm/
         GvfZrsvi/62kpk6GGebktVPwjwdj9goMWGIwTHpnEZYWyp51oDjPrJL9WPqAhifOLZTl
         crgPHTVfbHsbi7RkNFxMahJlu+P9r2kaQNwv5N54VXeELyWsojK6tVcF8yf9AXKju2AJ
         fO/e6Ktvx09ZFNEKTG6Jw6mdcu9+dD+N7uFm3+8lkluh2vGCRWhQL/J3GIZZ06PSFV/K
         8X5WbPQH4pQTucDdpaejozqz7Sa2hR9XslKZJiAO5iLfTfTX+pxQI/5fo4mxzFu4JYpI
         VqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458348; x=1754063148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Imtw8Gx4ry64i1JxbY02DQ6xhqBG4Z3YKMzGCpocp7k=;
        b=R0q8chGj6k9lnvh3E5YovUT523U92Xc95NGpcyYUGOQGtpB5l1FuI6CngSeGwyt90/
         KyiKWyv/ieaH5LWKrYnlXOiIaEmuQSJDH1BS0Qz2LxG9ikovYDZzrf6dhsHX8FJXGdpT
         4XWKNxHfOMIyaCSuXtOlCDqI7uMT5Anz1H0YOd+Na+NrKVei1XNT7vyvKfdClTdkcNze
         sBepgPi0mUP68pvG28xnq9MhZvs88YftGdxcOX4G8PaPqAFihz8X0p7dScDfyRlm6EHG
         wLmxTSG5ptAi3ToklLmxwommVbYq4Di4eY8sXdIxoa0NfJ2duWT2ovcgwUij3BO2rywi
         WHfg==
X-Forwarded-Encrypted: i=1; AJvYcCVjq/82RRZl4QsBlkguCfymt1lToDDzjnCDzPPX4oBY7gH3WtjLC8gpSwXHL8mzGasI/dIGS7SMRATSEeWGn6Kq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Dk29yhwW3GYIzCxJmfuoqkKHsRvRLyMuo6hb+YitalY1D0Ox
	8b2Gm5CCDoET000vIjqDQ93ZNADJoA99lU70O9OFEa+V0gS60ehLtGczT4036Gryb+k=
X-Gm-Gg: ASbGncvWlY9EIvdZ2e6nKO+cVv6QDl3W5h+TEp9uaZXGj9cL0PiRLF/eVzH+suUqxXB
	SH3uqAHjwR1YMsiPFA5v5xDfZ56iyASdXWY4c0Z0qG1ZDh7v1+sPlGy6Mew0HTv7w4Flwgi8/ix
	SFS0rPpOWZV/M3HHJhI2ZryqfYdum7XVsrygUFlNx6unEU6mXeAP9FxAywjvcD67OUIFxVd9B4N
	rEmjkT/GFFHEdFABifazdQaAbnDaVlRyRsRHeLAFmyYkhZ7Nrvw6nXdVwIjyT+PAnmx99P4wOdl
	YLCRZnwUkNlKjGZ8sznpO0A4nhNMJ2bBPo/6UkvJeIXkzaPWvkY+tN5tFfxGccc7cHsXkmVjMdB
	MiGKjlFBSMfPyLNn33CQuSjr1sc6wg+Y1heJ/rKtJDV7IWt18ghKI08zHsJ3q8Ur9
X-Google-Smtp-Source: AGHT+IGU/MNEg3WQWls2DntpgirfB//jbj9l1ObldWRxzEwSfkXxYeLeZrDkB6W9KV/qLzu1Pm1RFA==
X-Received: by 2002:a05:600c:3585:b0:456:24aa:958e with SMTP id 5b1f17b1804b1-4587b16ef91mr660575e9.0.1753458348394;
        Fri, 25 Jul 2025 08:45:48 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4587ac58162sm1157495e9.18.2025.07.25.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 6/8] pwm: mediatek: Fix various issues in the .apply() callback
Date: Fri, 25 Jul 2025 17:45:10 +0200
Message-ID: <20250725154506.2610172-16-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4756; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=90XfpnWAvKrAD7iR4HpWYRpLi0zHbPGui3cdslYcXUo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aT3OoVnQuD9g/ceDdq/4tPDMudwzFZfPofd LeBmA30bhuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmkwAKCRCPgPtYfRL+ TvGdCACmyBIsMq9Y9fW2D5e/i9qHdd9zN3CsSE4ORC6OwTZh6yXFBCu78dTIEhc+6gVtbvvBesr TXizV3MZc08MY7Z3Ep4BXQ24fyl1sEhmqRA2toImZj08PJrfjFqFLaKymM2KWeHP2j5WAHRcLr7 8a9gONV35IRJTL652Kxbp4ZnY+N7MmJnDtlwpFUreKNptSJ5KvDnxW3HfxmP05rLrOOqV1nPcgh jqoLWHCu6wRIEsmJbmhR2z/KUmRZW3gzCCOrjtpCp7bCnissukSKRl1UgzsmDM7MP7WzZD8tZTO wRFs7LcI+2gksawcw5VgMMexo8y40gp4lzH180habHpxIEub
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084549_855240_9121FE4B 
X-CRM114-Status: GOOD (  20.71  )
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

duty_cycle and period were silently cast from u64 to int losing
relevant bits. Dividing by the result of a division (resolution) looses
precision. clkdiv was determined using a loop while it can be done
without one. Also too low period values were not catched.

Improve all these issues. Handling period and duty_cycle being u64 now
requires a bit more care to prevent overflows, so mul_u64_u64_div_u64()
is used.

The changes implemented in this change also align the chosen hardware
settings to match the usual PWM rules (i.e. round down instead round
nearest) and so .apply() also matches .get_state() silencing several
warnings with PWM_DEBUG=y. While this probably doesn't result in
problems, this aspect makes this change---though it might be considered
a fix---unsuitable for backporting.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 71 +++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 05263a17d55d..c0a97d18e673 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -137,13 +137,13 @@ static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 }
 
 static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			       int duty_ns, int period_ns)
+			       u64 duty_ns, u64 period_ns)
 {
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
-	    reg_thres = PWMTHRES;
+	u32 clkdiv, enable;
+	u32 reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
+	u64 cnt_period, cnt_duty;
 	unsigned long clk_rate;
-	u64 resolution;
 	int ret;
 
 	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
@@ -151,7 +151,11 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 
 	clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
-	if (!clk_rate) {
+	/*
+	 * With the clk running with not more than 1 GHz the calculations below
+	 * won't overflow
+	 */
+	if (!clk_rate || clk_rate > 1000000000) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -160,27 +164,40 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (pc->soc->pwm_ck_26m_sel_reg)
 		writel(0, pc->regs + pc->soc->pwm_ck_26m_sel_reg);
 
-	/* Using resolution in picosecond gets accuracy higher */
-	resolution = (u64)NSEC_PER_SEC * 1000;
-	do_div(resolution, clk_rate);
-
-	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	if (!cnt_period)
-		return -EINVAL;
-
-	while (cnt_period - 1 > FIELD_MAX(PWMDWIDTH_PERIOD)) {
-		resolution *= 2;
-		clkdiv++;
-		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
-						   resolution);
-	}
-
-	if (clkdiv > FIELD_MAX(PWMCON_CLKDIV)) {
-		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
-		ret = -EINVAL;
+	cnt_period = mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC);
+	if (cnt_period == 0) {
+		ret = -ERANGE;
 		goto out;
 	}
 
+	if (cnt_period > FIELD_MAX(PWMDWIDTH_PERIOD) + 1) {
+		if (cnt_period >= ((FIELD_MAX(PWMDWIDTH_PERIOD) + 1) << FIELD_MAX(PWMCON_CLKDIV))) {
+			clkdiv = FIELD_MAX(PWMCON_CLKDIV);
+			cnt_period = FIELD_MAX(PWMDWIDTH_PERIOD) + 1;
+		} else {
+			clkdiv = ilog2(cnt_period) - ilog2(FIELD_MAX(PWMDWIDTH_PERIOD));
+			cnt_period >>= clkdiv;
+		}
+	} else {
+		clkdiv = 0;
+	}
+
+	cnt_duty = mul_u64_u64_div_u64(duty_ns, clk_rate, NSEC_PER_SEC) >> clkdiv;
+	if (cnt_duty > cnt_period)
+		cnt_duty = cnt_period;
+
+	if (cnt_duty) {
+		cnt_duty -= 1;
+		enable = BIT(pwm->hwpwm);
+	} else {
+		enable = 0;
+	}
+
+	cnt_period -= 1;
+
+	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld @%lu -> CON: %x, PERIOD: %llx, DUTY: %llx\n",
+		pwm->hwpwm, duty_ns, period_ns, clk_rate, clkdiv, cnt_period, cnt_duty);
+
 	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
 		/*
 		 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
@@ -190,13 +207,11 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		reg_thres = PWM45THRES_FIXUP;
 	}
 
-	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
-
 	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
 
-	if (cnt_duty) {
-		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty - 1);
+	if (enable) {
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
 		pwm_mediatek_enable(chip, pwm);
 	} else {
 		pwm_mediatek_disable(chip, pwm);
-- 
2.50.0


