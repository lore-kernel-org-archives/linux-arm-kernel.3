Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3C5CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPrnuMVElbf0OVxOMvlRbagakQrZQomsS4SPCky3lf8=; b=U2XheM36S5sP3jIc4vfAppCEev
	jquNMY+/Ki3o9u86l+x7sulKyk2KvUJ3p/UJ6RC93HZSMPBAODHcnA4s9UiiPMGU2XAsDlYQqO0H5
	bDAxP7EBP68v53WParwCYTIjdyrtXSPp2xvyRtzhzzie8skRek7WLJm/+jpIa+v9wrr+nMT2Xp2Em
	mkPIc8NYpAilMx5cVvlf1PwFfMebAdq4mQgKBLmGKbh0g2yyQKo6BvBcKs8f5bZRlKNpn3kqygmxc
	9F6BaPtkeEDUv2t5E0BV23wxcCtxYZs6IWJAjsnIBtZxzi4PwvYHSG6N9XUZGVR/qJ5uO2bmz3YgU
	Q0pS1CAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaL-00000007nFV-0ihw;
	Mon, 25 Aug 2025 11:42:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTp2-00000007YIs-02bj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:49:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3c380aa1ad0so2025648f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115342; x=1756720142; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPrnuMVElbf0OVxOMvlRbagakQrZQomsS4SPCky3lf8=;
        b=pBYLSV+I0PXYCrPO6/71afkLI/wWHqBTDEGbYQheRoC0/10MMSbl5yvflowIfI+NYy
         MoBmyEuiH29BPFeNqdPXJSULhyZ2n4V3WTnifEs464BU3nElrKmz2YgWupKG7/I2DLWe
         ccNBJSrbGwIURtlL7EFtlCDeEK6wNjGC9cR/Es8uY0vEUsogZxrN7z5p6u93rGxrd1Hl
         qfhk6Y8vvnp86oWVt6k//sPWn2CkKbF92tqYvvcUWfsHKHVsCTb7/oySfTcvdeeSXBHB
         B4SvcLdyHRmTYf58+zPcTPZdBIeHGM/5FGXMXha/jBYQ0ub45xYEz82rd0kaFlt0XTGa
         7fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115342; x=1756720142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPrnuMVElbf0OVxOMvlRbagakQrZQomsS4SPCky3lf8=;
        b=Aq18G0HngQHsNbOifXd75fVcb90wpcKJeV/jjLrMkiNSS7JVo/np2mgjDb+5iH0jIZ
         GrwoNPkW5nH8Q0/tltHhG9kieElHhpfgN0B8qmkJWh5yAvc9RltWYrBWbIAGfGvPp9nF
         1shAeoxypsAXvh4Vl4E0+kkM2sI02p4rHyxqa3ThMegaUyxm7aNPEAlgLX1TAXkcPm+U
         27hkgkhmu9h8kMUfe7QfEGSDomF1RziGUbQO1sptxH/V7bK1klvleLCLJx1ZGotNezm8
         1IVRMedlZiTBiKPTCPjPwNyJCbZN01lt/ZCML+y8n+9lCwvyyZL7qKOl9nqmh5RkxWji
         LcRA==
X-Forwarded-Encrypted: i=1; AJvYcCXOGm7KC22jHuEpP9OLnWPmAmRm2l7Jd8p0OpzRX7+As/YMXPMR+A4kY2uMNxJlaucLT8wWmnTVitDsHZuVHUXS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9KXqDPNzXRo6mdnnoKXX76Ywc60mdgnev41KE+JSWSzaxeQrR
	qk0/bgw1tNBcs4lYQ1bgvxqhBQhRr76HJa6gD9Vah76wcLdkDf/3EryNS+m/PgrRhMU=
X-Gm-Gg: ASbGnctquYsTnqiqVI8TuY62IwHzR/wQVgX+vfj0dKWjnYzWdEd7WkDJ/MAakzp7Rmx
	c/xJPS5jQS5e9ti5qLg3TjoKBS7FTVvJaU/cC3pyjtM5BW3glYBCpOpeBdmINgaIaiBFe2jRwfP
	KAeNXnFFeEUB9tcWdCiBM5c1iXSYIDDEI85hE4pbbP+phe/KWWB9t8HCfcmQfg5hVjCnCCdlwR1
	swvMRKRjTgUCgUwleGKmpQ4U/gKpgJBy3zTkzQ0esd40lgE4qlMW8GdmfpOE4T4rvGA2OI3LWn+
	c3s0BTtQDL5Wq9PDZmgnAZuZp2Zwq3uBfbV/Bx8OL7dWwhVK1mS8ZStVvJcLvMsduhOLp448uMo
	lFOlp6o2WG5fkk9DvgntCZLgcjLsG
