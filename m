Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D194C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeMSlNL5v7plT+CdY2CAH8xRYdEmWgOgE7l1ThlWmy8=; b=oq8pnThTFuZvbX1F1DcMb7QgdK
	eMwTo6q2TolPjMfEaZXQvWdn7+1rRKO+6wl5YWfSPMcrAbsxR10JVZNSpnKAWQbOjofp4e+wHF/RI
	nCppyG1KO76fCtFkqeHQTBJsFTHsM10AthuI64WDS0F62QsO6HxdIecv4OzMtNuxPL8XyPYqdVZrD
	s6Qm3eFqdi2xeDs9X2a8W3Rclmh31RrnvrTaQHJ+GhlaugvZLjzMdbX5t2bwxhg1kg7FVcTN0n8Oh
	4um/E8CAyt9XX/tcwgYpbLGrHCgyHOgbQXZGu4xbgvMvRd4t6NtpDU/KCmehUTDsCdvLwSwe8UCmy
	nsYo9sMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnZ-0000000EEXT-1g5i;
	Thu, 12 Jun 2025 19:41:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhmV-0000000DLq2-2Bif
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45024721cbdso7996885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734146; x=1750338946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeMSlNL5v7plT+CdY2CAH8xRYdEmWgOgE7l1ThlWmy8=;
        b=C7UIX63YSIdIshnVDah89UiSBzYapwI/5uAo2dQy3yZ4dMHD3HXUX/icQIo+dSuACw
         NVK2kLCwbXEqfpFyFoZmduS54hwpriTuNe3GJgwNB4aq8tz/U3cY6+Upx8lnVbH25hok
         wWDjZB8nlCHJyB8YCktcrFHO1tdbOTtVSDFmX4B9Ay/BinSNHu7cCAVfodtgDFm2uHUq
         6UyfCbazdbdomRyJUtBnoXB2m4pvHiyzF4mAA78bJ/Bxxa/HnIpTh/b9j9+VImcftF/3
         EJqhFwi9FitqlJgpx+d6R8MZ6xFjhrnm6rA+QTwteD4DxL7mZbaVaa9Iu4tN7AQGZl4M
         uIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734146; x=1750338946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeMSlNL5v7plT+CdY2CAH8xRYdEmWgOgE7l1ThlWmy8=;
        b=kFUYPIiwB2A1xrq99oJWebSGfXZfmFYGRUnRfo0Xbf1yeItY0lJJHzR+hjLPUsqv5V
         d77WB8w1TIEtguTeK3X35TBBNq0sykXVh4ZiVaZexlXaP+lG2EPiRGwInuFbR1YTsHQy
         ztD4owz0OJiTvZMi15ONWcwZQNFfWSQlUws5Y1YZJZ6V7GI2XnXKAbQrSPJRV73Z09mX
         Cu20AOAyoIaaAbBeywo1Uv3hvmDknkaB2tudk07mKJeZd7TeGkyiD5Cl4W99XgpRNGt9
         Rv7RRSD8AGEY8X8cvOpiQyWtUVLEGWpoiNfOQXf4EvokDvP6a5MC4X0aZpP2G2gj796p
         HrRg==
X-Gm-Message-State: AOJu0Yz/JgBps9D/XZfX24FNvW+13IptyeJ3Cag+c8u/bGjJUQxiUBhm
	2MzH17cU5dp7zXCGyWgNqiP7zmhh2qQEOVCkyZNby1Jf0qze9tu8UlDy6yO7aYBT64g=
X-Gm-Gg: ASbGncuTCARISeD2MIPtjVRDsvt9APTq+27fM3uLWldDyazVXSYr2sxw0Bg79owxpN3
	ob8EI91NKY+lDxecdbOjlhEX+0PYJQDh6pVBjVgcb4ZHv33fSKVGAN7S5N06cTDDvbcpGSKTuAB
	yUyp32Jct+bBhHAqrC9LY6Ka+kKZd3oKBPbzPwns707nfsRqcD9Py0+31mWwZisquUPih6+jHpz
	eFg05090JGkBKSHvdR33XCOLXyYXaCiK6iNTAjV4GhMjOnItbZU52Toli/ungNmSYjsUrTHgs7i
	7dzIO5sR0s1IoLHAvDAxqItXIeuGcgRos5qXlZCK539gbByR7CHk2zE=
