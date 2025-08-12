Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6F3CA0EDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm9l30Z/3e08iuv7sMN2PFeVixoBoGdwhV2fpocwB1E=; b=JO2g3+q7Lst42xvXzGJ7Wq6qXI
	rBsDEMK4vsVSDs4rNGSwKB6/vNEBgoSjsAQFMWS210xJge/zbURxawcZ1z7j0DdKhA78V6f1tXgK3
	24TviiaRMN8oE1W731gwOT7eFX5U9PaGSHMByVEOJQIQ8wPipwKdlHc43PEm9LxGlfgwaj6VKTzUK
	TljqfDzfch9+We3xAV8tkWIgS6rbKZ57U7deKCBJoBFmeOcir2ayXF/doTjjrFygnprLXrhg8ld4F
	jpPfFOyA1aicoLeru94VtNyzZ+Wmi5NCxsxKB0GHUs0eNUr138qFttHY9EtGBSTke2vTl/d+9HEaf
	Zp3aFLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlT-0000000BMfD-0zZw;
	Tue, 12 Aug 2025 16:22:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnsM-0000000Af7D-1hMZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:13:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-459e3926cbbso22761795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000789; x=1755605589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cm9l30Z/3e08iuv7sMN2PFeVixoBoGdwhV2fpocwB1E=;
        b=1laFmt5tDo8XBVATi1Thr7UpmXR/pmkegxeJfg/izF4Dx3VNr+KPaY4OFeXOU1UtNO
         YmbvHYsA2gwJ/KRTYN7b95KeM/cK093lH80sFq3RRPrD2prMVjA7pTdPlQNNT6R4Fnzz
         brpZ5VyiEq055jZ/hfzAjSUd8qdfqCCDceEmcBD8GjHcZ1/dVZAZqa4ValOZaVB0Zm1C
         yjLIDMJuLaLWy+t625Wx9y7MFMQx5PglydW4Bsbmr99r3ARl06Wb0nuSqffpO28JZodX
         tU+FwByNU41GN/fAkwgbac8NtE65DTDLKZgnp65J252CBtdtpm1F1Qpj42jRQdtegClI
         Akjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000789; x=1755605589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cm9l30Z/3e08iuv7sMN2PFeVixoBoGdwhV2fpocwB1E=;
        b=BMIRtM5Or/hNUATCnIFWtneWCsFSYnalxMj1Ae91Gi5jbHSKsf4R+GzZ5SAmbN5ZF1
         IxrU/1lNqn8JMChmmHm+6TZ3XztyDgf50/QEGs+/1qqYxjLe9gqjqIz1Kn0clFDXBe2i
         FxiO13kETKkro0oLbV4qi/3sSOWjiXayvF1aZyCVgngQOzYRv92y6pMEJM+zYWNZ4lfO
         QemrR+jhg4Q1SOf5PBwNJECftizscsh/fTfYAT+KDcpw03Aflt6scgYru1jSWDNlGOm6
         t6ZcEpKjbuU/DFazyOM8yQicaT9zDuLPvxNlL1Awk4+4tvKCPq8Co24BPXf6yS8qFPRV
         tHfg==
X-Forwarded-Encrypted: i=1; AJvYcCWtwi+m7LxjLjrbjR+pS2vR7VhWZjBBlMAZY1k2t6LMTlSqRfVWAjKT5yQOzQt/Vf2MWk9pmRqC0fVLmjxFYyCd@lists.infradead.org
X-Gm-Message-State: AOJu0YwI7N2KgXLVBadRDf7eTjvgJ7NV2dyWWjKVHiSE18kEPcmwbABf
	REPIOvoOcVmsMt1M77OplWZUXIUzejlab10JyQQ33yxJ85cN33PeIYH10jWohF4tHoA=
X-Gm-Gg: ASbGnctK77sjBFVpyrwfkivRirkeLGDIomIEY0hOmFf6t23eT4gENF0b+mLgePqdsbw
	OpHO9yOhIMis28D5Ky8a/jyeJC4uuP5s82yShB9+EotnDUXlTO2Oj3gjJQV4vbi74SKjYt9u+I3
	a30EctgHK/gHd46rc2eUbjs3IRV1N9ccEywIzbI7Qh/LNmuuGPVzx1YWfSM3hMSp6qhRFcLfhwT
	yY2gjs4EeQFPxQHzt98jR9roKRR6d7m7u5qSviLC70e6+PiMdMaZfxrHoZZ5x9bugETZ0fgQFQb
	bBY00K9rriJZujBb3C1pbTloCG5v6UKxh0EGMF3sBSfAOrShKru801s6djaH4lLpoRDd72mtJTv
	4kTLB0SvyJwnqKnU=
