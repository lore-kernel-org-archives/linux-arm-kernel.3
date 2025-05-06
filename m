Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2E4C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5t7463cNsExwzuHfixoOLULX/8A+JIXQFhWYI91z8U=; b=rFM3XWnWWpKsiXa9eY6FA8loUz
	+QMRl/QQEjd1ZpTBDSvJFTQMXY/7Q3IvydqhMx2uWTHwS9Tt2qEs6knbyQ4NDQ+OV9caxVUfw7dRC
	GgnAD2+HRgNog1FsGamiJ8sY9UmsQ4lfWeWk5C3yEeu1zI72kLcQ44c52kNGoOKIa8UHb42CeuooF
	Wh1na5b9cP/dJ0zb3p3Zztm2DG++c9GNw/TaAsqzv3CatZ5z1GeLtejkELxZ38Gx7ntB8X6DGI0Qh
	3AdNjqDazhxDxW/z25S3PjbjH01LsMvKNWvok5B8nkpmJL9gjZAdaXxwUjMw2B8++gj9gkc9UAvfA
	KuyXsKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFCu-0000000BW7e-28FD;
	Tue, 06 May 2025 10:07:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBj-0000000BG0G-2V6U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:02:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso23299465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522126; x=1747126926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5t7463cNsExwzuHfixoOLULX/8A+JIXQFhWYI91z8U=;
        b=gshPQH/Th0C6XdbnlLqBrLvVeqqBAyceyWgHVE8HkJdsICUmoYzh0mFzZ+i/Jt4V59
         aB28wdbBcObaRHhPQXLyh01QOZ1hAMuc1R5FdS03hYPJ+R4FgWr1Dqe0ikxM6zvwPpSU
         VeB8hpGRRaSzBiQfVa+aBLikaE5t0WzJS5Tr1sG8kC5uQSN7tgvhbllWttiV8xuea2+3
         t3eS5DuOAQ8IF3W8KpqtcwZRLq/mqHu06JEaoka0HTdNa6ikTR7WKTgfCqQlFFY6VsOL
         FwLT4pjtI2K5/cY72FISx8FVPwAFq5VSMzdBED7JmYQwIAhQVYqludQCJpHoV7TVKdKe
         +9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522126; x=1747126926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5t7463cNsExwzuHfixoOLULX/8A+JIXQFhWYI91z8U=;
        b=Ioy41wdZGUNDZAjPpXhtuCXlMK64t9qmyzPI8Owde94xv2nbEJCSKtD96EK57XgBaH
         aoYkPsrBZ7sPEIUpaWRlTLmMeKvWXRA0ixIrKd9Hpq4SC3COAFX422PvE3p3XeszQxNP
         VD1vOQrJuGpyVvOAr4bwxYRIH5oUv2CpFE95FX/DrOgGsQ82Rdvh5BTRKLnCiPvA5GzF
         qXcIJ16tJxuYjR/SPWeoGSXAUn1+eStyVOIxCGK+W4io9GSvWQSuLoDV9NQsVAylb6ad
         Uo+ncHfRBwWTejp/4utPbOipQKMhMzowH9lgNyQuheJD2rAWLcL6de/funGVxRSgZt86
         iD2A==
X-Forwarded-Encrypted: i=1; AJvYcCU7vaFDPJ7cV6CqDUk9DuhFq3EdUD4Tn2+P0dMfHjBz2Ala5wqSogwbqyTDXdF1hj8Au5quL1i3J2LsBRBRY3CV@lists.infradead.org
X-Gm-Message-State: AOJu0YwsSL/QWOTb+5VknwCw+mXKmHXIgoEk0uOI3T3Wrk2irtDeb6We
	pik5XQRu97/G/MVZBI+ghTKanpaLkqI9Pc2oKcQEUqO5OwEIJhpYWFMnRcGR82E=
