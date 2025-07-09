Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FE5C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPGUhdmlwfDijB5p8c2jdqMRyyLRw0XzIvWRRxywz5g=; b=3b0uhc1h5a8Z7dqJnCgg8ARA5U
	P/rwx/DxmfpbMABw2DdKE9GE4NOqf8W8Iv2ZN3Pq/7VzOsqQ5q3fbDUV+vpH3RXPpc0XNaDdZlB5X
	VSpViU748C7nnlI48m56QO0xIWtweea0FV0CyJBgpuTqSp3fXrXkaDelSIeqDqmBZeAdhq9vh42Wi
	KXxm89By3+p8TKNWsGrZbTm7HlskjcJTCrmGNjLSvkBNu740thS7fPqF/qJVFyHbVoLq+iBI4Y3Ti
	TWZs/zTx/BQlXl4kJNSWr3OkANj6VqMHs9ou/02/EM5XmOBArANjhmm1nQ6gjWQ5jvjoAQSId1lDJ
	W3t92VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP6Q-00000007nXu-0RYG;
	Wed, 09 Jul 2025 07:20:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVi-00000007hBh-2GVP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso58050025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043349; x=1752648149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPGUhdmlwfDijB5p8c2jdqMRyyLRw0XzIvWRRxywz5g=;
        b=1kRbQbeUFVrANtuj1/UXqHhHTiWLuRy2Nn74th/QJTY/vd2FuTv5I5UjlhNPf5vAdL
         bqxgludcGjZioEDZIcT6fZ2nUxVVmhYVqfvh3tlcv2Dr1ZrWhdn11Fuw1k6R/Y2lgCP4
         CnVbmLb1+KtabCgwciiWpNVAJ8W3JYbSP12o7x+qJS9IJF/eKrG852Nf8dy38V1gf+0h
         +O8ZLBkV9jbGf+zuF9lcmDHj7HbvbHjZNa2hcb+4UO+UlKDT+IF7Kh7CzdddHj4bDnCf
         1xJDXTXfyaPJUMgEAhOL57qy5jEbi6hu8twzxkNxkHxcZiHUkNExKy7iHwp3b+oRXEg3
         TyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043349; x=1752648149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPGUhdmlwfDijB5p8c2jdqMRyyLRw0XzIvWRRxywz5g=;
        b=goyVwSRHfLmD4werbZLf+Pk4Xz6j06a0H9fq5X45AcmBGsr+4jDBJwnNTsMnCtzy5g
         okdmG8JEzMyv4Xo7W8ulH5SsqKPu6IXhOWKng2nrSrEbMuLIGsm1FrkvH0VD8bhElEIq
         TBqS/oJ5tQdlLw2/oKsKKvG4w+PlDY7lXpiz8VOZxowD7fywifOnXA0GyyBRc95i8SDF
         x4mUNxVfVwyAy4BRHuQELbFfyZ1/l67KYeL/wLD2ha2wF/wuTo17eaaIYJ7GJKr/oTpU
         QGqV156JJ4CrP8QCYGgAMHzNQ16WBcsjhis8puiJiAHqgNXlIwPUTPLu3V7rpocTBbPe
         HWQw==
X-Forwarded-Encrypted: i=1; AJvYcCVPBwOSJYbEDD9Z/+i3/LieXXgazFslLOkr2M4+Iajnf6Omhe7SeweItATIhWaKEVOxLL63iKiwzTBSSEPgIcXl@lists.infradead.org
X-Gm-Message-State: AOJu0YzjvFkdL5eZ/X0dRXR75NgrR76WebiLoE6F6r9BTfwCQy94tDSk
	BSD113zBWhutQzY5XjZ9nrhL+XZlgS8EFilJLLcHp/doDw4uTg6GLTGwO+rMuHCPlgI=
