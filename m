Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74FFC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTRtn3gXVVNnhZ5kHemU1jqDeTpH6rPs+6+7Y5/K7TE=; b=X643fnpVt623me7Kq6JbRZNVxu
	dkTVTEK7gaSwWaTaFKC1zVbns6q73iJWytrpEpIzQu7oTky1EPlANz/hv6rM/XpiKOIs5ZcckToAa
	eptlHv5TSxlPbFdEr/UxDb2AVTcvvbcyIQ1WSf9p2EUwphCsPjR9iAWZmsOCxqKFMGtSsz51O70Op
	q7jJy4FJQxs2NA6sQudpwL+8KKklgL5cekfkNBKJ/iIo/wkMB7r/U8i/0lVcD0/XjgL7923u0tLDG
	oEzI0wfkqrCScFli0XmZ+wZFHrNpzgb6jWVDy6bRwZZURTK4P0KvPcMAmMxjKPxqKSxkLlTMNPAqL
	YM1Veh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sMq-0000000DQJa-3QGt;
	Thu, 24 Apr 2025 08:55:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3o-0000000DLBT-2qcH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wTRtn3gXVVNnhZ5kHemU1jqDeTpH6rPs+6+7Y5/K7TE=; b=KRN7pLIr24dwMYLLEFVzMr/PMG
	QCbiYA6MlnHjJgNFe5riWNHDpJW5Goj+ZvEasqoAHhCM4HeaEbYhaFJsI3QdiKGNHtrwCkV2KqGIU
	as6uK/HK13X0RvdM1qgJGRsID6wfcKBb2gG5dGiJZ7vB3F57pzIsoQMxSZm75mvvUreHVmR6OpHfW
	KnNX09wLpWf8MEQzdUJE4XDH6bO2WNEzvnH1F18MxRBVZ/81BCJFq4QlV3ostZR2H9w3HZQ1z1d7u
	MbLVuB+Ko+TgK42H4OXN1UpQN45yGfHRbIkmXG4qyIMOVTs5wyOoMDdbYpCrt71SFcLJhehhIZK9Y
	E7ZQkaOg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3l-0000000Bcke-42X9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so602646f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483753; x=1746088553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTRtn3gXVVNnhZ5kHemU1jqDeTpH6rPs+6+7Y5/K7TE=;
        b=ErKZCFPAjQ5hFQCLmLRipSHbw8A6weXJZWrVzOmXHFTc2Qej5tkV7K/pie2UloDh+m
         cPKlyA3TAR0e2LQ9JVcbo59Rcf84mw3pfy8HL9bgbUvnXECR7W11DU5h6nVsbA8mhGqf
         aGUO6psFq0fQwOTQIv6MHPCwCUy0auZdo5lAThesK+hbqKtszl4JcooN6ZxsEl35Pc9J
         XjB9ce8qglxtvM6VIwXPRjRfnrLjacSQvrg9cr3Fbf5lVhXUvnOdcNNKaUcqPC3J1Pr5
         xj22OJn3yTjpImO1RpI94/1WwMSkd3PN+lQpTcAK3daXHCdQNC5lTFTvqnzUMbfNOHvj
         Rr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483753; x=1746088553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTRtn3gXVVNnhZ5kHemU1jqDeTpH6rPs+6+7Y5/K7TE=;
        b=NSOZFjSDGRy6RXyhqFt6M1j6cQhPmqILnlrAZbNSEcW+H7liav+WjO2IsUwCooaQ49
         2hLGLkzxJy9P/7zSFmEJTntNH/Bnpta9yK4shq6scAcGGyJWD5x55uD1s2gfexRK4S7r
         eQdMJnQQhZX73yBfi3SeUrRdRz0auSITuENvELsWbq16o6Ax/BaYGjIBvjdGoUG+CEFV
         0CVJ+xmem9TIieSVC5eK4uvviORvbNrzF7xFN0xQC9WJCZ+LJC8DLN4liOVmidkyl0Sm
         hrnQZ5MXDJ/7B6xT1ComR08G7d/kcUZq/ibgRQXnWWfI8NRMNZv37RsNkBlvb0DTkF34
         4ydQ==
X-Forwarded-Encrypted: i=1; AJvYcCW41WKldomnninpdK2qWXLfPht60qxa5ricipE1fVhnWyRH4gh9Nxb4YBwviJ1BA9y8bDZBpN+MclYBAL2lfxtA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1AHfP/8om1kti0RjqJ4gJFHEqTk/QyVVLk9YZD4nYPPm9uazI
	Xk2jpi3hrSn8FiVQTlVN1z+NWJnIZIUyoVjTfHzk2Z5ndmj9yZmfER65kX3GADE=
