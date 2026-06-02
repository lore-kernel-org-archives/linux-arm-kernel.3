Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DF3CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mi7kVezCcDvg8qXbli6L/hgVp0yagoLhCnZtW1BhRxA=; b=yVloCT0EEdN2ir
	phHQd15ZCWrKLoTw5tYjiWKpdH7umBNE+mdua3atrPdHedqew+3majRKzCX4dGuG+DfELUWD1/PgK
	5kcB3i5B8TUcuwvsrx3M2FS5AN/G06xkWQpqQAIKGcbx0owU5hEA1ZkZ7mA7zoYUc72/o2kFQkULa
	ZbRgtzSTEcJBHlMry7Ull3I7B+j88UQ/9c8d21G93C1f8DLL1I7ev4fOpqGB9xC3IQf8Ddf7OdiW/
	NMJRis0PMEgFGh+9TE7DiiHdE0xyTvHfCcuIAz5Zd5X5dfuAX+XUDu73XSLcpdnzfSf5JCl5cp38w
	RgYS/gKX3apqOyI1UVSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSU4-0000000DW6b-0c8O;
	Tue, 02 Jun 2026 17:00:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSU1-0000000DW53-3K1V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:00:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso116925175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780419651; x=1781024451; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mi7kVezCcDvg8qXbli6L/hgVp0yagoLhCnZtW1BhRxA=;
        b=odV1xuGKz6nAKtMHxXfgKYTtowNymGP02bP1bLC2t7brH7PEHlcRMv/MuGfWJSzTi1
         50jLgMIxeq9otVkSrVGekm2UeQ6j50SraQ1scXrr1RrvtzhBdlirQOcVKtXx/yg13f1B
         2tTp2ZMwIrkNCEpinCIkLDPiwjkjjckIzibTr/iLPfdJz3viFGFrQyUs0zEoAk5dm0iL
         YiQKzPfbF+vAjduBDJk7m2oKvblMyQt6FWaN6XVrxvQoG8UUOBMqKs5WguZodIos1JYf
         LgvqKMunBkUL57jrXt1Bx6DjbhFQsPAQd7qTbZ8pZVFAmkeMG0SLeEfUjRuw7z++fG3u
         Acng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419651; x=1781024451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi7kVezCcDvg8qXbli6L/hgVp0yagoLhCnZtW1BhRxA=;
        b=mgN9jS1BB0G4W3NsTgF7MGQkhIZzVDZn14inu8SKOFMkpddxlDty02EiWssVbvLRJB
         wCCjJnuRLHwJ6t+QdUtAxIz7LvXb5cgLYSUS7hqAY8bEgEWRmL9Kc3kRxNpPHAIxaSaY
         39ylzFxaafoG5XMycqPVmt0ohwKOEMzC6uZadRk332LpkH33RIHgypEZB4CJZkEcO7B0
         4P0VdvmFGu1/7BE+QSG7aRFl6PEVN4ANVI1Ni2aACAUmjPgxBcQSqMB8UbEryQ1dnv6C
         UTgPSr1ubaoOJE/gshvkw2V2v39/Qz8YZuoDHm6sNADURIVlD5AEN14bN7/BnDLgDzJB
         QdFw==
X-Forwarded-Encrypted: i=1; AFNElJ/WaG4OoKjVenb99pcph5PjUjGxGxGn8iwSfoB+/wToxCvcfUGsvglA7Ve43xPR3f6wklwbizNJPe5yBFL4FQzn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7+m184Iljbt1tV3etTACD1rS5w/8o0NUtY3YeXgt1aQO0E6s7
	ZrOrfvjQVs2ZRCNRqvGhNtC0/LxyACxGY/V2DWICoRd68cmOkpme153x5rX3vj/fMqU=
