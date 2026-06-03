Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B66CD6E6F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PpyrE7phCEic1CuNY/1wYNqebSzLrPkbhwsMEBPt8p0=; b=20x92uKRsVbQdd
	Y90DgapePRFk0grQWkh8tkzj2/W9RXNYu9E6w/oOIn3edffjAtjEatZODHlAYzQyHDnyMuLLYPA8L
	T3/IwYHfdbpcC8G70rMFY4Tpq3uHKZDVnOzl+y2Z+CSQA8VfdMj6jjx3bZztevkYF+au0lVBuKkzg
	Z22S61gBwhCp/hxprfcHfb3TX+YgeCsBk/80sYhO9411BJZ2nNob8NwX3NplrtxiaABwTRScD5ier
	myccHCDXUVZ49C63HJ1e4/TG0nUlnVLZx2mJKv1YYPbuFiRVZuZ7AtUXoWoumQJzKxpROYi0/DCY8
	h6dIPr8H5XGIFEGeMI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCs-0000000F6Ug-2Hd6;
	Wed, 03 Jun 2026 13:00:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCn-0000000F6S7-1fCY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:00:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490b915ded5so5194825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491619; x=1781096419; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PpyrE7phCEic1CuNY/1wYNqebSzLrPkbhwsMEBPt8p0=;
        b=Ct/9AB1rA5OF1qHK72Rm7SM7llG6N6V+rtFs3aDOfTPlCEGzYbMCRfqjOrkU3oDkhh
         n2XECYeQyXF4I5dmyRrecje0pTBClsnKusDnH7/XhyrOIKSwDheEfCH/eoPfRyh3e6Jw
         sICDrZmcyJ5j2G6jhxHTV2o0FGdDhj2B2zTBbvk2ag44awHiEoKA3n4Hxg+ar8CQM23i
         Yg3sUojk7LoHcfkONWqtNW0aeL1yn7Byp7+G7oX2iA3WchxM+EjHvf59ezRwK3kqlP96
         TDMo/eavaTEPHtxMUuooK6sVWjMYm5GKKzOdd+9fM6XeZNIdxmH2dXaW2VIAjlHQq8ul
         td4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491619; x=1781096419;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpyrE7phCEic1CuNY/1wYNqebSzLrPkbhwsMEBPt8p0=;
        b=U9+W9+o6JgQ2QfNbS4tQarVEEPeGsYyKkAKG/UWZICgLjjXWFhtwGQgftK85jo/6CQ
         7w09vXKTI1JQPRZJx8on/Tb1fCl1aZ4UCUn8WnDdYNYVOYQnyR7ftOBdHZHl5CkX7sdL
         Kleazgf0GuxMR4K+znm2Dh5GW3ALyf+BhUsH6B3VPIg7+KVz3nWtqTreJfkrcWcKc5pM
         Ip6ZYVQKfmsGFhWIdDhn+RHM5QLCs5k1JTfok0rZLmTcskuJRU3LBpu7caHiepGaqHG0
         AzJXVyFzlWrSGRNCmB3VSuQfdcGZum17K13QqN5eE45HoGddnKtSz6heubqLWMh/PXpJ
         luuw==
X-Forwarded-Encrypted: i=1; AFNElJ/zZo6z0Ck3bLUd/D/wVNkVtoz2nfs5FUL79PwjXG+6PhF+vQhHyAEwQHl2Wy9+mUEdUWvP4G/Ou3yawYBy18mW@lists.infradead.org
X-Gm-Message-State: AOJu0YxGRUHB8UIYnE5oEYpTI4JGKyxlD/W297kdZaXUzkFCpe4/ZDit
	FSDdevecrD5DCUBT7hppN6YLQesCZ8Sr3tA5cSbEx2+LS+ri5bUnAkFrbB1SZx7ZiKs=
X-Gm-Gg: Acq92OF0nVazWG0cebJMlxj1H+xq3Exd0z/QPIbFbp7UQoASX0xt7iHVvcAnPddH7Js
	5nON5cpRMx+m8UQVgON3FjnDT+WpFJAtEsxgeQV3Wju9VUUc5zAopHNbTIE+4YyvHHeJ77pKmXd
	rsS1+BBVm7rwgNtUvkWEJ5u6FiOZHJjWeN+CxMdY2AfOV63JiH6n+ANLUBjijnCYnPoQ5UkNYzt
	S9QNlQ7noFTjVQR0adSMaqPR7QNcRqsSwf3/SJY/oiiE+sLS3LqMfEadp/I7Tu0YGV1CD1FdZXh
	Z+XZrGIx6C5hDlqro5V3T56nU2X59ZU/vkm+v4dYZ9iDfOSMwAwFrXgDBY3wunyIuNXPNMoqG2q
	H/+B5o0lD0/lhHQpkQR9weLj+mAitSSQXh0/zVZsM3NMfBSjZh1pckh0qZmIJwAhvUTCG6pbDCc
	JhBIN+lhS19YJcmWs4qoeRzIGQDXYQPwODHSR13lrrD9K7FL4C41bnihFaHNZx85Ksdfnq6Mv0N
	O6nojuyWQnUv88=
X-Received: by 2002:a05:600c:4748:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-490b5ed6ad0mr55660775e9.13.1780491618484;
        Wed, 03 Jun 2026 06:00:18 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm149179045e9.14.2026.06.03.06.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:00:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
Date: Wed, 03 Jun 2026 13:00:15 +0000
Message-Id: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8lIGoC/2XRTU7DMBAF4KtUXmM0Gf93xT0Qi8Qet5ZoUpw0A
 lW5O04BxSjLZ/l7lvXubKScaGTHw51lmtOYhr4E+3Rg/tz2J+IplMwQUEPTCN7664VPlxtHQ9h
 EIPSiY+X6NVNMn4+q17eSz2mchvz1aJ6b9fSvRG4lc8OB+0hKByfIQXx5T32bh+chn9jaMmMtX
 SWxSAJsrZARpNc7KTYpESopihTBW3IiQod7KWtZfXmWRdpOuWiVtFrInVSbVKgqqVapYiAjnFF
 IO6lraSupi+xkMJ6UUU52O2k2qQEradY3QZoQlOyA3D+5/EyW6eNWRp9+d1uWb4QnCAESAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780491617; l=7809;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=cFIMH4WC9rDHO7PM4Pa/kHVW57mEDWQz0/72lkuV/+8=;
 b=QzjCsaVPGWELf6Aha3/k1eXCBGt2loVSmhfeDcR1MD/7FmdbiD4/Gd7XrvkcLPRJGSuFr5DWo
 RLuqI3nUyUfDiQQSq/cTp56+94jiyNQgCj0SfF4nPPu0q5+V/T3aQr1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060021_483535_C42FAE36 
X-CRM114-Status: GOOD (  20.84  )
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
Changes in v8:
- reword commit message and Kconfig description (Alexey)
- adjust Kconfig dependency to require EXYNOS_ACPM_PROTOCOL unconditionally.
- fix probe error path autosuspend clock leak (Sashiko).
- fix system sleep clock leak via `pm_runtime_force_suspend` (Sashiko).
- Link to v7: https://lore.kernel.org/r/20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org

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
 drivers/thermal/samsung/acpm-tmu.c                 | 651 +++++++++++++++++++++
 8 files changed, 904 insertions(+)
---
base-commit: a1c3227fc1a1cd83cd7fceb93406da4e37fe06eb
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