X-Google-Smtp-Source: AGHT+IFjgey1nCIviQTiPa1PzQ/EHonjOfKoB/cv7f8o1CADReniSO0YUmXyqIETzZ5nTpWlT0Jdcw==
X-Received: by 2002:a5d:5f81:0:b0:3b8:f2f2:e417 with SMTP id ffacd0b85a97d-3c5dcdfc643mr8781837f8f.51.1756115342395;
        Mon, 25 Aug 2025 02:49:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:49:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:52 +0200
Subject: [PATCH RESEND 11/14] gpio: rda: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-11-356b4b1d5110@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VEKDyVTn7CdAc/qOsHjVELR8QjmrXUmK9abPLIIpync=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF/jKamudiWZeik6VJ09Xx/iCNsa+hN9IVns
 kkGZw2lPySJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfwAKCRARpy6gFHHX
 ck5ZEADI5Vf5PU/5cpxG04FkHdFGw+RZmg5X8m+J/hOxMzbMW/iLAflxzkvfGG99nUmCRaXb3/K
 s4Lh95pT29u2GXQmTtbBDEe+GLI/8kYLPkP/M7ihXlIMl/sck1TYC2+zeiaxLCDr8knUZoqJJcA
 CAmwq/244Fm2XAPjxTfScQo8FAqc0kH9x+/KQKxcXx9JO4i03ttbT6PTpf9QI4BQi3neUvE1A20
 dxGk37C11FbihhBm5+9lLY12x0zIvZut+nMLEpuz5V3gYlPKda+Vd36VGvh8Gl/mw2JpqDfBJB+
 GC2vYqAoTeDyBlN3DpgO64GzmL/f5lVIZbspk3xFXDeo27d9SDDPVdcnN+kVACVhGAxkKM8FIqi
 r+pFSNqqPrCnsgmKlksdOW0y4iLuEGT+ELXLry3dB+Bx8dxz7BXlTXx7CvZO8YRRnOpL7EFYSZP
 5iBVm+Esr1+4ArdG/VB1Sx3MXoJXYCyg0lyEZVNGNhvJooLqhQNbLkNT8CF3XhJwoXVQ73fPsoI
 Kzm5ddFBOvovxO4DHfn2JQfL7no0OZU/wP6FGS6/7XEszAI7j73VXwvvV0ob1iyhv1lYzzZR7+7
 xlpxZLbmzIFqlfkwBigT0D8RYQ8SsIiVXyO/dSzJHEKeEW8YxCVyU3eYmKYGnMMP3eooLetpb49
 NCUph8Bx1R7VpNg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024904_084764_B516EE5D 
X-CRM114-Status: GOOD (  16.38  )
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
 drivers/gpio/gpio-rda.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index cb2f63eee2aa10a2708ec91dfd610ed1ea76917d..bcd85a2237a532b875df9470d972ac88b95a91cc 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -35,7 +36,7 @@
 #define RDA_GPIO_BANK_NR	32
 
 struct rda_gpio {
-	struct gpio_chip chip;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	spinlock_t lock;
 	int irq;
@@ -208,6 +209,7 @@ static const struct irq_chip rda_gpio_irq_chip = {
 
 static int rda_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
 	struct rda_gpio *rda_gpio;
@@ -235,24 +237,29 @@ static int rda_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&rda_gpio->lock);
 
-	ret = bgpio_init(&rda_gpio->chip, dev, 4,
-			 rda_gpio->base + RDA_GPIO_VAL,
-			 rda_gpio->base + RDA_GPIO_SET,
-			 rda_gpio->base + RDA_GPIO_CLR,
-			 rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
-			 rda_gpio->base + RDA_GPIO_OEN_SET_IN,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = rda_gpio->base + RDA_GPIO_VAL,
+		.set = rda_gpio->base + RDA_GPIO_SET,
+		.clr = rda_gpio->base + RDA_GPIO_CLR,
+		.dirout = rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
+		.dirin = rda_gpio->base + RDA_GPIO_OEN_SET_IN,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&rda_gpio->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize the generic GPIO chip\n");
 		return ret;
 	}
 
-	rda_gpio->chip.label = dev_name(dev);
-	rda_gpio->chip.ngpio = ngpios;
-	rda_gpio->chip.base = -1;
+	rda_gpio->chip.gc.label = dev_name(dev);
+	rda_gpio->chip.gc.ngpio = ngpios;
+	rda_gpio->chip.gc.base = -1;
 
 	if (rda_gpio->irq >= 0) {
-		girq = &rda_gpio->chip.irq;
+		girq = &rda_gpio->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &rda_gpio_irq_chip);
 		girq->handler = handle_bad_irq;
 		girq->default_type = IRQ_TYPE_NONE;
@@ -269,7 +276,7 @@ static int rda_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rda_gpio);
 
-	return devm_gpiochip_add_data(dev, &rda_gpio->chip, rda_gpio);
+	return devm_gpiochip_add_data(dev, &rda_gpio->chip.gc, rda_gpio);
 }
 
 static const struct of_device_id rda_gpio_of_match[] = {

-- 
2.48.1


