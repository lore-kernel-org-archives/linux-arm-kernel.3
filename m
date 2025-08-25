Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70914CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JXqL63qeFVdF/I9mGFbork5TN+ZaQ7aCD37gp/UqF0=; b=MKNSCjeB+4Zhx2+Q+01oObwisx
	9HX+REgYfl0D5UUR2if0yzTEaWBxht9XpQ1yOy2si6bo7kBncpGLefLPJhH/HwZMUDhE/4fzzWKRt
	n3qm+7ci0YGEh/HGwF+0RpYUL8Mee17QFEtMZqoQOk3bVsw4/Hb6d6fFzw8LsxuTqWVNVa5VRJUqA
	xmAMimSzdJnblStqWv1ShAKz4O9EVRx96Lk4srR6NxA2vJma74KRqiUASa7jtG/CVW8bMGBL8y0WS
	W03uJf9pmn5B5RUMHkDbL0hB4ObXRFJTGF6QwRuDB9pDNhwxHdiSU5+IGyyHz5OBOJBm4mqI2+dDh
	bnLvzlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaK-00000007nDq-10dS;
	Mon, 25 Aug 2025 11:42:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTp0-00000007YIA-3cgt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:49:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2556406f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115341; x=1756720141; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JXqL63qeFVdF/I9mGFbork5TN+ZaQ7aCD37gp/UqF0=;
        b=nwrBrVM4hxDjj2bWPvnX0cNHB2eMAQPUo6C8TUoGvng9EXwSax+YSYmtbbwq1j7K2W
         znXbti52iHnffcoNX5nRN6b3qaNKMzed6eQT+pNWEawfi9Kp6sFJwCK3PZkbCt2Wub2d
         nf8BUFLTsDwkUxP/7iq4GyjH/j16CaiVNmuSlIp56eyHtLHVpdNkybeibot/SrWdHjrt
         P1sWEbTC+7fnt/bimNQvRvlnwyJhUPhBQMgVGpfT5pQpU8rLqLfWMfMq+NZgp6T2iCGp
         YyBC1jRrm2FtbeyAPMnk1Wjikx+uG8PoSLvD1Fi7WOhSkWqhDiTocRbQ0WJwOxYNzZAb
         TNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115341; x=1756720141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JXqL63qeFVdF/I9mGFbork5TN+ZaQ7aCD37gp/UqF0=;
        b=Hts9Pg50DBBXOkv7ABw7NK8LC03JzfeQOyPU0AHEosR8NyAKcX9DYLtEvD27syybX0
         +j+hngv0c64fP98+XywnsfpjU8V1V6nHc5NCitrIBGkjQL6SG/O/48XlnMz1TVSNGLyP
         pFsCzuX0/LFOlGOnRH4wzE+gT4p0CYw96wUw6P8ttnK1p7mnq1yfhybZGzLOMSFNfXHi
         aj1ucDz7gs79W1eJYYomUsKCe2PuzZmde4kiF+6Ayb6sVVWdjcstwFYz4hsXfQaSwXyz
         a04pOA/+XlcJrQu4jAbzD34sf4pk5YMs5Dk8SqxmLw6e2EPcXp4GGs1l/w02vAS6X4rg
         AdTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWupXy+qcWCYQlAkWDyWfYs9dkvPmWh/TIgdHwgbEwZMzFifPad95x+1Dnl8htszJvrEB5Ts/vDUDS8DuVuNxhC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb4y0daP1a6d+pDhK0MfFNuX+3C0BgaeUYaEmFY20s4GaDn9T0
	1Um33rx/JGJb9+3UNTTt84H6oZdfasfjXN8dm/ct3sHJ5+PvSgFoaU188ARQpHkRvGQ=
X-Gm-Gg: ASbGncu0ZU+FcEYWOvtbBEAhKdjdzMukcRFBxtS+zrnj/RHepvdiQmcFI30sSrND5CG
	4o6u26wJuTakclOJYGRkeaLh3iSZtIgGu90GzpTSQBK4b74P42078rsMCuhYdy2cxc/ssv+e8PG
	sM0NgvOLJF25mijXx4blKBBVKFcxnyHrDujB/rDORI35sPMqOcKlypn2ysQR2TvvMByKrMf1gkb
	Ys3kPNzgkRqvsE9vAV6trh6+tSpxrYg385ETdnv5OpvZn53PwbExiMzkq5jwldG2EV+TkiYcmo8
	sUHdV4aeiubFRpD3a+0v1aKFFbj60Lp3kI+Vh/ZNJA8LbsL+nvTrJ8k64WQtAyQs6vn9fdwnt9j
	zuyGY7gctemoFNErKnr/1jGsaBRNm
X-Google-Smtp-Source: AGHT+IGqQFUyVzUhWNvcRXp/aqVwDzPVihVhyMJEm+AleXvTWHTL72e7MVyfwP+PUw30TkIPXUveHg==
X-Received: by 2002:a05:6000:4308:b0:3c8:443:4053 with SMTP id ffacd0b85a97d-3c804434626mr3718081f8f.1.1756115341323;
        Mon, 25 Aug 2025 02:49:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:49:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:51 +0200
