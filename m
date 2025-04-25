Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8667EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+v5BXhhKCYYQq4gpYTRiJk77N1zu/YeJY08X8KspxQ=; b=OKJxXpaHsdsy3TIDTQ74URHO55
	RfEcm9l44HIgVD//EfMGOi9TGSa/KafUJV8QaDY60+aLvBvuqWY5bN/hEAEOG16ACSPCNF8pjcjEo
	/Er9WdfRBjQ0EnaKxCk09g5PrCECnsAETXgTNNG9Tx7bknMDZQnzj72B0bOPhPRD1a6VbzdmOF0zg
	V1YyM7KBdwIDpoHkey6HSqRP9qGYelQRQ0G6J+ptFh1WQC9A5QhsqQZuP+q0i5oTCpJFGVzuyxPLk
	aL88kFO9af0rhhDeXQrLJQ3bPv6x0Mp5DvMZ3vA1ioBu78BLHYLeGfhfZId9EIsIhVvJJuCl3wmAP
	XTukfBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G3J-0000000GgOm-3K1U;
	Fri, 25 Apr 2025 10:13:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8F33-0000000GUDQ-11aw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:08:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ac56756f6so1945834f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745572120; x=1746176920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+v5BXhhKCYYQq4gpYTRiJk77N1zu/YeJY08X8KspxQ=;
        b=kvd+yRaT1QXMY58/G9yFBpAYbBXqDrpU9XyV0nmXdn6BOStAk8l6GOWxQq2Hy7zprv
         xZQ2GKgekFcsSkJsIAjBIPsVLso6h66+gpU2lhm0byo+oo0CJrJsabrXZKHzvpXN5S/w
         RQpK9AWpSkMjzFuUqwebYS4lHjHxSndwwX+GSESS3tqSmBQq1H+IHjXOWHwxuRXrRFXq
         P6VPVEuNBGx0nX8oEtKZk5m83xsqujU26C5IZTUdsonLj/fqGRkUOv8mYI5QoP5+SZbn
         DdgC+pQsDcTYxWfR3ctUoB8Ry5c+AvBWZFeBGQfdvo6XbSDCFTp86Uff0P4G7/xCZass
         VZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572120; x=1746176920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+v5BXhhKCYYQq4gpYTRiJk77N1zu/YeJY08X8KspxQ=;
        b=I7Y3LOimYvEEfYGi2saGcYWSTil87p9P/8EGWwl16cmzC/2D167eJ6XB4122b7D/IC
         gjuqBZA02NAdTpVP2GipDyDGob0ecy3vRr1/UZsYo02jBG29zoFflyAPOhAE12ArPXuL
         6YCGrmIbEC51mD4NdOLjncm7HL/26EeogcGZEFEXX+En/ZIjESyQAVzZdkJZpx1ib2ra
         v53qa8DSkBoMcz60yetp4sUUMg9QAx1GCtLs2bENbaVBBDAehLy0OEjWAcbt0HTD4PLJ
         V4noiuO+E6kaKAoFTiBK75bU7XgdC17I7wfV79fJsi4Rlf2Q07q1Tq9RNMUoYSJGBThK
         JCcg==
X-Gm-Message-State: AOJu0YxEnlhwtwCpWyUOx2Bxi9kD9EUV013S9x2TdVut80Rl3PL8Pq+p
	TT2TfGCikN75EQVuzoj2WazxEXrOvKQKuN9Wgta4QYvICGS+PWbYRmtKV4io9hM=
X-Gm-Gg: ASbGncveN4QI8EvMnuUpIJBvLY4tM/RPMzNNlH+d+cvc7g59F3EILr/yRi7vrBy4KHx
	2VsT3cg80SwGK2jsX/FS8yteFQFPAMq0DRH+4O/QzozfaWyiLZHNCgRCwJotNSya8BCq5TPN6u3
	DQtOfU0k2y9vss/smotom0mhEv9A7p7Hl/bXy6rJ2IuAwObxDaH+MojKxNUd/Pq79L8AKrmvP7K
	Cm8VVhPsYJh3p1+wO6WqAlCROGeobvxUmfS7aSiGgPWRnffKfyouwps6SFUPPrIBUNQ9rzX9vNa
	93nHzhBo/P7BARiV2H/SutwToafUiBEXlQ==
