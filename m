Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B71CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bcQfxlYT0WdkNlclpO13skLK1pFgoPq0lf6iXLyTJ4A=; b=ANCxPELcK47AjmTTuPKJzOm5wd
	+HfdpwnqqJ+wQQwjya+vMgZLjxC5IW5K4KNGjf8tGL1hTsBAqXYruTL4nMcfgTvRnr+K4tQmVQcq3
	gJhjXwSuI/NJooj1FwzVvkoSGWKsQ7ZJhUqu93j0iTexi9nleHx1Yann2n0vSJUYSIhSlyuJ5qBTO
	Q3IveSy0/rR1fwwssnr0RGJ1GIzDBhmYAoXBypHys/73Ol2HkN7ZFLUPI7t2NezFbZ4ebkqBS7eme
	l5ISI3LpQYhVgRwUb9Fe/EWEDigecT4sirbeB4mGbDMk5wghDT5b3Qu2ARluEmw5XiFgqljDzvJJh
	Nr9r2Pmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVKA-0000000BkUe-3fw9;
	Fri, 22 May 2026 19:14:22 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVK8-0000000BkU8-3fQY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 19:14:22 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-57611a6a69eso2308512e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779477259; x=1780082059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcQfxlYT0WdkNlclpO13skLK1pFgoPq0lf6iXLyTJ4A=;
        b=eRn9N9mYmMGapBGUd4RtVpLfJMRPaL6NW7xPiyQPGAzLNHLqi7p83hQKj1CDK+COH6
         6vW4WO+7o/yuWRFT5IM7IlFqqwc4hGb2RvG6G+ZtFgoO7NMnxvQadLKsvBm/gZbjBuJ+
         JmfR7MEWmzNjaDMq5xozltZWs3DjZU0/hSjitYi2KHZAsu3IyHYi527UONyGhjrAr520
         FyzPXfuvjSNY46RVZjx6U4IMU3WZIoZdq67bI6VX1BHDe9cX4hK76VjhvDTSxFQpUuRE
         Cdlc7MoA4mdQoqGh0xhen5610Q6cjsoaKEP9rxKLlROsb0oaKBb3EKTqtvShhJ9XS9+3
         X+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779477259; x=1780082059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcQfxlYT0WdkNlclpO13skLK1pFgoPq0lf6iXLyTJ4A=;
        b=qU6vM0hFY92g3ZUaKDq5AzPs7/fVZrVf0FFVyFJbUL3D5DijG2YtKRMMqkcx6/5nq8
         XId3UhygeoFSkgUx8Fhn6owmf60T/KWrLx952gvZSMaujaeM+/MHB7TU/XQ94ZwMpQ3j
         F0uf+PvPmnEpvXaIeK/URujk8x+WTUJd4fqOCDio9m55RZHfYhgBNsLiruoevONN2oox
         d3Fo5BawaohpvZKw+/gCFM31vH9q8h+2ECT918jSRoiBWBnbsBptDmO7R4jMVbAOBcmc
         4XLy84C+PsVCs8B2fG4k1ufMm0nRJ7NDppvSelCbXAz8h1hgBmCkas+QDUb7A8n/+fXJ
         P1uA==
X-Forwarded-Encrypted: i=1; AFNElJ/Sr/xE1WB4+QI/eSxm1H55CGdbeb2KGi7Zu+FVv8l7+ctQ630fWm5MpJkBdcfMz2HqD6El8hS+PvmlIKeX0vZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YyWD4zQGyRy8jyhidei1DZ1o77pYyztIfnD2kC8zarWCKtFb/Qd
	i3HRLvV/zF7DPOWyMfE8qluzorE9dVdltr781D0uTxhPT5Lb6aBToA0vylEu/HdfkQ4=
