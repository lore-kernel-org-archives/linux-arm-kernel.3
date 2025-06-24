Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6DAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHz/3THqHcjEMon6vyiI8Ozs2SXaYtuBLpbkrNuLzts=; b=lEQ3srS6Bh2GhoJeWObltTyX1d
	New6CGUd3jOGzQLudbJueHHiKOhFfnl06/o++n5NzQ2o9A5itUluHRaasXaqWkV8hKjvlaCOXqh9o
	25aI11lpo3A9qdpFlkbwNQ9qNuUhMg4lDoTT2oxkJCseDoHi31azifxEE3EVOo3eBiPcI03M0Dqbw
	ANLGMim7l0JHqEUmYcP6LOazW9ykUsD/Ja9x1GEUxX/oYwR5hvcDuV8j4MpQHnLFjN67M7pWIYJpa
	7r6XKxchL0+QfK2KqLxWPAzovLyKqPqstJTJwdbXvEEDoOBtpW/yKP7/uSdLU+KsoYGthU2AvFBfw
	KAgSAMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9pk-00000006ip0-46Vj;
	Tue, 24 Jun 2025 20:01:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8C5-00000006Uab-0SuG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:16:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so27248766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 11:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750788987; x=1751393787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHz/3THqHcjEMon6vyiI8Ozs2SXaYtuBLpbkrNuLzts=;
        b=vgPvCC/QBuKEz6ARiejHkX02+KGT9Z1yK8mcnYgpgbZcXc7poW3fFDM3gFoqkqep9N
         UzSrLhpy5AoGwSnwsBEg6AVf/LXP2lXK2fjtFNjmGN/EOMd2urWuq96b4G4IZXWomcc3
         ks+zPXTs6vzzwmBl6V6IZ4ELKT5oyszzdG6pQ7nDB/ZzjS4BCIKQPgFXwkZ992AxlXJ3
         fFMvjUNFApxMaM82Y5pjA5hc0TUmqZRN/xm6j2ri+Ez1zffZkT5/kN3MWpoh8qVbp1I2
         EBgqOae3STBBfzuvR60wTNbEjlPFZa/2k2ZM8/H1+0Th50Zqdz4h/AZF4CjGPh83D3QK
         lhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788987; x=1751393787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHz/3THqHcjEMon6vyiI8Ozs2SXaYtuBLpbkrNuLzts=;
        b=irbPC1yUJqdeqxIzcWgLSwXlDB9/BAXkMvW0D/VZGGdVWo+SNZVWS3YLtmpt5a+NcL
         p8NG6mhAXZWGrKt9qbhYpiBgx1x810czT/bLoEwJ1cJVPLkClATkupGn7eC5RqjQBEAM
         Akl5JLRhhZO72bAUJcFfrRSN/SK4+tCSkbOL44Bfq0DQePnjfEeof8YyybH5KZziYj56
         W6PQITf3rcEmCb9uAPq7i5kEvXtY8uBOiIfwty8XAW2W7ta7xjJKbnUi01GlwsRGW1Az
         3mMbTfNBXwDxzGrbZ6JO78JQJU+SEyRkglTfMLOrmYnDF5sYeBFAOWjrHZAxNBgjU+nR
         Nytw==
X-Forwarded-Encrypted: i=1; AJvYcCVLjHQWs1QnxiUJA/+VO/jtik8G+pgpXAUMWxB9p6mi+HiDWlJqaY5s7uJMG1vsnFi4bLbs6TPLJMZU5SLIAmFY@lists.infradead.org
X-Gm-Message-State: AOJu0YwSE2c0a1ESkACYZOfVYnYUMMtrLy0w7tyz/AO/ZJbHd3XPOMqg
	NR9l4t4fsR7iMgxfuByTrIX0KZWs/bxmKyAV0FMg0hvp8k6/w6xKuIBtR0hD/hQeWa8=
X-Gm-Gg: ASbGncvOETKMF7bOtIBZ9C/29NLW2rFVLbVg2b4/BaV7gUh9E3+GrXh/x0DEY930gRi
	HEW/PGBUGsmOwmKlpFgUAz+rZ+tP4QbvJFCRQ9aPfPDVpcIpPx0hewiKGbo0E271SHVYkNTcagZ
	/O0t2FAcQA0fB27mWjsBXvaXKUsdz0RBhhN0ynbI4+BU3SyR806nUXUgryw5wD/EzYjP7DuiXxg
	uf9rA/B89Cj2MhTNrP05RCjrpL1246KdtbmyrtXNgJdxHaWFgO4NasgbKdaixHxdm0vmrXPmH7Q
	mjeqWkvytJIprR3fGI0B8nel+BpFlmKwNXVDli/cPFVHbCTBqVAKc6wfynhNye/dX/6vzrO/tbv
	wsw==
X-Google-Smtp-Source: AGHT+IEOZkYdx1/zibKqZMORZGuO3lgEW21erK3oZBKU/fRGiWuFQ0Dtix+3x3kqUbVdO3ce/uGFQw==
X-Received: by 2002:a17:907:cd16:b0:ad2:40a1:7894 with SMTP id a640c23a62f3a-ae0bea0a411mr32871166b.41.1750788987278;
        Tue, 24 Jun 2025 11:16:27 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae054209a13sm901584066b.168.2025.06.24.11.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/8] pwm: lpc18xx-sct: Drop driver local locking
