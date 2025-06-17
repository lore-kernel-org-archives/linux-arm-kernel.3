Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F800C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=; b=E70Di3syP7S1nKEp6LNjomfd0n
	FBlUnA/0MeTatDjpPVlxjo33TzAzh8CHvdHMbAiyQQjdDlTDv2u6PHJB7ZCD+80Fn5bcGWNJHEbPS
	FTZfmSaK92aLOS9DkstWU+6R7VO76kbKDeRT5T7Lll91VSLoiu4oereNvqyGZxt4fF3ZhevQuoyBI
	7m5d4AihLxeb6hvj1qOiymKFsuZvhg85Rkyp/S45Ih1bwZgmaqxu5Zsj/7l/g2M+3B1aDnSDI9wFl
	VEUxcsxrTbwPbOcFvqamFKczUPMIfjxAYU4bdVWjAuBO4YNgk/CxYNXkwZnSs2mJTmpnOLlgpFJVR
	PirYyAQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVpe-00000007Fbl-1jLQ;
	Tue, 17 Jun 2025 12:54:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVMt-00000007Axi-1hNw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:24:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-450ce671a08so35333145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163086; x=1750767886; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=Y6WTJG8qV4MdX4bVZBLQVgpDz2/kdcoj+Yc8uh9IiTo8I0N3uwI1H/JxjhGWua5F9H
         bleIXKlcjd10bvS5BcVYm/SMJj9zhD5jQ0u6e2gD7Azq6cds64NQD1krFPpePRkXATwe
         j9sIXRzUc8UKGBvF2/UroDPdK39ppYTITHUS1IMkY325+ztPGEXlyBtZyLC4m2bT7I3m
         XhGeZzWp1z+1/ybnYVv8JZ/ab4b0clY8Chz8Gyn5yG3ZPgwBrZmeoAa/Kq1jx2hdkzdZ
         FfBRdWD3sn3D6w968hwU52cXjbnN8UeAdnrG0anDCwGwh1xebJT67G0bbejXMyAnECDe
         i39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163086; x=1750767886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=IX9Pn6w8JNJavQXmj0n/yoCRv2V96bIdcPpAZo7wi7m/QKmq0kmJ8IZ+a/CUumOp1M
         jzD1THDoGk0G4CAy20VUHhaOylwO13q2odcUr0cxfWc0/wH/6LIlavq9HgVzbwqOnOx6
         dJKbdw9KT5eesuyVHrBWhCOboh1DlPOUak2yLUKlK5DJLVK/c4OAnQIhkm7nJKdZOs+2
         6kmzz4NFEvukuu0IE35xDQJV96zoo+6Z5eOiXfqcxMV9qPG4DY5CApgah0YsbuVnAVNW
         R7Zfn03aIO2ULbklRVOQpsEjFO3Tv7bLb7h1GI7J751mL/HlCSla8uJaNflhVxvu3jcR
         zXZA==
X-Forwarded-Encrypted: i=1; AJvYcCWd0ZCQEPNn0hQZuiXGlDBkhc/80aoGF8+8rhpIDvTiEeRrv6Hnqe0a+TDk4S+ZA4ZolbVL1CaaAcA93xsVoMI6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/3hhVeIP9W9O1fo2R3CAA0uUnHFXL9fQRctaaHnTM2IrllM2r
	xF0mIJ8nr8wlVcmIn5aphGle9JYpa2hYlJLTtxWcKv8A2ZM7tcKQSp5fSTi8Zo3hNuM=
X-Gm-Gg: ASbGncvU9x4RZNJuY7RC6KXiOTsP+MLYbdglxFT+t6YOnuL60OYfrBb0eJ3IpNi6FA3
	TQURWJIjj29mFctEEZJxr8mKSQopL3GAcaAi2vxfMnNCB6ZuZb1yYiE7NmTmTw+VhWlCsEoy3Rr
	6qVRJNizfl8OwDsZ/9/LALbrFZHg8F07ntmfhVp14ZKZHWIhdEnBqPLHBoL+XqiA6bFmSetQGFV
	5W9qUxHuO1NHk5js/HuLHrro3hMAQmLUY/yezZYTW/SGHlIqxj2iaJ1uCskRH+dcM3of6d0LEwf
	6BOSHhb8eC0x82PLaBKuD6umQ7TSu8qnWBG2NRYN6GOsMQpZvGDYxGas
