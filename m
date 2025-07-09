Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7E5C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kni8rM9yohp8QWkfPh22xACO4uj977q/kgFbK4r1YI=; b=Hrd/xQlf34i2RVri7v/sgOiAVn
	CP71UiTiZkKwYJDtHok0K1hhGyCPvzWXgP08g9ZOXK+tdG0Bm1v9RjqD7Qtdn5Iq07h4WzhlDajek
	EnT/Fc60a2ina8SCNhixKwpGo1Po4/+YMki33auhmzre+epNO0xWXosdOEUVio2HUbW2wNLUqilcP
	i9rauka74eyNZwfDMFKhxdetGUJSyTkKYE+Fhn+VtmrL55llmg0HTpbHwynMezvmEaFCwZz92p0cC
	VIx6dj2tJk0HCNt0vqOeiH0sP8czBD0WjZKtR1HVJDyrnp2vhbbqYKK5pJLMTbno2SWAYI3zo9k5n
	XUifpbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPKJ-00000007pHe-0oYG;
	Wed, 09 Jul 2025 07:34:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVp-00000007hEi-1x3Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450cfb79177so28907165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043356; x=1752648156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kni8rM9yohp8QWkfPh22xACO4uj977q/kgFbK4r1YI=;
        b=nnSbB6Yejh3YFmHOlQgkhnSQ8hXiosHCDKy2r3kWwRqQd5DkWCng6ruAZ6La9P2aCN
         AGnHQty+XOPCdzmRz7mKgDitZmCha8+JpHTWPh/rWZcSUncZoY99j2BP9rtMgJLLJcOl
         XJkoBSuXcOKIjvr0VEPP/eaqHkKJuWSQI1P9nnIMNaQlLmDImIJxE2Tc79nVfEZkdgCM
         +cbYTpTvYQMXGtDttQlQlNnS9yBHUHegQNjS09HFdZDimhmvGti2sk5dRRqwNC350s76
         GwdDL4j894yNhGrrSPHT/mee+D/urhiSMTQKT7vyKx8tmOO10Tw5Nr2hmDll52O+HKEY
         StUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043356; x=1752648156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kni8rM9yohp8QWkfPh22xACO4uj977q/kgFbK4r1YI=;
        b=KjGuLnCNrgxmr3aJxNNum3cA6jo3GHX/ccIXIagMQgz7p4mEYTlY3V+K8RIU8mxzI/
         cNn1r7vUiNLLc3aRXjrI6iZaLAm+Dts2X4i3aqTpQ0HhD8htNI8w725IUczrU7bnsKjp
         UXIh7HIoZ+T66VG7lZCgP4WEMib2I2yMxwjx7rZbDaf+OrEIvldzip8ZNdLUB275S1HC
         n2HV2QrSYAamFWV0zb3x+BhEfUOJQBjnbgzIFRe/KRlMjlhF+1BKiZQ0Ek7yJwfE4rM1
         CsIr3x7H5jZIIC1mZAHehHC5X/bXu0bDjegdhblFUtpkYjdtx472EDwgm6+85plXR7J0
         XAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX+VRW7VvVd4bCeOxSk6Va2DOqWxEHci1DQCerSH8u6oZGsykQb1hRi9Ue842L79ANYKXv5Kxsd7H+N13KXRfK@lists.infradead.org
X-Gm-Message-State: AOJu0YyRlYTzRKJUuG9amTo5v3NoL5lgSqTYeomLIEw6W8dCgo3vpN+h
	wKNQdXTEU8WNgxAzZ0GMiu5BHjbwVnAscZhmR3FXAoJ6nhbGfFqUhKABY2F4gVRGrd4=
X-Gm-Gg: ASbGncuYK+i6LfKnf2VPTr10wmnVWJcQhWVi94qMjD9e68pk3wZ8Wlmp2hjX8UlkV7o
	ub2EFsFOMyRdjRSHxj40WcYN9LC+MvN9Cevv5nD3kqn72gLrSIKGIoJkUfAxHasbEuiOrbSvFDB
	4TrlqmgQT4mVAPCaCQsP5dR3PP5tjZkIsYNxxLEEuFyqLp6cLmAreM/+0LBxi4lBskWcP2nnMka
	RoUgQwrQdU8EABY2Fgralcxgl7ktbaBimN5WErWlwzvLMm7cgS7CvKlXVDja9cAPA00R96EvSrm
	Hw3eN4Wbet+KQZZMxSRfE33HuyYh2lYUaZW9t0X9fiFv89Zi0/t3UvBi
