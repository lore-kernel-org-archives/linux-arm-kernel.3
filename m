Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B66CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1DKsH+rBxhhX0S7q5j7Imf4QRtMVwAr8DI0SGUYrw3Q=; b=QTfxv3GfykScE92YU9Fz6hZHvO
	/azwZ5vvG6syYoLwnFgn6HbcQsMmE4NfwGDdeC3U0DCrD6211rPIdI9nSf5KT9LCy9Yuy16CqSdpV
	2m+kctovrs+FVEMfzRavPSg9c3VN061hkMBHgLMaiw3Siq+6I/zZMb+CTMJA4Hd/618WwkOhuNCav
	1J6JkC41towyRaNGvIkECu890J1+VLNvOB25GueqSc2jYrGxvWi3ZjMiRet18F/ER4aVmfbIFMD5v
	aSQ3iL5VFeIAOSXo08WR3zcPlr2wUkDOdlmNSNtp29N4bO5aEWThUGy0+ninW+qinDqSBtdw7BUW0
	03Ql2GjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodkV-0000000CfEN-2oYh;
	Wed, 20 Aug 2025 08:00:47 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodhr-0000000Cegl-24Ws
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:58:04 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K7i0or011121;
	Wed, 20 Aug 2025 09:57:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=1DKsH+rBxhhX0S7q5j7Imf
	4QRtMVwAr8DI0SGUYrw3Q=; b=1XkDdvpUfqGRmaDpUA+NHY8GRdZFh0VR/oXcQj
	fSXbsrEs/m6fiUhIgAaPBRKuf1p3vScfQprBz3C8/QFkkU9H4LNwysCzgghEJcEV
	Y7FrLh6yzu+Ysg8Bt8fby/Txpg9qqabS4U4dydQ3+0Ve6VBz53UxzvZi7C3cdRWC
	Oe3hp20q1xG98jBYz/3wShjE29eF8FWF3Q5lk0MdEAYAFSgymGpAW8AoujBCwfCh
	XPP0NJLvw2yqlP67sA+dOGy+1wvBdYHWvVtXpy+3Cc+bKzLJy7tOQ2fP1390NVky
	ml291tPvhmOg4IWmoJy7244J8C9MTXNkZe4zJj/HNKii/AkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n7w5rsbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:57:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 94BB940044;
	Wed, 20 Aug 2025 09:55:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3061B5E80FF;
	Wed, 20 Aug 2025 09:54:34 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 09:54:33 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linus.walleij@linaro.org>, <corbet@lwn.net>, <p.zabel@pengutronix.de>,
        <shradha.t@samsung.com>, <mayank.rana@oss.qualcomm.com>,
        <namcao@linutronix.de>, <qiang.yu@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <inochiama@gmail.com>,
        <quic_schintav@quicinc.com>
CC: <johan+linaro@kernel.org>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v13 00/11] Add STM32MP25 PCIe drivers
Date: Wed, 20 Aug 2025 09:54:00 +0200
Message-ID: <20250820075411.1178729-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_005803_819999_1220C638 
X-CRM114-Status: GOOD (  16.92  )
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

Changes in v13:
   - Rebase on pci/next
   - Replace access to dev->pins->init_state by new
     pinctrl_pm_select_init_state().
   - Document pinctrl PM state API.
   - Group GPIO PERST# de-assertion with PVPERL delay. (Bjorn)

Changes in v12:
   Fix warning reported by kernel test robot <lkp@intel.com>

Changes in v11:
   Address comments from Manivanna:
   - RC driver: Do not call pm_runtime_get_noresume in probe
                More uses of dev_err_probe
   - EP driver: Use level triggered PERST# irq

Changes in v10:
   - Update pcie_ep bindings with dbi2 and atu regs,
     thus remove Reviewed-by and Acked-by.
   
Changes in v9:
   - Describe atu and dbi2 shadowed registers in pcie_ep node
   Address RC and EP drivers comments from Manivanna:
   - Use dev_error_probe() for pm_runtime_enable() calls
   - Reword Kconfig help message
   - Move pm_runtime_get_noresume() before devm_pm_runtime_enable()

