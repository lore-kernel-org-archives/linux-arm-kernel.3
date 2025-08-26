Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA962CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+IgadMPCpUC/++KjLm3bCMV9ciEZYRAzPqmSLRp9gI=; b=poAqGU+38Ez7ktH5OomByIEp8E
	3DF+MMU+qMmDdsliCTWp7HP/fC97uTFC8Y4wxxYKK7k56FxU7hWuoRxQH5zXqo5PZv2oJU4WtNN+l
	1pejrAtZ4vd2m0+TICHddJ+JH8noAxKTuDFwO+TLpNdlu6eXmoswlwoRcDheWdN/M8wiUdtFm6EqX
	jF0DDulJn6M4vQAdWsbEQhWCZIvriXOQohriaNwVphYz1Y6amAivurKtId9g1Ww6IF8UJG6lyAIFX
	VeoqZ/ZIRjBo8fmVXyJO6WLZNUX2QuZ7VFrSg2995UuqUZsUP6ylNZSuR39S61CFY1fIY2lR7eTi3
	XXv8gYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqZO-0000000BYdT-2wqL;
	Tue, 26 Aug 2025 10:06:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5N-0000000BR69-42ea
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b6278893eso5048015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200924; x=1756805724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+IgadMPCpUC/++KjLm3bCMV9ciEZYRAzPqmSLRp9gI=;
        b=lrFsPrhPaaexCgazWvzisTPcneYLPW27Os6h2XxrPK2F29GU5U9DIQWWV8a1Q3aNq9
         2t5zOsmkl4w2wEIob0YkPz/aqAzsajCy+nTqND8tZwF94Vt+imsMq8m6EBk1KkQ6JEbt
         OkkTuj3Md2K8OzUN3g/jbyH45gcwQcBctlUJXiSqEpL0QdsIF2UNntlguErh3rTcq9f7
         QcRdhOwqtjpQ1fT6pFL4EmlQmteTH1ETlQgY2VLRwK+/I2xYIUPPPXPmzfHaZOnpUqnZ
         2WA+KTi3wSBpBe4SYWrtv3Ve5BE52vsNVfYZzGnJ5kfOyWarBlBeMOlqcu+YkOFRqzWl
         7cLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200925; x=1756805725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+IgadMPCpUC/++KjLm3bCMV9ciEZYRAzPqmSLRp9gI=;
        b=d/NkbAX5qw3UkyisXhoT2TrypEMehfhPucSZTSpZYzSxjrh7KeYqa0R25f1r29NBcg
         cmaokgKTVimhKaGg7S1uv7k8EqcPNM928WTdxItrsHdBOAV7pcNIyvRuJ9VaQwyFGX2v
         GAGjTzGLkWgFUmNglL5chkEiMKFHUyYzHQqECeyDakkwCLc+KCr8VexFIJNYdF7ICGrr
         1M3LWYqCdnyKmBZxJcAbeEbrlWPjs6IBImG2M+YnU4fEEl71waWT792gIwrbIqWQCivG
         zzDW0sLWj7iKOSwcdGlEFXHUq5YmHAaFhha7s0vcxE6U+tAp05ORulXpmBFAnswHpvN7
         tfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV458jvJtt1bmQdj8fLlBplRi9izu2SsUewQtzAXSsDKBMePH89avGMO/waibmDlxGXV1yTjs/TLiqtOFXXb7W8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Ng/PV21GgY6+1+lvXDlQ0zlmuARkeMF/eyPB4U4jh0o3VVgl
	VRvYqTZ71QIk4/UKHxAeLD8HFKQMxsFoyDZtfONaP5IugIRW1gelyMoH+QQEf2zHXts=
X-Gm-Gg: ASbGncvVFEaQeYdopaVKqWeR1NNTrBMiOK+q3M6ka6/sVf1IQwabyC+73KQiHSmIKji
	vKXQ/A4/W1KWqxPU4jQeRWHp5OqyxKp2yRHrkZWF9uTDVTx5xuiRJEwju0FWp/kKsZ6I9JghkvV
	5hPHGUv4emCeSvEDPdMsI+1hk/gioxXwcjeiU9zLd5ZvDr9MkX6d3sUlT3q4j6mst+dr2W4YPDX
	N27kNMfS2KQaT7eH0Z8mQvuAJyn5f2WU4aVLKeacSYirfFisDY6M7CtIJC0Riegv3LN2VPoupg0
	F/UQYd3sAVBG/ezzIJHw/u4TSUC4d2i4xwwcmrccCoTpYrjy18bpcdsWCg3ddPC7VblPzKnMdB/
	kjn4tlEP4PFjT/aG2Nm+4qSPkSD0=
