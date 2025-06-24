Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6716DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xr5T63g8kad0hyUnyb2z17hPNVawJrKJl2WFA8QSKgA=; b=GigLogyCpaDQ7M
	FwGq9qS/WZMik+q24CuuLIx5/qEJXV6nWWLmOH707FWO1xKlq4ZR9Ja0b7Wmw/E3p5+1SwYwAR8bE
	1lsDUXmwtiublyipzll/I6leXRh1/7szWIFuIUHTf+Q7Ge6f5x7JAa64MzuulIoO9E2RIuoF+zZWq
	QIPpAgSOXgx1mCY/8fcdGlbmjaFGgK2gZaVTDWvuQjJeagNIl8sshbl0xFs7kSf0h3JV6OPjPJ+fn
	BUhwUoaCPIYTpwr7dCFW3eRbgsD4V8E9w+dPW5BDKOkrVCAifcjBOPDs1POUhNeI92pq+CHhRSpTd
	2gZYQSEKAQzvEJIHnkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3zf-00000005ldS-36xm;
	Tue, 24 Jun 2025 13:47:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3ge-00000005i61-1vjt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:27:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so29381825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771663; x=1751376463; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr5T63g8kad0hyUnyb2z17hPNVawJrKJl2WFA8QSKgA=;
        b=jhsOBUbN0ZJqIqto6hivQ9FKrun4rbFHrvs3fjOn4db9UmpQN4Bt+RCk3/ctXQcZ4G
         dpAjOILtCVF06DFzykIMpghqDRYHxfw+iICa60cKrGqZSFzsQIQzI4ej2j0oIVm+YTXq
         mZMv9TxYzMNhz8UBRM2GpWJ29gVuhh+9VZtFKsTTnN1erEvQbzvk1iynwn9Z0Egs7nQt
         UmmBq/WyNI4loPiS3IlmVu3TyvmjNAiHrxAkrh4XlCjKsEGogDtctSUxlzeKaQBh2qYE
         S3JaJb1kNu+eq9lCgz+xx0nYb7qY2g5bdR2Pulb5sxzO2QRvY34YRfhNtcd8345xuTid
         k9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771663; x=1751376463;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xr5T63g8kad0hyUnyb2z17hPNVawJrKJl2WFA8QSKgA=;
        b=E4+2qQus2h2nZRsSHvylYoN6vaYA7ucJQJBiMeprXNlqOkx1IKNOYATLzUgxO3we1n
         M6pSwNxULGGAIJfgIfMApnpHzKcnXWMxoFQAPJd1XHqD2SkF0K+TPpLlf6HVRKyAL7K5
         7exaX0SvYvn4wx59Y0t5OFMIILtkZLuI7kZkVJl3PrSvbYo/Itz/H4cvT69jm+ctdoa3
         vdpuYG8/iObDrbA7bhyxxHV1r56TLpBfkrSrHvUOIXWxhJ01GCIqh4R77J5Hn2NMfRTC
         Wu+GJslsnqGRD/dhn3Ot/JD4bqeEo6UoXGcFminRAWm9ep1DH+TYXRZsLrVdaeZ8f1gd
         KlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsID8wlf480kNhVYdArLcbChiHKNPG7V/nyP0rPB3nAjjnuqUtjHpXkxBwusf8j9UpgPbEMVueNuqfMa5vDU3U@lists.infradead.org
X-Gm-Message-State: AOJu0YykqcmmxOa9McCogD58Ut5hEwHh7bQg9zRDw0p31DGBTAGsBgLR
	TXplqPinOE9RXLTBVjp6ainbAUruNRE0sOe86/26gFdCNoeYj8Ogg4mMWI01q/OQy1I=
X-Gm-Gg: ASbGnct2vWcH58B9iC2xMZPRKVWfzrB0THiB2+yt/LWgNC88oJRff55C+JFWKhoGgs3
	uPhaoeP9CVsLVFQRrbsGOluMSI/XfhdREUWfejKUH+J4uNVX6Df28aGotS5esSjvyjv679q8vTC
	KdjtkktHRbnyy3C2UvqGebL70k6cguZ+G6pVYZ+om4UxyF5YOMLPnjbrDC6lomYqE+V+BDfGJ9o
	aFRQwBQd9ODdOgrtJFkKAg3zJ5vRZvxBqPOm7t2MO5hTx7qleueg8x82KlpdhHGejLciLHE3DxN
	JZ1B6cZGCSkfUKAF3jTJ75vZvnxIZU2DiKDoNM3DFAgCfxHR+MXE1Yf+Jaf3uxmsYg==
X-Google-Smtp-Source: AGHT+IEDM7qOcKUT37OmwC0H/zYPAKAnyMCScrG0HcioRFGKCbILTeRWcj8jgXSKnFtTmxdDjlYJ5w==
X-Received: by 2002:a05:600c:34d0:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-453653af999mr201047715e9.9.1750771662650;
        Tue, 24 Jun 2025 06:27:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
