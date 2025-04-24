Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7FAC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3C7VrvxYzsauY2O9fqA6TSLZH9busDLcB5oYAodWvc=; b=kdoyJz4tONZsfBwvnMSSrCX4Kb
	FPI33JiWgDOUdU1nPlqb1blCn42gAkcrkobGyhjtOULAnHn3WKojY3IKPh3xHlDP2lTuRkJVIOLrJ
	vGvJOjW5hwMZBhp5Yp1ZHRl/zcuDE/x2ATAedQPlFTvblCpm/cXpb15skr8cRm9VxDa7jlUa3M8MO
	uUH5XCM9guUjBsOivd8N2/M3ZqWbqTXqJFZKShL+NoxC6amX0crih8KoMrCOoIEyRLmrtbmFyBkHG
	rHboQpv9jfzTjRnTHfAf3odWBHIUdLWbTvwLdvkR6hQEOWHx1V7wr8novfJgxgRtMX8RCgeZFjp9K
	tGtIH2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sSk-0000000DRFb-09Ab;
	Thu, 24 Apr 2025 09:01:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3s-0000000DLCb-2vaN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:36:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso442506f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483759; x=1746088559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3C7VrvxYzsauY2O9fqA6TSLZH9busDLcB5oYAodWvc=;
        b=vU+1Mu9z3x8yM+1QnbteRzwee3/9ZOGbOl0V9d7TuGtpzewGWxVp6oo9tHWQHq2b6j
         PfYGSniLgMFYL8ExGLuFB+JiYiy46R0HbvbQ7c7JwkMVDA+HE9HWqS/SWFTOc+eTQoee
         kCoSkCpv+tdHBZK0VeKCuHV7P356Vxaio5LCezr5tRn1BeeNrwKqCb6wfxC58DqP0/Xj
         w9C4y5b1mixSn+0HtxmjAx8hzSyv+3PfX7G9mDz4UGfcF7ryBAnrewOBd/rJHjuOvsj5
         JizAdbE9ut38x9+RPb3msUut6li3Dqlq3pvIWHugnTg0ERLVdv6F5NXdPyNIl5QstRd8
         XpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483759; x=1746088559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3C7VrvxYzsauY2O9fqA6TSLZH9busDLcB5oYAodWvc=;
        b=MwerPCo6bSKOKVvipXE+2wXVKMe8SuurlHw1i4wppKntuI32g1FGfEoWQoC/RxBBxF
         O9eraOjPvO/tCPoYf3wXXZjcd5sHL6PMvfLoFGaTlmBBeHM9QlU2iJMjtgIukWJtZ/ZO
         EIT4LDeZp7a/jwT5KS8I3DLti1A8siSYN2BRhOjulwux2LI4OwcGo4NpH1Da0VrHG6Dr
         7WfmzsvNGmKSELahiKIub+ZFaj/oGRIWNmpchL/K1cCQuHfxlWMMwkaYAl0hX/DRMMWw
         bBqzQ7+sr6tJadUIXSfB1SD3g9rdaRNZt2p21MBLhsA2NdDjn+EOhMSZ0Nt1MOyomT/j
         VIJw==
X-Forwarded-Encrypted: i=1; AJvYcCUoivOuWxc5dyM3RPf0wLfdNpBszCJO+873X6Yfad/0K4EAnkf1fzYNW8ZcUSk4JWpaqaATBsUDmBemnV1Dq3D/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4ZJKNu29cVr/WNI6XLrQRAyKc843ub/lfpPBh8n8ZimqX85kI
	kEQqnUCSeMP63ODHSb5WjBWxyKRfNWdlUANUjFE7MD2X1XouCiFLTIU8Ewkecmk=
X-Gm-Gg: ASbGncsprEPvOhEvo/jyOOJtSpCEUKH9991B9k7TMI6XhzKJADfGYsTsFIvmxHnkibR
	Qm1Qz03ry1gNhtT6r3Ay6Ocl0n+J9qzBVvG9X1W5lCDuEtw0O4ahPusc6wpIHruZl7rsei+/BHi
	YEmhV3/u7ezhaqSLvy87I0lFU6XtobbbKL6e+OWCw+5wve69p9GGTpLTdSM7YwUdsLRv+5aI+e0
	VhGu1cnvJxysNqvBV37EYSdD69sM4QMB6Ih3wIOAfwLTu1zIcxSFSQaHK/f02rXIdT09mq2Pf4A
	iC9gEHrgoDFDJ7cQ5yGFm750O5KHYXiplw==
