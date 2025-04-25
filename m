Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688C4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlGoB/HUZg4yDoY5L3zieLRRojeVT0zMfmIc8y47oNU=; b=f2DFuZ24ZojO9kNZ2RnmxDmiV5
	sxtKlLiB197C0P2VP2L6L72XSnvteXLgBUWXQHMNoGYNfGvzvbUGGIm3cAYYqgK8ichEsLG/A0kCd
	5YsRKo3Z588/a26enBKZBI7oedDpH9kANOQCvzIifVAnu7taE7Juzd7zJ6P6ekMlQjTKVDGeh5Vfm
	6yGyJmHu0c/Nhs9LGHYQrbSCMSxo6Fc5jYlfaZjUaw91+i5Z4NstlO4M5drZBwn5Mzp3EiTIEGXP8
	wqGdaoMCJoP/D67287PVVq0xRBSsTr9Bis3JP/5dOmYRnYiT0oilm55pqNYkJUOXM0gRwN8kVkLhZ
	WZ1OzmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HMb-0000000GzNl-2swN;
	Fri, 25 Apr 2025 11:37:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8F36-0000000GUE8-0edY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:08:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39d83782ef6so2202902f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572123; x=1746176923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlGoB/HUZg4yDoY5L3zieLRRojeVT0zMfmIc8y47oNU=;
        b=kg7wfMB4PumYXfdO+cpkA0XiC6PqlNk44AMQyWrEezyb7kHZM00ITmUqZKBb0vYXgi
         tfKc+obhUg4wByvzbWTOcELFE2GY5EV0srWKpb6FbXpace/tPzegpSXToUcv0lc0Qk74
         vzNWYlY0ALWfgbkL3Io2i8LYSVT/RrVwCNM9eah3TcfyZa2Wuhoa0kAMpZhgYkuR9ppg
         XnNQuQUwIhpk8UAicTb78LTIcMKx6qWla47J7+Qg1+8h+Hv0yBxPwDsf/mbhp65IGboT
         Pkv0yYnlD3L75ptaivVugNexZFOLaQJc+EUUm0K5l4QA1kcWMqPS4uUDz1MW77jXMY+K
         Ibvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572123; x=1746176923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlGoB/HUZg4yDoY5L3zieLRRojeVT0zMfmIc8y47oNU=;
        b=lT8XPGiTvsliDHccvjw8TGQu9OXT9LJlcxQ9CA1QRApAuxeNhWDCuuN7GGRyqZSx8o
         KCBpQ01Bl/USPl9A3y/xZ21E/TFcnU0GZAkgzzd4MFWBdBrQqynvM3VPBie0upGspnwl
         jFc6OLcWnslCkqLZK3HQJKmD/ggV+34O5UD2niD9FExx1akOoKZaxqkKIwVUCB3MyJwk
         ohYbuYKqQY367VWepSuvBXRnJYhKqjsowfORBc9YADvnDWkEedx3i7wc+e0IdK2jzFbc
         n8epWczyLlXGc/j0nJEeD5RrdhBAoy+DVD+YH4bS/BKNAtmleDsFDS+6S7D8HDw6lhgY
         /uVg==
X-Gm-Message-State: AOJu0Yz6dFbjcl5ovO86MCPfMJoW9e3nKjRoW2kiY7vMFFEw7ur6DgXp
	i+JXyLnT1MoBgcLhddOJQpSyWTxuLsXHuasF3mWl5tjNBQLf6JiejHqZTfnFz0V16/b50L8wC3T
	gGtI=
X-Gm-Gg: ASbGnctdHWltFEhaOYmaYU9bI+SQDsVaN95i4NecVTzXfSzX3dv0rbIy/CpYDtxkYnR
	9qTvDTuIZLdcuGHQrAqezYGsz+gohl/PTE6uY8IfbPHhKoEsZBoktOExgw5+uxxONZZPJ03ULyz
	YLWgWzbKXTh7aroxnPton2HwKe2tFMhB6rD2SdSNAA75IFOcfV/rmM1jJs2OOjf+TPTRGnRjHnP
	K/jgiv7wVBLtk0l2f9z8dk6YdmtTVE3qWk7ikPYZ/CioZ099nVvS3StC0MvepTkjdSV9LxPcW/t
	OihuYa0qE1VmhfdcaBKrnkQcNOXykdWgOQ==
