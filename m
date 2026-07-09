Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520D7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rss97cjDQSVlLDw4954aQMvhSqBEsq548Tg4wWga1tE=; b=gau6knrAQd99yr
	KR0SXvmxzy/v+1VDthos/Odhz5Jlzi0MgktHYuC0YXXg7qXJdCJOe5DOOM4ar9fS2GAMoHcVCvCSa
	+ksGxu8d68vRI8zYznyidaRUfjRv3awXpmmzRpCm5iFlSsQ0O845T8dCUFCxYHMJ/FXM12SsNZkTM
	WgIyXRQ2UlH5M7IlZ8IKeqsUY3Bk+ReaoPbCt9Mhbesk7dAFQq/u8/nJfslAPTT0jvVgSRZ1APRDu
	kv6jXkcP75HDgIwlHoI5EDaPQKtA4B8Y5NyrPWUmQd9nIhNkAHF9U8A23aSiOblIRNxJCEymj96Jk
	w/uspSFfYo3U+aygMI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgl2-000000010WQ-3j2N;
	Thu, 09 Jul 2026 04:53:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgl0-000000010Vh-1yVZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cad4170e8eso5400895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572785; x=1784177585; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rss97cjDQSVlLDw4954aQMvhSqBEsq548Tg4wWga1tE=;
        b=HaN7Paa9rNFBiuQalppzczCLv6kiIo7Tz41jKlxO49V0DjMuKq49r51Bojwum5UMmC
         j9rTA2dkCjd9c4KjotGLW8dbVfmowFb2+z5HYiQnJQR6ozp54evPYc2qaSuEawFYnN79
         y6FCvwERyptmtjtrwz0P9p3T3Z+MwTXtirA3WG2q49RAi14NHKRCsbktdyCF6ZDgS8tI
         11tpqOhPt2aZ1TIZo17eh62jwMnz5E4aH8Y/K7knrl+ndoiUws39LBOL1isaKqtXS4VR
         gmR8GYyJb6E4xZj2Iyjf4fU6vmcHBHF9n+iM6x9dfYUlUO1b4XxlGGIeugOGmd/SwB2C
         2M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572785; x=1784177585;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rss97cjDQSVlLDw4954aQMvhSqBEsq548Tg4wWga1tE=;
        b=nhIM8JQdeYqeIBf4FDejDpvbMZSGFRLxhrbJKJpUEYr5n3xlUvlZfqlxiSPb6yKU8u
         0AXJSvoOyxCb+1MbOuF174xPq2NfX+oIFPFnj3J01nhVsrIm2JE63VD6zfxHQ5pN0yKi
         5O2G888bur4R1iyWG2nhlVlM5I5stvVyHD9yw+PmYcnBnrqZJ9Arkee+xL4+1g7KLTI2
         1fkqLxdMuYLer4oBxjmuXhOdrHDZsl8U4wH3UVUZgX2sMe9Gn6P1R9B1Ed5i3XcbIBT/
         aO4NRJ1+CPNiEk7OCB/2F0WJ1HJrRqxuOsq+9IWyH/tXci2+U4CsEYte5Ari1G7Lo2ht
         534A==
X-Forwarded-Encrypted: i=1; AHgh+RoDIFsDEy9AH++oa3c3WXeIFrdpljM0OTmXukpc0baadmBiJNIR+L1Ii8/GZCIz/EBr1eJyCvjAtiB3XbpK8CYs@lists.infradead.org
X-Gm-Message-State: AOJu0YzaSXPhonVkx1BpTm28nWHL5ofpVW5VBkwO1m7eava2Z+dZpMp+
	DtJTXqK9J4WYrJhlX7jr8Mx9m/ZVYQk4WnFU40REWcPPRjjvcsVuT3az
X-Gm-Gg: AfdE7cnA25Wa+b5WmtXNZhevSCB0qX4Axq1DQSiFLEBX3n42I0nt+tsTA7r7VMz/mDp
	fYKlQkNpHqsdjWK7KwWXozcPKBIwoeL80FxoIF0nWdTFDh0M0f1V12AcKtQ3qP5Vzyb6MJZuBEd
	iUdF4UxnWp6zOSpq6eHEGKNKfaeKdKV48ao+l/Hhe7GJcY5cKJfuNGSBs31MoCeph8f+tQKQC62
	B09drx+kcdHpwTiAk33sYNQTVEwvNTIFnwfneBiL5JwetlB+OYG0YPqgsR9s30ruy5miPRDY7Jy
	eXaNkjHB8RJmoxfPro0265bZ9hkMEm6LY4QVHHslxh1nvbxxmpDp2Oyl5m7ZxDH1WLXK6pEUSsl
	ASS1hWf7sOjxT1DaoP1vJGMoogWOrFfnuQbQhbTKD+FOlYcBJIWSA25Zx8ojP++4ZjBsNW1vqlZ
	puFU+hjiznIUjik1KDvX+WrUofyG0+A2Nppkr1gYlaRW7SlOvQQdQeDb2C70Wn+d+dYVF2Pvu+Y
	zCg
