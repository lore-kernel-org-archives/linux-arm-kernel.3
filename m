Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3891FC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=; b=Zk+9r23/81JGdEra29uVTk0oDj
	F3avRKVO051q98YPpy9n0IRxNG21vS82uKF7+UUosIXQ/5B3qlXwstVvWNTur8V2Bk90DvjaM/L9p
	2wfBdLwlsnWF7AXecDVvFw0JNrzFFBS81BJ1OmxLuGD4O9QAd/snzzZmm1O6rYY+tgzM/gjXpx5Go
	uxxAK99RwXtI/L/bkmIWvKX7nKFpIw7J0ojoRP5G2eRLSnR00HxpGck/mDMhyMdi1bV4nVSRrmY//
	jKp5GJGc+aFa4kGBngKQCkfmIb7jFrD2/5Mvxa09TQBVZYM5OcUGtzd3Zn61EWBfWW2063vpmpOWa
	YqUPqQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBED-0000000CYi8-0IBw;
	Thu, 19 Jun 2025 09:06:37 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiE-0000000CRIt-49Ne
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:36 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54700a463so274710f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322013; x=1750926813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=;
        b=2OcCMnJ7v2dPITHOk1/SUFY7ZU0fy6AOMMtBkRFrX1heIeMp5MKp1e2z7jV9DLi3dV
         +8N4SDwGZL+d6sb58ph934vIwVs8kG56L9uZwG4fHr3I0sSi68CLNCZrUolekHcgp9Nx
         VX6Eb+36cpej87SkP+VmxnoCc2QaJfi2E3OpiS9ZHC7Q7ECGBpWW/WeYwZzd4PsLS5uo
         fx2rKpWeFL37+AQMsa2Whztr2WSVyfG9TO0J9Ez1LaMxQmkW/rvPfOt4sYYvAEDEdoqL
         0UjJMgBKpatZzkTmtB89N3JDe0q1MMQ/zCw8sEUaaNThVGpo9iL0UCxBmJkDdS+yzCyW
         EZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322013; x=1750926813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=;
        b=u507CnlOKfUqpchVYK23bwCaiI63uDZb9rlXWhW7yiivqev+DuJmVw7f8bSMGXyooU
         ljNTF5V94SxJCSr384+cgCrJZFk+IjsLJoG8++JxSqG+eUnzd0D8T/WZQUmiRgeyUjAy
         MKddNE8uBRLxFeM8tzhrv4SBl1iP6NLPqdJn/UiGvfEpnvlr96jGs1Oke8TWHbo/pGah
         KjJtP96ICzk4Ld2ZWCtduZORAiwDhtKsTHrpMDua3mh6F74HiewXNi5bY98TuP5Dd/oG
         mw/aXc1vtfnuCF8mM5laFraduOSv64OhzNM6+l90Ka3oucdQKx8QgzijJV1dud1T3dE/
         azQA==
X-Forwarded-Encrypted: i=1; AJvYcCUKqUIDao4z3Eackoo8CEFbKmr0Ug7Ky3Vf2YEzz3T+u6sgPq8tBMh4HHnpLKU2nbh3xa1K8ZQpzLCGyUaBiuD4@lists.infradead.org
X-Gm-Message-State: AOJu0YxmT8Znyal+suVJ7kpxtWTzCytwI1enQFcFh8vN2Q1lqHDyyDaT
	ATa+vTNMty/3CiL6SA9XAkB59hTIL5/Tio/PipIrpZURc22LW6nIHN9Q7GfTYxA1Aaw=
X-Gm-Gg: ASbGnct/angDu0K73rBooYM46TVevkQ4FxvAfpPM0ETC9wa6/VcTB+JC9/PTkInFG6D
	LIDLOxbnqLwkvI1twdLj8MPZtEYuLnLIdYzJpMD7jd/6o2Taj03oPCXbYknmVGxdfMlLUUqRgIm
	m7LBA6FtraYC9IKNM5GrrlMGmIazQFvFlPsOa+LIJts6Zqrube28HYGtQBsHGV6FnaVrooXWPMc
	cxMApGNEz/Rw2PDR8mMd5yxFyo70p4J3V8uNkijt/eF6vUEMfv/gSDg/I+GsQSBvrKX1Da9gJZX
	rX4EvI35z7MdrK7qz3fXxF4Q/kBhQQiEkKMMWBv443l7BPCnvVPBCJw6
