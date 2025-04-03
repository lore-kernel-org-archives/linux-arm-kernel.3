Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8F2C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qeT474o+P1WLytoJHvSVOFMjU1o1C8S5UpX9/onC+/Y=; b=LLhau8oP40n23V
	Tc2Hg0pyYDqNFpYmPUq4XuhvsOJ6E/aWhMvnwbHL8lEUJ6/JTEjjcgDxGuP4zW+Po2KH/hYJ0PRA1
	MUCu/GCI+lMgVxOAK8obATHkY8be5t98UTFmWuAiyxQjPILGDGNE5pYB+YIqFtcZKy2m/f9HfFjsm
	+pEV60h4YhmZjcPWewRZy01+YvjnfATJKbE4BfIPljZ11jKMDoBgGnf7OK3VrbkmPpydDA1Rc6Rqh
	1K1OQtOJee41P9xCHHzINYYXl6grtsoQmvM0+zHpH+VBNd/doMS2etXUUln7HpDF7pbDFgZJ5j7ch
	vgZhVKYBxC6/3cZvW4GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GRP-00000008KEy-2d5p;
	Thu, 03 Apr 2025 09:00:51 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPc-00000008Jeq-3jyj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:02 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so1282556a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670738; x=1744275538; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qeT474o+P1WLytoJHvSVOFMjU1o1C8S5UpX9/onC+/Y=;
        b=EuSvCOqg8FDiLSGNY4zgWUh4zl/zpDcy+5HcuETLxP1t7TqSpv53QsX01W4TfXKkoK
         kSaVEj6stxeTlziqD30kQigMvpddzi54Holq5J4HgY0o4Lbk3crw3RQYkn2xn1VDRheb
         L8T7VnMZpHpFbQRKz27DZ4bScAxOQN5mZLt1QBgamW8+kmuO7pNI6ch2DFMX8PtmbabE
         2fDJbktYwlaSqVFECKGzR+8q+MBr4/+59yO5L8Rvx+QzCGOZNZNwzcHfueBvn6lBKMlr
         p/HbRmehUaVTrEwN4iyre1+7333Jkr2fgeaYuCHUVUcNeVR8fvG8sC3szf5MucEDFJcU
         0Zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670738; x=1744275538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeT474o+P1WLytoJHvSVOFMjU1o1C8S5UpX9/onC+/Y=;
        b=JHV4FiQQJ6/9HxGzv9Oku4snWZt9MMtQLGhj68/6Pw/MpDvI6qWLdK+6VWkXVSf0lX
         C8p/5lsgTOiR98G4kUTdkhHkL9LElSyxBrANQuPO+XkIEQzo36I8nEngx0NsE40s5/SC
         BvnNhy5l5gi3fo47RKNRx3rmpOUIMQupXNRvx85Yz7lYxU6K0Ap9iaJ2+CE+8hZ5lwuV
         5Wt0OOyL6v6nk21Tgx+CogkegqCGe0LWqLG/GwMSroiIZtPiC5ShXGfpjOP1NENuv1do
         kijhu5Eta+08t01onoIj8dIeStZ1RAcR9QThPfudhs6ZJmM4SS4GRvdVHJTkjU9ubC47
         4fUw==
X-Forwarded-Encrypted: i=1; AJvYcCXWzl4UL4k4MUdZaG3/L6IHPQn/18vhMNBT7NSEggQvxSfyvP7QaRvWcIma3nnFBxD9XklUe/1v4boCfKAkEdbV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9/q0cGfuX+ZgP9jA0KkL+cBwEaaierMwMHlh1brYjqSIgoGyO
	VOw2++3QPqiW6nSiRBSL4ROntoWIV3E9RAdUO7RBolK7cT8Wyj0W+M0Yum83lj5znR8jyKZnk0g
	5e8Y=
