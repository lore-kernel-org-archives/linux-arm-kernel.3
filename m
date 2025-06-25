Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3EEC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=; b=n45J1xT1ZDLBW9
	lRwBUbNaUUVwvWpnT5sgr+Mw6EVib4KCicFWCHAVA0jaWYiDf7vQ17B5KpBe7MQHbKPzpluqjq3Hc
	pWZpBUfUXFclTsFVRzMzSawnWW2+4X19I/K06a5ncW7lyHGiks1czRI08eJoVEzwEt7eus0Yhas7F
	32xD6M1mkn0GE5kX07LUGBJlIMOq0AGhp7V3+X5o0gAnd+TL2aa++yeYt0Qg4FWk9/s8Uhqu8mQR6
	FXcORkJCQQogmVinguUKtnVmtyiI4aQkIbX49u/U2CNEbwq8VL+9AxvCaGB9NbblFs9QbQ/DTcYyB
	RNGBbutmzT4rev1IpraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPOv-00000008eBn-04nQ;
	Wed, 25 Jun 2025 12:38:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRj-00000008K3W-30Af
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-453749af004so8297915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847618; x=1751452418; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=;
        b=ZVJoqfP3yWcr5QefW/gv10EurRqmyiMIumG9hqkTjLwuEWM3PUp62CbNzg786LILMo
         /EEYSRhdHn31iOSx80b/OARvcfs7uLfVqrsMdnK8nCNN2VYTxi32QbkSqLs9lqZjJKKt
         McgV+wXwLGqVzci/15sdcO0yD0a0M5stALvhZXA7f7uhS2a3LGS/8fy8KCwGqyMPRlq9
         w6oZ8H81Sb5Xaqgv88+K/nxgAkmVsuEER58x0KuQmAUgI+00vX1VZJJSbIJpazSxilgR
         RScskJoVg98avyyKxXGReJOflr7vqPQcPjiU0Hoe/fhnejRPiofxU9Im47NlIchpu/7v
         wHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847618; x=1751452418;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=;
        b=vgcO2s3duIRcsS261Ijfo7MQ8KWcVSPuIqfWH16hKtFqspecBdbBkgHUSQWifwnMM8
         EXwr7B406FETm2Du+JEUcks01YvoPHbqUEwS7s2lfiBae8yqKAdU0Li1dU3OWbfS/aHJ
         iPzUQuY5pN9fqByobS3a7hKZpgxX+46AvjtNeiaSKRHx6PB0+iBmqenLyddG0OfKsfut
         w2RrsipnFHKGNcaZZ+lRV0yLTr+I4bNjPAzUtwrl2Fq6nzyVubHPMLuW0Zoag0RblYdL
         hF0jcJzfZtKreXJ6aQIKrQEUVuKSOGlgzAYoB2eykIOX4PM411O+rB9a6+tNsSsuvbYD
         huzg==
X-Gm-Message-State: AOJu0Yxgl7+5ESXpIrn8SBW+EzDGAt+XlbxoevL3EJtV/KPtTWbunnKm
	tzQ2iIZLR8qSCoanf/RX0HReuojUnkMvi60qA3WjhxCqEL9mV4E+YYu0nRuJ0ZQzWtc=
X-Gm-Gg: ASbGncspOBNpi5bEfhEi2OqkWroleLTCi8NEGjt69lui5p9hVDBCvCJx/QqGp00x9KA
	8GDE2JWLK/kB0VRjDKnSnwOxckxm1f5QkmqRqMxEH2VQ+/AZxPq6KtiEnk/Fl+889gJhPl9EKwF
	dflni+y3aaaoDLDyz1l19uddCYP8eWxPmMJnz225kio4z1YehxVrV7bADtkq3UDkIkDzUMPVXmj
	PLNc0fP4JKGMMbFTsHioMc/y4F0JWeQQLYW9GTibAB38NVFdErfherBJGxf8Ehx27Ch5hjWC1uJ
	GA39bxJZgMgnZXJzc2dmL4HYGGqua9q7ApE8aSZI9wcPKNUec7D+3qk4iUNul6aDfTU=
