Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8451C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEkkBMb35T0v1dnQ8fcl1xdudts5aOTCZdXsRa2DHbs=; b=2+4Mvc7pCf5H9VuNTNIqlx7aP/
	OcwHhjU1dKrcOG7AdYTqJdfvnc+Bh+6HaEBas8g4tTfQ+pRzkTEN3FDxHyvlzrPmQsUSukzN0nlqL
	MuLVFMxH1n6NCrpxx1e5xQqM49FyBBNyBJn1osCYesrn52VnU7FyUAoaX9BgVfGKbEX8QBX7yrAHW
	tP3k5bnYJtgTwjRQl3Di76Z8oU2pKSXc9v/+alsMeU616q0ourNmU+nqdNTPL+fMaLhIbaVzQmKLt
	nIpiSsX9sw1vJrOYWuMff/OrLgkTe7ywe2WUDqRVpzvISIqOvZlFBHBRf4uUuxDGd/ZQVtDvtcEA/
	AbJwkepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRO1-0000000F4eR-05WJ;
	Mon, 28 Jul 2025 17:11:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQHC-0000000EuaG-3Kdg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 16:00:35 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso924963266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753718433; x=1754323233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEkkBMb35T0v1dnQ8fcl1xdudts5aOTCZdXsRa2DHbs=;
        b=YDl7S2gtCZr2GgTLFTEWjpmgO7TCs+FUgQwRiW2eUSs2SnO66NthG0xqilvOqcIMIO
         OIEcIJFwZzGoRHV4WG6io80vi1Pd26Tvd1p9RWaSlXKMt2vcqHyjwR1W/FeWju7uHJr8
         BThCl5Vj5B8OyJEyg7dbkDc3mESlK43pZw+E+f/uSUMd5FNIDmUoJvtzTKh6Ty4fJE3A
         LqRYPMl5M7gw4NbhRRu3giVZdq/40sUZs2IWJOPy4pV+r/O4KewBvif81/6/ZNAkRjUJ
         Qrg/l+Pi079javm1vAm0UuTMBhTCAzVy/y+LiFpH4ys5/TYRlomjE1hS9Q4gQljRV/Fa
         fn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718433; x=1754323233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEkkBMb35T0v1dnQ8fcl1xdudts5aOTCZdXsRa2DHbs=;
        b=mMNuPI8/+f2QUalPwjIeWSLXPdBUHnxSXSGSV9Y6PRsOhtqQInqDQ096y+0S2WNNQy
         H/IqtYNDnKllnsYxVm7VL95ZwwycHrf7NcWXx+OmRBNeTkA7MeGjo22mtPZsL6FlEy1K
         kRPlLwV90JUvlkW+iTLg1Ao1IgebDmVxEJ78fxZJZGsRnCEF34Fk8SuWDpNvk7acORe+
         fQWNkWxrvFMBn+cyaiVBJvffyaUZgmZAAOGtiDUtHljdQo0vfSR5VqH1Xu+5H+fncuFz
         dmNf050/HaoFWMDRSpUNFT8UdEUSbKljrp4GRW2ZVjcBIiloLeKiMiJTed6RirBb1dv4
         jMUw==
X-Forwarded-Encrypted: i=1; AJvYcCV7DQb10XyUUDDup59RhT/8V+dEexw50WZHXSWTlR6ecHYAeieOFk1+J6MUWf2VD7Yg0viP5MNRZy/ocI+9VarO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmwrp70UW3AJinteofa8rXMEpnZRWK7cm5I/VRpkBwR6/qHsGM
	tPymQw7ZQPsKF9zAtSYU6P9ZXNro+QxrTP4+KcHmh532e3os0zWO0OJi/5u5lFrtiVM=
