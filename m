Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D02FF5A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lDJkImIgICmlNFiRXajnn8mAXyhcbIrPtW7+EmIu9WU=; b=rqSI9nkTb8Qd4x
	yuDcikVd3b0xgCTUXmSjAEiJOzKsAx/xqThOpUlI67AMfUASLN9EhPYGyyBjbXxrGmvdnBUHZhPS7
	5s9zEM2aPwvC3ezvSGI2W56EVF1J8IYZEzkLwwtaEXEcXeaB2VpvTdEYwLcwcU/o1f/N36aacImXG
	BZpNcOV8NhZwh2CbgFA9Q88ItZYqt80PDiogiD8GpdJl8zN+lM/AV02Ss/WwJgxZVwj+14tXptAQb
	vmMaxnfiqK6rraSPiADJA1TxAfOu/+5qF1Sxk3Lhzr1AwLw5BwBkSCo6WfCOnwpLfaBZZdphNzXat
	jxuOWrURHu/tP+8qDcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbS-00000007V0X-1YUX;
	Mon, 20 Apr 2026 17:40:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbP-00000007Uyf-3lDA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:40:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso44121875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706806; x=1777311606; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDJkImIgICmlNFiRXajnn8mAXyhcbIrPtW7+EmIu9WU=;
        b=WurfeClrrP44RlWyqkgdI8Dt1lVi8GHiwtgGAueS1MB5aLfeqn0dMDynKdiJztfBsw
         jkaKHMySS0Jj3ZxsgERKZNEFbuQy+iZ6ioqDjufAtGiqocf6Lzd+3UIPoe7m8zW3pFbi
         87eYhw1yRdmcg0uLSTNM40c0Flbe/3PRqXUEUF9oLlkoVaB28V3od/xHsHZixdqv6xqC
         yuz6ajoErMWChyQIyDXJZXE0CGC/7IUgyLE9CdbAOpVzbHlS7XFqbW61U/Q+97WaMUzq
         SVrucJSIiyY2F/BDUmZTPspRwuZoUgCPHvKi1NArmZejutfnC11/UjJ0gOO6vNX/752S
         gfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706806; x=1777311606;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDJkImIgICmlNFiRXajnn8mAXyhcbIrPtW7+EmIu9WU=;
        b=GqGlxV9D7ocEfItfzKVz41Hd9ZBBt3LDIdjdJf3kvvfA+BsLDYsSO25Xb2CkBd2tw8
         sWmCI7AKHCFtqg3E+6lMKRBuNHdvRmC1UCleIzTt2GWB/pVbdhzYERHpdLITCDKowX4o
         m+Te2u1wVcQ/fCcBe5wCQmpdj8Xo+S9snlK0iEzqsBwtafkOzSXZdTJ6nXM7Ebcv7jiI
         uPhNf0jn7f0gT7RyGj+7xGtwZJnmMW1RH2Clo2jhVnzFR3uRpqvchtECfawApZUWL00B
         1rdhpm/5D2GWwqDofA6cfaT4rWXI8QgS2ulI7Sh3O9N9nmWDYOhhWoCOoI+uEkeeZBz1
         3nSA==
X-Forwarded-Encrypted: i=1; AFNElJ8dvmkhQ+ZTBCCp1azkyBY9n4QoHE/yv29Rt1M/uvRxpXwKo1Zpc56jPWPzixDcpRY7xvjQigGa76KkSQscmuGT@lists.infradead.org
X-Gm-Message-State: AOJu0YxVH53A8DyD09MLpDKUa4Z37qR0jSF3eHc0iU6DtFlXOPFvmTGc
	eIB5bMmib+M9bdldvdd70Zl0fN6ZcuSQAOHZLkTztdH9HMQMNzq8EyNd4wSx0yddTzw=
