Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308C4CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+L+PRoKjfXu5O08x0ZQYLzuN4uifGZ1A2IBkEgBFIlw=; b=PQmmr0bKc5vWfd2h1J8WJrOc61
	T42YRxezxLsC2YlDk+0vqFnfJJLdoTNR5GqRf6LcU8bJjHXOBjsk7QKCOC/VP+ttYO1lPKSfTedVE
	QW0nGG3mg1N3g+3b0GWC/f3dGF9W/ufIzNTTZo72pED5KmUxenn2JeddRvXqvnJfkg8QiW7Brsmie
	DukNn46yrYuLTCP8JSmNbVAy5tOx1EC+aD+GyUPNBvUA95XuDn8N/Sm/QJSm4azyVezOqoIMXBJE0
	HNCEyppqHwdCL/PiqwzsKp8bKfiWOstBkVUW2Ty/NimZuHKpJESHHKQk2147DdemlTy9yHPfeFSpV
	jnVqaFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MjJ-00000004fDy-3AK1;
	Thu, 16 Oct 2025 12:05:13 +0000
Received: from mail-m1973193.qiye.163.com ([220.197.31.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MjF-00000004fAw-3q8D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:05:11 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 262625879;
	Thu, 16 Oct 2025 20:05:01 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzysztof.kozlowski@linaro.org
Cc: krzk+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v5 0/6] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Thu, 16 Oct 2025 20:04:51 +0800
Message-ID: <20251016120457.2390103-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99ece8c30109cckunm868bd78f12240
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGk1PVkJMShkdGE8dT09KSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OBiSbEDT6Nfw+lkhVSWVYDmiLAr4O7Op8NZr4+3uzvcc7+5rhQgvmXG6nQoDm73FXJjIIw0WFETyRbqQK6+FdRu6ARa7tl58DvJgCmCZ6nn+y0gTI2axhviQEjDq1P+lRqL25yCYCTa2mgYnsh+yN4WIfBXEA8zH12ElDJXloQQ=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=+L+PRoKjfXu5O08x0ZQYLzuN4uifGZ1A2IBkEgBFIlw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_050510_362328_82BB2943 
X-CRM114-Status: GOOD (  15.74  )
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

This patch series introduces platform support for Black Sesame Technologies
(BST) C1200 SoC and CDCU1.0 ADAS 4C2G board. BST is a leading automotive-grade
computing SoC provider focusing on intelligent driving, computer vision, and AI
capabilities for ADAS and autonomous driving applications. You can find more
information about the SoC and related boards at: https://bst.ai

This series provides the foundational platform enablement including device tree
bindings, SoC and board device trees, platform configuration, and maintainer
information. MMC/SDHCI driver support will be submitted in a separate patch series.

The series includes:

Patch 1: dt-bindings: vendor-prefixes: Add Black Sesame Technologies Co., Ltd.
- Adds BST vendor prefix to device tree vendor prefixes
- Provides company information and website link

Patch 2: dt-bindings: arm: add Black Sesame Technologies (bst) SoC
- Adds device tree bindings for BST ARM SoC family
- Defines compatible strings for C1200 SoC and CDCU1.0 board

Patch 3: arm64: Kconfig: add ARCH_BST for Black Sesame Technologies SoCs
- Adds ARCH_BST configuration option for BST SoC family
- Enables platform-specific features and driver dependencies

Patch 4: arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board
- Complete device tree support for BST C1200 CDCU1.0 ADAS 4C2G board
- Includes SoC dtsi and board-specific dts files
- Defines CPU, memory, peripherals, and platform-specific configurations

Patch 5: arm64: defconfig: enable BST platform support
- Enables CONFIG_ARCH_BST in ARM64 defconfig
- Provides out-of-box support for BST platforms

Patch 6: MAINTAINERS: add Black Sesame Technologies (BST) ARM SoC support
- Adds maintainer entry for BST ARM SoC support
- Covers device tree bindings and board files
- Sets status as "Supported" based on review feedback

Changes for v5:
- Remove MMC-related patches (dt-bindings mmc, mmc driver, bounce buffer enhancement)
  as they will be submitted separately in a dedicated MMC patch series
- Patch 4 (arm64: dts): Remove MMC node and MMC clock from SoC DTSI completely; remove MMC node override in board DTS (MMC driver and bindings will be submitted separately)
- Patch 5 (arm64: defconfig): Remove CONFIG_MMC_SDHCI_BST configuration
- Patch 6 (MAINTAINERS): Remove MMC driver and dt-bindings file entries; change status
  from "Maintained" to "Supported" based on review feedback
- Rebase to v6.18-rc1

Changes for v4:
- Rebase to 6.17-rc5
- Patch 1 (dt-bindings: vendor-prefixes):
	- Adjust ^bst to the correct alphabetical order
	- Adjust Acked-by order
- Patch 2 (dt-bindings: arm):
	- Remove Signed-off-by: Ge Gordon
	- Add Reviewed-by Krzysztof Kozlowski info
- Patch 3 (arm64: Kconfig):
	- Remove Signed-off-by: Ge Gordon
- Patch 4 (arm64: dts):
	- Remove Signed-off-by line for Ge Gordon
	- Reorder device tree node properties for better consistency
	- CPU nodes: move `device_type` before `compatible`, add explicit `reg` values
	- MMC node: change compatible from `bst,c1200-dwcmshc-sdhci` to `bst,c1200-sdhci`
	- MMC node: remove `bus-width` and `non-removable` from SoC dtsi, move to board dts
	- SoC node: reorder properties (`ranges` before address/size cells)
	- UART node: reorder properties (clock-frequency before interrupts)
	- GIC node: reorder properties for better readability
	- Timer node: reorder properties (always-on before interrupt-parent)
	- Board DTS: add `bus-width = <8>` and `non-removable` to MMC node
	- Board DTS: reorder MMC and UART node references
- Patch 5 (arm64: defconfig):
	- move CONFIG_MMC_SDHCI_BST before CONFIG_MMC_SDHCI_F_SDH30
	- Remove Signed-off-by line for Ge Gordon
	- Simplify commit message (remove detailed description about eMMC/SD functionality)
- Patch 6 (MAINTAINERS):
	- Changed file name: sdhci-of-bst-c1200.c to sdhci-of-bst.c
	- Change title from "add and consolidate" to just "add"
	- Simplify commit message description
	- Remove Signed-off-by line for Ge Gordon

Changes for v3:
- Patch 2: Add Signed-off-by: Ge Gordon
- Patch 3: Reword subject from "for bst silicons" to "for Black Sesame Technologies SoCs"
	and drop unrelated whitespace hunk
- Patch 4: Split defconfig enablement out into dedicated patch, refine memory description,
	adjust node ordering, remove gic mask
- Patch 5: Also enable CONFIG_ARCH_BST in arm64 defconfig

Changes for v2:
- Patch 2: Remove unnecessary pipe in description, drop invalid compatible entry,
	remove root node definition
- Patch 3: Place configuration entry in correct alphabetical order, use generic family name,
	follow upstream naming conventions
- Patch 4: Reorganize memory map, update controller definitions, remove deprecated
	properties, standardize interrupt definitions, add root compatible string

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---

Albert Yang (6):
  dt-bindings: vendor-prefixes: Add Black Sesame Technologies Co., Ltd.
  dt-bindings: arm: add Black Sesame Technologies (bst) SoC
  arm64: Kconfig: add ARCH_BST for Black Sesame Technologies SoCs
  arm64: dts: bst: add support for Black Sesame Technologies C1200
    CDCU1.0 board
  arm64: defconfig: enable BST platform support
  MAINTAINERS: add Black Sesame Technologies (BST) ARM SoC support

 .../devicetree/bindings/arm/bst.yaml          | 31 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  8 ++
 arch/arm64/Kconfig.platforms                  |  8 ++
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/bst/Makefile              |  2 +
 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    | 24 +++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 97 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 9 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bst.yaml
 create mode 100644 arch/arm64/boot/dts/bst/Makefile
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts
 create mode 100644 arch/arm64/boot/dts/bst/bstc1200.dtsi

-- 
2.43.0


