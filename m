Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F9DCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=; b=0Yl3xLaEtc/u7ZlwR6Zv4nlPGA
	Sa5HU26CCHD1BBLXIJ4A3qcIRjEKGdako3YZgSSH5YRMUNcltM8YwYxrWGS0jkOWgNxd2Ig1uH8am
	g0wegqzZucFnImS+L7+CV3ER6/4Hc0D3e3GlQVEqsmRWzWL6dsuN65li+8MxuyYLUU16DE2P/mw03
	bYIHUtbUiqVeJF276jfNvW2GDSSSskSWwKgQSC0kDBcBW6ZoanQHbkU8LtuS4K1noPTwgJTj1eEW8
	u87kKVSKoejPSCPyEUp72lGtnnuzmIc1WNtViqAUQPVIEHfFoUBZpFfuA0jMKLCzoWe8LH/JOFI0b
	OjGbNGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIf-00000007AHV-0dgQ;
	Fri, 29 May 2026 10:18:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIb-00000007AF7-07am
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:18:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-459bf19e87bso8325525f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049919; x=1780654719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=;
        b=EIgyBmN5mQbSQzbjZwles/c5C6KLqQRi8ZfZERzbMtllYrg9hkoNLIrG84mQYiqrWB
         +llBAeOSUi7PtmeCTG4piQDNvVCfHDIRwdFXCoX62WFKOJ+jJdMddqvdf0gJANLNqqb2
         qdTocqAU2d+7dV0u3HIbjmIudU0N3zbblNj4SwrTnIKxk6/qW9FQO7PvY9g9ZZQqEUD1
         FHeHcDsKIhcHBjVSxP/NNmMXkbQQh8g1nciCuk/pbu/FaYQOAh192njJdf8lHZIKteVI
         RDbsclQ+O7VxQ9LodoLcPG3qhDuA+yZInJfh1SXt4EayK3xfcG4T2tmZd0AY1mpcgupn
         RyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049919; x=1780654719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=;
        b=YvINbfUlqSOU/HAcyxCa8ECeVU4Vdg0ZrdGLNxyE+Zc78tssEAwiMt2Bf/Wczbkfup
         UZLsizoISPI7XgSI7Gf2eQUlZuT7ZkryN7S5fe+RZ9o8KBTHXRKfzqZ7gyl1LzFJ8Ol/
         +sVc0NhzxQKymzoY/dnipyVpSWgVi2kHnmFA9QfWfg6HQAE10Ndbdoj0e/bLx2gopOKd
         lwpyGREPpnA3X9lUYG8al2LiFXYYzjUTVxQDKbH7VfBGAphlICPgSWCuXGLg4hHzgjsq
         ZQvj8+t9UK/yso7G81WNC6jrEHHn9lZP5zfnRLWKYv9at4kDFmJtHoE4XjYcutnExWZb
         94qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+s7bvAHQYKwR164CK5a/TIp0MknowKDUOZ8QC/SJ7Hr60+d4jwNxC0+qNcvPkinTDDaa/S5Q1P67nTX06a7ZJ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yztg/9s6ETzzWaipaUwAKDzKffABqoT8R2y6P2Vap8OKAPYf556
	jH7lOYm7pIDrghChybPVevTiBiTMAs7KaxDoigPgK1dUKDUDrcaT4+NC9K+rZ//Qy4E=