X-Received: by 2002:a05:6a20:431a:b0:3b7:d9d6:9fc9 with SMTP id adf61e73a8af0-3c0bce1895fmr5924516637.2.1783572785059;
        Wed, 08 Jul 2026 21:53:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 00/11] Remove support for platform data from samsung
 keypad
Date: Wed, 08 Jul 2026 21:52:58 -0700
Message-Id: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACopT2oC/1XMQQ6CMBBA0auQWTukHYuiK+9hXDR0Cg2WkikSD
 eHuNu5cvsX/G2SWwBmu1QbCa8ghTQV0qKAb7NQzBlcMpMioVl8w25hfU4/jjB2zc8aTP5OCEsz
 CPrx/s/uj2EuKuAzC9m+hTNPqY026MSdDqNHFsMinXpKkcUjrrY82POsuRdj3LypkxtKhAAAA
X-Change-ID: 20240819-samsung-kp-ceedd4f2f720
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_215306_542979_CC78AAB1 
X-CRM114-Status: GOOD (  21.82  )
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

Hi,

This is a reworked and extended version of the series previously posted
to convert the Samsung keypad driver and Cragganmore 6410 board to
generic device properties. The first 8 patches of the original series
(general cleanups) have been merged into mainline, and this version
focuses on the remaining keypad rework and extends the board conversion.

Specifically, we rework the Samsung keypad driver to stop using platform
data and instead rely on generic device properties, and convert the
Cragganmore board to use software nodes for all its peripherals, removing
legacy GPIO lookup tables.

We start by introducing a compact matrix keypad binding and implementing
it in the driver. To support referencing Samsung GPIO chips in board
properties, we add infrastructure to register and attach software nodes
to Samsung gpio_chips. We then switch the Cragganmore keypad to use
software properties and drop platform data support from the driver.

To convert the PMIC DVS regulator on Cragganmore, we add software node
support to the wm831x regulator driver, allowing DVS configuration via
device properties. Once the board is converted, we clean up the driver
by removing legacy DVS platform data fields.

Finally, we convert the remaining peripherals on Cragganmore (GPIO keys,
PMIC, WM1250, SPI0, basic-mmio-gpio, and LEDs) to software properties.
This allows us to eliminate all legacy GPIO lookup tables, which also
fixes incorrect GPIO chip names ("GPIO<N>" vs "GP<N>") from previous
descriptor conversions.

Mark, it would be great if you could give this a spin on Cragganmore.

Thanks!

Changes in v2:
- Patches 1-8 of v1 were merged into mainline, dropping them from this
  series
- Rebased remaining patches (9-14 of v1) onto latest next
- Resolved conflicts in mach-crag6410.c
- Removed redundant "out of memory" error messages from the keypad
  driver
- Added an infrastructure patch to register and attach software nodes
  for Samsung gpio_chips
- Converted basic-mmio-gpio and LEDs on Cragganmore 6410 to software
  properties in a new separate patch
- Addressed DT bindings feedback on the compact binding patch
- Fixed proximity switch event type for GPIO keys
- Added support for software nodes in wm831x regulator driver
- Converted PMIC DVS on Cragganmore 6410 to software properties using
  the new driver support
- Removed legacy DVS platform data fields and cleaned up driver
  fallback.

---
Dmitry Torokhov (11):
      dt-bindings: input: samsung,s3c6410-keypad: introduce compact binding
      Input: samsung-keypad - handle compact binding
      ARM: s3c: register and attach software nodes for Samsung gpio_chips
      ARM: s3c: crag6410: switch keypad device to software properties
      Input: samsung-keypad - remove support for platform data
      ARM: s3c: crag6410: use software nodes/properties to set up GPIO keys
      regulator: wm831x: support software node in platform data
      ARM: s3c: crag6410: convert PMIC to software properties
      regulator: wm831x: remove legacy DVS platform data
      ARM: s3c: crag6410: convert remaining GPIO lookup tables to property entries
      ARM: s3c: crag6410: convert basic-mmio-gpio and LEDs to software properties

 .../bindings/input/samsung,s3c6410-keypad.yaml     |  53 ++-
 arch/arm/mach-s3c/Kconfig                          |   5 -
 arch/arm/mach-s3c/Kconfig.s3c64xx                  |   1 -
 arch/arm/mach-s3c/Makefile.s3c64xx                 |   1 -
 arch/arm/mach-s3c/devs.c                           |  62 ----
 arch/arm/mach-s3c/devs.h                           |   2 -
 arch/arm/mach-s3c/gpio-core.h                      |   3 +
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h           |   5 +
 arch/arm/mach-s3c/gpio-samsung.c                   |  72 +++-
 arch/arm/mach-s3c/keypad.h                         |  27 --
 arch/arm/mach-s3c/mach-crag6410.c                  | 368 +++++++++++++--------
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c           |  20 --
 drivers/input/keyboard/samsung-keypad.c            | 192 ++++-------
 drivers/regulator/wm831x-dcdc.c                    |  24 +-
 include/linux/input/samsung-keypad.h               |  39 ---
 include/linux/mfd/wm831x/pdata.h                   |   5 +-
 16 files changed, 445 insertions(+), 434 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20240819-samsung-kp-ceedd4f2f720

Thanks.

-- 
Dmitry


