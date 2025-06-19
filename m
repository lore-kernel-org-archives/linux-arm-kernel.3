Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7348FC73C66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=; b=nVbuTJTwlTsf4B2X/f7EOuATDv
	3Atv4qTfoH6Xj9CBWTOeUInqKl+qxnJK5ZFzAWMT2bZ7kukKI+TSmSHfg7H5KMQ56NxqQVIeKP+4x
	I0LmWZa6sDakZY8tgnOs/M4rdBn6ulXxtQAdoStZSphGlk0cXvJmc3lC83exgBBUx6WukXVpPUekL
	eFUB0dG0YIO9NUs2uFWnqHXNEf/pHzoQThjDTCo/Qyl7N0dtgoYL71hdybEmPDs1G1SPv+Hk+cNb2
	qSyLzBUQ4B5FCh0DTREl8nBlYH+gDFaFRKuhbyKEtIX3ZhcB/lcGXQLxaRlSrm/fAMaAOkg/FUC2i
	LLxya57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB3G-0000000CVdX-20ml;
	Thu, 19 Jun 2025 08:55:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiB-0000000CRHL-2cRx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 08:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=; b=oqbxJjgIWbkNnXDZywicSbz+Y4
	qKOxykO7QhESmBkihHx+FzYoadyzK5vQkFE2rMfR/RwvAntgAtV7V8GEKKEs0sydpBCbW/MUy2wut
	XpB8RrOsDQSz3+E2nSUUbzOKjLk2jpk55IN7CorXTLgmkN+/QkIzdCQJmDETWTE43lYFPXn8aH82t
	OkGRmLk3e3LeXGpfN6m9XBLEBUcXBpXnwayIrvi7C1DtOHbbdNwUEoz1Vtvy1/yKwMkZxm07vfnc+
	W2pkSsor1CAWHD1+gYFnTT++uA1yO5AUkQjDQ+eZZ6hw0epNxI570pHxufQYpruqHHQSMuNDYfjg7
	tkCrLM+A==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAi8-00000004NnI-14x0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a52874d593so525566f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322006; x=1750926806; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=SDU/CzPv7CmNIhC/tSNCZ030C+z3Kedd9FcegZGLSeMGB9iyoLCHALPvuUHUus8fvY
         LsI5ul1rY/8TaPI8rw61z61F17m4aPJc+8IrHQepX8zBJ+UHO5Q2i9+3oib7/WhmV0No
         c+5anHxGruCxaNze+j6hsSK52ni1pR01iKsPaGPEAfN/Xquh1S1vXHLPQALt/STL70P7
         JWnahgJ9pnEapH4BViRecDaAyn8JWvHQlFSJsRT1UwSVGbo+3JVRRvEizsc3w19B5nAq
         Drybl6npTllDQEdZk6+ydFh/Sx+w4POry4X7OUtR2f2RECBn7bK63eLMEU+1ZmRttkZ9
         n6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322006; x=1750926806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=AMn1Fc7JF1+++JfDMxoF/if7l8lzilbPX56g5phZTtf7WOLf2B8xUeKLt1mfYKRI9L
         q1ImcsYmQS5nGglT+uEh9GWtkiG+rjlPPu7nOJJmWdICeSte8P/Df1OcBjqbi7ainaI+
         GrmZrC8CJa80XS9dtshOcUIq3TT3r5sV5PXzB9PzBQTj30TB8w/8ZrAiCIySbGfqORre
         yJekz4DQcyCb5YUYWD2ToWHJ/M16cx1JgVorJ62++lS4BLScnUSSYFVIxuV3H/BWbEea
         olTC8szuWBoUdrvHIjJpQafx+enKq6wnnGy8StDw3tnx1MiHzu1U7W0EDAyeWY7nWecR
         /n5w==
X-Forwarded-Encrypted: i=1; AJvYcCWrDRgl26KP1n+6AWRGiSse4Uk6GuQHJk89AozSnydwbCHhsunCVm8iyVyaDtoHqEIb/5LEzCVG+Lcl9ozkVF8m@lists.infradead.org
X-Gm-Message-State: AOJu0YySDnR02XWsd87vqrg5GQBrNeTqsuwaOmSLOvgwj6lyfBwGp/07
	PIy761QHomMuSYhZyZRfaxLDX6a9fPzHZo67FJgQqVKDtAun3se1jSg6+gL4FBaIZHU=