X-Gm-Gg: Acq92OESJep68C/R5du/yMyGwdXs/8hw4SI7slLslmyOyR2SbgW0M6QprMArTf0T/Oc
	FzPlVz83kXEySN40R96FrsbSp4cFF/oW5k8onj8gnWGzWJe5Q8Xm8S40CAjwEdoLp1vzq2h9W9w
	04ntFLFdRT27nxYMyESKDT0BN2BeybcV3MhgNd4dTr8y3HoB9AbxXZktGjJ8rtotGEPi+quOupP
	ieIhKrbQWPJ0a8fcpJ8uHMnSh2c31+dobxWa8k+63msQxXtBEgXsBFu69eJNXYmV2XZtTTHV9zu
	9R0VW05SqVNUGGXHQXw3ew3Ax44BFmkyH7/qXQqrqsuJDzAdZTafgfrtRKNWyJGH81mw18/W5fC
	7HSKSFOU0c74HuMfXFeKgXBuWRod39VtROsLHro5qc3pR7OldgEnZKzuS9/J6tHNCQIrHHfvCy6
	B57bEc0VkqH3OabNLR9EQ2YVOEDAQvnHvoN8jxdt93dC4AasRE0Gk/GH2eKvIW51jxpvkJ13WeG
	fAqVtVeoOtl4Yw=
X-Received: by 2002:a05:600c:348c:b0:490:45bb:8dd9 with SMTP id 5b1f17b1804b1-490b506a773mr11009225e9.8.1780419651420;
        Tue, 02 Jun 2026 10:00:51 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm541156f8f.36.2026.06.02.10.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:00:51 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v7 0/5] thermal: samsung: Add support for Google GS101 TMU
Date: Tue, 02 Jun 2026 17:00:46 +0000
Message-Id: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD4MH2oC/2XRTW7DIBAF4KtErEuFB4afrHqPqgsbDwlSY6fYQ
 a0i3704bWUqLx+a70kz3NlEKdLEjoc7S5TjFMehBPN0YP7cDifisS+ZgQAtmkby1l8vfL7cOBi
 CJggCLztWxq+JQvx8VL2+lXyO0zymr0dzbtbXvxK1leSGC+4Doe6dJCfCy3sc2jQ+j+nE1pYMt
 XSVhCJJQGulCkJ5vZNykwpEJWWRsveWnAyig71UtaxWzqpI26ELFpXVUu0kbhIBK4mrxNCTkc4
 g0E7qWtpK6iI71RtPaNCp7p9cfg6f6ONWvm7+vf6yfAOuTbdp2AEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780419650; l=7436;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=dzlXq7jykuFHnwxkXRA0IhnPhgOSS7lnT318/jWXEm8=;
 b=jA88N4eUnchzna0+uTR/HgEIhnZJyvLI13NhkkttLP+TWN7PpfbM1Q+SVISL46WzVFp0Qc8m1
 p+gpzAm1/qmAKGfuIcbvh/kXQsjvpWkTIeNgdZn1d2LQq3msY/pzW8S
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100053_891930_236A1313 
X-CRM114-Status: GOOD (  20.93  )
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
https://lore.kernel.org/r/20260531115713.19388-2-krzk@kernel.org/T/#u

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
Changes in v7, addressed Sashiko's driver review:
- add a rollback mechanism in `acpm_tmu_control` to prevent leaving hardware in
  a dirty state when we fail to enable a sensor midway during probe or
  resume.
- prevent calling `ops->read_temp` on a disabled sensor if a concurrent disable
  occurs (e.g. suspend).
- don't mix mutex guards with goto as per cleanup guidelines
- fix irq clear order in `acpm_tmu_thread_fn`. Avoid clearing a new interrupt
  that occurs during `thermal_zone_device_update` (which can cause missed
  over-temperature events).
- initialize hardware thresholds at boot and prevent boot-time spurious
  interrupts (which previously triggered because sensors were enabled before
  thresholds were set).
- ensure clocks are disabled when removing the driver, even if an autosuspend
  is pending (which would otherwise get cancelled by `pm_runtime_disable()`,
  leaking the clock).
- add rollback in `acpm_tmu_suspend` on failure. If system suspend fails at
  `ops->suspend`, re-enable the TMU sensors so they don't remain disabled.
- Link to v6: https://lore.kernel.org/r/20260528-acpm-tmu-v6-0-b4d7ce57594b@linaro.org

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
 drivers/thermal/samsung/acpm-tmu.c                 | 618 +++++++++++++++++++++
 8 files changed, 871 insertions(+)
---
base-commit: a1c3227fc1a1cd83cd7fceb93406da4e37fe06eb
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


