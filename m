Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10183CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2pDGvu2eB22QFjf1je4Uit6bFjIzrUYVwBKgpkRJ98=; b=fQH4vRptr1l/M04+1euUQNvJ/U
	AHIeofyhX6Y72pTFFnObigI9KOenYuzIC1OuB6m+qhay5O+uf+wwfEKWzATWUjFT13323vSr+Okib
	eTGj/7q1z0XxPQUkLMyO//HWPZ61z4i4vm6wmFOpPEGe/Msgf/nHxnwmYu5YCAdzTES6fqKH5kE1R
	NV/lQ86/WOh/yXJIuF4xxIgpmGadMDoRgr+emCjPzghLnq2mOA54GUMXVMDbZeyRIt/vICFggJy7B
	yFXYEwny5pJz+6ChGIDjPNI4UX3YHgY2gMPNtTgVPp838LVYlW1LMz5A37og1BRPJCXlkMvsipwz/
	qcXG72Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq7-0000000BZSD-13Mk;
	Tue, 12 Aug 2025 17:31:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnsC-0000000Af1m-2Wrh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:13:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b79bddd604so3163436f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000779; x=1755605579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2pDGvu2eB22QFjf1je4Uit6bFjIzrUYVwBKgpkRJ98=;
        b=WyRytyy/GlmBcZUzC6U9N68IV+SjENVtC/C2ElYoG2Uak5qsLb/tolPXSql2e8+h2U
         EnVItE+B84Zkh+EC6YL5ZYPJX7InjCDcJ1lgllh/qswrDkkHj6v7PBW4WZOYi8htdxlP
         3M2EnQrWFH1FDA4f+QdsFrUCaeMqPoQoLbCJa3vWteZddzoCOpAtAxA8outluAiRzsDY
         4zqjM655d9fR9ao23cAoteFMFrcm6ZrTWmxFg42a4WUipmHLg7tU1uVm2Hl1rUAdYnff
         MdzewpJ/Ux/4kMZYzKvrT6zbL3D1813EkdgvgCHcofS0VogyHC+zYbW73emqV/P8Dy6P
         t25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000779; x=1755605579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2pDGvu2eB22QFjf1je4Uit6bFjIzrUYVwBKgpkRJ98=;
        b=a2p8tom9jyw/UCQAGAVfDmntKjauD8zBf02gRZlIzNU2olpwqZeLyq+yBPlbWFsNmF
         E4YyhBMLJbDPZvo3lNN1GHOUpE9y93wMvc1ktU32eth0epq4SCHoqi4cNaLvPDht8F6N
         hiHrIBttd+wqM+usaU8maqheTSM0IR8xZcGNsSokmGx3OLPgZ90OVFIYTv9XZaKFAd0H
         MwDCgQRgvAvCtUTf5X8b9y6uv6/wLtUudbqRIVMd3ZWlnNWVCmdvUQGiVu3f6LTSZQIK
         YIIearoL0CZFwf2iU7geDlcKZyvd0lDrmFCv6nCGW8ZTZNGouZ2M/M6HBihIhfpxa0i6
         3qpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe0Dk5RQLJa37TP43H140T3e6uQRhyN1iBmS1NMcSZSY2W3gW7UKtpuDwWbq4tR0US1tAaYwJ+jtUImKVmjyAA@lists.infradead.org
X-Gm-Message-State: AOJu0YyluH2eIol5af0YCsfIja8lNNIEfBJphs2i2IqWawDg+3x+W+RF
	foXl7nYF7jWqUiEy6bSO8k/XIWy9mk4d5dV3UnEKabLinaFe3hIWdMIMax3YavrjoEY=
X-Gm-Gg: ASbGnctrS0mgdzac4uH/3MLaSLimT0ES9oJ6H8ONUM10VKDfCxAKDWDbLJOXQbWeCqm
	pjvg6wDw4OqaO+BNnSsJ851jE8Nt/q/o54iL7hlU/KcqnXmn2EQGaDdH+IOfAIZHVIr4H/FRhCM
	2597a507hrgdId+3ne71EyQIftUh0qclHSDGXoTjLqRiDVTT35eb3jzJU1hv7FnJUoKF7iE00FB
	07atN2Cc2RndZ46SAeNVIX4jMnyApUqvd/102dr2tLuH5e8HGDLIab5G5jtf70cPzhbMHFWeSWr
	PFZYbrpDnLA/lZXseiaoEuSm9gliD4lF/7bu5YEb0mMiuy/87xrTBbGGAL8JKfAeFdUUYiNoDAg
	YUklLe8cH2XnTZLE=
X-Google-Smtp-Source: AGHT+IGN3jYzsYBVQXca7oAD/0BQQusDB4bsYzgS6qA4xKDldMmyctpavKuQxOQXivexALoM9jM+dQ==
X-Received: by 2002:a05:6000:310b:b0:3b7:96cb:2271 with SMTP id ffacd0b85a97d-3b91100ae21mr2612125f8f.37.1755000779223;
        Tue, 12 Aug 2025 05:12:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:49 +0200
Subject: [PATCH RESEND 07/14] gpio: ts4800: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-7-aac41d656979@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2141;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zakPacry7z23T70PXyuXPcLNJS53LcxlBowKWXzkU5o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/Ai0zdbA9R7kLhmcZdq7CJgxh3wbhU1lkte
 T30n8twZeeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwAAKCRARpy6gFHHX
 cuvdEACCH4xT6jGvLc0hzJ3+j0uJSqe3SolQuG4ChaqKeaIWZkTr4h6JKSEml/CLwrEy0keO1xm
 A+CpD5Ai940L1rK3JRNs1EHf5WxBNusLTqiQ5bUxpcrJvNQxA01E+17MIoj14ZJwF+QSTXfpqTj
 9XyFoDnT/TxHqLGhUSFO5Sy5dWqA2SP0P/ssqJ6TwWB9JuQq/S+rsfoBwXPhEF5ZM8JSU/CzNfz
 WFYsQrXGr3/3A1R3gjE1BXGBkIuh8Jkcu7BK0iH+OhAxtAO8SnV5SpQmeEafkMHKtov+8x85g6e
 77QRCsd6Xn9q0sjwSwFiLVvWarQqCqtOmMrUJjOMK/04gxXn7uRRoE391orIbqFr+Ult2VnSYQA
 LnKk0+1D95njTGs3dV1cNSjIXWBJQ8Evsta+aFmDiia4db7Ost5/gFbOOaHdZAOghbLggI+AqCk
 jbjG03E7eQckCLIK6No3x3n6s0mx5oP/oO0ryBMQGSOqOfUnRIqM2bb+pdVdcSOahmRX5Ze8Lgr
 RlRsLTZaz04iI7Y0Fuyk5EY6t4qn+/hhm3BTTmLQTQdkTLkKpzGeJ1yMebWVneIWbhZI3gx2zyv
 pAJut1r1Ls/tzHcFrvK4UMty15VHHufejXEwrYqHj0HHlQlZ90jwlg4MFFEuyYCcXpr4GQ10h/y
 5fuq/iLqQ+2ZsWA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051300_652868_96C9F934 
X-CRM114-Status: GOOD (  15.90  )
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


