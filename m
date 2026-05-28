Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E325CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 11:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sTljh5Yor4x9Y98TqyToIfZ8DqI5N2KTzHMALPWuyls=; b=C3jrOp3Pi1UXj/
	xQ2T+JEsXSu0PJpRfwAxbLW4DKsUn+9hQEJjO3MEtzTAhTxegjK3FidYWc4O2MZtUZE8U5csTWgi2
	l2jWw/aKRmWJSwplBAQtDd02qwmyJrsMD+bMhJJLbfuh2nFvh2sIZ2+0CvDdbUUMLkfvbMMTmEJlx
	3FgEogDOCwBUirX8vJXQ+8zz3dK6C+asb5Gs+P4Zpxp2DRM3MoZJy9d2eZUpcWQo9/G/cH9wOz/IL
	angaVkk2oQQlb9l4zXWLfAZOFLGocd8dUtUmUQwNT6pW6H1Jlz0iTv1wVyBV3wPRuKoIli+R9qse/
	OhofTiOuF2/WWwbUxRJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ2I-00000005fMd-2kbv;
	Thu, 28 May 2026 11:36:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZ2F-00000005fKm-2JNz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 11:36:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48fde648a71so84392805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779968181; x=1780572981; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTljh5Yor4x9Y98TqyToIfZ8DqI5N2KTzHMALPWuyls=;
        b=zA7aWYJHT705OtsuN9oNA3wWzxOxwFydIOGCb1o2gkXV0omsWNv/G+U4vNkYrRrjXj
         gtnhiCS+i5PNNckFTuqm5aiBFbj2MqrnkeJ9d8RxUWMkUfZNZ4WpU8erWIRWnT0FKpbJ
         jmEeVplkxLufMQBdCV90WzNQvJe2aQV0xTzSo/6qCXI2kIOiAvly+BdKB7kflb+hIoKJ
         PDkK4kc84hpEZ+oFC2pLE3hV1JPDvHu0m5GzOq+Noqtysov1RLuVVHNj0I+kqzKZrvS4
         tZW1BM08NdO7oXl2smEIuHdvh/sbO+ey/DgNHVGnp1Kan9jw62UdH52/HkvU0OyypMmJ
         QIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968181; x=1780572981;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTljh5Yor4x9Y98TqyToIfZ8DqI5N2KTzHMALPWuyls=;
        b=p6Upysh07YqJ0jdC6uEyiHiSXSYLUYA4T3tmRgMAf2p0cLVpOBitUYGYjw85pvreV9
         Opn6MgFnqqORAPCeP2HLoYM+c+yv2e6HA7/L9zYr2wljqS2P0/q3N0g4wj0bXvEHlNIQ
         bCZiPWNJYc6uZMASsRSevQPBalFmxS/qfMDdCHZTyRy1oBQwkH6e0vTPx95TjBQTTwJ6
         j1o8k+6YEjeBYRjP0gRLQTgx7txGevWI9FZ6DXR9dNie2mG4WVPKklnfh5DCP3ZA12Ew
         qqP7quxL5ot0jaj0/X9xqJZZBAyOk5VhrWVVGiQjuK4Hvp6Qt1Grxs1JDaD23LIesLSt
         xE6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gHSXp9nMT+hjqH/xTr7g5ldYyak7Ub/r9/bHY68txQm2fOiFKT6UJv/rPWSI6w/p/VKD/4UorxxSZrv89DI8K@lists.infradead.org
X-Gm-Message-State: AOJu0YyYRv68sowUkr4WTlmGjuK9H/5gRgZt3GjiI5NvW7SNkgugdhPV
	GlcH/eIflKsE1xzp/ZOEn7gptjGTlRMKAOUVKbgcbo/LhfrGLcuvk3OT/XOzIQdVqdI=
