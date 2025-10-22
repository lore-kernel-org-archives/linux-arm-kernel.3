Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64E6CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIoKmjIInajLiemN3aTwTX5GXSgnREsQmJKoJ1Pkspk=; b=wKuVXoMzJ4WRqZvd/aFmdIPN7T
	dLrRKm7F+dx/0viiyBijkREtSs4AL85+VnerLnp8124kWnuYrEcdmwOrrDkvmiQkgVyQ2CzuW0eog
	ssJtc7U9ddl5busp+cd/OGCZy7DOjNDtMpLalAcZKINkaUsh0gBIm7XaXG5z/9GZrtSxmiu/iG8S2
	AXErW8IxJUHp/Kob2Tg/bLPshd2y4H+EZ6yPBFQ2cG3RKw82b4Nd66qLPpYugfuvAJWqQ8fWK9NV9
	VIi8zG83iUF+TXzwYPeRs1AbGfCBrPCsDPEMLiTGBGhqO0ltpn5LYtRR4H1nnYS1c9aUSwr8gG6UM
	PkPBAlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcs-00000002wOw-0QuC;
	Wed, 22 Oct 2025 13:11:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcg-00000002wE9-0nxr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:11:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47112a73785so52375755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138682; x=1761743482; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIoKmjIInajLiemN3aTwTX5GXSgnREsQmJKoJ1Pkspk=;
        b=zeHEUF/WQiiXpDRjy8xzFKvelyAQaiQX8FLsd+R6Y37s2SdwQgT0ETZqpXliVULFNw
         NqA4EVrPHB0v9W2TwDday/sCvi2Opapo+NPN7DpfJq6venvq5msRzTTOrt3jGrd87NuR
         WGg2hakBzks2TPY7icHjQOxtfqc87jB/n4QZ3hGjEw6kS+vC/wzKVihMH8AoehWDeZon
         hYINCKMmGPDPhXnOzupRZz+9kYQfVaH4m6sTZFBGPiqCwGfrIKF9C7Dw9genSgjYDQ/u
         7VtNfUpgEbo5RqMKnDugnFKM8kS4O7GoWuboj/duEhJBemcuLpbOrjPbCnj04GOMLtLC
         4rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138682; x=1761743482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIoKmjIInajLiemN3aTwTX5GXSgnREsQmJKoJ1Pkspk=;
        b=DeVhybWhVIRc/Z0PezEtVW9s7nUG+KgDdkf3Qdd5/8f0YGD9PJ/z79XZOOvQCuviIp
         WqO7EkNSk7bqkMQ6Hwnj3gSdIU0X6EDlXLG7Z4JNbwFM6b80aR1CBrpfubF4U1bHYdyw
         W4ysz9zKoq7YBx0WvCaE+NGwGuW/i25AqyP90/P+OjtUIrs54YIRPGHTHqUx2NvqrR+C
         iCX3kqTd7ugyBJLANs+Ekqxm82rxk3WLwp05D2ct0HlOZ/K8lgDLBABtlowzQhCrFEyR
         tk9X/vSr+l6AbaLzr+Z4z1Z+n8FN17HFCE/NCbt9y2kI8RVhu5ewiJYBIEkOjAZDuyDf
         yn6g==
X-Forwarded-Encrypted: i=1; AJvYcCV2FtuLWp14/GTC1ho+FlaJH+l8YR2HiVNZuBsoWVeJom5YCcVS+/pz2AOxBm8nPkqNk8GN930iCnw8ingKexyX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/kfZsNevlPA8ZwE1jRqvHUgJur7gjeOpL+4GBfDOaqVxrtUVi
	0UaBIKwyZIbgmYtJG2/K1ySoGypv3NYUk1IUESwtNF52FM4vrrZNJ5MXZrCaj49Imcc=