X-Google-Smtp-Source: AGHT+IGN/vWTOOdJRbfqbsJsmvKshGEv6l4OK38T6XOXQRPgrvaijj8/T19lKBfroHc+Nolpyh8Jqw==
X-Received: by 2002:a05:6000:258a:b0:391:2c67:798f with SMTP id ffacd0b85a97d-3a074f154f4mr940261f8f.41.1745572119738;
        Fri, 25 Apr 2025 02:08:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm1688909f8f.87.2025.04.25.02.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:08:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:08:30 +0200
Subject: [PATCH 2/3] pinctrl: bcm: iproc-gpio: use new GPIO line value
 setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-bcm-v1-2-6b8883d79b66@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AXQvvsX8aRsrH6IPjREq5g+zCKjZWUt9eQLSBi8qPzM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC1EPM33kYpK05MSkPsmYPi2ni2pXZtF3jM//c
 +NOmi85KW6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtRDwAKCRARpy6gFHHX
 cumND/9NDhDagbohLKHaVpqHCjYGMLprtLl0fswvDQm6vOrfMCMczKAQ2yKRl7wy5ssQj5ExYFe
 iiVWum+9hVvTsheYOoQLoLDOjffUKPtRs9ottEeT7W6B6aZkqLgvgEPKEtHz33pDMuV7Vl8LPBy
 +Tl++w9ixP4DS+7Pgf4Fb+DnkSHy54Jb471i+LP/buYQCS6/WaR/a7xY9t+dSvlJiF7aMogsWs0
 8UIS7KUOTGNac1pMUj1vjNMbbazqmx+yi/LUGMuF9FaUTo95pxr/ngMR7h6P2l/ECYWoqxx4HeO
 InOzcRHBGE3WSpGP+5Q2nedWWs2+J7hNaQZPDgPSwMPcmnofz6CIkOonLbAg1MQsqUU0flDVYER
 cZlwX7FIMeJFNWN5SbyAsdz3z7rtBBdO/0u7GHxvTyKWVZCd7cIsTgiCqQPdE2HwexPtMMRux89
 /QTTBhM0/BB5vXgdwxJTfF8FahYkc03S08Ew3ICCKoXjMsVZ5xrN+JOdnkacZLCMcJ1ftqpBwLJ
 jnb4yRvayiA+5ErzzEwSDs+3zgAGe/AAWkB8Uz/hjvTELKCMVeT/4vwIBgJWUPQgTHdHgwF1lci
 +FJVQIkoPiUp9l17NDejpnFAFqgHqY7LXJ8VA0Pvpo1JYmdQdLWOQbTmsdU4uoCXKV299Nn9a6f
 GRikUNE+adMm9qA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020841_286445_AED87D71 
X-CRM114-Status: GOOD (  13.84  )
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
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index c9a3d3aa8c10..1d08b8d4cdd7 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -390,7 +390,7 @@ static int iproc_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int iproc_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -400,6 +400,8 @@ static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 
 	dev_dbg(chip->dev, "gpio:%u set, value:%d\n", gpio, val);
+
+	return 0;
 }
 
 static int iproc_gpio_get(struct gpio_chip *gc, unsigned gpio)
@@ -863,7 +865,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = iproc_gpio_direction_input;
 	gc->direction_output = iproc_gpio_direction_output;
 	gc->get_direction = iproc_gpio_get_direction;
-	gc->set = iproc_gpio_set;
+	gc->set_rv = iproc_gpio_set;
 	gc->get = iproc_gpio_get;
 
 	chip->pinmux_is_supported = of_property_read_bool(dev->of_node,

-- 
2.45.2


