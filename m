Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9953C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 06:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sOO8GRYzH1LAIie/qr6XG8UhR9sQ84kZJSd2ImbOfE=; b=TkJJJ+SHIcTNc3sA5Pd0p6SITW
	qxToUyYnbJNcgE7VrLuhPibK+BQZZn2b24Yu4JJoScBOdJHjo2IPXM/7HMCg1DhZb+GBUFQ3mNdok
	96GsGjcslFOtenuJvps3pAdwDqD4jp3Vd3Nwo84qf2kVyOFbFaSoz1OVO4Lo8g524Q9hhE+y0xqGH
	Ew/gOGoKRHRdB96CWXfA9y+YUJMxYnBnvjB+/l2Lu1cImozt/XfNsZm9O5VCNIGOkASa/h1e79n4d
	bRWn8TQ3O/VzmBR8klVQBXP1CAgv6nNTOHZHdXmQOAfo8xSlMXVySftrQHI0/Zis0NGwAfJM6RLS0
	yNAlfBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOlZ-00000007k5Z-11UJ;
	Wed, 09 Jul 2025 06:58:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVX-00000007h5v-096r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a54690d369so5105196f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043337; x=1752648137; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sOO8GRYzH1LAIie/qr6XG8UhR9sQ84kZJSd2ImbOfE=;
        b=Hrn3ojWCOotCGmWas31vATn4QTvVZgf3VfI7orVnwcib0D4ZUDmxQ9jiYyWSS1njU0
         bokOIpoQVyztKo06bRJS4OGdKZ3SJv7QwCZLvqk1WqT41S6Hr6S1Oucl/FgCFc69ByQY
         NsrGyiTF2VXKFB8OVCKg5YLoRX+7OJIAd7prPQ1an1OoqAP1B1lV3GkywM9lJ50r3c4t
         yH2+3kU6uXUbdA24CpHmcxHliZmuYxvgF0Yvj1SygoenTlJBoyh9tReUZfJRmWKB33JN
         rEsSzpTDCadvo0EeUIebliTzMUXLXSmVWeBtmB+B6jPUQ1fwKVtW4MJxzt4HcQ6lEUNJ
         on1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043337; x=1752648137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sOO8GRYzH1LAIie/qr6XG8UhR9sQ84kZJSd2ImbOfE=;
        b=Jamxxnhy1pIkOQyh40wGgFlo7G2FTXt6G3gIuQkEHhPFxEidO9CQkVwcq3Q0hW/oxZ
         4yQERnF/lYyeqHY0uzjI+7HJuWDLCfoy1Nn0YRba1jMQDytuVtOLTNPXdf2ckMD8VHTD
         LlRlnTQ47KntZd9WMXKMYl30tibwAWZf6iJ5XrowAU2bjvutlOO1DaH+H51K2TRqV5wb
         ymmZ5VMS3D9UGX29pUU2AebLwkxRdOnbpn17ZYta7Om05lwjsglElR3eDbwxBdASW+nG
         3HeH7CkmbxKYeV+D02r8Iez7eo5iS7IQIcHu/CwTjsZYk7N1hoaEY7iRBeTtBYyUn6Oy
         kBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDnZ4KG2ws3u+34T2EGa8s5MSCrWs/K31NLGonZPwf3O81kOOB19RE3etn2q6koRU64xtaznr8mdJ8Hx1z8s6d@lists.infradead.org
X-Gm-Message-State: AOJu0YxvjQ2f/DFco1n9Yj+3VLNZLrUX73i7a3hYzjrFhbgp9WpRc0GR
	+5+7UdwR1993fCDb3C+1onjvHPXcwybmVku0BeSwD3mjjAOWI+jq5gIb/KASveF/83M=
X-Gm-Gg: ASbGncsQm4p/CRdqMPtnzSgIO5vkLhm0ffkM7Zaa0YHDEjNAIKQmb5JaFnXTESdgD/F
	Vkx8RcOU+2iuIn1Ju3X2mUGS3ZlOlsFHajszeh6NkFBB63JErbt+ZRzPTDqiHidgngBXmooncQM
	D/rRUwzmogGE+a36xJLZXD9dlTZr4ZfJ8jsz4S1ygptXEyYVCFmiu350orvw94FA57CGpF82DaE
	jqK1EPSL97E3+j+mzThfYDgXPk9R8QffpuStOQ/JMnTVcXMp0KW/GDxKKvYb5ELNgmd0jE1O41g
	eCYdWrsCsM590yBzRmKrIMXorM+qzGl7dTNUVfDz5qtIMtLBlQpy+69i