X-Google-Smtp-Source: AGHT+IHavDr4lrXb0tPvaZh9I0fsnzNfSPDgciGk3rvyy+vJ1h8FkIwM72xQkP5w3hRvc6eVrPvNXw==
X-Received: by 2002:a05:600c:6304:b0:445:1984:247d with SMTP id 5b1f17b1804b1-45b5b8c69cfmr66389295e9.7.1756200924523;
        Tue, 26 Aug 2025 02:35:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:12 +0200
Subject: [PATCH 11/12] gpio: vf610: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-11-f67603e4b27e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2652;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xP91+sQmCcnIVqvhAypk/fFTL3DNrTmtPL9RCwg4XCs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/OhdHiQnRyfyg1vUekmEHI/tZKgXv2KYL7g
 N6Wbnk0GbKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zgAKCRARpy6gFHHX
 cvLqEAC0h6J0iS+i94SQVe0tR2djzaG6SV6OY3nkavsLHUwPZyT0UUZkLXuVBLSpjWPh/hQWloA
 uqGBhuuWOBldA2Hq4s+bd1eaEgaGrf1+0I1ov5j/z45ySprWLwjQqkLf/u5Cux1idHlYjizwhBD
 0dNt/F3n238/pM2ItXXbI/U4ed1VzzgZblWGLIL2V9U4XGYetHrQmh78gETOJx8OnuJZ1yjSSRP
 9roWryAijuw0u4FS68iUCa01c7JfS4JAkPUoP8wrCBWt1nj/NYF0hfmfhPUhVdAY7IP6sBwDpcq
 Hq4+4C4LdOM2URb916kFJeyFA8zxzitKezkAVt1wM2MORyLjsPUlKiK/85TeCVAXMyHt4n8mTsm
 Ntd8RLldBDqAfuFqY9LZHTv2yljDouhsIeAg5q372A1/rw5/K2VSba62S5uqlrGsGeKkwz3uVHf
 /k947P0Kyq9ci2RLaMMCTMMcMXkAeOY6wfCPIBSYGtCbrMe9Qn665b2RO2ZHgxUJZjCb1jU7hMb
 UcqvmUXSELXpCc5Xd6LjFfze335frTNuIvoFLPeyJRlQhgc3wkwCOUdysCJ2OHwTgkWw/l6pf+7
 6HItvyUMUdHIDgR3FIUSSuqJjcjF/M/qPXh2g3lETY2dboNExiHDcKNzthpzbfpWDeJFfJXqoR6
 u+gOUvpgQdcJDWg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023526_026955_537E4A4F 
X-CRM114-Status: GOOD (  17.71  )
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
 drivers/gpio/gpio-vf610.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 7de0d5b53d5604784a84def54f284f263a9e12dd..fa7e322a834cc2afbab7d4948cd41465867aa4c8 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -28,7 +29,7 @@ struct fsl_gpio_soc_data {
 };
 
 struct vf610_gpio_port {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	void __iomem *gpio_base;
 	const struct fsl_gpio_soc_data *sdata;
@@ -108,7 +109,7 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 	for_each_set_bit(pin, &irq_isfr, VF610_GPIO_PER_PORT) {
 		vf610_gpio_writel(BIT(pin), port->base + PORT_ISFR);
 
-		generic_handle_domain_irq(port->gc.irq.domain, pin);
+		generic_handle_domain_irq(port->chip.gc.irq.domain, pin);
 	}
 
 	chained_irq_exit(chip, desc);
@@ -214,6 +215,7 @@ static void vf610_gpio_disable_clk(void *data)
 
 static int vf610_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct vf610_gpio_port *port;
 	struct gpio_chip *gc;
@@ -293,7 +295,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	gc = &port->gc;
+	gc = &port->chip.gc;
 	flags = BGPIOF_PINCTRL_BACKEND;
 	/*
 	 * We only read the output register for current value on output
@@ -302,13 +304,18 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	 */
 	if (port->sdata->have_paddr)
 		flags |= BGPIOF_READ_OUTPUT_REG_SET;
-	ret = bgpio_init(gc, dev, 4,
-			 port->gpio_base + GPIO_PDIR,
-			 port->gpio_base + GPIO_PDOR,
-			 NULL,
-			 port->sdata->have_paddr ? port->gpio_base + GPIO_PDDR : NULL,
-			 NULL,
-			 flags);
+
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = port->gpio_base + GPIO_PDIR,
+		.set = port->gpio_base + GPIO_PDOR,
+		.dirout = port->sdata->have_paddr ?
+				port->gpio_base + GPIO_PDDR : NULL,
+		.flags = flags,
+	};
+
+	ret = gpio_generic_chip_init(&port->chip, &config);
 	if (ret)
 		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
 	gc->label = dev_name(dev);

-- 
2.48.1


