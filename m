Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EB7CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 13:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EifUxRKI8q3aR99rwm5sIdonRFjEYR9jP8wSE6moOVo=; b=xwlUppZvr4ae1o
	buUFPjgw/+oEyCfOBfcwFghTEA0t8vbAZbxgjAGpYFHWDV9FiEdlXPqbVIOam0JeuFW4eFPEwf6O1
	xM2fhasnNbd4bjxC9p6VeRPfcwy7CJ0m2qFD3OChtjGdWOMtagzXBTzjvNuv+7UVtPNRKylaYD4Tz
	1Ny5l07dVP/QGSoauXQKGP2MSSYN90RSmwdV+blG/oXL0ul1Y5cyrntwGuZc5nWQ1KHTE8KIUJWut
	yNRt9HrqT9gCbhFLkicAu5RAWDJhITj7qM1EPjTE50qjjz8uvCNeyUR4QbMUGJEhD+/qWr8ayhpYl
	MzGpPN5j1/DO3THbDA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlQ-0000000HDub-1jri;
	Mon, 25 May 2026 12:50:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlL-0000000HDs1-3BdV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 12:50:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso120933845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713429; x=1780318229; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EifUxRKI8q3aR99rwm5sIdonRFjEYR9jP8wSE6moOVo=;
        b=dR2rZOp9gfJaBqw4pGRw5dNZ6nrH6Rt9s98aODnlPjrDi6AldhxiRQZui1WSJWZHm0
         DBK56+OjLLpRyLpvzL6k1453yZCpI4Bf3u33yraO0/sI68Ua8iL2qfnIHTiVuK5FE1Aq
         2FfDljmuFGPMjfYCs1m8ebh1Ta97CRZgYkhx8JS7uvs5mg8r1WLTykovz93EdjkccKpm
         qsumA35HdCBic1gLZLupyoIQ+eCm8RZtS1kG7AScMpBjOlby2TAmocI0ixSTYfsf9VN/
         TVhjjiCddw593Z33iN2GItvj/f3eXGJjlCaim+TQGmHzPMg7d4Q5E78M8vXo7v18cQKJ
         jzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713429; x=1780318229;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EifUxRKI8q3aR99rwm5sIdonRFjEYR9jP8wSE6moOVo=;
        b=hbVELHp+w4Onwp188op8hg24twyBlDFqMxe1ooUkUxSBFyPZtvOAEIqxlXJsne6zde
         sY2i9Hz/DFFr1M/NRJC8zpjw+YpAA1vfzUKRZ317KJDFuCfdaaEnkcuCYFb5VDFAvSoZ
         vPiWgpkw0MAHalAD8FN2y2uK/IBQYLlDhsv0or3V0cxq9AoCkTS6rQMXufpOuMV8wafI
         tn7bQO4nuZZbpaVAplNI0T0UHfxzmyWuwYl80wetXSLZecPBJfzHKul01UpC9DC+vLn4
         YvQoS6b7+6Dyar4cRL1Aj09FzKbHx5VgPu13x+Dgok5ys4lv5K0+Of0GwKLQLDjXgaRR
         ygXg==
X-Forwarded-Encrypted: i=1; AFNElJ+vysD2tKzzrKV72q967KijEpK538exak6LWfjgWRxCiBN3LzoWStRauvqUBfoYg1H/eAx8l9z8U/2HXoWHC/X1@lists.infradead.org
X-Gm-Message-State: AOJu0YzWrA4lozUQY6Xvkq5/3RTT9cBR4f7cFgoeeq4ewmQiPYyJJ+ty
	GI2YR+KSKpeehEFAy2Zvg8FNf4hwXabK6znvWguPSAJa0+f/gWqnp/LCpn51HNptIRs=
X-Gm-Gg: Acq92OFNCLaH7ZPIaELoAm9ZcyWMsimyqOqrQ7JsV9rs6lBE2088WFCdGuw/66Cu8x9
	awIYGw8Yj1fQKNSkbSFxTSGoJSfMjmvnIqbfLOD0uSn4EpOLfbLUTu6ZJB1v/BObyztXdxL7mgL
	aUZtZXdtQjAZUL/DyKkb6xN7nNYD94FMH20Ssi0sZoZaBPTuhUWiHpxpRYzOYfa1ACsnr6WqWTF
	5DcSp52Z7KzXtsSyV5h1+F7qtBvzVphnk+RB45RfG1cZy7OOozuK14njpcCXaR9fT6GDjFYMj8S
	8Z79cH9REgaH596pyV5Dm/M3sumplQvRNffBZWAGV31D+aibZQbZyuU24rxrwFD+8EXbTx1mIog
	ZLqiuEmVbLSwbH5QySGeJiks8W3Rc/OkesAAiOaZ0QPeXekRslUIMCzGIPhQPlEbTs4ZFcj0iug
	LpoJrl6Nqvgzadd6W1FkcsjEguswMKcg0FU4pso7TvM5qrdnPLhPxOKY6TA5I9u2zb2BRZbvmng
	W+/5hY=
X-Received: by 2002:a05:600c:8217:b0:490:5215:e9a4 with SMTP id 5b1f17b1804b1-4905215ebd3mr153873335e9.6.1779713429114;
        Mon, 25 May 2026 05:50:29 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 0/5] thermal: samsung: Add support for Google GS101 TMU
Date: Mon, 25 May 2026 12:50:20 +0000
Message-Id: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIxFFGoC/2XQQW7CMBAF0Ksgr+tqPOMEm1XvUbFInDFYKklwg
 kWFcvcaCsKI5R/5fcn/IiaOgSexWV1E5BSmMPQ5VB8r4fZNv2MZupwFAtagFMnGjQc5H04S14z
 KA6OjVuTnY2Qfzreq723O+zDNQ/y9NSd1vT5K9LMkKQnSea7qzhJb8F8/oW/i8DnEnbi2JCylL
 SRmyYCNIe1Bu/pN0lNqhEJSltQ5w5Y8tPgudSmLLyedpWkr602lTU36RS7/I0Q+nvKM832JZfk
 D/qyo+mQBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=5139;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=jeBXtuHojBHH2gQPeCSwY8bPjROTXlTPK5x5EdFyeUM=;
 b=TVGX+uxLJueTSFZqqQKinjfGd20qo8y4BOHNCkP4+kA/IzL+waxIxvvbLI1auGMTaKxO1tP6Z
 NZvzyueB1qCBcCWePft569+A34hs4Q662s+eW32N7kRc1eZD8k8i40L
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_055031_864107_94FE2735 
X-CRM114-Status: GOOD (  16.87  )
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

The bindings, driver and MAINTAINERS patches can go either via the
thermal tree, and then we'll need an immutable tag from the Samsung SoC
maintainer that will contain the firmware helper driver, or they can go
directly via the Samsung SoC tree with ACKs from the thermal
maintainers.

The dts and defconfig patches are expected to go via the Samsung SoC
tree, after the bindings and driver are queued.

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

 .../bindings/thermal/google,gs101-tmu-top.yaml     |  68 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 136 +++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/thermal/samsung/Kconfig                    |  17 +
 drivers/thermal/samsung/Makefile                   |   2 +
 drivers/thermal/samsung/acpm-tmu.c                 | 547 +++++++++++++++++++++
 8 files changed, 797 insertions(+)
---
base-commit: 0d177c93e6fda86a96642e51131e1db173277957
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


