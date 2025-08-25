Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07750CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm9l30Z/3e08iuv7sMN2PFeVixoBoGdwhV2fpocwB1E=; b=2yw2ZwohEnELXIon7L4ci0X0vE
	2tbNNtFMnw3MqfMxObnITt6X5sT6xoDGvZT8FiarRqdmz5hgVzsYusYc42OefuTpFRwFVBxFeWveY
	jab+A2hFL7SzsMO5jRErVV12IFh0IlTD16Ue9m8m5KZ4Mn5+x0C98j437nITf7yd7r6sAY/UVFuik
	lVMs2NmHMUzHw+kbdyssHHWOuv9sOIRLblwneYkHOkXNfjgBbKeDw49YKhOeG9+teUlENdCT09VFH
	wAO1nClXid/le4AzomEMnBnsKz/DOk1DF4g7zVEqw/M2TRkZli0x6IPbu/6VRUJ15xQjEFoSOSqqQ
	sTdtUT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWgR-00000007yGh-3bCc;
	Mon, 25 Aug 2025 12:52:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTp5-00000007YMU-0fLf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:49:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b627ea685so2853885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115346; x=1756720146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cm9l30Z/3e08iuv7sMN2PFeVixoBoGdwhV2fpocwB1E=;
        b=Z40bbdFe74VDFEHYq75/Nv21vCKqGdSzuJPalAhZvsXS+5LsfprEELWs+F+EAHa2xe
         ePxjmbbsqxgjvHJ7HCH1FD3sNb8+KQj5TftFy9ZdBdngE/viknh/dce8cna80Xt+6bLc
         Y3stKULcMYNDJZkfOmyhj7x+nJPon+axAuESXq9oNZCgDJ2864T02H5hxvS7l+u9jo2R
         hZDC+OX8Ik5AG5EOprNWy27Eoa6PyycLSByNeKy7kpI+XKSuXAXBf/H9mB/XPVEmzIzm
         wbS0IiNLXMlaoWzOV4WD7i6/RNtsKXOa0G+3E31TkxpOrMpa43UB6Do3sNQMXVokSEbx
         cwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115346; x=1756720146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cm9l30Z/3e08iuv7sMN2PFeVixoBoGdwhV2fpocwB1E=;
        b=BiMhwXyIbCwgrSOG+ZwKQnTVxHLqxOlu6cuHv40Y2R21T6X+GdLkmkVn0wNbxRLV1B
         CIVjqMRTUO2CcYu0KZEyfLvENnqx+CwJzKxPfnU/XqXwkSLcHsdesip7cVrnRCDDMhAQ
         LVipfeRR7/mbP7tK+f1bsdpq8jHLQe172kCb/XJyRqz7exzwChAMiCbuixxn0pEdV7iq
         I+6bYESQUJFOCj5//So8GThdA4PCsRxW1BHOL+pjiA1MJg/GES9QaLOd3V3fUmYplWEM
         3X+9l97qrUdbpXi2x9kT6Zbvx+VfluUZ74HRKj7F/2O8UAGgWO83gZafSpJLbS3xIVvl
         7XPw==
X-Forwarded-Encrypted: i=1; AJvYcCXfcLGOp3tvM8JhOdtfmMmUX5oHo8yYnf5qDYFR0GX7ufrwhhQYiCduw9CVHXxTdPZySILNz3SQsCOus0CBSaJ4@lists.infradead.org
X-Gm-Message-State: AOJu0YymLLOhpXhnZ+I/bOH9YFABSrjqZNBO6eCdNiel8SS9pVX1BGmv
	nZu2MdnGADQQ0ubIvd6bRSMHhfjf2CGtgZJ1MsyXOCiuPD021eht07rvZ7gZmGpmD0Y=
X-Gm-Gg: ASbGncvLsdVTgJqjBW2hYPg9GJ3pw3ZPWtQdaD56v8IiiijoyGes5CZ/92nxH6X/vy3
	kdrukC2wzSnD76wiEBYl4ZI/BoD6RL7kdNmokoX8EUiBUl2gpo14iVp3sHTvfNCt3CYfCTIehss
	PNVnvAmhlOBSfaag7Wp2PowkUiQ7oQVO3iEKBoLV7wAoWf7SBnczhXLi1f+HPSceevOtaB1S2Ym
	HWhB8401WE/Gdeu6xRK++P+CEc6fcbd/Gaj3RJFE2lJtZlHH4KkwoOQlRS7LE+zOo1b9SJuzyWn
	0J4IPq3thi8pp+QDYxr41SUZ3qwBPs7XAw+597jMfwInbZe1xRcr7cKoohW+q0LEnu+is+v80mv
	JXBHhn0L9aGEMj3RxkG9LxavySX5H
X-Google-Smtp-Source: AGHT+IFWEVlMhLNcEIGyB39ruCt7EDG55/hLvszV7xQZAZ9yaGfkwJ1sUtcqfCZfVdrByX/HCQU1Vw==
X-Received: by 2002:a5d:5f86:0:b0:3c7:516c:f664 with SMTP id ffacd0b85a97d-3c7516cfafcmr4616609f8f.50.1756115345785;
        Mon, 25 Aug 2025 02:49:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:49:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:55 +0200
Subject: [PATCH RESEND 14/14] gpio: ge: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-14-356b4b1d5110@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TSWl5L0uf8C7UyiKKr/acYMJZJe4qvP633C/saVULBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDGAR+XtNETwaYSD9Bj1SsL1CyCwdMGTcUo+r
 Gl8ilVub9WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxgAAKCRARpy6gFHHX
 cg02D/4xg2B8QQcN1cwN9dgslHRAMpaEu+qCGhNJm82Ol63GnzHaQBFZae3SePQrdg8jYkQ0RLs
 MDJ8coRcYKBvHBalthxtliGkZdcytUG7G///Qf9/FkFmxVYAPrHT0dex0sN8KYBNUrNJvImTT6+
 aZsPlZ4SWR2ktM2OROyeHSy1VYQNrIOZ5LigVY/kvAjSp3zOrRA4suznme36ySfKC+l0jW6YwVl
 9Y8vgF6/cmWh8BF13RQVCwMzcY12XCzrR5I6zwOjDYaqjmX8tnyskFCgc5UKAKTf9sLmogL+bT1
 2d0XnMLobR3N3/opIY425A/jwYxVN+AbuWDboqJPupMNGnMtPStPxeriKVx4a7O9gvlcriI6p/w
 eFjwcVlHCWtDi56fGI5PcmsFkmvzMqzkLNiW3JUu8oYT/AytHWDCSZd+sv8ILlAfV7YaOTzZQi0
 EFwDXoKis3dUzMC2+xfgYUb8Fmac7qioq3C8nl75XFu2k4pnxGGMefuVLy75kIXbvekr50+hep9
 0gdDWfVE11cRVtxUYjU/XQN77swSKuUE5PHvrnBkURRrEkmR5Qes+1EAV1hjRfLtOpxgCBV6n6b
 2ZD3ftR9eBPrrGKMa3Yo+YLaFTwgfPM4zjAyZinTrc4pO9IKy3vWS5h5S3IuDJl/jdTbj5bqKmm
 JisKextEJ3Eix6A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024907_216150_F692EB23 
X-CRM114-Status: GOOD (  15.00  )
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