X-Google-Smtp-Source: AGHT+IHIVDR8rddjy7RV7ZbbuRADNMRvR7rlZ3ZGeS34S5+8FSs5H/zQ9GNc4Gl4e4fKiYZOjpN+wQ==
X-Received: by 2002:a05:600c:a205:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-454d60d5911mr4376595e9.4.1752043356135;
        Tue, 08 Jul 2025 23:42:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:55 +0200
Subject: [PATCH 18/19] gpio: zynqmp-modepin: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-18-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+dlpJ7MrL9mChGkl+8FCGhAb1GH2Nl9pZqi9frvclsY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9EIIDF+vQFIBY/FkMRWNfVSiQi8ty3QWnmd
 cjFnFvQYtSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRAAKCRARpy6gFHHX
 clPBEACMBKXxXtSp4qeKszk2Sd0wYBkrTcQuFITgefg2aEjcU6z3wTea5FGrGxYLY1iEKuLKns+
 NjQeqCxgmAjXhA1LBhrBIDzgm3sYdDMmtr48b94aDG9ScZ7vJh7hgrN2kQc+EYMffrny5Wb8Rth
 QjNVwAvohyPCTbIftFeluuGA6qGfaJJqemgxG5epESDeFUpPdCl7K+VQlvnp6uhhJhYHCWIQ1Wp
 /ZJuc0OpW/BkN1iupYZbViczjN3FQkMF46nSIcDbKjNSuCSuOSylyQnwiFOF/UtvLyiYjVFj43D
 Rq6p6+XESNN9CWXhhZFqa0HjTzYFsxFvFe2vDDMZQ5V2j9eejb9loNSTvbhVHCFzjL1MsQ63a2a
 Gto8Oso+5bXhEQlisxE7NrdOuAh35t+CqaJQPGeIblmAXKV/NdsuDLGdC9JwcxwcGT9uvTf+JOB
 FhVvS9Y+w18azSeTEDk9+cFOJ880GEeFAv65KYFswQ7nThM3Lmuwp7VSDPao1oCxs8ONbOWN2ZM
 q5cLeddMK794+Ji2a9dTcSQeXysGXzKsFw/s12dVTglazmDEbQVLKZ19bCUnNoXEYtkBCEWm/bc
 4LcwaoW33Sjd4Nhz6QAkD2D52MJUAvbpEepkQL3tD+eX3w3KSeKZAoFv6GrWezD0W5SdgF8dWgV
 cE5aGyuT3IERIYw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234237_545946_0A2670CD 
X-CRM114-Status: GOOD (  12.88  )
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
 drivers/gpio/gpio-zynqmp-modepin.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
index 2f3c9ebfa78d1d6bc4624a614c316e4fbeae2aff..36a547d6fc5a5c100f81c72600e14d620a462cc5 100644
--- a/drivers/gpio/gpio-zynqmp-modepin.c
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -57,8 +57,8 @@ static int modepin_gpio_get_value(struct gpio_chip *chip, unsigned int pin)
  *
  * Return:	None.
  */
-static void modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
-				   int state)
+static int modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
+				  int state)
 {
 	u32 bootpin_val = 0;
 	int ret;
@@ -77,6 +77,8 @@ static void modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
 	ret = zynqmp_pm_bootmode_write(bootpin_val);
 	if (ret)
 		pr_err("modepin: set value error %d for pin %d\n", ret, pin);
+
+	return ret;
 }
 
 /**
@@ -128,7 +130,7 @@ static int modepin_gpio_probe(struct platform_device *pdev)
 	chip->owner = THIS_MODULE;
 	chip->parent = &pdev->dev;
 	chip->get = modepin_gpio_get_value;
-	chip->set = modepin_gpio_set_value;
+	chip->set_rv = modepin_gpio_set_value;
 	chip->direction_input = modepin_gpio_dir_in;
 	chip->direction_output = modepin_gpio_dir_out;
 	chip->label = dev_name(&pdev->dev);

-- 
2.48.1


