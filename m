Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AACC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaaCcWQEpgQqhrIPeRlyBC317ztdMOh1gJCguFqoNso=; b=m5VVjJU+d3p6zMZYRdRt+6biTB
	ZMxHrKb4xvv8v4HTcd7LSdsvRSNLagEhsZRmkMe8ICaiydMpkEdLNgrcSELy0sh9R8a7W/HlUFgD7
	cA0uM8Tf1sdEMNERKegbgxqtfxDUrQTfOrwkAjaEunFCMpYsnLeduAQDqL5zWZDRJVFtBIWLSFgJo
	N8NUyme9HZjbDDT2AEaAZxwjZkk/yIBK89gWd63EnWWNCghg2074kkSxWUz+YXduMK56a/tAqCZQm
	J1Mp61atG6xyWykSfLSNP/Bbu4K40QE8/5PwMW0p4d3HgNWIbBEGsjFb/Ql3yhd1PpY7PSk9wGwS3
	3kL4jm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UWF-00000009W0J-3AP7;
	Wed, 23 Apr 2025 07:27:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKH-00000009TUm-0fmT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ac56756f6so5971748f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392519; x=1745997319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IaaCcWQEpgQqhrIPeRlyBC317ztdMOh1gJCguFqoNso=;
        b=sEEeq+g/qyuxl2EiwAxXHfD4fHYBsFJEQOHdWFoaLukQ9qBCxDoNjUOGqCYTtrPKRl
         E0GwbgQvP56AYiSc2ms1wc1jmi0oeUI01x04wuw+2TceAqsIyhKNZXHssx8xCIKFug1q
         bl67unJz6yxyGMiDUBZhqItuj+HzcxUSOW46lgjc0KXmhd3CwbVtH9NEFOzpKluu5gek
         IjIdLnoKtEnlWkl8sco8fBhe8kACki4eugYdFludeBQ4CsfONoR1DGSvd4kPr4JofEpF
         qx8RUMcdm2YMqN+G2+fApac24XGvEibCLecAa7NHhzHbGsKFNsi8oDYbzxqGtJtWS5bR
         ra1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392519; x=1745997319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaaCcWQEpgQqhrIPeRlyBC317ztdMOh1gJCguFqoNso=;
        b=kZTLtGlWnACvbiOXGxdoHFMXZAfpGFUYgZKTWMCcgJ9vzAZrFx9Ki5f7XcKp8bJyfD
         XHWtkcmgAWHbgGFulqJGimLAs1CesAcje9jlL59E0ab31klWNWZs0nxmjA+B/hAVs63w
         lpGpTz2VS64saL3p0ZUJV6O8gDXKlqKUN9q8d/9LuESoXZiOVIaJpFEgdZvwCV3pbPXv
         MMu/EL/NM/SNXNoYAUjh/4/dTVsCWe3HfO3AU2NLohxI5vesx+vZHXzvBusPvQnA7aeO
         YQ9BJC68meayWjFReKGtJWKJ5wF+fBymthP6b6hTQMzAKfdr4UHFBOgdwYHNtd/Zl9tT
         kfRw==
X-Forwarded-Encrypted: i=1; AJvYcCXep0M89gQG77gQvpe/r9bU0cBIn9X72vpjKH71+GiKJxQxP3XZxf8BkkKl8r3mS1IsuB19Hip2if1PhzfC3GpY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+spzN+CGvXdmtPgXqqaj+9Ay/H4yyghLNeBXoUmINliwNN6Vm
	xRJiTPaltChRnlvU8Yno4y3M7CnYRSPjTwV0kVB5vPFnxApW+vfOQQNvDdmvDCI=
X-Gm-Gg: ASbGncsDBrph8ud3tsPe7RCXHQdnpmnc7jOJcp+BF1RBp1FhkG6G524NLySGxKg3d6w
	JDEHjwnoZBThVgEHGImREmecsKywjCGfCoGC5hFrF8VxEDkOl4nNqaq6O3pjbqeEQv1pX2t4OFG
	6kwer3grwyahLxhnhIDGaYOEG3UZaA+f0bleYvFC5o6oE3M5rLELfEM2n0k23qLN9akuq4Izsl2
	gq7z2BzSm3L7nI7aCkwymrJN+IiqAyIYDZABKmFc6jYZBQ82pNN8i7ioCYiwBJFp/fG4ZatBFuM
	jjZt7e/ZyLMwNahKmGWPH01TPaLDj+j6cg==
X-Google-Smtp-Source: AGHT+IHC2rSEasii9FkOaKiL6XIMR2zDQ1U/aLJaI4vDnkPd+Tv6fEi8e3lqW8dmnK/ba6s9rq+Gjg==
X-Received: by 2002:a05:6000:2481:b0:391:2e7:67ff with SMTP id ffacd0b85a97d-39efba385bcmr15370237f8f.10.1745392519435;
        Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:05 +0200
Subject: [PATCH 03/12] gpio: imx-scu: destroy the mutex in detach path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-3-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=734;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=A6bOamIB72oLQ5hGEzR33QH/Bp1B4UCeWKdndCamkEk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB+u64B95UsQFPMVESK2lnJJswqucR49QiU
 qM5uRtHVDiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 ctxxD/wLXd/qsQ0BHS9BlhvMEx5EIkB868jx8LxJQeZcjlDMcX648FqIzfKRWxNlFmYkizyBzur
 smmCVpZ2i/RMhIT6Sn2ZGCXayhBTCBqg8uwjgUGkLffr+W9TADoqUxL9rwOJbu52eTuK/2yg0tB
 uJS8VslXfZbqM44s0YzRxrFhegxdG2mxmjFCZ/4r8d4A86zWCv5wqrELafdwu2YU26wMONIYq1n
 DC7RgVHjq7wCEKeJS7K6+nIgyBdR46ZOaxfp5FT+1DJLWKmL/MUeSRH8ghe+oPfBbAkOuDH0RkI
 gZRLAXfIv6xR6goxHaIEzr04Z/i8JgKBWONnrdd/1blua9oeEoTbkdPP7cUk2jx3eq3vSF/HkPE
 Vh35XevREMqCIOuuNNU93pVXQc4DTRIF6A211n2SZEfwivym3fKjaHXrcfeSSNIYB6vizsyU65x
 +rkAcc5mPKOytqWK1/AlFGT9PaC4SrczhjUgM9jxQuwzBAeKQQ41tZziXphgGY0MPASvXFg2Yhf
 A6QeugM7jvnudmzpwy4MwQdH7H0H/TBNb8/NPUwO0NMOYQklfhV377LZU+yl2iiaMZzORqH+Pl0
 jrWYliVY2VW1PNVwfhIw8WKqHMuhr/12d/IhPKZ61qYFUQta3cQfZ40Ea9/Om2rjtPsHSpShQZl
 432q6n6PUaAKbOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001521_207506_C16C1B3C 
X-CRM114-Status: GOOD (  12.91  )
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

Use devm_mutex_init() in order to clean up after the mutex debug data in
detach and error path.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 99df95e65820..cf98b948f804 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -88,7 +88,10 @@ static int imx_scu_gpio_probe(struct platform_device *pdev)
 		return ret;
 
 	priv->dev = dev;
-	mutex_init(&priv->lock);
+
+	ret = devm_mutex_init(&pdev->dev, &priv->lock);
+	if (ret)
+		return ret;
 
 	gc = &priv->chip;
 	gc->base = -1;

-- 
2.45.2