X-Gm-Gg: ASbGnctJXgoJRO/jbbQyYhpJV6uNrMyRVlDtPS3e0jPW82W2c2pWQVgbpZ6PlP4m1UA
	Ham3IU/8au4ogKgbD0TuBkMURCAfsf66+1NcdGa9MoDMH7lppiIEge7vQzKd4x/eS7i69NjMr/7
	zJ4WU1DlulTbJ/DjwN851Tml+c0hZKRdOLmXEcvVKo2yluBRDYbYhSIc0c66Hg/PTDxtMQlzz3d
	qSxGqp8PUYI7L1h1bW5X30v9AJ+d5cmUJIlgwORJGvGYMxEv+LeDYrMx9kglqdRAOiQnhGTTOgV
	BALE2clBneeD+ehNJdPZyX6F7Mbcf36GXr2Q4RASyxPhM6oy94uYU5ZZySmkE0ov2gGN/lNWHQY
	LWJt84CoKKTQx+Oxc1LsKa2+EWt6Fw4PTJOoJsu0SPGy6+ln/x+oda69oZv+IC2UmJkAu0NOxIB
	0=
X-Google-Smtp-Source: AGHT+IGjaAaodAuMnxX/es03owJK/l/UBs6JxVTwTZFVer5/mcNukBpbQFEgvLPCs5Jmb9MaExk57w==
X-Received: by 2002:a17:906:9fd2:b0:ae0:cf01:a9ad with SMTP id a640c23a62f3a-af61e533cecmr1307265166b.40.1753718433142;
        Mon, 28 Jul 2025 09:00:33 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af635af9555sm430343766b.133.2025.07.28.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:00:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/2] pwm: mediatek: Fix duty and period setting
Date: Mon, 28 Jul 2025 18:00:18 +0200
Message-ID: <6d1fa87a76f8020bfe3171529b8e19baffceab10.1753717973.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
References: <cover.1753717973.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=r70JoWPBMkSGg8Q7MTFwRHQvEblM9zt7/MoS5rUeNI0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoh56X9/dgc+Yosa6Tl4O9n7Tg+UrDenhDziD6r +ETX6Z6qEeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIeelwAKCRCPgPtYfRL+ ThqWB/0eM5OcaIMptlstLjjW23eDAAgVQ34z+Uk94Qqqs6ur0aQDlkd7C8D0G4xqX4GpiTGvIZA pjociRDE8NF9wIqVlQRViI6OuIqWdj9hkbXoJIEirhAJ1GshDOnBuMnJ4XOJpVKnA0EHWkefV3V TFPsa0XBR4FPukmctm7mNvqwG+uhpCjGO2qonmjbjiyh5sr1/3y5cE4gODHfNX7gECeGq45s3G/ 9uQa9A1CO+CL50BuE8wmZJ4E3KCmZKketFUGwRAkLopDfqUZnN5zzBsE3xU6ZhVN1fr/HYjXG/i sCpRmbFQ9zmYIgeMGbkpH5ZJExiKiGibWgVdsJAltccRH3+l
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_090034_833346_26A06912 
X-CRM114-Status: GOOD (  15.36  )
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

The period generated by the hardware is

	(PWMDWIDTH + 1) << CLKDIV) / freq

according to my tests with a signal analyser and also the documentation.

The current algorithm doesn't consider the `+ 1` part and so configures
slightly too high periods. The same issue exists for the duty cycle
setting. So subtract 1 from both the register values for period and
duty cycle. If period is 0, bail out, if duty_cycle is 0, just disable
the PWM which results in a constant low output.

Fixes: caf065f8fd58 ("pwm: Add MediaTek PWM support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index b6560e52c803..e4b595fc5a5e 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -170,7 +170,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	do_div(resolution, clk_rate);
 
 	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
-	while (cnt_period > 8191) {
+	if (!cnt_period)
+		return -EINVAL;
+
+	while (cnt_period > 8192) {
 		resolution *= 2;
 		clkdiv++;
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
@@ -193,9 +196,16 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
+
 	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
-	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
+	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period - 1);
+
+	if (cnt_duty) {
+		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty - 1);
+		pwm_mediatek_enable(chip, pwm);
+	} else {
+		pwm_mediatek_disable(chip, pwm);
+	}
 
 out:
 	pwm_mediatek_clk_disable(chip, pwm);
@@ -224,11 +234,8 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (err)
 		return err;
 
-	if (!pwm->state.enabled) {
+	if (!pwm->state.enabled)
 		err = pwm_mediatek_clk_enable(chip, pwm);
-		if (!err)
-			pwm_mediatek_enable(chip, pwm);
-	}
 
 	return err;
 }
-- 
2.50.0


