Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0214CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2SUJrQZ3PU1yeKx3RCvPctng80jzOe5NjGlx/Li35HI=; b=sNqFEvb5uRvpdv
	ZPEIEuAuVFsN1Wy8eqQ+ueQEdl7ZFiuriUmkix8wXxkEuvcEAHCThN7OJ9qIlqMK2uYx2vp9nAeMO
	ROuEO1vFiTg5OA0YD6a7shBch+jgyn7i8nCgy5Poa+Oj1FrmiyJ0Y/9kZxEW4luxIsFw7CSsgDHxm
	5iy+IUCj1u1V4gLmfnES42s+uwH89YBUiLgV83GUDk6DCOWpMXBVYJ2Q7zBuWREvK7sbUa5kERrYm
	wVAMconoRFCdl6ConkMPiLRf5yOZusETaAqIy13slFQrg0MU1MdKJYEqPIvBUpuo99femNFI+IhuE
	N6ezMnzr1osE973IAMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnn2-0000000EDrR-2CNC;
	Thu, 12 Jun 2025 19:40:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhm7-0000000DLfy-0k5C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:15:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso643697f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734121; x=1750338921; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SUJrQZ3PU1yeKx3RCvPctng80jzOe5NjGlx/Li35HI=;
        b=NkvIqDP6R0fOgHqdk8NYgv4y1z09ZQwX9x7B3keAkQrHVJG9drWHgZoNWbhEor+gN2
         +jObcqL2Nby44rSyjoSPyHcBVGCfo/FHgB/8nfx9CADk+nHgi21dT6isT9qCzQgeYh3d
         11NcUVIE2me/8FhQU5S6ZgAMsuZQoOvkRzs365RVZwgHAi7iMsPmFbjFOTlk8xOsibhA
         0++ZeJrBITzk7K/H711zV7MnpqVhv8slueTkzHUjslF85WNd30HccAooZTD72upneIvT
         vW1Xwih/b+OEiGuEXk05EClqAz1jtXzRF+hZC8CUmVCCW8j7tV8rI41/l3xjMlAP7xnf
         an/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734121; x=1750338921;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SUJrQZ3PU1yeKx3RCvPctng80jzOe5NjGlx/Li35HI=;
        b=ByuIwV2VeVBPt7j4lUL23xVHLoCIToF2F/irykqntUthMFL56qEzQFgTEERJSn96QH
         IFLxx+Et5OTtppAHsU8J1kxzqPiiiF1sFA5lCo0wyD5rCvFH0G2obTNBy3CkIKWdGvyt
         4eCz5gYrKF+idluK+1i6vKMQpwxmSVCvUk7Ih+oTte5LL6PwzMRED3ujls/9aBbd922k
         cQfiQiQhuRlepwGdAYlpNcMhRBkwqtPWcBM93wJmcn1Epwt9VMX95ZEemetQW5P2nLaa
         9ULIaINsJIb3DEvHztA4z05wfx3i81S7zJ+olW5hK9ruQ+No1RrxF7Kb2FJBEsmj4QRK
         cC+w==
X-Gm-Message-State: AOJu0YzEzu/+wYppr59cP36WAOw4Xfow/6vO3hl0ohSzZKZKQ2JK2ysf
	zRWzy4wntaDrSOC5Uma3iQcvKwnjthQXIC2KBfyPZrJnNFj4uRqVGYFRVy8bIe5jC1/eX/HeKjx
	BI+Std1c=
X-Gm-Gg: ASbGnctTMI/P4JS/yeL5hF3V9xg7Vo+9fJP/41QN97hhi+KGO8E+O0FvZsQ/HCRHH+Z
	vc968f7mNWL2OJynqA2fmP6uLkSR9xHln5JjiFbLB9ub5yxZtn7ouJWLARGtu7OKC7ONU71JHqB
	gBdE8dM2DQLOAv2+8HobKqpUOxPz4FSAjcpjwGFTChq/Mo+YNWtn2vGfBTPglnab7fHDiW+BsnX
	XbyitJ7spD1PbUUUhSmLPt2d86FKLYTgBb54pejL62R9BBqHul84vfkXTO5hHzhL9JiKmv9M0tH
	xU2nWRfMKIY+zHcn57X747doCm2RPRZ+5OblTYdwvk6U3ysm0x/PzXw=
X-Google-Smtp-Source: AGHT+IEGvLaK/L2RekqDVUDwvakAKw3oVVhhkhavlDULh5EU7f4jCZh3tBP0kZZ2oTyR7UEhkVrpcw==
X-Received: by 2002:a05:6000:2409:b0:3a5:2cb5:63fa with SMTP id ffacd0b85a97d-3a558688b57mr6508483f8f.2.1749734120909;
        Thu, 12 Jun 2025 06:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/16] pinctrl: use new GPIO line value setter callbacks
