Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CEDC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fds2MhNytSCnzKU0jjInhjpfsALDR8PAilLtpJ78pio=; b=pTPDzPYfDBXYWJ3aQ8WuKtzX2S
	BOrbJ+bgeNFFYFVUkDIKqIOz9/vBDODYxfIajoEsalo82uzDduLidohNA94lyZC03IcYmmXscWTby
	96QZZyjPFAo/9R1iTr9mHuhNtTbSXSbtzaVWi0d3Hi7u+AxQHxbIjZpmAKPlDqh0E7vE6T4j9/pPr
	yka2JtgZPFX+qLZnQRIYFrl1aKCJ4URA7+6+px8Su8ikLEXIP4O5svkvo2ym7heDqQkor7z9P7YNg
	gCvxN1Tl2gSp9cVMG71n20cT2B5ue6fEw4Uho/zWhkrBNXLgWcR07vinpQPmt2vRMonTnedMi+Jjr
	U1OTID6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQSd-00000008qrc-1lr3;
	Wed, 25 Jun 2025 13:46:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRn-00000008K4k-2WbW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-453398e90e9so43233255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847622; x=1751452422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fds2MhNytSCnzKU0jjInhjpfsALDR8PAilLtpJ78pio=;
        b=hUQR77jQcxGT12ZyFrQOQWGNkH4WE6irTlfwkL/J5v8Mt7x0UeLo89HQwXdUBvTsqK
         n1cWF5aLl/Qr37kS7sDoPD2IGNz4yGhkhN+Ndh5HKjIxeGBo119SbZk0tdj5npAh6Z/v
         s+cJc7DIAr1Nk+YfKBKWM+8t70Pfv9lyaXCqjrLWTyCI3XOumDvWuaYnRnSrH3hoQ0Si
         1+FKAvlt9Txo19vMPfomr9N0SwqM4glRS0XWweR4lZW2bz/j6QNhYSbmjm3amN4jAx5l
         cUp4cBGbjHGEhEZvgsy14hpTqjnwb68LsPFKv33Mwfu98Zt+8XdBPnuPpKqCvo4uM668
         4G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847622; x=1751452422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fds2MhNytSCnzKU0jjInhjpfsALDR8PAilLtpJ78pio=;
        b=rQRIVfBqcbKL32QSvWteaO+g4EiWi7g3nG6clKrsFAzq5GpGrLUVgqEyNA6NzwzLoj
         AGne2zNfL3/sD02QnmSTbX0pHuFBBM/m68jXcHCQLmuP9a5nMCLhszg1x+ckFI1q2tgw
         hsQqvFu629AddYnYYTDhhpfGQYKWprQmhv1/D9y/EZfFwytdyun4ICPKAocGIATRe0BH
         DVkWwXTiQAcvAajjZxahqR4afVwZXRj8Lz7JX7gmr7wxth3GvOhETe3094JluhlPCgAe
         oduyd3NygJhoJaxbAZWoHV8ViczuqiEBNg7q5iATfIUy3xjqTcRCulrXwXQWW4aA51Pl
         iy+w==
X-Gm-Message-State: AOJu0Ywv/6OsZV/oz1rIHjbmtcEDs29nhxVFPXOBqkTNV92tjDhxWZtl
	VPitof3k5LeOUp00Njh8ODRAJrTYul/NuZ2A4AMGHgYOKEKCGZU124ExxZfGnZE2MEc=
X-Gm-Gg: ASbGncv5jbALxh5JZzjI1su8tOZc4Kq3BDSYB97KatQqYLMSJfRJrgmCdAln+nk2G4r
	O6WzyjsKV/AhFUoNeRTMNzgqB5fe02WbJFlM/t7D4C7o9MBP55dr6X0c8vn8kw7J4iHnjsD5uc9
	rPbtiUVyRFB7wd162sMupoVErrw+wGihD7seIOO3cKXg3jByKBqTemvqyaZlEnGnu1iWBVG+Rcd
	wQbiCMcp7ZIODUYh4/HzNUygtygvuGI8s58hTYth+Ma2PuK+Jgobpx0Ys1lR8zfJPf4SMSxWTxE
	BjJSyiMogZpCCL0yCS/S88JYliWrR0+DL7alASQhAsP0oN9foVNbOU7V
