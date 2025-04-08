Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1133CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsLjcRrGKuzDX9mvNJ2l1Pj3maW/MPJjpEEItwHgjBM=; b=uBTkJ8Fdw+07WPT7p5vQbR+Knh
	XNN6PVJQKEboKWOwCUN1Z5p70NILhIULup5fU/64GB+w33KXngzgOm8HBJ1LtOYiQhBw05CFT3wTi
	W9awG0cPdG0L0UFMTvkNnILhtAjaypTqTc+YKLgMISD6CQeVIUQALe+wbiIhVjiO8Hl5oDuEea/2r
	/IAP4duZxkd76U1RQPmYbyaMUtpx4JrgZlbcSGt2cAuL9tdRF3aCxZbXowIRYQgLOHT87c2bx8kIr
	+I9L98nytPKe6B47GPp6W9T6twIlOBcj8sytO33KbI+IclH0peNcEMdEVRht2LxivTtEJLcLtv6S9
	ApR0+a/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23RO-000000034i9-0dFj;
	Tue, 08 Apr 2025 07:32:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Dj-000000031kV-1ijY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:18:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c14016868so4586611f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 00:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096686; x=1744701486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsLjcRrGKuzDX9mvNJ2l1Pj3maW/MPJjpEEItwHgjBM=;
        b=dWBO1n+wU7VZglteaBDB7xffD1nLM3rsQdruTrGN0iRkuiV9oc/TUSCBygc5FSVyV+
         p3jLuD4f+JM0L7nrvuWltFYv9cepzzDlnkOLl/fMrENnaRwQZ+LorqaGFGT0V6D3HsjD
         1HJmNxsNMd7fY+qo5QVpfOUudyRT/qWLHviUcnrU5FU0lJ0ocfw/6QBs0/DlvCjesszm
         yPe8i5j5cvbOf6x6EVNNKUKDHujwE0gyZftSJhb/bFzWUDJ8u9gmzz4MM5xiaCpQT77V
         xC14orCqb8nlNSOE6ZSX7d3LsJuoGmVmG6tZhs9cGsr5leot995BbU2+Gkv/sZXE2NeL
         5EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096686; x=1744701486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsLjcRrGKuzDX9mvNJ2l1Pj3maW/MPJjpEEItwHgjBM=;
        b=aSnmYGqUHXN7ZrjQIGKmYotDKGalCsr4gu9G6ampltdTAhRduNOKUQ5j3a87qH/89b
         fcW73I6ohvc2jjja/iNCWWK3//RsHjtQdTG+vO2CP89rA5uaXtYOVWsS4RDjMPCOWT66
         EfIpzngBLg4ViEzGrbEz9K+Qx49YGfXP7HVTvMK8CUsULplFu4WjFI088VXwX/YlsOSj
         NYROcwANZ6hL+OAHdjCgjiCtgHag5Qg+l7IJG1pez6Sj3C4MdkX55Umf7O51MKTarhyz
         DJfYI2SKwfusIObCZ5QjolHmfxRMLIb1j8+1ZA+1pb2F+Pqs5RnxS1JRmAyXzXuaTH+b
         Aa+A==
X-Gm-Message-State: AOJu0YwKG7ZI1eWSfFsLMuIgiTVY7YJYq/KUGxsKBcjkdP4JOSPTRWh7
	2dohyLP8vKpbPFavz10Hd0VuIuLaSRfanLmQxgKuco6CvGNV1cFBeeKubFDq8zo=
X-Gm-Gg: ASbGncsyLFXxynF33537onX0iyY0a1E2rB38TMxnBrzguIeFN+PmIw5rkGrP09G+H8A
	M6s+iZmLSIUuHqZY34ERvPjJRxg4UYpXLDWQd6jI86WGmOkq3haDWTDJuJv3or0xm2tDywBVE+d
	rVlcCAukb/LqXALiLPGdZQ4epCL49fvvGUqu4D5WgIHequuieqaAGE9xdcFli4NG5fFepAnWvB4
	D26O+sDHpDxMErYyyZc8hsQn46lgq5HHXyfBbLJ3D7L/J1stM1HrptPeSB7lbHJieMuJfO+LJ7h
	3SEYUGEe14FB/2Gyrw5c8CWWE+Xt0fdcAsPSNg==
X-Google-Smtp-Source: AGHT+IFVLY1WNvAayiNBB006bFO4nSra7Yx4DcKw1yaLoj6yk4wJfEbc8yNlS2Lbk6qsNo9ohgkRog==
X-Received: by 2002:a05:6000:40cc:b0:39c:142a:ed6c with SMTP id ffacd0b85a97d-39d0de66a15mr12602862f8f.40.1744096686025;
        Tue, 08 Apr 2025 00:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:18:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:47 +0200
