Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D7CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aq3WV+O2bYKN04nPLa/IM/y7JcSQg3FEsNEEzJZKpcs=; b=kqQje485EulxhYATimMXqFf6Rh
	jNc6It4Ezn4XpmZWlegVgpbMVzsCFsPW47JT4uPMVWBFnvyNmPRJhnyi4fWA2r/9sIIr3Y+iNckbV
	K9boi3EuFTQBlUwlC9lZz/o/21UMy82pVLYa2KG66gUG/4jXgJsEkka/uBQYBVPfxJwSBdWlXRi4D
	qBnrKeYouFVeCUkqbQEsSBeNRdcQix8ogFIBVsaQUYzSiJLoZhkxmhpJ3hwkRiFafncL+7ti4GS/B
	0Nw1CTkbFotGTLK8vok8mLi9srIfghKE+dRC8/f976QG9imz6qQ643tIY/uFDOC8wLTdfuSJFwBBs
	XTRbiz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCjc-0000000Cfc1-0QxS;
	Wed, 28 May 2025 09:06:04 +0000
Received: from mail-m15567.qiye.163.com ([101.71.155.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCYD-0000000CdXL-3AnR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:54:19 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b13e7e0;
	Wed, 28 May 2025 16:54:07 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-mmc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Shan-Chun Hung <shanchun1218@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	soc@lists.linux.dev,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v1 0/9] arm64: Introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board 
Date: Wed, 28 May 2025 16:54:03 +0800
Message-Id: <20250528085403.481055-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0gdVk1KGRhIGksfTUlNS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a971619533c09cckunm56b16e873977ff
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6PQw4QzExLkg8UQ4POg8#
	MhUaCTxVSlVKTE9DT0lJT05LS0JNVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQU1LTU83Bg++
DKIM-Signature: a=rsa-sha256;
	b=X92BVYze+FDykM3ZBObdOjojJQdlAV/2cTwFjvMT6/Xgl+LBFpnnRmsVeWD2scpXayORmz8+50gqzdjr1gNbbReYh/8o5rT662nj8gQ6IDydF+kW+TT58ZO0myp6ezLKEn5ZS4CyzQ8goN/RWjGTyxBPofsBe9CPgz/ExxoIK60=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=aq3WV+O2bYKN04nPLa/IM/y7JcSQg3FEsNEEzJZKpcs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015418_143792_6AEC9048 
X-CRM114-Status: GOOD (  15.52  )
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

Black Sesame Technologies C1200 is a high-performance Armv8 SoC designed for automotive
and industrial applications. The CDCU1.0 (Central Domain Control Unit) board is the
development platform built by Black Sesame Technologies. You can find more information
about the SoC and related boards at:
https://bst.ai

Currently, to run the upstream kernel on the CDCU1.0 board, you need to use the
bootloader provided by Black Sesame Technologies. The board supports various
interfaces including MMC/SD card, which is implemented using the BST C1200 DWCMSHC
SDHCI controller.

In this series, we add initial SoC and board support for kernel building. The series
includes:

Patch 1: Add Black Sesame Technologies vendor prefix in vendor-prefixes.yaml
- Adds "bst" vendor prefix for Black Sesame Technologies Co., Ltd.
- Required for device tree bindings to properly identify BST hardware

Patch 2: Add device tree bindings for BST SoC platforms
- Creates new binding file Documentation/devicetree/bindings/arm/bst.yaml
- Defines compatible strings for BST C1200 family and C1200 CDCU1.0 board
- Documents BST's focus on automotive-grade SoCs for ADAS applications

Patch 3: Add ARCH_BST configuration for BST silicon support
- Adds Kconfig option for BST architecture support
- Enables building kernel for BST platforms

Patch 4: Add device tree binding for BST DWCMSHC SDHCI controller
- Documents the BST C1200 SDHCI controller binding
- Required for MMC/SD card support on BST platforms

Patch 5: Add BST C1200 SDHCI controller driver
- Implements the MMC host controller driver for BST C1200
- Enables SD card support on BST platforms

Patch 6: Add device tree support for BST C1200 CDCU1.0 board
- Adds device tree source files for C1200 SoC and CDCU1.0 board
- Configures hardware components including MMC controller

Patch 7: Enable BST SoC in arm64 defconfig
- Adds ARCH_BST configuration to default arm64 config

Patch 8: Enable BST C1200 DWCMSHC controller in defconfig
- Enables MMC controller driver in default arm64 config

Patch 9: Update MAINTAINERS for BST support
- Adds maintainer information for BST ARM SoC support
- Consolidates BST-related entries

Albert Yang (9):
  dt-bindings: vendor-prefixes: Add Black Sesame Technologies Co., Ltd.
  dt-bindings: arm: add Black Sesame Technologies (bst) SoC
  arm64: Kconfig: add ARCH_BST for bst silicons
  dt-bindings: mmc: add binding for BST DWCMSHC SDHCI controller
  mmc: sdhci: add Black Sesame Technologies BST C1200 controller driver
  arm64: dts: bst: add support for Black Sesame Technologies C1200
    CDCU1.0 board
  arm64: defconfig: Enable BST SoC
  arm64: defconfig: enable BST C1200 DWCMSHC SDHCI controller
  MAINTAINERS: add and consolidate Black Sesame Technologies (BST) ARM
    SoC support

 .../devicetree/bindings/arm/bst.yaml          |  34 +
 .../bindings/mmc/bst,dwcmshc-sdhci.yaml       | 115 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  10 +
 arch/arm64/Kconfig.platforms                  |  19 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/bst/Makefile              |  10 +
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  44 +
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 130 +++
 arch/arm64/configs/defconfig                  |   3 +
 drivers/mmc/host/Kconfig                      |  11 +
 drivers/mmc/host/Makefile                     |   1 +
 drivers/mmc/host/sdhci-of-bst-c1200.c         | 920 ++++++++++++++++++
 13 files changed, 1300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bst.yaml
 create mode 100644 Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
 create mode 100644 arch/arm64/boot/dts/bst/Makefile
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi
 create mode 100644 drivers/mmc/host/sdhci-of-bst-c1200.c

-- 
2.25.1


