Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F69C71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raLE52k1FOP5xc4vn5Fhz2KPLej0BIrS83cEFgVPEbo=; b=I++kBaDKYJQwBhpWQFSG926PQc
	iFURus3+YGLnN3MdBP63oVgp8mBefGYIqMD05GTR614cfZYI6z66x/9iTfYO8gMCPHF91YuF7eZ9I
	gIo3lp4+t63nH4KBVK8sbz69K2B3R4va6AFRJuGNrdFqzaMVRFCrJ1So5v9EeGGCJx2Lc4vTRMyN7
	YqtpNzirtWhXlpo3bEImW0r379CNgKslZ5HEh8oQCWJ1yLr4M7bq1MjVhb0BMkHQk5AF8TVBKjRb4
	s/zyC6+pTt9bqnbQfcCxvGQXegjHI9ZkI/7jGIgy/herMagzdlQgBJu1HkywsZoc4iGh0rfNxubEZ
	Zet6KxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnn7-0000000EDx7-0IF2;
	Thu, 12 Jun 2025 19:40:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhm8-0000000DLgk-49sy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4530921461aso8099775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734123; x=1750338923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raLE52k1FOP5xc4vn5Fhz2KPLej0BIrS83cEFgVPEbo=;
        b=uMi5qfE1xmVhXXDpRrj58dR81Bx0HWIlrgNL8iUuOKpkrZLgdYShbw+cyYdtWXTGUP
         FICGBHYNRbXlp7AN/bOarnN1THp5saaaya0xdnjBEpJTERfF3ZKBnk0YlZNi5/8jVNve
         T+Qzyfu+mvbweSGQEB0UvG/4Go3giq2BTfgT+d5QWJSQ3/bUExcpAEOFe/XcqXRw+WBU
         BFth2MYyxx4pY4rDA22HkOcRMDx2hUgWsngOOCWgPf8Ujih6n7SEmB0Gh/hrRIG1xT/r
         vnyP8stZCMEGFupXGZdJkfI9+ol5iaqOT8P/trEcOnk9kIaMebhGMfWVpWo7RVVlBKRl
         eZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734123; x=1750338923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raLE52k1FOP5xc4vn5Fhz2KPLej0BIrS83cEFgVPEbo=;
        b=lTt5x2rM85fkfTmxrvLutGL3fOMPCnxUVXY7dSvfMNq2tnt24iYthUytPP8Fv3eLdZ
         JJ1yvQuj2PiW17PRf8Mw2UPVFQbFMRA/Vbo/GnLkLs01Ol9uU+6hqeW+ID6olKoiYDji
         JqUZr9Fkr70sU/ArdM4VRINRZGpb+QOSeT1mtbqzoIEc5StS0SUNJiRi8wVkDOZScT62
         4E4GCW5PiA5daD3b/zcyX3YbTZ38dOJKM3XXXURcpjAzPV/z421DeqE5gFt/XsaffDd+
         +br7EmV0/Vw3ZBpUNc9lc9/tRaOWXT/CvGhxxzeKOcC57SB2iTLRW+Rtr7KDbaxGUblB
         +6oA==
X-Gm-Message-State: AOJu0Yw+scB4Szn1ssZc/yCN4du0rp1SiDVnz4F6xvmFupubD8LSniog
	UrsFjndWxCY9+tztN9vDlOwsn5MKodpKa3DeOc1Fz4gyKyrQo2cft6rQjRUL3imysTo=
X-Gm-Gg: ASbGncs/ap+9se4fahKO5QEvNmR/vP2/2XDbeCsRWsKbdcWMXRygxvL+Z/aiqqujIg4
	ZIUBD9DSUVLkwYtYCJmTkQfvHAH2ZXBwqIPadNV9aYeIfuvQqH0y1XPqiLBVcCKx7HqcPXWH57J
	E+Gxvn0v+xNe7+jRwKIS7sR/0Q5xsHPMkMUT4aaqxlCzwdHg19n/D7VMFZD+YwQKF4k8Opj5RUX
	KCYyrfx9D05vOQrROvdCR9wqRKa4GA1F5YaNjXuD9r7YiXaRF8uArGOiS+yWQHElSLGCfpVAK5m
	DxJFWELNUtY17fvEvSss8QxnITZn6ojIlBPvmkFI1zR92gs4dBkaK8ZRJ0UXbWHT7A==
X-Google-Smtp-Source: AGHT+IFhdHOEFkYRXt2aGfqR8yUbaKu71Wss7a74LOAwDEENbVsdkagshqU0KdML5k1g7zcI8+VF/w==
X-Received: by 2002:a05:600c:8719:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-453248f9836mr73550665e9.18.1749734123425;
        Thu, 12 Jun 2025 06:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:11 +0200
Subject: [PATCH 02/16] pinctrl: st: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-2-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5oB62agveNry6MooKoxev/dYplc8gqfDNeN0pMdLmAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLk2dgnIHTbMZddeUKxRSqft05VFU92x1VSm
 HYQEZ9FQymJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5AAKCRARpy6gFHHX
 ci90D/4nF341GcBLvs7mN4+c32OAiw+FWYJXPAOuwi/EUKU0s3AT0CdFTJYUDtLgh4tTL1kGiOc
 0afStrGNH+AilQUqqVnZA54B4xB/xitGdZyKn1L2FMY95sTWY2DLazI9FaWGDJHzYr32Is4+/Od
 ApDWy89r3ZqJPsu/AqFA+u/WL1GS6eGHjsGaCqOJkJOxCd12CtopA1Sa9ykgrwOCvflKi35tefo
 c1EdnStWa+4dhBA2u4ImkGdepns6dNSsrR0sIlxPxCYbNjcxD3Cw12K4Kzh28PwDa+5M2rjPZLV
 HCn/H8EY5ZYroSn0pCawU/zDxL+JoWLupRE7O0mCGnMOV3L6bFSoydD3Y5hmzalmzvIDGwpG4Po
 daXmD8lwASgyWOmQdEnPotm7B+8+RK88tsKCp6fRHo6gvcWj8gFb/VqlGCxUU4ZGBWtI6ugA4ij
 1NELeINA4u8yjj7X3/a1UBo2cKr5zrP4WIqCQVR9Q29kLfEpOdoiGJz80VL03tcvUFTye2QsEdv
 +xncjx3Gsp+H9v6sMKbar5HUNDMfufe29u4+gPeU9LFwHb+MMQBz8jHlI1Qu4+zMgbO0dRqaYXF
 XLFoAR2ELXErj81QGwg+WTGD19Aoxi051lXMTTQ/eYD3HUrw2H4T0XHfaLFlBSW+sOOPBmL3S2V
 +yvayW/ehrmLRwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061525_035371_CD4DB92E 
X-CRM114-Status: GOOD (  12.99  )
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
 drivers/pinctrl/pinctrl-st.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index fe2d52e434db8cdc03d61ef3f4df95cbcc9c513e..fb5d72a6826ed730f5a10a817e9a46f9fe319b5b 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -711,10 +711,12 @@ static int st_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(readl(bank->base + REG_PIO_PIN) & BIT(offset));
 }
 
-static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int st_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 	__st_gpio_set(bank, offset, value);
+
+	return 0;
 }
 
 static int st_gpio_direction_output(struct gpio_chip *chip,
@@ -1470,7 +1472,7 @@ static const struct gpio_chip st_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get			= st_gpio_get,
-	.set			= st_gpio_set,
+	.set_rv			= st_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= st_gpio_direction_output,
 	.get_direction		= st_gpio_get_direction,

-- 
2.48.1


