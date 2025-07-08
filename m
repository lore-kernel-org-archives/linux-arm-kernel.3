Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966FBC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJy/L3KF70Zdiqqmji/VZQ4AG3AZxAjhDs+q1gVtfqM=; b=pADacXT9R4PYsccO/zO9FC7xu3
	fQRK/TNvhm9cXgtofUBt2yuGEMZfOiJ/CDM3XZHJIC6o3VoPx8Rh675KobzSxnwd6ALECiQf6jahL
	5ko92tULnoMFyW4GR8+FRcie7Rlrc9UtbsA/qWkbkYkjs/U8L4H+JSIbsORsji6Vi2oBZfOZbNxoL
	21CTguOmNCrPqUNHbTRHIqS0xHLiAw+NdHp5IleM4QTP5yjfC0VTNQXVjX+OaraP1nAjAR84ggjZR
	7KPlqowo41lbpUXf/W40E0/4mQH1lUx+K72myvrt3qoAOW82oyenxib6ZK1J8reTZnVdxy+OZqjNs
	7nIWkqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCK8-000000069DT-3Dty;
	Tue, 08 Jul 2025 17:41:44 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByG-0000000665c-33in
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:19:09 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso7206065a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751995147; x=1752599947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJy/L3KF70Zdiqqmji/VZQ4AG3AZxAjhDs+q1gVtfqM=;
        b=1Fgzvxu3zziZkBK4JU4gvgKluSTd5BZWP9pVO2/tGJ3xR9CnF1HXr4YeLPPe9nBtAW
         C17KOla4bKL4JKcvjn5djbAD86HGFlMnhoQYVf3FPyoK0vkmq+A61e/ocOU+R9wDYz0g
         743W5sXQwQDaKkMLXJOX+VX3j2ZBngmNqS8V34sAwc9CnmqMFxWSQCYC1kYxUHmhNJEO
         hpOBa/zJ1hudELAdNCLQ4Eu1CMRHytjzHh4wUcixBVbY+bhOi7GRnGmRpMYYE6r3AIL3
         d54JyyuEl6eEBL3B4m9c8Q/jab0ZvtiMoykOmZwFTkdj6wWCS5zz9e3lRSDV894WH2nP
         22WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995147; x=1752599947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJy/L3KF70Zdiqqmji/VZQ4AG3AZxAjhDs+q1gVtfqM=;
        b=xUj54QBVV8G0w0Hny2L6sXQFcZodyT4zeUulD5MG3FrO07SkwQ666LRxc9q3gtodqw
         Zvt4Hc5dR24B0EUmgcCJ7dFiVn6Jlja13+JyGZvBlaAWqEr/IkgWZs5RiHxQbBsQEre2
         vfXYb/lHggwgAJl9HgiEI9n77znlXbKp5psysnNSrcWWphtL6p0qHtLdHx2EeKsAdiVB
         C+iEDKopmdp0C8UrE7p3zC/oGg0LwuM2p9SNzovEs0EHXnRunht6YsJXPMitO/jSQDTq
         LwzizpozaCuQ5bX2tiizL0DySTqaD1FD3Tfqiz3deO2AwguzQA8Rw3Dkp/qaeYiX5rUn
         SVOA==
X-Forwarded-Encrypted: i=1; AJvYcCU2FHvNyJloiCRs6W6ce8yLISAKBVKG525pGKZNXcXaIXVSDGx8LtKFRRMlfdF4zlL9fpNaFcj9FBZQStd5pWOD@lists.infradead.org
X-Gm-Message-State: AOJu0YziqF9xGJTiFQHE/2lAfMMNjpR+HFWQLu/QoRGwClEZn417n8qc
	YgN9oyGv2Nq9zNTdvfRrZXhNR004eUxIPhpPRTYDpf+5HzzTMIDDzjd4Hs1Rszfalk8=
