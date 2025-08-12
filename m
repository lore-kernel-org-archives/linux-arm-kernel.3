Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F88CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=; b=eX6DiNUGjYkV4IZxQaiEieTaMw
	wHHGdPdkhH2BHUJyY89UZP67EMFmQ2AQlB5+Y0LdikyQLugp3oaHwmdHrUaGbS010WIu2k8IUNSb3
	C0IPceDtIm7Sjyj9vxYY54XYXkVbIBkg/Gvku10hHBU2khoRdbH5vU94/8c/RbKBO0CVgXY4IG4vd
	swmRNWM9hFoFeLc+Hbu90OYDQrvkibkfwkkTxmu8sA2/y5gWXSJrAvPYugWnJsrzakxB3vF2vOwLn
	xdBfMalFsoavt2Qvo8MfiilhdnB6RFZiK691nzrj2sFx5+oCR67IX3t0Rx2EucAxWgz2IeN93kuba
	UjUVf9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhk-0000000BHIl-2xMe;
	Tue, 12 Aug 2025 16:18:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullgE-0000000ARIz-1sE4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:52:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-459d44d286eso26931245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992349; x=1755597149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=imcplgiPTtcsQA5sHmRteE1f2ttFIdtT/C5/9NfPzZnBzNFTFQRz5kXEYdal9cd1/d
         v8pT5ZKzaT7goIcYluO3bwSUjIqWRLF9InMicIKTRlw9/F96Km8tBdsmWHUpVmNB+oGd
         5jBWrBOjYFBZXUfBUS0hEcsIAWVua11xwrx6Nf9wj9swXM/17gdUAL3WRwkqIBDTWF3u
         dtn+OTRmVYOOnP7aFwP9Hg7/CRm98FGiHayFtaJkTsct+9utJf70030e8FcAF1S7i6c6
         CaFkNp/zyiIsit0MXBcY8f4GcDgy24CSraIRrYcOvOcxN7zQHnJNbRIyKiVJ82jjUl7s
         p3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992349; x=1755597149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=Om08VvnlJ+kdtbVhjGXZp1IScYbIjkfTHdLxLTqdgdeYYqy0R+pn2pgWShSpOhZ6vC
         DpyPVR0HpmWcOHdEQuGzQ5gA450gieoG2kV8NhSgaQKE18+Auapq3KgFRcoyq6PRCAvL
         2kaQ7N5nbw9QOr2UrllNYYHgUi8bSoxa77jXPQ8jwyDPr3rhT9gKPOochiZh3FW7GslG
         l+iVJx+nZpwNWRF3ICnwwACtgZMZQEsdRf0/QCrJUitPMa5DmrWIffl0YMEOkZZqdzV8
         syEQiMkSuBJedpClr9huTKj2SF6jpThn/aH1Wrlsihr24pbVU45BicyxNsFl37lor3T8
         FlWg==
X-Forwarded-Encrypted: i=1; AJvYcCWjisiPX7KyaW+EA+zjMXr1KQBYyse/TsnAUzBXKyL4NAykXYj8yANiDSEMIwhfIlebCeABvgIZVMa85O01u5D9@lists.infradead.org
X-Gm-Message-State: AOJu0YzjOSU+NYU3w09MUVFmHFKWK+OrsNBP930BkOXYTbuxu6kDEFpw
	xzuyO9+WXV/JpMQe1tTC8beKH2EDrs3ymwEUfSqfNinrvVvb5wtrQ8kpQ0PRJytp7C4=
X-Gm-Gg: ASbGncsVnBqbxpO3UhjMeBiyntossGV6eIvUGZvZfzs91PE0wQ/A0Ez61L/i7+UZXwJ
	mKPD+UyitLgGXEfczTaT0Xaey6W+IrKJGKD+wevTGcjf660/ztereKSVgPPWqvYB+htUVBlXZyA
	sFWd96V7Wa9K60T8qa41NSwLRVCu+dJLA6VHvINJW4uUOxk5aLhit3Hbt1sesq7Iq+wkruQO7fK
	/O7noRrrEVci4K0uRt9tSIEOwjwNILZ1kNPAXTj/kPUOG/qi6mk8Gpibt9qEKJmI1mGaCJ8a+dF
	fe8XKC6wytor3OlS0rnWhpVja/4wBdI2RqJS6HygMtb0Pr1XYFtoAgN/Sm0XAZASWrZG8iABkyX
	brxHG9JhTWLokmrbQuRq5YogoAw==
X-Google-Smtp-Source: AGHT+IHMlTWJIYSmrVv4nHMCQDUriTkj7c/K/tgN+L+KmxopYAfuvalo7DHTecAilNpRXOwvXfPrEg==
X-Received: by 2002:a05:600c:46c7:b0:459:443e:b18a with SMTP id 5b1f17b1804b1-45a10dad362mr25112195e9.14.1754992348766;
        Tue, 12 Aug 2025 02:52:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:52:01 +0200
Subject: [PATCH 04/14] gpio: ts4800: remove the unnecessary call to
 platform_set_drvdata()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-4-9f43e95dea98@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=l19XxlCMzrhQb7segGk57h4S+g8U8d8cxgGqBJH6nF0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7GUepK6ewZZ+J6N2Dw1g70BlgPl9ljHv9BU
 tgefMYjfa+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxgAKCRARpy6gFHHX
 ctJ4D/9aMoxs1l2GSsPyDnhyzSc7IwkViTAepGrUetHNYsUUQ/wdOaj4Uw5xkBZsfSf/xRuZnMe
 iKAPIqHP2VfZKUpqA4DYvtfbdNysZCmVZ1Ygck+LSYYrnRDdZ2niK9VY5JAZE8kPYAbleXoARhp
 p4bHmZpzFOH7zxZ0VFpeOVdSBzmzb3RMBiQENwuzubY9Ivq9TNir/umhW2c1TNc3+u3mHUf5Pr9
 7Pq7vXm+Qw9WfPibg21H/5xH4rPsLivx5yVZNbEc4MoqjNLie/fiytXOr0GD6ze9nw2P5IB/37+
 oztaO/MgcERiiu+xC9uJiUp9dkHreQwjiJtCt6KzQWCCPTqBSoiIbEoYy0+ipjo+oYo9OHOHuMx
 AClhC4sFmehVvzuby9BtLDqz/YbHF0jfUatsfgCjxFTGFhS23dTt3hFYz/xYNrl/bLWs6bKguxk
 Yg+MFoalXzuB1KvlNvTVNwpLnQmRon4xZasBnmWKPK7j7i183BcxmC6pbmzlzXri+yI12dKrmJs
 JnAP+CbQpc99EhOlw3XQDRHvbmrij9Vix+D+NZ/ggaWecB3/bt0uKKPl4si6qhHa+5R2+5iLNMs
 Y0f7k1N9wSxVPRxP/F5QrU28/FYhpRTAy2BBv5U3V7d7aEPJ6dGTQLiJNnjnSk8Nrz+bvEf3Kl8
 8Q+yjtyYH/gZ89w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025230_495395_B9D20B89 
X-CRM114-Status: GOOD (  11.07  )
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

There's no corresponding call to platform_get_drvdata() or
dev_get_drvdata(). Remove the call to platform_set_drvdata() from
.probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 4748e3d47106cd2db6a994928b20f76921540a60..86f7947ca9b2d23292c1e6660fe93c611e0cb837 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -51,8 +51,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 
 	chip->ngpio = ngpios;
 
-	platform_set_drvdata(pdev, chip);
-
 	return devm_gpiochip_add_data(&pdev->dev, chip, NULL);
 }
 

-- 
2.48.1