X-Gm-Gg: ASbGncu2kg6NgUJVu3ytvSUxaxgNcWIEIFAcoxTf+gSi3y6+C2hD+z4NTZaP7FQx+4q
	73m2rzUhYUe+NIorghAlc0i8KqphEgnTCnJAyNXJ52wynvkZbEF6sreh7GFinCbGn3vnRIQgPja
	qeg3JtdcqiPdL5s4jfcafSfF3x2l5x6t1fUuj4cMQ+oFK19aru3ZepEH6e/KYEPbBAHFdZdLbWR
	OtYZGYK6GDLXzNXEOphEpL2XaygRQhAH3vsQrQWfqOvM7NXrVBp/foQ7UhIIl9gDgHGvttJgkdS
	FyWtkJZ37Hxy7rXtd0sCQIVQrdtO4aGZSA==
X-Google-Smtp-Source: AGHT+IG3o1AaNixTqoPOuTrDe4rgeHySd5Wl85X8/9jI990OIrHcrjGyGtt6SlYJ5x6wKjhdeetSOw==
X-Received: by 2002:a5d:6da2:0:b0:39e:cbde:8889 with SMTP id ffacd0b85a97d-3a06cf4b8b1mr1481072f8f.6.1745483752816;
        Thu, 24 Apr 2025 01:35:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:30 +0200
Subject: [PATCH 07/12] pinctrl: microchip-sgpio: use new GPIO line value
 setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-7-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hcMZFoYnI5hp40Tp/W2N8GmsL+thERqAp1Vv3XxYVkU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcYmgESeviEGOC5kHsGWpr6OnT8URHaFb3d
 S3spkaFecqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 clPXD/9J5MN41zDFuquWy4Q6I9uR28p6IAtPRR7LXz/y6HhRCZs0LiWF/a9Sp531rqlTtvTqIVW
 /jA+xhxcVsKGb1W9fkqBRjICm2Ro/34KgxGJHlAGa5wi4Vq91hNc35+VMd6FGA4b0ebusHqdncD
 hYR8+ONdpy7mHPSADm8ug9QuRpbU9ky8cTjhHh8jeqte3aiuHmSqbSmIhpOBSYhR4dfGErwJNLO
 jEiuhnPpjfz3zljaEzY1fOlKYEFP8/pAPybaVYYoKJr3wgwTbBA15A7YuZfbP8rFhh2/KZWMQQ+
 uXhHsAZ1AQC5oK6kC8WXp32lW4yifh/SOlhzrWpfYxWuYChMUvtajzoVHFm1z1BrEJSdzbk8vRN
 p9cyMn5hIFnEjKLIeO7uPhGHDoO6TF17grr7KtAZmGXyBIn8YjGxOneARfBuAAeQLSJZd0UZwLJ
 cZCsOL20W4CWvm9QEpN/1pqEeDhmKbfeLcLzp6L+7rXYY7svai881XdGofNDKcPcNeb1V/duhU2
 80cdHROxrw73r++hg/wNu/mmN2vphTUl8itNAfqGeeX2O2xYuR4sOjiSQdDl630ZSkaX+yNSj45
 jbMZ31t07JG4dRdHKbDYchFFKBRNmcdFGW3pLEvQbRONExRLMzgRerFYuekH06n73jTmA7sOosx
 cr77n7M0nryK/Gw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093554_205593_40703A57 
X-CRM114-Status: GOOD (  11.05  )
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
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index a60db93b61b1..88c2f14cfc6b 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -555,10 +555,10 @@ static int microchip_sgpio_get_direction(struct gpio_chip *gc, unsigned int gpio
 	return bank->is_input ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
-static void microchip_sgpio_set_value(struct gpio_chip *gc,
-				unsigned int gpio, int value)
+static int microchip_sgpio_set_value(struct gpio_chip *gc, unsigned int gpio,
+				     int value)
 {
-	microchip_sgpio_direction_output(gc, gpio, value);
+	return microchip_sgpio_direction_output(gc, gpio, value);
 }
 
 static int microchip_sgpio_get_value(struct gpio_chip *gc, unsigned int gpio)
@@ -858,7 +858,7 @@ static int microchip_sgpio_register_bank(struct device *dev,
 	gc->direction_input	= microchip_sgpio_direction_input;
 	gc->direction_output	= microchip_sgpio_direction_output;
 	gc->get			= microchip_sgpio_get_value;
-	gc->set			= microchip_sgpio_set_value;
+	gc->set_rv		= microchip_sgpio_set_value;
 	gc->request		= gpiochip_generic_request;
 	gc->free		= gpiochip_generic_free;
 	gc->of_xlate		= microchip_sgpio_of_xlate;

-- 
2.45.2


