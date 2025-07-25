Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65689C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqeYbISRrV+5hnivpZpzP4dFlpiY5AyOca5fuPF0H+g=; b=3/UXP902a4BH3hbxTKeNq26cq9
	RD9NaGOkSqKLPGW5xTA+KRGFKQAFUfBsJ8YYDOKNSUMZTcl724xuKWsDCt0Medpy94+guhQCBzCfj
	/KE63++M//av9P3rA0qh/1YeHbeS7o1WH4V+6I/6CzSKvWqM319FxhAdFIPLMvID6ETyNmuyLt+Mp
	0rsJbITV2TwWQSltbxZ1fFR9L4cA02u4iEdWLyaptkYFFEM9Wa5RTjQLVpbhED7aK2ElKd7yzyIjC
	hmCn3K1eBv1yWU0LMDttn7HRdfA0lr/WKx4exyn8dKOZrvD6OUnUfAP58KbtwP6ic51u1qshoa+9i
	Zaw+hefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKmg-0000000A9v7-38xK;
	Fri, 25 Jul 2025 15:56:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcD-0000000A8V1-1CqY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso12270565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458344; x=1754063144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqeYbISRrV+5hnivpZpzP4dFlpiY5AyOca5fuPF0H+g=;
        b=yOrvEF6cyJvlcnaSCWAXRYr1suu/DGsSXjyhJZbXMwANfx1Smjjcct6hL3zMr2u5uC
         pVDwtmwvGvl31lQeTG5Ma/+xo8YPf5k61mcBsmpeAcvT0pnLHuk8UGi9Ngka14SbH6/y
         SRrcJTSF/TeXbbD1oayit6I50mUPUqwmotESzGr8l8tBZMENMvEQTcbo0H/7TaWVfiaf
         dokWTmp0rLekg9wlCePvfS0cWrvZkeDLJHLS2Nw7kAVw3frWyoCenQlQY9ydELrr+tuN
         Uq/8jOJ2FGNu/YA0SHnVsPGzIwK3rZoQqFkti1YUeAUfOwIiJL9feh9i6jtkMI2nlExz
         dDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458344; x=1754063144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqeYbISRrV+5hnivpZpzP4dFlpiY5AyOca5fuPF0H+g=;
        b=eKetR5JxQiqEGN3LN8MU3QiWt1FBFGFkIbHnwTmSz/iHa+v3PXKhU4yXuFVuMgrkQJ
         1XDJHCiDyWNq0/RrbsNAd6jGZ11wwhVn5tx9ESg5e6/zoUGIa3CEdfIaJXMobFdWwE2v
         FjrDRPws3/+NvJ1q1HndRFx/o5RoqxxPopb8zag3cIgwinUKFapAjfIgoqQpRa2UBxwr
         tMmg12gnvtWADYHlPVIR+mb8MeZW/rdo+M7HjcTAe7GXh7rFId6Ju21N1XWhT5Cd+TRm
         yZypA7Yb75Ien0CYFgjDrZJ5pds1baic+rfdHr8rE5VSkjoKt1dm9ou3eyoLJ/GaBI8e
         T4Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXNrXzNqsqie9hxKhJCgUYpMKrveynO6fzBtj4bNLZtcwf0Oau1fOKOInkMbw3oxtgaVKiW6nheG5ju4c+lKwKK@lists.infradead.org
X-Gm-Message-State: AOJu0YytmLLkOs1AC7hqFGxQWaD1KjyA7TqnBpMbhvteyQSaMQmeTVhp
	z0GHnJCboWWddH4O9ozQVftaaeKH8K6kU+uVFTlLtQyNkiBP8gM5F0EJRbo6ydY2ZIc=
X-Gm-Gg: ASbGncsrBZjf0cGl/YaXm+U7uWvY0RK/feiNDkWzeFxwOJ40YjgeEexc04eulDr+PcQ
	9lxODUoPTwQDJib/HOx+HPsrQR8Y82xbX9J16Cp47t1tsv09oUjYW60Ko7tnY/Gm4eVMjATX7Lq
	2hIHwUVliaT5Q3K533K7iD+fRnyUz3dYd8gob8IwylKF4wk6Yf1FdgkZHZnqa621jDtZ8C1sp32
	1NKnVfh0Fj5hfCs6u53jMrORRSQJiR8hZrRFexYYp7U/ccJFhlCkErc8sR+p9cLiRdkh5o+F1WI
	JJWNOFwAcCtg/eJe42IC6frCxk5w2sxSEKQYbMM8OkEr6q9VJ6Cj/vUg6tN1H9OrA+f+KPeVH9C
	htHLI658NSE7cVFmquTCmUEG1wsMgJ2qIDA8WywtaouR0GCEOxSUz+FKZrzxn/eLr
