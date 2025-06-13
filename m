Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ECFC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y1TYF3o9MJosGx0HwGV/hmhcmkYfIUKomItVW1Sq2k0=; b=Dsk0lnNoCYemmT
	Zhlqu+M5OA8SiowJbw99E4NOzo4nWlofAWw1436JWMU+/22ZwDljijziMYX6gkoBTJwki4qWIkzRQ
	9YdVMXnVCRKGazKPPad5qKYZuah0RxeN7xn2bRRPwDNwqwKjlpFYNZx5QhFPwReeFiN+jyJgwagCG
	JKDxRxRmVNVAX2XXrJyiePLrRobEOq2EVJ+4k5xFOy2b33gW8t+84+zoII6DJD5zInT7cGiVdNITA
	OG4otVUv+D0fQScpY6xQeqa9x63R8e2IJTYl/MMahcyoiMp1HKu2OJIg4DNIwLNcQtYc/1Kyy/35E
	yI6S8BOw1ekK1rC20RVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9wF-0000000HQDX-0USJ;
	Fri, 13 Jun 2025 19:19:43 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9ZN-0000000HN14-3Mwg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 18:56:08 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-60f24b478e3so1215355eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840965; x=1750445765; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1TYF3o9MJosGx0HwGV/hmhcmkYfIUKomItVW1Sq2k0=;
        b=eE7Cqo3X1/wRerpdcqoPT9lyftGIWHWUx7/i1QuRXN923hkRvMyrz6+Uc68Xe9MZ4b
         G0WcwC/BhfoOBw8zcmYuEWsyiLOtgzpsEqXwp9F2Pl1Q0hGjqekZB75RLxGMOysPENAI
         g156b6pOvn5q5kUqZkQR8FEKwoVjI5vDIIyHHuiI9JMNGrY2h2M/LLR9sCmKayPk6yX6
         dPTmLnuzDwyX/w592ml2CnIoALJuii3thPBw3RD3XHCCsRmnRr42GjeeNNIG+BJxx+ap
         ojT45iHlwQfy/4z1lygfYF8JI6IfCW8d4oEyG6bG4ojPoLhWNBP3QSZIVNNleDHb93/3
         yDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840965; x=1750445765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1TYF3o9MJosGx0HwGV/hmhcmkYfIUKomItVW1Sq2k0=;
        b=uHEZpTOLyxCdHbl982E2e0ZFtPLKz4N9ABDTynC7beMvGOeVnxgDgEt+jmrOO9S+/R
         1EftvZUpXUVCG8IUWIB296mKmyQJvKAf7OG1dzYdnJ+6pEzz2KukUdmGdzF+mocCByif
         qgNI2sZDwLOKY5uD5mvNAtMAWP7kECBdNjwwJmC8UuI42mwIUjhBtUnPJy505N/2BBox
         Lc173f21E2Ukchp+6DS065WlbVj1IM9GsjNY8iKGDBrhDI/rDB9XOFKHyMh4aJpKWlHD
         yUvmqAWZwCBStbKOL7wM838EHVnWpOmlOw+I7jTa6bBwOJnq8+n9F6+OXcEhvSg3D8qO
         Y5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc4058PlQIDJwmLaecXVq1ENHI/QwOo2EAU0MyIx5bIC/Wt9ERde7hf+qCHi3cHz9HN8wkRcGzOycUuXhMhSbb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf6c86uvrmbnpRrPmIeYtVfoQOlA05fFUAZV7ZVRh7R6Ymb+H0
	vpHsJYQ9927TqxR9jt3T5qWhHXkvrqjCuVPcdqxseGZ1DAvehYGV2gjUSvZFXLp7m68=
X-Gm-Gg: ASbGncuYCo90gsBYSDMT+GLk3SJw0v2Dni/Wbui61gdjyP/dCPUfhHSm4YjeNjcS+ke
	zvwaMaXux7pvox57IdO+VZ/IzAQuHudVsHjBYllEOr9TjUxYtZjHSdDMORpNfYBJeiKZmoXja3S
	zMFDCL1cPEff38aWiz3mhbRjsh7huENjsCezne1kJpUqnIdclJActApLMtue4RDsh34WsbETuoo
	brX2EA6Q1AlW3vvt8Rnj6YSaKhyiSrTmF9cu2+CpJ/9qgJvZl2GJMb6Cgf9G6dNGkp1eknTJDm8
	eWLeXcFCn3WNzslR1Q1M4K9LwPlyTFVDbjlURNJGQd9LLlz5GEuwSBKr2khLAqMkZMM=
