Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5F0C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EJ8+3kzijg+yQZlgXvqdx2kavqq2yHDf6k+bFmty+p8=; b=yYs3DTxf3ZEdh3YHzdnVMljszV
	V6EoFC9xMN+QGG/QXwUYu9tusLFnibItA9zHQ755GoO+rWy8AiBmicYzwHQa9H1xXe+ThxttS3A2r
	7g+AC3yIBiuwG/fXDU7orncZ1FcvmP6+evAx2vN0GSyWdx27EO2yhPABBOv8QJc+RFa32cmYHhv+Z
	DS8r+94509CfCqAHHhCD38ePx5dsd7wqbN0igU8DPY8q1f8eW+CCuDZEyX3sriu1dzWRs8HEnCBGU
	sBXeV4CnaSZTIQyP3CLBt6G7Pr8syoxomNA/TvRJqPKtps6x8rtQrqTW88ZKmlsrKrcQ9pDG3eHDg
	a5jyXYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkEj-0000000F5nq-1sON;
	Fri, 04 Jul 2025 17:30:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkCL-0000000F5Wy-3srP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:27:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-453749af004so5595715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 10:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751650060; x=1752254860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ8+3kzijg+yQZlgXvqdx2kavqq2yHDf6k+bFmty+p8=;
        b=E+d+XBXQeRNIbX9XVVMRtbnbutsV0/FLW2WPUS/0JMB33QJR1OzJe/p0vSmb0ux4+E
         pFaVJyw8qCC/P8sOzkLCH+zhHqGX6dFfHoqrRCsEyGW5mWPoQDm7BLhwYgPzxwCIVvbx
         jVDqwaCbsffKvRFLMuq2ZVB1bpzdRhkFfmpJ0tDEpymR5nYTpq7aFhGvVqbnVp0gZREZ
         kBmABS9CbPim/FXm45EFOAH7aSljW8hJCyd9xktyb7mNXY+QQLEYx40+sfFGCFMC5pB8
         AJ0VLCKccV/JaiCt7zrgJPLkJniZdLw9PTMbuLIZevkgYXG9oUPvvWedolDpA3SZvWK4
         s0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751650060; x=1752254860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ8+3kzijg+yQZlgXvqdx2kavqq2yHDf6k+bFmty+p8=;
        b=b0+Jox8uj0P5ZDqHHLhUv8tAdhEWHiRDNNEmVLB0H7zc34z5ukR4YisLwdbJhDvbE/
         icB2nqLPcoy+K6W5cKFwcWbhU89H0RDy8+cU3PIN4K74grZHFDWBY/mfSGXNQZ2DIBn9
         yrOo5DVtaogoQ7shFD98vK6nkwf/l38vPjDrMwA1hx37SWe198cKeEWFKJ1bCDUuPZin
         0mldgH/CXFc1knUpo39e1ZN2IejOQHn4JGrpqt3ZFHaBoeiD85bN1AMHFrRAFVNvOzqz
         Z8nktXl7tN0WcEE0CpXvyEvWTMWe/aaU53zgv9KHCRAW1u5/yogWjTgEcfpQTbgWEnk8
         y5/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUmljhG3cWa0uPwezbkvEYWczHYMnBTUUhGeq2HjlXGOsJqL2dp2IjXj+88wV7ZjDf34S2XnIa8167Zb+cZc+S@lists.infradead.org
X-Gm-Message-State: AOJu0YyBXsiVWKAVIknFiZKZ0xVpJqCrzGHDaT8mEvaWaQPXaLcct/wU
	i+ZT/9C0I3iz4id+gASylBY6wTWX+LfTAdsvk70S/Js+WlWVZpZo5FUWIeEWCoK9AFS0/E3GzAR
	8UGkd
X-Gm-Gg: ASbGncvD9EAWWwo9zg36qVX1ZMhuZJUj1GdQjVCo4C3/zwqKmnqfYSVPRRxsKg0kFY7
	nZQBqcv3SvWlBry/+uLL6d60Tn6ehJk73Mp40CBJhZ0SDZHGZGVUk4tymteS6HlrQbYxQzTmMdH
	UL0wkc5TPo+dguoK+WFqkuK7/SVQl2G2qrB3i7Wr7OlSPh0+9eOrGT6k1LALRzI4V4uxlszEKuL
	8J+Na3uWFjIlU5/E9mnF3+Aa9HXBXVlKRwaTgb+bodtehZQB2LDut5+/OfaElyGD/RcxVMARvFR
	CDSX0hN+8hjBVklfHdhavO+F1F4OXa0UiYkJvrheP4jEYE9rUsjIjgv1ZioH4LkJ6hw7230LbXV
	geZ32dlfzhCGBIEYiq+BMXKFu5RaAGgM0Ikt5lw0=
X-Google-Smtp-Source: AGHT+IGv5u997dndbYtn5LpnOeCgXKKeiNmL+umfIlNuz+5mm9d73N+p5qkNg3C/k7JLAiqbd72qUA==
X-Received: by 2002:a05:600c:8b6f:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-454b30b4d40mr39282915e9.14.1751650059765;
        Fri, 04 Jul 2025 10:27:39 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454b188d8e6sm31455575e9.36.2025.07.04.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:27:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
Date: Fri,  4 Jul 2025 19:27:27 +0200
Message-ID: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1841; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=5T8lLq8LRw7v7jY52F738fYrCCvGVLO6R+VQ2/Gu59s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoaA8A/CID8YoVzALS6o+3ioPferch7DY1qIofp Ikg+oeQkkWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGgPAAAKCRCPgPtYfRL+ Tu4JB/9jcS5cvb4dOI+tfyL8GO5FMte/UYZykJQsMUX7mAS214vqglz9KOtmyfbXkf5ZK2otSml ZterLv8gcmhJLJYofdE1y8S1shMqNIRin7NZ6eaaN0C+ptF9sF31aiWXPRnEoFsKYdueGyZ9ov9 Is9qaX7rZA4/Gjgtw4k9aaUamznd5q5xpJu26xUog599gwS+WLuPU3l5A9xaP7TjTs21pTuf0u5 FswUA9k93WAL8h96F3jnP/n08LX3anvstsmbBG32/n8Pqwm1SxMR2oV8cPPqXVHozul4z+RkpEs pzFPczoCywlbdJmrRuCT6XY7KYD9g56e7O0TaYAXdkq3ayHZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_102742_200883_34E8FCC1 
X-CRM114-Status: GOOD (  14.85  )
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

After enabling the clocks each error path must disable the clocks again.
One of them failed to do so. Unify the error paths to use goto to make it
harder for future changes to add a similar bug.

Fixes: 7ca59947b5fc ("pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 7eaab5831499..33d3554b9197 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -130,8 +130,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 
 	clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
-	if (!clk_rate)
-		return -EINVAL;
+	if (!clk_rate) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* Make sure we use the bus clock and not the 26MHz clock */
 	if (pc->soc->has_ck_26m_sel)
@@ -150,9 +152,9 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	if (clkdiv > PWM_CLK_DIV_MAX) {
-		pwm_mediatek_clk_disable(chip, pwm);
 		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
@@ -169,9 +171,10 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
 
+out:
 	pwm_mediatek_clk_disable(chip, pwm);
 
-	return 0;
+	return ret;
 }
 
 static int pwm_mediatek_enable(struct pwm_chip *chip, struct pwm_device *pwm)

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0

