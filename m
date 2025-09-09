Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A41CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2DVZjA2xzBpsspRxmBhscCQ8qNTTD3WeHWSgLWWar2Y=; b=SQyxbF/Th7kD+N
	vGOFCpy2AfCBM0+vOVvELzwSYpVZgR7tTAZ+A7BO2UH3yqFrPtC7ifo3WNO725oyF9ligUDrEr5ww
	uCoQMoO1+3J26eKdrvl9UaJjI4blNHgNIHZwPTiwHczFExPmf2m0luarWB9U8lZv6Ppp+SwhvdY8H
	o7XIlTJ1hklvb/Jmb0CuwPRyYMavKioM6pMRaVkmCe+gLbELqodSPlnFYMMqS+1WJ0UMUYvSPdKK4
	f6uEa6rbw9Pla/Cl9aru/4HyLrzYQmvzfZFZomPBliG1XqBmWrc0z39+znclD18LY2A0A6SBYdRzY
	9ZGrd+hlBqv6OlMyxYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1X0-00000008eJn-13av;
	Tue, 09 Sep 2025 16:49:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKr-00000006HaC-29es
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2DVZjA2xzBpsspRxmBhscCQ8qNTTD3WeHWSgLWWar2Y=; b=RrS0Ql5J0s963a5h8MHY2i7BPd
	PVYS8DocoIYEBBNh6v0v2cRGv5hEwlhWFHK2WbevD7TIzFxPq8hKnaDh/Sn1HQmsRn7L+3Cka6JUE
	AmwNSxHrjF+0bF6pJFQYdxiJ2HNaU2449affOYEAWOg6M8xV4oK3vHfzoOg+FwH5FGLmrNObeOkdB
	Ry9hH0fI235YJkeTdZmpCKjwyrMRr0kowD8Dh9xSU0KM3bRdYv5RNpBnr7FaCOb72EHTRwSBM2pgV
	3620i1ttuoHWFLb2EkqyytO+IfjOfrOB8CYb8JmfBcYxMwPZ9d+YauDVk0M+ZMMU6uJ+ZAP990hOR
	7aVFvz7Q==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKo-00000005HUA-10gv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3df35a67434so3398413f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412740; x=1758017540; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2DVZjA2xzBpsspRxmBhscCQ8qNTTD3WeHWSgLWWar2Y=;
        b=MaTZ274mJUe/jaCE/MijGiSobWSCmJqhsbqGk3+SOxAvGPXzkw/bUXORVV4G4b10kq
         z3rvFAviuGv5DU6NXT+K068VDxXhM9b8h3Gdyi7kEWbhT/YQO7+LzcTqvdYh7KAJBZwM
         3EpFUDECR9pkmmcydkq3h1XYnQi8jZMiheJ3QCgbBtrWK4I+2XIbdkruW/zd7GLK90DV
         o0UxK7QuvQBm6yaqKVd2PG/dmbalSIez8auMw5fgBjubGZUOVOb8SsZGpWv+rXw763GR
         rLZcYzMjxI5btXS4Mfk5ejLys3S5DdNUPvYSvUtZ+Bdzhb07IokjYzuOt9cGwprb0VB3
         hmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412740; x=1758017540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DVZjA2xzBpsspRxmBhscCQ8qNTTD3WeHWSgLWWar2Y=;
        b=ih1d7wHg1zeJSWPds9pgsWLsyA3kdJ7LVPsA6BTvrEis6gChg1HuYreUcwpXoBvrWY
         DUIhBe65VVyv6xZ+kR1C6mnJxRots7Rq72eddiOxwkq4lGEdZK+1QM27OjBmdwHv2tNE
         C+r6KP0j7TmKQe171R5o4uj3e7sbM7QZpFL+dsiKJ1jTwGIe6vJyhW7vRFPda46bP2E8
         LQR3aLGn0iubUOafLJZr9DJ/W1aB7jzaFtjcgtj6cFACYnX5Hv09TTGpBPfq2qEvDibF
         QRc46HiBu6kS47CSQmliRWpaPkn3CPF6wAqnzIFuaNuh8oh197y/uUFLFYem1cU2yedo
         4IFA==
X-Forwarded-Encrypted: i=1; AJvYcCUIAKxIuGlueqBlCGdZlXEKg8bMh+rpopIaVr2Dvk46jTxnGnMEN6eHTGD+3rBSeNHQW8WxMaCxrCsgFQcGk+NI@lists.infradead.org
X-Gm-Message-State: AOJu0YwXU2EGOuaAlZTdI7GRb1mJ4jTPbAkplfghod8j4qWa4sbm0bJU
	7JgGbkBjQADhdRBLYi7CbKINQyrGDyDbNtAEBGnWQijDxPJBoBjOvTah