X-Gm-Gg: ASbGncsi0IyFwuh971SjJM/FL2bySduAMMN2RdJCtkuvEIa3cL1OBgbjOXzq3fMRQes
	Yl3bNQpt5sPVs+i27vvf/lMDWLz/9Xm/FOWrflDQngLrytV/t2qlGfhrmzX7TSlYtY3o64ZVnEo
	X7+ZBQEiXapMbwRHq/+OLwQYPlPuVzgn/m9yoOi/jylUPRABy56LEBDIqRy8tkJRzjSQrvx5olM
	LnwVYAC4SY1tpRj6inuv9xkg9fQCfiqD+DhBKl3IW+bBGxMz4fWNowsaByL1J5ybpLWJFm7nChM
	LBbQWzrzH8TCaQCPAlspbw4jDiPM5m/JdX+EjC7ppMsqe3M14Hr2DHy0
X-Google-Smtp-Source: AGHT+IE2jvkZ74rwtuTBLN0s4Szaycx+neThxKbyunEms3rb2frFFesUKJYspBXp7dISaXs9HS/W2Q==
X-Received: by 2002:a05:600c:1911:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-454d53255d2mr8934065e9.11.1752043349033;
        Tue, 08 Jul 2025 23:42:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:49 +0200
Subject: [PATCH 12/19] gpio: xlp: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-12-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=x5FG4U/gJyhRjJj1XtGDAFvboyuoHh6dqBdfJYy1RfI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9Dsiv5Ee6xWbG1tOxvjELtQVLwaBXfailSx
 fKyWGQWASOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQwAKCRARpy6gFHHX
 cksoEADFcZiJ30xLcfVWrKzRcZxE1q3PPoKP43SjyxcmuIi+zrZ+y3J0LisV+VlPko2f7Ph+Euy
 ZkoyRKhuRLBLJEuKWrCSbPCk72/wNJ+eCmeOJKewpEyBK2mQpm4BD0TwIan8yCbiJAPQ1/8r4W9
 iFfDTWQC9SxufumDbCAmrLcVogjijtJyVYw8pjfdxgFQWy8hfj2dJ6+A+IfZYnjSis928pwaWrP
 TgVXoZ7vBx3GldWKPa9hY3iPT2hl9/oS/nQpSszD3D/azPMEYsXbU/zQ8axfcp4Njw3WNRE2BUb
 3s2ovfGkB2LFIXazVw12zmDMVTREnvNUf2GzR3N3u7RueeOAa9wyr3f0YGrNLRkX0gaGnfOviC8
 nZ87GozcWVrc9RZ5y+T9vu4vUzLD0MBn+vh+1jciOhiW66Nc1Xe7WjAH2uShR0WNULKl4Hz3sD6
 zAVMTg49cvmhEypnXfwgi9YG39a9FO7Qd6iJXQQcSCVtwn8kD08g+HO9nNk+9pqMcCcYu+L4Lb6
 8b/c8IEAobs7tkOc3aO2QiUond9/n9Cb5i6QGVgthUfWd2SVeMtWYjMYa6wN1+X5Hb7ZxTtr1gH
 4pOz0ptwjPI2wuFqf0WZX6ahORlE+PPFtQESv55c01xRhZXg1eioM/ROW8Hjof4FbwqfEZQEVT3
 r4jRxEPJehu5fOg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234230_581847_8E77585F 
X-CRM114-Status: GOOD (  12.62  )
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
 drivers/gpio/gpio-xlp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 35b376c73ce312df1312ab09b53246fb5905152a..bcd2dfec462d0d25b3f97d682866ab035f207c3a 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -227,11 +227,13 @@ static int xlp_gpio_get(struct gpio_chip *gc, unsigned gpio)
 	return xlp_gpio_get_reg(priv->gpio_paddrv, gpio);
 }
 
-static void xlp_gpio_set(struct gpio_chip *gc, unsigned gpio, int state)
+static int xlp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int state)
 {
 	struct xlp_gpio_priv *priv = gpiochip_get_data(gc);
 
 	xlp_gpio_set_reg(priv->gpio_paddrv, gpio, state);
+
+	return 0;
 }
 
 static int xlp_gpio_probe(struct platform_device *pdev)
@@ -272,7 +274,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	gc->ngpio = 70;
 	gc->direction_output = xlp_gpio_dir_output;
 	gc->direction_input = xlp_gpio_dir_input;
-	gc->set = xlp_gpio_set;
+	gc->set_rv = xlp_gpio_set;
 	gc->get = xlp_gpio_get;
 
 	spin_lock_init(&priv->lock);

-- 
2.48.1


