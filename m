Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C3AC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2i5IXHDrYsUc/Tn17nFSzjMPGS5SokuRGh4FjnxTpw=; b=JD5YqsdW5sDPUmKlTfhvlkz1D5
	8jlzFHnEXHFqFvfMltqG1vwDV6tpH5tBrGgMzKog3cFS2ce0TX7e8vRUDCO4O+Bud1PNOqGpYMPXQ
	jOG44wGv81H27oLNMQqmr897cS6vTc+pP49pKcyNZHHgZbD8m02e+c2EGxxGVdXzJupm9K3J0gF8J
	CfuUUDsLkiFFoaDxJUcJzOFADGiyXaJgtg8a/uWbsaZc+D+h351vJf7nAGp7O6kZ7hJiDb91raCS/
	hxOUhpUqd+4EdqGoXuelVYYWKb84I+SH0om5uIst1N8huT1UTrWfvbJXWeQl2Th5PqPWyob2QZ7On
	N4dzLYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuDn-00000007rtX-27zV;
	Wed, 02 Jul 2025 09:57:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfd-00000007kes-0Byl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3797012f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448143; x=1752052943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2i5IXHDrYsUc/Tn17nFSzjMPGS5SokuRGh4FjnxTpw=;
        b=SxTRbhvgBhqs9aQJQMckvkQCwAGLFMlxOREX+nok+9VdandblzJRfv5yAjBCRViDGA
         9btdaN3PBrr+YW4GLk3PA+SdlM+TE5rSr/nmIQZNB07fkkde0hGa2wfFgEHFtELMRB0D
         U8s6J10rE/rsBiHBfP1q3kA6STVWYZ2sfHVkc3saR8D9XyIUNZnXpp+BKou9gf0uVX1q
         VaKuEzL/IavuPkFqDjPVrfp/DlXsT1P5aJJy45sAHtQyg93DChkkCIi82xtchJ7BOIfI
         YJtSE18md7kYZ+PZa0jPqjb3YgO/nzc6+wzCFiYn+wwpkSZOP6esP/IXUbp+7xmpiElj
         cSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448143; x=1752052943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2i5IXHDrYsUc/Tn17nFSzjMPGS5SokuRGh4FjnxTpw=;
        b=WsnWgGk4Kse9xnBQ/Jy+Js/1Jx0JDf5R/A5/ouzKma9JQAqToMdQVIxLI6EFeaoy7e
         4Cs1jmfqEHz/4LCECkBRWGhBiKzJcEw3YGONM6f8DRzb7hIf+MXl9DGUBhxKUYYW9RCT
         SD2Rb3f2qxIUE3047WOVM3xqgSQ7e81SUtRwDO7URJiZts7m96LvcMpuVqD7fxrqT94V
         zg5aZ5kwv5D0KFEnSWLFFELHcjPFFdPp+zIOrKCZqwrDhYpugI8yAIFVmw6f1MJU2oHQ
         yUGdlAnOd7jyAtD7n359Z66m9ey0IJwix/a2+VuXEqweToFppIFxk6VOVJmumMlW6YpU
         kxsw==
X-Forwarded-Encrypted: i=1; AJvYcCUlIr6A/b5dMbOBP1E6KkCaCzDov1pGFjPAF18YrYMr5PedypYRKmTKoj1VorpfRri8HF63504W9FF9ZEXrE5xG@lists.infradead.org
X-Gm-Message-State: AOJu0YxBokzT3Qji17jGdnm6mg1v05iB5NXHw0Fa5aJrhjxPeQRbWBik
	MjJjGkBKwzj2LJdK0I3S8ZjbkGvg7eE9eupqyyBlByi6gN4Ye1B9kFebaB4GbSNkwc8=
X-Gm-Gg: ASbGncu2QKcUCQb1JWIvGhkkpC+Cn/Eg41T1XFU3Edm48NQghkX9KR/ZwrVv1u6GPO8
	5ZeLfjpS/BMppIAWMYnOoufWQm+18RPtjdDrG9jrcBfeUbQ8eLaAo+whSIEWi9CvfZN9PO7z4mW
	gCbIg97f1Fnx0ZTlvPWUTpHIS8h/jrJmsDmcqKKufMZWZs+Gf/s7DC5gmQWXdz2oW7r+ABkkGXW
	XtYuLs7xeZFqvbC24srsUe7hGl2Qqw9qexRlBQ44VEL/dIzfZNCIxrk+cDEd2E15/GpLKQ7fdAm
	5DSWMNE0licW5TPZtmg+Wmb2MH9+fjV3eZZ5D/rD6RYt2T++/rQIsg==
X-Google-Smtp-Source: AGHT+IHqzoytGZsKMlgoRsXyN3XDOj0IiS+FUXoOYFtH0PT8GVRyyMyck1Y8DKbhl5NYuCMHrTWO9g==
X-Received: by 2002:a05:6000:2083:b0:3a4:f939:b53 with SMTP id ffacd0b85a97d-3b1ffcd6477mr1625551f8f.38.1751448143475;
        Wed, 02 Jul 2025 02:22:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:15 +0200