X-Gm-Gg: ASbGncviTq34Hc9TaTqJJfxiHa9kWcwRPTzlrVMcaJVK8JrqxD+cN3Ry7rYuD2U/H5X
	1jAUeD2IWP5Bt7iMeZX66zmaTMj94NOW1vZmcy9vCHxv+DuU5Qw82swVkkfaEp/AFhjgu+8dWZH
	WKhZdNo30sraHUWBsauBmWy7PPXwOXE+Vr0klUZOeNm8yAeJ5viKcY1PlPjxQxl61oIlgap0G2b
	XdgE8ZEyXg/JElY8oRYlPLufBQsXmADIHcafNCrndXvq3D8L4hZcO6QdIo5S3z3w1+gUYejBF44
	GQXeqi/Q52LKmbBYohDFRXOqvPwAqEvJVP2jf5stQhJ+siKie48fCLTCxbca0Hb902qweiHL81P
	ZNhB3qX69Hxs3bup0INbD/UUA6h0gpIBTkPfG8ciUIjx5I7NT2iew5/xkAn8TvNMU87Dx+qR5tV
	Lxm2UOXXSPFbxH3Eh9rB2wMyB9Ow==
X-Google-Smtp-Source: AGHT+IHWtrZ9/XJ8g8wPILz5HBJiKdiHip6k2Y7nAmAFrkuZKlueXTzkqAL0OsGQ2MntX2372cUV3g==
X-Received: by 2002:a05:6000:1846:b0:3e7:441e:ca19 with SMTP id ffacd0b85a97d-3e7441ecdcemr7240561f8f.43.1757412739533;
        Tue, 09 Sep 2025 03:12:19 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521bf610sm2035518f8f.9.2025.09.09.03.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:19 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v6 00/20] Introduce STM32 DDR PMU for STM32MP platforms
Date: Tue, 09 Sep 2025 12:12:07 +0200
Message-Id: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHj9v2gC/x3MQQ5AMBBA0avIrE1ClZSriEW1g1mgmSIScXeN5
 Vv8/0AkYYrQZQ8IXRx53xKaPAO32G0mZJ8MqlB1YcoKR43eSyCZVjxDPITsimS0VqNzpmobSGk
 Qmvj+t/3wvh94tKr2ZgAAAA==
X-Change-ID: 20250813-b4-ddrperfm-upstream-e8442bcc8396
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_111222_493735_5CAE83E6 
X-CRM114-Status: GOOD (  23.52  )
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

This patch series introduces the DDR Performance Monitor (DDRPERFM) support
for STM32MP platforms.

The series improves the STM32MP25 RCC driver to make it usable
as an access controller, needed for driver probe.

The series introduces support of DDR channel through dt-binding and
devicetree entries.

It also includes the addition of DDRPERFM device tree bindings,
the DDRPERFM driver, the documentation and updates to the device tree files
for STM32MP13, STM32MP15, STM32MP25 SoCs and stm32mp257f-dk and
stm32mp257f-ev1 boards.
The series also updates the MAINTAINERS file to include myself as the
maintainer for the STM32 DDR PMU driver.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Changes in v6:
Use personnal mail account
dt_bindings:
  - Improve sdram-props's compatible and revision ID description
  - Fix DDR4 compatible regex pattern and remove a DDR3 string
driver:
  - Add io.h include for writel_relaxed and readl_relaxed symbols
- Link to v5: https://lore.kernel.org/r/20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com

Changes in v5:
driver:
  - Remove one more trailing comma
  - Include right includes and not more than needed.
  - Fix the counter deletion for loop exit condition
  - Fix a dev_err_probe error log
dt_bindings:
  - rcc:
    - Fix commit message:
      's/access_controller_cell/#access_controller_cells/g'
  - sdram props
    - Few fixes properties description (compatible, io-width and
      density):
      - fix SPD bytes number for density
      - add manufacturer part number in compatible for DDR SDRAM
      - improve description sentences
- Link to v4: https://lore.kernel.org/r/20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com

Changes in v4:
- Fix DDRPERFM dt-binding example with a DDR4 channel instead of DDR3
- s/memory/sdram/ for factorising patches.
- Improve properties description for the new SDRAM props binding by
  adding information on compatible generation, revision-id, density and
  io-width for DDR that comes with an SPD module.
- Add a patch to standardise sdram channel node name.
- Improve DDR4 compatible pattern.
- Link to v3: https://lore.kernel.org/r/20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com

Changes in v3:
- dt-bindings:
  - perf:
    - fix compatible conditions and dtbs_check/dt_binding_check errors
  - memory:
    - Remove ddr-channel binding added in v2
    - Generalise lpddr-props binding into memory-props binding
    - Add ddr4 binding
    - Generalise lpddr-channel binding into memory-channel-binding
- devicetree:
    - update stm32mp257f-ev1 board devicetree as per new ddr4-channel
      binding
- driver:
    - Remove unneeded pmu and event pointer tests in
      `stm32_ddr_pmu_get_counter()` as it would break before if they are
      NULL
    - Rename macro to be more driver specific
    - Fix few trailing commas in array and enum last entries
    - Stick to the use of `pmu->dev` in the probe instead of
      `&pdev->dev`
    - s/devm_clk_get_optional_prepared/devm_clk_get_optional_enabled/ to
      fix unwinding issue and remove the `clk_enable()` of the probe.
    - Move the `perf_pmu_register()` at the end of the probe
    - Add lacking spaces in regspec structs
    - Use DEFINE_SIMPLE_DEV_PM_OPS instead of SET_SYSTEM_SLEEP_PM_OPS
