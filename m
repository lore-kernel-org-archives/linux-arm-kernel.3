Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F292CF9C7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6gYwj93ryFPGdFky83dYYS6ZDTHJJpU1AWJipT2S26I=; b=oai1YKrzhwqyS5/nRtr0otC+fi
	V0vRnoqzsw6RDBysZjivH0k152tPVIasVR4DOgws3bAlj7XDPIsTMiwviz7XJ/Pxnp5W9smC85ab1
	z4RBU0b6nXeuXNXzTV+UtolHw2pmG+YX2lj+6CkbZrcQPLRy4U2eKNcTg063zxtTw/58mYAKR4qX8
	EYpt8a+X7QwQTRAeJSRszcwhd6r2vXTupe+HDEMf1xakx4Nckm8ycQdHHjibTaGuUT4zriaXMPt0M
	JMF/PU5nIaDEv3bq5tHoA5eLHBF9JePYxoEL5SeTu8xEHVaEyDUb/Q/PFrRiclv9PmQuY/KffHIdZ
	Amgkmulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cM-00000007Ees-0ruv;
	Thu, 20 Nov 2025 18:42:54 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cJ-00000007Ee0-2JHB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:42:52 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so1346940b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 10:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664170; x=1764268970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gYwj93ryFPGdFky83dYYS6ZDTHJJpU1AWJipT2S26I=;
        b=J7og3lHQMtU0oRxMVZeJoEVC7P8Gr7SGdpBb6fREDmNBnKZU2NSxgS5iY8ln3/rdDq
         b+j2z6VJWP/lYc1FPXqR3Ph1cHjrnPAyzr6ojjEJg2IRCJOByXcPMqZTSUJkphhp0Y0f
         Y5yKD84icv39x0oOMzzoR30lw2aI9SP4c+8IID2O1GCgMJb8SDWdJXHM5G7yr+jy4v6b
         6e6e3nlK+I59yDWVumEggcinFpZe93TdIkLRxi1eGm3edJXZsByrg4iMXLcLi5sHMF2W
         IMkbIi1+0EapPzTIzjGT75WpgW/m89KDzhCKx2L47ZiJ9/1kvEoiDrxhdmcbK7/j//D5
         PGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664170; x=1764268970;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gYwj93ryFPGdFky83dYYS6ZDTHJJpU1AWJipT2S26I=;
        b=J4uxkjo5UEFKBme32cv3HuRdPLjxEEOxCRw22M610XrzBc9cTHL8yafY+V9ZSqir9W
         9uaotXVQG/zK4qxUp6JryH4zGM+fKvV8W/DyqHxLYJquxqVbATMXFiVoE08J7hDR5GSk
         ryIAE4DES8XTgHblhO9YYRmHNLb+wqbLRpgaDe6bswE+2/f7QMNgsAozbv0LiQhpi48i
         rOciCIcvNii+tIbRhZAuWcNSXKIiStKDwzvRpqN4kC+mW1Z++x+ADqYNwWG2h96ziwAR
         UOK72r5fMi/0kVZM9l7IJ9M/0dIy83brvyc/OtMjfTReYE2kp1uAvIyYCxIpSsGoZybs
         ZGdw==
X-Forwarded-Encrypted: i=1; AJvYcCUc/bXyoRSwdeuAKBkQTbpjla3WeLnGmo1J97UQnJkjrm/OqS4e7jwCKqYiPS6Pa+XRkzS/u3Sgxi1udZy8lLh0@lists.infradead.org
X-Gm-Message-State: AOJu0YwoiqVnW/v5aqNSCTkzel4/u9wc8nVGCJTCvz0iZI0MUkH/rg+g
	eKX/bP+Df0PYspUzI8WyaVw/ZVaI8phXPiJwYwQU12UBA8booS3DedW2VhgihoOvWeipVoj4+ML
	hk12dRj0Mg6S9Ikqs857VCE4tMA8bcQ==
X-Google-Smtp-Source: AGHT+IHBVvm88wDn5w9S/JgfQwmp8U4yjEebgPqVtkfCZPcAEjVOcZZqXsldQdYTy6V83y17yFgNAmg2NtnLTj286K4=
X-Received: from pgbfe22.prod.google.com ([2002:a05:6a02:2896:b0:b6c:b966:bd27])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4310:b0:34f:e712:349c with SMTP id adf61e73a8af0-3613b5f0d67mr5706552637.35.1763664169953;
 Thu, 20 Nov 2025 10:42:49 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-1-willmcvicker@google.com>
Subject: [PATCH v6 0/6] Add module support for Arm64 Exynos MCT driver
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_104251_598281_8CF7CFF8 
X-CRM114-Status: GOOD (  24.60  )
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

This series adds support to build the Arm64 Exynos MCT driver as a module.
This is only possible on Arm64 SoCs since they can use the Arm architected
timer as the clocksource. Once the Exynos MCT module is loaded and the
device probes, the MCT is used as the wakeup source for the arch_timer to
ensure the device can wakeup from the "c2" idle state.

