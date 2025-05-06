Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7965EC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=; b=QwRYR81PTU2hbm6VxAkE7GQEs6
	+Jk9YVvF2ztpO1xj7NiOUZBugOiHnt4ytZjMQYMoWfp61qLdhktXWLMY32a6ptoE/E1DWMshoR6iq
	FBKdHZIvNNyEb/05cv9LJ7DLDSKsZh/2E0mpolZecven9H7IjQlQE0RuU8ZVZ+6NiFX2hB7IG5sNS
	9y/yRSTokNoNLwcs8dhzNUegmXWt7XatKeMjMuywc/oByJbownu7ZQbyrXERMwbvZ6IVT9HHLQZzg
	MWlPLo8l4BVo5JV35/hfkQLcOvc66jkGwuIgTiGp5In6BgEmVc9W7CEZ5IcRhVD0/VynXDie6pCot
	WzLBaS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCErv-0000000BRYk-0fFZ;
	Tue, 06 May 2025 09:45:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBX-0000000BFtj-3fzw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:01:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso2469015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522114; x=1747126914; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=;
        b=iih5YbHVTptjmgxFtThjnlVztqqdP8P6Hs9b6OurcDyYsarqs5LC2IrzQKAccinnhp
         04f/tXNH8NZwBY1DkTUNfvJNQMECHpbc50WDVOdILfpavpEA8ebcq9gJgKwj7fqHPo8y
         nO6gZl1NtofSBSrwwPKE6xTylE0fpdWjMKIjE+jdP0uERZc8v6v3dRMt5RrTK7DMqQdr
         QZ3XKaE5QIaP/DIuuJBgWbp4v7prpHnW23FvAIQWsXD4d7ie3tlubRTlvUEGQabRYRjC
         Jx9oIBXFMy84DvxjL1rWSoVhz19lwMSFfLc3+17/UVWB36J6uEwOksNO8cIYRzCgWkSs
         Uu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522114; x=1747126914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqB98pFRqw492ZhmHp/PFeUzRjROzd7VojSNtl3mvpE=;
        b=CydTpku4JcKPSQhRZkwUOU8Y8sICyX7HrJCrP2RhB81ITr0b3cdDrXT4P+CpPiGxOn
         nSzFGCC66SRAfFBAnXCZq94aZJv9SHIk4xLrhMAAiFvOeuyi12E5ZYwS5kQaIjbFmQOJ
         vAV12m8Sag5xUUU4yK+WqcNLp/qu61h8yCVN2pP6gQIebUg1janlut4CLPixTClULKN0
         ytGf78BVGEWmHOugkiJ+H729EADF0guaJtmT+oF4qjmXyzTzPyhclI4wQJ6Ahuyz/BK+
         8sUJMxJyMA7Tf9foq8j/ultPnOQNXEwGxyeGdpxNF+CCMC49/LI3zcg74Nt7xOV4whe+
         iEWw==
X-Forwarded-Encrypted: i=1; AJvYcCUiFPFKtOdRoAJjwYECtLVNsgWYSMuxdZNNmyPbs3DsEVzANSVIiby9XGYnNPQS318XYat0kmQzNnQwpKy7/M4q@lists.infradead.org
X-Gm-Message-State: AOJu0YyqEV5z+s3u/JqMwR7TlnfKlJrr0I5A5YA4fiTcbQpKPGI+qqnI
	bCTiWiiCfcDywHM9O2O5kEBWrRxdU/6K9fdg77u1+i6cRAUYJnJ+nO/00F5i2FY=
X-Gm-Gg: ASbGnctqMsbxKRPzvmlgRH3Ja8zm91IbWpVQMN6LdT731fVDQUK0lQYssZoTKS4OlkF
	nIq/ABgJBmb91daEz5NP08wGDL5goHWvvCebe9PMRdiT6lCyNgztWb863bv+kuBL0LxiVtm12I7
	OwaFGCMfV3+B6lJCv9DHqN3GnnFB0h8XXJGXrCujFP6x/LggW6rT2NRV6JbRxoZ3lhCgxrPzGq5
	eY/u4IKbWswIaRBZmmcHEvRjNu4G1litOX0xOTfsZuC5XY8/nMgJUxClf0M8tmwKL19ZTECi/SW
	xX8z064QspFCEJP2ulucBVpHPwEfyB2MNNI=