X-Gm-Gg: Acq92OEixA1kDFKLnW1PFtfJzYzf3b0sQUn16GB9QBLA0/XF+3tsnC9eeXUt6gNjkHQ
	HOkjR7kU/9gSnj5LcRbZe739Y75Fgw4AwuDGxQNZzJznJAe28cT5pFgiWnQwunUDv50KxbLsDG/
	Tb/bli54jNr15s3AzU4r6bJLiQya9WpyJz3SVjlXxhLBYO3x94QtnYrHF9/R+H1taj3QuOupTRv
	INp43yGcvTrb6jPB0I4awGRhuJwlPSotz+Mr+OSbPbpp/hB7nOumh5u9+QaUUKC/SEof3aDCNel
	3RqUwVsCishUf5hmg7TT+SzC03DBIf1fL+VOdb5Qk6iK4+S+AwiLToZxKxBW3ALBzXWcQXiYyi5
	xkR4pPMff/5K3eNPjVf1viw5xsvazBcqSBPEHBIeXa/z3va2Y87Z1rzOYK/PEh1z5wBNm6Pxp6q
	I47C+1DdUtt91pk+iWlBaJuYMDArUnrDdhJsDSw9Q2L0bCiGaIHyJmPqXNi4JFvZl4GlVcTzSU8
	H15fAbnQGA7oh8b4kgZqLbtpQ==
X-Received: by 2002:a5d:6f03:0:b0:45e:ef4a:8192 with SMTP id ffacd0b85a97d-45ef14aeca6mr4456766f8f.38.1780049919017;
        Fri, 29 May 2026 03:18:39 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef354cd7csm2359192f8f.18.2026.05.29.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hans de Goede <hansg@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	Yixun Lan <dlan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Samuel Kayode <samkay014@gmail.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v1 0/6] power: Use named initializers for platform_device_id arrays
