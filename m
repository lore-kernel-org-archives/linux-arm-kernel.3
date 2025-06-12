Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBA9C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=; b=5AR4tXM8beIvsglmK/9/JAGnRB
	cnyXjokXEC9lkX3WqRJGuxMF6maVtwEnWqbOHOP/Nr8eIJCmvbplJxIa2G5gMljh181Oag4QA/W2r
	c87OvTVOhx2+nEIQRkmL+4xtV8wJtPiqNZtRbjaWF06XiV7hYU+nJ8bdYjZP83wwN8/GgVvIA4iqU
	1LWgrjqK4DeJgYkH/vTWq5KFWtorBXsD/o6NB8KmXJIa6Gw8DH8J4CgSR2vlPczYbzNBIf97RDrmy
	V5GQ6iiNzYgsQoONeJin56JPDG9tNwldD1pG47h6kAQZaJFynaqcxlQ957ewR/9i31xaxKCi9VP6s
	PhtsKe5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnn9-0000000EE1M-2UrP;
	Thu, 12 Jun 2025 19:40:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmC-0000000DLie-29Gv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45024721cbdso7993045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734127; x=1750338927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=LU3YSaSsaLsYKqd3+YIWvrthcyVSDmia0yDsz+cmzXsGpWLSsR/iNQRZJhg9YgU0iL
         w84F8fhGscewc2u9HjEnbrybPiTfGhSFjOjZr9rmXQJPtf0nxDnT+ohKsSWFYzdJpn6L
         mQac4jhwctzFFGFn82p43wxIjkEhScRe2Z2ODHssiYRvjPDLqyLvp/9qlFlGubrNjMsc
         A66y9X9+NHBDWofOUXXck1rIQDoewXCkXbsZKpliq7E71u6KsmKFm9gm4/eSX3FjCl8r
         LKlGJcU2TO+SCM6v07V0l8+u4Eaav1Jq+zOo/1O15kVNj11JBbSYS891zfUNUz10iVMw
         pbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734127; x=1750338927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=mGCZcS24kbz3pCsFt/mgPSmpIVQ4doGa9PDFyPXZ/hJ+iQvrBwhEkeKN1tn6kBgf8J
         sGdNp595OXIC5B42WHxGziJJPDLfnh+6Yd6l+yGqwYSjihn6fvOax3Kqo1wwMSxH2xa2
         U1ufKtesBzPlbRATr5wTnfdn7uAEjytCiWG41TVZNzzc0yG2E+MNojanez3WSimJXJjp
         JizOWroYEJ7O1YZTWbSCigKwh2vPb/hEwrEKa9BMrSpvnhWoIxVJ7GcAvP7rhwcg6Bq9
         m8mLmAztkgRPrTr1Svag5vbS/+t0g8x40bEAyHYGftENEhzBIidlD3DG25ijmkmGBlxz
         nVUQ==
X-Gm-Message-State: AOJu0YypDmvvQ9RUhk5j3HZF549sEBqS9ByCDw/P4gWNYV60lYdr1Bn/
	fFu6DYGKuDMRC7+Ff7rfFDcvMMfMSghObbsW3zzOWt7/nGg3dIxWIx9ZbKiNXL7wdCZvqHzAabX
	FiGbopsM=
X-Gm-Gg: ASbGncuq5utZOgFdwdYl8X7Hn1FVJ7I+j77S9frUmwqtoiZNLUGbLel95JVNJ/Dt/pI
	F2v6ovZrz1TdurXOZMq7ETYnsAPjc9rPb3LoxnXaJm8hhmLkk5AGOiABGUwwdIYDzvgM584LHFR
	MwYog/oE6wA6LVf9LCvid1UfARSj6sSr73u2hAdaWaNYRBjzq0Qd/o3H8RdlEYyXGE0zET5quZZ
	ysdMMmMSoqE20urzRlCjek0jNvcuksJcvzoPCcqbeDG2An2BB1Ud1MMdbcewzid2Wg1qF9AHZwI
	tW0E2U8TB8Bg9V3Tfn3yoQoL8IMcvkKfsM9C05KkVWDUrfOImNCgaiM9I4HMnxjesw==
