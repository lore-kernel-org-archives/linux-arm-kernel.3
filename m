Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661A3CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVtjQaO9FUN7/XwM1xAPJnZOqE+/4XCsmHPSuPjcvYw=; b=iyS7MHPQbgMTAySaTnzMuqdGWe
	RC+xxpfWYhgqUwQk43OMrO+mFq4KpTfPSMc+aCZA9wGmEc1faKx9U9im9tFBhqdVTcbEJiTF7g96f
	UdFptlMC4+rs/d10x/AA9TIgHOx0humk5F3fDbo4urpy6O8x7BxXYQq1ndOPesw3HLKS376NeOx/o
	R77F1HdmwWvLJmDn88/cf74pd66D1jrbJ2qmLs1ZaMDG/EMxYtKZQFzsNizMs+F+I6pOYSbKG6axU
	RbXijR31m8VKW/paAVDtc9DiuhnVg6thNW5rQVB2wN7MtDoSRH8PHUhnzAMgttH0omKcw9DwkjXAf
	/MsJkTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqn9-0000000Bc3H-0msu;
	Tue, 26 Aug 2025 10:20:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5E-0000000BQzP-2BE8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3c985f13d45so1082913f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200915; x=1756805715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVtjQaO9FUN7/XwM1xAPJnZOqE+/4XCsmHPSuPjcvYw=;
        b=C0gAtNJNMGEr5XIalc6Bzw8RP4zYBazHsF8QDUz55VlNJT+7IQz1iC0psDcZVfoE+b
         jCZ7dy+c9wqxVFqO9IrE+oAw/xYAtfwXriJWr4kpX/uGPfjlU8KeCIGHxS1EampnW9Dy
         Y5LZ+FzZya9aqiXhSb26U6kBvaJiCH+lBeNHVCaPnzuXQ1n1ClAaLn5Sc4JNgj+vJbVg
         sTEbuyxU9rQYlWTaLj42m3UbpthkfWC3Z9HbOrLOQYVa9nbMrSc6cYQah29MiM8FwhJw
         u9cJiPlJqfKXOmfIh/VXSFp01fanxDfDOMdKmRe4i+grrnOPxeXFKYZoWWU5wU1402tu
         49pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200915; x=1756805715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVtjQaO9FUN7/XwM1xAPJnZOqE+/4XCsmHPSuPjcvYw=;
        b=XLoEKLrFg7sN6WPn4B8flysbOZ8KXqScXc91mH0yHmvoKiqAWHTRPl4bePd8zUcf+g
         vcT2lcvUOv5dy9UM9ak5hqX4gLHHTLSPquP20xGVNs/OFZrzr0joiIuOja+a/QSi11X4
         YOOfTy2LqV2vKYmPnnF5Y6xMdKFv2kf5TkKAoSmEEJaZj7xaC4Zq2ep3GXy5aa30BaIL
         MVV2bDTpMZS2HJq3aQ+OdPqwCmWQITSh9jsGnpcDIhTqdAphip6v2H2yJ3IW60ccx1BA
         MaRY72njRsv+M9zPomd/ysLZ7OBJA0ETQY+mCWjuvCVnKF9JYHDkODImnvxK6pcNW2va
         KDmw==
X-Forwarded-Encrypted: i=1; AJvYcCXbo9dvZ9CKUMCBIn1dhpqWQm042Qe6vsN8jsAAYInW5IWyWCI6rsHzLBDt75X9YauE17eE+mzJtbDb6jpP4jsg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4x7pVw3kTtTo6z4roNM3pPn+yUURUJ1R4CRlrWOJ+8vZIrbTO
	D9hp3dSnpWNvQsgM2JwbsQsdTMCDUZ+13gL6bPhcu/yxWLrXF8MFDx+iMmsQtSKE2iI=
X-Gm-Gg: ASbGncvFoIcKbnZ69FSi6BgEPGTB7lVMTksVfm9bnq8xtozdNl29LY0g++pEWVwvBvM
	pIojGsA41iwff8uFY3Qf+eG+N9L8PRhEam7qbB6pcfm64lb8/ZNMaW4ESb9JeeQ/rfIMIjnDlYj
	3Fm/NVHQQuHCYbGVaubDcIYwdir8mSgNOE4Izw5zfjMWShePlJgdOIONIVNGoLPAs+9YmcP5ijH
	sGAAXL4eRExHr/XIVWdCW9CrlwHN8L/YwbURguvYggIzcEgyADDlri2ZwTjRTQ3cHK5qJ/qKPHO
	d5X5qq777FJmOzCOpsAT3O07xb1Yag4ODQmOypV41dGVFUefdCA17BHqr8TALifEpXR44h1k2av
	MRrf1WYgNq9w8tiA9
