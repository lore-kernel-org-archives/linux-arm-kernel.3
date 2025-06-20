Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16AFC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AoOqUmI/ukeAvOCDfitszVNrmRf7QCXDZ9hIanYDn+c=; b=aUDBGM/m3sGG+Cqa/BsY9RCwXr
	FZ1U7+UZVNW1XBcSS1Gv0u+G1wRpqSafbVZDMxauZIUYPm7Z+joFGB2VI4k+sktd0uCzRsjm16Yts
	P2VnPrKzfXKLAeXQtqk7+toUE7T7HJH1HPp2WGZkv2i5uPVDUm+FBOwwUmtz/aUQLyAd/Tj29dFxg
	EPd5SeWM12ydCTENV6RrmNu0zeWX04B72B3PCYgeF/4iMJrysRxSviRCTHDM/DPXcRt2VBymfBWcF
	N8JVReH/vPdgvo0YdiidF12MJLHDjKWe7PXRfuso8rUFQjGcxUyI2OKlteiydgckxTxd9DOQtH+22
	4WdKEweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgLG-0000000GLgp-0xsW;
	Fri, 20 Jun 2025 18:19:58 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgJ0-0000000GLKT-1E00
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 18:17:39 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747cebffd4eso1716311b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443457; x=1751048257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoOqUmI/ukeAvOCDfitszVNrmRf7QCXDZ9hIanYDn+c=;
        b=4a7AK/HY0wvwEjh9o+M0kJdgGFv66wN0X8CYpX2lAXneuZUmR3NFuTnWv1yYtnY9I+
         U2vWHLM4CAuB9Oz1j2ce2QgSMzuBFL8RPewDuUkIg/Rql5gbckiiCj+CRLOcSn55O8Bx
         yiqJ6O9cOlKUIcf8dIqONyu3AKYnhUTdGsvrNgy8gK+xaKBqiG7stO9FlglDwAwf2PJb
         YiXhjr3Rju9Ck83zAZlymAXQX+PUJYbTa2DYiERlpibSQsQGOBObEN+trpWtLbPYMCD1
         cBT56Oh/GIoohUz8XCn+uA92RtkfLNerfnAbjpIwZ7d98GLSqGa35qSp9Qyayhfmc3TM
         JcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443457; x=1751048257;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoOqUmI/ukeAvOCDfitszVNrmRf7QCXDZ9hIanYDn+c=;
        b=ds2erBCsWiacUrumzVDvqOLTI4aPOGHO/BN+F2Wxxs3FbW9lrL9DYb1Ym7vguYGc1i
         5zn99H2EANADhNnr5MkXax7AEurXOnftzFtrEUvcvfBz6nKx+VFysUE5kP/Szf7+VICa
         ot2PPqNBtwHuCxaVpo8c5f+OUWngBPckNiOaut3VgpcWtYLtGf0s/ttlwvPmCE4zmH6w
         iroXWaKkKckPhwy9nu1yTOrjAooJDxXQjPjmpL6idwF3cyJTPQnq7l1XxnSqvIrSmHFm
         mEOaGPgxwqjKd8CB6tTOPMmuE6HrHfVkmBsBMTwXPweni0Eym91sL3rdR+MksBpbAFR2
         oVpg==
X-Forwarded-Encrypted: i=1; AJvYcCVtVlAZqCqgs1Y6Tf2NfGgLrnVIeJKXmq85YcbIboqbx+eUCRPta1C+NZl8WtIoEwyLB3uF7yO2fpDkgG8KU0jE@lists.infradead.org
X-Gm-Message-State: AOJu0YyN4y76xw21pSa6WYBRqwr60ej8AoyNCzceV3XxJtGrKGGdmVaz
	JaPisH18EdtkKfqMEXgNKEeDGjaOHvO/J8bO5SkHgux7m4/yzsnEeqI70pAOLFof7Bgnm+XJeT8
	wlnWrlh9Ap1Z3YjXMEwdeRMmmZeKsZw==
X-Google-Smtp-Source: AGHT+IGLyMBA9YVtduYhTCnTre04zoapWO94rFAMkDl8DZB2kVIM8sEEP0xqi2SKfllFUVq4GFuWa2lUG16t4cETsX4=
X-Received: from pfbly4.prod.google.com ([2002:a05:6a00:7584:b0:749:d28:4ca2])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7490d64699fmr6106675b3a.8.1750443456920;
 Fri, 20 Jun 2025 11:17:36 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:03 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-1-willmcvicker@google.com>
Subject: [PATCH v4 0/6] Add module support for Arm64 Exynos MCT driver
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_111738_334378_46B59C20 
X-CRM114-Status: GOOD (  21.29  )
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

In addition, I verified that the Exynos MCT module cannot be unloaded on my
Pixel 6. This is due to /sys/module/exynos_mct/refcnt > 0. So if you try,
you'll get this:

  root@google-gs:~# rmmod exynos_mct
  rmmod: ERROR: Module exynos_mct is in use
  root@google-gs:~# cat /sys/module/exynos_mct/refcnt
  9

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream
kernel can be found at [2].

Note2, this series is based off of krzk/for-next commit a15edf91668b ("Merg=
e
branch 'next/dt64' into for-next") with [3] on top.

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main=
/README.md?ref_type=3Dheads
[3] https://lore.kernel.org/linux-arm-kernel/20250602151853.1942521-1-danie=
l.lezcano@linaro.org/

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
Cc: Hosung Kim <hosung0.kim@samsung.com>
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Cc: Will Deacon <will@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org

---
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
=20

Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Add module support

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set local timer interrupts as percpu

Will McVicker (4):
  of/irq: Export of_irq_count for modules
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms     |  1 -
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 75 ++++++++++++++++++++++++++------
 drivers/of/irq.c                 |  1 +
 4 files changed, 64 insertions(+), 16 deletions(-)


base-commit: a15edf91668beefdb5171c53fa698c9b43dd1e0d
prerequisite-patch-id: 0c5b7e9fb27295e0c125c537ac80d1eb16cef60d
prerequisite-patch-id: 6a9b683baee83ddc2b2fada31479b27b53469759
prerequisite-patch-id: b9cbd59ff2f4c905001ecb02868d20fb004034cc
prerequisite-patch-id: cdde1a76624089aa818cb35e612f880107bdc073
prerequisite-patch-id: cec67e07038c7aa93a2b53879781626d738cd199
prerequisite-patch-id: 8fda377fcaf407026f04f2a547086cf1ecf4efc9
prerequisite-patch-id: dce925ac224bb361c74fdb23126fab53e7c5c26b
--=20
2.50.0.rc2.761.g2dc52ea45b-goog