X-Gm-Gg: ASbGnctm0wnS9g3KM8uspjMkxYid+Nl/RfOA13DcJSJV+gYuCvXTI7ShhOUTSOWQ/D0
	5O8ZrSHhxOnPMY9vSHJA+YgGkRukmUePx6bLdyWQyOzxlsRBXHGtyZOsTSSzO9iDOaoXYPorG9q
	gyeW7ScRMgX8hQ1GleX6rca7e0w2kxgTdPG5p/QFtEZLV5KycbboK7EvCfgPB9qOMTmI6CQxRC1
	zSJCbS3bMsSrXypixycD/vMQyB570iXvQGFD3UXqPx2i3/kY51mPwz1k/lC/Og1+77poKJAQh0v
	Wh8b/Yus3LM9cAoEus9cujq0yBpO1YbHwC0=
X-Google-Smtp-Source: AGHT+IG2JavFAOfkm5yvEVzhBOWiCM+n63NE0WGorpmBiJ6Up7VY84BWzS6I5+ST2HXolMCVpnzNgw==
X-Received: by 2002:a05:600c:a413:b0:43a:ed4d:716c with SMTP id 5b1f17b1804b1-441cbc3e6c1mr42623835e9.22.1746522126365;
        Tue, 06 May 2025 02:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:55 +0200
Subject: [PATCH 12/12] gpio: ml-ioh: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-12-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nNCKmy4dSJPb2zDH2e9wzncuQT/cTu26TwYiGfHINVU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc//yRkQw+Mjxb/VAzEYh4NS0eiU4M8rdeHKD
 lwNJrrj8Q2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/wAKCRARpy6gFHHX
 cgkxEAC8fJnRNCwURyy7LqresTVWXPVo+9MHCVv7Xny2M4dcRTEzIR0UWviKCey2j9UtttbRC1S
 RJLdo1AbErdGoC9X4GXxqTF0HVzys7e2R5IuMDKile7aI5gtS25t3B/MxMAimQGNZYszacXclvV
 tAEhuuUXZoOi0tn+vUL8M0kI5Q0rPoBxjafYzpV7vThKuVDJVlFHnbpX+v73bcpvPrKnNQxkGSk
 Y0ddRdsoVggcxRyRQoP3reI1vnrUAQX6EVbl0eOABGFQGn5v4UtlTf6fcyoK/M8iEkK/fJIwDwe
 1sKo8qCEErY5+/tc0jkNVU7rz2aVDNl+tdxRS/L0uPkdjAFf2hGusuctrIArQjq/fLM4qXcTYis
 oQpVROTxZ8BCKks2ipR9OUnareuOcKkzEwnyNz9Euvbbf9/QTzg8QXilXqdUZs1p2MatmAAVgzy
 78QVnDB1XkwMaayWKL8MjmyZp0VEhrL6MAEYWhEF1e7F9UATHREd/Nb5VfyvjUa4Z4POrtU59r5
 b1cUgOhohRjs6+sUxZ//I7AUuhwYARthUobnm8V6tbEGwKnCsPz/T+1BJ/Zh197UpgE6ML4YMNH
 tu/dPXHdy/6tt4ZGX9/ew/2vhmW0kspKtafG/On2TTVH+5+s9QEUPxqnWJ5TPoPXzMjbkC6HR3t
 6/VRTvBri4V3vRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020207_642487_546B0CD1 
X-CRM114-Status: GOOD (  13.28  )
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
 drivers/gpio/gpio-ml-ioh.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 48e3768a830e7..12cf36f9ca63b 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -89,7 +89,7 @@ struct ioh_gpio {
 
 static const int num_ports[] = {6, 12, 16, 16, 15, 16, 16, 12};
 
-static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
+static int ioh_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
@@ -104,6 +104,8 @@ static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 
 	iowrite32(reg_val, &chip->reg->regs[chip->ch].po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
+
+	return 0;
 }
 
 static int ioh_gpio_get(struct gpio_chip *gpio, unsigned nr)
@@ -222,7 +224,7 @@ static void ioh_gpio_setup(struct ioh_gpio *chip, int num_port)
 	gpio->direction_input = ioh_gpio_direction_input;
 	gpio->get = ioh_gpio_get;
 	gpio->direction_output = ioh_gpio_direction_output;
-	gpio->set = ioh_gpio_set;
+	gpio->set_rv = ioh_gpio_set;
 	gpio->dbg_show = NULL;
 	gpio->base = -1;
 	gpio->ngpio = num_port;

-- 
2.45.2


