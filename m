Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF4CCCF2EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iKnIFFfc9VQE0U5sGGzfGa64S/N4XCAB3mzxFk6dO2I=; b=W6QFqL14Bk46fI
	743hzUhIGw4cFf9tOxhea+fO5qTFzuPPQj/F2EvhSf2j0RGeJXXrqs/KKykcDzbGbjtVaTPwo8cKe
	Z/JhfWuOO7H8p90BXuDPNtchhBFM7dI1VLQSKkyKELhI54K7jSkFHzUlkq4yylfOghsfrPd/AnomE
	S3FpFr5WE4UrCwYCrww2AFRif69FdDLSyhZ/SHcK5H5yUr6qCL7E6TXEC3+0h/kptnp/B+Fp4F9u4
	M89LqQLXL3xl44aJeyQ2JUoJ2TwDRiIK036aQjl4+fOGOjdB/nrjVNzFUaa2pEgOGkJc9nbP9Faje
	P2pR8FkddaI7GjscLW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho4H-00000001xX7-41Fe;
	Mon, 19 Jan 2026 12:09:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho41-00000001xSZ-3A1P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:09:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so2331269f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824533; x=1769429333; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKnIFFfc9VQE0U5sGGzfGa64S/N4XCAB3mzxFk6dO2I=;
        b=mO+dsfzWMzX5lOaatb7YnMJKncqj2rMNhL5x69900aobKmVEg44fICG83Xjv4SSsq9
         71s+XrU0a1/atTUbRrKAvxz1rYjmwAWq/t6Kt2PEECM49MwmSoNp+ljMi73rnYWQsh/K
         UAfkVHxyi0N9FZg+nV10lLbn8Itu7D0LSJrheAq4ApQQ7XteMdjlWLjLAmXRAgXZnQXF
         ke3lkssAhnzK4PycFmVjhr2lWs9VzNQW2FI1SBlmF6jlf5vKY7OFAwFDAUYRvjBhBbqF
         NBf4R6e5/QGqiulmeLMODRwCMdFFSU7nIeWd3mknve7o+WZZjV/WKMdaXIi3mW2ME8tN
         SaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824533; x=1769429333;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKnIFFfc9VQE0U5sGGzfGa64S/N4XCAB3mzxFk6dO2I=;
        b=Kj4NEJhKwXuO/30U1h3s9Jum++wL9SeCtN9dp8pJxNMtDn6a15lZszVscIAC6oksRT
         gSWfl+rEk4+bx6EpWHtcGsf9wxjlCnuYNprT3y7/4Rnxq6Mbg7q8GXYB0QYK+i3p0lfP
         5fQdaOW11KnGl6ML4Vg6Thf+pOuS9t42NGIikOzpgmU1AfvEYE4LKC2DR3CjKX0u/Owz
         KVVD1DKDg/QPA+lpoeaQKh6PrlR9vi1drZ/T4IA3UITzU/D4ZnUdMEodjr3R8XBWGEuE
         P8sWcASjOimy+tchF4+g2H1JhllXnyuWsn+PASjGFQVSuxywhDDj6usWn1X+qPpjKHtr
         8DAw==
X-Forwarded-Encrypted: i=1; AJvYcCV5LCPwKpf2gzALRsktx5ZG1NCf6RUxAvWCPl8bJvJ783vAZVEBNH6AFiWtgH72ihxSf/R1YbbVJenhg023q6me@lists.infradead.org
X-Gm-Message-State: AOJu0YzqDgFGUYjsXIZEd3pw7e4r1wfICBQ6NNtcOyUOpSzLzu/lh2o0
	KXI2fWyfJZkOL7eRMWKAjsbbRdmprDiI43FX4LA3ut0DzGHepm72i78642Wswl4oWOA=
