Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFEDC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=; b=mBUiu6paCcoaUhv7caxxdArWzP
	ZNf84gEu0ADWnZwP3Uu1O5jYanmU2jh+2nURNTcuRJqyVEWUm3qGx5ix5sltJft2X2hqOUskEtflM
	J0ATYV1CqSxt0GiY1uuNcacvD0PELdHp7yQ+Defd5GQhmdfMYqZ/oBG8ZY/Vg2UmGz/9S8S6cK7hw
	+SnSwveoHXFosATulP1Ui+0DD9BfXSsyaBnVVuq+fST1eC+VcYrMe6ENo8e0bsjelWvlKEsFp95SN
	bitq66XTz6pVBZGDW1sHm/cHt1dNJU/XnSlEnHDShmZaJcxbXxdMIKTB55teP57dDesCsGIH7oUhW
	NMMWdE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVwY-00000007GbN-09Do;
	Tue, 17 Jun 2025 13:01:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVMw-00000007B0S-3Vil
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:24:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so63142385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163089; x=1750767889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=;
        b=DJlh6iXrRsbX7eh5R9M2TiJTzyHGDj/AX72X5bPnxjaan6E3VBRUUe/pyRTA2psyta
         xt1d8gGScYNSKwXOPDRkDO81erQQm1NDFISikyWI3gSfuO8xbq4Ji37OGrjEjBIOUqJ/
         M3zhOg0ZZQEejDRYlSgIr+HlrAjRD3uQ5CEQLEpfJJ+5nzqYwgPcGFBbMHQqg2pMP19m
         Jz/1fa5NWLDpzEPgsXWysIC+w7Usy3+Fib+oXJiVy0o5AqlNLgH1//Q6+UtbtRnhd+nu
         dNz1VvTqEDuF+yKpevR7F/ir1EHIRaDCJmpyVElNXzTucnkiIWVPeCbR8r4c7ZaXYa8k
         Ssvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163089; x=1750767889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=;
        b=RDf/CCDINpWXUTNXR8qxSErK2/F1Nwa2C9vtYE/Ua1E0K7SRK2suwSHHY05CxGP5bu
         hfG1pepTMAbwxXXLP5Fj8egOmNbddgiF72I01Pi4lkKaNg5DBsDWQeO31EqOiKYN7s9J
         exiNEaaOpKnAO/F68JckqwUhze0KF7NBEwhnDryVbqTCDmrb1irNAjOrSoSwXv0rUwyg
         wnw3QGXJ22ZOw68EdGw0xPrBGpqmHijhx/UmM5uE/u33/BeSJ2+FHBY8aL6jpC/JDKbR
         QymTFuknqj5QTviF5xRe8eJpPgTUOCd/rrLrGj4Sp0lNXRm4+D4cA8q79H8smpY0y404
         RklQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCjqxXuXLsOLu6Z1eSWjdcW3OpDJlskeNLc5gnSpcPggv0El0ae8g3L+pLWxh2nUc3ji2M4yTHEpIuzzzS851b@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0dOLZ4urMii/+LMqURXnNNA6ClDgCwtx63/GS0n79+46XC1+6
	rmJd99dUO3d+zGYzgF/WHH7BA6xdFASgV1/PIbxIofRtWxWaCO0JFbm2KW+zmRkr0yU=
X-Gm-Gg: ASbGncsdcWQh3v+xUWyZaxFefK+/6kWHNyuWep6H8n9yuGT/Je0lXPP4eFhq9bDlTb9
	ul493l1THEnYTTOGHixL8s/1U6Zaud24FGCWzT8SNhKTkTLUhWDYCbU82pZB/ucNebxgQWOrI0z
	gprCuv5nCmQmi1nJg9T8QZe4g3FtEFx1zaSm6N6Q1/wTIS+xLsmn7+o1PlwEEUv2oRI3QeGnnWj
	7Rqb2+SuoEHd/PPr28DNgHHew6Zgdeeaaol00D+Xr/3/GER/CTwr8iybqvtOp4zpNrgeGQl4EDR
	P1nin/ICTD3m0p9aOyRmfP8kQRN3GIdMgVEU7l2f9drMv0OX4oLRK8bf
X-Google-Smtp-Source: AGHT+IFwpjSz/VHM1KyhKvNfDih6/s2ZuW+4Piw/6pIGHipA31KSBXaVEaKGZPgbplZCT6m1zd4LdA==
X-Received: by 2002:a05:600c:5287:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-4533cad0f12mr125521595e9.30.1750163089462;
        Tue, 17 Jun 2025 05:24:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:29 +0200
Subject: [PATCH 07/12] gpio: rc5t583: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-7-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6HstBkB2gby7ddB5ZLVgfxa78tJTCxq4I8J
 JXEAxgt+RmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehwAKCRARpy6gFHHX
 cnWHEADXLgTBO1s9GscEdPh3i4ocjK3Fa/8SahQJlDGg7IYd/EOFZsQB9lPfRFp1AmdlmS7Hyfv
 wGE5ENDEW385rm628aDZa1kkpglOzfjnYMKvsWysH/pBILnzwVxnNE4SF12vwSHkFjg0FN9MGLq
 Iibrg3tGBwjti1unsrky3likoeNWePQQCY/bjxBqIi4iaLMzHJFHZxNSRAAsmDiAbQqnrFVtDjY
 WH5QxkOAK/XBl/gNy+G8iBDGPIDqg1SRVQ26Lubw2pr7hxNP5e0dKF5xK4U9RM2yITwhJEDDCsZ
 D26jI2LV1B3QH6PdxJole1tENQRwDtL7XBgKx8cge9PwP+chO0J8WORAj6Mq07foZAnpLhgum63
 8fP39So4JYKqREjjgCgLJhdI/miZC+oTjHD+FRg+5puOVly96N3THIJ1Qg99d9Tdeb229ub7p7l
 xdFj2tti/aRhg5u6l/KFUttQMuS/QG/t5EPcIVfTYloM/GkfcitgFwLSxjLdT2e6qwYTyvMN/YW
 vegXsOBOMbpvEbX2FHamQUKwfV4eV8gcsThCxpamwhjZvd4WaYQLJinQgTectos4gxBgHa2i5TT
 1FoQlOY6pdq8zj/npDGDSKcwWyDBywH0KXAx7UR+/D1+AIcFMM7uHzUMrvQM3C71524LbPY2HAd
 aQ6m6DlGZp2r1SA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_052450_893715_E8282A36 
X-CRM114-Status: GOOD (  13.39  )
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


