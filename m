Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B78C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wKLuHIxdGKJ5U7MzOvw6oNf3BEX+m2YB8ZP6WN4zI5s=; b=ATIeqpe1a1NDBM
	BK24iV/kf4/Ui+r8PO9hbluKHSsgASnhYdEEVR2dhlc4KOyEqpARbM8L/Wcigc7XpgZhTxflG0ioE
	WfNZWshqu4JSdhA/csTBGnWnq8leQqqPfX2Rpllrmogp6f48TDLqatCUWbQGf7Vny3d6x5Ukoq6Q3
	qdic/c9kBiiWKO4xMklvoWsYev+o0kleU+UIidTbICEwaeYn2Iaetip7FuwjZNsyZAXGz9nVABQtD
	Cam0OcSihM1EHQ0AkVl1jQIvMZiPPDN2+bXMaMGi1iS1zIL3jKJH3BpdCUUNuz5EDUbmqPcE1oMzV
	x6jP73U26ZZ5Gg5kEVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vMP-0000000Dxon-0wBv;
	Thu, 24 Apr 2025 12:07:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3h-0000000DL8V-0Uqs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wKLuHIxdGKJ5U7MzOvw6oNf3BEX+m2YB8ZP6WN4zI5s=; b=EZ/gSUfyy0EgP6RHv8fQNYjVKV
	jW1OffF6D+y8awwVJYgK2Pv4eqruW9IXXib231aBu9jH8aE18oUlqmE6Uf7/WtoB2sbBjvSGxs+rj
	zLet/fQ5cLOSUL4HXY0TZ237/9KO7hLp9F9HdB7DdCF8DggkUgi3yRKgjxoRkaHMut9xLzXUY0fyw
	NIs8YVZ9/t9devsHO1a6k5ww61x29mIm9VNxN2gj5jJmLbA3gYYLzmm8QB/BJK6tkwFf51Rt92wDY
	CBg+XREjWVTWUsnIBMFKFz58gj5GEPVYce/NdFrqOhkT4oU0u/QkALqOqu5ud5EofDZpPsInPacwu
	hSyFqjSg==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3e-0000000Bcgg-2K6z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so500322f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483743; x=1746088543; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKLuHIxdGKJ5U7MzOvw6oNf3BEX+m2YB8ZP6WN4zI5s=;
        b=Lv2sG2ekLHfvOY/hgfZqRtqxqkWevi6dCRa75Ag0d6PzNTAnQyjwRmdKq8uY1hDBLH
         j4Aug658rTB8p8kJRT4g9wtbHlib+hlcJKIeE2yt4Sey03rFIOAhumdwtG05TTquU9rA
         is4UVnjrKvZ0MJjBI3y3aYAvlox5eXTbi0x/jxxLR5PRgTw71MGzLcynXAJx/gxGhLKi
         GoNDUMH1D0nRi+FReGDXcjy5Lg0qhxC9RYYq++wvqbDQsc2br3E4iS6+loLmMaeqp1PJ
         WmUgzn8Ipo+C9UTz04hAGDrRNwjK00UfaM8DBwpj155S//pItXD6HpJ5O0hR4Rxjst+f
         MYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483743; x=1746088543;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKLuHIxdGKJ5U7MzOvw6oNf3BEX+m2YB8ZP6WN4zI5s=;
        b=wPEX27LrZrDga9ZolSSZcNS14JwudOCXD0dW9mz1uoyIAlgyMYpOKQTIo9LwK7Yh3U
         S13iTqSh74TeU0ibSWUeTRWod7VH+JzW6DqPcZ9uPkv2/a1w8BlOfq4eP2F2QJ3/7zTD
         ccae2RUgC3CWs/3SnoVBTZTwI99F7IpAUZWZaU1UUk7sePxgYA9yf4hj8wTCCJazSTIT
         cC0dj3TG8hpLnBdj+tNCa+d7/oztg1BRc1iHFg6j78NMICIeK9g/ytKfMQniiHedRDLj
         NJWpbb7/vJiE6iZESQ9EYAmTpZVnS6z/VvVWpSLQFsjEEg9Rly9BXDnTLiSrTGrw32w/
         fAVw==
X-Forwarded-Encrypted: i=1; AJvYcCUC4eskBuqznU0Nv7dBfL/to9zK1UQp8NcPWWpRXdrmLgEkiEUDtHgFNOKvRVKpG3CrEgDPKnNmD0q6mkzxyaQa@lists.infradead.org
X-Gm-Message-State: AOJu0YxrHFrqD+3b+WPNOk6nobhuVocjaoJpchTNAUc4cmeyllJZtn6J
	+qg3QMmnm1ut6kW/Hg5st8JPG3OkRRtA7XhhXyGS1qiAVaARg2NvKL5K1gJeupA=
X-Gm-Gg: ASbGncuyBoGr8lf62Lhq/sV3DrfVoHSbceBwwwmmqfZrg7n6vY7xJ/GU0+nN9XzF2zJ
	yl4u/U+jWsUvqxpLHkE6IDNDIPwB5wUaKnePDut32GaevEbS+YE0bRU5MfCk2fX4XWGfGC2S5DB
	feQsrzNV00Rw4k9kd5hskv/UC0k6HEG+OH95t87siDiePgyCcmdGy8e6MkMwEi1wiLkgocHEC2t
	svm9JP0e0vuFmdI64ErSVyrhapKLTm+JBomc8Y00LvP2Y1N4jiFSwQ3AbLbGLhGVrPmLk1PzDX6
	hMcfFF9A83P1/BwAoHuYuEJWDJt4/2mdHQ==
