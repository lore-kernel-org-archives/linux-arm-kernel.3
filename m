Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DCECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=; b=hRgJNZ2tcY4kLIt5BUu4kWeTWl
	dJOqOukTRXjcJTXUJaqbgMSNfV8M3RFf/2R1a06bP/Yq1ruf2vHmEpC3IYORkM6nYzmKj2IR8RAAh
	IFwyDmcDNg9TrzR+iwEAV06O0DeOBvrAE8ZOpUW1iys9LtSgGqyvDTHM3LE356ls8F5cnvii3avmj
	X3jOtZc8yK/jfUiK1dh+5EjuZt9cMppKNybwSc6wwppBXfWL9gG4MgG1CA1fn4XDJmTn/XzuwqS6L
	qs0uKF6cXutf4MMqeKoJBlUDabF3hzNZVB8GrJSSSa/2J3jGh76LIDutwEN1cPvDMtUr4vXviam5+
	oFvJdSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaF-00000007n6t-38lJ;
	Mon, 25 Aug 2025 11:41:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTou-00000007YDd-3YoY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:48:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3c7aa4ce823so921078f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115335; x=1756720135; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=vaboA/Pp2/iN7mUMPfJyByYnsPrwt0OkPTBfbD+SO5FBhK9OEKRAcESPouOZGkbyeJ
         O9+EPLxXk6G+3ijlLcMOCdBQp91plo5LJE7nfABP/eq19+3QVlE5S6wfA6YYvHsqf2zA
         h1uVwIZUrBKD2MVhqzyRTWte1Zfkc77guky3azrB77wfxlH9E10/Lj0O9iIsKh+dJAEq
         JFCirOpZ8WJKKhxlHCrYGeCY6TfM4HRZVRNxAvkT5+anU/8fYwN4M3aMMmHW2THsKgcf
         4IjsrLrEX/ZGQCB+fqW/C9nGrfwfFrX4MrFvAdxDTmHtyHM84RI/FqwBhnKylbO0HGOD
         7ERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115335; x=1756720135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=czTgezbP2F9E/gzu+gOnURcncfdqqMM7tv63h+4uqcALawdKrAWkpPRw9j1KLEaEhz
         p3vRKxgRuGdGhh54WIPxZ9Q8+2GTdpbSbhAyelPb0NRPLB5iKzB/GOPTXiqdNJB4ugG7
         oDbPDymvl9nDS6xswHlBX8tuzZY4LvvNNLHFALcX99dwvNqHYxwD8tUgHv/PhLHYQM3l
         b0HS2J79EP74eX8CWWnsGb9QksHx8ADfcLthdC7eR+HA6oRq4Vk15TLXuqleyJ90jBJL
         Yv5zBQgRTrNOOgvP5FN8xGmRFBJEiHwzeE6QKa+g/koJOK5CiccKdOGLjs9/kGzdu3YF
         ZQbw==
X-Forwarded-Encrypted: i=1; AJvYcCXumCErlyqV7Emb7vfSXNMJdF6DErYFD/WsGGO+JJbfo+67K596eLOKYLwIy5d3oHwx9tgJjJVCbQlV1+/HoqUl@lists.infradead.org
X-Gm-Message-State: AOJu0Yziws9Mb4iJDXBfRYXHS/p/+rtFk/jLziedoQ35VVnZ569imscu
	ua9FLedJDx1UvqcV1wJMk8XvO4d9cyJ0I3rHrD4Qkyt1sWO5DI85lja4DyzYP5Y1Wk4=
X-Gm-Gg: ASbGnctjyTr9iZEJyt7uCTndg04VFyt76/9+621+cJUzoPduuNOoc/FShT0iZeDHobq
	/qg3ChZEU4cJyLQjJibQGU6yhSmYgt/k1JebOKvsTIc2NaG/GcnuCAA8xBHxk50Z5azuj8Jm5oH
	ktg6/FeY/2yKMSglYcfwCBmvuI32OP0Iv1BIJ71R/Y66mRgduJUeZZLOxBAY3bKyercCrqwx76f
	OUqU7Cz4DXMdYJM31lRW0R2zC1cK6kHXioAVP2FpPxfs8Erufmw0ePX4UcB4K+QAdZG9l/ZVKvT
	NTxVCmT12GPMnkNiNGASnyTwRA5uycATxw0SyiiGInFg8qq0NmktIueTh7j6lT4WlyaBdX0kUHK
	9gcFRq9kr1VYF70sJl7F561nMw9v+
