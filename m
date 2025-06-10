Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700C3C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=; b=na154DOh931cU/z3bJh1VCizpe
	yqwuO0Rv8fGQMLK5tiKvnuye+D/Kp7zJ0kZH/m/TQPTAxEaSoQt513I35fXAzDLeR/P3ynIddRfZ4
	HJyQQI8Z5uS55vSFdwwUFOuhAUDwXs+DL4paJHcF3eAUHN4jG+AMHGlf8RFmCdjt+7uYN9Oh5BVLz
	6WprK1iQdE5HhPyA5uBzVYxNZ8HJ2Gtoj2gjoZe4Hi/u5VDEcShZ+hULvfaOhEcwP+XRdbYWrhrXL
	oQRIkVl2UNAkAGgU2eIyzpBoDxkvsv2RiZTom3qD0pCVquVfFf2FlaDG1Kc8B/6JMdX6N3mZwLtND
	PyLmvD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzHq-000000071O0-1Yx0;
	Tue, 10 Jun 2025 13:45:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAV-00000006mMd-28U2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=; b=Ug7Qei5+MXl0E8xW/dESNyhCdf
	VffKW4IWOsI0OsLyIFqiql9q4NnLcbc3vpJ/jLjIkcnvGWLd2HHMK62p600YjLRPDCp1d5jcRAmZf
	3S/9pIJHyFrwXCDHZeZf25bZMysbpCA7p1EeN3bf/HUC5NSOTzqaekYrgGcl9LQzoJHtiLKZ7nvhK
	PMLW2FOPODULETM+95+VnmfKzrrmm7pCn8+F16PqV0/aV+YbwV3P1Sxoy+pRVFKnmDiZRaqnxyt7P
	5gvd/lnveQYE6bP1TvnYl9YpGHhknLmT/tI3YcthkO5RVWmzPs1r3tvXsT1CnNEV8n3t6bbt3Dbaj
	N3ocWn0w==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAT-00000001oVO-1aUx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45305c280a3so9551905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558807; x=1750163607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=;
        b=WSlyW8KZg8Aur4HIT3HahEi2vk8j62ZMseStQWsHLKJQcXvv1QFEEjhYfHRrJgm+M1
         9PC50ajONaT09Gvee1US8wPZ0hlNi34EUeKhCLZklz6riEFN44V62w8PhF8sGhxiytDP
         tvxUGWBjuS27r8U43blprPKEpBn2R4YgrF06XvGFIcKxymslfe0nEqvjqX4vFGIXRBuQ
         vWv/qlyy9xI6LPVrcWQAPEMKmochYapEUmVkBAzJgM7J84F9cEY4mrUdGoOThLB7p29o
         CZP1A84kceylEJpN8yFEBKHkJ6NuWqr4NroTFCVLa73+HlSmYsHoGHhHSzv5h5qCMgq8
         WRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558807; x=1750163607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnifVKNx6vZMoi8BKrChG7bpgI/OQHUHoxljl9BN6O4=;
        b=SgjNrGT/bp3Wzzgc+nVnKOi79L0yrqZFMi+44cjkl3jgZZgYNJMYhfEXelRb4lVDoz
         2QYY8Tc/Dka/LXZfZ2n8gEvXrHULggZixZncpmeCdG6Z1j544BKF9L/0v5IXFfLofMwj
         CLWIM47H/lG3+aVgjBWePLcdt4G7jHSodCAxI4TTFMwpSIliIJrixGC57Se96IJNFSPa
         nYh1AcJT5cLD9Tvj5DSgGuCF3k7TIr4i1Ig926Xuhrg8yzrDBvtONrPaBB3ZaCqhxHju
         Im6HwvQAhdFbsEK0neFnzYHnqHAYZpTP3ay6l3Q0z7siTApY8ycwtamcw/oDucOs2lwQ
         YNGw==
X-Forwarded-Encrypted: i=1; AJvYcCXhBuSisms/XSQlLI1HNwqd8EoR0rfHqcy0Aq/yv8Ud2x6mg6v8z5ve5yAZcZP5KDR2toyec8rIPb0hHcDoF7Jj@lists.infradead.org
X-Gm-Message-State: AOJu0YxvRW2Ymhs6Q7i3PA2T8bLCAMHbrXQ6uzJuMv2gXNqlGApLWupt
	e7WZTLcYK7jNmKJTajSP4awooCGeDX1zYIyusoDf38PHXxzw/MMhzrXeNBHr2BozPOs=