Date: Thu, 12 Jun 2025 15:15:09 +0200
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN7SSmgC/x3NQQqDMBBG4avIrDugsWrtVYoLiWP8wY5hIlIQ7
 97g8tu8d1ISgyR6FyeZHEjYNKN6FOSXUYMwpmxypWvKtnIcIja/IHKSne3gCPW7rWzyHaHQwL2
 XqXn2s3SvmnInmsz43Y/PcF1/7ZmJ2nMAAAA=
X-Change-ID: 20250612-gpiochip-set-rv-pinctrl-remaining-9ced549fe783
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RR1LOd1WsQSlBgBjH2f7CoS6VLXc7E6SpyBe5UrVm7Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLgSkNL4EvOT4zpnpU9IIqDNbE7eRPbf/OwH
 rSZHgbQsOyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS4AAKCRARpy6gFHHX
 ctz7D/9jvCm68BYPL6TunUJVQLgfUQ3dtLSaDxTtxrPNSokhv/mexnuIy5dIVleZpLb3dblb32P
 zFr8b2pggxEzCsnmCD2GZ5RkMtkubKgiwITqxk5jplEhE1h1liDAuwI8YnokO6BnQSWiNS48rBd
 AYi1Ym3VvuWv3cbTU3mll5x4vbCXU37eAvODoZvw7a/sVrI/rYrVUUoRMtmXTugujw1gC8pbPHq
 miPD5w3IkIxdeBR6BlNtJM7+LlNZG6lRxGmOkEwmWAHUT2TntD/d8v5Ma8iFs+M9bIayg5ham0k
 Cr60F6x7eX0Tooqkb7P2Bw7OQeZcin+VgTHo6yrc6FXSfyyontOYIvBZi2XQSxDXmElLjyDDeHy
 YsfRXnodKXRo0l5OqM2ikpB6A+rTBLEcnUGM1UDrJfCwdB+KUM+udgJ7j0IbHsUoZL0+Dq5YiOa
 SvXNK/19oyyWJsMBta2KUTJ0Zw+h/BYSC1zO6Ec9m56ZjKqGyK0nCA52yI7jIMHYOpyCUX/SDQd
 D1RtvyrZALe/PLM781ppAU3Oltm4Fpd6OQirzsr44x8cVQ2JxQpeD8H4msT5PSZSfpjDnuYF2oc
 dADh1T12APm2chmqgJhy1+3wycdb7IRbxeh83FzTCWRab5szSTnck7pmAXICYSd/gLwKJhRiCb/
 wX0s3E/AAtQdk3Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061523_223617_BE102C23 
X-CRM114-Status: UNSURE (   7.90  )
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
converts remaining pinctrl drivers that still use old APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (16):
      pinctrl: sppctl: use new GPIO line value setter callbacks
      pinctrl: st: use new GPIO line value setter callbacks
      pinctrl: da9062: use new GPIO line value setter callbacks
      pinctrl: mcp23s08: use new GPIO line value setter callbacks
      pinctrl: wmt: use new GPIO line value setter callbacks
      pinctrl: aw9523: use new GPIO line value setter callbacks
      pinctrl: xway: statify xway_pinconf_group_set()
      pinctrl: xway: use new GPIO line value setter callbacks
      pinctrl: digicolor: use new GPIO line value setter callbacks
      pinctrl: apple: use new GPIO line value setter callbacks
      pinctrl: pic32: use new GPIO line value setter callbacks
      pinctrl: spear: use new GPIO line value setter callbacks
      pinctrl: keembay: use new GPIO line value setter callbacks
      pinctrl: sunxi: use new GPIO line value setter callbacks
      pinctrl: as3722: use new GPIO line value setter callbacks
      pinctrl: amdisp: use new GPIO line value setter callbacks

 drivers/pinctrl/pinctrl-amdisp.c       |  6 ++++--
 drivers/pinctrl/pinctrl-apple-gpio.c   |  6 ++++--
 drivers/pinctrl/pinctrl-as3722.c       | 19 +++++++++++++------
 drivers/pinctrl/pinctrl-aw9523.c       | 26 ++++++++++++++++----------
 drivers/pinctrl/pinctrl-da9062.c       | 14 ++++++--------
 drivers/pinctrl/pinctrl-digicolor.c    |  8 +++++---
 drivers/pinctrl/pinctrl-keembay.c      |  9 +++++----
 drivers/pinctrl/pinctrl-mcp23s08.c     | 20 +++++++++++++-------
 drivers/pinctrl/pinctrl-pic32.c        |  8 +++++---
 drivers/pinctrl/pinctrl-st.c           |  6 ++++--
 drivers/pinctrl/pinctrl-xway.c         | 18 +++++++++---------
 drivers/pinctrl/spear/pinctrl-plgpio.c | 11 +++++++----
 drivers/pinctrl/sunplus/sppctl.c       |  6 ++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.c  |  8 +++++---
 drivers/pinctrl/vt8500/pinctrl-wmt.c   | 17 ++++++++++++-----
 15 files changed, 112 insertions(+), 70 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250612-gpiochip-set-rv-pinctrl-remaining-9ced549fe783

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