X-Gm-Gg: Acq92OGq/fTPVMbjGRG5PkXUqxpeanFu4qwWjgoYxMclD/w5SM8pxt9AYpI76cTF2hr
	/zF/HDcmmpVQMeyxJfmkon0LfrfEBmpc+Gz4lYN8tkau93jqbQIt4nEzGrNOIsrjGP4h1zbAvuK
	V8orXcXDwZxAGanNX97kHftQ5dIj8jCEACmz8njNp87ubXaj0QVlOf86u1dHZuNrvw4dmWHx6ri
	yyE/5C3saNNUPiYqLwE6HoSTK+VpAHU23HHohyFPp4EQ7zQsa0QlZ0ljxOCf4e7ndn67ib5he/D
	zQD7+msAQ9gWIXQZr71lltsFbkmSTx+sssWA6Mzpu5AgQ1Q5TxmoUf9gZ5dbSBBFO7099sIvBK5
	cDuTOQgNVD7vYVKL3xX9mkyxCYahM12wwUcFpvfnX17dfBLFxHR2Pmjp/Mr8N/cyNW3AQKMFzSg
	SxnRHIo1Eek70mDo6BbCe5htbJabmBkUEbOwxsSdfXew==
X-Received: by 2002:a05:6122:330a:b0:56f:adb8:7c54 with SMTP id 71dfb90a1353d-5865e3aff5emr3335785e0c.3.1779477259066;
        Fri, 22 May 2026 12:14:19 -0700 (PDT)
Received: from acer-e1.tail6c460f.ts.net ([2804:7f0:7542:7b16:2880:ed6d:f5c:8b9e])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173af3e82sm2741013241.10.2026.05.22.12.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:14:18 -0700 (PDT)
From: Ronaldo Nunez <rnunez@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ronaldo Nunez <rnunez@baylibre.com>
Subject: [PATCH v2] pwm: imx27: Fix variable truncation in .apply()
Date: Fri, 22 May 2026 16:13:48 -0300
Message-ID: <20260522191348.6227-1-rnunez@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_121420_923493_2E0E87C3 
X-CRM114-Status: GOOD (  12.17  )
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

Fix a variable truncation when calculating period in microseconds as
part of the solution for the ERR051198 in .apply() callback.

Example scenario:
 - Period of 3us (PWMPR = 196 and prescaler = 1)
 - Expected value in tmp: 198000000000 (NSEC_PER_SEC * (196 + 2) * 1)
 - Actual value is 431504384 (truncation to u32)

Signed-off-by: Ronaldo Nunez <rnunez@baylibre.com>
---
Changes in v2:
- Added example with actual PWMPR/prescaler values per Frank Li's feedback
- Dropped testing section
---
 drivers/pwm/pwm-imx27.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
index 3d34cdc4a3a5..c8b801fcb525 100644
--- a/drivers/pwm/pwm-imx27.c
+++ b/drivers/pwm/pwm-imx27.c
@@ -200,7 +200,7 @@ static void pwm_imx27_wait_fifo_slot(struct pwm_chip *chip,
 static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			   const struct pwm_state *state)
 {
-	unsigned long period_cycles, duty_cycles, prescale, period_us, tmp;
+	unsigned long period_cycles, duty_cycles, prescale, period_us;
 	struct pwm_imx27_chip *imx = to_pwm_imx27_chip(chip);
 	unsigned long long c;
 	unsigned long long clkrate;
@@ -208,6 +208,7 @@ static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int val;
 	int ret;
 	u32 cr;
+	u64 tmp;
 
 	clkrate = clk_get_rate(imx->clks[PWM_IMX27_PER].clk);
 	c = clkrate * state->period;
@@ -249,6 +250,11 @@ static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	val = readl(imx->mmio_base + MX3_PWMPR);
 	val = val >= MX3_PWMPR_MAX ? MX3_PWMPR_MAX : val;
 	cr = readl(imx->mmio_base + MX3_PWMCR);
+
+	/*
+	 * tmp stores period in nanoseconds. Result fits in u64 since
+	 * val <= 0xfffe and prescaler in [1, 0x1000].
+	 */
 	tmp = NSEC_PER_SEC * (u64)(val + 2) * MX3_PWMCR_PRESCALER_GET(cr);
 	tmp = DIV_ROUND_UP_ULL(tmp, clkrate);
 	period_us = DIV_ROUND_UP_ULL(tmp, 1000);
-- 
2.53.0