X-Google-Smtp-Source: AGHT+IEnnIBOjrZ99O5uQPy0Nc6YKo1kNCkEEx0ebNFaJGjHPfyJDtyy3I1rgWZXM1I3Le9gFxfXaA==
X-Received: by 2002:a5d:59ae:0:b0:39b:ede7:8906 with SMTP id ffacd0b85a97d-3a06cf54e7bmr1122286f8f.19.1745483758888;
        Thu, 24 Apr 2025 01:35:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:34 +0200
Subject: [PATCH 11/12] pinctrl: pistachio: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-11-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/7hnqabmKbj9zc0e1PTeiq5UZq78y4tKE7Nf1Bs7XAU=;
 b=owEBbAKT/ZANAwAKARGnLqAUcddyAcsmYgBoCffdEPoUC5vhPYaWj6u0rywJUatNB6kvhR99k
 aCkmHZ28xGJAjIEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33QAKCRARpy6gFHHX
 csr2D/iydanG4wHydJL1ZFZQ+tndFEOwZ6yd6A+ss+6d7RDHHcSVTn0kZW2keFJAbpl36Zn65RZ
 hnsLpH6KbrmYpJRjL/LHcH/7NbHdwMYuVrZ5UoSGGFXD8Z774KxtDYhszhTtIPa50J+L9zJR8x5
 ar4cVfcl/WBSjqaJMBSkhChbwVJX7m/QYAnSa2Fgq3UzHXvWQrmH8YUrcnShqCqKxohVhrCyJaY
 8i+qQ3jFFfITwn5dO+lIDMRRSLpoSUvhLA1PnI8JDwRTqurh6h4B9n3YuVxjHSL2kH7HEqVxX4E
 v22xIaAACCrutV1aCSxkP4YZeKsycSdiLdlqsh/tzA+2Ksbf/jILWTgafuZlhOtG48dr0Q/tyG9
 eJ4q20yXNigAl5+nHVnCDoqiZddjxg5Ab6nev7k2iN10EbC2iw05dPmmkIqGfGD8KL+ynn92Rnk
 rz0YmhHxmeEDJnGSnV/FYYSSx+5e9VoVdHw3wmJD0kHAiKeDp2nJaCcbipsdEqgN1C5Bdf4B4JT
 t0XXOiT46X02l1L3OVAp5FKWB+rZDJPmYZeT2P17R13iyZoavCXR4INacZ+6v8l7ijAg4YoX4Rv
 47sjTr6naGAOt0WWJUf5tdguvd8w8oeFAM4/VScXq3yIge14kHXoBfwJfJl9r6/XPuZIeR2g++w
 SBm4jRS72OnZx
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_013600_756302_6372E4D2 
X-CRM114-Status: GOOD (  11.72  )
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
 drivers/pinctrl/pinctrl-pistachio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 8c50e0091b32..e7bf60960961 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1186,12 +1186,14 @@ static int pistachio_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(gpio_readl(bank, reg) & BIT(offset));
 }
 
-static void pistachio_gpio_set(struct gpio_chip *chip, unsigned offset,
-			       int value)
+static int pistachio_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int value)
 {
 	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
 
 	gpio_mask_writel(bank, GPIO_OUTPUT, offset, !!value);
+
+	return 0;
 }
 
 static int pistachio_gpio_direction_input(struct gpio_chip *chip,
@@ -1326,7 +1328,7 @@ static void pistachio_gpio_irq_handler(struct irq_desc *desc)
 			.direction_input = pistachio_gpio_direction_input, \
 			.direction_output = pistachio_gpio_direction_output, \
 			.get = pistachio_gpio_get,			\
-			.set = pistachio_gpio_set,			\
+			.set_rv = pistachio_gpio_set,			\
 			.base = _pin_base,				\
 			.ngpio = _npins,				\
 		},							\

-- 
2.45.2


