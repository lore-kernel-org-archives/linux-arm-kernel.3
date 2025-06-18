Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B64AC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zRoaCj6hoTPJxaDDV3mKgmJ3Npn8sA7fvAWlw4tbnTU=; b=LmKRAiDVFmYDMT6ubEW1UKjIKG
	FdRR8aiNc7YIIz989VgO7UaRea8OPuTqWmyHmtUW6wFHWGKjtwgCJgt99oVa/nYLOP75BDzMl/bPr
	JcQjxKiIaHMK5m1FkgK2MgfyTqcKLxxMDxGQc/RJl5lYFlJ0btUSySDUdQmPsED0eV70Znh8I5Eny
	FflYzpsZant/LsoIivYPn04YHDx0S2TxJyu9GIs73mxol+OeYS7VX6WwOVLcw7uL7j2cZRbulAVCU
	prKtnYpuVsupAvaWOTQ7aT+WHbro6SWwAt5TUtaLnHLV5wYQ+qQWcEvAr8w9jnVHr19+P6nujN1cA
	W7mcUnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS05g-0000000BPdt-2GBo;
	Wed, 18 Jun 2025 21:13:04 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS01g-0000000BP3z-41dD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:08:58 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747cebffd4eso48084b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280935; x=1750885735; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zRoaCj6hoTPJxaDDV3mKgmJ3Npn8sA7fvAWlw4tbnTU=;
        b=TSXpWflR/7aK+oe493YveGJ/+0hXYOv5pUxmDF0D4YWEYw/pGdRp771ORNRYuVKnXt
         mTTLgzby839HboSW3mocvNlOAG3hva/C2IHt6urqJb6avvqVHLpwHwrcr5qy21TUudiA
         fUsvAtjyxtGfCpQqLWGNrXC6VPak7VpzCb8de6svQRBClqtE2P9/Fxgm6P8mX+pNUMYL
         vwEC9c2qAj5nfydXwS6M8DKhsZxp4iZTYirVsQzVE97BbJ9wFDafAgrNozcEJ7HVu09R
         XEKS4A1QVWjoT3Uqzdw74wlkx5ytaje22YhIrx1uDZLH7oflKhIGSg3CBIFieDfTVIGm
         SArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280935; x=1750885735;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRoaCj6hoTPJxaDDV3mKgmJ3Npn8sA7fvAWlw4tbnTU=;
        b=PsYYP0MOm9RDY2w/kDUY8Elft0O0FG7oruyxbSurbIU5oIIJEvMx8DcHOBbcFMbSlZ
         jmVL1+1RU1DhjEDk7O05bMG9sFgKDUffsdgLDCjdXC/AignE5zz+XKOy6ucBUweFAUob
         XkZ1YqBiE1Ur3ID6sjVAOV5Snwc8w36H1wg6cXkTLdWbW6Jig1AmGboL/gp9teWN0ahg
         +mSF9AjNlKqc+nrAINn9zu+RPY4+DfsO6z25XwBG5OaXxhoF/SjDPvnSGVXvcVqvfoV6
         Me5lIpxoSK/c261ZaB3kGAKeQq04ZLflt4ACLssyLcgbGsEIbRMfi+UnIy/XFkCbv1w9
         q5qw==
X-Forwarded-Encrypted: i=1; AJvYcCUOaKCUOG92LiLNxSXfJCLA/hQqP48qwaB7yIeaqf5eMGYVRGn2UkNkR7EnL4VvEf2wY5lP3o9b6mdxk2g4Yv0D@lists.infradead.org
X-Gm-Message-State: AOJu0YwUmbxUyYaCQVjzzJAXjCFkclSDyXoZEOvOAzYWogd2dZT3XyJG
	FXdddAI+nJfquPtlCUL5MULBoHNOxnxoi2YjFstiHX1LXSZK3d+JbAl8KxOxNr9z2ecfjY3ymZc
	xndpP1c4zbQ5HT4EsK2DofygvAJ1qNg==
X-Google-Smtp-Source: AGHT+IHM4S67QrX8m1RQpKcEdli21K1Bw8q46eAiayWAixmfo6GxjxzG/TdPG1taUNLCEpzBbx7ZQPCg2BlL67kHZ7s=
X-Received: from pfkq15.prod.google.com ([2002:a05:6a00:84f:b0:748:55b9:ffbe])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3d10:b0:740:aa31:fe66 with SMTP id d2e1a72fcca58-7489ce0d39fmr24849663b3a.4.1750280935227;
 Wed, 18 Jun 2025 14:08:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:37 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-1-willmcvicker@google.com>
Subject: [PATCH v3 0/6] Add module support for Arm64 Exynos MCT driver
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
X-CRM114-CacheID: sfid-20250618_140856_999340_EFFDA900 
X-CRM114-Status: GOOD (  21.15  )
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

--=20
2.50.0.rc2.761.g2dc52ea45b-goog