X-Google-Smtp-Source: AGHT+IH7mMmANEtv9UjLqYnQtwGVN5We8jsLjt4b4Ofw6oPqgB40wgvTP4hyUbeyjYfi5JsWfn4HGA==
X-Received: by 2002:a5d:64c3:0:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-3a06cf5edf1mr1489824f8f.20.1745483743092;
        Thu, 24 Apr 2025 01:35:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] pinctrl: convert GPIO chips to using new value
 setters - part 2 for v6.16
Date: Thu, 24 Apr 2025 10:35:23 +0200
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMv3CWgC/x3MQQqEMAwAwK9IzhuoscquX1k8SI0akBrSIoL4d
 4vHucwFiU04QV9dYHxIkj0W1J8KwjrGhVGmYiBHrfPkcVHZwyqKiTPagSoxZNtQR8uEvpm9o27
 6cfOFcqjxLOf7/4f7fgAp06BjbwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GKznQfl3JNkYy5vmo0PNTYM2muY2yQRrhtqXia3AHFA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffXZVbgeHHyBonTI7l0CNbMV3a7nzVuh7Pgd
 tRSd65EsuaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn31wAKCRARpy6gFHHX
 cu6wD/9k01NyVMtAZM1iym82+J1zg/2M7KpPgcj90NcGJu3sdiYORuIKIxHeLA8p/qoO6rtazUg
 OnsrjaAd28Quy2LLhN+yav3xDnqFRhDQxQ32dKFL/wwq3GsGKL5t5fIAQdV4556J8gSyw20nEYv
 rj14oOGWwqIIUPYO9S4Rs5+pypiakwr6CDUOiDThtCkbISTv0lgDWcm8m1U99gSMRWGHWEo4fgM
 vx9wT3GEDlbOFe7qgLKbXoDqFHjfOkIZyBS/OkBBh8QFHv7nOjp7t2ngi7h7rmKLQvZofpZjObD
 DvLv/QC6NRLVyF6OLf7EQvJo6bL5m9ME9v7ULvfBSitrz7jhodX1CHKmC6KxUVgwDrN1iK+bu4N
 H2rguQU6Rgrcyc9u9L4VyQkxCBsd9y/LzoaheFQrNqSIV70KJy3YcsEXfbakAo/ejHH5vKHD6o1
 0av7LySBUK0F6wWazNJeq2gWANIZYv5aGnpRyGtEl709spGfrRTp8nhybNbuuRVgWNIdYgYFb8N
 i4g4cUqjN5yT4nIj88n7QM0tduE0Dn6nEjV+AewLUYbPmNvZ7d7xeKWwwtgL03HsiKsVYDelAsS
 gXHsxJ2GDeefk3dCEwJLnFib9SSsKKlpLzV4hI97af4of0i49uE3e4GW8ofqXlW/gKNVfcDwuVy
 4WrMOOmwjydrMXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093546_661703_49F3E303 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
the another round of pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      pinctrl: amd: use new GPIO line value setter callbacks
      pinctrl: axp209: use new GPIO line value setter callbacks
      pinctrl: stmfx: use new GPIO line value setter callbacks
      pinctrl: owl: use new GPIO line value setter callbacks
      pinctrl: stm32: use new GPIO line value setter callbacks
      pinctrl: ingenic: use new GPIO line value setter callbacks
      pinctrl: microchip-sgpio: use new GPIO line value setter callbacks
      pinctrl: at91: allow building the module with COMPILE_TEST=y
      pinctrl: at91: use new GPIO line value setter callbacks
      pinctrl: armada-37xx: use new GPIO line value setter callbacks
      pinctrl: pistachio: use new GPIO line value setter callbacks
      pinctrl: samsung: use new GPIO line value setter callbacks

 drivers/pinctrl/Kconfig                     |  3 +--
 drivers/pinctrl/actions/pinctrl-owl.c       |  8 +++++---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 13 +++++--------
 drivers/pinctrl/pinctrl-amd.c               |  7 +++++--
 drivers/pinctrl/pinctrl-at91.c              | 15 +++++++++------
 drivers/pinctrl/pinctrl-axp209.c            | 29 +++++++++++++----------------
 drivers/pinctrl/pinctrl-ingenic.c           |  8 +++++---
 drivers/pinctrl/pinctrl-microchip-sgpio.c   |  8 ++++----
 drivers/pinctrl/pinctrl-pistachio.c         |  8 +++++---
 drivers/pinctrl/pinctrl-stmfx.c             | 13 ++++++++-----
 drivers/pinctrl/samsung/pinctrl-samsung.c   | 13 +++++++++----
 drivers/pinctrl/stm32/pinctrl-stm32.c       |  7 +++++--
 12 files changed, 74 insertions(+), 58 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250424-gpiochip-set-rv-pinctrl-part2-43f4026d9e38

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