- Link to v2: https://lore.kernel.org/r/20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com

Changes in v2:
- MAINTAINERS:
    Due to reorganisation, my contract with ST ends at the end of this month
    and I will no longer have access to this mailbox.
    Therefore, I will be available for any mission related to embedded and
    kernel linux.
    Change email address in MAINTAINERS file for STM32 DDR PMU driver.
- devicetrees:
  -stm32mp257f-dk: add LPDDR4 channel
  -stm32mp257f-ev1: add DDR4 channel
- dt-bindings:
  - perf:
    - Change Maintainer email address
    - Drop obvious descriptions (clocks and reset property)
    - Drop redundant "bindings" in commit message
    - Drop unneedded "stm32mp151-ddr-pmu" compatible
    - s/st,dram-type/memory-channel/, memory-channel property is not in
      dtschema library so it will produce an error in the v2.
  - rcc:
    - Add required "access-controller-cells" property in example
  - ddr-channel:
    - Add bindings as per jedec,lpddrX-channel bindings
- driver:
  - Substitute the parsing of the 'st,dram-type' vendor devicetree
    property value with the parsing of the [lp]ddr channel compatible
  - Remove unneeded "stm32mp151-ddr-pmu" compatible
  - Use dev_err_probe when possible
  - Assert and deassert reset line unconditionnaly
  - Use `devm_reset_control_get_optional_exclusive` instead of
    `of_property_present` then `devm_reset_control_get`
  - Use `devm_clk_get_optional_prepared` instead of `of_property_present`
    then `devm_clk_get_prepared`
  - Disable and unprepare the clock at end of probe
  - Add io.h include as per LKP test report
  - Removed `of_match_ptr` reference in `platform_driver` struct
  - Add `pm_sleep_ptr` macro for `platform_driver` struct's `pm` field
  - Link to v1: https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com

---
Clément Le Goffic (20):
      bus: firewall: move stm32_firewall header file in include folder
      dt-bindings: stm32: stm32mp25: add `#access-controller-cells` property
      clk: stm32mp25: add firewall grant_access ops
      arm64: dts: st: set rcc as an access-controller
      dt-bindings: memory: factorise LPDDR props into SDRAM props
      dt-bindings: memory: introduce DDR4
      dt-bindings: memory: factorise LPDDR channel binding into SDRAM channel
      dt-binding: memory: add DDR4 channel compatible
      dt-bindings: memory: SDRAM channel: standardise node name
      arm64: dts: st: add LPDDR channel to stm32mp257f-dk board
      arm64: dts: st: add DDR channel to stm32mp257f-ev1 board
      dt-bindings: perf: stm32: introduce DDRPERFM dt-bindings
      perf: stm32: introduce DDRPERFM driver
      Documentation: perf: stm32: add ddrperfm support
      MAINTAINERS: add myself as STM32 DDR PMU maintainer
      ARM: dts: stm32: add ddrperfm on stm32mp131
      ARM: dts: stm32: add ddrperfm on stm32mp151
      arm64: dts: st: add ddrperfm on stm32mp251
      arm64: dts: st: support ddrperfm on stm32mp257f-dk
      arm64: dts: st: support ddrperfm on stm32mp257f-ev1

 Documentation/admin-guide/perf/index.rst           |   1 +
 Documentation/admin-guide/perf/stm32-ddr-pmu.rst   |  86 ++
 .../bindings/clock/st,stm32mp25-rcc.yaml           |   7 +
 .../memory-controllers/ddr/jedec,ddr4.yaml         |  34 +
 .../memory-controllers/ddr/jedec,lpddr-props.yaml  |  74 --
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |   2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |   2 +-
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |   2 +-
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |   2 +-
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} |  40 +-
 .../memory-controllers/ddr/jedec,sdram-props.yaml  |  94 +++
 .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml |  94 +++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   8 +
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  12 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  12 +
 drivers/bus/stm32_etzpc.c                          |   3 +-
 drivers/bus/stm32_firewall.c                       |   3 +-
 drivers/bus/stm32_rifsc.c                          |   3 +-
 drivers/clk/stm32/clk-stm32mp25.c                  |  40 +-
 drivers/perf/Kconfig                               |  11 +
 drivers/perf/Makefile                              |   1 +
 drivers/perf/stm32_ddr_pmu.c                       | 897 +++++++++++++++++++++
 {drivers => include/linux}/bus/stm32_firewall.h    |   0
 26 files changed, 1351 insertions(+), 98 deletions(-)
---
base-commit: f777d1112ee597d7f7dd3ca232220873a34ad0c8
change-id: 20250813-b4-ddrperfm-upstream-e8442bcc8396

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


