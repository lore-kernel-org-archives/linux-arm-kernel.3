Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1F3E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q42RlzBJ7KqBAuqUYePY8IHU3p8Lx6u0Ba/+7jjyPE8=; b=x0BE/L2fyVOTRTC9uJGgcyHNEV
	Oxr3ADrlhBEns43aTQgfZfNwSY8YE8Q/9/fiOpQNWcBwSLKYPeH3KALOwDvkJJv3XDT0JRd5bfA8B
	rXV4RwsL1GaF48wa1RKOdRItY7hD6Lp1E3420M7x13mYBiE5xjvKDIoU1fTut4Am3JOWX9QFtxnTj
	ghPl2chETHrvr93RtSv1Rj1NBV6/bNRy3//UgFXgRBdq9NE1H80K81nhkdE39T76ImLCcQbP22IDf
	uP+5uyVDTyB+/q23flwltIzoa28JgbQmOvEE207YsGH906HrTY4nWN9tbvkkcatm3s6XHH1P6g3aB
	2CuNJwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgaJ-00000002sAZ-3PFR;
	Fri, 06 Dec 2024 22:14:03 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgZI-00000002rvU-0eEh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:13:01 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6d8878ec049so18776256d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 14:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733523179; x=1734127979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q42RlzBJ7KqBAuqUYePY8IHU3p8Lx6u0Ba/+7jjyPE8=;
        b=EmBrmi9W5z4Zx7VLvH/OTbQFvGoMeKRo4aMK1zjIHNGUAr4MCkDDL6TycGPs3+/u11
         qynsAoKViLiUfwkGbxDSnL7QkB+XuZSU/E7T8/6HX6saHmNZRp6sh46G4BwbK65spPHi
         UZcAnfgBdmi8OvAWgOlc+vSZ1Mx+n9Hmve5SN3aKUxkwi7Wpj68dK78qNDjn99WYeOP5
         bgk/oAZzMBYZ1rIPuBPPflyuOHpJ+J/pfhK6XGwjdCZmfhYsBYz0h8yTNMWXwSU4p9s4
         Pki9Hlttq5jJiejS2WJq+mSvgRKn9s3rqQ33sqodhjwAxTPaaTgK7irDNS+O91EDLf1z
         VuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733523179; x=1734127979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q42RlzBJ7KqBAuqUYePY8IHU3p8Lx6u0Ba/+7jjyPE8=;
        b=Rq53UwKnQ1C0ZFXmXMs0TeEo0H1t+lmuIjxOG0v+BAFYDD4ccca3gXPZ4d7qFXsMrh
         Xglxz85W22rWAvII/8XrdWAd7w4nXtj02ualfwX7N/WSW0mPSf9PVCTE7JyTS/4UWQgE
         VWaK4aVMgpkOu1aY/oxDGfAjiv4ED0/jpYaKUNdSHDvVGBCRUEghg8TeSiRh2l+if//x
         t3fIti/hyBch3wgEGfyipPCFKsZ8JjlujCwr2AA/kp8J4uXBQ11t20VeA2rS3aY/sLPp
         +AGUJOEPosikX+0NHH7A+phdt1s6hEGBu3xpZJ3Eh812pdh+IBnmGgrIjnXwim5ilmrz
         4SFg==
X-Gm-Message-State: AOJu0Yxq9IrgEEVAAWwS/NTiCYMYv0goricKEzY/hCXpH9RZz8iLvnw3
	ML2ixdCdMmEqW8vhakj0xTTfSJmkn2ToCkCxktW7GdVeTa/CeOcX
X-Gm-Gg: ASbGncsbKTCcyPlA2gnOs0TP1FWDNoOexbkl85FUp4VJNJFgAQdajx2GhMIrMhVB/cL
	QvazYjp2NWEPNs0Yfcq795XrR43pSoVoYWIrGimKdaDAfraZw4/Ck2zb+uJXxV4cqb5GESAs2Z4
	vgDldXkd7kDr/5xqfdKGj7+Ujy7ELeeJnT4TameECb1gdKxMfn2w4OWSbDghdG9gBYFYFTvHFpE
	zHmf4VjlqAzKFVTNxfs3qcH5ircmhDSdfuzegkOuPtf7jc5jyZdjiC0XKDR3A==
X-Google-Smtp-Source: AGHT+IFQFkzHlBJRc6UEiHKJ4eYO1c21bJ9G3NUU01WnmUgcxL08A7K6w/BdnqegWiG6jNv0dFMTIw==
X-Received: by 2002:a05:6214:29e7:b0:6d8:9c92:6555 with SMTP id 6a1803df08f44-6d8e71675ecmr53676936d6.29.1733523178756;
        Fri, 06 Dec 2024 14:12:58 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fd1f2sm23607676d6.81.2024.12.06.14.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 14:12:58 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2] pinctrl: nomadik: Add check for clk_enable()
Date: Fri,  6 Dec 2024 17:16:18 -0500
Message-Id: <20241206221618.3453159-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_141300_189509_5ABB3953 
X-CRM114-Status: GOOD (  17.37  )
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
error.
Disable success clks in the error handling.
Change return type of nmk_gpio_glitch_slpm_init casade.

Fixes: 3a19805920f1 ("pinctrl: nomadik: move all Nomadik drivers to subdir")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Add clk_disable in error handling.
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 35 ++++++++++++++++++-----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f4f10c60c1d2..4261541928e9 100644
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
+	int i, j, ret;
 
 	for (i = 0; i < NMK_MAX_BANKS; i++) {
 		struct nmk_gpio_chip *chip = nmk_gpio_chips[i];
@@ -449,11 +449,21 @@ static void nmk_gpio_glitch_slpm_init(unsigned int *slpm)
 		if (!chip)
 			break;
 
-		clk_enable(chip->clk);
+		ret = clk_enable(chip->clk);
+		if (ret) {
+			for (j = 0; j < i; j++) {
+				chip = nmk_gpio_chips[j];
+				clk_disable(chip->clk);
+			}
 
+			return ret;
+		}
+
 		slpm[i] = readl(chip->addr + NMK_GPIO_SLPC);
 		writel(temp, chip->addr + NMK_GPIO_SLPC);
 	}
+
+	return 0;
 }
 
 static void nmk_gpio_glitch_slpm_restore(unsigned int *slpm)
@@ -923,7 +933,9 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
 
 			slpm[nmk_chip->bank] &= ~BIT(bit);
 		}
-		nmk_gpio_glitch_slpm_init(slpm);
+		ret = nmk_gpio_glitch_slpm_init(slpm);
+		if (ret)
+			goto out_pre_slpm_init;
 	}
 
 	for (i = 0; i < g->grp.npins; i++) {
@@ -940,7 +952,10 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
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
@@ -988,6 +1003,7 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
 	unsigned int bit;
+	int ret;
 
 	if (!range) {
 		dev_err(npct->dev, "invalid range\n");
@@ -1004,7 +1020,9 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	find_nmk_gpio_from_pin(pin, &bit);
 
-	clk_enable(nmk_chip->clk);
+	ret = clk_enable(nmk_chip->clk);
+	if (ret)
+		return ret;
 	/* There is no glitch when converting any pin to GPIO */
 	__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
 	clk_disable(nmk_chip->clk);
@@ -1058,6 +1076,7 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned long cfg;
 	int pull, slpm, output, val, i;
 	bool lowemi, gpiomode, sleep;
+	int ret;
 
 	nmk_chip = find_nmk_gpio_from_pin(pin, &bit);
 	if (!nmk_chip) {
@@ -1116,7 +1135,9 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
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