Changes in v8:
   - Whitespace in comment
   
Changes in v7:
   - Use device_init_wakeup to enable wakeup
   - Fix comments (Bjorn)

Changes in v6:
   - Call device_wakeup_enable() to fix WAKE# wakeup.
   Address comments from Manivanna:
   - Fix/Add Comments
   - Fix DT indents
   - Remove dw_pcie_ep_linkup() in EP start link
   - Add PCIE_T_PVPERL_MS delay in RC PERST# deassert
   
Changes in v5:
   Address driver comments from Manivanna:
   - Use dw_pcie_{suspend/resume}_noirq instead of private ones.
   - Move dw_pcie_host_init() to probe
   - Add stm32_remove_pcie_port cleanup function
   - Use of_node_put in stm32_pcie_parse_port
   - Remove wakeup-source property
   - Use generic dev_pm_set_dedicated_wake_irq to support wake# irq
   
Changes in v4:
   Address bindings comments Rob Herring
   - Remove phy property form common yaml
   - Remove phy-name property
   - Move wake_gpio and reset_gpio to the host root port
   
Changes in v3:
   Address comments from Manivanna, Rob and Bjorn:
   - Move host wakeup helper to dwc core (Mani)
   - Drop num-lanes=<1> from bindings (Rob)
   - Fix PCI address of I/O region (Mani)
   - Moved PHY to a RC rootport subsection (Bjorn, Mani)
   - Replaced dma-limit quirk by dma-ranges property (Bjorn)
   - Moved out perst assert/deassert from start/stop link (Mani)
   - Drop link_up test optim (Mani)
   - DT and comments rephrasing (Bjorn)
   - Add dts entries now that the combophy entries has landed
   - Drop delaying Configuration Requests

Changes in v2:
   - Fix st,stm32-pcie-common.yaml dt_binding_check	

Changes in v1:
   Address comments from Rob Herring and Bjorn Helgaas:
   - Drop st,limit-mrrs and st,max-payload-size from this patchset
   - Remove single reset and clocks binding names and misc yaml cleanups
   - Split RC/EP common bindings to a separate schema file
   - Use correct PCIE_T_PERST_CLK_US and PCIE_T_RRS_READY_MS defines
   - Use .remove instead of .remove_new
   - Fix bar reset sequence in EP driver
   - Use cleanup blocks for error handling
   - Cosmetic fixes

Christian Bruel (11):
  Documentation: pinctrl: Describe PM helper functions for standard
    states.
  pinctrl: Add pinctrl_pm_select_init_state helper function
  dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
  PCI: stm32: Add PCIe host support for STM32MP25
  dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
  PCI: stm32: Add PCIe Endpoint support for STM32MP25
  MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
  arm64: dts: st: add PCIe pinctrl entries in stm32mp25-pinctrl.dtsi
  arm64: dts: st: Add PCIe Root Complex mode on stm32mp251
  arm64: dts: st: Add PCIe Endpoint mode on stm32mp251
  arm64: dts: st: Enable PCIe on the stm32mp257f-ev1 board

 .../bindings/pci/st,stm32-pcie-common.yaml    |  33 ++
 .../bindings/pci/st,stm32-pcie-ep.yaml        |  73 ++++
 .../bindings/pci/st,stm32-pcie-host.yaml      | 112 +++++
 Documentation/driver-api/pin-control.rst      |  57 ++-
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  20 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  59 +++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  21 +
 drivers/pci/controller/dwc/Kconfig            |  24 ++
 drivers/pci/controller/dwc/Makefile           |   2 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c    | 384 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-stm32.c       | 360 ++++++++++++++++
 drivers/pci/controller/dwc/pcie-stm32.h       |  16 +
 drivers/pinctrl/core.c                        |  13 +
 include/linux/pinctrl/consumer.h              |  10 +
 15 files changed, 1189 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
 create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h

-- 
2.34.1


