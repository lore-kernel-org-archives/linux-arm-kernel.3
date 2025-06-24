Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46534C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PG9blNa6kVNTC134BShE8Y6pI0rxNsm9+LpAXIfxx14=; b=w1BgwwPySuIOsjYHi1euvJWx4o
	QZVFAWfLxvyNZgR9BjpkOHZqj7fzRU6uIQ2aw1Mw8t/PEeJkD+J9R7ovueOMYKoiH6fxtAmpTfTag
	3YxRAEJiC1wHLIj2H+q2+PMPA8uUHFd8aRrJnXqeXWmCakuVnghK/ue7V2U1gm/9JJovvPNCHkDtw
	tQtF00K5IE79lT415UufPiHlk4AuBy+nyZ1VedWLbEHFdQ8iV5hbLxgeRGmCQ/AezNpcD7kSOLw2I
	5eu9Ej9dlvyD+uRimmmychaHGKyviuCcd/UGJX2c0F/5oZmfWTvsgfl/qwJk6fJ8XxqkyZ8m+7U04
	sz4nBDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9nT-00000006iZw-0KIt;
	Tue, 24 Jun 2025 19:59:11 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8Bx-00000006UYE-1nCg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:16:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso27433366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 11:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750788980; x=1751393780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PG9blNa6kVNTC134BShE8Y6pI0rxNsm9+LpAXIfxx14=;
        b=Cfj9eapUlmGMDfEn6m8wMfkYoWJ7qDGh2/xnG9wqhy0nB/7goSLhw5bnxFHRqg2omW
         Np0UYs1EEqZP0ER6GbFG4Oj7in10mI2xzKcUFF1VeR2sRwHInaa+dU96tfvjG40SzvPD
         974P5HlcqKr2avVfkyviyiSGWDROat1am5T5+vtPwlNDlkJk3fPPbqvB7v37WTrH4JXg
         VEFYkbOqiayjg93mZiWAWhnyttblPRK7KgExVrAYgGkmQC8Jrfdmb4NRZul3piSMR8/x
         sj37K49TcG2rSg+0Z5fQKf1J9TvM189Uu53mn/jLMUu1lwdgALz2s1I6MN25eiVuLDr3
         Hwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788980; x=1751393780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PG9blNa6kVNTC134BShE8Y6pI0rxNsm9+LpAXIfxx14=;
        b=r86JEx2vi5NWFu5yImaVQnG+gZ6gLRp39+Sr35Tw0UIUdTjdVdgv1sV3o1mip+G7hE
         9qTfOZF00GHrU2qN1cMlR4P6Eg/bmmY1teGVAFDZtEW0Kkpamog40DnBBsApdmfZsWxI
         Qonq5wMkBeda56T9GYVRplkHdO1RLNz+E1j47ekGk45sLcDS/qflHMxoCJltv1HBZ3zS
         UWrf61Yfn/KyCpTJ3gObM7mhSsmp/lBs8OYKvUoODIVjH4XWR4L4Lk+1/y+G7xfD4BSF
         +BRC+ecBha82yYwM3SO1dqZikxj6f0kdYuinDozSoiTXf5R0tevNNRAy0abYVr4PKM2Z
         AQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwdf85zY5gTYYY3uI02mYcLCI5WpFEJ05doFoy9fuqMf1mcKPx1kFYscIqZiK/Xvm4aTxuMIxvcoTH0Wwof1Re@lists.infradead.org
X-Gm-Message-State: AOJu0YzqbGLaHmtzJI2TZep+fCjpgWMjXJaWZZPB0QRj68qjflUDc8jw
	CgmskyYKoe2v3N6rWxH9Fn6n8cj0RUryNz0yRCzI2gGbhP9WkheRxIPD+1YzaQgrrko=
X-Gm-Gg: ASbGnct0sqPqqYhupkpMPrXst6lvrNibRDXj20Sov6q4+tD//tGUtqjbh997ChBdj9P
	pigx8EnqB7kaqxFJqgQzkFp/qGU0/RZ0OrolBcHVGngHH87dFEXIDti6onqSbk095jUS7e5M1C0
	2PAU8ZzW6rXmpG1Sj09XDxSDr4okkjX0pfbumvDD0tWoRsw42KoKb5Y/3YyhbwD7FbGAKpEtfuU
	W0bQn3bXPtvKs3Hp1IQVoTC0uKlV37dA4aGknOukcc5klNulk90Vf4JnOrJK9d/dt91RvfHAVue
	1/pfKi0RoMKbWG6LJ+9oqzAc9xuEEwWh50havhDFyiye8Jq5VkqyTLU43++gC/FHpAA=