These patches are originally from the downstream Pixel 6 (gs101) kernel
found at [1] and have been adapted for upstream. Not only has the Exynos MC=
T
driver been shipping as a module in the field with Android, but I've also
tested this series with the upstream kernel on my Pixel 6 Pro.

To verify the module on Pixel 6 Pro is used and the arch_timer is used as t=
he
main clocksource, I ran these tests:

# lsmod | grep exynos_mct
exynos_mct             24576  9 [permanent]

$ cat /proc/interrupts | grep -E "mct|arch_timer"
 23:        222        171        211        139        184        124     =
   825        378    GICv3  30 Level     arch_timer
117:          1          0          0          0          0          0     =
     0          0    GICv3 785 Level     mct_comp_irq
118:        228          0          0          0          0          0     =
     0          0    GICv3 789 Level     mct_tick0
119:          0        351          0          0          0          0     =
     0          0    GICv3 790 Level     mct_tick1
120:          0          0       1490          0          0          0     =
     0          0    GICv3 791 Level     mct_tick2
121:          0          0          0        325          0          0     =
     0          0    GICv3 792 Level     mct_tick3
122:          0          0          0          0         97          0     =
     0          0    GICv3 793 Level     mct_tick4
123:          0          0          0          0          0        150     =
     0          0    GICv3 794 Level     mct_tick5
124:          0          0          0          0          0          0     =
   188          0    GICv3 795 Level     mct_tick6
125:          0          0          0          0          0          0     =
     0        157    GICv3 796 Level     mct_tick7

# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
arch_sys_counter

I also compile tested for ARCH=3DARM DEFCONFIG=3Dmulti_v7_defconfig with th=
e
following debug configs to ensure the section mismatches are fixed:
  CONFIG_DEBUG_SECTION_MISMATCH=3Dy
  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set

Any additional testing is much appreciated!

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream
kernel can be found at [2].

Note2, this series is based off of krzk/for-next commit 870f6ca955ea ("Merg=
e
branch 'next/clk' into for-next").

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://gitlab.com/LinaroLtd/googlelt/pixelscripts/-/blob/clo/main/READ=
ME.md?ref_type=3Dheads

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
Cc: Hosung Kim <hosung0.kim@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Cc: Will Deacon <will@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---

Changes in v6:
- Updated module support to only register the MCT driver as a platform driv=
er
  for ARM64 to ensure ARM 32-bit SoCs continue to probe the MCT driver very
  early.
- Squashed the percpu fix suggested by Marek Szyprowski in
  https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung=
.com/
  together with patch 3/6.

Changes in v5:
- Fixed section mismatch issues.
- Addressed Arnd's concerns regarding potential issues with unloading and/o=
r
  unbinding the driver.
- Fixed SoB concerns to clarify the development chain from AOSP to Linux.
- Pulled in https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprows=
ki@samsung.com/
  to limit percpu interrupts only for ARM64.

Changes in v4:
- Missed the "v3" string in the previous series for the actual patches
- Re-generated patches with --base a15edf91668beefdb5171c53fa698c9b43dd1e0d
  for kernel test robot.

Changes in v3:
- Rebased on top of Daniel's timer modularization prep series [3] and
  krzk/for-next commit a15edf91668b ("Merge branch 'next/dt64' into
  for-next")
- Added owner references to Exynos MCT clocksource and clockevent objects.
- Dropped #ifdef MODULE conditional section in favor of just using
  module_platform_driver() which will properly handle setting up the
  of_device_id table based on if the driver is built-in or a module.
- Update commit message for patch 2 based on John's feedback.
- Dropped DT change from v2 as it was picked up by Krzysztof for CPU Idle.

Changes in v2:
- Re-worked patch v1 5 based on Rob Herring's review to use the compatible
  data for retrieving the mct_init function pointer.
- Updated the Kconfig logic to disallow building the Exynos MCT driver as
  a module for ARM32 configurations based on Krzysztof Kozlowski's findings=
.
- Added comments and clarified commit messages in patches 1 and 2 based on
  reviews from John Stultz and Youngmin Nam.
- Fixed an issue found during testing that resulted in the device getting
  stuck on boot. This is included in v2 as patch 5.
- Collected *-by tags
- Rebased to the latest linux-next/master.
---

Donghoon Yu (2):
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  clocksource/drivers/exynos_mct: Add module support for ARM64

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set percpu local timer interrupts for
    ARM64

Will McVicker (3):
  ARM: make register_current_timer_delay() accessible after init
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm/lib/delay.c             |  2 +-
 arch/arm64/Kconfig.platforms     |  1 -
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 87 +++++++++++++++++++++++++++-----
 4 files changed, 78 insertions(+), 15 deletions(-)


base-commit: 870f6ca955ea3f23b4d7824c815c81180a6d7c48
--=20
2.52.0.rc2.455.g230fcf2819-goog