Date: Fri, 29 May 2026 12:18:15 +0200
Message-ID: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5698; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HR0BG2x5gStI8qVvDgUBsjfK17M95+4vrnDaD2QTsYk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfoDIuZ0g/W2ypE62dFHULfUWoyzPSByuJOy zumyQmeqqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln6AAKCRCPgPtYfRL+ TsKPB/9mAyfp+pLZiIDxZa/Gq+SSHanqJrTQwpZ9rQFWh6BTlVwAzfy9/iK3DTaEC0m73vbGFfQ SrrV9RH9jd6SuuSNJEy+P030qdvrNgwnqe9+Kw6h9Ox1Xf/WbmVgbFqiAvBlC9bWaxNYlaSXA6b k6D0JHKSjZPpHgGWSl8de58GW9wTOhD4G7APcHqvig2ElcuxKXGEJMbDiI5C+wM6c/uNZYGDKQH Gyln8usdt6LIe+L24f+S0WZZOkN5b75oBqE1U4SirbgWSV0oQR/VgR5R3MVvLMMrmyqPiFaaawD fWqFsf8PmmOgcfZvBQ4ZGzTElp/ezMarN1H6m653QUtXR1kb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031841_129111_17B9CAAD 
X-CRM114-Status: GOOD (  24.44  )
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

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
	index 5d61053e0596..03bc8e859d73 100644
	--- a/drivers/gpio/gpio-pxa.c
	+++ b/drivers/gpio/gpio-pxa.c
	@@ -534,7 +534,7 @@ static struct irq_chip pxa_muxed_gpio_chip = {
	 static int pxa_gpio_nums(struct platform_device *pdev)
	 {
		const struct platform_device_id *id = platform_get_device_id(pdev);
	-	struct pxa_gpio_id *pxa_id = (struct pxa_gpio_id *)id->driver_data;
	+	struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
		int count = 0;
	 
		switch (pxa_id->type) {
	@@ -708,14 +708,14 @@ static int pxa_gpio_probe(struct platform_device *pdev)
	 }
	 
	 static const struct platform_device_id gpio_id_table[] = {
	-	{ .name = "pxa25x-gpio",	.driver_data = (unsigned long)&pxa25x_id },
	-	{ .name = "pxa26x-gpio",	.driver_data = (unsigned long)&pxa26x_id },
	-	{ .name = "pxa27x-gpio",	.driver_data = (unsigned long)&pxa27x_id },
	-	{ .name = "pxa3xx-gpio",	.driver_data = (unsigned long)&pxa3xx_id },
	-	{ .name = "pxa93x-gpio",	.driver_data = (unsigned long)&pxa93x_id },
	-	{ .name = "mmp-gpio",		.driver_data = (unsigned long)&mmp_id },
	-	{ .name = "mmp2-gpio",		.driver_data = (unsigned long)&mmp2_id },
	-	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
	+	{ .name = "pxa25x-gpio",	.driver_data_ptr = &pxa25x_id },
	+	{ .name = "pxa26x-gpio",	.driver_data_ptr = &pxa26x_id },
	+	{ .name = "pxa27x-gpio",	.driver_data_ptr = &pxa27x_id },
	+	{ .name = "pxa3xx-gpio",	.driver_data_ptr = &pxa3xx_id },
	+	{ .name = "pxa93x-gpio",	.driver_data_ptr = &pxa93x_id },
	+	{ .name = "mmp-gpio",		.driver_data_ptr = &mmp_id },
	+	{ .name = "mmp2-gpio",		.driver_data_ptr = &mmp2_id },
	+	{ .name = "pxa1928-gpio",	.driver_data_ptr = &pxa1928_id },
		{ }
	 };
 
increasing readability due to less casting. Also this results in the
compiler warning:

	drivers/gpio/gpio-pxa.c: In function ‘pxa_gpio_nums’:
	drivers/gpio/gpio-pxa.c:537:38: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
	  537 |         struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
	      |                                      ^~

which is a good thing as adding the needed const to fix this warning
improves type safety. (Sorry, no driver below drivers/power benefits
here, so the example is from a different subsystem.)

Patch #5 is just an unrelated change where I spotted the patch
opportunity while preparing this series. It's included here just for my
convenience and could be applied independently.

If you consider the last patch mostly churn, just drop it.

There are no dependencies between the patches, the only file that is
touched in more than one patch is drivers/power/supply/mt6360_charger.c
and even if these (i.e. patches #1 and #5) are reordered, git should be
able to cope with that without conflicts.

Note that this series is only build tested, and there is the possibility
that I failed to spot driver data usage that render patches #2 and/or #3
wrong. So a deeper look on at least those two won't hurt.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (6):
  power: Drop unused assignment of platform_device_id driver data
  power: supply: max14577: Drop driver data in of and platform device id
    arrays
  power: supply: max17042: Drop driver data in of and platform device id
    arrays
  power: Use named initializers for platform_device_id arrays
  power: supply: mt6360_charger: Use of match table unconditionally
  power: Unify code style for platform_device_id arrays

 drivers/power/reset/qemu-virt-ctrl.c           |  2 +-
 drivers/power/reset/spacemit-p1-reboot.c       |  4 ++--
 drivers/power/reset/tps65086-restart.c         |  2 +-
 drivers/power/supply/axp288_charger.c          |  2 +-
 drivers/power/supply/axp288_fuel_gauge.c       |  2 +-
 drivers/power/supply/bd71828-power.c           |  8 ++++----
 drivers/power/supply/charger-manager.c         |  4 ++--
 drivers/power/supply/cros_charge-control.c     |  4 ++--
 drivers/power/supply/cros_peripheral_charger.c |  4 ++--
 drivers/power/supply/cros_usbpd-charger.c      |  4 ++--
 drivers/power/supply/macsmc-power.c            |  2 +-
 drivers/power/supply/max14577_charger.c        | 12 +++++-------
 drivers/power/supply/max17042_battery.c        | 14 +++++++-------
 drivers/power/supply/max77693_charger.c        |  2 +-
 drivers/power/supply/max77759_charger.c        |  2 +-
 drivers/power/supply/max8997_charger.c         |  2 +-
 drivers/power/supply/max8998_charger.c         |  2 +-
 drivers/power/supply/mt6360_charger.c          |  6 +++---
 drivers/power/supply/pf1550-charger.c          |  2 +-
 drivers/power/supply/rt5033_charger.c          |  2 +-
 20 files changed, 40 insertions(+), 42 deletions(-)


base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
-- 
2.47.3


