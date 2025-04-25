Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE74DC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=; b=Jxm2w2rv8JHopZ/EVYUi1aARSD
	s0qLVsrLT+BqhrlE9VaxmD2I8y3jQuUfWf4bftlJOAbO5hEPH1TIVoNGYdER7RCgtVccL088JAT1Y
	+Dupufbve3k3xelTcpB1g6ZaTWzf+dFJ0ioO1oWqXGC3I063q1s/NqG28vCr9gBHPWuUvXWxdfhn8
	0oHLjQBXZ4mFCYOJ66FwAPdSDZIOQ607AogycOG5U+evsfc6GMf0T0CEMPGbJoD5ovL1ObA6MIEE/
	nE3M1In6FibC3nfOKPrmMC4BJ8LB880jfPS9eeIarAZhhMLUeyzcvvLe/5YmhBDrhPlZdeDrnPMmx
	6w4DsXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fxm-0000000Gew5-2kFV;
	Fri, 25 Apr 2025 10:07:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Evp-0000000GSaQ-46s0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:01:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso1258073f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571672; x=1746176472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=;
        b=3Y82qCAPZakY3IW9ie7EC6NkpHsj3oT2+KRVfFNh/AwaAE6MOyTZ85FfJx3C1SHnqg
         n3P071+H5xrPaW/Vtpg2lFLaoXvHXIsirM3HQ2dKzbsgiFMY9G62tvWym1fful91hXwP
         Hgooc/qW4m2Aqvxhf+X0MJ445H9T65NEZKbPfgYo9RU6q1BR3YJJV1vo0+2j8MpVyCXd
         HAOSQHNPxQk9dItqYzsFAnxJagmU2yQvQVVvZ8tkoDygqI4P39n4oEkSjzoZvUWRuzHT
         E6xyO/gsgYdZP/Cfqcur2LAOGgmc2N/u53/Nj6CScaaq6nx6GKkWlLPbvgJ6vP2r8u+/
         bw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571672; x=1746176472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=;
        b=a4GyA8EO7noml3flkl3Vx4W1+LoaktV8jIFonTWXMuCDVbcavwWxPtyYdFPW9wboi4
         845e3ixd5r2P+TSPfrvEHGPnz2Sus2AvOzsLHWOddNIyM4vaObew5Y6i2TGJAL2qRbWm
         IcqSJVSm6/lzuWNgSMwatmJ1fetX0iPrBiZ0jTnz9FSBSolX/SBhoOZjonCjxvk91Msm
         p3juzAL7AGnRy+gJxaHZLv6G3rHvEaRL1hRe4Yk7mORld54LsofOEUs5ob+2KKfl+HUI
         HI4+guqw1thNWJql18WPy3YPuGxutGAYAkvSbfzPH2p9yJi1YQfTwKiYdgKISynwiQ9B
         50EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYFlNfNOmksh3CDDpRMk6rUBfPH4w7OAGuPhTE/FZCoDaeoUHeLRxxIVYA6KA61r78Uu4L18fkTi3jmEe9UB+6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6sMVNNrxPxpjK4rS7njXgz5A9coKWSaysvRX1kr48YlTvq3g1
	KZF8gh023kunZf+0fAZ+3zP9ymqyE88L+IcwwH5LQg9LJZI4uAbWDQA1NON32EY=
X-Gm-Gg: ASbGnctty0jD2+aDozcdIoRzXQimoMatOxVD2IRtcfsHAm0Lb5exnSCrqdx7JD1Za9s
	asY8E2L5L4yAxZEt9iv2DeTrlcRE1vRUjVi3Q3ywjpVcM/e/DuKcic9LurkhI0cUKzV8MMNv3c/
	qaW/roM2PPtDcL/vlb8geaXswSNKZS3iHL6Jt2yPz4Nw0Fr2ZhMBu/GH0+GK9/hmtDvhGXpTDs/
	sgOb38XGnHynzJ6IW99+e+ctpH7XA4kvlYFiJ4rA4cLAueTauPOm/d74LVaaH5SVDIwBjYmDG91
	WQPu0wwhVu7GM80X3cZu9Dh8lIYTmXDOdg==
X-Google-Smtp-Source: AGHT+IESAKBg/vUZr7+HdyTu7Zt6c8/2gvrqKe9AqCVjAbPvKvH7CRuaevUBHKKYT49ezlwSd/p7oQ==
X-Received: by 2002:a05:6000:290b:b0:39e:cbd2:9211 with SMTP id ffacd0b85a97d-3a074faf2f4mr1109587f8f.55.1745571672261;
        Fri, 25 Apr 2025 02:01:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:01:01 +0200
Subject: [PATCH 5/5] pinctrl: mediatek: common: use new GPIO line value
 setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-5-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DhR5Cx+h0tuPThTQMfkVBP7GDMglNgqo3TCYghOZtTc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Q1qfvXLmie8Ad0KxRLSMtwSzORIC9DHLME
 ux5GcRSG1uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 cin/D/wN4TReNcVZdJpBQ3ij4ORtqXCjpIzT8TejLJmPbAW7VRLBI73Sot2lYEh6ivMjaPGV+Ez
 ff8t2p6qHWL0XyeySWLjPm6Sa+nVqRjbyFGUOty8iQicWy3VgU0h6OZYaOlbXE3HSchUFE7AuvP
 l/20EdnceslbHDVHXe3uDbsWvxyZn5zCj0Kq78XggHgGsprpI2qVyAFDUBbwaWh+1+myh7YJx/X
 yJvdjTBEdvqoMiqeuJaYhx/t/paIekWXTGSEKqVdHPp1hzb6KRCrycp6u6jzsZvnNsrMKcXHxb8
 9/3Gc6GRcWE7CxSmBqB9B0mJTdhSHRZa3YIRQTpeMxWjxGa30VQ7vMJvHygVdwcFOueRtPlcXZz
 gU7YuuI7Ug885r7Xoodq798CBFf2KN6mjY699nAmfRjbxVv+FxH1WyP0WBmENEtDQ8VHxfPJbgP
 WWvfpj0aKZTuEMTvbguqYDv8tC6fjQApPkWtivimKfsAvwjsxNqFKKgcWTlaNMCai5ye1+WNLlF
 o2XVBinR1y8178arKTT0Sa1lWO97DQwu63sYqqlePtrT+KmXA6ixprYXzYR5iBLI0RZGMNF10bP
 T1xXXdlDIe8hx3XfKDVXoo/cUL60hAqfNjdG3/Z8zF7bbaR3dzsYYEOsDCOqiO/bRA3AGSM9R8D
 Y/dstQRT5IQGDZA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020114_036159_F0A55DD7 
X-CRM114-Status: GOOD (  13.39  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 8596f3541265..de7bebb9a6cd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -86,7 +86,7 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	unsigned int reg_addr;
 	unsigned int bit;
@@ -100,7 +100,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		reg_addr = CLR_ADDR(reg_addr, pctl);
 
-	regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
+	return regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
 }
 
 static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
@@ -809,7 +809,12 @@ static const struct pinmux_ops mtk_pmx_ops = {
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
-	mtk_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -893,7 +898,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
-	.set			= mtk_gpio_set,
+	.set_rv			= mtk_gpio_set,
 	.to_irq			= mtk_gpio_to_irq,
 	.set_config		= mtk_gpio_set_config,
 };

-- 
2.45.2