Subject: [PATCH RESEND 10/14] gpio: amdpt: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-10-356b4b1d5110@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4007;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J+TT9XjbJJKbjE77nqgtMEqiO3qZwqcbYA98JKh3zw8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF/x4Ui4aJKIzDH0rV5RTC964M761/7Rc/Gu
 oO2Vd9gFnOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfwAKCRARpy6gFHHX
 cjssEAC2/HEP7ClxN+Z8FxBVvzsXbdSfTrHqx8ubSZGhwCLUqGKdylAim9rPEKUHQQJB/fTrtSk
 egIV2DUIsexkGXJ1mJCvGuBNj/pfGF0RgghPgpVvghNihgUq3kyktUSiakewhKE+/wB9xY/zY5s
 7ejYlAKn3+KSQCUx+QM52LHaAVqmyS+Mh8zKZMniaYendSd22YsR5+8kFl6z/Q7jIV328Cx5k7V
 Jk+CdFJYezEdAqt+VK12+7oekT2rST3kwH+l4Ya3XVwf2KXKayHfYa8iVO336uUAAYVTEkxvOu1
 gaJfg7h9eN4sj8WdyPzUF6aKNsfpConZVaana8Qp8CFJwmm64Gz3H1pVbv9ypJCKAYzbL7MxeTo
 /lx2ztvw/OHEW9W9Gg3nKBJaPKKGLwujx49JiyIspjJkmzRFLpe9YwL3ZKWdXyj6/F2aCtKwzzj
 ySE/0nZ08eBBBWzTv8kmu1NZYGivXV1s+df1EAdJ6W/fYdfNGeV0mdle2jq9/MvVeHT6GhSx601
 IRTeESGbheUdw46N2E6VehPM3kfoz76g0ZJt8CfIBTzqmPCIMSmWi45ihLiWXhbqZsr9UXxWJKs
 mEvYxOpXORIGUWGbrA8P5KTcOQPCdV9rMn5CbM60cbPNHuruPDjzZ6M3AGpet3TGnIWBgKFxvAt
 J1c3T3Q9aDoUaRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024902_922179_5393AD30 
X-CRM114-Status: GOOD (  16.20  )
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
 drivers/gpio/gpio-amdpt.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index b70036587d9c3f64bb73ed3b94e1c14f249c9e21..0a9b870705b90bdc9bdab93ce5a4a33ebdafccc6 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/spinlock.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
@@ -24,54 +25,50 @@
 #define PT_SYNC_REG        0x28
 
 struct pt_gpio_chip {
-	struct gpio_chip         gc;
+	struct gpio_generic_chip chip;
 	void __iomem             *reg_base;
 };
 
 static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	u32 using_pins;
 
 	dev_dbg(gc->parent, "pt_gpio_request offset=%x\n", offset);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 	if (using_pins & BIT(offset)) {
 		dev_warn(gc->parent, "PT GPIO pin %x reconfigured\n",
 			 offset);
-		raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 		return -EINVAL;
 	}
 
 	writel(using_pins | BIT(offset), pt_gpio->reg_base + PT_SYNC_REG);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-
 	return 0;
 }
 
 static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
-	unsigned long flags;
 	u32 using_pins;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	using_pins = readl(pt_gpio->reg_base + PT_SYNC_REG);
 	using_pins &= ~BIT(offset);
 	writel(using_pins, pt_gpio->reg_base + PT_SYNC_REG);
 
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-
 	dev_dbg(gc->parent, "pt_gpio_free offset=%x\n", offset);
 }
 
 static int pt_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct pt_gpio_chip *pt_gpio;
 	int ret = 0;
@@ -91,22 +88,27 @@ static int pt_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(pt_gpio->reg_base);
 	}
 
-	ret = bgpio_init(&pt_gpio->gc, dev, 4,
-			 pt_gpio->reg_base + PT_INPUTDATA_REG,
-			 pt_gpio->reg_base + PT_OUTPUTDATA_REG, NULL,
-			 pt_gpio->reg_base + PT_DIRECTION_REG, NULL,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = pt_gpio->reg_base + PT_INPUTDATA_REG,
+		.set = pt_gpio->reg_base + PT_OUTPUTDATA_REG,
+		.dirout = pt_gpio->reg_base + PT_DIRECTION_REG,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&pt_gpio->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return ret;
 	}
 
-	pt_gpio->gc.owner            = THIS_MODULE;
-	pt_gpio->gc.request          = pt_gpio_request;
-	pt_gpio->gc.free             = pt_gpio_free;
-	pt_gpio->gc.ngpio            = (uintptr_t)device_get_match_data(dev);
+	pt_gpio->chip.gc.owner = THIS_MODULE;
+	pt_gpio->chip.gc.request = pt_gpio_request;
+	pt_gpio->chip.gc.free = pt_gpio_free;
+	pt_gpio->chip.gc.ngpio = (uintptr_t)device_get_match_data(dev);
 
-	ret = devm_gpiochip_add_data(dev, &pt_gpio->gc, pt_gpio);
+	ret = devm_gpiochip_add_data(dev, &pt_gpio->chip.gc, pt_gpio);
 	if (ret) {
 		dev_err(dev, "Failed to register GPIO lib\n");
 		return ret;

-- 
2.48.1