X-Gm-Gg: ASbGncu8+U/hE06J7yumXNbfRAMmTQotPOrw+etN+W5flttCxuPZkZKHNp19JqZvBIO
	arWm3muu1ihrnEhVc9N5MetdR/MQDiWTnoHdG146KxnZHIidNS73S8snmoGS8GPVaCKLUlVeqW7
	jR7t495nn0fqeAHONLe3hfRUw0kran1PUcZJNC3OCB+vlSR3Ju7bwwwLf8XAC9CKfw5HkzIXwn0
	4NTG2KYkDFqbZ83BMLDxZn30AsU6JVUNSx7jZitzBVoLmYj6oy8dcur7fBHlkFl7vgtUDbaJpVA
	Bkin+kxQX0oT7pj+LfA862sv/CLT1AkLHWAtuO1n88aovJvLtokwKA==
X-Google-Smtp-Source: AGHT+IEhHGnha6NVSEl35o0rcxk3G2qeby289KOBjHmyRRKU5aBeCt1UnijYGnoa4QSN8RfsoiCifA==
X-Received: by 2002:a05:6000:18a9:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a531cdd3e7mr11294329f8f.41.1749558806845;
        Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:14 +0200
Subject: [PATCH 04/12] gpio: mpc5200: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-4-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=90+8j4aZT4JRMp0EAthBl2BT59DR0EH3kEZp8VxRIWQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPjrlNqxPQXfktePA9fMZKYXcc5Gcy3lEpY
 DiBORdvdEaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cis/D/oDqQbp1iJ/pMrCws3WboSyUKCzDK6Dz2mNVa9MCgOCF8w2qEn77E5kO3REG58Iy8rBevx
 M+rxL411dBx+ddz6YfndpV+vRX8eo+xmA9GhmW+ZYP0QL/6LVN4U81PwhG/h3iXUS7i5XJZn2h2
 aJ70PUm/8zQWSgA2WTs9k92eWe8PaU5791laRMJaZUS+h1tjqQxPywAnfYf0XCHRtPmJ4nXDrPu
 W2NtUQ0DFUxaKw7vs+WkjRRUHWCfKbyguo4jCedPSMQl2nxxTlX1WhFlNQRNUvqLLn4zk6lRfLq
 GbxmNkhls3uxeoFAB2rtvpoD2ti0oeT6dNbmi7Pptx5o3NZ4HCwBEidKmfUghK7L+Q0XPv+f7Dc
 xOOo2HyNAyc8OGoSRG1tEBELuh0ngmvNjU7ad5jlOxts2Kh4l5VuhylUyGCrqsRfY+1EEvWMP3a
 Ns3DoU/3KBau2OAHispj2VLP8s5w3Zbbqf9JC5EBfW946W4x6609uYvF0VX1sjSxkCaq89hLZSF
 Zv2Qm8n5VEeYOHl6sAN7+dY4UB0M+dNgwcVV+Exta6JSnaoAkZSolRXj0z+G3z/5tB1rjuXwUFv
 nb2okeSy3qeLWCX/LEwjSPEtgSGH/EXRfvakYUCD1aUpMjEJT5jrDXFC+BomXspRo+F+w1rOlaN
 n3rbpR6MDIGhl5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133329_545005_8AD83EB2 
X-CRM114-Status: GOOD (  12.41  )
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
 drivers/gpio/gpio-mpc5200.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 091d96f2d682941378d251e95eed88ff16bd39c2..40d587176a754a6277b87b760f562ed5304b6eef 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -69,7 +69,7 @@ __mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	out_8(&regs->wkup_dvo, chip->shadow_dvo);
 }
 
-static void
+static int
 mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
@@ -81,6 +81,8 @@ mpc52xx_wkup_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int mpc52xx_wkup_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -151,7 +153,7 @@ static int mpc52xx_wkup_gpiochip_probe(struct platform_device *ofdev)
 	gc->direction_input  = mpc52xx_wkup_gpio_dir_in;
 	gc->direction_output = mpc52xx_wkup_gpio_dir_out;
 	gc->get              = mpc52xx_wkup_gpio_get;
-	gc->set              = mpc52xx_wkup_gpio_set;
+	gc->set_rv           = mpc52xx_wkup_gpio_set;
 
 	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
 	if (ret)
@@ -228,7 +230,7 @@ __mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	out_be32(&regs->simple_dvo, chip->shadow_dvo);
 }
 
-static void
+static int
 mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
@@ -240,6 +242,8 @@ mpc52xx_simple_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int mpc52xx_simple_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -311,7 +315,7 @@ static int mpc52xx_simple_gpiochip_probe(struct platform_device *ofdev)
 	gc->direction_input  = mpc52xx_simple_gpio_dir_in;
 	gc->direction_output = mpc52xx_simple_gpio_dir_out;
 	gc->get              = mpc52xx_simple_gpio_get;
-	gc->set              = mpc52xx_simple_gpio_set;
+	gc->set_rv           = mpc52xx_simple_gpio_set;
 
 	ret = of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
 	if (ret)

-- 
2.48.1