X-Gm-Gg: ASbGncsMjUxPoNUXB3OEhD60kT25bxDtVEHyLzjK8ltkGdZzVLqSInr0Eu8o20dHI0r
	URCa9h9duOfMIqdcE5WYhfOlZFJUOVWTafev9HCwigjbzWOtDY28EEf/lGjT8y3eRgRwJuDefeI
	UVIanZ4YN564mQCH2TpYiJbvevZriPNNKx5hyq4qzKYB1C19gG6QQeQT/1jWwdptCMZitsrkyYH
	BBZJdpZ96YPisY8gOzd6hCJOOI/AVYDsrL0qxspNKrZmqe8cPeMBQEXx0AakqF+rcJBHMbtcdlg
	QFWigoOtNpp5yiLQnUFjMlRXga9tnu85PGHQieJ3Dw/iBMypoRa2K9OkWInk88InQ6w5RwnSPAc
	miGZeJiy24JNQKTMmc9m9QxK+b4W4
X-Google-Smtp-Source: AGHT+IFcqnBTtWNtxVdQnxCbmWWWf9RXOD/EtzwnHUDSkLa3WrzSs3GfyFiYhJY/Wa5602oPG/K0KQ==
X-Received: by 2002:a05:6402:27d4:b0:5e7:c782:ba94 with SMTP id 4fb4d7f45d1cf-5f0931f76dcmr1184582a12.13.1743670738358;
        Thu, 03 Apr 2025 01:58:58 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:58:57 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Date: Thu, 03 Apr 2025 09:58:52 +0100
Message-Id: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM1N7mcC/1WMyw6CMBBFf4V0bc20UwRd+R/GBbUDTKKUtKbRE
 P7dQuJreW7uOZOIFJiiOBSTCJQ4sh8y4KYQl74ZOpLsMgsNugTUSkZ9GzsFktrSKbIOwaDI7zF
 Qy4+1dDpn7jnefXiu4aSW9d3ATyMpCdJBvTdYga6gOl55aILf+tCJJZL0r1h/RZ1FWxpHhNjan
 f0T53l+AWNqK8/YAAAA
X-Change-ID: 20250321-s2mpg10-ef5d1ebd3043
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015900_961060_6007CCF3 
X-CRM114-Status: GOOD (  25.62  )
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

This series adds initial support for the Samsung S2MPG10 PMIC using the
MFD framework. This is a PMIC for mobile applications and is used on
the Google Pixel 6 and 6 Pro (oriole / raven).

*** dependency note ***

To compile, this depends on the Samsung ACPM driver in Linux next with
the following additional patches:
https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/

*** dependency note end ***

+++ Kconfig update +++

There is a Kconfig symbol update in this series, because the existing
Samsung S2M driver has been split into core and transport (I2C & ACPM)
parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.

This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
talk via I2C, but via the Samsung ACPM firmware.

+++ Kconfig update end +++

This series must be applied in-order, due to interdependencies of some
of the patches. There are also various cleanup patches to the S2M
drivers. I've kept them ordered as:
  * DT bindings (patches 1 ... 3)
  * s2m mfd prep for adding S2MPG10 support (patches 4 ... 7)
  * split S2M mfd driver into s2m-core and s2m-i2c, including the
    kconfig symbol update (patch 8)
  * S2MPG10 core driver (patch 9)
  * s2m mfd driver cleanup patches (patches 10 ... 23)
  * S2MPG10 clock driver (patch 24)
  * s2m RTC prep for adding S2MPG10 (patch 25 ... 26)
  * S2MPG10 RTC driver (patch 27)
  * s2m RTC cleanup patches (patches 28 ... 31)

I realise these are many, but since some prep-work was required to be
able to add S2MPG anyway, I wanted to get the cleanup patches in as
well :-) Let me know if I should postpone them to a later date instead.

The S2MPG10 includes buck converters, various LDOs, power meters, RTC,
clock outputs, and additional GPIOs interfaces.

This series adds support in the top-level device driver, and for the
RTC and clock. Importantly, having the RTC driver allows to do a proper
reset of the system. Drivers or driver updates for the other components
will be added in future patches.

This will need a DT update for Oriole / Raven to enable this device. I
will send that out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- Krzysztof:
  - keep 'regulators' subnode required even for s2mpg10
  - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
    'additionalProperties' instead
  - add some regulators to examples since s2mpg10 requires them as of
    v3