X-Google-Smtp-Source: AGHT+IFotUTj5zcp7ShZ6IoB9WHymxHO7Rq5Lsk8ESCqSS7UfKL93wxzqyd9QmnDn3AYs6nJhvFulA==
X-Received: by 2002:a05:600c:a45:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-45381b0f48dmr20255625e9.22.1750847617865;
        Wed, 25 Jun 2025 03:33:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Wed, 25 Jun 2025 12:33:23 +0200
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPQW2gC/x3MMQqAMAwAwK9IZgM1aBW/Ig5io2ZpS6oiFP9uc
 bzlMiRW4QRjlUH5liTBFzR1Beux+J1RXDGQoc5Y6nCPEtZDIiY+Ue/fqOHyjtAMgyV21LdND2W
 Iyps8/z7N7/sBvsgfCm0AAAA=
X-Change-ID: 20250625-gpiochip-set-rv-gpio-round2-08862ed27417
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=42Gx7MVqg9RLVZZL0nQGlW/DfixSJ60vSIokymr97mo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B6XbDc1lIy1VT9BCDCPgIvuXS+r0NgLXwjx
 3/PIGOmGaKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQegAKCRARpy6gFHHX
 cgTSEACFaucbwtdUwbgQWlc6On2PxsVQjx1y4B4b4AdaA4k1pQv3Mnkwj5zwmymAtY7xsbo1u5E
 7IExozMIQbhO3mBHTgvqM2xttAWFJoNEe38l/HvCFGOWAokGWyEnJl2XrzrsqKzTtxvd6oOEn8H
 wOhHqs6ZcnnWZiR8YV2uofWZbqn7Hkt/eZPRBzIlz4pwUbP2o2J+dhh5s6glon2J7+CYt+unvFL
 gORIlOItofYQPbdl2rFqKKeTLjyfKeLSIMAUAdXGcUuduoypT2gnYxru40kJEDN4vW+8rFhKFcE
 f0UYhwxnFqaDCdy2RTTB77JOdYKXSSTEYtFaYZj8xQSTTw/ciMwRiiucffXqNk71ASkMiC6cZUy
 cowudu4dzmh3ntG3AoC4HtYdmZ+mJFJRQLdA9O2k8PCh1djKhGJlUr85g3OMkJLe6OjCtOgQejm
 SDZcQ/8bTpwNkDz9w2//nWDSJ9GEdpxjv6xDe6JmFkFgw0xdlFFzw18MXwPIU/aKYWVDTvNoCqv
 uKbFZJUbUX7WrvVFGm5OVRPj1scmPBIJ+BwTdbu9ANkqYCb0T4usSWzvUPNaWH5UhrLlYBv3t9I
 Y8xJBm0XUvvEmU/RxOdrHzvSL0shP9QjkOVLCU/ozuc7IMBna+xP/0StXa4JPC4s9eQ+RlX/9/1
 5yU3ObdZpXw9csA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033339_756731_5F9A13A7 
X-CRM114-Status: UNSURE (   8.54  )
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: sama5d2-piobu: use new GPIO line value setter callbacks
      gpio: sch311x: use new GPIO line value setter callbacks
      gpio: sch: use new GPIO line value setter callbacks
      gpio: siox: use new GPIO line value setter callbacks
      gpio: spear-spics: remove unneeded callbacks
      gpio: spear-spics: use new GPIO line value setter callbacks
      gpio: sprd: use new GPIO line value setter callbacks
      gpio: stmpe: use new GPIO line value setter callbacks
      gpio: stp-xway: use new GPIO line value setter callbacks
      gpio: syscon: use new GPIO line value setter callbacks
      gpio: tangier: use new GPIO line value setter callbacks
      gpio: tc3589x: use new GPIO line value setter callbacks

 drivers/gpio/gpio-sama5d2-piobu.c |  8 ++++----
 drivers/gpio/gpio-sch.c           |  9 +++++----
 drivers/gpio/gpio-sch311x.c       |  8 +++++---
 drivers/gpio/gpio-siox.c          | 11 ++++++-----
 drivers/gpio/gpio-spear-spics.c   | 21 +++++----------------
 drivers/gpio/gpio-sprd.c          |  8 +++++---
 drivers/gpio/gpio-stmpe.c         | 15 +++++++++------
 drivers/gpio/gpio-stp-xway.c      | 10 +++++-----
 drivers/gpio/gpio-syscon.c        | 33 ++++++++++++++++++---------------
 drivers/gpio/gpio-tangier.c       |  6 ++++--
 drivers/gpio/gpio-tc3589x.c       | 11 +++++++----
 11 files changed, 73 insertions(+), 67 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250625-gpiochip-set-rv-gpio-round2-08862ed27417

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


