Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80165C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=; b=UVnqQTbDcTCjDS7s52Rw9dCEnU
	MSGjDtAQWaV9YPXkmrtzPm3xksI7DNsBjlR/3pz22u0kufWQClGalDttk3MWp6F/9+BJioHFOqMel
	evypS0feCmR9RjRfw8qd6450p1VHvzN0UnYCvb/LnsweYLWT1dU14fG6HCnj/rbj7dxdE5GTFQteB
	WJBlzrhl7YFhOHjc9nSG/ewob2GuZr0DzIulCQ3V2sSakglw+D8UieSKFR+ES6JwmJWwyl7+tNabZ
	LQpWQeewFUoq1Hy3kZyvXNh7yPRjnWwMf2tHapDkSmwP5AlqjIJttrTELx7UzS8iinIrB7cluGxo6
	52WxA3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVin-00000007EKt-21UV;
	Tue, 17 Jun 2025 12:47:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVMq-00000007AvU-1NP7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:24:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d7b50815so47719675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163083; x=1750767883; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=Se8oMDnbTODZns9oPxVf08AqWNlT5wPSCf+DOnlmt3MI/JQskKFrl9+UaLQcjeUNpH
         lZBawRenuaEuZcoEpPcgAx8RZn0JhOCinQMX9A5GUlOTQXHHOTIbGUCLFJGVeR8R/mki
         +RH7wY2la75gpci3xmhZWxBk4xATqfTaeFsrudt3h0kEdiOshabns3HWRYytUtMqo3Ji
         Q1QcUI9e8G0uVMMW/GSdb4nLV+OKmAfDiGg4zG0fIyD79kwTmMfzXXck52VAuwYVYhnz
         /ub8vEw5SU0W4QZB1pfXv2hxR9wnkBjG699oEORxu//bKS+noK3TVawzav57ej6zaFXs
         +cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163083; x=1750767883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=I1DhAlzx46qavOAGWsFQjKmE5N/8RAhkLdAhefO3GCggLBzND7gq0RQnz93ILaOS4K
         I3jdiWhpHCDAjDAyDsJdsD4xYJbib6zJt9kadXdf2lyf39Ukv0NEGHt8t8+ni4mKKu5D
         1ECJ48MaEEyZ9/Z+t9shBAvtEh5Axpi2iDVP2gWPv7VS+wug1+3BGKermmMjxx0bmrt7
         YHCviYNY7FoqFkRkRCmuhAmkeUOWxSg2U11UzBTUOL4/8LqSOzjPffGVQAif7uehMdng
         bOYLfGOOUejUr5R9GdsaM/aDaQDOcHLj9cJTZobSAzfUC4hxzB4gQ9BtX27klb6D488v
         ffGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcmFnoTcy7DEXD6ILAG3zK/RQ1NWUUkEe12pv7+EMdHciBOqdMep2qdfOtZKgtKWiXux/kdx0F+rY8IQ1d6ZRE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7pEzVTWwXcrYnBmqglcX7oLQqWAYEElWcBTOKkO4eV5JzeqoC
	3H8RK1Srhfz171lLiAYA4WCPCTfuWV8hvFXnT5vkVCSBi7dFTgB0PSteGe5RT2jfdTo=
X-Gm-Gg: ASbGncsbTmsWiRKZ10Zl5iALqU2buZ+gZgV5PzGs7xVz1q/gtgch68CFM9O9QizZerd
	8hQ8aFyb05TGFIyuR3QMi7EUWzN+OrR+BWmtDPUNGs301gVAYVnUGEBR1HIl6w3eymyinmMwj9T
	pQDUD2lJfBl3V31l5Vm1RhPxs0bSNFTOhkmHwUIB+JWHAeVlJS8E1vUUPSbdE0JFD315fJNfBel
	sXqWQO+8xJGshYNexAvXatUU23bVHqNsmoPxGedD9N/AyptjS+CV1SDCjQJuDbW7MFGdcHNFFka
	G0GEo4HOXsWLKWARSZQI0HfSa/y+GIJsQPnb/VRxzvJ1BaZlv4BWmBQEc0PoAM8cyu4=