Subject: [PATCH v2 8/8] gpio: en7523: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-8-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3831;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bWHsnwR0yWBpKvxYpjrvU4Drn4TZUDb/OIAKGQMvuaU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpFdMyJ+UINCiz6R9O+qXkyUiIM7pZReygQU
 4K7+xodRo6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RQAKCRARpy6gFHHX
 cj1mD/sEuWGffBMokzY6eLNDHWa9NDI66dIkEd4DeoGLZ+5mgYBSVOY4IX/2sfJRJPC7u/NWU3N
 iGtN99VVMrQkcE/jWg2pi4VztxciMgsAjolZkYTxw9f21U6Vm9/5u8eAGM10VZqydOcBovkEa3U
 rdKOvhJpPqGiKTnSCB7/owvSsaiOxis/N39s6uaULLYd3Q/VAnVaSigE/LN9yE38iKbHXAhhi23
 byVyjQIoMa/fU+1VF6wSAZDTdnu7ewB3tItKln9yT9tntUIhCVDNTNcB6MPajPdSZVv/Wva+pKN
 QuWEiV58qhcdpV+gPxad/kI4WCIkuknzCt1Obfo9Jw+V38hnthNEOR30wfpFsEBVktQs/GE8glC
 lUilXpCPnJiD6rSUMLZJe08nNCuj3VroJT1RYCK6pjI3BGPIEQmb7yQv1TpuJ+0miVYOyXNzmsC
 P2PogiIZLhpylqVCFDR0ospXP9L/Lk9IgO4yNwEM2Z2jUi3b4NLUPFe9X8EQfrPlFxc+bvpVfXo
 m+dWjyS5i8/QDdFyTO7YzwMDxsT6Cne3LYLtL/GBLieHhx3GFNkmdm2pZkh7Y6BvkEa6d7iVJ03
 n5IiEuf2HgB2gL6nbq2X+IU7YDkJGqQBiPJyDgs8fmFFDjWaf6+jJZG6ofJYi4MzDh0UG6bodh7
 D40y/GY6tWaeFEA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022225_095138_167AD369 
X-CRM114-Status: GOOD (  17.39  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-en7523.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
index c08069d0d1045e9df4a76cad4600bf25d4e3a7c5..cf47afc578a9cea1fb1adb97f51b143b13c66ab1 100644
--- a/drivers/gpio/gpio-en7523.c
+++ b/drivers/gpio/gpio-en7523.c
@@ -4,6 +4,7 @@
 #include <linux/io.h>
 #include <linux/bits.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -13,28 +14,23 @@
 
 /**
  * struct airoha_gpio_ctrl - Airoha GPIO driver data
- * @gc: Associated gpio_chip instance.
+ * @gen_gc: Associated gpio_generic_chip instance.
  * @data: The data register.
  * @dir: [0] The direction register for the lower 16 pins.
  * [1]: The direction register for the higher 16 pins.
  * @output: The output enable register.
  */
 struct airoha_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *data;
 	void __iomem *dir[2];
 	void __iomem *output;
 };
 
-static struct airoha_gpio_ctrl *gc_to_ctrl(struct gpio_chip *gc)
-{
-	return container_of(gc, struct airoha_gpio_ctrl, gc);
-}
-
 static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 			  int val, int out)
 {
-	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	struct airoha_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	u32 dir = ioread32(ctrl->dir[gpio / 16]);
 	u32 output = ioread32(ctrl->output);
 	u32 mask = BIT((gpio % 16) * 2);
@@ -50,7 +46,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 	iowrite32(dir, ctrl->dir[gpio / 16]);
 
 	if (out)
-		gc->set_rv(gc, gpio, val);
+		gpio_generic_chip_set(&ctrl->gen_gc, gpio, val);
 
 	iowrite32(output, ctrl->output);
 
@@ -70,7 +66,7 @@ static int airoha_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
+	struct airoha_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	u32 dir = ioread32(ctrl->dir[gpio / 16]);
 	u32 mask = BIT((gpio % 16) * 2);
 
@@ -79,6 +75,7 @@ static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
 
 static int airoha_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct device *dev = &pdev->dev;
 	struct airoha_gpio_ctrl *ctrl;
 	int err;
@@ -103,18 +100,21 @@ static int airoha_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->output))
 		return PTR_ERR(ctrl->output);
 
-	err = bgpio_init(&ctrl->gc, dev, 4, ctrl->data, NULL,
-			 NULL, NULL, NULL, 0);
+	config.dev = dev;
+	config.sz = 4;
+	config.dat = ctrl->data;
+
+	err = gpio_generic_chip_init(&ctrl->gen_gc, &config);
 	if (err)
 		return dev_err_probe(dev, err, "unable to init generic GPIO");
 
-	ctrl->gc.ngpio = AIROHA_GPIO_MAX;
-	ctrl->gc.owner = THIS_MODULE;
-	ctrl->gc.direction_output = airoha_dir_out;
-	ctrl->gc.direction_input = airoha_dir_in;
-	ctrl->gc.get_direction = airoha_get_dir;
+	ctrl->gen_gc.gc.ngpio = AIROHA_GPIO_MAX;
+	ctrl->gen_gc.gc.owner = THIS_MODULE;
+	ctrl->gen_gc.gc.direction_output = airoha_dir_out;
+	ctrl->gen_gc.gc.direction_input = airoha_dir_in;
+	ctrl->gen_gc.gc.get_direction = airoha_get_dir;
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->gen_gc.gc, ctrl);
 }
 
 static const struct of_device_id airoha_gpio_of_match[] = {

-- 
2.48.1


