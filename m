Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8859ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=; b=VnBN+GPD2lMaVsY0rRdBy4S3FG
	z7GUDJZ4XlH3Vzefdk9TUKw9ldgqkxVcu+gVXNRVgv97/S34PAAtldRJ1Nfqv0F14UFY/VZ70oqV6
	uE9ikuLt0ZzlNjFuInhZOYIULOFRHNeXFrPMllhjEuIVE2oYqO8PGiU4UmySFRjZUNOJzyWAJvfGd
	UYDU/ZPiIn4le+TQUfah5LRq3xCJOIt6G0J26khbD1lEnMSN+vrp+139taciE5SHMPSC1O31QKv/G
	NE3Yh89ZRZLLnPLIgY7cQ/RQmNLIpWKyor4x9I46HyzV8AepKmevjXs/3w38EatyMyZyYwn0FJTyM
	ZQyTBBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaE-00000007n5l-1nrD;
	Mon, 25 Aug 2025 11:41:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTos-00000007YBV-36WT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:48:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3c79f0a606fso1011293f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115333; x=1756720133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=wAxeMlMuRjdZhqsqOye2Mal5cwd43GQc96+fGrVTF4R5j1n8VcUhaI/Q8pPHnWtEps
         eJ9vtGsqZwIDQ8Ph+gWYTsuRF1I13YsPyLU5e7u6qVM5JwjItO+Z0X9DVLzlZVB5Jn85
         rJVzr73BG8TOk6nP5XXIpqvd0QGyHmQLwFUz3qUVYWeG4SSrAnuXOuzlVuBwq5vCNT8v
         OcTE/DSnSp2y809id2PQEIkThDDhzwxng7xjisqpL/ucg5ppG6UNDeJc0cjhxRo93VHV
         9Ww+wO548EctPIEhFaxwK1Zh6RNQ6ddpKITP38yjEGpfqSJaIxKGP7h/BE5zBl39OnJy
         Ehyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115333; x=1756720133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=fQ4unsvmPMBezROqwXxof2OPGbXhukvLvlf58Xi1VEaAVTUkHUANVCDa9WaalmrhTE
         A9tDtqvywnIJHsWD68e0IEcxLkhX9Z+WOSI9o4a9X5YPVZFqgwV1ao6PWsH3ukqtij6m
         V4u8N8ZKpudat7AzHTjfPtfgobF5qPlIbRKWGgsWvksjb/Xr4QnwFYFojQdsKbCnDdF3
         Kz/tiypsfwc6ct5elGMKLuBIraGZVvvM0VCl3JYpJo9Q09jbQTSGbvhxdwZrQBbyyfbQ
         /0go7MVVwIPjq4Yt8+U8umxCTBfm6peJhpm5umigyBvH+27Ub+bjOYsJ51lDtMSLoAQM
         72Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXSICKE8iwX0pztjCM4XH8AXCFTR6oLP82UdqghavrBwiFCBmO/LKUV2NI/qAYQ/u6JeUnOkNTk+YGKbu98h1ki@lists.infradead.org
X-Gm-Message-State: AOJu0YzPeKvh8MZ56HGtSj13A7a4uTrVy871+nahJjtKhJKE8EDugilh
	kBo/xunAnpQR7Vfv1bzp9xzI59MDMzDV6wXNbs280HXE6QhsSL9Ipb6y0xRPVf8utP4=
X-Gm-Gg: ASbGncv70zaXtoFYcW/tyAt5cunIymqLRauGwTLSLEoC4oyyjdLtFbLVmBciACLC3EC
	UUIpewxwmGnogImyJw4adaomnwf1K/2mGeYDV33CvGN3JCKSxMWiVvsFofZOd+q2p743GyMnJDn
	BrlXuesEPdM/QRYUYoD5UhggikK1tefm6mFqlqiZ0X6n+9WlI7pFQu0gGMAcbsKGqcYhcr3tWzq
	TK977U8bE8CV+edH9NT5K0WF0TBYEAqIs2HX9DWA61oU0XwqtzF5myybyFFCRaqteRDDeyANXhk
	N3O5yf2OAw0+9f4kbHAY8XRiC/INiAPaXeYFN9B925WdOXec5XwQQGD5rx0YakItNu8bt2FM4Ft
	FnR/OEHdffl9Z4OFtQIaQr1G1teXs