X-Gm-Gg: Acq92OEE3Sbfi/zf/KGwOgBdsK3ZeRWlWzfmozpVMsHyl9qV2FUzel6ir6CUErP59S4
	GG8XdZK4FwNCg1/0Qat/xcJFybOdRsCJXV+dF9hpUqasJIn36aEQWp9TZvBeVtne7HKqxA/CYQz
	LkvTPbDa2Q3ICUeYnd7pd2p3jgVp2XN4CO83qmYU5cdl4wS0AVce+MFcaG5lijln4pJ99sc4rXH
	PuKxFLNyTXejV/PXbEpHJd2tq2EJrj/mWienP+SIVhvSkvddZruPegtfmwjFKXAQpYj+mLePUaF
	WUXTDbebrWO52zQIywYQ6CX9e/fh3Mgq83Ry3lirtsax+yDIN/qIXKI3jR1rffibcEICypJfIE+
	3rr8bcn+oJpnRDRqxUf/8nUt/NCOPJVLj7a782FoFW9duID/u9j1B+Ludon4rRf76U8dsNdbdIK
	6jUvAXoVraTDSAe2UmMIuWuY/O6WvQSAvb/rd6Mbsz7bV0bBcFdGX+28o4IVYCGeYzdWkmHiPwe
	xGWDb9bySrYuSoARaozsIVCCgJr
X-Received: by 2002:a05:600c:1d99:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490947b5242mr17385785e9.14.1779968180934;
        Thu, 28 May 2026 04:36:20 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm60385715e9.12.2026.05.28.04.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:36:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v6 0/5] thermal: samsung: Add support for Google GS101 TMU
Date: Thu, 28 May 2026 11:36:13 +0000
Message-Id: <20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK0oGGoC/2XRQW7DIBAF0KtErEsFM4Ahq96j6sLGQ4LU2Cl2U
 KvIdy9OW5nKy4/mfWmGO5soRZrY8XBniXKc4jiUYJ4OzJ/b4UQ89iUzEGCElMhbf73w+XLj0BD
 IIAg8dqyMXxOF+Pmoen0r+RyneUxfj+Ys19e/ErWVZMkF94G06R2SE+HlPQ5tGp/HdGJrS4Zau
 kpCkSSgtaiCUN7sJG5SgagkFom9t+QwiA72UtWyWjmrIm2nXbBaWYNqJ/UmNehK6lXq0FODrtF
 A/+Tyc75EH7fyAfPvDZflG7JbycaeAQAA
X-Change-ID: 20260113-acpm-tmu-27e21f0e2c3b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779968180; l=6403;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fg7EB7vCgH/aDoFQebtSPxlUJ04hl+rFx5FdoRGOgAo=;
 b=ES5Dl/rGG+zwLpvXmICNTcyH1wd/NaJbYjKSYbS07sLbC0VcAxaWe3auzY3pw6st2X7RzaRXm
 RSN1HIj9XiMC84OlzyOhjn12bJncIuk8n6ItrF1haJYhhJ3/+avF+zO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_043623_661756_60A28C11 
X-CRM114-Status: GOOD (  19.62  )
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

Add support for the Thermal Management Unit (TMU) on the Google GS101
SoC.

The GS101 TMU implementation utilizes a hybrid architecture where
management is shared between the kernel and the Alive Clock and
Power Manager (ACPM) firmware. This hybrid ACPM TMU architecture is 
also present on other Samsung Exynos SoCs (e.g., AutoV920, Exynos850).

Dependencies
============
The set depends on the ACPM TMU firmware helper driver that was queued
via the Samsung SoC tree:
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git, branch
next/drivers.

Krzysztof agreed to prepare a stable tag for the above in a few days
(after the branch is processed by linux-next).

The bindings, driver and MAINTAINERS are expected to go via the thermal
tree. The dts and defconfig patches are expected to go via the Samsung
SoC tree, after the bindings and driver are queued.

Architecture Overview
=====================

The hardware supports two parallel control paths. For this
implementation, responsibilities are split as follows:

1. Kernel Responsibility:
- maintain direct memory-mapped access to the interrupt pending
  (INTPEND) registers to identify thermal events.
- map physical hardware interrupts to logical thermal zones.
- coordinate functional operations through the ACPM IPC protocol.

2. Firmware Responsibility (ACPM):
- handle sensor initialization.
- manage thermal thresholds configuration.
- perform temperature acquisition and expose data via IPC.

Sensor Mapping (One-to-Many)
============================

The SoC contains multiple physical temperature sensors, but the ACPM
firmware abstracts these into logical groups (Clusters) for reporting:

- ACPM Sensor 0 (Big Cluster): Aggregates physical sensors 0, 6, 7, 8, 9.
- ACPM Sensor 1 (Mid Cluster): Aggregates physical sensors 4, 5.
- ACPM Sensor 2 (Little Cluster): Aggregates physical sensors 1, 2.