X-Gm-Gg: AeBDiesz1ejvcNCL7vFwVHXZEiUMwA3OLobukySIZSTq6IGnc+7Wu6Mlv2C7Gkx+zHg
	8UFBRILd6913S1mopsGziEWMs89/ziIoAHseHMU1yxfNWm2UIAhxh7At2SASfgBiYOlfLBuqT2B
	HRn25fFHrxhNIqYWtY/p5mBA+TARUpQsxFwbRUhrLS67tE2c9QJOtTAE6THMs9QSqw1XTR3dG0Z
	9wZQ0QVOqoAZ1BICTec9PhPJJ6w/wyH8S+g/Li+mFUiW0utjvWHR38FKI2q6NKQDS/00pXs/dZG
	GyaOFQRykSQYb+XcObqQQ4Lwd9s0saA+npp73MSlebbmIzxhGpMDeDc2O2nfjHqw9Pkx4/qhCmf
	ooBLqrieA8pIfgl/2uSO6aTmORUK2kq1X7D9eNw+rLZBaht1bH4jcWZDm2k0vJKToc9dN8z5dLC
	o0C9XIN30MtcAxNz61xJDgAc2r+lx85dPx334PWLxxjObK2TDiYSNARXNiBi7YD7yZBjF82yiHQ
	fUV7Dq+caQEO6YGOg==
X-Received: by 2002:a05:600c:1e28:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488fb77fbf3mr202675855e9.20.1776706805576;
        Mon, 20 Apr 2026 10:40:05 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:04 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 00/10] thermal: samsung: Add support for Google GS101
 TMU
Date: Mon, 20 Apr 2026 17:39:46 +0000
Message-Id: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJk5mkC/1WMwQ6CMBAFf4Xs2Zp2W1E8+R/GQy1baCKUtNhoC
 P9uITHicV7ezASRgqMI52KCQMlF5/sMcleAaXXfEHN1ZkCOJRdCMm2Gjo3dk+GRUFhOaOQd8n0
 IZN1rTV1vmVsXRx/eazmJZf1G1C+SBOPMWDqUdSWp4vbycL0Ofu9DA0sl4dasNiZmkzjqk1SWK
 1P+mfM8fwBnhRPK2wAAAA==
X-Change-ID: 20260113-acpm-tmu-27e21f0e2c3b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=5994;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=EdQP2Wruo5Doe8ztaHk+aq6I88bm/VqlU7qINEfTGPY=;
 b=RTb0XIdv247dsRhBC3h8MnErBTOzM84fAn+wrWqFb+Sk/42POLptqjS7s0rmp9lB+F9T83ayW
 E8wKEuoDdq4A9Awl1GFDy068zmsA/53CebiUKTVPyJCwlmCPSnbyq98
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_104008_008827_85B11597 
X-CRM114-Status: GOOD (  18.31  )
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

- firmware patches 2, 3, 4, 5, 6: required by the thermal driver
  (patch 7).
- bindings (patch 1): required for DTS validation.
- thermal driver patch 7: required by defconfig (patch 10) - logical
dependency. 

Given the thermal driver is a new addition, I suggest everything to go
through the Samsung SoC tree, with ACKs from the Thermal maintainers.
The MFD and clk maintainers are included because of the cleanup patches
(3 and 4). ACPM updated some structures that the mfd and clk client
drivers are using, so these patches shall naturally go via the Samsung
SoC tree.

If the Thermal maintainers prefer to take the bindings and the thermal
driver patches via their tree we'll need:
- an immutable branch containing the firmware patches (2, 3, 4, 5, 6)
  from the Samsung SoC tree to serve as a base for the thermal driver.
- an immutable branch containing the bindings and the thermal driver
  from the thermal tree to serve as a base for the dts and defconfig.

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
Tudor Ambarus (10):
      dt-bindings: thermal: Add Google GS101 TMU
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
      thermal: samsung: Add Exynos ACPM TMU driver GS101
      MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
      arm64: dts: exynos: gs101: Add thermal management unit
      arm64: defconfig: enable Exynos ACPM thermal support

 .../bindings/thermal/google,gs101-tmu-top.yaml     |  68 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 136 ++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     |   8 +-
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  17 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 240 +++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 ++
 drivers/firmware/samsung/exynos-acpm.c             |  94 +++-
 drivers/firmware/samsung/exynos-acpm.h             |   2 +
 drivers/mfd/sec-acpm.c                             |   6 +-
 drivers/thermal/samsung/Kconfig                    |  17 +
 drivers/thermal/samsung/Makefile                   |   2 +
 drivers/thermal/samsung/acpm-tmu.c                 | 539 +++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 +-
 18 files changed, 1176 insertions(+), 61 deletions(-)
---
base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