X-Google-Smtp-Source: AGHT+IEcoJsgmjphkLaCY8z1x0fKRWtSW7NIH2rbVg0Bebi0KJdLdeLAxxGphoPes56w3cIWmHwWUQ==
X-Received: by 2002:a05:6000:2212:b0:3c5:91be:2abb with SMTP id ffacd0b85a97d-3cbb15cb064mr776761f8f.13.1756200914980;
        Tue, 26 Aug 2025 02:35:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:04 +0200
Subject: [PATCH 03/12] gpio: mxs: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-3-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9MCYThfKCHi9V3LmNZZ162FlxVao+jUCJlB1GFrLa1U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/Ms1es94ApzC2OU6uJvsfb71RsumjFI0ECG
 asyeGyiBViJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zAAKCRARpy6gFHHX
 cpKbD/9XhCYwy0uO9HF7kjT7iMcsW+OG0CBIKIZNICRSe2gz9bxqp7ZkzGEFy75ZhruK8txyRHM
 1QljkZkUlMc4VHZzUDaTn0kmO0ZjZJj/UmWeLrjYxVZbScxHvwnXdUeoJCehxXtS1cAdFtdAo9j
 sIIQtC29Lvp3zyYgs/BvkqBz6uBHnlLUjrj2w0zpLYN2kA2xkMrCCP5RimnAeR0j8MBegwta1Hy
 l3c3S1WrVTF1umKHxWJsxC+8q57se+Sxzk6IIikNDu7M6aPAMZdFpaDVgkiaL0OMfRvemNNWa9S
 zIpJIt7g+l1NOBFXKsDLTWCbgpmS6YX6eNBgm2MX5Yv+MtmXitZL79GU8VNYNFkXaj1wS6u5UFn
 qVrUTfFWrnZ7ZoIU48RtQDHnN1pptQShtsKl2EPelamaZsPdPIRaslXV3N9YBf0Rr0z69fmAXXX
 PSqOBLuvaylNBGIq6RzxslEZ1rvVw60+LTt4/fmNiTsVt3cux6Lq3brvc1D+uWALEa9SF16ewWY
 b11ayAUAoiSCVWDX2uuSMQ/KTcFlW1qr4qce4u/2q/UjRxSIMf5xyDLtDJVtyYB6DJsiLrPX1pA
 /wdqeFK3IhPoU8Oy6rnINzo7Rk+u3uCZuefbHiJrOQv+IbOEZRsBgX0mZGtkwhT3pMQKcM85eoE
 PDNXJixR2NMtbxA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023516_569844_E5950659 
X-CRM114-Status: GOOD (  15.45  )
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
 drivers/gpio/gpio-mxs.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index bf0c97f589c96a5dce37dc140babda5998d5e365..af45d1b1af6e049899ea6773bed92fb8a84a0dff 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -8,6 +8,7 @@
 
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -48,7 +49,7 @@ struct mxs_gpio_port {
 	int id;
 	int irq;
 	struct irq_domain *domain;
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct device *dev;
 	enum mxs_gpio_id devid;
 	u32 both_edges;
@@ -258,6 +259,7 @@ MODULE_DEVICE_TABLE(of, mxs_gpio_dt_ids);
 static int mxs_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct gpio_generic_chip_config config;
 	struct device_node *parent;
 	static void __iomem *base;
 	struct mxs_gpio_port *port;
@@ -319,19 +321,24 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	irq_set_chained_handler_and_data(port->irq, mxs_gpio_irq_handler,
 					 port);
 
-	err = bgpio_init(&port->gc, &pdev->dev, 4,
-			 port->base + PINCTRL_DIN(port),
-			 port->base + PINCTRL_DOUT(port) + MXS_SET,
-			 port->base + PINCTRL_DOUT(port) + MXS_CLR,
-			 port->base + PINCTRL_DOE(port), NULL, 0);
+	config = (typeof(config)){
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = port->base + PINCTRL_DIN(port),
+		.set = port->base + PINCTRL_DOUT(port) + MXS_SET,
+		.clr = port->base + PINCTRL_DOUT(port) + MXS_CLR,
+		.dirout = port->base + PINCTRL_DOE(port),
+	};
+
+	err = gpio_generic_chip_init(&port->chip, &config);
 	if (err)
 		goto out_irqdomain_remove;
 
-	port->gc.to_irq = mxs_gpio_to_irq;
-	port->gc.get_direction = mxs_gpio_get_direction;
-	port->gc.base = port->id * 32;
+	port->chip.gc.to_irq = mxs_gpio_to_irq;
+	port->chip.gc.get_direction = mxs_gpio_get_direction;
+	port->chip.gc.base = port->id * 32;
 
-	err = gpiochip_add_data(&port->gc, port);
+	err = gpiochip_add_data(&port->chip.gc, port);
 	if (err)
 		goto out_irqdomain_remove;
 

-- 
2.48.1


