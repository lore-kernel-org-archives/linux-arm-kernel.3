Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B704C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YD/g74cE2O1wy020/OZZAa+Y4T4rc7dR9EtJbvV3wU=; b=BCmMbGXOUS1vWgG7QYUDU+n4WA
	TliweEgU4RKCwjikcUeDOFmaD6p+IAakwYPRUSqm5GSqD8J3Q4pIM9Uv2NqISpfdZV+UHxUz/cxmX
	ID5mot4ZSSWTL6MkpjcrpVgCsmErvvbd08p8T539uASfbm5yyfD+bvRy+zh9zROCmzhMBeIlZ89gQ
	9h01fJruT8mR/buPYLurLKdZS0XeLxlh3gzhOKXLnsQwY1kw4nrPJ1bqaD+oaNWQwle3B6OsnEe86
	uBFzlDazPlhA2JSGSZ763JGDbOgmS/VxGJ6DlOQeFIwBJuYH9aX4mDyIBxb4RFw49zTgOzmTXeOKU
	p5XYiz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G1T-0000000Gfti-2oJp;
	Fri, 25 Apr 2025 10:11:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8F30-0000000GUCa-3ScP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:08:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so18690925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572117; x=1746176917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YD/g74cE2O1wy020/OZZAa+Y4T4rc7dR9EtJbvV3wU=;
        b=m9UKsC0rGfU+Xxvonf8a4oJh2F5Y/HQ9tSWDHTVeOxKW4m6ih/fcz8i1mfKhbRTJOf
         EJqiVzLFudNk3H6B1pQaiVwfCsvI5E8y+AADD0+krrn78XTjaQWo3GG58/i5zvFBUDL1
         aMVPvQ/Ua8LfY4VjftQ+gghyoetNwO38lxA/jXA+YL2e+BRY0OnkLPchGBjfK486k6ST
         iSJnFgwvjvX3G1rs9fu2Y8EBpsl0+8KleDuNLeIt4SHdQ9/30glWS7FtrqdLi2rsV2tP
         8UL05wcRmWRrJwZcgWN+hm/EyppC3h5zlb0z3JgggoH1hmWM35ANZ1tmTOf0PC/ShfC4
         Pp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572117; x=1746176917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YD/g74cE2O1wy020/OZZAa+Y4T4rc7dR9EtJbvV3wU=;
        b=T30YZn23IFUDPube7l/bNnPFIV8ooKNlXWd7FHu8tz94jDIXnrUuKtMjtaop1isi0J
         GrXT71vqRC2ZfsdJchkLd8swptinXqhHFJkZDAGWTMTXcKS6RhNWtv1eKYN/As5laFSA
         28oeX9Y9FkD6Wn3Wr8z37PCjr2QhnVVvrgUZsCsy362vtxmeLkVYgr6ZtUU8+vnERAGh
         TC7nUWEd61NiJTCsSOHDILfYI7CBrM3QSCraTcGqHE/53HBYIAvklY8YjjvDqdaGm65H
         oAffrGduQsfj986chPlN3x36dlEfufqr0WEJlFfn1HWRhh65bCyr28PJYplcR62Pb2wB
         0fcg==
X-Gm-Message-State: AOJu0YyfxaCZAJs/d9Lf+LJcLVtyNWODoqmyzajfZQhtMDsS4UfUkCLY
	YMOBBHm+s/uJtdmtlEiVE2rHl77BTe7rkukeSwDurnlvTfSI9I4/WNIWMPcFypM=
X-Gm-Gg: ASbGncvY2SE27EvW6osF8MY9Hz6omMfwpTAOLLtqynKpdh+vuehjV0DML+njOs37W4Z
	PVRSsS5WFKJSLGUfSKQDxfUZwWaJVH1eT3EtP0cLLOdhcVUxA6gY8C8Vda+82PgO7gaosWaJ2kR
	QgTWFvJyD/cEIPFwEBeVCn2uO99MAZ4EF3/3d5MYi/SzraGQypRlOBK5gF/pI+7J7v+5UEy4afL
	YRyo1oAcsG+q9/wZZhDKH66qCdxWbjOAIe6Cb8/hK4MsfJEs1d9tsHAITwKjmkxyiTmid2azkLC
	PoqWTatnsyDNFROXzSqhJ3BKrKw3VSKzvQ==
