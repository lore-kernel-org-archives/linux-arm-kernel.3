Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524ECC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t56LCn9zVC4bMWXJ0jCrLrFYGf4z8MrVC5AS5n4rLs8=; b=OnvVKr18+cnaSIcffEWMU+BAso
	LdubHFh+CANi9plnyoZRr4O+9+nRAHo+7QOLTTCpH3ayzAjF3Nla/L3A6cV6rbLmO2+dTGIxkYSAf
	nJ3XEOjudnc41y7VUYMx5nAd4RQkMNH1O6oR4eZsPXamXv8XgiHx+K9YQjpVEhKNXxNyuWxJTc6MJ
	Ab0z+upRxz9M84d2AgonEvGkqHceBIJ4HgEVfddrROUDFGXhVzU1YLLQceqhjd5Fsz1XxxIpWIsJw
	KO5lcV3FahHz2ElXgjWQcE4Ai4qN88CukpHAaNB/ORQd7CeIJlE3NhdxuqPLmBXEniCgHwtdeWC+l
	M6jVYBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUxs-0000000GNH9-21KA;
	Sat, 12 Jul 2025 07:48:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUqm-0000000GMmO-2qNM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 07:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59DC560008;
	Sat, 12 Jul 2025 07:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E930C4AF09;
	Sat, 12 Jul 2025 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752306045;
	bh=j3RoFO1dhVwL6jmvjZyPBg5Kvfp8mEXq3Fmz3LtyzAE=;
	h=From:To:Cc:Subject:Date:From;
	b=Y0ycObuOUGsRDhtbaZJzXbYT2gZ+H8JuiqMmoSCKBcG7pIgJ1MBTxIW2yOwoIHLfd
	 YaeIcr9Y1le8FnCQO/CRvhrgcqT6jGMvo1swNgYSicKZYTbV7HVNi5dMKXZQEA/GZW
	 h5UUEmc/hJ6E806EGKK8T1lCwGC7z/ZssU866tgZ7Qg5VVfRuafWG6fjkUNWDnBGPH
	 pvzaYuUvIWYQX/X69W4rPVBzvJvXRE89ko+cYKNanbXgsmyS/D/19YtHTyN3Gf3ziV
	 eQ27XgYp9IDfQCkHcNGhAubbl66xGh/s2Bn+QeB3x18cBk+LId2xCxdfif+VtNSQQt
	 xMSCV4X3DGdgw==
Received: by wens.tw (Postfix, from userid 1000)
	id 4FCC05FE7F; Sat, 12 Jul 2025 15:40:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 0/5] allwinner: a523: Add power controllers
Date: Sat, 12 Jul 2025 15:40:16 +0800
Message-Id: <20250712074021.805953-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@csie.org>

Hi folks,

This is v3 of my A523 power controllers series.

Changes since v2:
- pck600 driver:
  - Fixed whitespace issue
  - Added explanation about possible PCK-600 lineage and document
    references to driver
  - Changed Kconfig option to tristate
  - Rewrote Kconfig option help text to make it clear that the driver
    is required for certain peripherals to work
  - Made it depend on ARCH_SUNXI or COMPILE_TEST
  - Made it enabled by default for ARCH_SUNXI
  - Renamed PPU_PWSR_PWR_STATUS to PPU_PWR_STATUS, and added a comment
    to note the macro is shared between two registers
- New patch changing sun20i-ppu driver to tristate, and enable by
  default for ARCH_SUNXI
- Fixed pck-600 header path in dtsi file
- Link to v2:
  https://lore.kernel.org/all/20250709155343.3765227-1-wens@kernel.org/

Changes since v1:
- Re-order compatible string entries
- Fix name of header file to match compatible string
- Link to v1:
  https://lore.kernel.org/all/20250627152918.2606728-1-wens@kernel.org/

This series adds the power controllers found in the Allwinner A523
family of SoCs. There are two power controllers. One is the same type
as those found in the D1 SoC, just with a different number of valid
power domains. The second is (I assume) a unit based on ARM's PCK-600
power controller. Some of the registers and values match up, but there
are extra registers for delay controls in the PCK-600's reserved
register range.

Patch 1 adds new compatible string entries for both of these
controllers.

Patch 2 adds support for the A523 PPU to the existing D1 PPU driver.

Patch 3 adds a new driver of the PCK-600 unit in the A523 SoC.

Patch 4 aligns Kconfig dependencies and default for SUN20I_PPU with the
new PCK-600 driver.

Patch 5 adds device nodes for both of these controllers.


Please have a look. The power controllers are critical for enabling more
peripherals, such as display output, camera input, video codecs, the NPU,
and a second DWMAC-compatible ethernet interface.


Thanks
ChenYu


Chen-Yu Tsai (5):
  dt-bindings: power: Add A523 PPU and PCK600 power controllers
  pmdomain: sunxi: sun20i-ppu: add A523 support
  pmdomain: sunxi: add driver for Allwinner A523's PCK-600 power
    controller
  pmdomain: sunxi: sun20i-ppu: change to tristate and enable for
    ARCH_SUNXI
  arm64: dts: allwinner: a523: Add power controller device nodes

 .../power/allwinner,sun20i-d1-ppu.yaml        |   4 +-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 ++
 drivers/pmdomain/sunxi/Kconfig                |  19 +-
 drivers/pmdomain/sunxi/Makefile               |   1 +
 drivers/pmdomain/sunxi/sun20i-ppu.c           |  17 ++
 drivers/pmdomain/sunxi/sun55i-pck600.c        | 234 ++++++++++++++++++
 .../power/allwinner,sun55i-a523-pck-600.h     |  15 ++
 .../power/allwinner,sun55i-a523-ppu.h         |  12 +
 8 files changed, 316 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pmdomain/sunxi/sun55i-pck600.c
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h

-- 
2.39.5


