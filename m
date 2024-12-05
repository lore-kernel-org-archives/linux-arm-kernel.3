Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD6CE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 04:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fIsW9ZbBJH35/ofhXRoLLDoPk7qr9yyhaAH28xywAJs=; b=cxyc5nMwahIBDuwnYWdtLWGvbn
	4LydJuTSGZGI49W0mqm5MwylVKuN8C29Y72sTi4qAKzf7rpZ2y0s6MrxHt7h8Dp/v+vgZxsysQt6U
	WvkWFa+Y8yzINuiy0uCopzau8OLTRiH7OyQ9wYNVWOpiWAWbsYO2qWFUl8BJ22VGzdr1EbN4D8pmp
	13VcFsyM1BVPw3bq9g/3vfNPWl1gU4MK1NwXoasDD0jhC5D8tj/GEaz+jMLOupohMm7IjP1iAO7ho
	KNyvdoDubhdU43wnxkFeb4LctVqezaPkTZD0yp6aT/0J+z7qrJWUsT9hqvt7F9iwaMsseQZ1NZz7M
	EdgRhizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3LY-0000000Ej4f-1iJn;
	Thu, 05 Dec 2024 04:20:12 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3KX-0000000Eiyc-2UMW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 04:19:10 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7b66ea49407so49816385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 20:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733372348; x=1733977148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIsW9ZbBJH35/ofhXRoLLDoPk7qr9yyhaAH28xywAJs=;
        b=ORoNQ8thhHEZTMaueKCvdzdZUANkQc9LiHdRzT9L4jj+5wrSEqzRQHGpZUB/oHaN0h
         vYoyNfaFzlIxd2yeWp6sBavtLfkcfjYUCGjYgWEbGzNbPd1x2mEt9KUMaQ+bfNaH2T1P
         8Z6pt+hVHaOvubW4gs9y31X+aviYOINwRKmlwsmk/pl4ZdlnxN7XrqImvGhOCGxQSa5h
         jD7eYYRt1Es8/wpR3bDk1coBJXWx3yXWbj8xKk6WyOsmWZMsX84vCvZy3tNA59+s2DJq
         SD1SZZGB427bNkknVi3ntf/lIyzTrHyTkCqL65OC8/9jJfJgV/RAGZK49i92Pht62OXc
         jpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733372348; x=1733977148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIsW9ZbBJH35/ofhXRoLLDoPk7qr9yyhaAH28xywAJs=;
        b=L1PyH+IThbo1hhPBZ26l3xhVB+3ndw/Mbplku+FMw5+jk5QMJTYz95kUGm582qvytK
         rcntRvqJMxSa4a2MpyjgDSDNUH6m5+8yt9/Oq1xBlp9O7DNd1ITdr+cETNADoXsdbc1s
         5zj9yhwERng20BzIRZE2XxihG3Ks2CiwHm0Dh/wIHp4Woe0c3b9oSSJI2VvQOWZwHeNY
         Bd6cq87CnGmFonr1aC6fisZzMwt5fFU0vDtmwvWFrsg4THekslNEgmWrqfnkk5RQoeSO
         XF8fjm52CxOUl2pmjVjG1ohy78bi6nV7JrGmWQy7fmgPLcgO2OHcCETkD7PQYodcc+TI
         BCxg==
X-Gm-Message-State: AOJu0YzGo/ACPRWJ34TaMGetFj8idbsW7MRJoVjX5Tgw71fn0PR08QXc
	IGC81qOKxhLIaR5/Bgy2EQyoLsQIuhuRHYwNCevcfNV6QS3yW45v
X-Gm-Gg: ASbGncuM5d9KUlj1etkhrzxkP9AxN7Br572ZlXECXVYKYNmwdqaduc+0XsTk4n4smhv
	HSO2L/sLz/sQqfuenY5wwXrMpevAzE0kkJro3B8SAFXpNe1DGUWE6LwSvd5itkmOOaL1arm2wLK
	/eWIXPkZtqK84vOKlCo992++wG3f5mkogCh1DpKwjcLdK7/NFyIxrwblm4yS3vp21Ldi43n8aQN
	TdaiVFLMAtP493moBF5CU/LxdI2zxcPYNEbW7wlACg86txqhIwY/8yz+7FJXw==
