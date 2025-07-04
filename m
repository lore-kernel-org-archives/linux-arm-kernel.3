Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CC4C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aYR46PyYKsywLFSglw6Au+qK2jurcRmn9l9ITZWUKSQ=; b=aVmL+1Fg7FUcfmZgJc2pnp34+0
	3g1MX0zpvqNbd5qs1aVnvEq3qNpzlNsgcQIFBsU8MWzc7tXu1om1or90qCdhzH8Quxr4vg9h5PU6L
	6IND1dhodG0Emlwta4doulbQ5AWi54V3xL08ew1iNUK6nwJsjqux76R9xrZNPrsiHta8dljV7UShk
	1C7UOgz+BrbzSRnijhq6QRddhQJmyOXJXNeD6z77p630zRQKehUhzaOXxIee3wHFaoZROTH3AuMVR
	9A0iSIgBgrIzccGzNzn2WdVhDasWRlc8bxjTTtMuLpM7ZFS5Ks9D6wVqR+58zszdofsH3bPygjrU8
	sXZoZ5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeID-0000000E9sF-1ItM;
	Fri, 04 Jul 2025 11:09:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdN8-0000000E0UH-2vMt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 10:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aYR46PyYKsywLFSglw6Au+qK2jurcRmn9l9ITZWUKSQ=; b=Xg/CnMlkGNL0ahLwdsvg3jS+wM
	G5ogtRRbDq6P+JzNS2WP93XFqwtP0pPn4CiZYx1hJlaSp160WDLsqPNz/wr2SlAdg9qgNdExbX6zF
	nSsy8Llb5XA4ve3emGWb/F4panypNv8K0EaaXYqcRGnCUlwx0tO+20+8YzeVqCeuBlw75x2aAd86Q
	QXPdUaxSCOQsraNsxgD7iRRiE6wMhzxTdQc8Zw1zN86zQmpEGnQsBsA4TAAE/ib2eDoX6h3IZNHgf
	K1KK6JWo3t1gVaW5Dl2SJELd4PzRDYSH1B0OkfMnBnYP+nUHt8fXC70Pbt2Ieg1OvKT4YnyGK40Uu
	2Xsq/udA==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdN4-00000007vFo-3UJo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 10:10:21 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 564AAApc3799458;
	Fri, 4 Jul 2025 05:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751623810;
	bh=aYR46PyYKsywLFSglw6Au+qK2jurcRmn9l9ITZWUKSQ=;
	h=From:To:CC:Subject:Date;
	b=d+BpHqg4/WvJPRqxTllQdSHzb/3Yv4FIoUGY+LJppP6yGdPmmzFBf2uz8bH5L0qY3
	 KTwJzsIoyCqkVW6dV4A33GjuIORNQ64OF7oOwky3pM0PiULxcCPue7+57tuF38qeA1
	 SQDI7eqQrOIoigk/dAG0ZSD6LE1AUpmocRM/i7w8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 564AAAM63289891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 05:10:10 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 05:10:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 05:10:09 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 564AA8lb2806197;
	Fri, 4 Jul 2025 05:10:09 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
Subject: [PATCH v6 0/4] Add support for AM62D2 SoC and EVM
Date: Fri, 4 Jul 2025 15:39:50 +0530
Message-ID: <20250704100954.2231853-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_111019_301847_2EE59C66 
X-CRM114-Status: GOOD (  17.71  )
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
V5 -> V6:
	- Deleted vpu and codec node instead of disable.
	- Enabled heartbeat LED.
	- Removed bootph-all property from parent nodes.
	- Misc dts changes/correction as suggested.

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
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |  13 +
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |   2 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 617 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62d2.dtsi         |  20 +
 arch/arm64/boot/dts/ti/k3-pinctrl.h           |   3 +
 7 files changed, 664 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi

-- 
2.34.1


