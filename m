Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F36C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpryYjr6dJZUJcBNCU3DY41Q8g7jIiX7s0MfCXnX/8U=; b=z9u/e/2b30YDTkbmalYVs7vyji
	L7qRkw9JhmKm0+fP6BmKx5BEvt0ckn468RMvYfD7MUndRhhXZRal+PcJX4N2Ed8qBNc1O71e6ZeEQ
	hOSrlb2d2VFcdV3XV4g6qjLWu56HD8eRvpuXz02tvOaKGp76wLsMKjXLixYlY4WRp1PwCUlhlABSh
	d77M152LltTRyauH+6O1nLTYO1jIX3G8KGTBw4qZhk7pK+JI3IDDisbneJcBKgFuAYGO2FeYifozW
	+zSENrstOrmk6vPH2gaayxsUfJAmBQ7HwaMRRk4gDbN0+dI1AFPYIjCisBAUeVUqlJzgkUHP8IDFC
	qfquch8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnA-0000000EE2x-1ywQ;
	Thu, 12 Jun 2025 19:40:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmD-0000000DLj0-2ofh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-451d3f72391so12369825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734128; x=1750338928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpryYjr6dJZUJcBNCU3DY41Q8g7jIiX7s0MfCXnX/8U=;
        b=NjteY8DKveLOa3vp3l3sXJHsaPiHu+ajrxBuItSM5x6NsX1E1T6B9zAkYhCfKpwI+f
         4QWxZdAvMhleR48N+nRmsMU7Mb4emkfvtjOtHQ1rrwwSKsl7OT1TENFSdTuFXdII0D3k
         RxJWeAsDkQh79M+qGgEpPcNTIakp19vTnptHwzplExb/a5HlpBwQgEruFEOMJp9Cjh8k
         XSofmWBc4ooClv+15bbVSSJvM0XUc6xKxGRBewSt0Jdwh9UKcyAnExaC0RMnvTCUvhw7
         kJCyg3oLl7bly/sMoyQ7lhd2uRFudIhI5DCwUv9ew+9wyYLSy60BPIcasczcyoJFsYsQ
         NY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734128; x=1750338928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpryYjr6dJZUJcBNCU3DY41Q8g7jIiX7s0MfCXnX/8U=;
        b=MtkHBvlGH0CKkUgYkwgcED16654JXLzMr4eLXkZ2oxBpqYJtYDpQh8TOGGWl7jkfML
         8PcORixITVpYGuaql00mFboHVPE+jW6KWF8H5SMdawnjFsUII3syxeYIhUkjBPe+5Imi
         JpRkFwNArt2CbSpt/aFr1lUJXCEIHnMXgUPqTsKJw/Cxh8AhFbWaYNhDpyvKMCVy3neG
         tRsv+utOyqw/ME5pnAFWhPPh4bTzr1MMrCAWukFLY4xU40pn2B9HqmsLHtFEBjBKIC+2
         0uNr92HGRXzUW9MECc8so+xZJzzByBaXkXzsKVyaebig7DvVqPV02I8Pu3anzbsWwO8a
         jA0A==
X-Gm-Message-State: AOJu0YzX65Qm9HPmSSJ3/8rEuJgjqL7ZONcju8PnCLSSaKnUjrmBoWe5
	ziQDGofuHwGTo1yqYwPzwRptargnD9i8FmfOLVs9rAEhwZ+ihlLLZ2cuOvNyeyca5CE=
X-Gm-Gg: ASbGnctAP6hNsXeFb+gP9GaY3kWuKq2jFNDUH4J21/TahAIw/xwpoBe0sUOs1+TA9bZ
	lk5FFYqIlsJ8cOOsD7t5W9yd64QpxhsrW4joKe9B1Ech56tUr9Gae/trUv5gCa+TL7cB7yLbj9x
	PUPv0kxBsHo6oBmm7pbyVK9xXj05sR4TURLhP4D/Z6+9XRso+IhaVhUqdVDlpZCZooEPjM9ZWsD
	oHJ4UnBX8/t5A0bMwmO9lTXb8+dRFy0Ngjg47aMUiKSOoCffJ+K2q0haJvqOD/Xq1FWvqvrKQUd
	bxCYjnqwL+9+YjUShu56Y2yBsp6Q7XO9aeF5tTvHoG8bzMeHMZXhzGG/rG56zOG77A==
X-Google-Smtp-Source: AGHT+IHYhHp/jvxkulDT8caAK3JFprrXp6WBLQybVLzjI96KoA3fZGyckOWajuSkl9W+4oQhpYhEmw==
X-Received: by 2002:a05:600c:5291:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-4532b966af9mr29139925e9.25.1749734128225;
        Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:15 +0200