X-Google-Smtp-Source: AGHT+IFEY3qQ+Fglb9jg1ZhkUiIqMjijlbm8dxytbSflltEzbMtmudgpYXUBSqKCL5VsPPsVFxCG2Q==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr117448275e9.29.1750163085919;
        Tue, 17 Jun 2025 05:24:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:26 +0200
Subject: [PATCH 04/12] gpio: pl061: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-4-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=a1x5aRsn4kpz4DTuXQ3tdXS/YzbAV4e8kj3b/qk6D/4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6GIgRCEm14nPNHr3CVnIwUGcS41bLz59WAs
 TXEwqwLAcCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehgAKCRARpy6gFHHX
 cs0dEADc+nUolHMR19/mMV5qvmdBmtTJhRhknvVpHeM0XbGqpCZ7wGj6z0n8OFOGOBrqIN3vXbi
 0ZGL9wl2G1YDE42b2BWtFDJSjYhKoMMjx9KePbUSulFNhC7pb1fAxR+N3v31drUQ2jUO8Q/ZVI9
 I2fdKO60nm0ExTLDeoJZfaQZoy7/3sTkNrVWW/9YtP/1hvw/QwqxGc3nq+BWozFQPcHoK7mOvew
 ldZBEzrS5qqC1a01nuQAgIEdB7DeeCvSo0EXDrrXutqcYNK2afxhfYZeUTriuhbXdp4qupp9err
 i0yEmM76PTVq5zfZD0xdQ4bKxH09NwMcaTZ4hwl0n3N8G1aFf76HGqY7INud5TBW/K2ana5kYb+
 wEBuCD+sOThcDNDSc8TwqvLXb22tImhUfaKKr8ULqAbPvCE5YWzH7SkPBabm5T0VSJIEm3ugyC+
 M37yUgz2E6jHwiJ04F9U4aZYLId1h/UfRoLZrOnSQNeCY2oyz2olOiCpwsH1Ctuxk6On6FQIXc/
 SOK95xbuw0JifvRteSfWF9wqQjzNDJ6Lf9VoPE0AF8HaieKhzHW5BoTbsDo8nWpazpjGr03WvA/
 DQjWBu7sHs0vgHmXxbyGw5kdDpzysV/vFPtzli1F3wl9G/irY+PTVBcR7sUbr1rmWTdNOmc7UzD
 sfNnPEFJzOHU+Aw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_052447_457432_B8BE51C2 
X-CRM114-Status: GOOD (  12.80  )
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
 drivers/gpio/gpio-pl061.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 1c273727ffa3ac54d0f1e66bd6efb784d2a8604e..98cfac4eac85295915b801a62d62c8d78f6cbc4a 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -115,11 +115,13 @@ static int pl061_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!readb(pl061->base + (BIT(offset + 2)));
 }
 
-static void pl061_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static int pl061_set_value(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
 	writeb(!!value << offset, pl061->base + (BIT(offset + 2)));
+
+	return 0;
 }
 
 static int pl061_irq_type(struct irq_data *d, unsigned trigger)
@@ -328,7 +330,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	pl061->gc.direction_input = pl061_direction_input;
 	pl061->gc.direction_output = pl061_direction_output;
 	pl061->gc.get = pl061_get_value;
-	pl061->gc.set = pl061_set_value;
+	pl061->gc.set_rv = pl061_set_value;
 	pl061->gc.ngpio = PL061_GPIO_NR;
 	pl061->gc.label = dev_name(dev);
 	pl061->gc.parent = dev;

-- 
2.48.1


