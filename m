Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADF0C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oqE1Nf1WUkJjJ59VGvv07xVmOKIQ1xkyIMzuh64BMn8=; b=o0uD0aKVm0tDeqYkhPU1giazs4
	jAppsejIapwf+Gw1JR6KMGx3LQ3eB2kQga/Pv7lK9SqtA1y8lNDBaJt1kZPksoLj9iaQ20YCrp3Hh
	ccpqQ2nA4/IbEV5C3ic+wIT6JAOMQAt2LhNpvkYU6PbCOxypGqjYmoRc0CfwnW5Rd/lfKQ1OpWTf/
	62SUIzRbJHdvZ7fU9k+thteIXfVHIy/dXhYyRen9i9K6fkl73/qqYsFWvrCGXBwESth/53YBKwq7c
	mSHM16RI1r3FcfnvoqoXQBYJLPYOF2Bxa6jRz/tqjNN9tFW4IAe/6g4sQa2T+sRU/PFEbwfEljsmr
	Pwzs7W8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MO-0000000Gia2-1mj5;
	Thu, 03 Sep 2026 07:59:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MN-0000000GiY8-0cpH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=oqE1Nf1WUkJjJ59VGvv07xVmOKIQ1xkyIMzuh64BMn8=; b=X04jLNVGnsFPQfNqQVb9bk+XxM
	nLnkT7j5eLj8HDoeUCxNBQlHzEuTUnPZQKlMgrClk9ZH7Kgx0YtPmq/CCZKWZW8UTpdsZ+thJcaGD
	p4mlREe0BpxjCGSUIfLbelnCAwuz7kuYZzdTvXrs3mAHwBDJR/w3F6/l4z2SRFmNjnPhQTOEkIKx4
	poIfSPC4pyPVUwCxi9vvDrUkUxFJE00JoNzgT894vo2jWsDORCajOXagtchDYhLKq9rhxbiacTN+1
	OY5W59FqHQ1jZkANUEjRrI24rMctMRTCPLFqEcykUf64VsuojDJEro3o6uzhsjEod9IleVAi3oWkb
	YX7D5AGg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22MK-0000000CpTy-0oWE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:59:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so20655105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422382; x=1789027182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqE1Nf1WUkJjJ59VGvv07xVmOKIQ1xkyIMzuh64BMn8=;
        b=EYLe1nLbpitinj93AKm+TJKXWT56/JjTSE7uiylPuUsH4Cp8dJCVhZx/c8cpUoQq7z
         SXB/iFMKFy1fjYNcNGsBJz1XTE2/FuJ3delxAOwPwjuz3aABI2u2lfR1ZqF2CJY6PWT2
         FXSqHZ/SWos2tdvHEzTpORdfUMgH6twM8WtPPcJUR0lRrnWaQo6xsmd83EXl0PZiaeTm
         kv9BHm9f6g4oTBaRS3Oy3Nlor7YeSuSUC7gQ/uhNzhiiSx+3k3LCr+ER0tT6eiY1n/8V
         q26NWjKSOs1pgLxyTNW59aE6uIzG6SXef4VGj4e/+bKokyO5G+xJjq3M2tTxAoigakWL
         GAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422382; x=1789027182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqE1Nf1WUkJjJ59VGvv07xVmOKIQ1xkyIMzuh64BMn8=;
        b=lhNHr9CTWfMoccXb0lK27/qBmsbWOJ5zwfHavprKroStwPdK1lCKVQv8Jgk2fu1fV5
         spg09xUZSwBPhosuSMFXUAkz1qFVWLCJ9KQGTNg4hxPpfxkF1Z5eBK4cAW4L9RB76z6s
         f/34iyX+qgq/VwN4Z8ru2UhVvebo3EK7mlEx3suQtkv1PvQ+iYZjWAfT9dVpZj9mh6IN
         RmEVEcGO0QjVrhLxHJlke+9RpybRsf9CqQkp8EOdMEv6bclexcRQObgd/+Gaoy1nXtne
         sN7ftzO8Z7XIZndr/k5x+oECqBHhYY1nokDAfILkRNbP3zaDGwmq/skXdrprGYcrDqgY
         vUUg==
X-Forwarded-Encrypted: i=1; AKwUvBzXADEnLL1Y+UXaclDg1tDtsabiauzMTJ6UGVrkJBrRWA4Y56V4zyeyC+M4i0l9l4V2keY8CNidgIxtXxDWE2B8@lists.infradead.org
X-Gm-Message-State: AFuF++kV7BV1x6sUWQ76EdWZXZGwrUvKxXQBxrzhtdIYQ5xZAGudueGr
	XHligK5TwYm4eN6pBKvntveUvo+kbMMlRSeBHIhvBVPRZfOU7whxnQws
