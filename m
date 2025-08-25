Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ABDCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2pDGvu2eB22QFjf1je4Uit6bFjIzrUYVwBKgpkRJ98=; b=3K976cbiQZe6uTkX2lfuSTCjPJ
	0sCWV5b8CURIH40wGt9qDtJCWneimptEAb9skLC+3pPD9OvikIUkLl2ciOPsT7zVSWf13rkJvlxX6
	gMCuDUFsmvWbzDceMBr9+8ea4mPc75m9eRA7wzWghtw8g52SjJFhnSCjx6bR6wwkYAIGyrEacndc/
	+y48S9myJYESRuSItermpciVTE5zC8ffXruqiDpUjLG3uARRm2F2sDH9cvlnhAA0rhgdrJOTTN+6W
	xMIQGvDUrRut2XYM4MIfav+aS0ur7DGVs1QDKX+5IjIYK3HKTDEn6F8nmG84RCJo6CQs1ee52Eq35
	n59jH3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaH-00000007n9C-1us3;
	Mon, 25 Aug 2025 11:41:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTow-00000007YFh-4B2x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:49:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso35488395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115338; x=1756720138; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2pDGvu2eB22QFjf1je4Uit6bFjIzrUYVwBKgpkRJ98=;
        b=hK5LToRUU35OfKn1qoiJOrK5uezRDnUfILnzgYN2rDLH3maeVWY6d7La3fo1y+cFDs
         STctQgOEpG0fPKeNTTc2SLgJb6rbSblGLM2eNB9bP+BAwMIzhX3gwJWmKyCmFlgKBXxi
         D1yXQPRo5mJmyeh32MK2A/RK1R1TFvIZ3qDieYoI5CZ5KYNHZNiQZXdUILTMpZ3OlBPc
         sP6cAB/gxwXJnoLRPykVQNZCm5+ysBU5l7EXxZ1D7azX5eTExd+nfgJKHZUvBt4VAves
         6zIgU4a9VhLPlG12MbEOoLBQyEEhDD689df+r2PgdIMuJoOxhSUuoF0uU2Qgf1RLbOqS
         SQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115338; x=1756720138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2pDGvu2eB22QFjf1je4Uit6bFjIzrUYVwBKgpkRJ98=;
        b=qy013sYIkfcgjztU9kN+zcyxq2hcsGcmiyfNNo72rDsqeETSIBreUxerws8XdATTfX
         GfGUQlXgvAt2Y27qMxJgIqN+y5y0cUj7p2sA6QuqQN2kHHSbG/VAZqN9PD2Z9Yx6446C
         ySvEQudORfguK3d/XhuB1v9nRi74XcvQw1yBKQAKw/5+eAuzhzbGrecNcymqHnbEmXaX
         5bvl2MRfwT3Sw69+fZrR56hi8yOLdKd9jvBJQq82pHi15H8wT5XfVIbkwwKngw2zbPud
         P8yRRNCQNToHCx31MYyDno0l8bQt/brpNzQIfBSCNzh/2xpe5OOY0sXqu2B+cq7h3lKo
         +rmA==
X-Forwarded-Encrypted: i=1; AJvYcCXsg/1ORq/CAvf7gn/3+uBRMIO+H9yPtYVLrWG/tZiE4qbZFL3GAFxVkobYFGa7GW/rW7BPKdxOF0o0fbUpvOnG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx65GVnBOE/rZlsQcPoME4LSxUT4xm0GCwy+CxGSrZ4RDwq6mNZ
	N9Cn/1xqlx8KXFyDalplbLHeeNXH92jvynpYRwYrHCj39z2LKbv0sQ/b140QabffIYwrA6NruIG
	/3YQl
X-Gm-Gg: ASbGncsbSiaVhNrwbFhOd01CSpq7kKAzEPDELWE3JB8snUX2kFIHyPOl+2nKisDuotW
	jSi5XLTgvenuJI0WdEoKH18ZG18vCVLINyFGidclBQJlsrH4WGq8FetT05sAiM3EaM4195YSUXN
	QWstnfiZzErGh1g0DcHxoqtsek2zzOjxdmiOA9gXR8oYDpOvwK+i+BoZZwlzDE53ic8L0/DxYEW
	QRKPWJeWcmRlkjLlt/G17hgZOhPk1KtYkDTtkuRZ9HmAfe3htiGncw7yAIlGEMFJuBNCT6p5X5Z
	4/2Wt4320B1PtJpQHbexYQOLnuXS2XNFFUWiswDV/MFIEvCOpeZlazrm884U1jfIqEcmSM04ePo
	64q8iMKT6zjb10sO/G69qJjdnMRra