X-Google-Smtp-Source: AGHT+IF8dQFZu3267rnqS9T+MlnDpsGMNr4UhOIVEWZlRhW8ilrSLXmT3/L/LQod0dJlLDDEHru6ig==
X-Received: by 2002:a05:6000:2505:b0:3a4:f7e6:2b29 with SMTP id ffacd0b85a97d-3a5586dcc29mr6204277f8f.5.1749734127149;
        Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:14 +0200
Subject: [PATCH 05/16] pinctrl: wmt: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-5-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zZBlMtHKzzXioPhlG1XBi+lA5WvGdR2KtCyPxbjRVIk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLll7sZrjDKxB+yIfzZvsGDAzsgGsNSphici
 P1S3FHTYBuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 clh4D/0eejaFFeaR28Vf6ymty4cRxtkyHHnZyl0oNIAQK4k2LKxfyvv1Uvm5rcDeJyn5YwvFLUM
 63wQ/V8f3n0FvrZ0akyzb4OoY/gTGr9TqBrRvfmdw3r88RstUyCq+LAePz4qg737URegvsmvcqD
 d0sTmTdeWFE8SJUqM1Rthnrc32nwNGmdogrzN3Y3ZySLnrLIrGYKfwRv1uaBnPxjdZ92ZZp7S3u
 EkfpWxLbbosC+cqD7juqS5+lazxS8yOH2tC8dPPUxwYFwlA/yuIElg3a5eB1sSMrR4EGmkb2RuG
 omLdr7y0eoOfBmNyoHulUJeZERWMiUDyTpZuVWgKEfCYdzgb/Ti1935juLv1SrhpTfvkpL369DG
 saMpzPev+8uD4fKF3iWymk7Rpdk2zZ+93Ey4bGlSG2YDdgz5qd31nsBMFhvQPWVdVKNty0XtRyX
 mt0+a9PFIVXl1mjGeDhyldfzWKuR1cd3kDzod6bLGisrs3zMUq+/Ru0yBalUAzuB40k9boYhvhv
 jfa8sc/Rp5eAZ3YSb7LDTNEf9m5zWmWu2wMBGWlQIS0JyYZqtY+6j37fbI16nOHQgPZcd9zGGG/
 cvIur8XbL1wPUk8bK7ZObQF8wT/Nu0GAH+UK2fj/hAJAIHmRY6Vy2gaw9fAM0vxRT/AEE2HSZfC
 45zRTemNQslYrtA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061528_563622_CF980946 
X-CRM114-Status: GOOD (  13.87  )
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
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index fce92111a32e4976bd31c7e9845e4fd08a7affa3..767c6808a463ede61aee61b63f28ee38185b7633 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -507,8 +507,8 @@ static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 	return !!(readl_relaxed(data->base + reg_data_in) & BIT(bit));
 }
 
-static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
-			       int val)
+static int wmt_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			      int val)
 {
 	struct wmt_pinctrl_data *data = gpiochip_get_data(chip);
 	u32 bank = WMT_BANK_FROM_PIN(offset);
@@ -517,19 +517,26 @@ static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 
 	if (reg_data_out == NO_REG) {
 		dev_err(data->dev, "no data out register defined\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (val)
 		wmt_setbits(data, reg_data_out, BIT(bit));
 	else
 		wmt_clearbits(data, reg_data_out, BIT(bit));
+
+	return 0;
 }
 
 static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
-	wmt_gpio_set_value(chip, offset, value);
+	int ret;
+
+	ret = wmt_gpio_set_value(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -542,7 +549,7 @@ static const struct gpio_chip wmt_gpio_chip = {
 	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = wmt_gpio_direction_output,
 	.get = wmt_gpio_get_value,
-	.set = wmt_gpio_set_value,
+	.set_rv = wmt_gpio_set_value,
 	.can_sleep = false,
 };
 

-- 
2.48.1