Subject: [PATCH 10/10] pinctrl: cy8c95x0: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-10-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nFz0ZQu1wB25C83nAY0bNQ02w+UniTfC+j0g7wZb9Vw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2b7PYpEd1QYwzkZOLJp94uziWDLFCT9+cRZ
 6jtV1w9v+CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmwAKCRARpy6gFHHX
 cphiEAC83D/t8tFMiLHRxWuKzVZS6TAwB9yfLq3bsdR9gOgBqJaavIsx28w0liHuZZIj8w3UHJ3
 te5PhEz/S5S7Osm2h1k+wsZovOT4+g7Tn/BqJ04NbpBDccfDwNlRHz9dp5oTqhX/I9BxlNdAM6j
 nw2qiHcJBTD+wKKdTworBCco10+UdxKyIVJZ1xIEUUha9S7j83VF0X/lo/D6JFLOPf7hVAxpMUg
 UAs4h9Zmbh+zfoE3OX3QPGFNlwtL/UHFHuKx8uHYrmKv0tOmFEJL2FpJ1Dpt21Ue0har4mN7d+z
 XYTh2aZ5lZBpTRONkVjKs17D58wvSoBeJSXBp60u0KOD5isuDZxUWicE89i2IY9+jkffOPFNBBj
 hwVA2QcAYCAUMMtWb4BzW4sg02wn+SwW/2TRCl5aUXcF7n+rRnYBTlfmliRX2kHJ3PA3532UUS4
 0qF0kn7hDbX9yY7oX/aD3N97/Eyh9HrOfWH13ZdvF5Hh+MT56nrovr0kjLQFazEgd8IYV8CEPDg
 ZoCCrIrePRmAOUTYwyZAb/qrH/mEh2qLVE5EAVKijNbE+LV0QR4DWDglwYmR6LbjrmcfnyoOS3U
 1/73A3TxYyCRipzULEk7VLJXFMw5u8ROVTWk+4s4XCehemi1NJRDj9ORfPUJMTW0b8refz8JnQW
 hv7fa/dGOTU4VTg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001807_487252_F07B4163 
X-CRM114-Status: GOOD (  11.49  )
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
 drivers/pinctrl/pinctrl-cy8c95x0.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 3cfbcaee9e65..8a2fd632bdd4 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -742,14 +742,15 @@ static int cy8c95x0_gpio_get_value(struct gpio_chip *gc, unsigned int off)
 	return reg_val ? 1 : 0;
 }
 
-static void cy8c95x0_gpio_set_value(struct gpio_chip *gc, unsigned int off,
-				    int val)
+static int cy8c95x0_gpio_set_value(struct gpio_chip *gc, unsigned int off,
+				   int val)
 {
 	struct cy8c95x0_pinctrl *chip = gpiochip_get_data(gc);
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
 
-	cy8c95x0_regmap_write_bits(chip, CY8C95X0_OUTPUT, port, bit, val ? bit : 0);
+	return cy8c95x0_regmap_write_bits(chip, CY8C95X0_OUTPUT, port, bit,
+					  val ? bit : 0);
 }
 
 static int cy8c95x0_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
@@ -908,12 +909,12 @@ static int cy8c95x0_gpio_get_multiple(struct gpio_chip *gc,
 	return cy8c95x0_read_regs_mask(chip, CY8C95X0_INPUT, bits, mask);
 }
 
-static void cy8c95x0_gpio_set_multiple(struct gpio_chip *gc,
-				       unsigned long *mask, unsigned long *bits)
+static int cy8c95x0_gpio_set_multiple(struct gpio_chip *gc,
+				      unsigned long *mask, unsigned long *bits)
 {
 	struct cy8c95x0_pinctrl *chip = gpiochip_get_data(gc);
 
-	cy8c95x0_write_regs_mask(chip, CY8C95X0_OUTPUT, bits, mask);
+	return cy8c95x0_write_regs_mask(chip, CY8C95X0_OUTPUT, bits, mask);
 }
 
 static int cy8c95x0_add_pin_ranges(struct gpio_chip *gc)
@@ -938,10 +939,10 @@ static int cy8c95x0_setup_gpiochip(struct cy8c95x0_pinctrl *chip)
 	gc->direction_input  = cy8c95x0_gpio_direction_input;
 	gc->direction_output = cy8c95x0_gpio_direction_output;
 	gc->get = cy8c95x0_gpio_get_value;
-	gc->set = cy8c95x0_gpio_set_value;
+	gc->set_rv = cy8c95x0_gpio_set_value;
 	gc->get_direction = cy8c95x0_gpio_get_direction;
 	gc->get_multiple = cy8c95x0_gpio_get_multiple;
-	gc->set_multiple = cy8c95x0_gpio_set_multiple;
+	gc->set_multiple_rv = cy8c95x0_gpio_set_multiple;
 	gc->set_config = gpiochip_generic_config;
 	gc->can_sleep = true;
 	gc->add_pin_ranges = cy8c95x0_add_pin_ranges;

-- 
2.45.2