X-Google-Smtp-Source: AGHT+IFbF1QkRyFdeFIpemljyVtx1j4nGrxdAWd7UTjvbIZ/NucsIqQcYHn9FKmS3KUU/3Oc/4PNpg==
X-Received: by 2002:a5d:5f44:0:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3c5dcdfabccmr8075233f8f.48.1756115335456;
        Mon, 25 Aug 2025 02:48:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:46 +0200
Subject: [PATCH RESEND 05/14] gpio: ts4800: use generic device properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-5-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nK9pJAlcVqEpACXDhaB9m0pP1KYR56NEQPbKtHUMK9c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF+zSvsNgnA4MkSV214FMk4hgTfqPRZk/vzh
 JSKtylhcNCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 chIpD/wODQ6RNrQ10R5exK6P3KwuVo4VF97VRbQIzI1f+A3TIWDad/BmeS36AyNp4PwuRlJMngB
 6mJjEWXcBfghlW9QAkHy9WMA/4Q8SaJ4KiDclJ5MzJUcJlzmtwiIHBlD0/MZWneUYbuHYFL//vk
 5n/yTd52sg3WX/EN6FM8eQ3quntJ3iWRcm86AXUTkEQDu1StFteUN9bbgC4AooFBvf9W/tyUhmy
 AxBDLI8N2GVwrTXbzuSyQHK+lgpFd5eAOUAu/8nzM81wIYyhYl+dc14rbs/GrN6Y0MEsdVfqPlD
 MUIsrMEkb4zEyOwFPouMX0fsxJzDxAjZMRH9+D88u6O3s3xGckD7++1W2RvQQmiLGxSBjn2hArD
 Rok/kMi0DZmgIbzMACspy6cYCLVvuyROJdWWmqtiCwzG8xnk76qjUq6xacuWbrF/aetGfDsi/8y
 XsBLHSxCWYkct+BjW0f7s7whUn5jLdMlFvZ2vrkjX5I/6HtSJPL5G5IqooATzbdiEG7VcF49VvN
 2iExbHcR5HkWTn02XrtoxBNBhIGnYSGT2q/K5f22PoLADna2Nt8r7FvJVJWICNfFF+RuHqSdj/q
 rzspBevqVhg8+l5TIY46YAe9YJ3UZ9fJpQcGu9smfxNXqeZwdLIg/U78tuOh9PuPro8joDK9ddk
 GSMH+QtpLGoLslQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024856_899423_9CA6123B 
X-CRM114-Status: GOOD (  14.24  )
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

Avoid pulling in linux/of.h by using the generic device properties.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 86f7947ca9b2d23292c1e6660fe93c611e0cb837..f4ae87325393c909c66eda3bb7b2f849e645b7a4 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -7,8 +7,8 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEFAULT_PIN_NUMBER      16
 #define INPUT_REG_OFFSET        0x00
@@ -17,7 +17,7 @@
 
 static int ts4800_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *node;
+	struct device *dev = &pdev->dev;
 	struct gpio_chip *chip;
 	void __iomem *base_addr;
 	int retval;
@@ -31,11 +31,7 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(base_addr))
 		return PTR_ERR(base_addr);
 
-	node = pdev->dev.of_node;
-	if (!node)
-		return -EINVAL;
-
-	retval = of_property_read_u32(node, "ngpios", &ngpios);
+	retval = device_property_read_u32(dev, "ngpios", &ngpios);
 	if (retval == -EINVAL)
 		ngpios = DEFAULT_PIN_NUMBER;
 	else if (retval)

-- 
2.48.1


