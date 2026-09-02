Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1A6C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t0+gl5U9/Zkul8WCUYt9BkcdFSYfVkFnGP/S7FNbanA=; b=zW1U4qiOcThi2pLtCW9DWzj0kf
	BujXrrPD1npO+gdjH3GGDevSEy5+5NQmhGbn5/i4OfWP4sIu0fAlPz0SFQduRjDUAIqKhHtxIGOll
	c9cZ0Enj40E3We9+Iz0jzurcfToRjNrhs86+58RUwukAPuF1aI2oYTXnohsgdkBRDilLTc3WCX6rQ
	GPuMQMNrXDSeOI0E2C0IxR8aNDHvP4PUo/hWoYxLiUWC5e4MYx6xn6hliycRl0E+0uq1kjacLHWkF
	oBICWM2pelYZuiS1THcckZn9yVuWI/q+oZE9HFrAUzZ5bHGOfvEoBsuDkJl1KdgF2N2J9BGFfSm2w
	Khrqs1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n9d-0000000F8K0-2eYi;
	Wed, 02 Sep 2026 15:45:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n9a-0000000F8ID-1FiO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:45:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so10257505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363933; x=1788968733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0+gl5U9/Zkul8WCUYt9BkcdFSYfVkFnGP/S7FNbanA=;
        b=R8e53qUor/QoQadTK852itBt/2MZYRiGjTtj0op4j3FN3SGZERSWVwIgHSwBasb0Xz
         Cmj7FnSEFWKup2lW4BmzhWWOCbA4DyJc4PfuXAqR8sWb3wnwwyILo4ay6Oxp+Z5yLmwv
         0muih8+iKQ2qUBZKDSD9ng3Ad0zHdKsLRVgZkX0g3q9BuSsv2SNU99E9Kk5Fa3lD4gVp
         bUWYd9WvboDRf/L/QX+jrmG7TD8l2fE2OxvvUCrEkMiRQwSJHJcTn6yoMdrUNL8iVCKC
         btd+oxp/tIXayJIG2NbPNjFTj2+8/uLuPp+DzACZ2hhcrQsVwBcqTZ0KzdMlcWEenPsg
         5yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363933; x=1788968733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0+gl5U9/Zkul8WCUYt9BkcdFSYfVkFnGP/S7FNbanA=;
        b=pws4LdqJWBVWhjbgJzqqfgUvZPPNPNXJQQLjOQRHj5o0pMTqTLZN81a0zQhuMIool4
         rwZk5UNIxU50mdLPfXY3aBxrwG4B4TtXY0ucPXTt287k5ItRH4X206mEOuUg3gFUGKRP
         iZ6y4Ez70RX/55fOvJ5Z2s25H6vbgh62vQ953uDIXqg9jVL0DN99z1Yb19EdakpS0AXJ
         ZQbXJRZRCtmCDX5oawaLLqES94Rs9zIrI+vBoOwjVEBTW3W0+zto57Zq4zR0tsylsZPN
         uj2nVAMV4+yCsgqw8iFALukDE2HHQddbIfYQZpgKm6i8eoqbQeH0yzsz9mCAltXQwyLb
         Wl0w==
X-Forwarded-Encrypted: i=1; AHgh+RqN6miHOGkFR0LPLG1aHBkleAT8CUxBqT4HO9aJrfuFJmZj6/ohCstD7JfB6tnE94dr49S9tUrYQtN/hu/kllEN@lists.infradead.org
X-Gm-Message-State: AFuF++mRB7b3FomFuYJL6HynNuLg6EgMenFuwsLfyVEgf2T+ORTJ3A28
	07BHnXKbBlqe0x9Ap2j4LmKT8BTZZbSHQrr8mIg9ZELzDo6A2s4ueDSy
X-Gm-Gg: AR+sD10rq0IXGCUw3JRvD1nRSPivXioGAVQQbUSeWDiMJq1sbJ2O1HovxL43ZsgEZEJ
	OiiSrfaxKZKS68Vuaa+p8q2P18UJ6z97AlbURmNQnV3YLc3EL5UFyq4iQbkcy3VvyCN3oUMbrHf
	/ihT4NpnZhFiG/FeiZZ/GrtllzgOZXF7UhroBljtv20qXwBc7YpXSjoi8Uzi/BF6wOw+4doGZ6n
	ad6Ft/9eGmKwOdZ875fnfrfSMJReOsl+Yb8JuVtZfn/fu8xzU7NeIIpI+nHIQIkCTGdOCGr2zIr
	VjemxD3QwpC60c1EzWvz5iCunzk93mxyyNbNw2Xs5cFWGYBWGaa9+dxeR29eY5zhpuYZuzIwXJh
	oCUYPis/fe5tlApvsRE1kk13fF58s58tJ9AUSXZ8Ktyq6TavjhgM6kJvOv7KbNKkWfGyD2lP3Sm
	FFWIW1VVg9/5QBmcjk9Duwo3KYU/3hQGXzo0Z8I3Kk2AtXEAFrCbuVnrhIqMUKhx6VnA==
X-Received: by 2002:a05:600c:a55:b0:49c:d60c:74e0 with SMTP id 5b1f17b1804b1-49ce582a35emr107105125e9.13.1788363927404;
        Wed, 02 Sep 2026 08:45:27 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:26 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 0/2] [PATCH v3 0/2] gpio: mmio: report the line direction on chips without direction registers
Date: Wed,  2 Sep 2026 17:45:23 +0200
Message-ID: <20260902154525.4090276-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_084534_365817_D695A1FE 
X-CRM114-Status: GOOD (  19.28  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this replaces the gpiolib guard patch [1], along the lines Bartosz
suggested there: instead of teaching gpiod_get_direction() to stay quiet
when a chip has no get_direction(), give gpio-mmio one and let the pin
controller tell it what the pad does.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. It now answers
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that say
where those bits live (Vybrid: OBE bit 1, IBE bit 0) and -ENOTSUPP for
everything else, the SCU based SoCs included; the debugfs dump, the only
raw-register user, reads the register through its own helper. The set
callback stays raw, as the fsl,pins binding requires. Converting the
driver fully to generic pinconf is a bigger job than this fix needs.

Patch 2 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context, so it is safe for the gpiochip_lock_as_irq() path
that calls get_direction() under the irq descriptor lock.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled: no backtraces, and
/sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep the input
default gpiolib assumed before, so nothing that worked before is
affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 2 needs patch 1 to give correct answers; taking both through one
tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Changes in v3:
- patch 1: return -ENOTSUPP for the SCU based SoCs instead of letting
  the firmware call hand back the raw pad value (Sashiko review)
- patch 1: say in the commit message that the set callback stays raw
- patch 1: -EINVAL for a pin the device tree never configured, -ENOTSUPP
  only for unsupported parameters and SoCs; reject a pin index beyond
  npins, gpio-mmio is the first caller reaching this through a gpio range
  (local Sashiko run)
- patch 1, 2: drop two comments that only restated the code

Changes in v2:
- patch 1: decode the requested parameter instead of returning the raw
  register; debugfs group dump reads the register through its own helper
- patch 2: keep the direction in the gpio-mmio shadow, ask pinctrl once
  from request() instead of from get_direction()

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: track the direction of chips without direction registers

 drivers/gpio/gpio-mmio.c                  | 59 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.c   | 56 +++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 4 files changed, 113 insertions(+), 8 deletions(-)


base-commit: 1900b5a41493e7050c68c1e62780d6fb9a209457
-- 
2.54.0


