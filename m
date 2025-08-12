Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70A4CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=; b=ywbQqFQB5gKXbIW1EUJCN62wbP
	nkAgdEhP19756TmCpMECP3ljMa7AhuE5E7g8i5Cj40bt2oHXxiiX8JRps6iAhI9r3iUjA65WhAKq7
	4KH6GAkX9ya5e2Mbtz+M3VMGX9ATfSsVxbzF4cWjRA1KdAs5bHOHp8okmp9uIK80hqRscS5fBole4
	sdckWoh++GzSkSCo/zSC19VbKORzZmML2bX8prZxbfylmYG02Az1zvfVuTaCRTGLBnZNFmJ/MLMVA
	ku4qO3kovYaC+CLIuou9U9v2+8flrS8cRZUEvrqKv34LdgzYQlm+pWBm8YyTcHkI/rlgdAwStCqbt
	rafK5/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq7-0000000BZTO-49gw;
	Tue, 12 Aug 2025 17:31:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnsE-0000000Af2O-0myc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:13:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45a12b3f4b3so3880525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000781; x=1755605581; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=ihp+Ufun4jwLCGAprd29DAPjZqGyQC9L9YTCQCa/Cwc0wspxeFHUClfgDQP1hYE+tn
         DRXIgifSPkgkhqMZ72ypi5GFP7zQDoJLtTp9NL/AuEeH6mzh08OeqVilrh0o9H8tcr/V
         O3qMvy7FY0CbmF4FPcWNdtvxKmBWc/K1ijjGyXd/B7o30QR0yI4eQZb/SMzYulzOsyNo
         NhpKytS7mDS2JUsmKa7pXvYGxC9Sw+OkQZ4C9uT0atg/4TK0Rdyz1J3pzQTtTonwUSzc
         exGR1+fCea5Ai6yVwlDhR8OUh1Dpx9f6HS/SqHy4sgS8cOSLmAofvFWIO4vO4ELSY1FG
         1CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000781; x=1755605581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=ehW41K57ntJ4Mi2PYdB/fatI2YHFvKclR8FOP4XNpU4NhWIwQAUSQDp+HXjbAEUv9T
         Q7FZlYNFQm8hoErVmHw2UbVr0+KTmqKOmfLubhz/SKjv+0sY1gqjEi5T/h4SwOHsdeaO
         d2xQxu9RQAwGLjvIMevf7gxOwHJEBTsJ8pATAWH3dRiDqh+lqJj5wgvPHNbPvjT40yHn
         0H23F2NlfcbLa9wI4UQJDIXL8v6EW1TZd8vvQZlExmSsO9GfdTaIc7G5lKiKm7fttA3v
         XqyU0o9JnkUH3xuiB5TM4WH/VGn+YatDI6HMSsnIC+i/zXSuPpkHdg5Mo/4U275SgA45
         E9hg==
X-Forwarded-Encrypted: i=1; AJvYcCVzdC8TBuQLIf5+IthmRGDJYUGMdUU4WMKv9VGdsOx/Uij0S29i9NV8QW1ZJ5ujbuFeaQgTNWAb1anyZHNFbN4g@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa4sC1d0rXF10js1YU2Lmcx1aVxpI7/QfQISSGr4xBz0rcA6TA
	pBEfvSV6OxCXa+lai5ZEKbjRjhuWLPos63i1oJZq4eQAozfbCeRXDf1bJKl+yEOTKjftKUwcJ51
	MUl4L
X-Gm-Gg: ASbGnctsjgBYr6PEfxSJcsQK8ZuSiQeozTpjxCZ2K/rd48N4yG4tjQ+8y2mgOZCoWXV
	XefWcEcSaqE25WQaN+lwbo6i2K31KewJW1IGTLbOJ40mpXTKO8XhUkWKOMlTvNB0vr+LkCyh1AA
	g55TZRzvKwJqpnSOnvO+lU5QMSYktsXTKQszFLXChOo/OF6RygTWSQ8oBJ7zHYixSoTajdCMEs0
	E2LHrj5+dy3sYFBBnnys1XenBpKVhTMAgKS1KFd41nTGBlKGHavYTZiuo5s1kywsInaKtNfE5JY
	xk4auB20RQhHW6UydVwd5SmymYjTZg3zd/P2rv3ShdDZFMBX/7nyE5129d3uOvYSIF2u5Qb3e14
	T4YyWGtc13EElbNLKe3aCqvdAzw==
X-Google-Smtp-Source: AGHT+IHw5CvbsO/+//TLW6vU07wlWKt9OhY4KdTCKw7kDY2ouaD3KJYhB2udEhSB6VhDjWhTy/BT9Q==
X-Received: by 2002:a05:600c:1990:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-45a10ba2e85mr33107135e9.13.1755000778093;
        Tue, 12 Aug 2025 05:12:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:48 +0200
Subject: [PATCH RESEND 06/14] gpio: ts4800: use dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-6-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JVVbThM9xH2PXWbYe03tJE2jElHw1ibdCVrW+ltAkLs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/Ad2G9sZS7ICkDDEmkSScMmuRpmIarjRSCw
 eKwaldFODaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwAAKCRARpy6gFHHX
 clpND/9QxoBvO0B43u50QTACc0vPVPlKp7dDSnRaclDKK3ELzWruFYW8rtT4Cvlp1QD55NMx719
 E9hj4fAwjGxzRv7Wz0wwUxNEJT+7WJ1QV5s2DyrhCHV1+IRlaMZlKjiMD61TPnsjLfcsoCFgtf+
 6LjOV1z01yD+PWAcWOovSa5YWyGLZQctaw8lk9Ydjzx9jBNk2Vg3A5/vSRKBku7wmAN0MqGiuwr
 N/V30Kot2L8bzhXMNK4nDSleMacFwg0cId2n5uP6J7Cf0SWpXLiUb1bi9VsCsZlg9M0PUw3rcFl
 Q7avGt9kvozTD6gW+YZlfHahh4i2onXR+XqeRdZiBj3ii+VsbitUAiuvxQl1X1FSYid+lOEfcnE
 LUGXDUYikA21nTJ51OaEOV/R4K3qWc6sQTKZ1xa9t9iPsTbmjjo9e+CSZrZm8Vxi+uk5O9rkJVx
 ECkv6/yD5quCYmO5wJQbrkM08Cp0dCy5mTs8KeUQpThjjjV4BLNbQ0FGx+shWVkxm8k8dN76Z/b
 hTvsLHH3djOh93GTG++z3iGu64PSLsfu42+yHsjRZ0ri3VhUXFTMZ9SyoB2JsEUg5UzVb5TS6X1
 YHjNtd9MX4WPXB3FoLh7QF/QCG7xvRD0UObXXTBlHi1RAEn8lCNpjJdbMDtP54hRGBJAovrPYXm
 6X5bGIpXpA5cxAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051302_221042_14CDCC44 
X-CRM114-Status: GOOD (  11.67  )
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

Use dev_err_probe() where applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index f4ae87325393c909c66eda3bb7b2f849e645b7a4..cb3eeeb1e9df9aa687e880b16f8d0a31b04a3b07 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -40,10 +40,8 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
 			    base_addr + OUTPUT_REG_OFFSET, NULL,
 			    base_addr + DIRECTION_REG_OFFSET, NULL, 0);
-	if (retval) {
-		dev_err(&pdev->dev, "bgpio_init failed\n");
-		return retval;
-	}
+	if (retval)
+		return dev_err_probe(dev, retval, "bgpio_init failed\n");
 
 	chip->ngpio = ngpios;
 

-- 
2.48.1