Date: Tue, 24 Jun 2025 15:27:32 +0200
Message-Id: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSnWmgC/x2MQQqAIBAAvxJ7TjArwb4SHaRWW8KMFSoQ/550G
 ZjDTIaETJhgajIw3pQonlW6toF1t6dHQVt1UFKNUkst/EVRhFDB+EQ+hFVuWIfeWGs01OxidPT
 +y3kp5QNurW+8YgAAAA==
X-Change-ID: 20250606-gpio-mmio-rework-a2f4c439aa96
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VxhS9gurOkU7dhnrqdfaQjeE3vC1wsKbo273ZJFI/qg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfLb7OwZ4HoG17O7P/urNWdrBoinBpsIVoHj
 cekug/KLz+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnywAKCRARpy6gFHHX
 cnc/D/9PCW+gsjiIgn490oa+jnPJD+8w4io8zZhK7ur+9dSFoHj7XWiEIaAl27clpuLPBrPt6nu
 JI14EVBCzuZ1+kaNqlptszH2MGnao0O1MwoK9+EuUGvooxWSqTZrzk3HuWTP+yd26KOdCh8R23v
 v7aEe7Lw7sBztpqL3jNhJN1V9TBFU0nfLPPubuYPZbBV/USJl/WWPsLp/VrHhB1W8epxk4riaqn
 MVEVTthO0CJVrln+8bKcCGnbtyEYqpx/MXEEXcZv5Vqz7qjeB4Ln3czVmaRKv1Rp7LQo637okNr
 0v/TS2PFvb1MR/E/r2MkMJFNRT/oVusI1aZetjTAWJEZZsOAXN8OqA/KqImhme2zYKFtHtrG7UL
 FKkSl3/Ha3WwQfLgezlYM2pGsb+0jB1vvDZvsiH4akvOATvZraFmcU/qaUreg4VJS0A1VStYybh
 0C2yHb080SuZNuSId7npX0tQDuic/WYP52ErevWPIzMYtigtMvB1YVCk7W2X0InchRziX96iRDy
 Y6DzgxAc0+Nlt5nMTCFjulJeTXJd5fuQkM+E5Xu+ZqvYbEz9TMRcEOCYBTjg5aNzN6j8NRSu4sy
 BBIOemcsFWzWjV/zERunvVPf/WtXvoRdh3KZcXv7Q2jcaewL7hKBx6SX1BtXwNomleKEEZfDjX1
 6ESLphE+meiLFbA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062744_504416_90D8F115 
X-CRM114-Status: GOOD (  12.85  )
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

The conversion of GPIO drivers to using the new line value setters is
moving nicely along and we're on track to have all the existing
providers converted upstream after the next merge window. There's
another piece of technical debt that bothers me - the fact that struct
gpio_chip contains a bunch of fields that are only relevant to the
generic GPIO chip implementation from gpio-mmio.c.

Let's work towards moving them out of struct gpio_chip and into their
own struct gpio_generic_chip. Doing this in a single series would
require some ~40 commits which is way too many to review at a time.
There are also users of gpio-mmio under drivers/pinctrl/ and
drivers/mfd/ which would require cross-subsystem merges. I think it's
better to do this in stages over 3 release cycles. This series adds a
new API for gpio-mmio users, hiding the implementation details and
converts the first set of GPIO drivers. Once upstream, we'll convert all
remaining users and once that's done, we'll move all the
gpio-mmio-specific fields to the new structure, convert the internals to
using them and remove bgpio_init(). The last step will be done in a
backward-compatible way, not affecting the users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (8):
      gpio: generic: add new generic GPIO chip API
      gpio: mxc: use lock guards for the generic GPIO chip lock
      gpio: mxc: use new generic GPIO chip API
      gpio: clps711x: use new generic GPIO chip API
      gpio: cadence: use lock guards
      gpio: cadence: use new generic GPIO chip API
      gpio: 74xx-mmio: use new generic GPIO chip API
      gpio: en7523: use new generic GPIO chip API

 drivers/gpio/gpio-74xx-mmio.c |  32 +++++------
 drivers/gpio/gpio-cadence.c   |  60 ++++++++++-----------
 drivers/gpio/gpio-clps711x.c  |  29 +++++-----
 drivers/gpio/gpio-en7523.c    |  36 ++++++-------
 drivers/gpio/gpio-mxc.c       |  87 +++++++++++++++---------------
 include/linux/gpio/generic.h  | 120 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 244 insertions(+), 120 deletions(-)
---
base-commit: cb908f3699fb137e28017a8fdf506c35762b3eb6
change-id: 20250606-gpio-mmio-rework-a2f4c439aa96

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