X-Gm-Gg: ASbGncuHS30r1MTsW+Qs047f4rNLafrFgnwZDkQEUwpj8awLMeJNicK0BqvM7C99Gei
	74w00ugGEeeSKoavW4bkcPJSczcGiSPd0R7BOHB08f8JiV0LEnogxevjdkMcn01F2BXRQAc831d
	AqC4h3XPgk+ekKK9QRw+MG3GaioRsDEmL0BkODYj4ingi/I6MCBEw9/2YtQoNp8EIcYeeS0172R
	/AyJP/CV6kYgGPFoYu6OnqBwq0QFqG3hEbJGEDVm9OuqiTGq7YDbxumpsDoY64q7zWygDXWLnQK
	s/hCmhREK/SCWrbbmjYmg9jdxhkCCGNLIkGRfXkJLrGlUmbqXUTPuBGG5Hganj8wxeDpDQi9erJ
	DGlQhPP+oS8Lx8M++iV0SHAR4iecuKc3yh4Z+EI75pd5bRblrQV/up7xSqbcd6d4mx8xLNd395f
	kV+5ur/w==
X-Google-Smtp-Source: AGHT+IGkIuCyg+IuvK9C8PoKW8hm0lv3AC2LKI6qqGW0oK7q5GOxpXH1DI2XWiXLmBBfGx1o6tVduA==
X-Received: by 2002:a05:600c:3b8d:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-4711791c8d3mr166553265e9.30.1761138682075;
        Wed, 22 Oct 2025 06:11:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:49 +0200
Subject: [PATCH v2 10/10] regulator: make the subsystem aware of shared
 GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-10-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=p+y5IQEHjJOnxni5Zye5YZtGuUrzZOARpYGAZB998dI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+Nfe/WgJn3MUlv6tip0kIveOZg897ohp1tW6c
 islxAr8UxuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 ckM8D/9Wzn/ftmZoRgjjTg5RZ1xRGR72VM20yOSyWEGtCSNeu4uUvBMNAdArlUONgpBYOFuCQ6f
 jxeo2x6+b3i0y/TKIIqp8XOebUFaChUTpW4V2aTOTzZvTL9CQWh7zsEHSztQvU9oHI+7XxP8KMW
 9CY/L3iA8HVGuidSKPr780WTf1ctlM73GpwS8DZHS/+4f9kx8503W6W622tEi7x+fNx7TMYJnE1
 8SkUCFoyxWoLyDmWJFr4Y9uXOrBzTTdTf0h6dGmUMoAVAYCQx90fRDcywibndcFyxTUs/XULCVl
 WcQzccUha2IfGjR+TpqQW/LtoW8xc7Vjig9winnhfWlIrLu0ddM0Xy3AjcWQGeiHoIGUGYy+vi8
 gbRAq4h6J5vlyLsZIgr+4Q+AgPz6xZtpNyVc8hSkFHVQITKHY+xY9gRPIaptn0fMtoCSE7WslZ+
 9d7gHhQrdmlUDrJI68PPaPDaWumjqblocdZYLUS3nxddlkaOEzremAVAmSg2BK6TDEIBagmde57
 lz3x7gKQp1EHI5GrfRSyIHKSkVKyTDnYFAumAYlYaVLc0UBrIvJPqQxUNkn2GGTWLOVC8qb/sgN
 +yauMt1Nu2ItKQTye6/6dBoSixx98QV5zlqOqM0MICJlNSyqWLbPU0uV/Xq2uI236ar5Lzwo/ie
 jAmXnk1wKw3Geaw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_061126_320314_537CFD2D 
X-CRM114-Status: GOOD (  15.35  )
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

GPIOLIB is now aware of shared GPIOs and - for platforms where access to
such pins is managed internally - we don't need to keep track of the
enable count.

Once all users in the kernel switch to using the new mechanism, we'll be
able to drop the internal counting of users from the regulator code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index dd7b10e768c06c83d2a4fb5dfd0fce8d796c9185..f9690f0689fda85123d07967f3c87105829e330c 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2616,6 +2616,13 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 
 	mutex_lock(&regulator_list_mutex);
 
+	if (gpiod_is_shared(gpiod))
+		/*
+		 * The sharing of this GPIO pin is managed internally by
+		 * GPIOLIB. We don't need to keep track of its enable count.
+		 */
+		goto skip_compare;
+
 	list_for_each_entry(pin, &regulator_ena_gpio_list, list) {
 		if (gpiod_is_equal(pin->gpiod, gpiod)) {
 			rdev_dbg(rdev, "GPIO is already used\n");
@@ -2628,6 +2635,7 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 		return -ENOMEM;
 	}
 
+skip_compare:
 	pin = new_pin;
 	new_pin = NULL;
 

-- 
2.48.1