X-Google-Smtp-Source: AGHT+IGb15BU9VZuTfcCc0Kt4sxDfpy9Ekjg2I7uCZCEK0h+QJBSNLMKU3cxm4nqE2b2Ha98hRfcsg==
X-Received: by 2002:a05:620a:488e:b0:7b6:6fb4:2967 with SMTP id af79cd13be357-7b6b4188fdemr333159985a.10.1733372347741;
        Wed, 04 Dec 2024 20:19:07 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a5c2e6sm26301585a.42.2024.12.04.20.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:19:07 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] pinctrl: nomadik: Add check for clk_enable()
Date: Wed,  4 Dec 2024 23:22:14 -0500
Message-Id: <20241205042214.2410982-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_201909_632751_F7606A34 
X-CRM114-Status: GOOD (  16.94  )
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

Add check for the return value of clk_enable() to catch the potential
error. Change return type of nmk_gpio_glitch_slpm_init casade.

Fixes: 3a19805920f1 ("pinctrl: nomadik: move all Nomadik drivers to subdir")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 29 +++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f4f10c60c1d2..2207c9513afd 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -438,9 +438,9 @@ static void nmk_prcm_altcx_set_mode(struct nmk_pinctrl *npct,
  *  - Any spurious wake up event during switch sequence to be ignored and
  *    cleared
  */
-static void nmk_gpio_glitch_slpm_init(unsigned int *slpm)
+static int nmk_gpio_glitch_slpm_init(unsigned int *slpm)
 {
-	int i;
+	int i, ret;
 
 	for (i = 0; i < NMK_MAX_BANKS; i++) {
 		struct nmk_gpio_chip *chip = nmk_gpio_chips[i];
@@ -449,11 +449,15 @@ static void nmk_gpio_glitch_slpm_init(unsigned int *slpm)
 		if (!chip)
 			break;
 
-		clk_enable(chip->clk);
+		ret = clk_enable(chip->clk);
+		if (ret)
+			return ret;
 
 		slpm[i] = readl(chip->addr + NMK_GPIO_SLPC);
 		writel(temp, chip->addr + NMK_GPIO_SLPC);
 	}
+
+	return 0;
 }
 
 static void nmk_gpio_glitch_slpm_restore(unsigned int *slpm)
@@ -923,7 +927,9 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
 
 			slpm[nmk_chip->bank] &= ~BIT(bit);
 		}
-		nmk_gpio_glitch_slpm_init(slpm);
+		ret = nmk_gpio_glitch_slpm_init(slpm);
+		if (ret)
+			goto out_pre_slpm_init;
 	}
 
 	for (i = 0; i < g->grp.npins; i++) {
@@ -940,7 +946,10 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
 		dev_dbg(npct->dev, "setting pin %d to altsetting %d\n",
 			g->grp.pins[i], g->altsetting);
 
-		clk_enable(nmk_chip->clk);
+		ret = clk_enable(nmk_chip->clk);
+		if (ret)
+			goto out_glitch;
+
 		/*
 		 * If the pin is switching to altfunc, and there was an
 		 * interrupt installed on it which has been lazy disabled,
@@ -988,6 +997,7 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
 	unsigned int bit;
+	int ret;
 
 	if (!range) {
 		dev_err(npct->dev, "invalid range\n");
@@ -1004,7 +1014,9 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	find_nmk_gpio_from_pin(pin, &bit);
 
-	clk_enable(nmk_chip->clk);
+	ret = clk_enable(nmk_chip->clk);
+	if (ret)
+		return ret;
 	/* There is no glitch when converting any pin to GPIO */
 	__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
 	clk_disable(nmk_chip->clk);
@@ -1058,6 +1070,7 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned long cfg;
 	int pull, slpm, output, val, i;
 	bool lowemi, gpiomode, sleep;
+	int ret;
 
 	nmk_chip = find_nmk_gpio_from_pin(pin, &bit);
 	if (!nmk_chip) {
@@ -1116,7 +1129,9 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			output ? (val ? "high" : "low") : "",
 			lowemi ? "on" : "off");
 
-		clk_enable(nmk_chip->clk);
+		ret = clk_enable(nmk_chip->clk);
+		if (ret)
+			return ret;
 		if (gpiomode)
 			/* No glitch when going to GPIO mode */
 			__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
-- 
2.34.1


