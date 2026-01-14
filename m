Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057D9D37E33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gOr0r09swBSNVjbYo9yz2YviIiFXOTNHaYP7I0YlkxY=; b=uIZw0w89r6tP0p
	l0M/10YGVYYkSsmBJ7If8XxWvWKQ3bkMqZFsNiVp1ptLqNIpDT8wkh3S8LKYRlPWkaRZOrTSpeO47
	Wi6tPKKWdcEMIo4f4MjokICX0q9irgSYk/dGfCzjBhORdSJUqq2T11ahr4j36z8Xudp1Cnh0d00X5
	D6a9nDcCL1n+chZcz0tS2dlFYud4ut+59VavcHG+6kchf0itpcrsc13ZTvyO0Ro+byUGR8HRiQIXH
	tcC+lS1CpXGuQy8tDb5gD5lNV9btxMctFKYiwvHM8xGIASUdscJejqYC91AsOvpKquZrL05VoyAVn
	CRiGcuRa97zuZypKedUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gM-00000009UKI-3BNH;
	Wed, 14 Jan 2026 14:17:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gK-00000009UID-1o7W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so5425095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400225; x=1769005025; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOr0r09swBSNVjbYo9yz2YviIiFXOTNHaYP7I0YlkxY=;
        b=NDBT3GN25UsCmhZS2hN2hY7BycHvHi8c4s+OL+xE3NX5q0trsk5+GVWEBiBnVvRvqg
         +H7LZC5DXlZyp+JDaVjIXKhuiuDUVEI2RQVCm3NP9c8iFbphlyULrYLxt/IZjT1nO2ts
         W3GubVdT3LBnDnDNPzGGbKCx0aG63YQQscqJzoCHSg+qLZqWGClr5oz3hwMihLsk4kS0
         QmqMggP9bZXo6YYcKBuMgtU0PDWvYw3PaWW+a1skIPiXd7eUvPL2m3wilk2kGvB6nzAC
         KhjmRyLXYeIbSMfz8pHe38bOI3atbWpNVhsjcXgtnmFK0Nu5HSqBNoeXYvKMeR8Wbrfo
         R1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400225; x=1769005025;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOr0r09swBSNVjbYo9yz2YviIiFXOTNHaYP7I0YlkxY=;
        b=bP6QD1muaseSfRlQQAZErWx6JsNd5KQ2WXWkHa9ZYIvbLb9nt86mk6KZ6MLPEmcsw/
         33/PbA83V/MJV81tlTlI94+C4QKQInxO6mpyP8WO/l7v4cmxfGlRVNo2qy/0yPFk4BNa
         EqV11eNQu56W0U3EKJaHo6wFcnLrpAbje4iJ83PHPvmLJLXCHV+8ZITDTGv/uklc9RnI
         r+AMY6TvfIUrFE91V8VVFCOtaMdpVXnhhkPh+AfnNisZltgvDWXCTknsX77sKSyqYv6x
         14DO6Vzcgt9sX1wG8r15h48QhqzcZiSIEEuRHVe614KC2qi1Dcelkz4YZOzOqBm8LHhx
         A30Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfsjN7doBzhwkh4loShoTY+0EqtKEd8gg2xBgg3/kjw69/8VfFZ3NexbzZ2D/9hfkAq1qZadSZZXNYsMHh+CdR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc314eD2PY8U6bDvvTnjR+OmHxbPm2hXdETvOYw3bxM4l8pVUl
	lNJr7YzahD9zg8Gg+RRdV7obva/319xIRAbIbQrpKGn9iiXHCAMzgUCZhi+utjSg4KQ=
X-Gm-Gg: AY/fxX63Ngpe4+oPSEDV0zWg1wd4Qx0iJFXkjcoCFIkntOSZudeHPvyVxy9Sm+LpVb2
	hVRGRshdwPzAcBX0ZQGcLAqPvmrmKqxTRCIJkHzPruokanlw8xMYXBuOmkEyJZIlDeOBOZn00dt
	YiSnbNpxPg3DvADRRPGgyQuqGL+sl80uEAv+Vb8y49ExuWGi5HPlUSntXd0qk2EXuBP7d/NNa7W
	H5QR/i6RDh7U//Ax2w4NuVetGFTJc9oxS5POs8Q1hi/ot0iSKZW+/+Df/UXtihr+8IpfVapcX64
	gU1RRzxPEq3U49soI8z114PDog9CggV919S0TtaovEH1TbzIGzSYrBOxSm1z8zmOTgYEwnRAJly
	p8A6qJ9blciWBVRNtfcEEK7Ezh0e+5S1hH17McSisCSYZx9tPRlVKp/JWsWmSZRfKfjSszQLT77
	OYvQsSfPiokUHWWA21HcbbuKpMnOLHmkshAsNPTtzwr4AzW/GwN+XRQdzaaA5rb1h4o3ETbg==