X-Gm-Gg: ASbGncu405hosCmknYJKMCoo35KaX2Dz8L1fYRmqwM4g+ui0xwcjuONTIDmKnA6igmv
	wK3sLmtgrd5bIkGHVCMjkwxlSWiYs05QZnP3/ROOXztLgNzek/TjhZTpbzi05wAfVlhu2Ow73Rj
	ytHoBi56oX+6FMeuKrkZ8P9+Q/La9cXjKPxmnkgGXqztEbJRT1l8IQcXDUwOeU3w+3t0PhHXhM9
	q+jaJW89xV5BVymuNcqCEr7Cr4Ek6rtR8v34JZna99mK1ZMK5GJif5xt3FECwkHjvlEhUYOWWGW
	Vup/xmCdv0ZM81FQnOv/TvgN0tkeQUotZtb/Mg1shwzn2TAQ8bDdS5Da
X-Google-Smtp-Source: AGHT+IEiED0mQ4+a32MGCQhlzyMcTjNqSc3s2m6eXgPGOeUaueHu67jN6I+lpA1Wnn2Ut5FCEP2y+w==
X-Received: by 2002:a05:6000:25e9:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a572367d55mr15222705f8f.1.1750322006052;
        Thu, 19 Jun 2025 01:33:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:14 +0200
Subject: [PATCH v2 01/12] gpio: pca9570: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-1-74abf689fbd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=t5r7nMPMOl/Fqhu7blFrjnyYOcc5SoneVJWT0UVvyG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tRTHJhon1ZuCnCenmO49z6Bq3Wu3wOrzICX
 o4RpZQLMR+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUQAKCRARpy6gFHHX
 cq8LD/sF6228YfnMmyZbE3tlZK1iFMNVyr5c67b6FoDsGs8zrAd40Lx5oCbTsP4Im25mpNB9Nly
 Ezf6/TpCHbwpLVGeCuUl8xunzUEtaXQU56bxevMxjgvc+/QmaDQbQ5ZOn8xBHc6cLHLZt5AfqLr
 Kc76zQB/jux76D480JbJMZM4S6zFEpAn2Ey3LfaBXrNnIRgIWFHce7Rb9DS/+MJDbjWF7tjUlg3
 SxGymF06crmm6xMLbzkAYcozsGRun/1XntMRwG00CcswvE9JuR67I2SDFHFRchOJXDVYhjaaZhF
 PI3R0uPx6ZoQ4Nj6GyULy2Wg6l5am+JImsMhwb8P7hjA+eGiZJVi1kcyvSPXBaDy2n/bf/VlA8t
 j507rlA7XprBb2k+4iBSv9Uf46wUQ8FOudWqHDC8M4BcqiVEzgOLfQcdB7Brhz/6Q1EBGbXQW+/
 N5GPOEY87jwj4jlXUe7NvKnmk2eC79EAeWoS63elxYg7bDZuoG7n+26/J4V2iNOY1jyfQRpPRri
 d81T4MjJp0IRjO5TzN492JN8CLSFWVt/6OkZvduQ8LYmqx6NDXoN/v1Tt4KUNFZERDEZ+UWlko8
 OmZfykAWqmgKXLrp5PTD3mov5S6owsGQzcDGn9zirpSQ9Vxz4NrxjvMVwAhjmewsTMV/QCC+aXB
 E//DPkJ2ybu9CIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_093328_593694_A9C1ED27 
X-CRM114-Status: GOOD (  13.12  )
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
 drivers/gpio/gpio-pca9570.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index d37ba404936835bca160822ee361604827976e9b..a33246f20fd838a57abeedbbd7e58259bf073a86 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -88,7 +88,7 @@ static int pca9570_get(struct gpio_chip *chip, unsigned offset)
 	return !!(buffer & BIT(offset));
 }
 
-static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct pca9570 *gpio = gpiochip_get_data(chip);
 	u8 buffer;
@@ -110,6 +110,7 @@ static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
 
 out:
 	mutex_unlock(&gpio->lock);
+	return ret;
 }
 
 static int pca9570_probe(struct i2c_client *client)
@@ -125,7 +126,7 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.owner = THIS_MODULE;
 	gpio->chip.get_direction = pca9570_get_direction;
 	gpio->chip.get = pca9570_get;
-	gpio->chip.set = pca9570_set;
+	gpio->chip.set_rv = pca9570_set;
 	gpio->chip.base = -1;
 	gpio->chip_data = device_get_match_data(&client->dev);
 	gpio->chip.ngpio = gpio->chip_data->ngpio;

-- 
2.48.1


