Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7E6C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M6wCzfhmKz24hutGEjvI4yacgICEWTN17S8CLU7EPbY=; b=nMn8qcqzSmMX6P
	jyABz0QPATFcKEsz8SzFKztSXA0txwxIEDhhCJYaOIv+g7tgufno8A/NB6sPsJ1pbEv01BVXaliqf
	JpknvYeR4fTe0eH9bzOudiKX8NCrG4AdIrOd2ZA6ZFayRX0JDjsa621roB/iqkO6juxZcEyCEDbLA
	xTCymoml4eKIrva8HC75+04N7UuOg1Sb2a/kCMxoDsEJt5jFH/NPrKzAbduLXG3ZoH8Klm25ZCYUy
	+ZxLbaX2TuHX9xt7uCrsLbp8y1UuhuIBj3X/Wp6Johz9/v5DGJ2yZIBS52Us3rTH4MGvjDOIwlgND
	n4YwQ1vM9BNuNr9Vy3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFLZ-0000000F752-1E4j;
	Fri, 11 Jul 2025 15:07:33 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF60-0000000F46g-2ZSK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:51:31 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BEbO5E001763;
	Fri, 11 Jul 2025 16:51:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=M6wCzfhmKz24hutGEjvI4y
	acgICEWTN17S8CLU7EPbY=; b=j3IebeREKy5UR1jjaOSFEx+MnsAPRiMr4hW2wc
	QY3tXcWf2eOfC6Eg/jfA/6vENZaErpJksMENN5r+kqb4d3PFoZTBVwipPJfMGA+a
	cVTdzoNMQC6fBxkLBYq5K59oo6oGYqfhlNT3WyBnTAX+Kq9uziVP35iyWysL+Bgg
	2CPsaO7WS3GuzTyijV3FjBUW+xQp59i0GDU/QB4pjEc2JO+7PiyCigaNcuKHEVML
	AaeAPmDoU7BfhrI5ZBZQYFSyQzIUfdMqtLbSwSN+PoQtS5EXIK+HHACXakEA71KQ
	cNTdQEkfiGkMMSSCYjV9/acjLN/IieuWvHvVwgTaWdJ1mtcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ps6ay386-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 16:51:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C699C40053;
	Fri, 11 Jul 2025 16:49:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2368BB4A8CF;
	Fri, 11 Jul 2025 16:49:12 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:11 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v2 00/16] Introduce STM32 DDR PMU for STM32MP platforms
Date: Fri, 11 Jul 2025 16:48:52 +0200
Message-ID: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFQkcWgC/22NwQ7CIBBEf6XZszQUA6gn/8P0gGWxHCjNbiWap
 v8u1qtze5PMmxUYKSLDpVmBsESOeaqgDg0Mo5seKKKvDEoqLbUywnuakUISz5kXQpfEPUgbtLV
 Wewd1NxOG+Nqdt77yGHnJ9N4vSvdtfzajjn9spRNSWB9qOnOSZ3kNmbnlpR1ygn7btg9IElCst
 AAAAA==
X-Change-ID: 20250526-ddrperfm-upstream-bf07f57775da
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075128_923567_05EA3907 
X-CRM114-Status: GOOD (  16.54  )
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

This patch series introduces the DDR Performance Monitor (DDRPERFM) support for
STM32MP platforms.

The series firstly improves the STM32MP25 RCC driver to make it usable
as an access controller, needed for driver probe.

It also includes the addition of device tree bindings, the HDP driver,
documentation and updates to the device tree files for
STM32MP13, STM32MP15 and STM32MP25 SoCs.
The series also updates the MAINTAINERS file to include myself as the
maintainer for the STM32 DDR PMU driver.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
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
Clément Le Goffic (16):
      bus: firewall: move stm32_firewall header file in include folder
      dt-bindings: stm32: stm32mp25: add `access-controller-cell` property
      clk: stm32mp25: add firewall grant_access ops
      arm64: dts: st: set rcc as an access-controller
      dt-bindings: memory: add jedec,ddr[3-4]-channel binding
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
 .../memory-controllers/ddr/jedec,ddr-channel.yaml  |  53 ++
 .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml |  87 ++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |   7 +
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   8 +
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  12 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  10 +
 drivers/bus/stm32_etzpc.c                          |   3 +-
 drivers/bus/stm32_firewall.c                       |   3 +-
 drivers/bus/stm32_rifsc.c                          |   3 +-
 drivers/clk/stm32/clk-stm32mp25.c                  |  40 +-
 drivers/perf/Kconfig                               |  11 +
 drivers/perf/Makefile                              |   1 +
 drivers/perf/stm32_ddr_pmu.c                       | 910 +++++++++++++++++++++
 {drivers => include/linux}/bus/stm32_firewall.h    |   0
 19 files changed, 1249 insertions(+), 7 deletions(-)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250526-ddrperfm-upstream-bf07f57775da

Best regards,
--  
Clément Le Goffic <clement.legoffic@foss.st.com>