X-Received: by 2002:a05:600c:548c:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47ee3371876mr36058035e9.17.1768400225203;
        Wed, 14 Jan 2026 06:17:05 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:04 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/8] thermal: samsung: Add support for Google GS101 TMU
Date: Wed, 14 Jan 2026 14:16:28 +0000
Message-Id: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2lZ2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nj3cTkglzdktxSXSPzVCPDNINUo2TjJCWg8oKi1LTMCrBR0bG1tQB
 +IQsDWgAAAA==
X-Change-ID: 20260113-acpm-tmu-27e21f0e2c3b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=4502;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7iSVRaIrBvJwUyayWLQUtaaFeLqq1IG5ekXvTcN/l1c=;
 b=VldPEq1aLcmN8GvMlCPb3GSq97ZYIjYcVJ1HPKvNgmWuc/m5TOg/1yIYM3XuK7n87gKGGVHI9
 asGZcF9DEDIDlAGWAhUklMa+lXPxsoBl7nyIKO6JUw/CJxYJ3u7I4N9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061708_512128_5958095F 
X-CRM114-Status: GOOD (  16.42  )
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

This series adds support for the Thermal Management Unit (TMU) on the
Google GS101 SoC (Tensor).

The GS101 TMU implementation differs from previous Exynos generations.
It utilizes a hybrid architecture where control responsibilities are
split between the kernel and the Alive Clock and Power Manager (ACPM)
firmware.

Dependencies
============
1. The thermal driver patch (5) depends on the firmware helpers (4).
2. Typical dependency of the DT patch (7) depending on the bindings
   patches (1), (2) and (3) (to pass dtbs_check)
3. defconfig (8) logical dependency on (5).

The bindings patches (1-3) are independent of each other. They can be
applied in any order, though logical grouping (Firmware -> Thermal)
is still nice for reading.

The Firmware driver (4) is independent.

Given the dependencies, I'd suggest everything to go through the
Samsung SoC tree, with ACKs from the MFD and Thermal maintainers.

If the Thermal maintainers prefer to take patch 5 via their tree, an
immutable branch containing patch 4 (firmware) will be required from the
Samsung SoC tree to serve as a base.

Architecture Overview
=====================

1. Firmware Responsibility (ACPM):
   - Initializes the hardware.
   - Performs ADC conversions and temperature calibration.
   - Manages thermal thresholds and hysteresis configuration.
   - Exposes a high-level protocol for temperature reading and trip
     point configuration.

2. Kernel Responsibility:
   - Communicates with ACPM via the mailbox protocol to set thresholds
     and read temperatures.
   - Monitors the interrupt pending status registers directly via a
     syscon interface.
   - Maps physical hardware interrupts to logical thermal zones.

Sensor Mapping (One-to-Many)
============================

A key aspect of this hardware is the mapping between the logical "ACPM
Sensors" and the physical TMU sensors.

The SoC contains multiple physical temperature sensors scattered across
the die (e.g., near specific cores). However, the ACPM firmware abstracts
these into logical groups (Clusters).

- ACPM Sensor 0 (Big Cluster): Aggregates physical sensors 0, 6, 7, 8, 9.
- ACPM Sensor 1 (Mid Cluster): Aggregates physical sensors 4, 5.
- ACPM Sensor 2 (Little Cluster): Aggregates physical sensors 1, 2.

While ACPM reports a single temperature per logical sensor (likely the
max of the group), the thermal interrupts are raised by the physical
blocks individually.

Therefore, the driver is designed to map these physical interrupt bits
back to their logical parent. When an interrupt fires, the driver checks
the syscon register against the masks defined above. If any bit within
a group's mask is set, the corresponding logical thermal zone is updated.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (8):
      dt-bindings: thermal: Add Google GS101 TMU
      dt-bindings: firmware: google,gs101-acpm-ipc: Add TMU child node
      dt-bindings: mfd: Add Google GS101 TMU Syscon
      firmware: samsung: acpm: Add TMU protocol support
      thermal: samsung: Add support for GS101 TMU
      MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
      arm64: dts: exynos: gs101: Add thermal management unit
      arm64: defconfig: enable Exynos ACPM thermal support

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  17 +
 .../bindings/mfd/google,gs101-tmu-syscon.yaml      |  37 ++
 .../bindings/thermal/google,gs101-tmu-top.yaml     |  64 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 209 +++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  22 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++
 drivers/firmware/samsung/exynos-acpm.c             |  12 +
 drivers/thermal/samsung/Kconfig                    |  16 +
 drivers/thermal/samsung/Makefile                   |   2 +
 drivers/thermal/samsung/acpm-tmu.c                 | 638 +++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  24 +
 15 files changed, 1296 insertions(+)
---
base-commit: fefc12a70eb12e0b04f0b59b623965dd3ab1f4ba
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