X-Google-Smtp-Source: AGHT+IFYJoaiYNhbtO6y78gQmvYykaingiZAuZhD/t0MWXbkvRMK3wLcbpn1m/B1NP197mhw7oFTRw==
X-Received: by 2002:a05:600c:3b95:b0:456:1d93:4365 with SMTP id 5b1f17b1804b1-45b5179f29cmr95803915e9.5.1756115337600;
        Mon, 25 Aug 2025 02:48:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:48 +0200
Subject: [PATCH RESEND 07/14] gpio: ts4800: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2141;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zakPacry7z23T70PXyuXPcLNJS53LcxlBowKWXzkU5o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF+ExP6IhLOXMDPJawqEBFW9tKJ6dklXZLv6
 cu2Zbe9FoeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 ch3CD/90F4v0Q6F/uhejHJ1+b0K1bJg4j7+1Tcd4v/iFvHZLr6mGNfTQH1PHn5Z8P1jIqd3phc4
 /UIz1Z+Ah3EA8xKtwC2EgOLftASv0a3vfm8iduaZbnE2Cuo3V5ZCxMHKUJZm8lFAJeJBiOQbopu
 VDQHeX/KeJCLdrxfAzWjkGWNxUYIhdBTWimdYJZHDB4Jh0/AQebrakt6W95euQBn7RZUVydrWDr
 kEjcSWmDN8mqOFvEAD63+8nTe9dNL7KYFb8I2fPOb30w54jSmsaWnvjenNH6T2QyygioJtlYoa+
 zjDadKTpvOQxZ7g3Qlynab/3Oz0xn7tjbCgBigbcrKpV8sxNb94jSY/v5sqWh8q7KzY3MQHIjoT
 zcu6aamlj7SiqZol3sbS5lkPDDJCsLbheNx1/WGVCJbWm/IqfGhCnuAQlyYkGKlSmWzOiRwAT4x
 R8yCMC5M5yDN18uSIkf8X/JWGGNYXdG4m9FOlgBRSY5UBEMUOPAXna7v5kzUI6ka3sQtVfsOuyh
 CxiYTwhFYSLqPMiAhL62V3C8goiwjgQHeotliIuqHI26I0aY21xH361tbM7oPZz3D2OGhuC0MvU
 Px08jtlpsCcSxAtXP911LqBRRej+2smyRWbkrgB7eSZlKKJJFYwCquII9576lMq7bPE/NOFis6o
 +jC3TdEyLqFO1HA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024859_052041_EEB38FDD 
X-CRM114-Status: GOOD (  15.39  )
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

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index cb3eeeb1e9df9aa687e880b16f8d0a31b04a3b07..844347945e8e71fa0f456be0ba8de7217f6760a3 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -17,13 +18,14 @@
 
 static int ts4800_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
-	struct gpio_chip *chip;
+	struct gpio_generic_chip *chip;
 	void __iomem *base_addr;
 	int retval;
 	u32 ngpios;
 
-	chip = devm_kzalloc(&pdev->dev, sizeof(struct gpio_chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -37,15 +39,22 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	else if (retval)
 		return retval;
 
-	retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
-			    base_addr + OUTPUT_REG_OFFSET, NULL,
-			    base_addr + DIRECTION_REG_OFFSET, NULL, 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 2,
+		.dat = base_addr + INPUT_REG_OFFSET,
+		.set = base_addr + OUTPUT_REG_OFFSET,
+		.dirout = base_addr + DIRECTION_REG_OFFSET,
+	};
+
+	retval = gpio_generic_chip_init(chip, &config);
 	if (retval)
-		return dev_err_probe(dev, retval, "bgpio_init failed\n");
+		return dev_err_probe(dev, retval,
+				     "failed to initialize the generic GPIO chip\n");
 
-	chip->ngpio = ngpios;
+	chip->gc.ngpio = ngpios;
 
-	return devm_gpiochip_add_data(&pdev->dev, chip, NULL);
+	return devm_gpiochip_add_data(dev, &chip->gc, NULL);
 }
 
 static const struct of_device_id ts4800_gpio_of_match[] = {

-- 
2.48.1