Date: Tue, 24 Jun 2025 20:15:40 +0200
Message-ID: <4f7a2da37adbfe4743564245119045826d86eca6.1750788649.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=tZK8Wq+anKBP1rLIKaMXsBuPvMqM2sbrLZnT8Z4b6RM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWutY/hqvEJv/ccjOwk+1Eo4IGImrEhto56NV5 WbUTOYeBvSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFrrWAAKCRCPgPtYfRL+ Tmk9CACFJ0A/jRALDWw+ocNBbs3Jg1kxVhrPhaaqLaqabNp/L3ZYtMNRq3Pu0rvsMWeGnXlCZnH 6O+RXcF2nVIb44s93mM8z+uHVAKMls3Zuyj8IWBgDz1DCYdrVSpDRFSrJ3r2CsH6Jvnv/XBbIwB TwKNMLAgLMSQo/ZNOjjtzVXMclcZnQAmgyr0F0dl90iJmHaWtA2lNuBcNjRozZ7qHEkieVCtNkh BP1ZvV/qSgCDVjGTpXjKT2vSSzYu1p/DhP8B/pJbS57fWnZwtZLUMvuFW2M70oTtO21nLbZHsxA Eal0wKVvFr2bkKPjwNVNqI7bDjjGvvrU3a1KRrZIbEQzUL5V
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_111629_153736_5F2FA66C 
X-CRM114-Status: GOOD (  13.60  )
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

Both mutexes are only used in one function each. These functions are only
called by the .apply() callback. As the .apply() calls are serialized by
the core since commit 1cc2e1faafb3 ("pwm: Add more locking") the mutexes
have no effect apart from runtime overhead. Drop them.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-lpc18xx-sct.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pwm/pwm-lpc18xx-sct.c b/drivers/pwm/pwm-lpc18xx-sct.c
index f351baa63453..1e614b2a0227 100644
--- a/drivers/pwm/pwm-lpc18xx-sct.c
+++ b/drivers/pwm/pwm-lpc18xx-sct.c
@@ -100,8 +100,6 @@ struct lpc18xx_pwm_chip {
 	u64 max_period_ns;
 	unsigned int period_event;
 	unsigned long event_map;
-	struct mutex res_lock;
-	struct mutex period_lock;
 	struct lpc18xx_pwm_data channeldata[LPC18XX_NUM_PWMS];
 };
 
@@ -129,8 +127,6 @@ static void lpc18xx_pwm_set_conflict_res(struct lpc18xx_pwm_chip *lpc18xx_pwm,
 {
 	u32 val;
 
-	mutex_lock(&lpc18xx_pwm->res_lock);
-
 	/*
 	 * Simultaneous set and clear may happen on an output, that is the case
 	 * when duty_ns == period_ns. LPC18xx SCT allows to set a conflict
@@ -140,8 +136,6 @@ static void lpc18xx_pwm_set_conflict_res(struct lpc18xx_pwm_chip *lpc18xx_pwm,
 	val &= ~LPC18XX_PWM_RES_MASK(pwm->hwpwm);
 	val |= LPC18XX_PWM_RES(pwm->hwpwm, action);
 	lpc18xx_pwm_writel(lpc18xx_pwm, LPC18XX_PWM_RES_BASE, val);
-
-	mutex_unlock(&lpc18xx_pwm->res_lock);
 }
 
 static void lpc18xx_pwm_config_period(struct pwm_chip *chip, u64 period_ns)
@@ -200,8 +194,6 @@ static int lpc18xx_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -ERANGE;
 	}
 
-	mutex_lock(&lpc18xx_pwm->period_lock);
-
 	requested_events = bitmap_weight(&lpc18xx_pwm->event_map,
 					 LPC18XX_PWM_EVENT_MAX);
 
@@ -214,7 +206,6 @@ static int lpc18xx_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	    lpc18xx_pwm->period_ns) {
 		dev_err(pwmchip_parent(chip), "conflicting period requested for PWM %u\n",
 			pwm->hwpwm);
-		mutex_unlock(&lpc18xx_pwm->period_lock);
 		return -EBUSY;
 	}
 
@@ -224,8 +215,6 @@ static int lpc18xx_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		lpc18xx_pwm_config_period(chip, period_ns);
 	}
 
-	mutex_unlock(&lpc18xx_pwm->period_lock);
-
 	lpc18xx_pwm_config_duty(chip, pwm, duty_ns);
 
 	return 0;
@@ -377,9 +366,6 @@ static int lpc18xx_pwm_probe(struct platform_device *pdev)
 	if (lpc18xx_pwm->clk_rate > NSEC_PER_SEC)
 		return dev_err_probe(&pdev->dev, -EINVAL, "pwm clock to fast\n");
 
-	mutex_init(&lpc18xx_pwm->res_lock);
-	mutex_init(&lpc18xx_pwm->period_lock);
-
 	lpc18xx_pwm->max_period_ns =
 		mul_u64_u64_div_u64(NSEC_PER_SEC, LPC18XX_PWM_TIMER_MAX, lpc18xx_pwm->clk_rate);
 
-- 
2.49.0


