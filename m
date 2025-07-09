Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68494C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 06:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyTMiwPaXIFDdT9wyK9LGoJhG1Tf0x1zce8tP5zIQCI=; b=YMingEX57NSZEIqTJRplECx2XF
	7GLCUhl2d1EyPbo65ArJHSvi/4ga/si7+wAj8YxjmLh8T/1au6jzKxOaUZQ4z+Wyi7+CHCdbEDbCM
	m7/VZs3pbX6BZ3ymtYTaE5cfbz+tYlpDc3qBhzu8ZkBB/E6oSNJQusP/ZwXVovylscMfdJGIyEiOT
	RFJQ29lhSO5qa0oMvtSIwvNvWCsTIitXQA4U0vQBHAPxlIoTUayX3268DfxQM2uJlGWh6qJfNBKz7
	jNlDy+luaNEvc04qcanfqJLKOw7xPppp+Jrv4IL9YyLfjQHUt+3Xx1k5F9hscsWlWLewUChdq6YX7
	ibPzZu2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOjF-00000007jt5-1zpF;
	Wed, 09 Jul 2025 06:56:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVW-00000007h4y-1gc8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3912319f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043336; x=1752648136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyTMiwPaXIFDdT9wyK9LGoJhG1Tf0x1zce8tP5zIQCI=;
        b=E6vMCWTenYi+ugFz7Mk5yBrF36JivIgD6g8DNPsJ2qFejKol7UCCdEYP3r2pTTjWkH
         8HTNgTeMNLLF6fH/fvg94+w860waMz2g6ssRweCaOnOQUByLYG0qYGLNqAKKnspPMPqu
         4zcIJn/rW/cnVUm2QWufOCQrck3/sluzv0zWfl2A4V2jbB6wJN2fU+sn/JNVMexR0VBo
         BijAzWwW1YRPkmgIPHtbFt66t+ar+39BukubJjAgvmTn0I2vzRkUXy39spgG2LjWgn98
         P5dS6IdvoRy2oC2XpOU5JOpphzyXSozA9uyEl3e6kid4bSiZjBEAsUcpsRbMx+PtORv9
         qORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043336; x=1752648136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyTMiwPaXIFDdT9wyK9LGoJhG1Tf0x1zce8tP5zIQCI=;
        b=qj+uRZStThz9BMJkSTWxwOafUb8C2CopugucaWhOwnmA05BlnfGGTTfYOUF88RM/Ks
         bWbcdgBklbbjP+uUlZgyuaWBM8Fn7cI+tjyeggxkEO0T+53Z59gdNRmRvehhZjS9KFqs
         NJGKLvdZCc9XXouv5qCQtwEecpAoJnQmik0/C1vV+5nBI+qNaFUmWC0BzNgtWCEwsz7E
         1yAtQkvoKTcPh7dFZMs1XpwSFKb9tXxayAJ/9TL7wVb61XUHHYmOaLYjZ8d6t+sZLmVE
         NQy0KZfi7frqgmn1LYyP687SRLd3P8/hmEZAGUsNMAxMdS5hY++SsLQ+KJub/c/GroXt
         MQZg==
X-Forwarded-Encrypted: i=1; AJvYcCVLwWdRfS+Miy9O9SmgJhe14vpS1qWuRL0qZgOW37Z+LpKApO3qsrurfl+ppbVrRMNgNpqzpIpk0sD4tq+Nqmtn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlj/s9V+stI0rhd+0Q0vRqMWwjntiRR1C/4FPuaeWCvtftSBKG
	v12INeyPxsXb2cr4sYd2sowaWU+xi0dLTebBnLxygfPxYdNyDN6ZFYjkWW/7gksC+/I=