X-Google-Smtp-Source: AGHT+IG+vaC7MmgQ1lY8Xs/s97F/M6Om983foVEu9vVfhXq+DCq1sUbfXts/z/dMaAJgf6ogHaPHXQ==
X-Received: by 2002:a05:6000:4285:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-3a06d641ee8mr5322988f8f.6.1745572122724;
        Fri, 25 Apr 2025 02:08:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:08:31 +0200
Subject: [PATCH 3/3] pinctrl: bcm2835: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-3-6b8883d79b66@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aKxxveH0C+uR174fNORC/elug/yziUniASTqQNWz9nc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EPXzEnCILbRcigkhvMXKkn4wcX8TtqvQacB
 KB7TBd1QxiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDwAKCRARpy6gFHHX
 cmUiD/9yZv6dvT2Wc+LvJ58hLcbjZISnPBDhqi6UcP6kX2qjRFckiM8hGhHOQymPP4CMm0Io3FB
 3vhD5qFTWMyUqVB20hNF8fzxFSAF7z1w2CZ78upNY4Ty8iYKY6iXlZkTb4/I2vkUQElKJc/FKuz
 ll539+UounWRewqOlHwUdLlhdIg/p3K6dVzXwe7zVGhLh4xnvbHm8w0mOjziSgYepKhgDfG2h/e
 kECtA453bSJM8Krn7c8+9i/W7S50XLMt+8Q/uK5eerfg2Ix595UQNVT8wwygug0q0ex9i2nJPxS
 kLljtjYkeCbEzhpHvXPszQKP8S3ACP7Upcx60XQ32TFPKnlOnt34eNH5XnLRbhgMA44mfrVToIF
 b4bfmC1mhk9vjJmDe95jXH94+nOr5C/u8C17k5eoxpGwd/dzJISDfRBBfNPJou45LONB2eNPoBw
 07rSsnepk1PHd2FzBRPi2yebyN6YD7VmyRqSU6uDB/GyaCM+V/6Fdkj+6YzN5qezh314hAUT3Hg
 Ua7v8riePOMzxWiQIJGaMQmNjAC6gHILJn+73Fe4sEXX756CFMp9EyAIYp5KffDuBwm2uP9ktkg
 xTJ9J0vBSw5fxWyfFhVBhP2ijqhpM/l94+zEJuw11XNTxhheJTSyayQWYB0i8TW7Dd34VOtqoFE
 HAHE0Qmyq/keRLw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020844_190833_242DAF9F 
X-CRM114-Status: GOOD (  12.76  )
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
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index eaeec096bc9a..826827800474 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -356,11 +356,14 @@ static int bcm2835_gpio_get_direction(struct gpio_chip *chip, unsigned int offse
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int bcm2835_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
 
 	bcm2835_gpio_set_bit(pc, value ? GPSET0 : GPCLR0, offset);
+
+	return 0;
 }
 
 static int bcm2835_gpio_direction_output(struct gpio_chip *chip,
@@ -394,7 +397,7 @@ static const struct gpio_chip bcm2835_gpio_chip = {
 	.direction_output = bcm2835_gpio_direction_output,
 	.get_direction = bcm2835_gpio_get_direction,
 	.get = bcm2835_gpio_get,
-	.set = bcm2835_gpio_set,
+	.set_rv = bcm2835_gpio_set,
 	.set_config = gpiochip_generic_config,
 	.base = -1,
 	.ngpio = BCM2835_NUM_GPIOS,
@@ -411,7 +414,7 @@ static const struct gpio_chip bcm2711_gpio_chip = {
 	.direction_output = bcm2835_gpio_direction_output,
 	.get_direction = bcm2835_gpio_get_direction,
 	.get = bcm2835_gpio_get,
-	.set = bcm2835_gpio_set,
+	.set_rv = bcm2835_gpio_set,
 	.set_config = gpiochip_generic_config,
 	.base = -1,
 	.ngpio = BCM2711_NUM_GPIOS,

-- 
2.45.2


