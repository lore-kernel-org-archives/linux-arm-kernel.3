Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FA5C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=; b=MLjL9uUwMqDOh3T9wbONuILwyH
	EAW/P4b9NbEIhZEvXWPhmx/86OgG9+CZHrahD7ZnG26c5kfKvAZmeXBsYEpiziZERHtjDROLgs+D8
	fHCa1UYSSpmjWX2gGDR50AK9hvvrGCddt/Smxw4goMK682bEqn8tGJbmEGg7Q14SEkdlvFC4eNNfl
	T3PvXq+s34uCz7ibPXB0iPc14KPqMrlWvtdnOAID2LsqAowgvGKb7dV6JoNOo5bEOyKAOaUjCkgjt
	sNh545RnRCD4QaD5e75k3ruMmJ9hEFhAaseNQe9A5sTJww2Io/oo45a9NM1oaBaoXdlRSAm8xz4Ny
	Lt21MFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Us-000000035rf-2BFX;
	Tue, 08 Apr 2025 07:35:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23La-000000033Oy-3O0L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:26:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ac56756f6so4430435f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097173; x=1744701973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=;
        b=QzMA/X896hVu8Xi59r8a1u/pNHYiFo8kT0UuJWZy8A1s7iW6Jqh34edMFfeFTybJo+
         yQxPAiztjvyrL+Cq6amqP8Pk6IOEl9FCMCA5+89llGe1FZmE267M+DmTQ4L9wqlw9Gxu
         +/Hfkm8r+zMzPzE01k04rkY+kAkJSBo2ZavpdtFlN83EOyBJQpgCsV+RqQUmgGe/XmCB
         bdptzSQ5FBGenmgEJrNMwKu94hdadZQiuVDIWsjytmZRcJjKL7QTnL/+sS38Jo8C/883
         dtDEMlUsVk5RwOD2oTDjopenHiR3s5hDFAkf0DVWcGdA/sqii1Kz1YsWIQbLxLAMY5bg
         pngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097173; x=1744701973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=;
        b=PAd6m69hk25D4cmryaaGJwnxKnAECIwY6OF3eUHt1bkX3yrRUiOD/t/XPciZ034nXR
         ermHeH5vvnpt7qhV3Bf8PtSf9KEn/qeiLViKiL/HFyKDExdk8SF4AyqV8Bbs1iAy7LFU
         M4cSIdROdL+8/rZKlAdAdDN9tEYPJ8iysfhGMryhqhVBeTIV9XW226h1LzN9KYoBXxy/
         /54YCwDU35ZnoLtACjxWvIixIawQUODtCrvH0naRBQqKIf7x/rzM2ZFFdolzh8CvRfYO
         yhZeaMXf94SNJxytIvlW/taJ8XL+HP1pVHHuu6ViRcnQAFuAm+f3/N1q7fHSSrefSNyZ
         JANw==
X-Gm-Message-State: AOJu0YyP+h4XKXjOCq5tm287uwdATtqkQWW1YSLm2D3SFotFzwOeMWSf
	LgJoLP5tA2ZWqalztUE/L0DznaakdzpcCSTACd4i4H8Rg/Rq7qNoQD7lKu7XALFruV5Icq6aJrv
	0R+U=
X-Gm-Gg: ASbGncuHb4+wlZVdBPhMAZFxwKLiQDfkh+03UF7NwKzFfNvpIfkjv1mvH4vKrIwjh5Y
	lgYytpDbiw/kY3Ho/Ob+e0nHycFcasweVz3A5IDVRxUnY0mbUtiNstx3OA5i7qveEEku0dFjAtB
	0qU9NoyNFsn+auayw8XRuD2axmzKHY8N0hkgHcHoTWzDy5H+1FM8yRN/n6AyqDCGVNpzyovMawm
	YBxPTvAm8031OAFW4P9f7aFOECAufRgdn/Xs2xUjvzmeYykTU2ZMp7ZzfkhokfZovcPJ050gJPa
	UHjNrjzeOX+/gzBzJxv4Ljj0HOg6WnzLvdpEHQ==
X-Google-Smtp-Source: AGHT+IHzySH+p8lRsbpEKp8XdjRw3BmN8WdHjMLgCKHMXaLLom4rGv3xsF4growXW8khurtrZ60whA==
X-Received: by 2002:a05:6000:1846:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39cb36b298fmr15212511f8f.5.1744096677281;
        Tue, 08 Apr 2025 00:17:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:44 +0200
Subject: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=667;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YmzRn8TzGA6hsDQ4Ls1ViAlvgo7b9jMn9Wlo//Y9vfE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2a3aI8tyRJWFB0j50+lYKjuGbu/ifeaeFQ/
 4M0t4m17MyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cnJ4EACh4EPB2PiBQrpFxrQpn3I5/hHOewyCLs6D3bGW26OisrbJ6BrXg5SN88KZnurmvDHsuP3
 MvwP+6leXhNTitXtnj5TQxtJin6NVZ0Al8MJyd9xwa21k8YTlRMm7rgA4Vx9CNvjDV9gf5XOdBF
 o3JYv1QhJr/SgcdkDr5Ox/diUgdt5Z+bjO2zMLW0i90TN8XxW/blNaWT5xnj070aBbwHIva6E+l
 v1y1VlHp/I4MrpZmV4MtqxBFHCOAQZEOd+itR+n/S8LP50+qens7NAVqfZhfaQQ7KSmLbRKJpm5
 kiG1CDXKTkVqJunSULnVtRahqu1J6ZcmwDJeXTo5PtKQZiFIlUHRjOs60Av24wdhwd+FY4ptQOp
 pU+EYeQcKSLcEMkga3AqSlN+IrU5XJAo9Y4FLczzGc6/9kTe7Y/MLq04J3fmVsp5KDuJR98aytJ
 6m/1/sJrIyiE38hKgq9Ta2I/s9/NjynRehGmP87FTcRsCV1bnl97G4/o6CZtPg/knk7WmCFCogS
 WBIkWDQrNxAYw16mjSeY+350vXO3jYh+7OIbRVqdjqYiZKSAy9A2h4HULcXVra+fEX2z6ALsNmI
 gsWEWEJpEXYy62lnL9J9OTf1+ihsnQZFt0jOnnge9cZzyJTQW7bhCj2GDkVkcgK5wezSQQbuork
 C6IVZWbEkEfQnFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_002614_839066_8E3BCA08 
X-CRM114-Status: GOOD (  11.82  )
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

Increase the build coverage by enabling the sx150x modules with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 464cc9aca157..94eb41bb9cf2 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -541,7 +541,7 @@ config PINCTRL_STMFX
 
 config PINCTRL_SX150X
 	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
-	depends on I2C=y
+	depends on I2C=y || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF

-- 
2.45.2


