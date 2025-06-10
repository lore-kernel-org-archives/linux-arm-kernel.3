Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3103C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=; b=HLaqW/EvZFHwbfpbPfbQAfXAAe
	j410G31aVBCJ0m/6MIuw5mRn1E3XArCi+BUeqPYVGt2wPOq+tM48vNxjR7rtnIwK5C8cO8Ej71HRz
	huk0cD/MPDmPouiOlU6SwIIKHvZYBF/N3QlFdeRLhZe2jzD4FijcjkkSh9Pm0ZZ1JikC4OzwOR6kC
	2UBmNKBCaU74uqHgSSmXhTRSda+wkaQqzw12wfbAAfVODWgoh0/GRSPeX7ycBPeBwwqU0ey3PuFgv
	7dxzd0cdlGjTqEL/xL5npTK3A3Ou2r5O1HeEIVTrgbjkhfpUwzAkqffdmzqnmC3EGGZXfJpbn7iqS
	9DUlPrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzUb-000000073ht-0CjQ;
	Tue, 10 Jun 2025 13:58:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAZ-00000006mO9-3Zv1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=; b=I7WV6Z4fuj6vt4vguihM2cI8CF
	ju3vIDqVaESX+MOD1vkCPmyaVMcPFP5NlRgOtnRNboFdigVelDRVk+lJ+55cwrZEO7fVWvgwCVUB3
	iaS/57M9k4NdjXGUQFZ7XlpZr1uZQUhJfeavprNDXgq84epPGmb+aJpCIONst11475+xRVq19Rs0V
	0Y7vgf7ZHnoEGqnVDVNQlttMIjEj1yyDCjU1130LHgVkQQjW5t1FTw/6HP3D+ETcuN8z0pNODEVfg
	CuS1p1bxwUXF+LdJ9sbxGlzqLKZ2O+qgAhi8DY4HyMgn4jPuDe1TmjnvpIZF73507NPFUt/Qn7NBU
	nWPIjSUA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAX-00000001oYu-2y2n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a36748920cso4817856f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558811; x=1750163611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=H2XkPol7fR1q0X2fSqyRYWheao3vXI32S46r6+qS52t6TfVFoAE4lQwi1U9cNoCi5H
         68gfPMNn4NbuthoBCQyCTND3Ujg0CdhazMKXgoyXPlxOSSwTAaDWPUADoJuRWFYzF8J/
         dYHrS1tQw1vdaEc5pcG7a09es70guJupl8QxQrUpgQ8wZVTRuuO+pNx0YCXb/PpczSFi
         zy+v853iO071Da1KTSYY5qPiC8glN2cE3h+igJzYwiRBbTjaHc3l8gaLkadEjETV+4rP
         xa/wC26kBvPEsmwdFrhjCkgQQtVRg094x8uy1SMLfUsl1fJHt5D8Eyy0V5sRTz4OFYwJ
         dzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558811; x=1750163611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=XMfkvsDdL4OY5W75y2+ex1kTVdT9hRGGQhxkXj3If7xFP25fx9AGUZmeqsAcyjIHD4
         2QkZM6eWFhFdobOyRma58AW7h8ptvn0O8VynLmlVRARDev5lHJPz6/tr/vk4nc7ErOVZ
         9boHOleiEFCClNiNcikEFmAEjXpBXlJrO/uRIL2cAIL77aBoSgr8TWvFCWfI6lFyltfo
         gz8RIurmd/Y8lMi9rbQ3gn5mNq2X3NLXZWw3LwBKfUD5FF2h59RKsrMj4upyyxcdR/Ue
         +zq2C8N3g9c5Q6K0XsHfDNbPc54b+OziZ2i2XD8I9XAeoQy29uUumQRTBvID8M6O/eCs
         crWg==
X-Forwarded-Encrypted: i=1; AJvYcCV0J7AqJGfbRfMB9TDqr0KKPrhGuQUhHXLfD+7w3ytP/sGUFvTYOjyDABF10FzBiOZfUaFyhvEYuOyYVlEGLcOp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjlt8bNprciYeQC/quK7naxOL8bRkfMMi199jLBEGLGwrIJ9Nv
	HTvTaCDm+Nk8uLg1UBLOU0/z9qUy5RD8jksjEYtkXDIeWVoBKN10Ggawq7ZwaJ13vHU=
