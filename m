Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83270C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8UXZTozvJzjGLspnxEWNqMkDpoXY67SelwpGY/ZF58=; b=QpxiIpYcaZC2lYV+9CNO0fLQh1
	VrKRmtY6jzuxIe7k2zuINM2t2UKDkHt4+cXIC1UFB+Rd6BAMoIwK+MHacZeizlygZ5NXthA6jX0Il
	QF46dCDzq9Rtve1kVfntey2rXWFNqOmN+i/FWGNuiOvdpGrJzuZCYEuGZ4XjKQEQqHrswl/tWIkdv
	xT2spVgfR6CN0XbCYQOC8qXvxSF+Ac5bokku0dgB2SvDXYD7stNL9JOoOMsSo2O4XhG+ThZjypaYM
	10JB9jY120Ky6kc5Iy1s2e5eYvYLJBGZ1vxTQFXVPxCbRLyOnBYjwEjSX7zLIZVaUEU6YOF6+BjjZ
	4lPiFaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fu9-0000000GeRT-0ArK;
	Fri, 25 Apr 2025 10:03:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Evn-0000000GSYW-13c9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:01:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39ee651e419so1129819f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571669; x=1746176469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8UXZTozvJzjGLspnxEWNqMkDpoXY67SelwpGY/ZF58=;
        b=X6L8E9ZCgVHivxqEM4IKvi4gAACQjAs5+ymviBYzbCcguiTZw3A1ItMAOZprEA/MiM
         Ga1pAu9jfzdbCGdBZW7UUfMk5x2ee0aXE654WS7OQI/91E47aPz+ykM5ZhGdv1wi7x0D
         f6W5EDTaTOpM03Md682H1PgFHl0ScnINj0QYYLUWwJclvNSFkBMWRLNVdACm7ACMTRVv
         4uOpGp3J0BV1ME0xbFzAKit0sveZYqVHOpE+ltU9gbot8PGlXScR7pdkZRJPndMLcoMU
         JAEUmfNK1rSr7M+Q4PDyIKx5BlaOMu7FThHZWRNbtwVOo0tdOFnTM/f8YLlt0LOtyZlo
         rSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571669; x=1746176469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8UXZTozvJzjGLspnxEWNqMkDpoXY67SelwpGY/ZF58=;
        b=ICqtLlWEaEEGLi2TInN4lDlH4AFoKp0t8jtogUuNFEhNq2XzriojnFxRJB913Yyr/Z
         z1pBWZszIwTe+77nDQC+M8+x0d1ikmueGpDkjOQzN1nTBHFrIJBLPWLiPAPTagKvraPs
         Nhy66cIdG1tenY/tPAtc+qxfdSDONBtJx8ff5RFmIRInCGZ9bTb6AEheBwsHXHxWdoDF
         FRNGXSyppHwNC0N7axvUASV2tnOC3zdGdrIibkjxWPgnxs9fqP3/V4ba3FImV91D5Bp9
         SXn34KvjGU4jA1JFlJrhc+o+SLeSZTu0cePtuJOW+xUtZstdV9cRnF5f6o9v4s/C4cpD
         mO1g==
X-Forwarded-Encrypted: i=1; AJvYcCXn6C+WazMf4gUx7q5iepHBmBr4nVVKqHKsS4L+FFKjBw4QpCOemOMJiFfhHbBwjsmNnH5pq+NUxjnzuQBJO8Ea@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3MxtpARf63ku6SMDPisJ0AY3L0XCpS3VBgrHIJcgBU80URXum
	BhOhiipBJL3G8b1kiD90/h67eXEN8b6i+zpJT4FJF/36HinDNHpM8UrzCCQwOYQ=
X-Gm-Gg: ASbGncsgXdSyFLi1on6h3XPGLo+X8GSMgCP3l0BKgNB/0Gspw82+Ll9vGrDqVyqIbm7
	AgafCVhA0zL74LW6f8bZ4jPPPUeFH8yAV0ik/HICMR92PKkZo3H1t2lmVrLOmNFF7X6q6dsDsCV
	5Dwp7B2DBv5iKzpzGaFlF49jPxoIB5OD8Hl9lMc+4x9JSoKoO1jpGzPopjwUAgKVv9gnxA9W6Vf
	68PZYfzVxk6uhMpHHBHr5TgVshfUBaH5apWPInJwgSxjDIqQcdvGCAX+2aiHl1vI0azYP4fp8QF
	9hbk0kTYqLTUQ3YYbJ/wfwuTiEKPTubHXg==
X-Google-Smtp-Source: AGHT+IFckeNXXJag89Vd0W7MAUKrj0/boKLVXA4/ZToJROXBMZJpIxWvphXkHztSufJCbS1p52tVAQ==
X-Received: by 2002:a5d:5985:0:b0:39f:ed8:d6c2 with SMTP id ffacd0b85a97d-3a074e102fdmr1039852f8f.4.1745571669412;
        Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:59 +0200
Subject: [PATCH 3/5] pinctrl: mediatek: paris: use new GPIO line value
 setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-3-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+GvjQy682fLtJAVRTMRFy+x8ClXiXcJ5yyuJiL29z1g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09QDlA6V2iktjKbxY3hklKfAJlA4oT2QZrGX
 wXC06aDqWGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 crgBEACWxWgAT8cG/mDkoN2QVfPEWbfVWtvWFRQXv54q2Iw67Mow6zOgHOghjKXpL3F5MmAovsN
 Emfn+onAMvQI68zegwOSkt/BV8B29JP7kvYn09WEGSYg54V3sn6V+gzho2WzN8WwpHFitzxdeL6
 Qx75OBSlRSQvM+Rg1YOIAUNDCafWhbA7KAotx2YJeIM4T5h62okSwaTplWDAP41WFDFywwRjVl9
 JWhc1fGWSZTNrBtbeVHe6xKZSSt2qBQhoVl2Uz8o9q73DJ9+O3SyHomy3YVbvwRKj8aUWohlijR
 gTwN+ZQx3IFj6xoEwrdToBSusDzy5MU8LcOU0qoT8Q1BpWnmY9hHxECr/NFdbSrgKZRQhVqR6Py
 4vImpttpgKXrFDj0vYJdQ49exEqOj16V32VGbfcZOHEzXrfDn3kMlVS0NPDYG2pTmPYuCFjQ84E
 9PrGPAeGq3KesqBih6WbmwMKCV99lt2ob3xvDv2odYaXvG5O6t0SXtxGr1JAdpZg+X+d/SAZuLm
 pQnTg6IlkT0SZDoyNLTglOknViI/mBGdUzsBxWXmEHR5Agu+A49WHMihKIIWUrHlTjO6biMlilg
 kRA4CWZLI4Sl9xJA7CRIYu8fuqexaPEA6/o4taqQurhZlhFor6vIh5fXZePJsdudZx5Xj4k5wHF
 pyKFfkhYSs1PzCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020111_304648_348E61EC 
X-CRM114-Status: GOOD (  12.45  )
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
 drivers/pinctrl/mediatek/pinctrl-paris.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 852ce0ac7ff9..89ef4e530fcc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -874,14 +874,14 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return !!value;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
-	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
@@ -892,7 +892,11 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	mtk_gpio_set(chip, gpio, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, gpio, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
@@ -945,7 +949,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->direction_input	= mtk_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
-	chip->set		= mtk_gpio_set;
+	chip->set_rv		= mtk_gpio_set;
 	chip->to_irq		= mtk_gpio_to_irq;
 	chip->set_config	= mtk_gpio_set_config;
 	chip->base		= -1;

-- 
2.45.2