X-Google-Smtp-Source: AGHT+IEzPBRol6ngRIiwBwafEdbjwrW6XPSWfLq8zxY1VDXJdLBaFNn9Mck8nqFBhHeSS6beuJE3Yg==
X-Received: by 2002:a5d:5f96:0:b0:3ca:10aa:ea82 with SMTP id ffacd0b85a97d-3ca10aaf4c9mr1072885f8f.13.1756115333081;
        Mon, 25 Aug 2025 02:48:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:44 +0200
Subject: [PATCH RESEND 03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-3-356b4b1d5110@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LGZlUs6AQDs8ng5Nn7ommqnFHh3w6/vhUJqzq5JniBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF++jCG//VSmX9rtXyjEtDWZYRz4QSoScANu
 IK+WVARy/SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 cnBED/4wgp55EodYkNBwqOjqiRN9M99fAcanaozgJqRlQ6HPSTZm65M8r55yUsHnL3eaalhzCkY
 q5x5HujE/m+jFPnJh62GmPp+Efs62oOw9MJvF04gW+M9yKCEPBZjOUOnQXpVrlSm1GslyqhpAj5
 Jt9k8/5wWjYUbKIwt343yCHgNbYwm9UCGp9oWeH3faWThhxe3KDZtRi9iU+BLmFtqz5h1CEY/4M
 tUFXNsPpwioCRKDCAu+nsnaeIP3tIt+Ez07yyDerqF74fK0TIB6cjn+Tv+8KCz9Byf1bzTZcbEg
 ZUNPrmRJtfkv9q5DBkSB7Cfj6o7EhjvuTG7hEzcxx0zTJ13CEF/yD+VpxnI6V7T1gRrK0xRy0um
 zjiudnsQRpqzkvjQ9pbBSAmR7GbieSo7K8Hq01YZij2Hc0UleRJxWq5Bcvt78abclVn9Mh26hJ9
 T/Ykt3NKI4F1IcfLrTJHlAhkYO4wHmVw2g78JF/BPXhMzHR6rgn76f+tERkHRUSPLPVSsNG4efs
 qOSYjv/xO39rLGb4UKDJei9qCw7ssl2tez4WYUWOORldfzUShAw+dkbUwjsWXd4PXSpO3P1BeQd
 SeeCebsxhkQlIFAQk8aJODB3ZgOmvWZ1SsCAdOCPDXHhn9fs9Vb2sGIYPRGsc8STeDPjLIXgPE/
 yyaad6906fNYAww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024854_790261_B9BC459E 
X-CRM114-Status: GOOD (  13.32  )
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

There's no reason for this driver to touch the gpio-mmio internals, we
have a dedicated flag passed to bgpio_init() indicating to the module
that the DIR register is unreadable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hisi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index ef5cc654a24e2327510b872563e68fb0b9aaef71..6016e6f0ed0fb80ea670ebb575452d9ec23976fa 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -295,7 +295,7 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-			 BGPIOF_NO_SET_ON_INPUT);
+			 BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR);
 	if (ret) {
 		dev_err(dev, "failed to init, ret = %d\n", ret);
 		return ret;
@@ -303,7 +303,6 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->chip.set_config = hisi_gpio_set_config;
 	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
-	hisi_gpio->chip.bgpio_dir_unreadable = 1;
 	hisi_gpio->chip.base = -1;
 
 	if (hisi_gpio->irq > 0)

-- 
2.48.1