X-Google-Smtp-Source: AGHT+IH2MWQtTOQvVuN+GKtLbqMqE9OuQOP/DXYYureGIwrlvQ2mli5y2ygIXgHzv9OAPmZM88lIWg==
X-Received: by 2002:a05:6820:814:b0:60f:3442:96b9 with SMTP id 006d021491bc7-61110ff7a50mr540561eaf.3.1749840964805;
        Fri, 13 Jun 2025 11:56:04 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:03 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v5 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Date: Fri, 13 Jun 2025 13:55:27 -0500
Message-Id: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB90TGgC/4XPSwrCMBCA4atI1kbyapq48h7iYpJMbUBtSaRYp
 Hc37UYRi8t/YL5hniRjipjJfvMkCYeYY3crUW03xLdwOyONoTQRTFSMS07PfexoxjuFlGCkLV5
 6TNQFBVIYWbMgSdntEzbxsbjHU+k25nuXxuXMwOfpP3HglFFruTfeOxU0HhyMl+gS7nx3JTM6i
 DckmF6DRIG4rxqmTFNbL39A8gPibA2SBQoadC11rQKYH5B6Q5qvvqYK1DijwTplLbgvaJqmF0B
 RaAOYAQAA
X-Change-ID: 20250131-gpio-set-array-helper-bd4a328370d3
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=++uE2N5iG8oRabYWPvqc1xZ0NdyMvXJg7Pp68u6U0pM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQn8OH/6JMhZq0tcuH66PDJbaNGfuO8EYGYf
 bqSi4lTXkqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0JwAKCRDCzCAB/wGP
 wL11CACbdE4hxkOjFwtT6N/riTIylQaavW5TjgmkT2kDkqqVPKqqdQWBLEm2iIfONpmkvV381ux
 q/GgBKcW+hxEM9ILrT6MdgN1qyScmpXBTc/ra3ZJz2DSy9qJ5rXnscay+TKk4pir4VOAcHOxlPn
 yPtfIKBKbMX+KyfrGZPYgHNJ2P9juYzDw5q8IeOKwFhVmZcIfgA0LhxvYARl1BapQgrsdgZguIV
 IlkPzlwZJvp9EK1LdJzfM/YAZAU4vQL5+txUhPx3fPDe1WT4F3nqvc8FFjGYdDWhRnARqyh3K1F
 5U5hNpVM8/xLMR6ZpRqinew/FouDHnrMpFM7b716qLzHhw52
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_115605_954815_9DFFFD34 
X-CRM114-Status: GOOD (  11.65  )
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

This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
that didn't get applied yet for the bus subsystem. So I have changed
the subject line accordingly.

Arnd,

There was no maintainer listed in MAINTAINERS for the ts-nbus driver
and it looks like you have picked up patches for it in the past. Could
you please pick up these as well?

---
Changes in v5:
- Fix undeclared variable in ts_nbus_reset_bus()
- Link to v4: https://lore.kernel.org/r/20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com

Changes in v4:
- Dropped all non-ts-nbus patches.
- Fixed a reported issue with uninitialized variables.
- Link to v3: https://lore.kernel.org/r/20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com

Changes in v3:
- Added IS_ERR_OR_NULL() check to gpiod_multi_set_value_cansleep()
- Added new patches to clean up accessing bitmap directly (ts-nbus, ad2s1210).
- Added function prefix for max3191x.
- Removed unnecessary braces in ad7606 patch.
- Picked up additional trailers.
- Link to v2: https://lore.kernel.org/r/20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com

Changes in v2:
- Renamed new function from gpiods_multi_set_value_cansleep() to
  gpiod_multi_set_value_cansleep()
- Fixed typo in name of replaced function in all commit messages.
- Picked up trailers.
- Link to v1: https://lore.kernel.org/r/20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com

---
David Lechner (3):
      bus: ts-nbus: validate ts,data-gpios array size
      bus: ts-nbus: use gpiod_multi_set_value_cansleep
      bus: ts-nbus: use bitmap_set_value8()

 drivers/bus/ts-nbus.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)
---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250131-gpio-set-array-helper-bd4a328370d3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