X-Gm-Gg: ASbGnct8KTYLU5S2KBsPNLmCagDF2axb9JWHLTIKzb/cRyGdTxLb9VdbgjAbnvt4OOC
	y5xFiSNkvDM21QQYG+gosJMCZb8AZNTxQQy+vISFf2kVX+OOF94LXGQ3MLp7Pzp0ZJ7uk+7PoMM
	9805BDkRH0DcWHiETIrDEUkW8YRW99oaHZinQM9lVkbBn3tl/up0hS8S109ZbQKOuLkkRAJ3yTP
	uG9kfJ00uCNNqxvUCiRCP+W+Vt6LIf14PsJLAzxK3kYqWV3cAqO0EzmpIIzMIW8jeEZEegQcAYP
	3OLFbsLOGW9YnKKhnlN/vTYRI0+7rA0qMkxtJWWT6Tu24X3Yf3gr9Q==
X-Google-Smtp-Source: AGHT+IEiNibcNMiVsbQHF+47L41QAAVONmrgvcTQ9HOwW+eRgKNTCeQ/gU2brhJ6L5+0fDStZI1sQg==
X-Received: by 2002:a05:6000:240e:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a531cb237emr14618808f8f.55.1749558811315;
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:18 +0200
Subject: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8SMFcEMP/yadOAddKphU2LRj+bMl3thvtyJ4brm1q7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPNZX7SmF68qJHpheQB5Bvy2U+bFuaYHRkk
 DPVGcTa+SWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 coOIEACRhw6kCcmI6Qk5Uj1hqmX0byLLYekHcBjVu6C0ctu5rgUkddKMjGT6YzbWLvwnGp/o+az
 B7cu6TULK+CGHrcSoGO/JBAtpG0vLkNjQIDPjUr0j75ifLhmeuE0jvgszHFIFyVSHSOdthyj9w2
 rsEmzCLFLsSXCDgBh2oFj2EhfJhxZI8rkjn3ox02VOjRjDrtAt/aEljk/mSrvKj4Tq9biIjCIgo
 o53nCEEkmYf6kgeNtBRKqfNg0ddAaneqdwzZ7Sh25b72vVSBWwaBVZ6d6S/RsrYndL3woYZ87Xm
 /dePA8YZOs3Ectoylv+V7MZcEGuIZro5nVhzeMBOYZiBUXedMjRsm87FW9+ltwQUiAeZfQz+6zI
 nNOeWzApu4vwd0hMs9rtxT3GRXGaQKpXx+mGZBn1Yq80KptRmM/VUbh9rfGHjmet99x9gtRchCh
 2ACbns1aWtM+B5mgT7GFsDeG46pOv50D5+6uuGsTdssLU10ve6GAQpD6S3ks30fY9kQY8/FsvE2
 RKDd5G0DJ4BmukghAk+CEvLjouL/qWS+JDyjagXehsDB16fWjwSmxOKHF+TmaOC2M1uS9qiz5wS
 /6f3WIunj+fATUaxSl5bQdqcPthCVIh7B8BN296a5zC1QRO20KkJF/m6PNIGSKzstuOJNOLhYE0
 d6QPrHLcpkEmVsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133333_834839_A5C7A21A 
X-CRM114-Status: GOOD (  13.20  )
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
 drivers/gpio/gpio-nomadik.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fa19a44943fd7ae167079b34a48f669a38ec4ae7..296d13845b3009a52068ecacd8d2d6a25eede9d6 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -347,8 +347,8 @@ static int nmk_gpio_get_input(struct gpio_chip *chip, unsigned int offset)
 	return value;
 }
 
-static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
-				int val)
+static int nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
+			       int val)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
@@ -357,6 +357,8 @@ static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
 	__nmk_gpio_set_output(nmk_chip, offset, val);
 
 	clk_disable(nmk_chip->clk);
+
+	return 0;
 }
 
 static int nmk_gpio_make_output(struct gpio_chip *chip, unsigned int offset,
@@ -672,7 +674,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = nmk_gpio_make_input;
 	chip->get = nmk_gpio_get_input;
 	chip->direction_output = nmk_gpio_make_output;
-	chip->set = nmk_gpio_set_output;
+	chip->set_rv = nmk_gpio_set_output;
 	chip->dbg_show = nmk_gpio_dbg_show;
 	chip->can_sleep = false;
 	chip->owner = THIS_MODULE;

-- 
2.48.1