X-Gm-Gg: AZuq6aIL8weiN77gQrRPNWLnZ4/jC4J+dZGsTJ17aVy2IvVbNnNE0w5/ozJaNXN4Lrc
	F2pYw8eLFEzb6viPdOMnfq3NImX+UOnVT8+JTJKaFZRGBV2GY5uEevBVod5SjYME91Qrk+0MdhL
	8ZjmpW1T1nh3CGhHL0neQLLRdG1mjCNeh/G+JWVy6uN4BKZF5nYEZT0xy/HS9aYM9uBRxjtTg1G
	oPyDPstBJmkKGBL5VfQ3+XAAe671WdL3g8LhnluDJ2u6bv4g5fwp0mvsFSFEu+V7/mNt1hyouEM
	69gZTVcD8gOxBUTcIdoum4ITbIWRyRVv3C6jsW6dgsFJUPTsyZYWVyucD2Te1d0logG8BAoo+rK
	AdYG2eQje6PEBHRZK4Q4yNOV1YAacZqpWIx4U7/gz85NK0OhavIOquRfRGSvngnFKaEuAJLSbVO
	CDhXpCdo+OAcWCKnmw6RQwDyIM8JOEQV+yLxm8VrMSDNMVYx2dwbNo2Nk/58T6bryqVEFc3w==
X-Received: by 2002:a05:6000:3109:b0:430:96bd:411b with SMTP id ffacd0b85a97d-43569bd47e7mr15049639f8f.58.1768824533142;
        Mon, 19 Jan 2026 04:08:53 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101 TMU
Date: Mon, 19 Jan 2026 12:08:46 +0000
Message-Id: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4ebmkC/0XMQQrCMBCF4auUWRtJJlqpq95DuojppB2wTUlqU
 ErubiyIy//x+DaIFJgiXKsNAiWO7OcSeKjAjmYeSHBfGlBiLZXSwthlEuv0FHghVE4SWn2Hcl8
 COX7t1K0rPXJcfXjvclLf9Yec/khSQgrr6Fz3jaZGuvbBswn+6MMAXc75A46eC7ChAAAA
X-Change-ID: 20260113-acpm-tmu-27e21f0e2c3b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=4379;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=vjxKctKqh1C+lpYUfF3aR59o+hjb5fIwKm+AM9mWzG8=;
 b=wXnHsdPH6H91y8OZ1SvxH9pevq+ULVCQNWr1P0Do/JfHOlidnlm9D04J3aht/OhyxQt+CpmUS
 mfS2vbxsmfWAWC5izRW9M7ycjSgKXtMl+tIQ0mSkr9PsPJ5HylEv5TM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040857_867110_D387A46A 
X-CRM114-Status: GOOD (  14.99  )
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
Power Manager (ACPM) firmware.

Dependencies
============

- firmware patches 2, 3: required by the thermal driver (patch 4).
- bindings (patch 1): required for DTS validation.
- thermal driver patch 4: required by defconfig (patch 7) - logical
dependency. 

Given the thermal driver is a new addition, I suggest everything to go
through the Samsung SoC tree, with ACKs from the Thermal maintainers.

If the Thermal maintainers prefer to take the bindings and the thermal
driver patches via their tree we'll need:
- an immutable branch containing the firmware patches (2 and 3) from the
  Samsung SoC tree to serve as a base for the thermal driver.
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
- handle sensor initialization and calibration.
- manage thermal thresholds and hysteresis configuration.
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
Tudor Ambarus (7):
      dt-bindings: thermal: Add Google GS101 TMU
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
      thermal: samsung: Add support for GS101 TMU
      MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
      arm64: dts: exynos: gs101: Add thermal management unit
      arm64: defconfig: enable Exynos ACPM thermal support

 .../bindings/thermal/google,gs101-tmu-top.yaml     |  67 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 209 +++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++
 drivers/firmware/samsung/exynos-acpm.c             |  35 ++
 drivers/thermal/samsung/Kconfig                    |  16 +
 drivers/thermal/samsung/Makefile                   |   2 +
 drivers/thermal/samsung/acpm-tmu.c                 | 643 +++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  30 +
 13 files changed, 1275 insertions(+)
---
base-commit: e2211f5d980086dd9fbdab3bcd86b715e12cae13
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