The driver maps physical interrupt bits back to these logical parents.
When an interrupt fires, the driver checks the bitmask in the INTPEND
registers and updates the corresponding logical thermal zone.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v6:
- defconfig: reword commit message (Krzysztof).
- bindings: make samsung,acpm-ipc a required property (Krzysztof,
  sashiko)
- address sashiko's review feedback on the driver:
  - ensure that the loop continues to disable the rest of the sensors
    on the teardown path in `acpm_tmu_control`.
  - avoid leaving the hardware in an active state during remove by
    s/pm_runtime_put_autosuspend(dev)/pm_runtime_put_sync(dev) in
    `acpm_tmu_control`.
  - initialize `acpm_temp` in `acpm_tmu_get_temp` to mitigate the risk
    of exposing stack memory.
  - fix race condition in `acpm_tmu_update_thresholds`. Guard 
    `was_enabled = sensor->enabled;` with the mutex held.
  - prevent keeping the sensor disabled on a threshold setting error
    scenario.
  - allow the IRQ subsystem to correctly detect an interrupt storm by
    returning IRQ_NONE.
  - devres ordering in probe, eliminate a UAF by moving the IRQ request
    after registering the zones.
- self review on Kconfig:
  - add `depends on HAS_IOMEM`, due to `devm_platform_ioremap_resource`
  - add `default ARCH_EXYNOS`, based on Krzysztof's patch from:
    Link: https://lore.kernel.org/linux-samsung-soc/b20c560f-4bc3-4686-9c91-36d93f1535b2@oss.qualcomm.com/T/#t
- Link to v5: https://lore.kernel.org/r/20260525-acpm-tmu-v5-0-85fde739752e@linaro.org

Changes in v5:
- no changes, rebase on top of krzk/for-next branch.
- Link to v4: https://lore.kernel.org/r/20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org

Changes in v4: address sashiko review:
- thermal driver: avoid mixing mutex cleanup helpers with goto statements
- firmware, tmu:
  - remove __packed from union acpm_tmu_msg.
  - return ERR_PTR(-ENODEV) for devm_acpm_get_by_phandle when
    CONFIG_EXYNOS_ACPM_PROTOCOL is disabled. 
- Link to v3: https://lore.kernel.org/r/20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org

Changes in v3:
- thermal driver: use .set_trips() instead of .set_trip_point()
- new cleaning/prerequisite patches for firmware/acpm:
  - firmware: samsung: acpm: Make acpm_ops const and access via pointer
  - firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
  - firmware: samsung: acpm: Consolidate transfer initialization helper
- firmware: acpm: TMU helpers - check return value from the firmware
- overall change: emphasize that the ACPM TMU hibrid approach applies to
  other Samsung SoCs as well (Exynos850, AutoV920).
- dts: drop active trip points, update trip point values
- collect R-b tags
- Link to v2: https://lore.kernel.org/r/20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org

Changes in v2:
- architecture: switch from a syscon/MFD approach to a thermal-sensor
  node with a phandle to the ACPM interface
- bindings: address Krzysztof's feedback, drop redundencies,
  interrupts description.
- firmware: introduce devm_acpm_get_by_phandle() to standardize IPC
  handle acquisition.
- thermal driver: drop compatible's data and use the static data from
  the driver directly.
- defconfig, make EXYNOS_ACPM_THERMAL a module
- Link to v1: https://lore.kernel.org/r/20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org

---
Tudor Ambarus (5):
      dt-bindings: thermal: Add Google GS101 TMU
      thermal: samsung: Add Exynos ACPM TMU driver GS101
      MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
      arm64: dts: exynos: gs101: Add thermal management unit
      arm64: defconfig: enable Exynos ACPM thermal support

 .../bindings/thermal/google,gs101-tmu-top.yaml     |  69 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 136 +++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/thermal/samsung/Kconfig                    |  19 +
 drivers/thermal/samsung/Makefile                   |   2 +
 drivers/thermal/samsung/acpm-tmu.c                 | 571 +++++++++++++++++++++
 8 files changed, 824 insertions(+)
---
base-commit: 0d177c93e6fda86a96642e51131e1db173277957
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


