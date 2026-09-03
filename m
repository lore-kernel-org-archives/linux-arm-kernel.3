Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90877C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d9KwlyMIe2ffPTieEcQ159G8mFBwDIrli9vBOYObo7I=; b=U9IA0F9uwl0wEKFKgerAMbTrJ/
	HgfYM7gZ9kdY06/nMY96zukJP6RxgCYkOAySZMLPaQxlxXbaxJ6jGwSqhColy9YGaC/jO5WF/uKwr
	1ZzpOrk8Imy3NETDEpl1erePa8AAjrDQtQbelxYfqmp3WaFIRVkOtGfNRlwAlbFKSTT4b4khrFM0/
	Aq8VQ5WV5R2zb3joej51pTZmB7fCcAo+y+FyfOnvmZD4kZfux+VboDXFgiVd7eNiiep2T43KgX2HB
	qIqpMIVkMFrhJwItssjwI4WEJa5QnqoUw9BkLDKEv4wSqKfLW6nwBFa7C3N90toeU6gBPUArnL/Sm
	Gt+MF5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21vX-0000000Ga0N-1AGb;
	Thu, 03 Sep 2026 07:32:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21vI-0000000GZvp-2LZg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:32:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5044885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420706; x=1789025506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d9KwlyMIe2ffPTieEcQ159G8mFBwDIrli9vBOYObo7I=;
        b=KZ/tFuSq/U4S70S46zzaQoqPFpSKxyN1xfPGrWL674Z15S7pFQWtnqqgtEfFZfMhLP
         ztdX4s7opBo2zm3ljVfYqIOI+rvLTSUjWZcIiu0GqHVVC3JGI9IQZe4TyhkUog6RWbsU
         8Qb9m4U37hggZND+eIxx3K/BjTzb7fxkFIM+PvV3H8wSJDJ8iaBCZ8fgpnW7Imp4oYxh
         nS0SS2HPs4iJZLUbiVU10VKblADie3uKbTk0Z15Bd0rflPCxnZdMMEVRv+LEiMeCWrgq
         JWFI9VBugNRSA2wGKpjV9D/Gi39W1x3k1gu6mOsm5c0h5FV/khOKYNdACkVMT1Tnza7f
         6XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420706; x=1789025506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9KwlyMIe2ffPTieEcQ159G8mFBwDIrli9vBOYObo7I=;
        b=ma4e/FswP23WeioU/K3szdm29DyZibXQEEVvUv9CtgFp7a6ifcq6M7/c/tDINA6ymL
         JsGvmG2VGhbcSEV4594HSZQQbVLvHQvkvjWmqERR7xfF0GK2LEU2wpGP9/5VJCaHgF90
         +SlamEdPFmASP2CxOvVEZclIHP5CstNKtpPCjzNmkgpOVTHhzrNS1XztoyZm2XMr51Nf
         MErPbSGP9+czZH4XiOdD2axqRCwA5A2Km/WgGGCXwgy2Smi2kigcyufp1G/B1w28hgJJ
         1hObRqDWovJRqbEfaOESXEetQMAAFTWhev7T2yBPooVgb0+2PHzBye8KkyAEtBqvc70v
         Qpsw==
X-Forwarded-Encrypted: i=1; AKwUvByXOEivYngwSTnbijGjNYfyg9rnLOs6vw0ZMhEH7PV3De4lS8iy5XPrm2EQK56MFGOCggGZ/Yuypsg7DHtpXunW@lists.infradead.org
X-Gm-Message-State: AFuF++mvWGa/NZW1QmaDOE0bwpdQDtAUrX9q22O1PMv5UMEdDYr0t5Ms
	osVg9qr9retWciwipbTbu73nUu+I5TzeJFXtMI+kWBvmTzZndJ55tlxV
X-Gm-Gg: AYBFou1kfyHBnzbZp6VuMpgGQhHwrtzubBc1NLYGrEAvy3CqyWOCy9ZutTJ/18Xob8w
	ndCyPNa98vJjM2b/njdL0tjrFLMSVv1EjgAe0PY7duc7iQcIRlAWA9btVYBSUYbrlKiK4sSPFW8
	qb+o1FJ6P2uZzLfswLs/HtkoBotOO2au0ToWuMgW56djG2p7PyHbMWprZxmuDj93CBX0N0VsODa
	9qdlDkjTIugokiPFJW9kULjG4eaxrebfwdSqjK/3q/NYgRu7u0Cp+O5MRVBqUqlsK+WRLGPMIHp
	rHYMCXRQxor4MAsIc+S8Lni8H/kAV3aeVZ0BD+6hTcRWTn8yWccAb0fpGTX1UJluGH8Bes3QMPN
	R7lCjwNul2EeRVwefd/bcMchrT0dEfzxG8KUYM+yvMnB0HZfe2QIfKBzhpHHI1vzE5xb6oukRaS
	mUg1uYIIQ77S42676Qw/NF/vxSPDMs8KUaKW3TRdWGoUkseji1mPSbpgTuQeCFWdrYrw==
X-Received: by 2002:a05:600d:4445:20b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49cf1577d23mr12892375e9.1.1788420705978;
        Thu, 03 Sep 2026 00:31:45 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm69369455e9.2.2026.09.03.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:31:45 -0700 (PDT)
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
Subject: [PATCH v4 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 09:31:40 +0200
Message-ID: <20260903073143.2068494-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003148_719841_68294F16 
X-CRM114-Status: GOOD (  20.16  )
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
backed implementation, the mirror of gpiochip_generic_config(). No
consumer API.

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

 Documentation/driver-api/gpio/driver.rst  |  6 +++
 drivers/gpio/gpio-mmio.c                  | 60 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c                    | 23 +++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 ++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 include/linux/gpio/driver.h               |  9 ++++
 7 files changed, 150 insertions(+), 8 deletions(-)


base-commit: 1900b5a41493e7050c68c1e62780d6fb9a209457
-- 
2.54.0