X-Google-Smtp-Source: AGHT+IFWKDqKOZ2L/KZvqJCnN8qQD3YIoVrT5a1mUHbgBeSL6yTbT0/+VvV21K5H/B4ELkfg4LvHuw==
X-Received: by 2002:a5d:5f89:0:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b5e4521ecbmr757039f8f.37.1752043337411;
        Tue, 08 Jul 2025 23:42:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:40 +0200
Subject: [PATCH 03/19] gpio: wcd934x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-3-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Tl8ZXK09HDgun+whKg1NHBj4f20MoyV0KnJ4JPr3RU4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9BRffvSvflEPnMK75nSizEGaQYFrRJKallm
 FD14255i/6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQQAKCRARpy6gFHHX
 cjPGEADR4Pmj4bWhhCGStbfaVxmL+G8r4NKc5ZarOliqjTvy7GZovvlqcvpXCk35GFbc8S+ub+7
 I+BqSvZHhvJMvj0xv+bVfT7r8/0HkAdbyrgx0QzylGDEz1eo72GCy9fz2XRokyv+UsU4DRmE/Zr
 uiMKQXEQqBQE1Xnk5o3bzF1xgZ56rvGZmIpSIbrUg6rnTmCQGokPzLq9JLI4l8UwDt3tTqTxlJe
 RedE9ojZ7CQSp/H0RTDIn/V9FVa64XfYjZso2bUPUw16DWID1U1iFLdqO8miKnaNlYolLDEB//o
 Zmhvs68VMxqq6S0DhFhdhujpiCV5vbenuMFnyruHQFCvo706gnRwHha/la9gI4bsMs/J11A7Rpv
 js1gm+ApMryxCgH3OFiCzLJ3n7xDdsXTMhf37QFtrvpCeuX4XbjEoES/UcMIyUS+A8T/pkK4w7J
 8LMRGbge0CxDuGHXUqLyLEGylFmMJDMiEeJyEpfhV1CsQGhinblP2+eKd2Db0dEVr25fFdGO1XY
 okolfMaZMS0cenMDpy/TlSMpJSmjXOfZ0M9ESoOotBlDqDNjLrOhIqx2XiQhQypJbGK8TK9xNeB
 uPgO1XhHt3FSmzMr7QZIMU9UxCnWa7f+jypq9DchT9R6zASZXFV184GGUc7WDSXEXn8fNKcIE4m
 GrdZs5+ohNuqkIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234219_085226_A17EFEEF 
X-CRM114-Status: GOOD (  11.93  )
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
 drivers/gpio/gpio-wcd934x.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index cfa7b0a50c8e339603bc5fc70a8d7354f3bc6486..c89da9a220168e1317131d2428fa4105ebae2aab 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -68,12 +68,13 @@ static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
 	return !!(value & WCD_PIN_MASK(pin));
 }
 
-static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
+static int wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 {
 	struct wcd_gpio_data *data = gpiochip_get_data(chip);
 
-	regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
-			   WCD_PIN_MASK(pin), val ? WCD_PIN_MASK(pin) : 0);
+	return regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
+				  WCD_PIN_MASK(pin),
+				  val ? WCD_PIN_MASK(pin) : 0);
 }
 
 static int wcd_gpio_probe(struct platform_device *pdev)
@@ -97,7 +98,7 @@ static int wcd_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = wcd_gpio_direction_output;
 	chip->get_direction = wcd_gpio_get_direction;
 	chip->get = wcd_gpio_get;
-	chip->set = wcd_gpio_set;
+	chip->set_rv = wcd_gpio_set;
 	chip->parent = dev;
 	chip->base = -1;
 	chip->ngpio = WCD934X_NPINS;

-- 
2.48.1