X-Google-Smtp-Source: AGHT+IEMnAm6eYYt9SA3EJ8JWzNNY5j+6Cpu8KzMEyMYJ2IvVKEGwQY13ienYQElwLk7H6kJ0bsUCQ==
X-Received: by 2002:a05:600c:8b84:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-458762f06e8mr21186475e9.6.1753458343593;
        Fri, 25 Jul 2025 08:45:43 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458705c4d91sm60022475e9.23.2025.07.25.08.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/8] pwm: mediatek: Rework parameters for clk helper function
Date: Fri, 25 Jul 2025 17:45:07 +0200
Message-ID: <20250725154506.2610172-13-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3249; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=PtQNGC5WTp/+D0m4ok5SnO37pwnEBONW7hAjkEA3ZYs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aLlPuS7y/RNmSqedFUfPOp4sAURXh27DoSc YAtimGPSe2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmiwAKCRCPgPtYfRL+ TpERB/93FL3shXv1VmXPqWboo8y55DrR1DGf8oBZW8af/IuwAB2ot2HsO6CkJdGBEK60Ny9hg0g GC6ttlYHDUuuHd6tVWjgXEaLpPZZAoAwbW5vI/kiEuYeDUzcp/T8AbWVK1Q+1XU9o3dfhwwyF2u RjSpF4fGRNTOT3Rs5UEeC0ehmKiOuG7PKSUP1qvsHqwOC28CyMads8jqJAS6VEcdP1gncrb0Ckl f+tDyPyY+HW75yZVA1ePa89In3BdWqc68j/ANObSii7uTLwWOFcYHLCknHz+yRHNzvMrH9agq8Y qj7pBariENJwlEF7adHtiYeF4YovzhyN4YfVYMf7EZAEZpxv
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084545_331658_3DCF41C8 
X-CRM114-Status: GOOD (  15.30  )
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

Convert pwm_mediatek_clk_enable() and pwm_mediatek_clk_disable() to take
lower level parameters. This enables these functions to be used in the next
commit when there is no valid pwm_chip and pwm_device yet.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index eb348337454d..16ea42be4c18 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -65,10 +65,9 @@ to_pwm_mediatek_chip(struct pwm_chip *chip)
 	return pwmchip_get_drvdata(chip);
 }
 
-static int pwm_mediatek_clk_enable(struct pwm_chip *chip,
-				   struct pwm_device *pwm)
+static int pwm_mediatek_clk_enable(struct pwm_mediatek_chip *pc,
+				   unsigned int hwpwm)
 {
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
 	int ret;
 
 	ret = clk_prepare_enable(pc->clk_top);
@@ -79,7 +78,7 @@ static int pwm_mediatek_clk_enable(struct pwm_chip *chip,
 	if (ret < 0)
 		goto disable_clk_top;
 
-	ret = clk_prepare_enable(pc->clk_pwms[pwm->hwpwm]);
+	ret = clk_prepare_enable(pc->clk_pwms[hwpwm]);
 	if (ret < 0)
 		goto disable_clk_main;
 
@@ -93,12 +92,10 @@ static int pwm_mediatek_clk_enable(struct pwm_chip *chip,
 	return ret;
 }
 
-static void pwm_mediatek_clk_disable(struct pwm_chip *chip,
-				     struct pwm_device *pwm)
+static void pwm_mediatek_clk_disable(struct pwm_mediatek_chip *pc,
+				     unsigned int hwpwm)
 {
-	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-
-	clk_disable_unprepare(pc->clk_pwms[pwm->hwpwm]);
+	clk_disable_unprepare(pc->clk_pwms[hwpwm]);
 	clk_disable_unprepare(pc->clk_main);
 	clk_disable_unprepare(pc->clk_top);
 }
@@ -141,7 +138,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	u64 resolution;
 	int ret;
 
-	ret = pwm_mediatek_clk_enable(chip, pwm);
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
 	if (ret < 0)
 		return ret;
 
@@ -198,7 +195,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 out:
-	pwm_mediatek_clk_disable(chip, pwm);
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 
 	return ret;
 }
@@ -206,6 +203,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			      const struct pwm_state *state)
 {
+	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
 	int err;
 
 	if (state->polarity != PWM_POLARITY_NORMAL)
@@ -214,7 +212,7 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (!state->enabled) {
 		if (pwm->state.enabled) {
 			pwm_mediatek_disable(chip, pwm);
-			pwm_mediatek_clk_disable(chip, pwm);
+			pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 		}
 
 		return 0;
@@ -225,7 +223,7 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return err;
 
 	if (!pwm->state.enabled) {
-		err = pwm_mediatek_clk_enable(chip, pwm);
+		err = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
 		if (err < 0)
 			return err;
 	}
-- 
2.50.0