X-Google-Smtp-Source: AGHT+IHdDJq3gvA4sfWiaOxd+XFP/XNqtrP+XE6lxG6A2/HHHT+4Da+4G92+pmD+3HshQ5Xg9wkLvg==
X-Received: by 2002:a05:600c:37c4:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4533d5a03a9mr141189635e9.15.1750163082843;
        Tue, 17 Jun 2025 05:24:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:23 +0200
Subject: [PATCH 01/12] gpio: pca9570: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-1-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=t5r7nMPMOl/Fqhu7blFrjnyYOcc5SoneVJWT0UVvyG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6GexaPCP0OCCCwFHuQx75j/9CG0GCDLgAZ+
 KSrqpESNoeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehgAKCRARpy6gFHHX
 crYWD/9ppC5aJkPOyjWUhC/39fpEYawzV1oo4LA3Ztz2IaHRnTre6rmnHt0RWCnXb3Ogft50bJz
 3OfxYoBxk7sT23zhDEayJMLa7f+yRxlrGtMkvvbajg7FnK6dG0ZLDivOjPjg+3j6E3Csa63xB2j
 8NHdCO9JCcXS993dXW2c3g1qsqyUR9jz8rDcpExWFZ/dpsvD1IhAW1s9pxCuuE6tkO4fK2zT0e/
 di9CWR4RhrAK430nIY3rf009lMITmd/RqKVwZqF5Ao7QVyT1xkeE2tyi8+SLYebXQrHJCOGir6z
 HvkMvSkvjZx58Vh587NJQmVKxXh+hfbpfjoifEL1TAG/u4umxKzvGrtWB/6GM6Ea702rIGaK379
 y0A3uyAYwtTOlKyB+AtIdxG2ydQWpo0NXYdH9Yh+RVNveDOALdEVGPqf7USkh/PIEJJRDPpXe0r
 s3bdRpJem+8LjEB3NEZWVlWEpdPiHVZB8YN+CImGcs2ZDCvS0plVUK0AOTDix+TymPsvXzmJGLR
 ha7VhjmPrxB8on4mkXhIm89HpjTC2Ifn15yc7tNP8ewrAgJ0CWo1V5xAgKX0hB/oUjIbBWWJDzo
 TEzXU+kxQqmGT1ktMvoWFMbHuwI2JIJHPv3eMDKPjty/8ZQqsn83VFR6GZ+oAtqFAQzfujICE4J
 zyK6vI1OeVADF8A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_052444_373871_6F6C7DAA 
X-CRM114-Status: GOOD (  12.54  )
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
 drivers/gpio/gpio-pca9570.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index d37ba404936835bca160822ee361604827976e9b..a33246f20fd838a57abeedbbd7e58259bf073a86 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -88,7 +88,7 @@ static int pca9570_get(struct gpio_chip *chip, unsigned offset)
 	return !!(buffer & BIT(offset));
 }
 
-static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct pca9570 *gpio = gpiochip_get_data(chip);
 	u8 buffer;
@@ -110,6 +110,7 @@ static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
 
 out:
 	mutex_unlock(&gpio->lock);
+	return ret;
 }
 
 static int pca9570_probe(struct i2c_client *client)
@@ -125,7 +126,7 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.owner = THIS_MODULE;
 	gpio->chip.get_direction = pca9570_get_direction;
 	gpio->chip.get = pca9570_get;
-	gpio->chip.set = pca9570_set;
+	gpio->chip.set_rv = pca9570_set;
 	gpio->chip.base = -1;
 	gpio->chip_data = device_get_match_data(&client->dev);
 	gpio->chip.ngpio = gpio->chip_data->ngpio;

-- 
2.48.1


