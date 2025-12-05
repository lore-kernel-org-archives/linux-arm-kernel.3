Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD1ED2CE01
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0a9BcMIreCW4+XPCC79kC21m2v3SL+rHpTmsJgeu1lI=; b=Hjh7vnw/N7P5MrCegXL9o8gITP
	iEtV0lUOW3KdqFEmFiHT29v11HnEsT5h34sj3Ai0+UXIHzkPmMV7NVUs5kPwPzha/cKPRTsEEVQ1V
	bEOPqml6Jd5n3manFkeHzImwfzeC8GPgpCjbFq5xaFgKUoo+kyheGAavd++SFDpzSzD26a43HQSzV
	ZbLJvrWnqi8bI/9OyfHTW7RiZ4f8GAnsAyIRnVx5a2w3XtZ0mCTUHE/BIJN3LriHYVZTlIfQYVCwz
	gP8d96J/L1AT6owc0wHOFk5//0facnnzV6yGQFcByrqz/GLWVNWOjAKPPBn/1Q7gPNfsatBsxrpj8
	VY88Od3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLE-00000008qRN-2vRb;
	Fri, 05 Dec 2025 01:10:36 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLC-00000008qQT-0C6g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:10:35 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-295915934bfso22151115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897032; x=1765501832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0a9BcMIreCW4+XPCC79kC21m2v3SL+rHpTmsJgeu1lI=;
        b=qDbvgQZPt3kvord3z0n7jq4ObENZpZqnXgSRPiWbcJU9j2hWkAM1+uUg+MY0va7Zfm
         GwMdcMjmFM9V4gdnsd0LFzpJtMaJdF8/Megtm3NjtWBcl2/gEXhzDVLl6JG2xOu0/z7n
         /8gth674CbNpc/sd7nbhn7/2EGNiMD4Xg2o5brfKH79qSmtXoATaiSWQYlJkVMvyqJiM
         bj1K8bvqyFvGgAIl0dd3rHrXuNdZvy5egwLjQI45AHK456qMG+tPbTs6iubimO6zOsam
         mLymS+SvwJ9z7CEcRfsnM65JGZ68s9qylqMWQalG3GpTcT9M36AwqgGHXxFgOPkG8G9v
         UHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897032; x=1765501832;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a9BcMIreCW4+XPCC79kC21m2v3SL+rHpTmsJgeu1lI=;
        b=qxgq+Dp9RiTZPHUagOJQhm3bRwWgAMvkUFb1WNHOPzZTo42/uYAVr6w0Wm7i3KiFh4
         huAQOpc8TOZ6ZS0HPe/XmNVCeKC9WXTzoqgpYVfurVRH2XDX9V0f/KZ8/78DAT+t7t8S
         GbYP7G5rksBmmpv93jkZMFpZ68rupOEl1GxQUtyDvr9UjJH/r03MkKjgmZFK8QZzpXmS
         QbK11WgrywnIMjFYDd8GgZeSa99G0dsbzaZowBNiyGP5EosrDTA1FLK8qGZGoZXKQik3
         C9ugSru6e6l7ETARIzSK+2R+OXY0VR76krmsckNsgUuRwA0pr605ZjPcdm7toQbiO6gc
         IejA==
X-Forwarded-Encrypted: i=1; AJvYcCX+VckZSRlw4T8LK90PaHxh2M+HtMETfOHbTKN+ytrCh01ayy/ucPijDYqA2C7A+gpTO7ceM5CzTnt0X6fJBIcI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/DUKEWAEFReCIDhI1CMvj3wnCD1C27kGA/Hitx0dLuSkdGn+a
	vLRzPVHKOGrGLCxYMrZwUE4OitVgnN186DTRrIpS7lO27sD+901+ZbkepMD+PBa/L+T8IoynHTr
	P25FhechrXPCvRWNPEvntsOvbZeiMlA==
