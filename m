Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3051C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoJ4LgN2a4tZpj/ymfAQmbnXKEu39rNsuUXJ9Xuh1ro=; b=az7ItBRzqrNMbtSon/OHvPyU+m
	Vb382AlMqKMb6xhi3h0v65PPY3CUyI/PjCPCPnxi9bX8lkQUtkO9TqHNXVWyblU4kZ+5mm4YVOGqt
	NbyQRLCzuuNbChKBE6IkGIShpCeeZkMQlyhg9cWjmWIZHMVSHCiFjfpEZsQjgGyjrAKTvLIRaLhr8
	IV3ep2NBYLI4CCguSjk9cuCMCIvJljO3NqxMMxB6bKdjWUZQK1OpiUmcJ2ImdwN9vfT5SJfFI5mR/
	UjjENOczckiZxU30z9D40YPfz6yja10XYdDBYmsgNeO+FcDA5MoNyByjmxl/17yNlfcJSzZ44Ir+q
	s8Rcyc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKwU-0000000AB0e-1RNU;
	Fri, 25 Jul 2025 16:06:42 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcK-0000000A8ZJ-0bXl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b775b04b63so804976f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458351; x=1754063151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoJ4LgN2a4tZpj/ymfAQmbnXKEu39rNsuUXJ9Xuh1ro=;
        b=ZQ80yimxprcodlJnmlq9YZBuyx35EkAQHxAHdDoOdcrVA0Ztw/PHeiaTN/ZpyEOHbn
         SRrS8jmmLaTJPHRaFjUkymYmBuiS4imUGAFeszNJgTbdWGgmYFqwJ8JNTRv3TdxdjMiK
         YTZR0RzgTChiRnlLlFmMcz1CMemqGSALQHM0zcn7gD3fZKC/w3jm8nF3razX78Co4i0F
         N1ctvCTXdyX7PM/rdqgCmGy0xJOhzOv8d/yZ+R8eyevhrTfkMlCL4rykqhRQEdkY3ccP
         9ipZcrmWfLr7yxwR6gUledNbgsEnpTV8OCOzN75Yr6aGWDWml7Cw20epHfgDt00pWS0g
         D6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458351; x=1754063151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoJ4LgN2a4tZpj/ymfAQmbnXKEu39rNsuUXJ9Xuh1ro=;
        b=mAYakjOucOvHGqJrhBwWmJLLGmsl9AunerNxIfMWVj4j9vrpRgy/d7dd6obip5GnZA
         iaA7xX6snD/pDF0ShRSOJaCvqRa1qf8rIaI1YiAx5lK2Sld2kBO6CF4FskvkH+U3NTaC
         EDSjwvJSDwvXKo/2ZZhqyKeqmaZxMt+KSyshlL3bUnfw7Z7kpjfB5wgENe+hDb192s0s
         6Io+djc8RNXaRl7Pf355pJ5pkwVPK9SB/AlnBqxTViqVnsdafzpzXBbjcBxn9KztOSGn
         BL0ae5AmwgFdcjufN4ecQgQnxrA0SItj3MTxl17zJpI7PPrxflV67YjgM0dpO0dbP0s/
         Co/g==
X-Forwarded-Encrypted: i=1; AJvYcCXByMS8MeJGYHuFcplghxzfX0+h6hqahkjbL4bfKHaawhdGrcEoOglhRcqD8TbuVQlP9Rg7EQ8/cmsLnqpm5VD2@lists.infradead.org
X-Gm-Message-State: AOJu0YxZanzzbBLXaPjjl4mAxeIxD78hqfQXaLsD5tLZeZf9NYyndBCS
	ZAC5NnzKiyplm57atUCVwRY2APNSlUDe8MDmfZfiXkhasjasf1FqPtDYhCXAxY3pJIk=
X-Gm-Gg: ASbGncsKpSQAstaQ95lq8WWmA0ixc8gvemBRO7uu4k09L4ZPDETByXc5bI87eLSiZpQ
	vfBEovZUBBDbGKh6LhJT9c5citP2KE28PoCQyvOftlaoaXADYlfbbwZ6asXc/6wvXmH8O7Fo3R5
	+RvzsDS9J0xqWAZuRqm1CT01/vluwStvq/oAq9KcAF4kSmjAVTrOkFejycq0vfu4bTru34BSchH
	4/eIyBmmTbYvHoztrqGtfY9cS8b2h5++IUwrOqK7djukJCpDV0BqfmUQbDftGquWJqa7rutbH7r
	UitUln4psRJ5Ncmyv1IuoKQYjQQDFeSpBRTp1Vy+ptuGsfXP8Eq6H40K+uXpd+YI6uIgM7LGNyB
	PM6d8KmBpDWxvhHx0Uohkk6X4oqQr6RhJyFOHHlSHYeBG9qGvZGvl7ic4cye8F7cI
X-Google-Smtp-Source: AGHT+IE9bNRiB3Qxy0KHeqE8qrwywnivjPUMoNFq3RkfbqAUqcT6tNnlxh22WNu3gjYRsqktjTx6xw==
X-Received: by 2002:a5d:5d84:0:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3b776799dfamr2803849f8f.53.1753458350705;
        Fri, 25 Jul 2025 08:45:50 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458705d42b0sm57302245e9.33.2025.07.25.08.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:49 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 7/8] pwm: mediatek: Lock and cache clock rate
Date: Fri, 25 Jul 2025 17:45:11 +0200
Message-ID: <20250725154506.2610172-17-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5399; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=VqojZhR/PzLVgvBcCgghwQQVCj6ocUYU241i7wcw1i4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aW7vIUc3dJRNMbN6JVqt2HKRuR0Bl64bZoB kVT2403OSWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmlgAKCRCPgPtYfRL+ TrrTB/0bKtUrqzjAmrjYN3up2a4GaQRAq8QAsWp17Ih+an/kOlLngokHze5TuTJMOk8jw0jgkoc X49aw7CWPSF0/BuhH6yt5PJ2D218i9GiAma9qENepszp59WPn5zx2OPZJ+YjrXVEEh5Rspbc5XX tt9fbRBwHvtcePKz0S4/pFFkWrbyGb4CmUpcdEIzw3YGsWDW8tt9DV7zQ0Jt1J6AvA1qbrE/Soo PzJ7efEG6mKEDsOT2bhIOqYWGvcwOFPt56R2ArY77crlHn4PtZ9+Tf9LlmXDcDbVBJS188CzzNK WHup8FXYxKmwhvYhuVca0aXqnYbxrDyBqi27M4+vJ8ldK/Eh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084552_216102_76FD4A84 
X-CRM114-Status: GOOD (  22.31  )
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
index c0a97d18e673..e3db54995f7b 100644
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
@@ -150,15 +169,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -217,7 +228,6 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		pwm_mediatek_disable(chip, pwm);
 	}
 
-out:
 	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 
 	return ret;
@@ -280,11 +290,7 @@ static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -309,7 +315,6 @@ static int pwm_mediatek_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->enabled = false;
 	}
 
-out:
 	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 
 	return ret;
@@ -373,7 +378,8 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 
 	soc = of_device_get_match_data(&pdev->dev);
 
-	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms, sizeof(*pc));
+	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms,
+				  sizeof(*pc) + soc->num_pwms * sizeof(*pc->clk_pwms));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	pc = to_pwm_mediatek_chip(chip);
@@ -384,11 +390,6 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
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
@@ -404,10 +405,15 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 
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
2.50.0