- sec-acpm:
  - use an enum for struct sec_acpm_bus_context::type
  - consistent name space for all functions sec_pmic_acpm_... to be
    similar to i2c and consistent in this file
- Link to v2: https://lore.kernel.org/r/20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org

Changes in v2:
- Rob:
  - make PMIC node a child of ACPM, and all related changes (binding,
    driver)
- Krzysztof:
  - merge defconfig updates into patch changing the symbols (patch 8)
  - split MODULE_AUTHOR update into a separate patch
  - better alignment fix (patch 11)
  - merge two s2dos05/s2mpu05 related patches into one (patch 14)
- myself:
  - keep PMIC DT parsing in core, not in transport driver
  - several updates in sec-acpm.c, see separate entries in patch 9
  - fix typo in patch 17
  - collect tags
- Link to v1: https://lore.kernel.org/r/20250323-s2mpg10-v1-0-d08943702707@linaro.org

---
André Draszik (32):
      dt-bindings: mfd: samsung,s2mps11: add s2mpg10
      dt-bindings: clock: samsung,s2mps11: add s2mpg10
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      mfd: sec: drop non-existing forward declarations
      mfd: sec: sort includes alphabetically
      mfd: sec: update includes to add missing and remove superfluous ones
      mfd: sec: move private internal API to internal header
      mfd: sec: split into core and transport (i2c) drivers
      mfd: sec: add support for S2MPG10 PMIC
      mfd: sec: merge separate core and irq modules
      mfd: sec: fix open parenthesis alignment (multiple)
      mfd: sec: sort struct of_device_id entries and the device type switch
      mfd: sec: use dev_err_probe() where appropriate
      mfd: sec: s2dos05/s2mpu05: use explicit regmap config and drop default
      mfd: sec: s2dos05: doesn't support interrupts (it seems)
      mfd: sec: don't ignore errors from sec_irq_init()
      mfd: sec: rework platform data and regmap instantiating
      mfd: sec: change device_type to int
      mfd: sec: don't compare against NULL / 0 for errors, use !
      mfd: sec: use sizeof(*var), not sizeof(struct type_of_var)
      mfd: sec: convert to using MFD_CELL macros
      mfd: sec: convert to using REGMAP_IRQ_REG() macros
      mfd: sec: add myself as module author
      clk: s2mps11: add support for S2MPG10 PMIC clock
      rtc: s5m: cache value of platform_get_device_id() during probe
      rtc: s5m: prepare for external regmap
      rtc: s5m: add support for S2MPG10 RTC
      rtc: s5m: fix a typo: peding -> pending
      rtc: s5m: switch to devm_device_init_wakeup
      rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
      rtc: s5m: replace open-coded read/modify/write registers with regmap helpers
      MAINTAINERS: add myself as reviewer for Samsung S2M MFD

 .../devicetree/bindings/clock/samsung,s2mps11.yaml |   1 +
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  35 ++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  26 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/configs/exynos_defconfig                  |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/pxa_defconfig                     |   2 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/clk/clk-s2mps11.c                          |   8 +
 drivers/mfd/Kconfig                                |  35 +-
 drivers/mfd/Makefile                               |   5 +-
 drivers/mfd/sec-acpm.c                             | 465 ++++++++++++++++++++
 drivers/mfd/sec-common.c                           | 301 +++++++++++++
 drivers/mfd/sec-core.c                             | 481 ---------------------
 drivers/mfd/sec-core.h                             |  23 +
 drivers/mfd/sec-i2c.c                              | 239 ++++++++++
 drivers/mfd/sec-irq.c                              | 460 +++++++-------------
 drivers/rtc/rtc-s5m.c                              | 197 ++++++---
 include/linux/mfd/samsung/core.h                   |   7 +-
 include/linux/mfd/samsung/irq.h                    | 103 +++++
 include/linux/mfd/samsung/rtc.h                    |  37 ++
 include/linux/mfd/samsung/s2mpg10.h                | 454 +++++++++++++++++++
 22 files changed, 2024 insertions(+), 864 deletions(-)
---
base-commit: f58dd835f82a5dda6c9d3895ee6f15016431fb1f
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