X-Google-Smtp-Source: AGHT+IEB1bVGz7jSwt+k7RvQZQqq75gx1fKExWgNrY0BLqhaHS3PlIlRuoRf4PgDZVjFqYg82xBLcg==
X-Received: by 2002:a05:600c:3b22:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-45381aaf86amr22139135e9.7.1750847622277;
        Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:26 +0200
Subject: [PATCH 03/12] gpio: sch: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=20ZB+p91W6AfddlrDokTU/tosMerfgooAW4ezeKuNp8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+lAJkN7YZV3SHnrEA4WiRFC3HboXlPuB0c
 SAVrMYCTUWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 cjpIEADH4hG5lCY0NvrLOQRwNpAisiacV4oow9swqvnZ0QQ+EIPY/iPgJ79MDLQsc360Yyjf2VP
 pMSesR959pD69DRYDL9pgyWkzI2Y6hbZGuSCWrpj2tJBvkg3shRC0HY3f9ljTAoXb6tI/6RlqXF
 EjP93T8flceHpQNlgbcDnp4AaTQZ44/woZVIVN9ysdatwAZBj3KBJKVlrwfFhAgvwcNTuYrtyYA
 Sdbq9REuMsneZMleAT7M2kT3ApJ6SNwnBaDL1RSTgWYY4IifB5lLMi45T8VFFBD9Jix4s9BKpfs
 znIXj0AsnGPpCUD1Bw+SgThvSu4JrBwe0GMYCGYWveGGx3EKSzE6RA9tSZJUtXU8WYK0wSIjbFe
 tdke11pUAIH8ejvEZQF+hDEaMO40lBLlI0XsBwXqGmDdjw9pmT8sGpzfxafxLLIHLdwGoBblGeI
 eldYCbtvZK+0WqYln1XRUAFItEiuW3YDTVneQ+rF+SUguZBdPZY6y94ABnxWjEyZZNWaTvk22Ho
 gFLWeaiHMBwGuvJFUsaVzFIo720p4+YVtajCYePpl+0hO6NxwpVyeeKjoWAXZTixsyeLCFPKEF8
 4NPYbZvIQEC3yJVwhXQOQVt0JiSHb1YvcC4IzUGwzsjxcHMB0+ech5K0UC62OdKnCdW/lxCyp0B
 hJ4tw3aa8/cNsSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033343_648483_6734484F 
X-CRM114-Status: GOOD (  13.14  )
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
 drivers/gpio/gpio-sch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index ff0341b1222f7ec2ea0df56b004222946d2418c4..833ffdd98d744948cddc32fd8039a9489a654ab4 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -117,7 +117,7 @@ static int sch_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
 	return sch_gpio_reg_get(sch, gpio_num, GLV);
 }
 
-static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
+static int sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -125,6 +125,8 @@ static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 	spin_lock_irqsave(&sch->lock, flags);
 	sch_gpio_reg_set(sch, gpio_num, GLV, val);
 	spin_unlock_irqrestore(&sch->lock, flags);
+
+	return 0;
 }
 
 static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
@@ -146,8 +148,7 @@ static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
 	 * But we cannot prevent a short low pulse if direction is set to high
 	 * and an external pull-up is connected.
 	 */
-	sch_gpio_set(gc, gpio_num, val);
-	return 0;
+	return sch_gpio_set(gc, gpio_num, val);
 }
 
 static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio_num)
@@ -166,7 +167,7 @@ static const struct gpio_chip sch_gpio_chip = {
 	.direction_input	= sch_gpio_direction_in,
 	.get			= sch_gpio_get,
 	.direction_output	= sch_gpio_direction_out,
-	.set			= sch_gpio_set,
+	.set_rv			= sch_gpio_set,
 	.get_direction		= sch_gpio_get_direction,
 };
 

-- 
2.48.1