X-Gm-Gg: ASbGncuonAcd2HWhgfMc+5Z0LX0KWl6UQe3HI/BKoCRcoEC0/1zjK/ISc3Z2DsoRjc7
	V+IHdEqlVL3x2bTw5Imd+Ql0RaNT1WC/nUCQHV2IrFN7sayLYCT3di8GiN066faZFm+xplJVHud
	q5X2rzODx+vPS9nkoc4Nl9cn9HBJyvT6HBJXntNXuyE6/Q4YX2E6k4ZWuX4YZYDCma9YV7OgRZO
	7gloBdeuF3eje6FgmW/Pbzim01fKgjNUNll3kNMNdpLu+11ADpf0bsOv9TXsXNp1IDe3Dovv0ap
	9iFLyomBjT+MtBGDMvp8VKKA7UH7OdefbupwF8ggld1jJbsyyxARbtC6
X-Google-Smtp-Source: AGHT+IGg7TNxjvLn1+O4R81Nlx59R/nNeBOpFRuu+g7ycDDNSE0Rc5+slCF1F8/fhz7WHbhW52wyuQ==
X-Received: by 2002:a05:6000:2305:b0:3a5:2fb2:35ac with SMTP id ffacd0b85a97d-3b5e4513735mr899716f8f.24.1752043336357;
        Tue, 08 Jul 2025 23:42:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:39 +0200
Subject: [PATCH 02/19] gpio: wcd934x: check the return value of
 regmap_update_bits()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-2-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L8ZxQSAM9ifx3ERmIubAxxHUaqeVMMBoWCsBpWCjAR8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9BkyVTRpVtFgtzuqceZbIliD+pMfIv+5Avz
 WnfpHrLxc2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQQAKCRARpy6gFHHX
 ci9XEACMfKjaNR8nzMjem5gOkjsgPOsIqsqKsOjLId25TkdZs5SuKfJpGfYzUMLAyvdz6EzeKhz
 +BVO0NSAttg1SlZWbK1NRBDLb0gmVtLckJHFgKvroRfmC20CvR9RgbjYpste6qxY4MjaUcOSMCB
 PgcLmXylfywY/UbH0C+1kuRLo9WdGpRjlN+tciP8wX/WGGMSH0q2G2T1A2k6UpjqMvpjuid46jS
 qeT/eI0rQQJDKIebX575uDlUzAHDQr14n9PZdacfFZnbO6ULsxA73IoFScDMub0rBVux/Ef8hNB
 4h0aCJBcsLlzR0S71DTRKowvDGTO2YT/FJnbHbnCP+wgN7AxaFu1vE51nPM0DS/bEUxlhMEh2/K
 1pTA2fbGPGTsWbLu1m19ldLFvpnbi8yKMuNN7bUK8fQGXrmUnoAdZ31JQE5AiGf5XvLxFHahD3i
 kz7oJaxbi2lK6jAddcQYhhUHgc64j4g3itiO5aTLD8wm0RC/LJJGewpiHCmhF4c5Pq9vJEhyWJk
 DyAtPi8a+mVfMS4jOaiivSyUcJxbfj3SaV325zRHnLB+PlT7rS/AOqfHjdehW8/i4qyykTODAno
 PwahK+QW+f6E8ujYx2aLajZ8B6FeRKDJfOBWL7AP5iAVRxwg+xzCHD6lgFtOHkAiCdkH+7FV4bZ
 lyMAXxdaAag8xjw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234218_460137_F2E69C90 
X-CRM114-Status: GOOD (  12.46  )
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

regmap_update_bits() can fail so check its return value in
wcd_gpio_direction_output() for consistency with the rest of the code
and propagate any errors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcd934x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 2bba27b13947f14459c32db4812f6451eddbbfe4..cfa7b0a50c8e339603bc5fc70a8d7354f3bc6486 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -46,9 +46,12 @@ static int wcd_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
 				     int val)
 {
 	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+	int ret;
 
-	regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
-			   WCD_PIN_MASK(pin), WCD_PIN_MASK(pin));
+	ret = regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
+				 WCD_PIN_MASK(pin), WCD_PIN_MASK(pin));
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
 				  WCD_PIN_MASK(pin),

-- 
2.48.1