Subject: [PATCH 06/16] pinctrl: aw9523: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-6-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/k8zafhiaZ5lNZ/R4/TDowhHogmpS6F04NS8uK5axS4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLlAWn+gixCdfC0imr4N4CjdzgtOVQSb/c3U
 huOoAJ6Hj2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 crzhD/0T0e3xmRZAZFh9L727loONGDCc4JHCYoraLqm9oW7X2GMp5bsZjgzR9lIpJTcS2lz2/50
 7K1JpLe+3IV/JM3Jsuje0k5O9ZSzUrg7tWjzcR5APoxHEJVxL+esq136rwbVMiMUqJdB68n9Ohb
 2as5Wk1vASZi13ROmULzSgpb3+uiQaAGkDcpL1ieFstxBzDZS34ojSuMUj2pzkeZpu4qSMsmpV+
 j6o1OXBEOa7XzItsZ+wdhDVDjo74LIH6w+7ZetDer8IKdulsgwMsiIpL90cW0p0COp7+nXuI6kh
 32Yb8Zw49Z6wxkQQpps9iwDAsqLk3Q/V0EOnKLPvJPtJAG5pc7lojKUwGfj1X9EFl+Q8VlEiCTE
 7Llv1zB9G9hNDtLE9U2hT7toep6c0798QQ3teRYgyLVERdkGjpLfL5kdV1GnnUYUmavpJaXikA7
 wfngkE49CVSCKrsvtodJj3jyvNergEk5cGDqKSa/m3yHljlRrQoDndSM/+WnK8r3LToblbH8Jep
 xs0ev/kWXAJHtnIhiwALmT2dtnHVAVV2m1aqDyabjB+ozDZ8lYW1USpwg/rezqcCY/d3pLF33qp
 Ely+uT5GKTkEsTBk4pIujiVaFHqyLFnGLWFBMvPVxOEDVK0Grf+UJ3FowqoNFYx6FUGLwXpfdlX
 6Hw3h2VYdTU5O1Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061529_721715_E1F89D35 
X-CRM114-Status: GOOD (  12.62  )
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
 drivers/pinctrl/pinctrl-aw9523.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 9bf53de20be874661168ba28f64517b4325ce0c3..c844540384198f40f1142528d815fb6e4d5194b7 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -625,14 +625,14 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 	return ret;
 }
 
-static void aw9523_gpio_set_multiple(struct gpio_chip *chip,
+static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
 				    unsigned long *mask,
 				    unsigned long *bits)
 {
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 mask_lo, mask_hi, bits_lo, bits_hi;
 	unsigned int reg;
-	int ret;
+	int ret = 0;
 
 	mask_lo = *mask;
 	mask_hi = *mask >> 8;
@@ -644,27 +644,33 @@ static void aw9523_gpio_set_multiple(struct gpio_chip *chip,
 		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
 		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
 		if (ret)
-			dev_warn(awi->dev, "Cannot write port1 out level\n");
+			goto out;
 	}
 	if (mask_lo) {
 		reg = AW9523_REG_OUT_STATE(0);
 		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
 		if (ret)
-			dev_warn(awi->dev, "Cannot write port0 out level\n");
+			goto out;
 	}
 	mutex_unlock(&awi->i2c_lock);
+
+out:
+	return ret;
 }
 
-static void aw9523_gpio_set(struct gpio_chip *chip,
-			    unsigned int offset, int value)
+static int aw9523_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 regbit = offset % AW9523_PINS_PER_PORT;
+	int ret;
 
 	mutex_lock(&awi->i2c_lock);
-	regmap_update_bits(awi->regmap, AW9523_REG_OUT_STATE(offset),
-			   BIT(regbit), value ? BIT(regbit) : 0);
+	ret = regmap_update_bits(awi->regmap, AW9523_REG_OUT_STATE(offset),
+				 BIT(regbit), value ? BIT(regbit) : 0);
 	mutex_unlock(&awi->i2c_lock);
+
+	return ret;
 }
 
 
@@ -779,8 +785,8 @@ static int aw9523_init_gpiochip(struct aw9523 *awi, unsigned int npins)
 	gc->direction_output = aw9523_direction_output;
 	gc->get = aw9523_gpio_get;
 	gc->get_multiple = aw9523_gpio_get_multiple;
-	gc->set = aw9523_gpio_set;
-	gc->set_multiple = aw9523_gpio_set_multiple;
+	gc->set_rv = aw9523_gpio_set;
+	gc->set_multiple_rv = aw9523_gpio_set_multiple;
 	gc->set_config = gpiochip_generic_config;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;

-- 
2.48.1


