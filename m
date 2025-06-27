Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979E5C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y6ab/7/rCmnpESR4rDGCTeqcMqaugD9Zg+9DrZJj9Yo=; b=lJHSX+aOSJarYfN6d3b3mFiZzC
	K8oOPVhnyrEcm+OS1JpbBEVB68oDdojAnrZBDas/r0vC+icyDYetKmMolAd5KSKKsdJ94Df3ucMGv
	nYbl5sXL+Tomd6fE8mkGZICMh6SghUl75ZUl060KivbGfiIG+zIUxT7H/tpOv/PjJgDAnnOCb9erW
	7ISSPwhBRyJJV4AVwspdAc1IGyU1n4qxdcCzpR18Bwa2cpNqT8OvikvCXIVGXgVNhm+LT/+pr/HME
	KJ1CykXVmNj3aoyxTWf14GQAUxot7YXfKrmzVvyxjo5gICH1uodWHYKfDWACXQcgjMcekAlNGyTlz
	ZwVHey9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8A3-0000000Edc6-2kCK;
	Fri, 27 Jun 2025 12:26:31 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7iY-0000000EZs7-0uco
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:58:09 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RBw0gc2747731;
	Fri, 27 Jun 2025 06:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751025480;
	bh=Y6ab/7/rCmnpESR4rDGCTeqcMqaugD9Zg+9DrZJj9Yo=;
	h=From:To:CC:Subject:Date;
	b=E16CT/WLYaoZSIQ4HS8VVYCYEz68f2RkbMPif049nDXdeFTHFt0am352/ujRR5Y4U
	 fHcwGVUh3excQ5wFg0+4ZMdXzkoQB8hic1yd2/b66z1CaCIm04LCKbaGhFy/9HD+BL
	 vmc9GkJPh2kCnt38syFf+ZL+GbW+suSBxtOPGj+A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RBw0KX3207803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 06:58:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 06:58:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 06:57:59 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RBvxVO2754930;
	Fri, 27 Jun 2025 06:57:59 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
Subject: [PATCH v5 0/4] Add support for AM62D2 SoC and EVM
Date: Fri, 27 Jun 2025 17:27:49 +0530
Message-ID: <20250627115753.2246881-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_045806_385469_5E88BE88 
X-CRM114-Status: GOOD (  16.72  )
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

This patch series adds support for the AM62D SoC and its evaluation
module (EVM) board, enable eMMC and firmware-name update for
AM62D2-EVM board.

The AM62D SoC is a high-performance Digital Signal Processing (DSP)
device with a quad-core Cortex-A53 cluster, dual Cortex-R5F cores,
and a Cx7 DSP core with Matrix Multiplication Accelerator (MMA).
It features a range of peripherals, including multichannel audio
serial ports, Ethernet, UARTs, SPI, I2C, USB, and more.

The EVM board is a low-cost, expandable platform designed for the AM62D2
SoC, having 4GB LPDDR4 RAM, Gigabit Ethernet expansion connectors, audio
jacks, USB ports, and more.

This SoC is part K3 AM62x family, which includes the AM62A and AM62P
variants. While the AM62A and AM62D are largely similar, the AM62D is
specifically targeted for general-purpose DSP applications, whereas the
AM62A focuses on edge AI workloads. A key distinction is that the AM62D
does not include multimedia components such as the video encoder/decoder,
MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
processing, or the display subsystem. Additionally, the AM62D has a
different pin configuration compared to the AM62A, which impacts embedded
software development.

This patch series includes updates to the dts and dtsi files, device tree
bindings, and pin control header files to support the AM62D SoC and EVM
board.

Bootlog-

SD Card
https://gist.github.com/paresh-bhagat12/1757cc54a39f1baf883341af2a383db6

eMMC
https://gist.github.com/paresh-bhagat12/36c756422ff71fa9568c45e9b44332f0

Tech Ref Manual-https://www.ti.com/lit/pdf/sprujd4
Schematics Link-https://www.ti.com/lit/zip/sprcal5

Change Log:
V4 -> V5:
	- Added bootph-all property only in leaf node.
	- Added a new dtsi file for am62d2 SOC.
	- Updated commit msg and description for dt bindings patch.
	- Updated cpsw_port node for rx internal delays. This change also
	  depends on this series for functionality (networking)
	  https://lore.kernel.org/r/cover.1750756583.git.matthias.schiffer@ew.tq-group.com/
	- Updated device tree to follow ordering of properties and
	  schematic.
	  https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

V3 -> V4:
	- Added bootph-all property at source nodes.
	- Reuse dtsi files of am62a (instead of common files).
	- Added eMMC support.
	- Updated firmware name for am62d.

V2 -> V3:
	- Added bootph-all property to essential device nodes.
	- Updated reserved memory for ATF.
	- Introduce common dtsi files for AM62A and AM62D.

V1 -> V2: Fixed indentation and build errors.

Paresh Bhagat (4):
  arm64: dts: ti: Add bootph property to nodes at source for am62a
  dt-bindings: arm: ti: Add AM62D2 SoC and Boards
  arm64: dts: ti: Add pinctrl entries for AM62D2 family of SoCs
  arm64: dts: ti: Add support for AM62D2-EVM

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   3 +
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  14 +
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |   1 +
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |   2 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 599 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62d2.dtsi         |  25 +
 arch/arm64/boot/dts/ti/k3-pinctrl.h           |   3 +
 8 files changed, 653 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi

-- 
2.34.1


