Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FCDC7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=; b=DRtMYiRTbiH/tFKYGc1W7m3Wx/
	qnKZaI2AT/z47ck8NZTM1cizcFt97YMl7MUEbur2QRIeRoWMSNDKllCONSTL4X8W41hkv0gtSX0eF
	BJa0Akdk8xlAp6jP3jvY2lO8xxCuamVLPDUidxj1WOXXOjWyxrXI6H+RWeHdgVgTW3iAV6g427hO6
	mAw40b3DdLNcIqwW1D1Jrrn3f4dxw058HqpZNY7eNWwyFKt2HHoxsNZ/akCHzR6NUV/P8u2YVJDfq
	HBm9FJ4kzoMqcU5lODQbaC0y2vphIAuwWESD/qcTmuK0LGb41igBt31NI+zxcSahlLE6m8q1ULNSQ
	dO4cm0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB9q-0000000CXcv-0awg;
	Thu, 19 Jun 2025 09:02:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiE-0000000CRIh-1mLf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 08:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=; b=STH2ZwI2W5ZZenf44OeMCGHcYt
	3lxze/8sTvSblRNZthsPVglWjr8tQVDNXa8DTtvOjYwClhxq6Jglg8Ht1f6RlDMVRNWO3cjQB1KKn
	/OojdvFxFhnrer4YQCvjot3ll8lrs6BVm+0qF0EMEaRwOhXAwiqaGV3NdSzeNzz/ve49YCwICcJtp
	2UfLZ33cUv0WB3RJrqZpngl/3Kbm9CdcAXQDd/KHTaln+5pA3QrJVN/Zc+rmL8satFeNfFzSxUqaQ
	bHK/djavWbJepKa0n2qm3IyvV+90ygwKPQTm2L3aAJZD/4hDwgaZYeIZp8rrVDthUPHW9M32bTdRD
	OTZIERcQ==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiC-00000004Noe-0Jjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a5123c1533so237920f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322010; x=1750926810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=onj9jTbfRWcEQj1pFYS/Cc5lAfNtqFGbd1xwyQcrkg7IGmB//Zlvb2qit6S/K0p97I
         /bydmcqWAlpViFXqvzrj5E6n3y9Ut7D5AwtbTmT4xL35vXAEYy210V1GtyQT1UJpFLfY
         zXag6i2uImUDGCMLdqNFNarD01Wfx/U6mIfbK7gyGAOe0II/lOH5qWvl/SdsWGLEIhBF
         lXKQoubw6Jz0W3X7CXQa5/hRpW6uTiCTWoqCGwA7ytmzZ7lO3v9byA7rHvjVw0NQ/0yD
         px296R9FiP1wVpv9+P1clX5tDHznt1K6emxy9FwR9mNykIGYksHFBgd4ZZkhH/qTnvvv
         BVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322010; x=1750926810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYBRyPsDGU996dnyWDGUWt7Y308dv2asqUkMv7/NV4k=;
        b=orFqDCG7umzkzBmHIMGB6KD1wsn2pcGvNi13dMuQIuL8BTfpSsTLpL3ulbj8/fGnof
         m0X+r4KUQ98K7XMk0pqKdzXjjrjfHfvc/G/nF1h5mfOgsDg1CkUZokx9f1mFFF9ai/gb
         giANGOzKyNOUegSUG6CjYgTboyxkC2NSIhwcdnAWli7MZmiQ+SnS7LOtH//cwRujjowq
         g43PxxOXKlvaco584hdCjB5/5PYuL4IjXzFB+9hkBGgWGBjHTaAtohSNX/nnmIO4Jf5P
         glmS6igND4FeNQ+02+fZDDbfgjblR73R831Xr+dsFeQg9Vjm8kdq49HkVct2uiO9kAD1
         pmTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDvAvr48z0tzSMRd89c1KD3N5ytLxKl9FjwBefArT7qPA3b4is6Y8/zoUG+xex3Jm8kfW/ocFyb/YP6oQ7iq68@lists.infradead.org
X-Gm-Message-State: AOJu0YxKwKfAQVt2blc1JxaFvhZfKW6LXaaFSRCUvDcjLu7qL8pYyrP1
	d/oNWpL0lE9PEOFSspObR1jL0mtr4UcuF0u0ICac/Ixrqro1meIxj4cwHf78LLC7Pus=
X-Gm-Gg: ASbGncvK689vempp0FjHWA1u+JJ48+J1QK49CjDz1szVvYEKUPfPKUiykNPgtozPSwc
	diWdXVSy1cbBbQUuSb0/SYKSS77DUU/Jy5yCFL5kUPJijYw3gFYtF8DSx29HVZPG0QKDdMil9Fw
	GBJD23++6aZAKdgq59TQOVpcFNR9s5O88+W48BEnIsmblUPDtZoocVQoSPvMHSTSAcyyOeQgF6s
	zSzk2Jbuv34u7EIXtVGxy7eW6RWWsz06xp8wQtn6RbDDyq+3LQz3dni/BQA7dPtGLaZPJBGYWNq
	MMGRZeFrzZ3fnhnxVz1SFrsezLnaJP8tbE+h5nhpjO6Yce9uJNwuCAbmbLyynuJRg4U=
X-Google-Smtp-Source: AGHT+IEr0cQ3t4TpkTGvuVjGq7cZO5AQ6BZfBJ0TBysup1ZbbPr4xJbOqOBjen/dHiRJRCL3wPVhbA==
X-Received: by 2002:a05:6000:25f9:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a572e9a4a5mr15722608f8f.53.1750322009911;
        Thu, 19 Jun 2025 01:33:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:17 +0200
Subject: [PATCH v2 04/12] gpio: pl061: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-4-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRgkTy/UGYoAUmJiupC/RZztmRVGafnrAkg
 DK/05i+a6CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 cnO5EACetBLUgnxHHE9jFOzifG/ThcrCv2NXqdEgAKT3Y5Vy7gTAQa9+76iIHz6/1YKVhIqBc8v
 VC9froCuMPH3X3wFZZ0j7qu3QM3lsGd6ZHQjMxwaKEYMK2dj/tPdMULBW/2meqofEw6L8ruo9K1
 KlTutcobE1KjZ576wI0Eb3no+rxcKiOw8lESyoxR6YqA2oQ9lPtNO7HZAboqGg9IORRpLBT2FzH
 mI39kRMp0Wkd2cMdsPbQRmVgNjtPrqCUpzCZReVR1JQuW5YZ8YAk0gB9foxpkPRPNz6HYqgEZT1
 kr9fDu3aUqpt6y8vP4iKtzPpj+ilsyCVFqe/2STYbwkhtYE393F1GOa2BpW6xBvQg0bxEeXm6yp
 QIZ8qzI9+FpX/6EZYWBeHFRhddA6K92F0EgjXP1MkBdCGB6I9pxm/5sGSOsH4sVNDVVmq2dUvqi
 FnElD2iPkDLGaH7QxmbmcuLFBMgGmJdIEjDVZQSY4MDDhA99yiqiQKdtvqHP0vgAYtZ0syLQTIs
 NmPcMRd4jOXZ8OxShxyr/oXyYY7H0Mk60UBAQiUb2XQ1ASEY81pagI+54BCYqW8eMPdf+4PtUPf
 EEoLDdOq/+VJ3kDxQr3C5KU1pxKPudgdhDjEZiEbK/I8HN6IkDYHov6F0Hb0u6P4HKt701hZl3n
 K8gv+VNOpIv6MiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_093332_240414_C013945F 
X-CRM114-Status: GOOD (  13.31  )
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