X-Gm-Gg: ASbGnctrd09L9cxr3vzFQ+JtOn95NanaPvPd2Wx9+t1A0Ymo6Ed34P+YuhZkICFXkxS
	D6y+RQoIvhXLEjeULkhHQ/pJX+wUfunXrjbIgZPWTfBQKaIE0yKorLj3iCpYYLl83TllC0sKpC+
	saECXXqgLCiwxAI7yiqOFnRrrfDgbdkt+mIoDz5ofe4YZkDSyJNUN3lQtUG0nCWR0OJ6s9+UiAe
	7RAJ6XQLYkCV899FVelN5aL99G09yLLapuavurChBOhwVDLr2r0Ek5S5C8ox+mNcv05Jw+6q3IL
	yHfEe49eAl03HvkhXLcborM/BycOlSpm/dtLvGpsif9pxVtgWOmdfNaTZw76p1do0ODoeSbIY/V
	1uSdc68OISnYdA0DeHJRYZKeqOCeW
X-Google-Smtp-Source: AGHT+IHroZ3E2ueYcv/ykrcydfGYdpV+n9RhqQG8ovV8RP98ja814/uxg/sHrKNwX279I/CMgKWuSQ==
X-Received: by 2002:a05:6402:270e:b0:601:d77f:47d9 with SMTP id 4fb4d7f45d1cf-60fd64e4342mr13991766a12.5.1751995147361;
        Tue, 08 Jul 2025 10:19:07 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60fca667676sm7535174a12.7.2025.07.08.10.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:19:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/8] pwm: mediatek: Rework parameters for clk helper function
Date: Tue,  8 Jul 2025 19:18:33 +0200
Message-ID: <bca271889c7ccc2ad21528ddcaeadd3ec8c64a7e.1751994509.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
References: <cover.1751994509.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2960; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=x/kV2pUi1Vzzcz7I1TfeXDKd8gGc8t2w3EP6DIPGv6U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBobVLwGKq2tDc2GXhlZ576n8L2IgZ0AoIKBUxhT LRdiZsNW7KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaG1S8AAKCRCPgPtYfRL+ TjucCACta+Vji7mCKuCdVypWv9+EdHf31FpXE1Q7z0Lsn/2cRsPnamnnC/5YX7X/vHmYt5vmbiV U+irmzTAb/DmrKZPtcyUBDaNIBURYwbhFD+aroOi1gScrMZ9LZcGmPV0F4u9q/NLlCptqNIhGrD MFm44+cBdVEmghdxBUQ4jM/OgIl7/inks2r8ftOX98kJX8ozTbrqs/5ep0UzQyJYi8Qcg9lh1UV 0L4NJ9l7UZYZDvR64+g6+tq9s9hbMAZY8b5DGy2UfGPpa0kol4UXG4+VIvIIoBODtgxWZoD5KIS RwUDEPJA4ZmGZuO3WJwt2402rF2hwCh/NTT0hVgLPKSqiF4x
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101908_779054_589456C0 
X-CRM114-Status: GOOD (  13.93  )
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
 drivers/pwm/pwm-mediatek.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 4e2a27b02c80..8cc61a835cd5 100644
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
@@ -121,7 +118,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	u64 resolution;
 	int ret;
 
-	ret = pwm_mediatek_clk_enable(chip, pwm);
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
 	if (ret < 0)
 		return ret;
 
@@ -168,7 +165,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
 
 out:
-	pwm_mediatek_clk_disable(chip, pwm);
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 
 	return ret;
 }
@@ -179,7 +176,7 @@ static int pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	u32 value;
 	int ret;
 
-	ret = pwm_mediatek_clk_enable(chip, pwm);
+	ret = pwm_mediatek_clk_enable(pc, pwm->hwpwm);
 	if (ret < 0)
 		return ret;
 
@@ -199,7 +196,7 @@ static void pwm_mediatek_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	value &= ~BIT(pwm->hwpwm);
 	writel(value, pc->regs);
 
-	pwm_mediatek_clk_disable(chip, pwm);
+	pwm_mediatek_clk_disable(pc, pwm->hwpwm);
 }
 
 static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-- 
2.49.0


