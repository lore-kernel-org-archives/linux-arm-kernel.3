Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B172C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=; b=QVS0TApT5lJqcN6m7/30UsmDaJ
	5qHTv/nX70+4vBuAT7jo9E5OTpyG8h9ZH6jduTSqnmeNa0qNb5k/xL2G0gmG6gV+aLjo9dJw90dh1
	a5W/7RnIWhal07i+qyRK2pR2puJpLtFZT/XCFDyuyen0dYz6bZ8erkQykbFk8ROJTmHW0Tgiii9IR
	P8Zw+c5yIpdfSvedA7G7EWPPLDCCoR9HNetYmhRVUFC6+uaIsUPE06rOlQ5/dDktTxT9vWxx5J6Cv
	4dw9PZKAEPRfx8yydUbYuUKKsQYmTjOcZfYlSaXUPHvJqKhIGUG5NfgeQdCIdQ73nhaCcUW8GeJJb
	7TJ5s5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq6-0000000BZR0-2FeS;
	Tue, 12 Aug 2025 17:31:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnsA-0000000Af0c-1lLJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:12:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b7910123a0so4929986f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000777; x=1755605577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=Aa3vANA2JDgfj6lf1adm+YwYzcGMxieh2aS21ff06uPSt+odGQGYspLKTNy4DiRRTW
         T41jKwHOZC47YJGzxY3rAXSYPHnHdU6rVrEG1mc0uiNAKjXHmvTvpqvVu8JX6xwfcVTb
         TolVKi9obtH+6czc7TfafEn+anWX6BwDBWpSLZQosOBs4ggU+K0MXHO3huoy4gopvFWp
         AnS0C1b6S6D/qrPPFAKiXSkeOFS8ZVn+PgwVSMaNCNYt+euCu9eVzV+H6EfswStmUvdq
         w5rwkiW48PM63sd94OaKy3KbNtNgjHhjxQG2DcCkgOUNc/ZOv20qyP+x1H+DoWUKSl4n
         P45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000777; x=1755605577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leTFdfCJ6+RyienTiSwh2q3pg0tznaooZOPdYThkYBU=;
        b=fw6nMsbDQTPd2KIo33aYgVpMEMjc7i6X9fbzwkTO7yuM3MCiucbvNeNgeqjZsrV7np
         VLB+mK+TSuarENchYcW+Ohn+NaqiY/f5okuXUJadi86Epp/75bhdevHRj0xPbiNVirKD
         0WL8uZICcatdqfGXwAa3vub5lwoybItB+ZUZKWrBdk/4UvPXTupTzrq2x1Mgl9cdaggd
         NDEOvMF9j6nF17Rum2Gs9gTKOiw+G9DSMc49gIiUyLKkwkxPt+745RgA4zeHXlbRDaJh
         NDt4V3u1BqoJF/cv3WCG/sA0zBZum0iSpmaekGpG+O3uwy0o78bZ379srO8REWiGF/5F
         xWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrGhsAzUqSeq323O1hF6bhifk2PzyAr0if16QTfFc2RpAIPTLguzFjEPIeJDEoKypMjbbkCe7kmkGMlt3yr++W@lists.infradead.org
X-Gm-Message-State: AOJu0YxWtM1JM+ocoedNXzKIwY63INal2xwGU8V46PCXxXDEumBTiyNO
	Cz/sF95IcPXBuw91rhbnLbRC9vOsb9GljEP1HFh6z0JeSYHUqgsPulC3C2qMQLNxBuo=
X-Gm-Gg: ASbGncsv3cbAZrzTBsIqAwoZWUXLLvv6247Ofk4+lrX0E2kG2afjXjPMktkVEYjuGk2
	HoBbOkirw/cBYoKlAokt414y7d3QSXpHbEM+XgFFkmOJI4Ntb+wF0GSfJJSP+d3ooLvACwoac8V
	rZVICg0tl24B4I+3h9A9f97wM8zut5dj66OhFGqIB/RFIPKYXkRJbSLaUiChuTfWMp1mugW9rzL
	CVT6zqHpjynS9Ysx57C6DOwq0rUWCv6zC/LYnOzvBRz2Njj7lMbgwA3JZe4SFNoZC5dQtf1OE6H
	CVRQGXdrZ6fyVA/A6o428BMt4nJM5Um85d91jzrpjMEJU8fVSRwS5qDJmZTNrK4uRBU901OVJGz
	riCfHb68eN59FZVE=
X-Google-Smtp-Source: AGHT+IF6XUNQqdgkTgQ1x508mMFEJILvogWUQiqNdeAa6GhrQVsxNo41mqXOWucvHGax0Ff1hCkQoQ==
X-Received: by 2002:a05:6000:2501:b0:3b7:7904:58e1 with SMTP id ffacd0b85a97d-3b910fd9b5bmr2609829f8f.18.1755000776890;
        Tue, 12 Aug 2025 05:12:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:47 +0200
Subject: [PATCH RESEND 05/14] gpio: ts4800: use generic device properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-5-aac41d656979@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nK9pJAlcVqEpACXDhaB9m0pP1KYR56NEQPbKtHUMK9c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/AfBGPkXA/Gx1NQTrE2MGWSh+bbw9a6LktC
 tVUC+TxlsKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwAAKCRARpy6gFHHX
 cg6ID/9R0nU4FuZj92E69M440ZEDgNL+2sVxByXP837eQ+0pL6Y2i1Rw+Z88ZfQU2/dVmAZu5XB
 3LCHN/2SKxRnxiicvpAsM6/Qg6kbLJR2D/A3ZqDSNSqxU4BxLbDKQBR7pPgiyUzGQGVhI5eumI3
 9jd6TKMUtcvXnU9n5/oAgEUvybw0ZSixmd9PZv+v2e4d2bztBg8XJECzIdgJPZf9qZScDDXE+Q5
 aNae4RGa8YOKTXlZNf5GHeeFg40lk7CeWyouIVscIWnX0xIOrjiGLTks1C5gLF/W+xa8K8SXYJ7
 On7k5ZBDUcBWQOsS45qPB5KeuJKERjrPhIib3p9RWyy0YIiJKOkNhGpWzTQ2ThD6Gn3XLzARP27
 s1JHeWYporbRbxsJyB7MqG2QGHQQSO79J4EoFYhxjB+TmxGFcC5ZbuIk38c3IlnuE7mnWozKIW6
 tzx9VHG+5kG5FVEUNval2YsE2eo7RZQ52ccIJjf+vcU7+b3LGpjsKacexIFpoFhCudFmERx/Uo3
 eOvmi6E1R9aIw5XJTETiRhS5AeuDxrYW1390uJe18Ga/NzGyu7qrpS2Kl+nWrsdxfq3vwUi4rW0
 /bZdLyMNxFfZHLTUfOhnB9ame2IXik5GQeaSz2XKEEwUvpvgnnqdeNklJRO/wFzASV5FFwdIJIv
 s1zeHp0yIMdAwVA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051258_454756_45AD714A 
X-CRM114-Status: GOOD (  14.75  )
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