X-Gm-Gg: AYBFou2/vBkOGA5hGWB80j6aKDA5WpJq6j5lu6qnP2vgCW2To4LtKdeZTe4sykiBvJi
	5//XceWyza8RDM+5cFEXY6rqb86j2RDnPhWn1QWhNE8dcpBQjCAwR+wi8LAr1anT2UZe+6G4VoY
	pMj0O65qOWeO38kSTGKpgmGYpuFi/Vc65a4xHvAHShLKRWVhzfInbtoCcTc0l7hISTLOxjN5yNl
	APQoR/OTpj7tE1QOdvqTGpMNZIOe3rvN2QQ+jy4ZA3KLTp3FabhfzgKQffgn+S8qRTSJEut4Pe9
	J60CgGhfpyuN7E4/fRliB/nKYDj7825LlZqFblbbk9SBxAcXUfWCU6HadmIUWc9bKxESZKWdjCZ
	ZMEO+YeI5a22xoq9SqprMcQDbPYqTXt+LLaPxv+E2A85PpTfo1eyuUzz6Sl7RRwyKxW8MTPtvjG
	pWSbpEakVmLbCEsqKY6YA0cTfNDVdBybGFFSlSVgUJpwcNBQf9Ni+fUrjxXEJSYfU5sQ==
X-Received: by 2002:a05:600c:4f0b:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49ce581316dmr148614405e9.6.1788422382300;
        Thu, 03 Sep 2026 00:59:42 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:41 -0700 (PDT)
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
Subject: [PATCH v5 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 09:59:37 +0200
Message-ID: <20260903075940.2089367-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085944_347422_6E20DDA4 
X-CRM114-Status: GOOD (  21.35  )
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

Patch 2 is what Linus asked for on v3: an optional get_config() in
struct gpio_chip and gpiochip_generic_get_config() as its pin control
backed implementation, the mirror of gpiochip_generic_config(). The
packed parameter goes in, its bare argument comes out, as with
pinctrl_gpio_get_config(). No consumer API.

Patch 3 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context, through gc->get_config(), so it is safe for the
gpiochip_lock_as_irq() path that calls get_direction() under the irq
descriptor lock.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled: no backtraces, and
/sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep the input
default gpiolib assumed before, so nothing that worked before is
affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 1 was also booted on a Verdin iMX8MP (gprarray, 6.12.107): the
pinconf-pins and pinconf-groups debugfs dumps are byte for byte the same
as before the patch, and nothing else changed.

Patch 3 needs patch 1 to give correct answers; taking all three through
one tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Changes in v5:
- patch 2: the get_config() documentation said the answer comes back
  packed; it is the bare argument, like pinctrl_gpio_get_config() returns
  (Sashiko review). Text only, no code change.

Changes in v4:
- new patch 2: get_config() in struct gpio_chip and
  gpiochip_generic_get_config() (Linus)
- patch 3: seed the shadow through gc->get_config(), no pinctrl call
  and no CONFIG_PINCTRL check in gpio-mmio (Linus)
- patch 1: drop the npins check, pin_request() already rejects a pin
  the controller does not have

Changes in v3:
- patch 1: return -ENOTSUPP for the SCU based SoCs instead of letting
  the firmware call hand back the raw pad value (Sashiko review)
- patch 1: -EINVAL for a pin the device tree never configured, -ENOTSUPP
  only for unsupported parameters and SoCs
- patch 1, 2: drop two comments that only restated the code

Changes in v2:
- patch 1: decode the requested parameter instead of returning the raw
  register; debugfs group dump reads the register through its own helper
- patch 2: keep the direction in the gpio-mmio shadow, ask pinctrl once
  from request() instead of from get_direction()

Mehmet Fide (3):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpiolib: add get_config() and gpiochip_generic_get_config()
  gpio: mmio: track the direction of chips without direction registers

 Documentation/driver-api/gpio/driver.rst  |  7 +++
 drivers/gpio/gpio-mmio.c                  | 60 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c                    | 23 +++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 ++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 include/linux/gpio/driver.h               |  9 ++++
 7 files changed, 151 insertions(+), 8 deletions(-)


base-commit: 1900b5a41493e7050c68c1e62780d6fb9a209457
-- 
2.54.0