X-Google-Smtp-Source: AGHT+IGDU8UwVARAbr3wvLnx+R/CMU+fndtw+gPiz5QuLHtsjMKW02FOMERXLYV/50G6vY3UpD1p6Q==
X-Received: by 2002:a05:600c:a375:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-441d10154abmr18934305e9.31.1746522114107;
        Tue, 06 May 2025 02:01:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:44 +0200
Subject: [PATCH 01/12] gpio: lp873x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-1-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KzVnua5lKk6LSZ+RA6U6z6ophC29UZ2psB9O2qSifco=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/8PZdeK3eoxj5LZCAwJ2tSgAZHtlOTQquu1
 TAv25EMsKmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/AAKCRARpy6gFHHX
 ciBXD/9eOGxP6WMpRIbDeI4ZPyWQdRiVWSzDMz0kD+ULzuBS7OHZLm1Lxi6rYWDOoZpA1aa/qRm
 T5DXumO4TNeoTYBlW4zeeAEyA6tdzECpf1BhhK/71Cn3CTpEE5pCBPbr1SvCuil2ysLA1n3Xg75
 kgPpAliYslsoCvHFYMZmoP/fFYVs5VoMLCCbAt25ueJJhtaMLmaUr9+nsxjQWRQFjce8XjxLZii
 uJ3Itxgyt00NTON1YpRsK3F1mGAeoZ1Pd/RUkCVXkRsvFN+faFyk9IbdH7qlAUYAG0U+ejvRtYm
 /UyYpvwOe23hQyg+2Oi7V74VaTaEQoEy4t/s95EwAXun2JRR/3iJiMs2DCKh7mu6mmarCHQ0UJ9
 rxrMU0F8SWGoNdoHJI84PkrzCowsnyGfaRbErOycQwKW7sif5ra5B+FBN0FTOzpt9H50VtulR6u
 ki6ZquD5iMa4DJg4U7s5rj4LSL41DL1E1PI6WKGM1SotlSot6p+ShkRrgong21J0XZ/Ct28bQfO
 FHWNqOgECDw9gWlNurVLK1udL3d1qtF24kPC+tq5Z7CmYOa+J86cFTFVihnXzLEUpjlgrhnsTd9
 LVPrjLlEel3vU7pgznmnDpKarYuIvU6If7rb8TRGHcBwE3diBLGk+eBSPYNSNnX5lDbsWkoDzMr
 JAhTSgymkWD4x+g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020155_929665_F10D7BC4 
X-CRM114-Status: GOOD (  12.31  )
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
 drivers/gpio/gpio-lp873x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 5c79ba1f229c4..1908ed302e923 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -58,14 +58,14 @@ static int lp873x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return val & BIT(offset * BITS_PER_GPO);
 }
 
-static void lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int lp873x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct lp873x_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->lp873->regmap, LP873X_REG_GPO_CTRL,
-			   BIT(offset * BITS_PER_GPO),
-			   value ? BIT(offset * BITS_PER_GPO) : 0);
+	return regmap_update_bits(gpio->lp873->regmap, LP873X_REG_GPO_CTRL,
+				  BIT(offset * BITS_PER_GPO),
+				  value ? BIT(offset * BITS_PER_GPO) : 0);
 }
 
 static int lp873x_gpio_request(struct gpio_chip *gc, unsigned int offset)
@@ -124,7 +124,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= lp873x_gpio_direction_input,
 	.direction_output	= lp873x_gpio_direction_output,
 	.get			= lp873x_gpio_get,
-	.set			= lp873x_gpio_set,
+	.set_rv			= lp873x_gpio_set,
 	.set_config		= lp873x_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 2,

-- 
2.45.2