X-Google-Smtp-Source: AGHT+IFQXAQ7qpkEpup7xPIu9okpJyvDOT/34sxosy38G+6R+J5XrkGBCBLacg7FEsa2RDxo9ZNkIw==
X-Received: by 2002:a05:6000:2889:b0:3b7:9a01:e4fb with SMTP id ffacd0b85a97d-3b91100ed74mr2497320f8f.46.1755000788945;
        Tue, 12 Aug 2025 05:13:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:13:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:56 +0200
Subject: [PATCH RESEND 14/14] gpio: ge: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-14-aac41d656979@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TSWl5L0uf8C7UyiKKr/acYMJZJe4qvP633C/saVULBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/ChFeDpYsmN3Q3yVdyhWh6cz0WZObuwtri/
 Fq9Q1WkJumJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwgAKCRARpy6gFHHX
 cnmXD/wNlHHqx1JVE8MeQVNYMbGe1bcc3MsBaObydgCz7XjtgXUOIBh7CuLB+VXzI3fpEz6tgNI
 sLSkPXcU94zrIIJDZJzO33yBBq/j/o7NsKisJ+DzoYXYj0kU02WlNxZmXyRlJGHooPdJ2Yb0koO
 NGFems1l4Mj9BcSlVfbkqeJeNxBtpQSyLzmZHL3Kh96UIBA6SCSqFiM8VgevI2Lr8+7nPM5LYOf
 9mHJwrNVSBQ1x7NpvNJpQxzQNJPMoCC4tgWXW7E0ec8x7of97EPIO2x9Y+OJD352jp9UckI6d1x
 x6RCfaXQkJZC2EjWuc+VlNRNvzfUSmpnEN67mZj1eYk+7tAISorptDAwi7EVJ5we6UuQoQQmp6C
 NltWMVrm4etSC85EMsz8nZ+Aqh4e2cpjqyroWJy7+GoCI7uJYnn+R1hSyMDRcAVTBqUpnO/ZiM9
 QvmtN51uTfPxhOaWaPXf8rO+/BYYAMcBuyC2DCK6tn0I1EdTzIQWxs0VbhCJG/vVJEitD+Nv/e0
 wakgadtojeifeSOaDteqdRvmSysC4uvI9uwclkNeYtS0tobrSkvBkL4cfPIChpafeDqbo2G55AN
 /a6NCyokCVJCNGhlNG3PLIeI+DHsklg/ZWJJKNrM360P5rXGffHy5JnhJ0NhJ4/A/snwu2G2YSr
 lUL0MVJzfi12CTQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051310_461141_330E5494 
X-CRM114-Status: GOOD (  15.51  )
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
 drivers/gpio/gpio-ge.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index 5dc49648d8e378e9741213f9c2de05b4c75b347f..a02dd322e0d4cecd4564a71a550204983df33568 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
@@ -51,24 +52,36 @@ MODULE_DEVICE_TABLE(of, gef_gpio_ids);
 
 static int __init gef_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
+	struct gpio_generic_chip *chip;
 	struct gpio_chip *gc;
 	void __iomem *regs;
 	int ret;
 
-	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
-	if (!gc)
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
 		return -ENOMEM;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	ret = bgpio_init(gc, dev, 4, regs + GEF_GPIO_IN, regs + GEF_GPIO_OUT,
-			 NULL, NULL, regs + GEF_GPIO_DIRECT,
-			 BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = regs + GEF_GPIO_IN,
+		.set = regs + GEF_GPIO_OUT,
+		.dirin = regs + GEF_GPIO_DIRECT,
+		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+	};
+
+	ret = gpio_generic_chip_init(chip, &config);
 	if (ret)
-		return dev_err_probe(dev, ret, "bgpio_init failed\n");
+		return dev_err_probe(dev, ret,
+				     "failed to initialize the generic GPIO chip\n");
+
+	gc = &chip->gc;
 
 	/* Setup pointers to chip functions */
 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));

-- 
2.48.1


