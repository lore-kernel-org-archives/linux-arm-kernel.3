Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB23C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBMDp7aHXRNt/RwICrg1q5Lp1fT8OK4mUnztK4V4pSU=; b=aczq319RchrQox/mhQE2CwM3dy
	At/RHsnAcMENTl5sjLawJBQb2Zwjnp0c3d7lW8mz00Tkmihs4DoSnI41TcTH6+WecSusE1wmbItRB
	/3O7cwB1wYzPLY+O2NTqQRanjpcgfXmbR2oN4HUjBpIBaognAgdWYwRAeIKJ/8U8m39oerkzifu0P
	s7+t6SEFNBWw0PPEEa78iIVUIMoHprzOSuopKeQOS567V6hLF8c7H5d4fK0xT8HuLpQL7pCLqKCWb
	lscD40OgV/eocJoU0izbO5IboZlGtBb66h0tJ5qAJwSU3AFKREubmYC2kfT4VpJ7scw5LRigQKRbx
	JS06V5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5tj-00000000vku-2wmG;
	Mon, 03 Mar 2025 13:31:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5gz-00000000sYk-2dqO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso27977085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007924; x=1741612724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBMDp7aHXRNt/RwICrg1q5Lp1fT8OK4mUnztK4V4pSU=;
        b=DIC0iTEgIJxWgg8OAeatYr+NRTMdko6ORfNVDETknz2MqGxDWTRXhi6VC95nMwPNaE
         B4jRXn9lbwuA1Bba4pR4YdmGZ2fiCSAF1lxQfu675nqKlvWyYCmRiwJVET/T/Q21pQvB
         bsdh7XPbrT96FhrGWAQuZLieZsy6hB6WMYeI88aQn3IGlMTZIQPcyWWoLj8kOUl59L92
         CLdAGaLa4pUtV+XRL3+RGNV5IpssLwS9GwMXP9OO2bM5XUonRQv8OmboRyDsepF8htFD
         Ep1C8dgigLTQDJDNUg3BYqZA6tq5uDaWHJovpS7+fGD7z6CD/teaE5bD9nxkinE+WJLT
         KBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007924; x=1741612724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBMDp7aHXRNt/RwICrg1q5Lp1fT8OK4mUnztK4V4pSU=;
        b=B1kBlCciAVlRVhftBPVeyyypYbReBVvBT6OlqsNI9q1kfrUduzFecmg0cDv4BkJqV9
         /AW6VhusKMdVwepXozn9KQS8EnK6gJAykdcAR/8lba1uCD5yw/8LKLyHj116XsDUVlck
         4jia8s+MIm6MeXkbQtgt0HTAh1s6t0cBj2Q3I0seE6AUOjIl4V+ZebkG+Eofd+BIXyMn
         N+20S0ujWO8sd4Re8p7g0flFALA9OWtxjM2hfFhkZ6W73lUdbQFTrYNQdw+K3//8BgnO
         uROUTv7EObYMvsyuxprt7XNuY/bVdARiM4Fx7a3n6mO2vpDoCHrJpIXII+u1D98RlwzW
         e+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKdjg9VstY8wUZejas/ZLm4WeprFenk43qQPOH7Pw7lUr609vEuIq/sp2KFGtLoVdZcPyosb4McXwJ4QARqi0N@lists.infradead.org
X-Gm-Message-State: AOJu0YyUD/g4yCSX7hY+2VZZ23BEtEeZP5LBc8zngiIbYfekpBHTXOit
	RsLXFFzppR2OR5KhKWKjugUgd+X2cKGsmzp1Y+b8Y+ZaCUb1N8Xs2IzCm/ITAek=
X-Gm-Gg: ASbGncsSPXIcubJaKyhT0fHFo1eyEb/mJxHE8nUMWvj5Gf6hjFF8tw/PSBFjRDP4Tjd
	7fROvKfidiZB6E04sxSWj/b76RCwbSgYHLRXZz10GYjDr89o+M9FnshrGuKZ/8BIAz/2TOKtbi0
	9MNPpiYwWBkBUxs9VGtSjECiW/Zpxv6zs3JnKsESAoczEFW5oo5AFoTZU4qtRl/KA0CwuzBV2ah
	NhLbWFnZb6nHOWVsCaEpkXnAhsxI3+LMm2VdvNBHEiRNQuFc368utYiD2vm47awm/6lvH2Tm6e9
	NqpxpPUFe6as4e2CJD9lD0v0YDwnkZ5Y8l70UQ==