X-Google-Smtp-Source: AGHT+IFrcG96JrZDUtRLLfUHSmdYd0QuGzkM6KDLSamcPOlWpMggWkcGLqmh1NvtxhozeDWm8e0BSQ==
X-Received: by 2002:a17:907:94cd:b0:ae0:6621:2f69 with SMTP id a640c23a62f3a-ae0a721d166mr499379066b.13.1750788979788;
        Tue, 24 Jun 2025 11:16:19 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae0b672e340sm69784166b.180.2025.06.24.11.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/8] pwm: atmel: Drop driver local locking
Date: Tue, 24 Jun 2025 20:15:37 +0200
Message-ID: <5ad3417aecd4dc6eca9699e21691e3725ea0bb87.1750788649.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Grm4/8ikiEolMT+F9vV5J2vuFqu3Jgr5rE/slbokM48=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWutOAGkz0Jb/AzI9tildXjKFjjA79bDy5p4vC CzZTbK5l7uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFrrTgAKCRCPgPtYfRL+ TsguB/9QgWDoULz9mbfbA/1g2HCUD116S2oSsL1dwLE9q6BDfeUFP6eIMPdLh5Q43Uvny0fGfcB 8aw4XkvugbwOEItlIf2COaayQ68HdsbBwgju4mLoLYKGDXkmVuyIwF2vCT1vVdl9fYhnbWdg4xO hjRsFFmGtDp/R8eHdcMsbFP4K9NdlvYDeuZUl9pScq3fWJn+mpBjb44hjsoAJYJ8QWI7Tzb8+7d xTXVpnmi0xUU8jgBwAARTw3tIPeE6DfFoWPWs9VkyZZr/8MUxx5+kSpkDYf4i6aoUXWL5MFREqH V9R/5PuC914L0oHn+lAPYnzwtczT38gmBV7Mu91T/Ry4JOrF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_111621_463473_F5B977AF 
X-CRM114-Status: GOOD (  13.32  )
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

The two functions making use of the lock are only called transitively from
.apply(). Calls to .apply() are already serialized by the pwm core so the
lock in the driver has no effect and can safely be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-atmel.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
index b2f0abbbad63..06d22d0f7b26 100644
--- a/drivers/pwm/pwm-atmel.c
+++ b/drivers/pwm/pwm-atmel.c
@@ -91,9 +91,6 @@ struct atmel_pwm_chip {
 	 * hardware.
 	 */
 	u32 update_pending;
-
-	/* Protects .update_pending */
-	spinlock_t lock;
 };
 
 static inline struct atmel_pwm_chip *to_atmel_pwm_chip(struct pwm_chip *chip)
@@ -145,8 +142,6 @@ static void atmel_pwm_update_pending(struct atmel_pwm_chip *chip)
 
 static void atmel_pwm_set_pending(struct atmel_pwm_chip *chip, unsigned int ch)
 {
-	spin_lock(&chip->lock);
-
 	/*
 	 * Clear pending flags in hardware because otherwise there might still
 	 * be a stale flag in ISR.
@@ -154,16 +149,12 @@ static void atmel_pwm_set_pending(struct atmel_pwm_chip *chip, unsigned int ch)
 	atmel_pwm_update_pending(chip);
 
 	chip->update_pending |= (1 << ch);
-
-	spin_unlock(&chip->lock);
 }
 
 static int atmel_pwm_test_pending(struct atmel_pwm_chip *chip, unsigned int ch)
 {
 	int ret = 0;
 
-	spin_lock(&chip->lock);
-
 	if (chip->update_pending & (1 << ch)) {
 		atmel_pwm_update_pending(chip);
 
@@ -171,8 +162,6 @@ static int atmel_pwm_test_pending(struct atmel_pwm_chip *chip, unsigned int ch)
 			ret = 1;
 	}
 
-	spin_unlock(&chip->lock);
-
 	return ret;
 }
 
@@ -509,7 +498,6 @@ static int atmel_pwm_probe(struct platform_device *pdev)
 	atmel_pwm->data = of_device_get_match_data(&pdev->dev);
 
 	atmel_pwm->update_pending = 0;
-	spin_lock_init(&atmel_pwm->lock);
 
 	atmel_pwm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(atmel_pwm->base))
-- 
2.49.0