X-Google-Smtp-Source: AGHT+IEjP0N5xs+xBNnphbRYDosC8i2Rg8/XLir7yaw0gap7gjtVgDvzQj6P8ZnliWmsUFtD4fTKRgqtbH2Nw+M58n0=
X-Received: from plhz18.prod.google.com ([2002:a17:902:d9d2:b0:29a:1de:14aa])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:40cb:b0:295:ac6f:c899 with SMTP id d9443c01a7336-29d683ae56fmr95984665ad.47.1764897031708;
 Thu, 04 Dec 2025 17:10:31 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:13 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-1-willmcvicker@google.com>
Subject: [PATCH v7 0/6] Add module support for Arm64 Exynos MCT driver
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>, 
	Youngmin Nam <youngmin.nam@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_171034_116676_6E5B5F05 
X-CRM114-Status: GOOD (  24.37  )
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
timer as the clocksource. Once the Exynos MCT module is loaded and the devi=
ce
probes, the MCT is used as the wakeup source for the arch_timer to ensure t=
he
device can wakeup from the "c2" idle state.

These patches are originally from the downstream Pixel 6 (gs101) kernel fou=
nd
at [1] and have been adapted for upstream. Not only has the Exynos MCT driv=
er
been shipping as a module in the field with Android, but I've also tested t=
his
series with the upstream kernel on my Pixel 6 Pro.

To the driver changes (both as built-in and as module) on Pixel 6 Pro, I ra=
n
these tests:

# cat /proc/interrupts | grep -E "mct|arch_timer"
 23:       6823      10938       7795       5607       8935      12828     =
 21947       2200    GICv3  30 Level     arch_timer
104:          1          0          0          0          0          0     =
     0          0    GICv3 785 Level     mct_comp_irq
105:        547          0          0          0          0          0     =
     0          0    GICv3 789 Level     mct_tick0
106:          0       1333          0          0          0          0     =
     0          0    GICv3 790 Level     mct_tick1
107:          0          0       1467          0          0          0     =
     0          0    GICv3 791 Level     mct_tick2
108:          0          0          0        583          0          0     =
     0          0    GICv3 792 Level     mct_tick3
109:          0          0          0          0        206          0     =
     0          0    GICv3 793 Level     mct_tick4
110:          0          0          0          0          0        153     =
     0          0    GICv3 794 Level     mct_tick5
111:          0          0          0          0          0          0     =
    13          0    GICv3 795 Level     mct_tick6
112:          0          0          0          0          0          0     =
     0         87    GICv3 796 Level     mct_tick7

# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
arch_sys_counter

When built and loaded as a module, you can verify via:

# lsmod | grep exynos_mct
exynos_mct             20480  9

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

Note2, this series is based off of krzk/for-next commit bca42080637c (Merge
branch 'next/drivers-late' into for-next).

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://gitlab.com/LinaroLtd/googlelt/pixelscripts/-/blob/clo/main/READ=
ME.md?ref_type=3Dheads

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
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
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---

Changes in v7:
- Dropped v6 patch 1/6 that removed __init from register_current_timer_dela=
y()
- Refactored the init function in patch 4/7 to handle the case of registeri=
ng
  the timer delay function for ARM 32-bit systems from an __init tagged fun=
ction.
  This addresses the original section mismatch issues reported in v4.
- Rebased series onto base commit bca42080637c (Merge branch
  'next/drivers-late' into for-next).

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

Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set percpu local timer interrupts for
    ARM64

Will McVicker (4):
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  clocksource/drivers/exynos_mct: Refactor driver init
  clocksource/drivers/exynos_mct: Add module support for ARM64
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms     |   1 -
 drivers/clocksource/Kconfig      |   3 +-
 drivers/clocksource/exynos_mct.c | 255 ++++++++++++++++++++++---------
 3 files changed, 182 insertions(+), 77 deletions(-)


base-commit: bca42080637ce3a21092fc0f7d5411e853b0c3b3
--=20
2.52.0.223.gf5cc29aaa4-goog