X-Google-Smtp-Source: AGHT+IHCuNyR95UNYI/0izXIj1LRfHaEgDOIQ/KPvSJKLbV9AkvjEqEphDC9iCD0AWLDlHAVDkvOOw==
X-Received: by 2002:a5d:64eb:0:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-3a074e37904mr1224414f8f.27.1745572117165;
        Fri, 25 Apr 2025 02:08:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:08:29 +0200
Subject: [PATCH 1/3] pinctrl: bcm: nsp-gpio: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-1-6b8883d79b66@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-0-6b8883d79b66@linaro.org>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N7w6ShEtcDx0natQtD0HEUwZNrRzhk1g4hjaD5jLcAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EPQG7Og0taBdL06rmp2Qd0XqgRcsFeRFXYf
 fe9a9gFLc2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDwAKCRARpy6gFHHX
 clLhD/9631+iD3Op/0JhcmhzNPwc36GbPSCVaPf9M9MHPdntWvM1bDIAYa23+LE1y7HKaCnoA2C
 vqCHsaNy2PZUwRuPg7M6COErn7z7+BXKuGLRHmQoabLd366zB8+maN2WdoAZfUOjpPEBrDvuv9D
 ckhVkzuRNCuVd0LbqoXhFKtJZngA0GRjBXgbN/bBF0+ewM3B/zFdkBZgizZwaATSNjFzs+8WhKa
 ahubiibF7/JrllxjeyvJHhvwRbk0itwqtmCT5XRLMvTnZZIidHv3EAF1rdpVcD8sLq2+IM1/sj2
 9aBJteBDYzOLrxAN67IU9ZOHHmWhwdoOHR/85ADJeF8eyrhtZdOwcmenqwoF4u7KfSndhhaRauA
 Jl20Z1Jvf97+mOJMMV9T+tcVaWNYe9fuK3HUgZatheNov9YjPrdalfdLhEzcsDlv3vnYJNWgws3
 wr98ZphmsUhsXhTK2PdTDPp4kNJnj1jAo/xxd/8wEubhn6rP/vVKvE2YKjLPbgCnsaO2KYqvMNy
 Ee+3d6aWvp9dq5Q+XNLbrroMe/U22i37w5um5akrVDwUmnwMdJQ6JvVG2ql9sKmBo7zIgjZDv9H
 UeQ8p2ve7Q+VDL8EdifOCZ/+MzdlHrDHQivPB50M7JsPuQA2b2gPsmcyKG9j/rHlO13W7+MKKmZ
 COdKenIJr/yyboA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020838_877727_96101473 
X-CRM114-Status: GOOD (  13.36  )
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
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index a96be8f244e0..b08f8480ddc6 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -310,7 +310,7 @@ static int nsp_gpio_get_direction(struct gpio_chip *gc, unsigned gpio)
 	return !val;
 }
 
-static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int nsp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct nsp_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -320,6 +320,8 @@ static void nsp_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	dev_dbg(chip->dev, "gpio:%u set, value:%d\n", gpio, val);
+
+	return 0;
 }
 
 static int nsp_gpio_get(struct gpio_chip *gc, unsigned gpio)
@@ -654,7 +656,7 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = nsp_gpio_direction_input;
 	gc->direction_output = nsp_gpio_direction_output;
 	gc->get_direction = nsp_gpio_get_direction;
-	gc->set = nsp_gpio_set;
+	gc->set_rv = nsp_gpio_set;
 	gc->get = nsp_gpio_get;
 
 	/* optional GPIO interrupt support */

-- 
2.45.2