X-Google-Smtp-Source: AGHT+IFfk2JNW5+JEjAS4QGCHFxkYolSwpuwPG6mz1wRQQcTjF+58a/OlpyQ8Y8a8U04LXW/Ou6tzQ==
X-Received: by 2002:a05:600c:c04e:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-453249a1500mr45370855e9.15.1749734142562;
        Thu, 12 Jun 2025 06:15:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:24 +0200
Subject: [PATCH 15/16] pinctrl: as3722: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-15-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fTmHKsEYrKTNyxoNVzmb5kuSXiJl4noseL2AUv0JQqs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLnJzYKUbqVxOzi9/0Npp9vPvP9vlYV0ANF5
 rwLBnERYbWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 coSBEADHmODbD8gx++i43lj29SdaYhpz3ZGxHPtzCbpJM8Weriq+nhM6eLcP4+WvjNqshPbwg/Z
 n20SACuNZZz+S0+l9KGgSHzYrmCVuUEiF3DNl2mICCeEspJAxClBAGUA2y0Q2TpEV2SLxz2I4dv
 EtAY+a2ESleqNVnppDCes+DFZ5n5aP6K5VD8Hg7J2DLFYtNp6qHprkyCqcTsOnSb/nuo86E8kZF
 zDRkzeByIrj4z71f8Y4fLKzDGxq8krDXvhm9SD73b2UCvw6QXQosqznLheEz4+Z9CPrd1jKbE7r
 cDjRGZ920JYxOSVQHMaipi7GJZsBW/MOU8qI7Ox3HnQbMfHtmliB1rwYB4AhffpcWWuFNw/64se
 CQfZuf3MI8WBKHUHreGVFrkLIfa/dDyNdag0niMoHvtUfXOc5gdwfyduPuuRAwPEoy/gflanzKJ
 W/ZDOKFh3IPWI9cbeaKRzvYbJ4CV2OjtB5/gz+V9t7+aIOwlEnHvNhmcYT47t9LDEBkuOasfyVx
 HOartloAzNYSN3ytVG9SxzobpHzoH5MHqHi1q6l1kLVt8GWdw//Pyxa4Mi/53e/YSBADF7E5j/d
 icL7N29K4WriyHwptsCLWDZn/Wh/0d2q55xgK3Mjnea9jsemXZ7KgCgdZb4MJD9JsUi+EPUMeDp
 qq668JcQgjxm84g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061547_568470_E368ED69 
X-CRM114-Status: GOOD (  13.92  )
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
 drivers/pinctrl/pinctrl-as3722.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..0c7777a7669fe60d7ffd15263261a9f4d5d7b659 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -471,8 +471,8 @@ static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (invert_enable) ? !val : val;
 }
 
-static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
-		int value)
+static int as3722_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct as3722_pctrl_info *as_pci = gpiochip_get_data(chip);
 	struct as3722 *as3722 = as_pci->as3722;
@@ -484,7 +484,7 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 	if (ret < 0) {
 		dev_err(as_pci->dev,
 			"GPIO_CONTROL%d_REG read failed: %d\n", offset, ret);
-		return;
+		return ret;
 	}
 	en_invert = !!(val & AS3722_GPIO_INV);
 
@@ -498,12 +498,19 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 	if (ret < 0)
 		dev_err(as_pci->dev,
 			"GPIO_SIGNAL_OUT_REG update failed: %d\n", ret);
+
+	return ret;
 }
 
 static int as3722_gpio_direction_output(struct gpio_chip *chip,
-		unsigned offset, int value)
+					unsigned int offset, int value)
 {
-	as3722_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = as3722_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -520,7 +527,7 @@ static const struct gpio_chip as3722_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get			= as3722_gpio_get,
-	.set			= as3722_gpio_set,
+	.set_rv			= as3722_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= as3722_gpio_direction_output,
 	.to_irq			= as3722_gpio_to_irq,

-- 
2.48.1