X-Google-Smtp-Source: AGHT+IEYd8zh0M+GIxvzO+cbczfDdVgwEB9/rBo3uvdJxipNvbLdwuD0peBA9caOs/ahFdM6KsbEFw==
X-Received: by 2002:a05:6000:1448:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a6c96e5663mr1866539f8f.23.1750322013194;
        Thu, 19 Jun 2025 01:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:20 +0200
Subject: [PATCH v2 07/12] gpio: rc5t583: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-7-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2356;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aSlqvGnhuSY1VlIGZB65GCCYVPKtjnadnIRxz6DCqho=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhTy1KgqNjnmKmQLkXGxxWam8m1Wn84v8Mmm9k8q48PP1VEY
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoU8tSAAoJEBGnLqAUcddyFFkP/3zl
 9RL/sxOpe2l7ZXx8muE1QdETZweVSf+QCakclyiBOlu9V+DX29m4PgdsLs7RKPBYR0bOoIDi37b
 cUxvgu1Db2DezcO6Hg/kISB1+kKTP1ra+mLibE2HkoRO0mGxEZUk5K7kWPfZxSjj0TkNOmIYb0u
 w0USK1lo+9vZbTXvUhMyxNzwP1oIzKV4EWICo7JXE3Yb25kPiera8eYaDQJmiGVzqsx2zlhOY4y
 7JpKNjCYk38N9bAJpcMTpRe6X0HRqLob3wwRAWArAqfiyx4pM391d/laNhzmaB1EXW1G4p3X//z
 kXkuOi4cLqMXpbFt975vL5Aio5buuqcB83ajhxzy3o4j9rx2josJqR9yLf6HyV/FrTjJPQNRHw8
 NFmhK39BfihcDsv2CStjI+rOhyR3whWppE+BvJi1H/Coa74Nsu1RblwOdUZzsvAY2NZMdgFXeE7
 X+5yOnzSdyGBGTPyO1Nmy9T/cPj8C0zokeHVrUU7+nsQuYPa5xy2UNrO8KoZoZytP5mmMTmmupL
 JHLECUgyjbL/duwYUzSsQGm3c8sEogb2FjvnpzeA0Ryk2j+tI7D0R03WcI9DpCgUNZSVWpGgk41
 TStG9T3DmCHn5cFwFUUV/EdG9woFsowNaioLk3P5F3nzAJk4sqhrc1Ge2ABs06g4AZ0JULQEtRY
 L7iFT
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013335_031019_69D6AEE9 
X-CRM114-Status: GOOD (  14.15  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rc5t583.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index c34dcadaee36d5fb775d4aaa8c8f8b275f4e2382..cf3e91d235df2eefc7d0fc93a58824edd55e9aba 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -35,14 +35,20 @@ static int rc5t583_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void rc5t583_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int rc5t583_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
+	int ret;
+
 	if (val)
-		rc5t583_set_bits(parent, RC5T583_GPIO_IOOUT, BIT(offset));
+		ret = rc5t583_set_bits(parent, RC5T583_GPIO_IOOUT,
+				       BIT(offset));
 	else
-		rc5t583_clear_bits(parent, RC5T583_GPIO_IOOUT, BIT(offset));
+		ret = rc5t583_clear_bits(parent, RC5T583_GPIO_IOOUT,
+					 BIT(offset));
+
+	return ret;
 }
 
 static int rc5t583_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
@@ -66,7 +72,10 @@ static int rc5t583_gpio_dir_output(struct gpio_chip *gc, unsigned offset,
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
 	int ret;
 
-	rc5t583_gpio_set(gc, offset, value);
+	ret = rc5t583_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
+
 	ret = rc5t583_set_bits(parent, RC5T583_GPIO_IOSEL, BIT(offset));
 	if (ret < 0)
 		return ret;
@@ -109,7 +118,7 @@ static int rc5t583_gpio_probe(struct platform_device *pdev)
 	rc5t583_gpio->gpio_chip.free = rc5t583_gpio_free,
 	rc5t583_gpio->gpio_chip.direction_input = rc5t583_gpio_dir_input,
 	rc5t583_gpio->gpio_chip.direction_output = rc5t583_gpio_dir_output,
-	rc5t583_gpio->gpio_chip.set = rc5t583_gpio_set,
+	rc5t583_gpio->gpio_chip.set_rv = rc5t583_gpio_set,
 	rc5t583_gpio->gpio_chip.get = rc5t583_gpio_get,
 	rc5t583_gpio->gpio_chip.to_irq = rc5t583_gpio_to_irq,
 	rc5t583_gpio->gpio_chip.ngpio = RC5T583_MAX_GPIO,

-- 
2.48.1


