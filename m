Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9419C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nd0QLdvnS5lVPHO72YfmEMQvHtPA5bvSdPHpNLfeApg=; b=nmMzIsGBglU4YW
	eQchShFxNE5jgNnDzIjcaJ/3/BcvI0KSUD09HN7/p/Ur1Y//+RamNAIrWXo2f8eGUw3R9aEWA4eRp
	FTBHOMRKz0HUX0J0enSh7OMevUe4OTuEU/u7F1Y9yqbCOsrFraB5me6CRPDBfMqR1F0/RNwUejSjZ
	eUvj7oCDzBcx6Xa3yAIykKH6MpSa2qVszGvFkhdjmZnSTNPnOCkcTLeVSw6IKxD9+rtYkPWbTihvy
	9IXLsXjM+gWz+H9shK7Tv6N9vskSaeK7LruTVRSukddIXo2rrwYmPmBk6cFlNPSu55CWhS1MmWWIB
	9kkFr3P2bJ92IXuDoMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzapC-00000003IQO-0SJg;
	Tue, 01 Apr 2025 12:34:38 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzaer-000000039B0-2gTO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:23:59 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531BGm2Y032351;
	Tue, 1 Apr 2025 14:23:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Nd0QLdvnS5lVPHO72YfmEM
	QvHtPA5bvSdPHpNLfeApg=; b=465T5R9EYq/MbQHx1DH992QYuGDhw+4YihNPan
	UJspO/j8oi28wyRrqnI+bIcwx3vzLQAcleaxfk+1IQSQz+EX016kaDrytQFk1YBy
	tSxlbQayLkKh1expQ/nLQvJmf3C/ftYROpy+LE7Hih5Z19jW3h4sjiGZnN46BjPN
	d41KaCecEDtQlFh/6SGT4TIqI8VED4PhZ+zmjIplShiy4HF89v63Jf6XavsqfHm3
	Gmcli2rb/oCGN2blWrpRUSDaWDyssrdJiq/zXxdRpGiQlXs4B/sUERu1fPXD7qMR
	YwTyUplnLxvry2FPbUnRJU0nkeuotJjlExtG0e/BJEI2jZuQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45pua7ttc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 14:23:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B00D040052;
	Tue,  1 Apr 2025 14:22:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 326F28A047E;
	Tue,  1 Apr 2025 14:21:48 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 14:21:47 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v7 0/7] Add STM32MP25 SPI NOR support
Date: Tue, 1 Apr 2025 14:21:44 +0200
Message-ID: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFja62cC/2WNQQqDMBREryJ/3UhMomm76j2KSKKx/oUm5Ftpk
 dy9qdBVYTZvYN7sQC6iI7gWO0S3IaFfMuhTAf1klodjOGQGwUXNpeDsGWiNzsydp4Dd1rBBSWH
 OlRYVryHPQnQjvg7lvc08Ia0+vo+Hrfm2P1n1L8vhTGpre2OVVPJyGz1RSWvZ+xnalNIHlEyfZ
 7IAAAA=
X-Change-ID: 20250320-upstream_ospi_v6-d432a8172105
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_052357_981572_C83DC9B3 
X-CRM114-Status: GOOD (  14.89  )
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

This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.

On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
the memory area split, the chip select override and the time constraint
between its 2 Octo SPI children.

Due to these depedencies, this series adds support for:
  - Octo Memory Manager driver.
  - Octo SPI driver.
  - yaml schema for Octo Memory Manager and Octo SPI drivers.

The device tree files adds Octo Memory Manager and its 2 associated Octo
SPI chidren in stm32mp251.dtsi and adds SPI NOR support in stm32mp257f-ev1
board.
    
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v7:
  - update OMM's dt-bindings by updating :
    - clock-names and reset-names properties.
    - spi unit-address node.
    - example.
  - update stm32mp251.dtsi to match with OMM's bindings update.
  - update stm32mp257f-ev1.dts to match with OMM's bindings update.
  - Link to v6: https://lore.kernel.org/r/20250321-upstream_ospi_v6-v6-0-37bbcab43439@foss.st.com

Changes in v6:
  - Update MAINTAINERS file.
  - Remove previous patch 1/8 and 2/8, merged by Mark Brown in spi git tree.
  - Fix Signed-off-by order for patch 3.
  - OMM driver:
    - Add dev_err_probe() in error path.
    - Rename stm32_omm_enable_child_clock() to stm32_omm_toggle_child_clock().
    - Reorder initialised/non-initialized variable in stm32_omm_configure()
          and stm32_omm_probe().
    - Move pm_runtime_disable() calls from stm32_omm_configure() to
      stm32_omm_probe().
    - Update children's clocks and reset management.
    - Use of_platform_populate() to probe children.
    - Add missing pm_runtime_disable().
    - Remove useless stm32_omm_check_access's first parameter.
  - Update OMM's dt-bindings by adding OSPI's clocks and resets.
  - Update stm32mp251.dtsi by adding OSPI's clock and reset in OMM's node.

Changes in v5:
  - Add Reviewed-by Krzysztof Kozlowski for patch 1 and 3.

Changes in v4:
  - Add default value requested by Krzysztof for st,omm-req2ack-ns,
    st,omm-cssel-ovr and st,omm-mux properties in st,stm32mp25-omm.yaml
  - Remove constraint in free form test for st,omm-mux property.
  - Fix drivers/memory/Kconfig by replacing TEST_COMPILE_ by COMPILE_TEST.
  - Fix SPDX-License-Identifier for stm32-omm.c.
  - Fix Kernel test robot by fixing dev_err() format in stm32-omm.c.
  - Add missing pm_runtime_disable() in the error handling path in
    stm32-omm.c.
  - Replace an int by an unsigned int in stm32-omm.c
  - Remove uneeded "," after terminator in stm32-omm.c.
  - Update cover letter description to explain dependecies between
Octo Memory Manager and its 2 Octo SPI children.

Changes in v3:
  - Squash defconfig patches 8 and 9.
  - Update STM32 Octo Memory Manager controller bindings.
  - Rename st,stm32-omm.yaml to st,stm32mp25-omm.yaml.
  - Update STM32 OSPI controller bindings.
  - Reorder DT properties in .dtsi and .dts files.
  - Replace devm_reset_control_get_optional() by
    devm_reset_control_get_optional_exclusive() in stm32_omm.c.
  - Reintroduce region-memory-names management in stm32_omm.c.
  - Rename stm32_ospi_tx_poll() and stm32_ospi_tx() to respectively to
    stm32_ospi_poll() and stm32_ospi_xfer() in spi-stm32-ospi.c.
  - Set SPI_CONTROLLER_HALF_DUPLEX in controller flags in spi-stm32-ospi.c.

Changes in v2:
  - Move STM32 Octo Memory Manager controller driver and bindings from
    misc to memory-controllers.
  - Update STM32 OSPI controller bindings.
  - Update STM32 Octo Memory Manager controller bindings.
  - Update STM32 Octo Memory Manager driver to match bindings update.
  - Update DT to match bindings update.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (7):
      MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
      dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
      memory: Add STM32 Octo Memory Manager driver
      arm64: dts: st: Add OMM node on stm32mp251
      arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
      arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
      arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver

 .../memory-controllers/st,stm32mp25-omm.yaml       | 227 ++++++++++
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/memory/Kconfig                             |  17 +
 drivers/memory/Makefile                            |   1 +
 drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
 9 files changed, 864 insertions(+)
---
base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f
change-id: 20250320-upstream_ospi_v6-d432a8172105

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