X-Google-Smtp-Source: AGHT+IGbJY5Jo+WiS4mPjsCw+ExPOHOSH2GviMjPeJvWFYMKh5onFXn1ZivjmcF8FlnAaeL3hMO2aw==
X-Received: by 2002:a05:600c:3b97:b0:43b:c7ad:55c2 with SMTP id 5b1f17b1804b1-43bc7ad56cbmr14809505e9.6.1741007924329;
        Mon, 03 Mar 2025 05:18:44 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:31 +0100
Subject: [PATCH 06/15] gpio: adp5585: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-6-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rFPESwnteTAwQY6BOrgrkBqbk+imePLRfwcTrSAG+yU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawqPjfHUJ4WPy8suyZvHErNCeJlzfCBlVJei
 RnIRKpHR8aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKgAKCRARpy6gFHHX
 ctpjEACiBsM6B6IoFrKlVbwDZcEaVstk/hylqUDuoVuEF8O+FEE9xkLlNz44NsSw8kzO+pguH4u
 HKN9AaGuVpIcI4vAQv5lislBsX3xuBv2zHzm49rk+yv935TLT4MKXOAnVI9S2TLfvlEFdCUqjYy
 xakIdKPXiHkiWCmNrwmy3tqB5HwwbQ9p2NEM8l2+W/TCkmT+Pz2NJ3R4yT6JAjSeZr+2k0d5a0u
 eB6gdaikIt6DKTSX6pjOtXYEszgjOhzEYBmgB4l0cF5S7EuY3tn9Dnr9UA+YHaCbQ80J5IrMP8d
 lRK3fBqv5nJHcj51oVIgAUqYZ6xp0rXFaFCfTNRpbgYiojTCkRsX5kp/E0AMt0pPzA7HhXfsdvw
 0i6HG/qKEnEk6oOw+kUQKCQKZMKIkHKjvuNgPz0i6mVcAoXFGcP8qSyMEVBIGPdpMlBVkTXxqk8
 HI4W0A+4wV2DnsAZIfTNrPfj5kzl/PZ5znHY9+rglJipUo9/pnLLBDLrvwNtJUAtRrJEqVpJcRf
 Dt7hopEPcrdBWBcaJdswJw2xmw1GScQ6wfnCpvkjveGWaZFpnijBCLytD96kbhMOzY8qneMcr1t
 yXEogC9FoR/nvMjtW9skEXcr1twoXt1t66yuuNXqbz3LYy6olZT9klECCt3qO5JXfkKmt6lzIW0
 4rFJI+Vr50GJimg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051845_677345_F4036422 
X-CRM114-Status: GOOD (  12.21  )
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
 drivers/gpio/gpio-adp5585.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-adp5585.c b/drivers/gpio/gpio-adp5585.c
index 000d31f09671..d5c0f1b267c8 100644
--- a/drivers/gpio/gpio-adp5585.c
+++ b/drivers/gpio/gpio-adp5585.c
@@ -86,14 +86,16 @@ static int adp5585_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	return !!(val & bit);
 }
 
-static void adp5585_gpio_set_value(struct gpio_chip *chip, unsigned int off, int val)
+static int adp5585_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5585_gpio_dev *adp5585_gpio = gpiochip_get_data(chip);
 	unsigned int bank = ADP5585_BANK(off);
 	unsigned int bit = ADP5585_BIT(off);
 
-	regmap_update_bits(adp5585_gpio->regmap, ADP5585_GPO_DATA_OUT_A + bank,
-			   bit, val ? bit : 0);
+	return regmap_update_bits(adp5585_gpio->regmap,
+				  ADP5585_GPO_DATA_OUT_A + bank,
+				  bit, val ? bit : 0);
 }
 
 static int adp5585_gpio_set_bias(struct adp5585_gpio_dev *adp5585_gpio,
@@ -192,7 +194,7 @@ static int adp5585_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = adp5585_gpio_direction_input;
 	gc->direction_output = adp5585_gpio_direction_output;
 	gc->get = adp5585_gpio_get_value;
-	gc->set = adp5585_gpio_set_value;
+	gc->set_rv = adp5585_gpio_set_value;
 	gc->set_config = adp5585_gpio_set_config;
 	gc->can_sleep = true;
 

-- 
2.45.2


